<template>
    <div class="w-full card">
        <div class="card-body flex flex-col justify-between items-start">
            <div class="flex items-center justify-center bg-green-100 rounded mb-1">
                <p class="font-mono text-xs leading-loose text-center text-green-700 px-2">{{ practiceSession.skill }}</p>
            </div>
            <h1 class="text-lg font-semibold text-gray-800 leading-5 py-2">{{ practiceSession.title }}</h1>
            <div class="w-full bg-gray-300 h-1 mr-1 relative rounded mt-4">
                <div class="h-1 bg-green-700 rounded" :style="'width: '+ practiceSession.percentage_completed +'%'"></div>
            </div>
            <div class="w-full flex items-end justify-between mt-4">
                <h2 class="font-mono text-gray-600 text-sm">{{ practiceSession.percentage_completed }}% {{ __('Completed') }}</h2>
                <slot name="action"></slot>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'PracticeSessionCard',
        props: {
            practiceSession: Object
        }
    }
</script>
