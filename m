Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19843DA5E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084398; cv=none; b=Kq47pxadR6jCjwbDhd9S1k0gVQdxugVSHDzk4C0Kc0BJQFAwxGfjoDzhwudxYJd2RGOxhtJ26aLFR9Gb4F7sQ6b6WHMcr4bU2ebM78MJh88ENChl51pRo/iwDorA4UUWpi0VkaNImm4V//TrMYw6b3dqB0TQXR9dIose6V0K9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084398; c=relaxed/simple;
	bh=7QHutKGaN9i99xihPm4cE0w+hK9skWSFtV7wIltN2hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPCxmXyHb3+mwpunyVeHLU4VM8dQDo3SKQ/40rpVDUtf4iz+KFO3fvYZapGJkOIptaOIBHwVVKq+jFVd8MSRhgpv3vr2qZQjwqCxvuDI9VX2z901ZOSO+naf23GqitB3iURXa1XNA55XsWl+KlTJug7OroCnNqxaG/BF7Zhb02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd8kCYiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7xgU29O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd8kCYiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7xgU29O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPVQh3516077
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+n557K+DZqVRpFdTKZE18fW896KFDQSu6kLWIm5rBnQ=; b=Wd8kCYiEqJZM3jNc
	wzCzWbEduiUWF5Bf4A3gXNPM2MR4eQAy258UCXkq0dbjCrA1BmiPYd8/p1/ysx+s
	lZ7fhXLSAM86XeXEgFWfDj7vqE7eSWz7t1I8KhzI9y3qVWb9Yhn89R1nUEmQl875
	aIU67kpo1Z255jLS8QAZi+/uGje0nIuy0po7Asj4L9GwYiX/frCHOGfRj0k40GCy
	ryH+ymyrcP82ndiOcSYOnq6IkG7ZXaQsoLcMU+z7GtF/nwLjBBiyWgluHt9rtjLv
	sSxcuPFjLtC4m41yrSxb+jdJp4Xzp/rYqEXyTo/SMWcxWISFHlt9pWMNXOkCfbID
	EGLZ2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqarkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:39:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1154833a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790084393; x=1790689193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+n557K+DZqVRpFdTKZE18fW896KFDQSu6kLWIm5rBnQ=;
        b=b7xgU29OJ0nKDF4IZ9q0qsUy4Dc5t3CadLlxGhQ8mC9Og5keP5JxSFOxTH0bQmaQI0
         B0L/RTDlftQ+ti3pgBAUD8dlHcR1LnmSrdnZ2sEVhlU9vC5/n01mYbguGwahFoVXTT59
         jtGBh3x3WcEzxu+YatnbEoxCrKaijOP5tYJMNQdli2w0+5F3IRg0W+kQ/xsmxsjW2FUo
         sPmMgrqHwnaEHslz81YH7QvZnJ3/bD0ZLv/QQrPj+TjSu0Dj8uE1Dr38uku1mzYtge7y
         dqBArfZE/piX7GtqJ97Cjmvd8H9dIZLJG1xVBqGw3SYnNMLfEcA+paZ1+phAtodzyQ0L
         NtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084393; x=1790689193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+n557K+DZqVRpFdTKZE18fW896KFDQSu6kLWIm5rBnQ=;
        b=mfn52K0iBeTC0NkPTtSbdB/DMLuyfbepgx7DsA0VQATEsmiO+6wHyTecSdcajGb6Jk
         b1Z77SEs9/q+dfapEokj5bPvFfBhkKK8uIdVDSYxj0gyTodxdCFg/EIR5eYZ0qwWOw44
         PUjDC3BMbLdR1KfGIWbG9vASYtNhg132qHpMGnnrkVry0PQ2eSKZOZOVCFdPuAdeMBGQ
         wwZulgAMvedKSI6Mmmvr2pqQyP6EKgOJI7Add9azEN5xA4eUlB2wxjgX22z09c3a2iJV
         4RGrBuRTlu+QHWXav0QyVlCa6iGOFYZmbDyQpZ9LMxaAQ1YRKwtu975QnAhgV0lGY4jW
         xNXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMJL7CY/QqtX7bJFMWxfS5x1IhkA1YPYCPWw4KT/llYBG0USwojSHpyCQVgnW6U1F/z8gvRvXsW/9GO8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lzb0MTtKCZRICwuGyu/I7GeWpAU4VJ9DumTfu/FEUF6kucpGzd
	m79EuZrd4LKsbA4oHiRNKsM1i4/rHqQZmlSzPA+jYh0zsHAspfDBfDQwPVFM8Fs9DdAe+jSg0aB
	nUP0chPOKiyu5jl7KXCpEJGwXQhSK1pdi4AB+lnSktF01FXtXxEzOjNDWAWqbLNjjELw=
X-Gm-Gg: AYBFou1np+vi6SCUFQjUxavI7MworrrRnQwzRIw/9WyaKlh4j47LlkidixsomAoTnpy
	PfutUdnTIPbBCw12YBANI6yIRC5hz8/z0zTLZCrHG2cKBv8pvhYQl5b9OOmVZXC0Yuz+H+Sb9eX
	q9vpqLIP8E5SVHOoGXDPaoo/zOwEGU0PQ7rf9tlsYHv/g1AQt8RCKgv+KRcvPB87/1S3B1Ic+Qe
	3H4295jNDV2QcZwq17CdwW0XvZKoTdFPhEYgsSJZSAYHrXJoFjrPwb5qzt86ndPYXad3v8GeeKO
	1DelXmELSaJ67U0ciOkgIAJB8hG6QO/OBKMne8kG8mIhAKpG9sXo8smV5uGpQ9caa8CUcruTx3M
	wcYHT5xpx0Da7zzqJZmeImcCsPN25xMtrZn+u3WijqVG+99dnNXSwLnbR90nRjDwbjBDmd7g=
X-Received: by 2002:a17:90b:3d8d:b0:39e:6c68:fd8c with SMTP id 98e67ed59e1d1-3a0736b0193mr789252a91.33.1790084393189;
        Tue, 22 Sep 2026 06:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8d:b0:39e:6c68:fd8c with SMTP id 98e67ed59e1d1-3a0736b0193mr789219a91.33.1790084392633;
        Tue, 22 Sep 2026 06:39:52 -0700 (PDT)
Received: from [10.133.33.241] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm4883133a91.7.2026.09.22.06.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:39:52 -0700 (PDT)
Message-ID: <4f0915c0-5950-4e45-a72b-0db2942f00b5@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:39:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        zhongqiu.han@oss.qualcomm.com
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
 <05c00750-7fc2-49d4-9336-7beb33fd9380@oss.qualcomm.com>
 <arEIKD11YRH6YoHz@hu-anancv-blr.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <arEIKD11YRH6YoHz@hu-anancv-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2grtDcTMvRECfMJh_PFvf1y-JMMBgbJL
X-Proofpoint-GUID: 2grtDcTMvRECfMJh_PFvf1y-JMMBgbJL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5OCBTYWx0ZWRfX6Xt2cAh8Og+k
 jJPsrBbQaW/6WOi9c0MR19mkzzkjAuHXjxhpP/LPyef4VMYqJl4xbv95B30ukjX2S2Iu/oSuwan
 NV6NVe5cRnkfyXcVmoJsok87XW1df5Q=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2852a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WZsD97d4U260xpjQMLoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5OCBTYWx0ZWRfX7Vf8Bgppl4+Y
 b+L3WFpjbEPROM0xaV+Dp6fO2UrJtvjQD//v/Lns5CihgZKmQLZpmy8XWSCyvrfG6fjmJgrEHAl
 BQpUOUDadh+kcFn++uWXUURD4bpbHPjzmxpIPsYCackjObDNOpiuWey+BGtRIQFdum8Qeo84nvq
 8ls0CAofbxO1mYVOt3lmdUdfZ/0dfJfuZjpUC/+q3/1LpEqrPGYHJa+ap0EMD9wR6ULaDZ7n1u9
 aHqzWewU4JdCBKBm1u8N4UZyJOOnG1z8aNDDzK6+ygyZZaz66e+Meils+n+PlzP+2RuQYNxGdBI
 L20vxEet2+GNDYXpZmeYk+X2NJL3hgfAZO3fux5Ri6pTHAtVyL05lcaVE/nlKNttKmlnM5x/gfR
 kmN1Jh+Uu+wxb+twj+3m9O2buB4A+ICx2H/08CrDhoqFsprz+AOnKRJkDfODYVVtMxgTxZlJJ0p
 ZV7+BsjVemL2A16r7cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220198

Hi Ananthu,

On 9/21/2026 6:34 PM, Ananthu C V wrote:
> Hi Zhongqiu,
> 
> On Fri, Sep 18, 2026 at 05:15:07PM +0800, Zhongqiu Han wrote:
>> Hi Ananthu,
>>
>> On 9/8/2026 4:30 PM, Ananthu C V wrote:
>>> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
>>> max boost is known") introduced a guard for cpuinfo max updates to only
>>> increase, to preserve driver-set values above the freq table maximum,
>>> causing cpuinfo max to be stuck at boost frequency even when boost is
>>> disabled.
>>>
>>> Unconditionally track the highest non-boost frequency (max_base_freq)
>>> in the freq table. When a freq table is available, use max_table_freq/
>>> max_base_freq instead of cpuinfo->max_freq to control boost values, so
>>> the value can decrease again when boost is disabled.
>>
>> This issue does not appear to be limited to schedutil, so the subject
>> seems too restrictive.
> 
> That makes sense, I'll update it on the next run.
> 
>>>
>>> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
>>
>> I already commented on the Fixes: tag in v1.
>> https://lore.kernel.org/all/3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com/#t
>>
>> IMO it should be: 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS
>> request")
>>
>> Could you please comment on this?
> 
> The specific issue we are trying to fix is that once boost is disabled the
> frequency is not able to come down to a non boost value, which was introduced
> by the upward guard added in 538b0188da46. Consequently, if that guard is removed,
> the issue does not exist. So it makes sense to add a fixes for that specific
> commit.

I just did some testing with the SCMI driver on the SM8850 platform, and
the results matched my previous v1 comments[1]:

02/15/2021  538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
if max boost is known") ---> Not reproduced

03/26/2026  6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS request")
---> Not reproduced

03/28/2026  db80ad776cd2 ("cpufreq: Remove driver default policy->min
/max init")  ---> Reproduced the issue

[1]: 
https://lore.kernel.org/all/3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com/#t

538b0188da46 made cpuinfo.max_freq increase-only, so it stays pinned at
the boost frequency once boost has been enabled. This stayed harmless
because cpufreq_frequency_table_cpuinfo() also assigned policy->max =
max_freq; directly, recomputed per boost state on every call.

6e39ba4e5a82 moved the boost QoS update to the dirty cpuinfo.max_freq,
but since that value is unchanged on disable, freq_qos_update_request()
bails out early, cpufreq_set_policy() is never invoked and the directly
written policy->max survives, so the bug remained invisible.

db80ad776cd2 then deleted policy->max = max_freq;, leaving nothing to
bring policy->max back down from the boost value that
cpufreq_set_policy() had installed when boost was enabled.

Correcting myself: from the point of view of where the issue first
becomes reproducible, the Fixes tag can be:

Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
init")


Comments are welcome.

> 
>>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>> ---
>>>    drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
>>>    drivers/cpufreq/freq_table.c |  5 +++++
>>>    include/linux/cpufreq.h      |  1 +
>>>    3 files changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>>> index 0d0df986fa3d..a13e72711597 100644
>>> --- a/drivers/cpufreq/cpufreq.c
>>> +++ b/drivers/cpufreq/cpufreq.c
>>> @@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
>>>    static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>>>    {
>>> +	unsigned int max_freq;
>>>    	int ret;
>>>    	if (policy->boost_enabled == enable)
>>> @@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>>>    		return ret;
>>>    	}
>>> -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
>>> +	if (policy->freq_table) {
>>
>> acpi-cpufreq has a freq table but never sets CPUFREQ_BOOST_FREQ, so
>> max_table_freq == max_base_freq == _PSS P0 here, and the real boost
>> ceiling kept in cpuinfo.max_freq is lost. It seems that the condition
>> needs to be "does the freq table list boost frequencies" rather than "is
>> there a freq table" — e.g. recorded during the table scan, the same way
>> boost_supported is derived from the flags in
>> cpufreq_table_validate_and_sort(). And then:
>>
>> if (policy->cpuinfo.boost_in_table) {
>>      xxx;
>> }
> 
> That makes sense. I think the best thing to do here will be to export/move
> policy_has_boost_freq from freq_table.c and reuse it. Comments on this are
> welcome.
> 
>>> +		max_freq = enable ? policy->cpuinfo.max_table_freq :
>>> +				    policy->cpuinfo.max_base_freq;
>>> +
>>> +		if (!max_freq)
>>> +			/* when the freq table contains only boost frequencies */
>>> +			max_freq = policy->cpuinfo.max_table_freq;
>>> +	} else {
>>> +		max_freq = policy->cpuinfo.max_freq;
>>> +	}
>>> +
>>> +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
>>>    	if (ret < 0) {
>>>    		policy->boost_enabled = !policy->boost_enabled;
>>>    		cpufreq_driver->set_boost(policy, policy->boost_enabled);
>>> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
>>> index 4984142dc08a..7e183e16162d 100644
>>> --- a/drivers/cpufreq/freq_table.c
>>> +++ b/drivers/cpufreq/freq_table.c
>>> @@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>>>    	unsigned int min_freq = ~0;
>>>    	unsigned int max_freq = 0;
>>>    	unsigned int max_table_freq = 0;
>>> +	unsigned int max_base_freq = 0;
>>>    	unsigned int freq, i;
>>>    	cpufreq_for_each_valid_entry_idx(pos, table, i) {
>>> @@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>>>    		if (freq > max_table_freq)
>>>    			max_table_freq = freq;
>>> +		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
>>> +			max_base_freq = freq;
>>> +
>>>    		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>>>    		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>>>    			continue;
>>> @@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>>>    		policy->cpuinfo.max_freq = max_freq;
>>>    	policy->cpuinfo.max_table_freq = max_table_freq;
>>> +	policy->cpuinfo.max_base_freq = max_base_freq;
>>>    	if (min_freq == ~0)
>>>    		return -EINVAL;
>>> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
>>> index 3f3b1380251a..419c71ccff7c 100644
>>> --- a/include/linux/cpufreq.h
>>> +++ b/include/linux/cpufreq.h
>>> @@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
>>>    	unsigned int		max_freq;
>>>    	unsigned int		min_freq;
>>>    	unsigned int		max_table_freq; /* Highest valid frequency in the table */
>>> +	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
>>>    	/* in 10^(-9) s = nanoseconds */
>>>    	unsigned int		transition_latency;
>>>
>>
>>
>> -- 
>> Thx and BRs,
>> Zhongqiu Han
> 
> Best,
> Ananthu


-- 
Thx and BRs,
Zhongqiu Han
