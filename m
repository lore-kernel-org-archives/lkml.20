Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A540DFC8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936451; cv=none; b=CLMDbamIxoRXFIQGSVPy/EOZsPkna+lBv95MBeJN7xGNWi8sAi2axwW4nTrzPRSOmh42Z2PDoz9aJGmDzoe0Y2OaMZLuVhxnve/zGjIY5XYdknZ8j28Kei0zm9qpSjW2fkCuId1T3lLwgMPnd+tKEseXVSUEY/+FMZff88THJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936451; c=relaxed/simple;
	bh=8GPOsg+OGb9mjW3ms00HsQPOyDG2ybOgQb8k//bk7Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJXQKJ1wXmG5eEjlg1eeJhWME8flUnWsYJj3EsUyktvZElNAy8VgfSaEk5irKRwdyPpegyZOcmaaLjvQokyIbWXe4YBdIPZ12ZZ4ze/Xx1OUQVfrmc7Hvae/S45Bz1TSChdtkIz3ekZqq1kHnc/aFT3gr1wzg5obxh86K8uGx+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HA7If939; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2Pqw6i3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HA7If939";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2Pqw6i3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nUIw206801
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=; b=HA7If939ccg+rm7+
	jt5jIaoYeOIil3SZQA07KlvWVCheRUztDDzidlD5EpjfTj+XdffICUwMuH7B5O8G
	2xGUdWWXIq8DQAKE7shxBua+F4sTbanyMRrWyJEp/dUOit202Lcehdq26hDriPeh
	QXXBuJJVyJN3/9IdTghxn2hkcsAcxHRwktQXT4blRECE2mHvZCrs5yF/Y1aRk2iN
	0TWNS5x6JnCFHVKVtgt5PusibJmNenGul5WUR2OCXwphHKm1AjeTZC//UcgAM/TX
	93q2XAu6Xlb+DIoPEGY91Lglu/pFvwdEaCA8y7fHNRxbPvf0p4L+6lzIZB5iz8GP
	eNbQew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v033290-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:20:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so11959785a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790936447; x=1791541247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=;
        b=Y2Pqw6i39mTVFAoFOmXgnYJXK4btypg91FJPgc3eZoK4tW22m0283z7pB+l4vWV80H
         JTAenvzSe3OTNJHJZeszKtSYkwC09gWGMbNdzAOOc6b+fVpzpi3mnKUsHaDmtVgFHvxJ
         UknnoAsT9GXh0ec9YCwlCRB9I7YQozRQ1WgJqs6HzXPnRul8wHkB5of02CDFLn60ZQ9x
         PwGqW3DncAYE5HVuPtd+PAq1dZ57FvecbqELPwqADW8n45HNnv9zeD4kyWr9CrHoJVrP
         j5nPK/9awFaaIsOWlKtbC+M7C7ALBgb+z5PUDLzVM7DRAEpInC1mwcuLvHKSBeNRFkyQ
         o4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936447; x=1791541247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=;
        b=ix3SH7Gb2WzGeiZiC7QM5tTB5+9bZDSv0gaDfQ/xjUBVfMC1M7glPZZcYwSOzVPghA
         NnUPA3Ew3S300K8AUeF2uhFzyKeiS/8PPRpe/VKXuTTyyLNXNu4Se+3mmAxRFow4ZEMm
         RoOZTdhgdKLeMg2fryrhiAejEXT4GXnyl8oG7WKJhcVqYmAmdjR/kNkyPXwKF3/6T6rC
         UhYYaKoQsuO5WXq+xqoc4AcvAK9x9mbK8WNZIU6GeCP25MX/qwVwn8wLlg8QzJvwHhDu
         rBa2lcfmoD8oRCf7/m+P8ZHh6YJwIcnEM259VpAblmOSnybeDxS81LY6ElvCpdKAu6JH
         7gWw==
X-Forwarded-Encrypted: i=1; AKwUvBxQKdcqjC5rOSEgdBK1Oot5FtJWH5JbNtg1C70iIOnHZUn8Mr/87VLJCgugE5eh5kBsdzOC+vx4tp79uW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcAds+2MeQ6oRCvODOQ2/xlQjgqmNpiwmRTArVsZblw2NSbtiW
	6sYCRQAZLqO5N1uf4ZtqA7JkV5rN1juy8eKcOwf7oVU79awaMWkIDqcicenoOtAuntPvK7ABOaN
	wm4mzVanxISH4GbQ+FEsJPTygLsdZ9uL8kHwMylywxUwUvKgQmEk6IY6GwdIL+U9OgSA=
X-Gm-Gg: AYBFou3KB7lO4KrpQ/f8kFhAAJsGCYkZl+GdInvNBAYXioR4hN6l9XNTToxKObN4Y1K
	g/2yKNwzJZJlv/CLR/2xq5j1BAIFwP5mCV8Z3EdNKzkjSz9Ush3TssCEiaFOfdUK70/489RoVwP
	KBZ9n9lD8Wdu0bTcePNYlZ45TMD0swTh9P+Mb7CAxDz4g+ramUeZym7KHiPhWsNtPKTxUg+q1iD
	f9IQKNJVCMm/xEaIHDCMng+jXZAgdyU2LeKPUha6JMCCzsBvz3l5mZQ0TOA3h0xi+B6X9kM/h1t
	3JGPNa7otq9iNShNMwZTDHzrOEeWkJtJsUXLBrOL0n80shrySSaYC29Uzc3fKQfLyhRw7PsMar3
	HkowOmY572buR8BigTqA0+W4PhI2UtXWkAqQpGtNdZsTSpoNpK1OLGEqlodn2NdpPWmnLGA==
X-Received: by 2002:a17:90b:548d:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a6ce647e67mr2326318a91.1.1790936447186;
        Fri, 02 Oct 2026 03:20:47 -0700 (PDT)
X-Received: by 2002:a17:90b:548d:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a6ce647e67mr2326271a91.1.1790936446628;
        Fri, 02 Oct 2026 03:20:46 -0700 (PDT)
Received: from [10.133.33.14] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc96ac0sm3407857a91.2.2026.10.02.03.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:20:46 -0700 (PDT)
Message-ID: <d718da43-0efa-49ea-9081-8d395ee013e6@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 18:20:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cpufreq: Add a driver frequency resolution callback
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
 <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfXxhPWsARSmli4
 3xmiEy7ru2nN5Lvl1ozfhW2GbbYcS0r94e3ToPrXusCbqsmtzn1dY91Caf+Jd7g+o09dRvZi+o5
 +FSApL/SqRUJBVhNtgb8zPAJGqBylsQ=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abf8580 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=XS8obbLTPcTq88lrOBEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: qLOwnC0Dxyc0QrSzeD5cybruBizsyrrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfX9FmKB0RNg8X3
 Ud0qtPwkxQcnmn99f2uFj/YyACwQy1xRlWbp2udm5jObzdqjzckuPBO6wcqT+JrzLzJf7fKjBf1
 gbk72CutMuX9bjFtloR48KNzWn1ZKXRWPPJ8gtwwH6HmcLlTZaaM6XMGkrfmJkbJwvwQ1wC2Lu9
 U6LQaMc41j+Fz3JDNO3Ar/vPdgbg6ibx6QABAzLv4nM4kcgQYbO1Fl5mvwtfw+sbTLimj3xc2+X
 As25W5yqhPtRTRdvVYK2K8k4gx2ku8G9EGF3WHW7rBkSaA2XO1gJ+F52hHJb4KhegemCgRdvbtf
 TzFTgAJ5eZTkNkwozXGy/zdhujSizzQOO26Joa10Q+W0ltQXTPu2+sOqdKAKtogRSmsoLaYggRC
 zzPu98Oee63EKVGWR+BKpki3an3bbswQvS1it8UGhJYn0iWl2v3hvCtENB5Qr0+ClleaVd/bmrJ
 IW/tfHT+8TOK32o2kIg==
X-Proofpoint-ORIG-GUID: qLOwnC0Dxyc0QrSzeD5cybruBizsyrrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020041

On 9/29/2026 6:29 PM, Christian Loehle wrote:
> Without a frequency table, cpufreq treats the policy range as continuous
> even when the driver selects discrete performance levels. Governors can
> then issue different kHz requests for the same driver setting.
> 
> Add ->resolve_freq() for table-less ->target() drivers to canonicalize
> requests within the supplied limits using CPUFREQ_RELATION_{L,H,C}.
> Document the callback and verification contracts so callers can safely
> cache resolved requests.
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   Documentation/admin-guide/pm/cpufreq.rst |  4 ++++
>   Documentation/cpu-freq/cpu-drivers.rst   | 19 +++++++++++++++++++
>   drivers/cpufreq/cpufreq.c                | 17 +++++++++++++++--
>   include/linux/cpufreq.h                  | 10 ++++++++++
>   4 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index 34baf20cc202..e634b87a62a8 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -144,6 +144,10 @@ that belong to the same policy (including both online and offline CPUs).  That
>   mask is then used by the core to populate the policy pointers for all of the
>   CPUs in it.
>   
> +A table-less driver whose discrete frequencies are derived at runtime can
> +instead provide a ``->resolve_freq()`` callback to map arbitrary requests to
> +deterministic, supported frequencies.
> +
>   The next major initialization step for a new policy object is to attach a
>   scaling governor to it (to begin with, that is the default scaling governor
>   determined by the kernel command line or configuration, but it may be changed
> diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
> index 17c69f83691e..4f327760bc04 100644
> --- a/Documentation/cpu-freq/cpu-drivers.rst
> +++ b/Documentation/cpu-freq/cpu-drivers.rst
> @@ -86,6 +86,9 @@ And optionally
>    .set_boost - A pointer to a per-policy function to enable/disable boost
>    frequencies.
>   
> + .resolve_freq - A pointer to a frequency-resolution function for table-less
> + drivers with discrete, runtime-derived frequencies.  See below.
> +
>   
>   1.2 Per-CPU Initialization
>   --------------------------
> @@ -170,6 +173,22 @@ limits on their own. These shall use the ->setpolicy() callback.
>   1.5. target/target_index
>   ------------------------
>   
> +Table-less ``->target()`` drivers may provide ``->resolve_freq()`` to map a
> +clamped target to a supported frequency within the supplied limits.
> +``CPUFREQ_RELATION_L`` selects the lowest frequency at or above the target,
> +H the highest at or below it, and C the closest, choosing higher on ties.
> +If no supported frequency is at or above the target, L returns the highest
> +supported frequency in the interval. If none is at or below the target,
> +H returns the lowest supported frequency in the interval.
> +``CPUFREQ_RELATION_E`` is stripped before the call.
> +
> +Equivalent requests must resolve to the same frequency, which the target
> +callbacks must map to one canonical driver request even if performance levels
> +share a kHz value. This lets callers cache resolved requests. ``->verify()``
> +must leave a supported frequency in every accepted limit interval.
> +The callback must not sleep: it may run in scheduler context.
> +Policies providing both a frequency table and this callback are rejected.
> +
>   The target_index call has two arguments: ``struct cpufreq_policy *policy``,
>   and ``unsigned int`` index (into the exposed frequency table).
>   
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..44bda2f32fcf 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -480,8 +480,12 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>   
>   	target_freq = clamp_val(target_freq, min, max);
>   
> -	if (!policy->freq_table)
> +	if (!policy->freq_table) {
> +		if (cpufreq_driver->resolve_freq)
> +			return cpufreq_driver->resolve_freq(policy, target_freq, min, max,
> +							    relation & ~CPUFREQ_RELATION_E);
>   		return target_freq;
> +	}
>   
>   	idx = cpufreq_frequency_table_target(policy, target_freq, min, max, relation);
>   	policy->cached_resolved_idx = idx;
> @@ -495,7 +499,10 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>    * @policy: associated policy to interrogate
>    * @target_freq: target frequency to resolve.
>    *
> - * The target to driver frequency mapping is cached in the policy.
> + * The frequency-table resolution path caches the mapping in the policy.
> + *
> + * Keep the policy active and exclude driver teardown; a policy reference
> + * alone does not protect driver-private data.
>    *
>    * Return: Lowest driver-supported frequency greater than or equal to the
>    * given target_freq, subject to policy (min/max) and driver limitations.
> @@ -1445,6 +1452,11 @@ static int cpufreq_policy_online(struct cpufreq_policy *policy,
>   		 * If there is a problem with its frequency table, take it
>   		 * offline and drop it.
>   		 */
> +		if (policy->freq_table && cpufreq_driver->resolve_freq) {
> +			ret = -EINVAL;
> +			goto out_offline_policy;
> +		}
> +
>   		ret = cpufreq_table_validate_and_sort(policy);
>   		if (ret)
>   			goto out_offline_policy;
> @@ -2925,6 +2937,7 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>   
>   	if (!driver_data || !driver_data->verify || !driver_data->init ||
>   	     (driver_data->target_index && driver_data->target) ||
> +	     (driver_data->resolve_freq && !driver_data->target) ||
>   	     (!!driver_data->setpolicy == (driver_data->target_index || driver_data->target)) ||
>   	     (!driver_data->get_intermediate != !driver_data->target_intermediate) ||
>   	     (!driver_data->online != !driver_data->offline) ||
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index d3d0d9d02aa4..a0a7619d11fd 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -364,6 +364,16 @@ struct cpufreq_driver {
>   	int		(*target)(struct cpufreq_policy *policy,
>   				  unsigned int target_freq,
>   				  unsigned int relation);	/* Deprecated */
> +	/*
> +	 * Optional for table-less ->target() drivers. Resolve a clamped request
> +	 * within the supplied limits using CPUFREQ_RELATION_{L,H,C}. Must not
> +	 * sleep. See Documentation/cpu-freq/cpu-drivers.rst for the contract.
> +	 */
> +	unsigned int	(*resolve_freq)(struct cpufreq_policy *policy,
> +					unsigned int target_freq,
> +					unsigned int min_freq,
> +					unsigned int max_freq,
> +					unsigned int relation);
>   	int		(*target_index)(struct cpufreq_policy *policy,
>   					unsigned int index);
>   	unsigned int	(*fast_switch)(struct cpufreq_policy *policy,


-- 
Thx and BRs,
Zhongqiu Han
