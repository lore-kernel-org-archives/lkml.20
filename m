Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690215;
	b=GTRuVWJl68xg+h01ZHAEEXchqeP+q9KbwvWJ3D10flmVYtBTj+KEj2NsKUN7IS2Z1Z4r
	 CR/QAOOCrRVzMcrYmJ22nTKLRZ5GEAg/4u1x3SAszQF3QpG1l+k10IoBnE2/ovAsdZ9EW
	 wGi1MOI5cGiV/OnjgYXkJBtxCbT7CCttGTCp5rYwCig1aE07BeLw067NsQWFLCVEs2Op9
	 FRQayfl2ryF4igyY5koNKEUg2sKuM3ZYWOL21zY0Jgs7ojW14uj+eyJs3HqA3P0hIOUE5
	 nW6ox90opxXzKgQJDjaOjwEyNZ2rXmsd17cH7Xhu1Q+eIKPzi8NFi1RNPyHAT+yixHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Taq3TN1TspoSEDGf5Bcuf48IU/BFZ1ywMHPrwJaGDAk=;
	b=sPVpR7eYLARPIpXTr5bNUW17O05+zNpQYap06dai1zC3RZ8RBXNjLsjTI9Vj8SqiN+BG
	 YzqBHWntflPByUHbNtghwBwg8GUJA7sA2DpeG0G/roxL3d4Sac/pgPXGJ+vGbKaNX/pFY
	 micecbKtb4TICBBsvYfCU+4pXCj657WkxpTnPBJeVFwkcIpoXpGsHjRK7YRaSfYCkugfe
	 3hDcMFgPUyJoR+WiHbgngvjWHlUD43xrjvwmFaPBTsxs/2KkfUDQkWTebvSg/RIIJle9i
	 fsBAUzbBFGOaI+eo6y1aeii0flwFxU1p+qMS8WSXheDRcxi45QdcfZRIxPJ2RSTsIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1iW3E7G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuLwt+uG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45187606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45187606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1iW3E7G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuLwt+uG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eUdI1431440
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 07:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Taq3TN1TspoSEDGf5Bcuf48IU/BFZ1ywMHPrwJaGDAk=; b=g1iW3E7GKjPr3eNt
	LN+tNDXulBukG8EKB4ZVWnZ0x506HBNa3ApWtTRfWjiRaSchW+k9mzWcGoVBnUcW
	TC2XVnRh3MoB4NUy7JS1m+B65Ha1YMZPIQS5e+ZWGHvTcvfeApIDM90b74TAg55V
	0nBI8VvwLPnY2ppBFQxkmJ1QsVAgu7slLZfwpn9ReA+R0RVq84O+HBA15g83AWfM
	Na41+/UI41q6wZqf4Qzszhubh4n/ulPxeGT0SdLwhXF603N/t0eflHPYKWZgwzNz
	QZpS8AKTlR0liOHhCPi8mNvQIAhssXOVFjfP4uPuogO4x7K4dNc47fFqwGT0KQXY
	kRXcBQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0872ff3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:16:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so6021004eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690212; x=1794295012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Taq3TN1TspoSEDGf5Bcuf48IU/BFZ1ywMHPrwJaGDAk=;
        b=iuLwt+uGf0wPQQov4LyIssAD7B2yz6SOdDbUDHgobxsnYirOyHEdIRvijSPx6PkStf
         GJcDfpG5kByBl/cKSyXD4FaxmCAOwpnrvhqgsw8rSdSnKTmGLHBZEBdPYAgcO3nofh2M
         ZBK+/j0X463D8NNsuC/yFylV/KtQqJfgqZj+DMypz5VsbWOujSewJA/vUOLBnbw+tB4s
         +4YZVQVXDgPI9SbomItS58xJqXHhjTO7iPbdPyLq3Wvv4KZ0NCkYuZNNua0NLCZ8t4Bc
         WuGccgG/9N5H14eBnTUZnw1M5Iv6EHyN4ofeLR8nYtPzSzn875bi6cT2EDN0BM79SUmE
         hpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690212; x=1794295012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Taq3TN1TspoSEDGf5Bcuf48IU/BFZ1ywMHPrwJaGDAk=;
        b=gj58dZSx5V0wFBIfejm+wO+SAiYTPbclwjifREbWbICUEmBt48HostmE9NJ1bjfSs9
         UOPMR6Yp5LXEq53V9bbW7M9zbBdinImBvcFdkbHwF9s7/R/r07FayOd7YiLgIes290nT
         CsE91627mh9MV1U/GE/Tdz2hcVdA8GmtxDOCcuI+iHmRuFQHIaghlURdiT/kxGkBc0ua
         UgcQQjS+PBIqfoP+qMjzYyPjIxx9ZMwJcxbmNYk8mTmiXe8A+bPTlc3HHtTUx7L7zhQf
         jR8l+ADRarQq7icAQYjolRZft5f5zJVsqjXIiI4LG3NytymKR1oOYigF3VD22Y6hFzkP
         fJNg==
X-Forwarded-Encrypted: i=1; AKwUvBxeFb+YwtOtgUpoOPT8/zPolts79oW2J+Chwd7o9TKEE7VPbzBmugzXOjWR/36/cRgVSxsrlZTbWSj4KiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8DubFGLOWIJ5CVHjmSuzHsPNLhqNpzlfTsa3pWZLCtcjy5Uyw
	5qQazka5KFCLqKC9kD0zZPZMfQlz+bvbzY3G3XDW2tDQlUs19dDwo/pdB+Yrfwfna9owSiDlRvq
	bjnmPI0kvY4CKWJ1ZW61bWnkee+IYf/aW8OZqIlL4ayYaY+3k8N03A0dY68WdWgwJ9Z8=
X-Gm-Gg: AYBFou3TmFG3soXhLkiPYgNIoYz+YqZB5IgwsB02mpCoZZnh4mNQRcPJck9JQaU2rjE
	jdwXJTJ5llC//33tpg5vRqCSPMZSfE5aPZu1+e728THRVxrVi/II6zbmknkRoyjY/4d5u47wlZM
	KaEhHxOOdUcWAYVZHOaO7TpbvT2KpgyQRJKsEwxYTDUQtA7kSoEKiWTAYN0uQyN9TaPXSdSunT/
	b98MM2WJFJvuahW8f9ObAcK1wAMCQ3Rrm5HImSR4GplWOhGgoPVhOe2/sW/cKKr10UR5R/iJf0Q
	yZGBj4kSbQKyxWCz5NL8pCG9GQ6Iq17isYgd3Nq57D4tGELtlCXXF7Yx3/YYrOtNnqmJNpNB3X7
	KWAyS1/bagipoG5dB32CVpTUHaWAdefybQRbg7HGkAjDRmpah7fX0d3deVTz6mhc9bIK4j7Ka5Z
	7j6ONW9AaFVQ5YGSpmJ3PgKA==
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr21436006eec.1.1793690211761;
        Mon, 02 Nov 2026 23:16:51 -0800 (PST)
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr21435955eec.1.1793690210965;
        Mon, 02 Nov 2026 23:16:50 -0800 (PST)
Received: from [10.110.67.148] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm46180615eec.9.2026.11.02.23.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:16:50 -0800 (PST)
Message-ID: <738c61fa-0397-4faa-acae-e9b42f901d1d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:16:45 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PM: EM: Rank boost and non-boost frequencies separately
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Len Brown <lenb@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Pavel Machek <pavel@kernel.org>
References: <20261030-em-rank-boost-separately-v1-1-238a6b2bb888@oss.qualcomm.com>
 <3ed2a68b-d066-4a3a-b3ed-30a5ca00ae38@arm.com>
Content-Language: en-US
From: Guo Chen <guo.chen@oss.qualcomm.com>
In-Reply-To: <3ed2a68b-d066-4a3a-b3ed-30a5ca00ae38@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX77P6hFOSI092
 8kWfOalgas6gimX9m0uX8necTiuKRTjVi3qZDLafKCavCoxIGzY0fWnI79f6TN09ctJcDdA5rcB
 hl8zm6qF3CJuR2i9X0OibCGj/kXCQt4=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae98a65 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=mce2Jbv03V5EqRZ6POQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX2zfoWGACuE61
 8rOtNvlmZNJ5ZaftkJx1JuJP92LjS5/QtuGKUqcwhVKxSfjvk6mTx5ckRo9sLGzJZfMqHOAtii6
 6HuRFF0fICbCpEyXVvtNMP1jZWGq7YHV8qJXU75AsxGiPFZ0xuUSZkoPoIGM6EeQhHeQLRDi2NA
 DA+0KDjrAvmw0Qo6x2TcDDPneQ3O0HU+q1BQ36vO04Fosh/Ni+uYZZ0Dug5n942tELjhkhAd2rI
 l69NbWyNIz/HI5sBqwjlnZxHJNzOGSwO4IrWzaJuFnlX+1O4d5bAzxzOx+6tNI+p0f8jfWyr8az
 ZTaospHMJJouzzwHKOPVsdyWIQPBhXMxZ8nmXu9C4UvzjtlbDYSWFgCvOiQ5oDooKySPT7clPzb
 CTT+RdgdndJDeZwiFcQTA9KL2YLZs+5GLj7gYX4rNyIpy7cw6UzC9OEH5PxYbQcxS00w0NtbEgY
 cJxKXeDtct7Y9A8vUCg==
X-Proofpoint-ORIG-GUID: VDCzPhh8ye1mpKwzR9MEBvjqDTwA1tAe
X-Proofpoint-GUID: VDCzPhh8ye1mpKwzR9MEBvjqDTwA1tAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030028


On 11/2/2026 11:28 PM, Lukasz Luba wrote:
>
>
> On 10/30/26 08:10, Guo Chen wrote:
>> em_compute_costs() ranks all the frequencies of the table, boost ones
>> included. A non-boost frequency can be marked inefficient only because
>> a faster boost frequency has a lower or equal cost, e.g.
>>
>>    3.9 GHz  4.0 GHz (cost C)  4.1 GHz (boost, cost C)
>>
>> With boost disabled 4.1 GHz cannot be selected, but 4.0 GHz is still
>> skipped by governors rounding down to efficient frequencies (e.g.
>> ondemand with CPUFREQ_RELATION_HE), which land on 3.9 GHz instead of
>> the best selectable frequency. Several frequencies can be affected.
>>
>> Rank boost and non-boost frequencies separately in em_compute_costs(),
>> using the highest non-boost frequency of the CPUFreq table, returned by
>> the new helper cpufreq_table_max_nonboost_freq(), as the boundary.
>>
>> Fixes: c8ed99533dbc ("PM: EM: Mark inefficient states")
>> Signed-off-by: Guo Chen <guo.chen@oss.qualcomm.com>
>> ---
>>   include/linux/cpufreq.h     | 24 ++++++++++++++++++++++++
>>   kernel/power/energy_model.c | 15 +++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
>> index d3d0d9d02aa4..c93316141a11 100644
>> --- a/include/linux/cpufreq.h
>> +++ b/include/linux/cpufreq.h
>> @@ -1155,6 +1155,24 @@ cpufreq_table_set_inefficient(struct 
>> cpufreq_policy *policy,
>>       return -EINVAL;
>>   }
>>   +static inline unsigned int
>> +cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
>> +{
>> +    struct cpufreq_frequency_table *pos;
>> +    unsigned int max = 0;
>> +
>> +    if (!policy->freq_table)
>> +        return 0;
>> +
>> +    /* The table may be unsorted, scan all of it for the highest 
>> one. */
>> +    cpufreq_for_each_valid_entry(pos, policy->freq_table) {
>> +        if (!(pos->flags & CPUFREQ_BOOST_FREQ) && pos->frequency > max)
>> +            max = pos->frequency;
>> +    }
>> +
>> +    return max;
>> +}
>> +
>>   static inline int parse_perf_domain(int cpu, const char *list_name,
>>                       const char *cell_name,
>>                       struct of_phandle_args *args)
>> @@ -1219,6 +1237,12 @@ cpufreq_table_set_inefficient(struct 
>> cpufreq_policy *policy,
>>       return -EINVAL;
>>   }
>>   +static inline unsigned int
>> +cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
>> +{
>> +    return 0;
>> +}
>> +
>>   static inline int of_perf_domain_get_sharing_cpumask(int pcpu, 
>> const char *list_name,
>>                                const char *cell_name, struct cpumask 
>> *cpumask,
>>                                struct of_phandle_args *pargs)
>> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
>> index d19a65461ae8..253c53ca6a74 100644
>> --- a/kernel/power/energy_model.c
>> +++ b/kernel/power/energy_model.c
>> @@ -255,15 +255,30 @@ static int em_compute_costs(struct device *dev, 
>> struct em_perf_state *table,
>>                   unsigned long flags)
>>   {
>>       unsigned long prev_cost = ULONG_MAX;
>> +    struct cpufreq_policy *policy;
>> +    unsigned int max_nonboost = 0;
>> +    bool prev_boost = false;
>>       int i, ret;
>>         /* This is needed only for CPUs and EAS skip other devices */
>>       if (!_is_cpu_device(dev))
>>           return 0;
>>   +    policy = cpufreq_cpu_get(dev->id);
>> +    if (policy) {
>> +        max_nonboost = cpufreq_table_max_nonboost_freq(policy);
>> +        cpufreq_cpu_put(policy);
>> +    }
>> +
>>       /* Compute the cost of each performance state. */
>>       for (i = nr_states - 1; i >= 0; i--) {
>>           unsigned long power_res, cost;
>> +        bool boost = table[i].frequency > max_nonboost;
>> +
>> +        if (boost != prev_boost) {
>
> We expect in EM fwk that the frequencies are sorted ascending
> and we return error during setup if the driver callback fails
> to provide that.
> Therefore, in this code we don't have to deal with random
> 'boost' labels with gaps between.
>
Hi Lukasz,

Thanks for the review.

You are right. The boundary is derived from the highest non-boost
frequency, so with an ascending table the boost states always form a
contiguous top segment, and prev_boost is redundant.

> Let's make all OPPs which are 'boost' equally possible
> to reach (at least in theory), so label them as
> 'efficient'. I think this is fair in 'boosting' case scenario
> and energy has not that importance in it.
>
> So simply something like, would be enough IMHO:
>
> if (boost)
>     prev_cost = ULONG_MAX;
>
Agreed, this is simpler and gives the same result for the non-boost
states. Boost states are no longer compared with each other, which is
also a sensible semantic. I will drop prev_boost and use the above in v2.

Thanks,
Guo
>
>> +            prev_boost = boost;
>> +            prev_cost = ULONG_MAX;
>> +        }
>>             if ((flags & EM_PERF_DOMAIN_ARTIFICIAL) && cb->get_cost) {
>>               ret = cb->get_cost(dev, table[i].frequency, &cost);
>>
>> ---
>> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
>> base-tree: 
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> change-id: 20261029-em-rank-boost-separately-a7e7c7d78058
>>
>> Best regards,
>> -- 
>> Guo Chen <guo.chen@oss.qualcomm.com>
>
