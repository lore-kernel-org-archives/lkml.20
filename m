Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D838DC56
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722916; cv=none; b=MDMhnETSZUYq9lf7dFyoz/W2XbYPJydmaeGc2FL/xmwichSZDQJG8FKc9CfltSw/Q+8YNV8jji9DRdCN2/IOvxCOdada1RGfnSna7L5dMsyNT9Tzg2s59Ck8Aybc2bJDZmSqoeqUpCTL+vJ9uLNX7ANCcpiwDmSSe4rjUaXKyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722916; c=relaxed/simple;
	bh=+MboOVSEobXqJz6TQMVlFxGzcxCRJenA8pUb+DqcaFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tutP9dHYPcV46GvHNpA7U9Jxt4wnGRsa1+BAe1JOp/S+KKAKFhscmrw5dHSdBYAbwQmIL2rwRXZiT7zu04Np/umT9RHEf4NyH8cr8Gq+b9ixbItIXlU/frNkiPHk8q3pkoxOF3Qvm+Wdnirl4P6q/zh8K75VDsKkW1vYW1Ul/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ap3JfkEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECzGfLxV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ap3JfkEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECzGfLxV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xt833423147
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=; b=Ap3JfkEKsAPJITVP
	lCDoOLN+d3tqkAhynWnFYrdCsTmwEGhNk72QbIGmGdA4fumUu1tlyphNvbUYiY3i
	spAY7RMJjqZeFPdwDdiTHq/CVedcNNDEZ1vhu85JTq8/tYa3sUpBx4bYNpTE2FnD
	gZWViNLm74V7bBHuBo6j8ft2jw5onqYWWlqicrG5+O/pjxFniJGgCZXVamrCh2yk
	hLfbyT3e4iPnfHQJl+PBooTU8lb0Rjmstcq/TtJdXbebOo+X9MUY3l6iKrw1D+tJ
	NFm9/U7u1Qzz/dBCvoFLSZAJp+L5rsNuTImFFuBiZ05hNMMd5iYzDyp50OO0mpXN
	IpSJLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtd4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:15:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso9337675ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722913; x=1790327713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=;
        b=ECzGfLxVyJmoy+GVRWbmiv4cKjRryL4qC+5VNzAQt+bAENtzqx1mt/KbozAItoDVSw
         aw4VVTvNmbgmus1EjuzdCud8d+5K9nwlHYIOqGkMZzVafnohghjVGBVoypmOFSE8BHFi
         ZBe9rpcfdRgWUnzIDkjrgdBuSXuO17cB0f12SA8XKN0qleZfOvpfc825ogKSOieF2Jb6
         riFtJqFrulDHsnwD5PxKnez32NVCw3YKBKAd/Nr0cknAVvb3ZPXCD9zw5Urc0PaWBTEU
         TBfgaAdc0yD3kxRqIJSIF1d2Jcb+XGKAb5mNxTlefu+QqBds1JNW72tSYefb53lDKmlh
         xszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722913; x=1790327713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=;
        b=IZXM6Iht6JkiZCD+EgurWHgt8u6D06rtWiYgp5M9gpsXL3cE9d/VZ80hG6k2j8Bc/T
         E0Zh1LQNIlKVnuejI9TiJLvOEOKr0dfBoNpCq/x/uTl4A0I8kM6OmFm2rUf6VevE3CsL
         iGssg4XTr2BPc8jFMYgEYY2/BX+zx9KlXr4w2H8Q5cF7J5IxtbEqPzOyO4QR8sAAxEta
         /K3+bM2swdGVzZPzLDav1vgO2tO3KYHalLJwn43pwyBHZfD9deam5pkqo+JL/qKVJVjq
         Ub8Ku93eY40nc6QUeGnn8/NvltIBFUpCfWaG99rVd768v406BS1v8bFUm3U1khVLuc7/
         iTvg==
X-Gm-Message-State: AFuF++k8RxBXOJdqOIjcVtcnGKX7gWHQ3FtuvydiBIQo48cfJrLo/UIs
	/13DwGEtZZGIkGF/vJqM394DnVy1Ekba1+FDWQMnwVZmwNrRa5cOS9qZbMjVxnJLJ7vSSs6L1lu
	oEBnJ3yJ9uWDH1BDoFRg056OgSgnGQ4eaBcS2VXYpBzVzh/XKN431JzSRwXX5n6+AH7s=
X-Gm-Gg: AYBFou3KFWvOa3RIiZoRizu063SdcX2+lQxVnzzk/yCsWqoOocqjxS7cqROzImIb3ob
	8lsFEoFjUIDHLuBagbv36qjUzAR8O9cJRy1GFMEK1g/ieZm+ng2Mcgc4M8ZaaO43tZ5RNN9UpJU
	yjwb8ux2mZODe7OWrWMnWCGT629+k3HI3v0XBPiwdrgDIwzVrPpAPhcL3q5cF3CNMvUcXbqOxnF
	Y+Dg7av26oZQ1rpMHrNW9F8H+lFukM0gp4g1VPOFkrWnvc05ZqPKdozDJV1RcG5++20588oE3oB
	sBvDL2sbEpqG7I/1ZmlQjKZJgY7ZUmHG6VgGpTYNLIMd/3T55dA9lHO9MxGHUmyDbNujEQOk8Xu
	ewAJbVtVOUR1q47nALjtgD7mDKPRSc7vul/Nc/i3WcY+T0n4pqJM4Kibcq295EwRV87dcwlU=
X-Received: by 2002:a17:903:2343:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2ddb1ab4ee9mr41636155ad.1.1789722912852;
        Fri, 18 Sep 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a17:903:2343:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2ddb1ab4ee9mr41635405ad.1.1789722912341;
        Fri, 18 Sep 2026 02:15:12 -0700 (PDT)
Received: from [10.133.33.171] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm4784555ad.19.2026.09.18.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:15:11 -0700 (PDT)
Message-ID: <05c00750-7fc2-49d4-9336-7beb33fd9380@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:15:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNyBTYWx0ZWRfX1lxNk7uBTqhY
 lObsnEUNSbVSnPVn2bnileR7fi9ikqknbbPSekMJGrRr6HUriDLYgkd45KYFumV+ySjdfudSArm
 iG7yp/hVRPP/vkHZH4x23siw/zMrUPcSi5v9H9qB+lsv24Hv4yGwCAoY6BihS6oGF8MN83J8Lj1
 mZazmwcj0/+wCv5xQ4ziYnXmbZdgg4nDVZI55ZBRpMOTLINt9aRj1caWoUjPzmRZbp7jHhpwtT8
 kEvrpks2X70w5VRiq0sj9/zjQKX1tUJ3ffZH63ISaH1IG0t4DBjrWZPi/bHUMRAKlhG9v6mwfim
 lbQJS/MWIXghjaGUPo0y9db7WmIckQXSotOH+MTHxrdpvO0481RdE4+y3zL8QDHUJ130XahYsHK
 P1UpDPH2DxwueOy0EzxJ3pZATTocahCiRFFS90lxOqes/E0nMyxpDSW6fHF6YiIH3vrkjLHKom7
 GJK3A4sVBFidAUtcBrw==
X-Proofpoint-ORIG-GUID: sS47daTdOU7fdW_HY_aT4WSIHXeRD_Th
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNyBTYWx0ZWRfX2s8yMEiZ8o3m
 k+I9d3FM2sVS7H56gZqJb1jU9SVrnLQlcY8tUZS/rRfMjbpUTz+k03p15inIicmX1gNUnHIK9zL
 TLzkUzqB+VUzqh6QK6jh9PIS9GZz3HE=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0121 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yaB9tev9RX6Wa8ZHx44A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sS47daTdOU7fdW_HY_aT4WSIHXeRD_Th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180127

Hi Ananthu,

On 9/8/2026 4:30 PM, Ananthu C V wrote:
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> max boost is known") introduced a guard for cpuinfo max updates to only
> increase, to preserve driver-set values above the freq table maximum,
> causing cpuinfo max to be stuck at boost frequency even when boost is
> disabled.
> 
> Unconditionally track the highest non-boost frequency (max_base_freq)
> in the freq table. When a freq table is available, use max_table_freq/
> max_base_freq instead of cpuinfo->max_freq to control boost values, so
> the value can decrease again when boost is disabled.

This issue does not appear to be limited to schedutil, so the subject
seems too restrictive.

> 
> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")

I already commented on the Fixes: tag in v1.
https://lore.kernel.org/all/3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com/#t

IMO it should be: 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS
request")

Could you please comment on this?

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>   drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
>   drivers/cpufreq/freq_table.c |  5 +++++
>   include/linux/cpufreq.h      |  1 +
>   3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d0df986fa3d..a13e72711597 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
>   
>   static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   {
> +	unsigned int max_freq;
>   	int ret;
>   
>   	if (policy->boost_enabled == enable)
> @@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   		return ret;
>   	}
>   
> -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> +	if (policy->freq_table) {

acpi-cpufreq has a freq table but never sets CPUFREQ_BOOST_FREQ, so
max_table_freq == max_base_freq == _PSS P0 here, and the real boost
ceiling kept in cpuinfo.max_freq is lost. It seems that the condition
needs to be "does the freq table list boost frequencies" rather than "is
there a freq table" — e.g. recorded during the table scan, the same way
boost_supported is derived from the flags in
cpufreq_table_validate_and_sort(). And then:

if (policy->cpuinfo.boost_in_table) {
     xxx;
}

> +		max_freq = enable ? policy->cpuinfo.max_table_freq :
> +				    policy->cpuinfo.max_base_freq;
> +
> +		if (!max_freq)
> +			/* when the freq table contains only boost frequencies */
> +			max_freq = policy->cpuinfo.max_table_freq;
> +	} else {
> +		max_freq = policy->cpuinfo.max_freq;
> +	}
> +
> +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
>   	if (ret < 0) {
>   		policy->boost_enabled = !policy->boost_enabled;
>   		cpufreq_driver->set_boost(policy, policy->boost_enabled);
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index 4984142dc08a..7e183e16162d 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   	unsigned int min_freq = ~0;
>   	unsigned int max_freq = 0;
>   	unsigned int max_table_freq = 0;
> +	unsigned int max_base_freq = 0;
>   	unsigned int freq, i;
>   
>   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
> @@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   		if (freq > max_table_freq)
>   			max_table_freq = freq;
>   
> +		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
> +			max_base_freq = freq;
> +
>   		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>   		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>   			continue;
> @@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   		policy->cpuinfo.max_freq = max_freq;
>   
>   	policy->cpuinfo.max_table_freq = max_table_freq;
> +	policy->cpuinfo.max_base_freq = max_base_freq;
>   
>   	if (min_freq == ~0)
>   		return -EINVAL;
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 3f3b1380251a..419c71ccff7c 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
>   	unsigned int		max_freq;
>   	unsigned int		min_freq;
>   	unsigned int		max_table_freq; /* Highest valid frequency in the table */
> +	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
>   
>   	/* in 10^(-9) s = nanoseconds */
>   	unsigned int		transition_latency;
> 


-- 
Thx and BRs,
Zhongqiu Han
