<template>
    <div class="q-radio">
        <div class="q-options">
            <div v-for="(option, index) in options" :key="option" class="q-option">
                <input type="radio" :id="question_id+'_option_'+index" v-model="answer" :value="index+1" disabled="disabled">
                <label :class="labelClass(index)" :for="question_id+'_option_'+index">
                    <span class="o-id"><strong>{{ index+1 }}</strong></span>
                    <span class="o-text" v-html="option"></span>
                </label>
            </div>
        </div>
        <div class="flex gap-2 border border-green-200 bg-green-50 items-center rounded p-4 mt-6">
            <svg class="w-6 h-6 text-green-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <h4 class=" text-gray-600" v-html="answerText"></h4>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'MSASolution',
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
                    if(this.isCorrect && this.answer === index+1) {
                        return 'correct';
                    }
                    if(!this.isCorrect && this.answer === index+1) {
                        return 'wrong';
                    }
                }
                return '';
            }
        },
        computed: {
            answerText() {
                return this.__('Correct answer is Option')+' '+this.correctAnswer
            }
        },
        created() {
            this.$nextTick(function() {
                window.renderMathInElement(this.$el);
            });
        }
    }
</script>
