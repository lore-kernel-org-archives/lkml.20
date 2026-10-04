Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8953A380E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122143; cv=none; b=TTVrbmuiEPmvIg+N0WhQWFjwVOopmj1IDdQ1qmBDnKsb3v7LBkH+2CT6rwzMtggXkpRbR8/j5+/icKTTi0L+fGBoJ2Nv8LozRpO+J4P0637RQBPTbn4mOxNI46Nm0BianUaV9gD6GgtZSEV8rurjZYIbDhl/X7f88mwrNmkwSZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122143; c=relaxed/simple;
	bh=8PVZGW4hlZFFimqcLFY9zFxjbYd/8Z+0S5TxqpQ1NUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRprn1Kk1iX1nFqLT0polezMx1kPSPllwtrJJx8yzsB5TIPvRxyrTgjBAMWK2WzV85Z+G+Nm80z31LsIdZRkJ0loW5/vbpzsUrSDaK4CBwVXZ5ZYU3EmDGP6PXXweJivl49zu7MT04cYK1g2oG9TOLqfT6yuazhduK3I3Q9POAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He5WOmT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkVLde/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He5WOmT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkVLde/W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694BORKS2203078
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 13:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=; b=He5WOmT2Pt/TnK7Q
	uMbWKDihEcLm77n2XR/ri2+uLSJc+ECngldGo1nytdO33piAYoxfq5VrzjhemLgj
	1OqBMrsKDCT8bA3kIYJRQouo9Jxj8KnnEUBVsC0I4/bNmE/m8xLBuBqkW7XGP9tA
	YgmyOlY9ISzKFk3u2iCYBhavffTnCmTPLbeE0P9eM2/KDkAxbxwhbe+jfFa202we
	5nGT20vIxuQToV6Btuzy1o1W6jGIMy7D5gQpGyo3DSmJSF0RCIfd8M4NgXuYP9Ns
	NaTIWLhbNXcYE59PG8dihBMKlqoKaqquWL+k/gCjnYvwsMB6F4GFOb1IakJUOuvY
	TLY7Kw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08k0m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:55:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso559918a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791122139; x=1791726939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=;
        b=IkVLde/WkA9jYwiX3hdNNAh122pLZllGx2lm9GD4XExcSskyW5Fi25t1shkaPI6WY3
         Wap+4I4cRC91aQqdYG26MiBZfeIcbD92gQ5cAZ5ff3gxdjEkCXh3scN4FbgUkDdhoFKe
         ftUzMR5+BPshhNOoI27f39LMOigqv+eyrEyz4QoOTs+eQuvU1l9YmMXbETqmE0B7ZbCA
         17fGiDXkxu6YBG0+VGeoMRKJg5V43gKJqV2iZ059TDwPOmkhJU+6SIw9mO03ir0/kwg8
         UEKMZxzb79Ws0jmywTyvaIEx5dUbm4iecUOp5YXF8b4akd/p794mXDzfBHVvV1NjIhCp
         D6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122139; x=1791726939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=;
        b=Du7vTurODWbt3gMyq15SEG6fFjamu9uaSABz6qfY2HRAprsqkkPzFDM/JCv1DW3Itg
         DQdDFk8LejB1DrjE8Dw2GJkv0f3CBI2F3F1s0Qh1p5HZX7MF5WG7DIkVdKTTRNvPvPig
         vg1DU7TdjPkNMV2UB0XMDvDmKu9xJBJmRkjMuSw5xduOuuiSHxQBLeGI+FLt88DSmVUf
         BrVM2nR9twvDV6l5f6vRHbyuzwpNvfkXl2zKJ/2FsbVFYwaPgTigzZF0VJzanvyw36PR
         4OuAU4A7XdL8aOeL1+NvHUCWoIuRv9fSh5zZI00liANifTMU6ZLzG85gw7jDcNhs6cYZ
         TnBA==
X-Forwarded-Encrypted: i=1; AKwUvBwwdftDond1JQjncUS8ZhqY9ur8F2GU2saQ7AiZh8D0BLeKmXxkzOHWIXXhcxV2OglNLv/Dkk6Ci6DbSPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjVAzHlrXfVT2oQKoxKbIPuzR5Z1nTRCbl/E9ca8EkW22OIhbO
	Q6Fe/PNG+M0MRpd9Y2C/impkdW71nUSgSVQ1vg+LLZSs/9rtg4ROSFzocoIBJaRUn3jIYiPK+VZ
	JlZ3s/D7kgiLNiGSdYTuP3W9mhVMNT4D1nxUuvUB3LcRvGHpJZjyelKHHDvyEj2PUz0E=
X-Gm-Gg: AYBFou0wQKgJ5bzfiTC5LHUE4DZqKJ8XRAdbfUZaTbVSYEuJzQpE9airmkDdf7FhRhw
	SIKYevCFb0iT8nOJlmP8ufukQ6qKYyhSxU84QJY8B6bbeS+HDMxwXhEn2TUXW14qJyzBJlReHj4
	cNEjxhqoQzNhwsKP8r1VyijY9intjFE1qRfm9gSrhHb3hQ/Qn2iHS4tb8TGfBmQT40BUS0vJKKe
	a+TgOeysv2bUzq8AIbCKGfzR1WTrEG+22I4Uo/ezpL3khSgC5GuXKDUsD0o0Lw/9LeVBvqA0Q3T
	fuhZv/ptNeWh3ycFkfudF/xP28scMZiNlVkuN6/iRY8Fre95j7c6LpXLKohjMYdsFC4fuzRUUXw
	vdwR3EaN4fnylgPgjMJv5bd4H0MwIcod0wiH4wJ7jtMh2n14BnEOnNXkjAklhWJKBk8rB7pXy
X-Received: by 2002:a17:90b:2782:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a6ce85582fmr6027724a91.55.1791122138887;
        Sun, 04 Oct 2026 06:55:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2782:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a6ce85582fmr6027688a91.55.1791122138284;
        Sun, 04 Oct 2026 06:55:38 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm5274335a91.0.2026.10.04.06.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 06:55:36 -0700 (PDT)
Message-ID: <c6948769-1050-4211-b93c-b72f51c32dd4@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 21:55:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: CPPC: Resolve frequencies to performance
 levels
To: Christian Loehle <christian.loehle@arm.com>, rafael@kernel.org
Cc: zhenglifeng1@huawei.com, viresh.kumar@linaro.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
        "Gautham R . Shenoy"
 <gautham.shenoy@amd.com>,
        Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
        Shubhang Kaushik <sh@gentwo.org>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Peter Zijlstra
 <peterz@infradead.org>, jonathanh@nvidia.com,
        zhanjie9@hisilicon.com, Vincent Guittot <vincent.guittot@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, zhongqiu.han@oss.qualcomm.com
References: <20260929102957.2591657-1-christian.loehle@arm.com>
 <20260929102957.2591657-3-christian.loehle@arm.com>
 <0a4a28b8-0b26-41df-bd55-c809177a9909@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <0a4a28b8-0b26-41df-bd55-c809177a9909@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GTxylP-8JhXgOcDS_enHaw3QysUPhkg3
X-Proofpoint-GUID: GTxylP-8JhXgOcDS_enHaw3QysUPhkg3
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac25adb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=D87R-bVDKfKZu3bz7LUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA1NSBTYWx0ZWRfX5cqHdlCsmGJ+
 nmpxf3oaElKYoPPYN9adY92QTN00/taVn8vbS2RIyLIM1X+l+/ihseNPPs+I9u+G/hPuJHeZ7+Q
 oVTKg12ElZ3sKOcHbr/lPHMWEzpwZw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA1NSBTYWx0ZWRfXzdpN/t+GOFnA
 6SxPA1ChbNb/aaqERM0zPTjMQOc0ez+9NP8Ijx3eeHDHjVo1PPzvSk4DVkLTogIYSCEreGv7Ou/
 Av+Ndy/U5cmbao+D2rHwjRegOpc9/3/Z4IlamuO7LDS1tDUxvjiEgmHV9Rjy+vRnMW2Nlf9Lo4Z
 Bs8rsSBNyhy6sh8F4h+EatSSgAIEsIunLBhPIFP3mj1J0qH85NkcXQ9ogLX7tH8tcUskwtY6Hd+
 hJODf9hLGkbfvQD8m2JGa/bRxsVmL36pCd7z0SQtz/P2ulbbLVYUpyrX3XO1udFe3++YQMIZDvC
 2geSE0RiDFVCjsH4VdgxzaB1xMPxYb2Ytg6LroBaVNy4YcXRUqkxCWvS13SzffiT0YLf3rqRviw
 nenbDzBEZdkKHd3867BVsMdIQmIZaUIxKCtLzUNJrF8OJatCLwA0599HSsKx7tVBCqGSZNNAtMl
 Pwu7FvK+cQtC/elNjSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040055

On 10/2/2026 8:29 PM, Zhongqiu Han wrote:
> Hi Christian,
> 
> 
> On 9/29/2026 6:29 PM, Christian Loehle wrote:
>> Different kHz requests can select the same CPPC performance level.
>> Implement ->resolve_freq() so governors such as schedutil can skip
>> redundant writes.
>>
>> Precompute the affine conversion and invert its integer rounding 
>> directly.
>> Share bounded conversions with ->target() and ->fast_switch(), 
>> choosing the
>> first performance level when several share a kHz value. Recompute limits
>> from each policy snapshot to avoid caching sysfs-shared mutable controls.
>>
>> Cap intervals at or below nominal kHz at Nominal Performance, excluding
>> boosted levels that alias it. Unchanged frequency limits then imply
>> unchanged performance limits across boost toggles.
>>
>> After clamping to CPU limits, snap the limits to supported frequencies.
>> If none lies in the interval, collapse both limits to the highest 
>> supported
>> frequency not above its maximum, as frequency-table verification does.
>>
>> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>> ---
>>   drivers/cpufreq/cppc_cpufreq.c | 257 ++++++++++++++++++++++++++++++---
>>   1 file changed, 239 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/ 
>> cppc_cpufreq.c
>> index 4ea444ff889e..fa85efb9f701 100644
>> --- a/drivers/cpufreq/cppc_cpufreq.c
>> +++ b/drivers/cpufreq/cppc_cpufreq.c
>> @@ -18,8 +18,10 @@
>>   #include <linux/cpufreq.h>
>>   #include <linux/irq_work.h>
>>   #include <linux/kthread.h>
>> +#include <linux/math64.h>
>>   #include <linux/mutex.h>
>>   #include <linux/time.h>
>> +#include <linux/units.h>
>>   #include <linux/vmalloc.h>
>>   #include <uapi/linux/sched/types.h>
>> @@ -29,6 +31,24 @@
>>   static struct cpufreq_driver cppc_cpufreq_driver;
>> +struct cppc_perf_freq_map {
>> +    s64 offset;
>> +    u64 multiplier;
>> +    u32 divisor;
>> +};
>> +
>> +struct cppc_cpufreq_data {
>> +    struct cppc_cpudata cpu_data;
>> +    struct cppc_perf_freq_map map;
>> +    unsigned int nominal_khz;
>> +};
>> +
>> +static struct cppc_cpufreq_data *
>> +cppc_cpufreq_data(struct cppc_cpudata *cpu_data)
>> +{
>> +    return container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
>> +}
>> +
>>   #ifdef CONFIG_ACPI_CPPC_CPUFREQ_FIE
>>   static enum {
>>       FIE_UNSET = -1,
>> @@ -302,11 +322,159 @@ static inline void cppc_freq_invariance_exit(void)
>>   }
>>   #endif /* CONFIG_ACPI_CPPC_CPUFREQ_FIE */
>> +/* Precompute the affine mapping used by cppc_perf_to_khz(). */
>> +static void cppc_cpufreq_init_perf_map(struct cppc_perf_caps *caps,
>> +                       struct cppc_perf_freq_map *map)
>> +{
>> +    if (caps->lowest_freq && caps->nominal_freq) {
>> +        if (caps->lowest_freq == caps->nominal_freq) {
>> +            map->multiplier = (u64)caps->nominal_freq * KHZ_PER_MHZ;
> 
> This duplicates the perf<->kHz conversion, but cppc_perf_to_khz() rounds
> its offset at MHz granularity before scaling to kHz while the new map
> scales first, so the two can differ by up to 999 kHz. In current patch
> func cppc_cpufreq_perf_limits() the max_freq operand still derives from
> cpuinfo.max_freq (old conversion) while data->nominal_khz uses the new
> one -- with boost off, could the max_freq <= data->nominal_khz test
> still be relied upon? If it goes false, will policy_max_perf become
> highest_perf and max_perf seems to end up above nominal_perf?

Please ignore this comment. I misread cppc_perf_to_khz(). Sorry about
that.

> 
>> +            map->divisor = caps->nominal_perf;
>> +            map->offset = 0;
>> +        } else {
>> +            map->multiplier = (u64)(caps->nominal_freq -
>> +                       caps->lowest_freq) * KHZ_PER_MHZ;
>> +            map->divisor = caps->nominal_perf - caps->lowest_perf;
>> +            map->offset = (s64)caps->nominal_freq * KHZ_PER_MHZ -
>> +                div64_u64(caps->nominal_perf * map->multiplier,
>> +                      map->divisor);
>> +        }
>> +    } else {
>> +        map->multiplier = cppc_get_dmi_max_khz();
>> +        map->divisor = caps->highest_perf;
>> +        map->offset = 0;
>> +    }
>> +}
>> +
>> +static unsigned int
>> +cppc_cpufreq_perf_to_khz(const struct cppc_perf_freq_map *map, u32 perf)
>> +{
>> +    s64 freq = map->offset + div64_u64(perf * map->multiplier,
>> +                        map->divisor);
>> +
>> +    return freq > 0 ? freq : 0;
>> +}
>> +
>> +/*
>> + * Invert integer-kHz rounding: L finds the first level at or above the
>> + * target frequency, H the last at or below it, within the supplied 
>> bounds.
>> + */
>> +static u32 cppc_cpufreq_perf_for_freq(const struct cppc_perf_freq_map 
>> *map,
>> +                      unsigned int target_freq,
>> +                      u32 min_perf, u32 max_perf,
>> +                      unsigned int relation)
>> +{
>> +    s64 scaled_freq = (s64)target_freq - map->offset;
>> +    u64 perf;
>> +
>> +    switch (relation) {
>> +    case CPUFREQ_RELATION_L:
>> +        if (!target_freq || scaled_freq <= 0)
>> +            perf = 0;
>> +        else
>> +            perf = mul_u64_u64_div_u64_roundup(scaled_freq,
>> +                               map->divisor,
>> +                               map->multiplier);
>> +        break;
>> +
>> +    case CPUFREQ_RELATION_H:
>> +        if (scaled_freq < 0) {
>> +            perf = 0;
>> +        } else {
>> +            perf = mul_u64_u64_div_u64_roundup(scaled_freq + 1,
>> +                               map->divisor,
>> +                               map->multiplier);
>> +            perf--;
>> +        }
>> +        break;
>> +
>> +    default:
>> +        WARN_ON_ONCE(1);
>> +        return min_perf;
>> +    }
>> +
>> +    return clamp_t(u64, perf, min_perf, max_perf);
>> +}
>> +
>> +static void cppc_cpufreq_perf_limits(struct cppc_perf_caps *caps,
>> +                     struct cppc_cpufreq_data *data,
>> +                     unsigned int min_freq,
>> +                     unsigned int max_freq,
>> +                     u32 *min_perf, u32 *max_perf)
>> +{
>> +    u32 policy_max_perf;
>> +
>> +    /* Do not include boosted levels that alias the nominal 
>> frequency. */
>> +    policy_max_perf = max_freq <= data->nominal_khz ?
>> +              caps->nominal_perf : caps->highest_perf;
>> +    *min_perf = cppc_cpufreq_perf_for_freq(&data->map, min_freq,
>> +                           caps->lowest_perf,
>> +                           policy_max_perf,
>> +                           CPUFREQ_RELATION_L);
>> +    *max_perf = cppc_cpufreq_perf_for_freq(&data->map, max_freq,
>> +                           caps->lowest_perf,
>> +                           policy_max_perf,
>> +                           CPUFREQ_RELATION_H);
>> +}
>> +
>> +static unsigned int
>> +cppc_cpufreq_resolve_freq(struct cpufreq_policy *policy,
>> +              unsigned int target_freq,
>> +              unsigned int min_freq,
>> +              unsigned int max_freq,
>> +              unsigned int relation)
>> +{
>> +    struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    struct cppc_perf_caps *caps = &cpu_data->perf_caps;
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>> +    const struct cppc_perf_freq_map *map = &data->map;
>> +    u32 min_perf, max_perf, perf;
>> +
>> +    cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
>> +                 &min_perf, &max_perf);
>> +    if (WARN_ON_ONCE(min_perf > max_perf))
>> +        return cppc_cpufreq_perf_to_khz(map, max_perf);
>> +
>> +    switch (relation) {
>> +    case CPUFREQ_RELATION_L:
>> +    case CPUFREQ_RELATION_H:
>> +        perf = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                          min_perf, max_perf, relation);
>> +        break;
>> +    case CPUFREQ_RELATION_C: {
>> +        u32 lower = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                            min_perf, max_perf,
>> +                            CPUFREQ_RELATION_H);
>> +        u32 upper = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                            min_perf, max_perf,
>> +                            CPUFREQ_RELATION_L);
>> +        unsigned int lower_freq = cppc_cpufreq_perf_to_khz(map, lower);
>> +        unsigned int upper_freq = cppc_cpufreq_perf_to_khz(map, upper);
>> +
>> +        if (lower_freq >= target_freq)
>> +            perf = lower;
>> +        else if (upper_freq <= target_freq)
>> +            perf = upper;
>> +        else if (target_freq - lower_freq < upper_freq - target_freq)
>> +            perf = lower;
>> +        else
>> +            perf = upper;
>> +        break;
>> +    }
>> +    default:
>> +        WARN_ON_ONCE(1);
>> +        return target_freq;
>> +    }
>> +
>> +    return cppc_cpufreq_perf_to_khz(map, perf);
>> +}
>> +
>>   static void cppc_cpufreq_get_perf_limits(struct cppc_cpudata *cpu_data,
>>                        struct cpufreq_policy *policy,
>>                        u32 *min_perf, u32 *max_perf)
>>   {
>>       struct cppc_perf_caps *caps = &cpu_data->perf_caps;
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>>       unsigned int min_freq, max_freq;
>>       u32 min, max;
>> @@ -315,11 +483,11 @@ static void cppc_cpufreq_get_perf_limits(struct 
>> cppc_cpudata *cpu_data,
>>       if (unlikely(min_freq > max_freq))
>>           min_freq = max_freq;
>> -    min = cppc_khz_to_perf(caps, min_freq);
>> -    max = cppc_khz_to_perf(caps, max_freq);
>> +    cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
>> +                 &min, &max);
>> -    *min_perf = clamp_t(u32, min, caps->lowest_perf, caps- 
>> >highest_perf);
>> -    *max_perf = clamp_t(u32, max, caps->lowest_perf, caps- 
>> >highest_perf);
>> +    *min_perf = min(min, max);
>> +    *max_perf = max;
>>   }
>>   static void cppc_cpufreq_update_perf_limits(struct cppc_cpudata 
>> *cpu_data,
>> @@ -330,6 +498,26 @@ static void 
>> cppc_cpufreq_update_perf_limits(struct cppc_cpudata *cpu_data,
>>                        &cpu_data->perf_ctrls.max_perf);
>>   }
>> +static unsigned int
>> +cppc_cpufreq_update_perf_ctrls(struct cppc_cpudata *cpu_data,
>> +                   struct cpufreq_policy *policy,
>> +                   unsigned int target_freq)
>> +{
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>> +    u32 min_perf, max_perf, desired_perf;
>> +
>> +    cppc_cpufreq_get_perf_limits(cpu_data, policy, &min_perf, 
>> &max_perf);
>> +    /* Use the first level when several share the same integer-kHz 
>> value. */
>> +    desired_perf = cppc_cpufreq_perf_for_freq(&data->map, target_freq,
>> +                          min_perf, max_perf,
>> +                          CPUFREQ_RELATION_L);
>> +    cpu_data->perf_ctrls.min_perf = min_perf;
>> +    cpu_data->perf_ctrls.max_perf = max_perf;
>> +    cpu_data->perf_ctrls.desired_perf = desired_perf;
>> +
>> +    return cppc_cpufreq_perf_to_khz(&data->map, desired_perf);
>> +}
>> +
>>   static int cppc_cpufreq_set_target(struct cpufreq_policy *policy,
>>                      unsigned int target_freq,
>>                      unsigned int relation)
>> @@ -339,12 +527,9 @@ static int cppc_cpufreq_set_target(struct 
>> cpufreq_policy *policy,
>>       struct cpufreq_freqs freqs;
>>       int ret = 0;
>> -    cpu_data->perf_ctrls.desired_perf =
>> -            cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
>> -    cppc_cpufreq_update_perf_limits(cpu_data, policy);
>> -
>>       freqs.old = policy->cur;
>> -    freqs.new = target_freq;
>> +    freqs.new = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
>> +                           target_freq);
>>       cpufreq_freq_transition_begin(policy, &freqs);
>>       ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
>> @@ -361,13 +546,12 @@ static unsigned int 
>> cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>>                             unsigned int target_freq)
>>   {
>>       struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    unsigned int resolved_freq;
>>       unsigned int cpu = policy->cpu;
>> -    u32 desired_perf;
>>       int ret;
>> -    desired_perf = cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
>> -    cpu_data->perf_ctrls.desired_perf = desired_perf;
>> -    cppc_cpufreq_update_perf_limits(cpu_data, policy);
>> +    resolved_freq = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
>> +                               target_freq);
>>       ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
>>       if (ret) {
>> @@ -376,12 +560,39 @@ static unsigned int 
>> cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>>           return 0;
>>       }
>> -    return target_freq;
>> +    return resolved_freq;
>>   }
>>   static int cppc_verify_policy(struct cpufreq_policy_data *policy)
>>   {
>> +    struct cpufreq_policy *cur_policy;
>> +    struct cppc_cpudata *cpu_data;
>> +    struct cppc_cpufreq_data *data;
>> +    struct cppc_perf_caps *caps;
>> +    unsigned int min_freq, max_freq;
>> +    u32 min_perf, max_perf;
>> +
>>       cpufreq_verify_within_cpu_limits(policy);
>> +
>> +    cur_policy = cpufreq_cpu_get_raw(policy->cpu);
>> +    if (WARN_ON_ONCE(!cur_policy || !cur_policy->driver_data))
>> +        return -ENODEV;
>> +
>> +    cpu_data = cur_policy->driver_data;
>> +    data = cppc_cpufreq_data(cpu_data);
>> +    caps = &cpu_data->perf_caps;
>> +    cppc_cpufreq_perf_limits(caps, data, policy->min, policy->max,
>> +                 &min_perf, &max_perf);
>> +    min_freq = cppc_cpufreq_perf_to_khz(&data->map, min_perf);
>> +    max_freq = cppc_cpufreq_perf_to_khz(&data->map, max_perf);
>> +
>> +    /* Favor the maximum if no supported frequency lies in the 
>> interval. */
>> +    if (min_perf > max_perf || min_freq > policy->max ||
>> +        max_freq < policy->min)
>> +        min_freq = max_freq;
>> +
>> +    policy->min = min_freq;
>> +    policy->max = max_freq;
>>       return 0;
>>   }
>> @@ -618,12 +829,14 @@ static void populate_efficiency_class(void)
>>   static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   {
>> +    struct cppc_cpufreq_data *data;
>>       struct cppc_cpudata *cpu_data;
>>       int ret;
>> -    cpu_data = kzalloc_obj(struct cppc_cpudata);
>> -    if (!cpu_data)
>> +    data = kzalloc_obj(struct cppc_cpufreq_data);
>> +    if (!data)
>>           goto out;
>> +    cpu_data = &data->cpu_data;
>>       if (!zalloc_cpumask_var(&cpu_data->shared_cpu_map, GFP_KERNEL))
>>           goto free_cpu;
>> @@ -640,6 +853,10 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>           goto free_mask;
>>       }
>> +    cppc_cpufreq_init_perf_map(&cpu_data->perf_caps, &data->map);
>> +    data->nominal_khz = cppc_cpufreq_perf_to_khz(&data->map,
>> +                             cpu_data->perf_caps.nominal_perf);
>> +
>>       ret = cppc_get_perf(cpu, &cpu_data->perf_ctrls);
>>       if (ret) {
>>           pr_debug("Err reading CPU%d perf ctrls: ret:%d\n", cpu, ret);
>> @@ -651,7 +868,7 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   free_mask:
>>       free_cpumask_var(cpu_data->shared_cpu_map);
>>   free_cpu:
>> -    kfree(cpu_data);
>> +    kfree(data);
>>   out:
>>       return NULL;
>>   }
>> @@ -659,9 +876,12 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   static void cppc_cpufreq_put_cpu_data(struct cpufreq_policy *policy)
>>   {
>>       struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    struct cppc_cpufreq_data *data;
>> +
>> +    data = container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
>>       free_cpumask_var(cpu_data->shared_cpu_map);
>> -    kfree(cpu_data);
>> +    kfree(data);
>>       policy->driver_data = NULL;
>>   }
>> @@ -1056,6 +1276,7 @@ static struct cpufreq_driver cppc_cpufreq_driver 
>> = {
>>       .flags = CPUFREQ_CONST_LOOPS | CPUFREQ_NEED_UPDATE_LIMITS,
>>       .verify = cppc_verify_policy,
>>       .target = cppc_cpufreq_set_target,
>> +    .resolve_freq = cppc_cpufreq_resolve_freq,
>>       .get = cppc_cpufreq_get_rate,
>>       .fast_switch = cppc_cpufreq_fast_switch,
>>       .init = cppc_cpufreq_cpu_init,
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
