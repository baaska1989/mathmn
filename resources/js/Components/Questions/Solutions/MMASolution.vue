<template>
    <div class="q-radio">
        <div class="q-options">
            <div v-for="(option, index) in options" :key="option" class="q-option">
                <input type="checkbox" :id="'q_'+question_id+'_option_'+index" v-model="answer" :value="index+1"
                       disabled="disabled">
                <label :class="labelClass(index)" :for="'q_'+question_id+'_option_'+index">
                    <span class="o-id squared"><strong>{{ index+1 }}</strong></span>
                    <span class="o-text" v-html="option"></span>
                </label>
            </div>
        </div>
        <div class="flex gap-2 border border-green-200 bg-green-50 items-center rounded p-4 mt-6">
            <svg class="w-6 h-6 text-green-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <h4 class="text-gray-600" v-html="answerText"></h4>
        </div>
    </div>
</template>
<script>
    export default {
        name: "MMASolution",
        props: {
            parentQid: [Number, String],
            parentOptions: Array,
            parentAnswer: [String, Array, Number],
            correctAnswer: [String, Array, Number],
            isCorrect: Boolean,
            status: String,
        },
        data() {
            return {
                question_id: this.parentQid,
                options: this.parentOptions,
                answer: this.parentAnswer,
            }
        },
        methods: {
            labelClass(index) {
                if(this.status === 'answered') {
                    if(this.answer.indexOf(index+1) !== -1) {
                        if(this.correctAnswer.indexOf(index+1) !== -1) {
                            return 'correct';
                        } else {
                            return 'wrong';
                        }
                    }
                    return '';
                }
                return '';
            }
        },
        computed: {
            answerText() {
                let answers = this.correctAnswer.sort();
                let str = answers.join(", ")
                return this.__('Correct answers are Options')+' '+str;
            }
        },
        created() {
            this.$nextTick(function() {
                window.renderMathInElement(this.$el);
            });
        }
    }
</script>
