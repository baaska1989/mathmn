<template>
    <div class="bg-white rounded pt-5 ltr:pl-6 rtl:pr-6 ltr:pr-12 rtl:pl-12 pb-4 flex items-start shadow">
        <div class="ltr:pl-3 rtl:pr-3 mt-1">
            <h3 class="mb-3 leading-4 text-gray-600 text-base">{{ __(title) }}</h3>
            <div class="flex items-center">
                <h2 class="text-green-600 text-2xl leading-normal font-bold">{{ count }}</h2>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'DashboardStat',
        props: {
            title: String,
            count: String|Number
        }
    }
</script>
