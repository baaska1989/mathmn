<template>
    <div class="overflow-y-auto h-screen px-2">
        <div class="bg-gray-100 py-4 lg:py-4 rounded">
            <div class="container px-6 mx-auto flex ltr:flex-row rtl:flex-row-reverse">
                <div>
                    <h4 class="text-base font-semibold leading-tight text-gray-800">
                        {{ title }}
                    </h4>
                </div>
            </div>
        </div>
        <div v-if="loading" class="my-6 w-11/12 mx-auto xl:w-full xl:mx-0">
            <form-input-shimmer></form-input-shimmer>
            <form-input-shimmer></form-input-shimmer>
            <form-input-shimmer></form-input-shimmer>
            <form-switch-shimmer></form-switch-shimmer>
        </div>
        <form v-else class="my-6 w-11/12 mx-auto xl:w-full xl:mx-0" @submit.prevent="submitForm">
            <!-- User Group Name -->
            <div class="w-full flex flex-col mb-6">
                <label for="name" class="pb-2 font-semibold text-gray-800">{{ __('User Group') }} {{ __('Name') }}<span class="ml-1 text-red-400">*</span></label>
                <InputText type="text" id="name" v-model="form.name" :placeholder="__('Name')" aria-describedby="name-help"
                           :class="[errors.name ? 'p-invalid' : '']" />
                <small id="name-help" v-if="errors.name" class="p-invalid">{{ errors.name }}</small>
            </div>

            <!-- Description -->
            <div class="w-full flex flex-col mb-6">
                <label for="name" class="pb-2 font-semibold text-gray-800">{{ __('Description') }} (Max. 1000 Characters)</label>
                <ckeditor id="description" :config="editorConfig" :editor-url="editorUrl" v-model="form.description"
                          :class="[$page.props.rtl ? 'cke_rtl' : 'cke_ltr', errors.description ? 'p-invalid' : '']"></ckeditor>
                <small id="description-help" v-if="errors.description" class="p-invalid">{{ errors.description }}</small>
            </div>

            <!-- Is Active Switch -->
            <div class="w-full">
                <div class="flex justify-between items-center mb-8">
                    <div class="w-9/12">
                        <label for="is_active" class="font-semibold text-gray-800 pb-1" v-html="form.is_active ? __('Active') : __('In-active')"></label>
                        <p class="text-gray-500">{{ __('Active') }} ({{ __('Shown Everywhere') }}). {{ __('In-active') }} ({{ __('Hidden Everywhere') }}).</p>
                    </div>
                    <div class="cursor-pointer rounded-full relative shadow-sm">
                        <InputSwitch id="is_active" v-model="form.is_active" />
                    </div>
                </div>

                <!-- Is Private Switch -->
                <div class="flex justify-between items-center mb-8">
                    <div class="w-9/12">
                        <label for="is_private" class="font-semibold text-gray-800 pb-1" v-html="form.is_private ? __('Private Group') : __('Public Group')"></label>
                        <p class="text-gray-500">{{ __('Private Group') }} ({{ __('Only admin can add users') }}). {{ __('Public Group') }} ({{ __('Anyone can join') }})</p>
                    </div>
                    <div class="cursor-pointer rounded-full relative shadow-sm">
                        <InputSwitch id="is_private" v-model="form.is_private" />
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="w-full flex">
                <Button type="submit" :label="editFlag ? __('Update') : __('Create')" />
            </div>
        </form>
    </div>
</template>
<script>
    import InputText from 'primevue/inputtext';
    import Button from 'primevue/button';
    import InputSwitch from 'primevue/inputswitch';
    import CKEditor from 'ckeditor4-vue'
    import TextEditor from "@/Components/TextEditor";
    import FormInputShimmer from "@/Components/Shimmers/FormInputShimmer";
    import FormSwitchShimmer from "@/Components/Shimmers/FormSwitchShimmer";
    export default {
        name: 'UserGroupForm',
        components: {
            ckeditor: CKEditor.component,
            InputText,
            Button,
            InputSwitch,
            TextEditor,
            FormInputShimmer,
            FormSwitchShimmer
        },
        props: {
            editFlag: Boolean,
            userGroupId: Number,
            formErrors: Object,
            title: ''
        },
        data() {
            return {
                errors: {},
                editorUrl: window.CKEditorURL,
                editorConfig: {
                    contentsLangDirection: this.$page.props.rtl ? 'rtl' : 'ltr',
                },
                form: {
                    name: '',
                    description: '',
                    is_private: false,
                    is_active: true,
                },
                formValidated: false,
                loading: false,
            }
        },
        watch: {
            formErrors(val) {
                this.errors = val;
            },
        },
        methods: {
            submitForm() {
                this.editFlag ? this.update() : this.create();
            },
            create() {
                this.formValidated = true;
                this.$inertia.post(route('user-groups.store'), this.form, {
                    onSuccess: () => {
                        if (Object.keys(this.errors).length === 0) {
                            this.$emit('close', true);
                        }
                    },
                });
            },
            update() {
                this.formValidated = true;
                this.$inertia.patch(route('user-groups.update', { id: this.userGroupId }), this.form, {
                    onSuccess: () => {
                        if (Object.keys(this.errors).length === 0) {
                            this.$emit('close', true);
                        }
                    },
                });
            },
            fetch() {
                if(this.editFlag) {
                    let _this = this;
                    _this.loading = true;
                    axios.get(route('user-groups.edit', { id: this.userGroupId }))
                        .then(function (response) {
                            let data = response.data;
                            _this.form.name = data.name;
                            _this.form.description = data.description;
                            _this.form.is_private = data.is_private;
                            _this.form.is_active = data.is_active;
                        })
                        .catch(function (error) {
                            _this.loading = false;
                        })
                        .then(function () {
                            _this.loading = false;
                        });
                }
            }
        },
        mounted() {
            if(this.editFlag === true) {
                this.fetch();
            }
        }
    }
</script>
