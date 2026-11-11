Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404831;
	b=FNjWL3ppysCxBX1bUW5jcXZW9yVkKDdAnMZes4w8tCdWD0BqrsxKAQEIPnysqAvZd07q
	 XxmygPrErPMn0FJrbaqYsR0ENB7Pnd9Hiao0ffgmHowa1w8OJz0ejprqmKmX/GJ+SUyKW
	 hE2JgleTUipOlL1h/x6gURmwkkkq1yS8+I9T7xNxlwhK9OBl+40OmdOLWfQDsHkAPFpdL
	 F4kwB12BBPw1NdqDUODn5an187UHsjFEbNwoQmkf5AxayAZt4y29I0XuzVDSk6cgAW6D4
	 WTAjql8DS6+fgf2SG1Pp8UA7wokko7OW3RKnKLAkJyz1AseivUaU3EmmYHJbirayi3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
	b=hokWlBr091hSw/QpmW17im+3r4VYZbH/onPZ/wiAgGp0+CuhlvgPf4GEOclhS+b4sdbS
	 7hfwKnt4mhARplZOPqPyOxi3cCdw+cxblaNXC+nNdCNMM8hh7y9gIFNFIruOg29E2UZvP
	 pwprCqd2QKbxUJ1oHyObAl/eEQPMB5nWhIhmSFmGeVKoro+rrd+vQs1zVMM5EP5rAcnf8
	 ioJwu1xl1+R/AajzvndYLmpgxykZrOvWWzSduOl9IuPOYaEoJW1IIzVN19kLBvAyWX/qa
	 O3PK6L/g9uSho3zMOY7WUlBbv/sTaMrVJLqE0il1GevHWfeIjqr78+foOLguNZxllvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1NI9ZXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmvtSrqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A090606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A090606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1NI9ZXK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmvtSrqX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYuNC1806580
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=; b=P1NI9ZXKpPpLefpB
	T3jRSQKTdCHlEJxCBLZcI8vT3iWGPPydxpLKXAaJhtexVFFrEoWcIMwtEIjJFan3
	FngfDNeafJTexxx7+8fS+CyhF+fidjkTM04SWz9+37XWiMHELmIS0dNjyy3RMv1f
	fyJKo7B2LRVEAcTfr4EwnLyb/0Dglh2Octj0XY6HB1zpipBui9yPL+jYU2paRntD
	gSiwZFC37NRpTAHhcaIB0Rtt/s0zrYvd7FfmVd05fxrOZxAZjSwCmxzxnNzzrVej
	BpHRpbhJPqBQ6cnWyfdaMqrrGKjyIUOSIg+tysqWd0H8NUaG0nTJgbWLoeXmz/Y9
	CdGaXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawjc1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:47:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea446ea8c9so22442335ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794404829; x=1795009629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
        b=gmvtSrqX4mRvMroqfG5OzQo75GbOUuARbiiGbCbb9X+JRuXVxg4ebyHJ/2W/qb7c1w
         EQrH7Th+pidgu0q0fC8o6rWQRUsNlc83sTMngHXKkk9SPj0fNRFOOCoUlThuDvdI5OXI
         Z5n+dTEgIHQ2kX/DbyxulVU63GpCL/EBocjJPFF0Ya9IhBfaWBUZrogan9fX+YgES1BK
         80nwjCI045HAgiB5yRsTT7NEfsAftkqBv4m8YlUaM/r0vO6is3MpS7UvxWI3KxFSVnE0
         yXrX4qRQmCOUQQI0IKI6gZmOsdRdCiqvyEVQ+RWj5kjQBQs9N4qfveigreqvmBvhr4CZ
         sqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404829; x=1795009629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
        b=Jxh8NaitVhC9pVJ2bAdJWBIl6ohj+TwTjA0VbKWfeiwzJFmvDdwcuMw3RSxaIT9ONI
         b300q8U5irvipQXq8wWqdrr+bxfRRGl5dsiKObZdSVTpeNJL9kgBDvYeQwrQF106fd5Z
         HixWUZKQFr3aegfXEHbu/2wfRKFv5B3bBjr6FUNT/a1XXimltjlOPrEhp02pIvBxhV5Y
         VcBQevKzZYFx0cinWZVehI7QBcrMxegTZJgTbbeLF1ecvmpNM6nYOacWUup6ds5tfVUX
         NrPj/VBh9fI23tlsDD1UHp44y/d124zWVPTX1mQX/HJB209dm3iOiwyHEJhvUpkGuH3Q
         KEFw==
X-Forwarded-Encrypted: i=1; AL+hErFVMLJq8kr2MhOvpNmfdODNujZSE083ewK7qy4+w/5yDrN14Kqz3Awyeyso5C0iXu0Q292wNwoSujw465E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s4O3s4VcL6Ti8IgWbpcBl/X5J59re2RzNpduHRch4dQwR8sHP
	ULVARh+cH6MHBOCEj0ZBzOnJ+klHL6wnCmfjy+pov/KVuY+bn2IVmFwciyIasWvvTU9FFctaCvM
	MvXZ3E64q/jPjL1uJfPoyDEi6a5mX957ckcefu8KwoRxjuVoIMV+KraDraqdHLUyvYlU=
X-Gm-Gg: AYBFou0LMTCR/6nTCF+L7a15CqeESnXOhzDBnuEHJrSy+YDi+lyLG4UjtkIR6vFj4bP
	43uKxxNjhVGtBQvZrauz5DlEbsw4zKQ4yk6394m1nzOdtendMcKnJ8L0wXikRXNdnBFd81Eu5ND
	/e0ksN7t9O9tBEX2Eoc/u/kjAdRi+4/80kVxlBZWjO9noflpVfg8Ca5DbqO9CeH118KRlhnvbVd
	D0TcsKI2a3cURqmgsG550cF93oD+V9X9Y1vWeepZjedKygKfDaycswwfs+b2Noyjc94JE66rUt+
	LMEU6BMQbQwpTozRIK/w5o0cheKrog9JyQEiLTwjWBB4QbDqROU0rrYv+ZwkEWNSWvLVfVV5TBT
	4Vv8VhBXw+77Zj9l38WK4rH19PMqWjJhYIPQOYFcWlsvklHa/qHuayPLw13RVptoX/4I2OKpXsY
	icDS5Tg1KL+nClbnBuiz6PC/S7msTZX2al
X-Received: by 2002:a17:90b:3886:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b182f2570fmr1699713a91.23.1794404828651;
        Wed, 11 Nov 2026 05:47:08 -0800 (PST)
X-Received: by 2002:a17:90b:3886:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b182f2570fmr1699688a91.23.1794404828126;
        Wed, 11 Nov 2026 05:47:08 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dfb9827sm4890431a91.1.2026.11.11.05.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:47:07 -0800 (PST)
Message-ID: <18db783d-afef-4cd7-8192-00f1970da7ae@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:47:01 +0800
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
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to non-boost
 freq on boost disable
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <41f328b2-0825-4023-b86c-48136ba6ecd2@oss.qualcomm.com>
 <avRd3YVDXs26hrow@hu-anancv-blr.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <avRd3YVDXs26hrow@hu-anancv-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX186+Gtzb58XC
 p3v1sNiGiuEWFnCndZxdUE/p+CjDz4y1rsCijuhjicYI26kHCzS4+Dct8py/YrGmLIiXeP3HjXv
 DaqnjrBXraTBuHv5KNQxpNW/1hanppo=
X-Proofpoint-ORIG-GUID: DTAlw3pqzV0cGQaW7ukeXazdinZ8IjHN
X-Proofpoint-GUID: DTAlw3pqzV0cGQaW7ukeXazdinZ8IjHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfXybuHcK2+7CCN
 gZf3967JQRP03yVvm7qLDDU+4Xs71XMMy83d00G8S8+QRvIBAfm5uCAl+/xRWkUxWtGnR6huRi1
 jDYoYzoZSvaL6NliuLsNYGuIO8WUJutkqYs7JJpE+jGp0cjNU/KTB163hYsllHzHx0q5TenNqns
 ZMutLz6Pfl8FANiKTp7dEwAzky0/6M+faSzSEn6LqMY6Gndv1Caskc1A1X6wxa8Gtx960XWaKBs
 F/9xwhPddqMQoG4AazlUiE/S6djBvEC+6zgZ4CwfHtjRumDfxhdnLaDr1cJGHrTXzFj3N609NjW
 hYzEdzdlpuxBc0FBFQXdA6YShjQpnwPS7geMo6XVDJhr9wIUGG/1ewbvPqio1gSFdZ/F4kMHUj9
 qQofvXXf9/rBHDRx5c3hbvL4weOTjt1dpW9XF2zRHLfpsheW4FXRlFMmbKrP6QHRHz9C7Pm+UCr
 6EbK+ztYSHMRr6NONXQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af471dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qZlHrcwyowrLkl4W26AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054

On 11/11/2026 8:21 PM, Ananthu C V wrote:
> Hi Zhongqiu,
> 
> On Sun, Oct 11, 2026 at 10:17:14PM +0800, Zhongqiu Han wrote:
>> Patch 2/2 currently depends on a helper introduced by patch 1/2, which
>> prevents it from being backported independently. Since 2/2 is an
>> independent fix that should be backported to stable on its own, I think
>> it should be placed before patch 1/2 in the series and kept self
>> contained.
> 
> The idea was that currently patch 2/2 would serve no actual value without the
> fix in patch 1/2, and that is why it was the second one. But yes, we cannot
> fix 1/2 and leave 2/2 as is, which would turn the current benign issue to an
> actual problem, so the order should be probably reversed. I'll work on that.
> 

As I mentioned before, patch 2/2 addresses a separate issue that should
be fixed in its own right and backported to stable kernels, because with
policy->max stuck at the boost ceiling, scaling_max_freq keeps reporting
the boost frequency after boost is disabled (as shown in the cover
letter), and governors such as performance can still select boost
frequencies. Anyway, please go ahead.


>> To avoid introducing a new member that is only used by frequency-table
>> drivers, please consider the following implementation instead:
>>
>> If there are boost entries in the frequency table, the table is the only
>> source of cpuinfo.max_freq, so let cpufreq_frequency_table_cpuinfo() set
>> it unconditionally in that case.
>>
>>
>> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
>> index ea99464..8c8bad2 100644
>> --- a/drivers/cpufreq/freq_table.c
>> +++ b/drivers/cpufreq/freq_table.c
>> @@ -33,14 +33,17 @@ int cpufreq_frequency_table_cpuinfo(struct
>> cpufreq_policy *policy)
>>   	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>>   	unsigned int min_freq = ~0;
>>   	unsigned int max_freq = 0;
>> +	bool has_boost = false;
>>   	unsigned int freq, i;
>>
>>   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
>>   		freq = pos->frequency;
>>
>> -		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>> -		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>> -			continue;
>> +		if (pos->flags & CPUFREQ_BOOST_FREQ) {
>> +			has_boost = true;
>> +			if (!cpufreq_boost_enabled() || !policy->boost_enabled)
>> +				continue;
>> +		}
>>
>>   		pr_debug("table entry %u: %u kHz\n", i, freq);
>>   		if (freq < min_freq)
>> @@ -50,17 +53,20 @@ int cpufreq_frequency_table_cpuinfo(struct
>> cpufreq_policy *policy)
>>   	}
>>
>>   	policy->cpuinfo.min_freq = min_freq;
>> +
>> +	if (min_freq == ~0)
>> +		return -EINVAL;
>> +
>>   	/*
>>   	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>> -	 * it as is.
>> +	 * it as is.  This does not apply to tables with boost entries, because
>> +	 * the table is the only source of cpuinfo.max_freq then and it needs
>> +	 * to go down again when boost is disabled.
>>   	 */
>> -	if (policy->cpuinfo.max_freq < max_freq)
>> +	if (has_boost || policy->cpuinfo.max_freq < max_freq)
>>   		policy->cpuinfo.max_freq = max_freq;
>>
>> -	if (min_freq == ~0)
>> -		return -EINVAL;
>> -	else
>> -		return 0;
>> +	return 0;
>>   }
>>
>>   int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy)
>>
>>
>>>    	/* in 10^(-9) s = nanoseconds */
>>>    	unsigned int		transition_latency;
>>> @@ -791,6 +792,8 @@ struct cpufreq_frequency_table {
>>>    int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy);
>>> +bool policy_has_boost_freq(struct cpufreq_policy *policy);
>>> +
>>>    int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy);
>>>    int cpufreq_generic_frequency_table_verify(struct cpufreq_policy_data *policy);
> 
> I wanted more discussion on this part regarding finer implementation details
> and hence went with a working version, and I think I asked in the last revision
> thread regarding what are people's thoughts on this added field. I am also not
> keen on adding more fields, so this is useful suggestion. If we are to continue
> this implementation route, I'll keep this in mind, thanks.
> 
>> Thx and BRs,
>> Zhongqiu Han
> 
> Best,
> Ananthu


-- 
Thx and BRs,
Zhongqiu Han
