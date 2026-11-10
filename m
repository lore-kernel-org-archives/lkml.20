Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322567;
	b=wq3SFth3zyQBwJkow48Mq/Ci8aenQoLPlHhmcbYPzYPLl1Gcnif1rcHEU2Z7EqiWo58m
	 YKDeTxS9t8Pt2w7PNnN9oGs70phnMy5gX4ejiOiEFlEnZTDhxdzaWtolDbhmqdMujwZg0
	 VWaEkUhSU7hcajl7+BJAA0BBmTs+KhN9hXflusfAHONUCITWRec1DEATT9zcPppvH4IxK
	 Xf6gqSFHE0+ZyyAyuR5PzEc7EK9b5RHgQgRPYM7tn27JbpKeaLVeyqYAsvNqkQ660hkVI
	 t/PWWYd5Ginmqf5hLxhXS0Yj7GlEIB39JQr6p74ecIrBXp7w8PVZ5i1LnEdMkPOXGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kBSuW3DJj66pWv9LhnTXClJVrp/4F7tizZPGCuZVtlU=;
	b=5QCkV1KZ6aV+nmk+ZVs4a+KITtUSJrAL/T+uprdisZxcXKprAKnP4V9sohSTGniX1MN7
	 H8J+2qmS/MMaPJvNWZpwqnfAD+3R/sWczWxjTB4icKnSQ3ZJn6GMI80LFrnOD217Zrpbu
	 vlDv/aUsjCA04QY5R6VzTcWsN9pyLI4c/rgNaX+3lLV+u0Es0/WsKxmVEhmdMfkX9p13c
	 daJzhRigoPgl7RmrqZ/WK4DSvB2MxKyFyqfS+nKk/HcMlxQs27SPu0TPFIsZW4rvVx+vz
	 ITdhdxyftQygaeIv2XL9qnsTm0E8oY0G867Ki7PtgPU5GknNW/Hu9mlbSYJJpih+bdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvd4w0At;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2WL5baf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B0C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jvd4w0At;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2WL5baf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAHCI2881284
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBSuW3DJj66pWv9LhnTXClJVrp/4F7tizZPGCuZVtlU=; b=jvd4w0AtVDDY6hFh
	LiVK7tYp/2YXmymDlxhtHlCyAZSSvjiSDUMVzU+wdQ3aCK2ybKFXB723eXzKst0B
	tn35EummHhkTZcAQy5muxTHja+2W4hJ7yowhKKcg3z3AabUBI9wUk9Cvw0mJ3UvS
	g+Itlk7ZqfFiJ64ebGHHBn82ZsLInb7A1L9E/c7d9mYi79qcnEhdtb2k0IPKCcGh
	12sdS27F1It1Y5PzY9dUcRE3Nt/FRO7etVJbSH2cxFnjFKS/PdXsNFAp1uejEG0C
	Ci3ZURyKJA//mdqp6mKHmO7H4vUZuwVYVhBAM88XTL7Gi8BUEhv2I88E9AK2JtV8
	Woc5VQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux849rp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:56:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so2796489b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794322564; x=1794927364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBSuW3DJj66pWv9LhnTXClJVrp/4F7tizZPGCuZVtlU=;
        b=a2WL5bafQrNipdbZxvs/LTPTCmHGqm8LlkN5w2R+WHp/ZM42CbSJM7tQM9gKNfyeG4
         jlO4FIc6ES2X6YObIFs5f1CdYESIPLUxzMs6eABL2mBK2WVUAd4VhFIyEvRluIgxcmeV
         F1aWpUrP40lGTskPyp37lsydUZ0uZdfuriINAe5ZjQMmPv3vnFvxEJDj5vVpydryS7MN
         fmXD3/M7Iddsz5+HUeWwKVZchBvg0iicFcm1Mlc+YJrgJBtWJ/X7cASTzBfqxqnbxPQE
         io5jKDQejIOG5ut4K31vJRnRDuS16UusjVCExPOiE50D6lzlx5Rve226iNsngo/WX8r1
         1WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322564; x=1794927364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBSuW3DJj66pWv9LhnTXClJVrp/4F7tizZPGCuZVtlU=;
        b=Hyg2/4E0XXFPOTp1sd19SqqzbBapdPnoyo4NQ/52zW6EZUBOhPhoNGGzi68RLAFwxZ
         Y1mB/VHBnco3Cs8SOE+D8EPWftbV3zP8Ykjk4EfmwK5NbJ3/TdT5eJlddUlhI+Ah6IeF
         J/uRnrMimUL8pI9xWBYzQTKcxD06Mowna8/+sb9Qcx/6lNEKF9WHFUoLgbyeMcodLjhz
         xjxn0aiju3CCnfTzVOP5u7Nz9gJuLYygpShD2+PjRdTjiKI2kCeb0p2F71kQRg5sMo18
         Ia2kxYD2lw6e8oUuA5t7mG/kSKmGJBangVA+kiw8WlrdFlzNvD8BGKNv0yLF9wrHQQxU
         CcmA==
X-Forwarded-Encrypted: i=1; AL+hErFmRFYotvVI1RhB/0685Unx38JegAjzJINRTNxQBsxv1WxYfw1RPPIyySui+865IuhouxR86nvS/h6OOAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86QMsRwmh5z4coPHu0FE44ipfTSAKUF+fYvWHTWnIfAYAJV5Sb
	suNtRg+6U7yI8sOaooE0qJ2Xzz+RJEaaiwzBGTc2wtLRYxxTR/5bSOCCX54HUi4wQ+Cw6msX9GD
	ZlPsnfeLtPFRoVg1ATw8HiU0u/XHVpeVguzAnW5oIVW+RgGOCBhoITaEjxN9DMBAN61A=
X-Gm-Gg: AYBFou1JP8XXBBaTthbftFGpJ5stYrcfyL0WvmiukOgzKemxdVJgmbgu+ekRpNPOqVJ
	Zxw3QDRLhzESEHkhSSjw/QAmvV6tBb2XMipYB8hND8UxEQ+CdvGpLCbe85hZYjo7NytzhsKo2Wy
	I+arHat/a0t57QyNmiArS2G7+2SrI9kEfFrjRA4/2cJgxZdLwqBx4m7t2ZmBQ1ZuiElK4AKH2Kk
	upiOVRypz3XDvvqyyIVuFrbRb+IZaQzWBxLZmZp8b+hlFvYSNzJtZ8VeNkrWVd+YgbFDnQtVGiA
	Ve78cUzBITNnRoSPXfZNt62/0/WLMgrYJCONXhcfrBok+s9UsUuy16EOsrvAfZHrv3q9GKAEhVI
	AAme3WrSO9pivXnf8eaUpZfTRTz2mKl7lLnpC6zBwMkO0vEvWqpE3g9qhXEs0kXgdzhhjxegbkg
	b+GxI/lpEaLYhIfCuy6vQSpzHB8eJGvelF
X-Received: by 2002:a05:6a00:9289:b0:886:c8d1:632f with SMTP id d2e1a72fcca58-8ba87647402mr2915902b3a.42.1794322564295;
        Tue, 10 Nov 2026 06:56:04 -0800 (PST)
X-Received: by 2002:a05:6a00:9289:b0:886:c8d1:632f with SMTP id d2e1a72fcca58-8ba87647402mr2915863b3a.42.1794322563587;
        Tue, 10 Nov 2026 06:56:03 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b1bf1sm1005284b3a.12.2026.11.10.06.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:56:03 -0800 (PST)
Message-ID: <ec04f795-6cc6-444a-bbee-70c7982932e3@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 22:55:57 +0800
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
Subject: Re: [PATCH v2] PM: EM: Exclude boost frequencies from inefficiency
 ranking
To: Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
        Guo Chen <guo.chen@oss.qualcomm.com>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        xin.liu@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        tengfei.fan@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261103-em-rank-boost-separately-v2-1-5a13d1b38d37@oss.qualcomm.com>
 <CAJZ5v0hy1D7anTe=CXNXZyMNSN_yHh5hOt6B0bEHTEONRJFMhQ@mail.gmail.com>
 <3e7c3a82-6a99-4c2f-9568-2382ea77ba0e@oss.qualcomm.com>
 <1dadcd02-19b0-482b-b16d-293430227c5c@arm.com>
 <901516c9-d1be-4918-840e-e3617f2a1782@oss.qualcomm.com>
 <6b0ee061-38b9-413e-9a83-90446b484859@arm.com>
 <CAJZ5v0i8a98rjFdQ2Jhu_Xk=qCGiNafMfhzNs26cEJNCYB6Xdg@mail.gmail.com>
 <4f0c8581-a8fb-4bc4-82cc-d30f2f56d2ce@arm.com>
 <CAJZ5v0iX8wYDUo9uUjkqkKq1tpLAu7iaZk+iQzWGigNAqfrsNg@mail.gmail.com>
 <bb99aa3f-fd15-4bdd-9319-ccedffc281c8@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <bb99aa3f-fd15-4bdd-9319-ccedffc281c8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1OSBTYWx0ZWRfX3VC6MJWxiKml
 ddSmIv/PL/G0C+HdlU8R7F5k68821s/q1ayqFT7iXS2OH4FkfTYcH2qi3zoeFyXQ4b1Th5CgJht
 zskmqdds5nc34j7iKVtk5ggYGPJzT9P/3SOfWE3Z7/tx06by0OMa/6NXTDY22H1G0qW5XLqIxsv
 dLxbco/IQ+P0CfefgaQGmjhZvs0cZweWOc4WwCbfMusRdDsWYxlqqRvRKuo+/PjYeeiD2pjoIr5
 XjSl8lI0ZfwEinlJs5SL4Fx++tM9+c9yJwNaP9cK6KkdwNDblhOJBW9fFJVAD3YOr0JE+iFO4e3
 kZp0eVqZ3doqwlYNXEL5KXC2o21Rp7pbSx11qaY7RKpmqBgYBBsKSkSO+ABLkbjmUEwY986aTHL
 qcqPUg08HEY0rxPX8XSFDQWKGiYux32OkwmSfuKxMeczRzk6kMaPC81cU/h7WP5DHKRkD/a0TV1
 vcyJV59wsvKhsK30KkA==
X-Proofpoint-GUID: nimKjiQgxgEh6ca2C3-PEyK01bHqvO7F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1OSBTYWx0ZWRfX0vtl+zN+d/nK
 RAvrp51jF3EKPLb1S+EQj/4buTSAuJNu2aaI3Yyb2AC3gGCBOw8TgMfyoITdqmjVITdLZbL63ub
 0M9Wom55SFsTJBzxXAuNtBJgTvGQoh4=
X-Proofpoint-ORIG-GUID: nimKjiQgxgEh6ca2C3-PEyK01bHqvO7F
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af33085 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=rel-l89U2fr21mIbaAEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100059

On 11/10/2026 10:05 PM, Lukasz Luba wrote:
> 
> 
> On 11/10/26 13:43, Rafael J. Wysocki (Intel) wrote:
>> On Tue, Nov 10, 2026 at 2:11 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>>
>>> Hi Rafael,
>>>
>>> On 11/10/26 12:15, Rafael J. Wysocki (Intel) wrote:
>>>> On Tue, Nov 10, 2026 at 10:58 AM Lukasz Luba <lukasz.luba@arm.com> 
>>>> wrote:
>>>
>>> [snip]
>>>
>>>
>>>>>
>>>>> That's fine, please continue.
>>>>
>>>> I have a couple of questions though.
>>>>
>>>> First, why is the ondemand governor mentioned in the changelog?  In
>>>> the mainline, the ondemand governor cannot work with EAS, so it
>>>> shouldn't matter for this issue, should it?
>>>
>>> The ondemand is affected by the EM setup code and set 'inefficient'
>>> flags for some OPPs. The EM is also present for cooling devices
>>> and can work w/o EAS and schedutil, w/ just ondemand governor.
>>>
>>> Because EM marks the OPPs kind of 'globally' as inefficient, then
>>> they become CPUFREQ_INEFFICIENT_FREQ entries in the CPUfreq fwk.
>>> In the EM code we have:
>>> cpufreq_table_set_inefficient(policy, table[i].frequency);
>>
>> So maybe this is the one that needs to be fixed?  What about simply
>> skipping boost frequencies in it?
>>
>>> Then ondemand check for CPUFREQ_RELATION_HE will skip them and
>>> pass to __cpufreq_driver_target() with that flags as well.
>>
>> Thanks for explaining and all of that needs to be said in the patch 
>> changelog.
>>
>>>>
>>>> Second, why is the issue regarded as a defect in the code and not in
>>>> the energy model?  Arguably, boost frequencies should be more costly
>>>> than the non-boost ones.  At least the idea behind the boost is making
>>>> higher-cost OPPs temporarily available.  If they are sustainable,
>>>> treating them as boost OPPs is rather pointless.
>>>
>>> IMHO it was a bug in the commit mentioned in this patch fix tag.
>>> It is affecting more than just EAS or EM, since the EM is working with
>>> all generic code and all cpufreq governors.
>>
>> To be precise, the EM initialization may affect cpufreq in general
>> because inefficient frequencies are used for CPU cooling.  Fair
>> enough, but I'm not talking about this.
>>
>> I'm talking about a reason for giving boost frequencies lower or equal
>> cost relative to non-boost frequencies in the energy model because
>> this doesn't make sense to me TBH.
>>
>> And I get that such energy models were there before the commit in
>> question and now they are not working properly, but IMO they are
>> broken, not that commit.
>>
>>>>
>>>> TBH, I'm too comfortable with looking at cpufreq frequency from within
>>>> the EM code.  If that needs to be done, something is amiss at the
>>>> design level.
>>>
>>> I think this edge case is special, as I described above.
>>>
>>> I'm happy to hear your view on this EM influence to some global
>>> setting in cpufreq. Maybe it was too far to establish this
>>> 'inefficiency' flags in there for many usage?
>>
>> There's nothing wrong with using the information from the energy
>> model, when available, to amend cpufreq, but the patch goes the other
>> way around: It tries to amend the energy model with information taken
>> from cpufreq (in order to avoid making mistakes later when amending
>> cpufreq with the energy model information).
>>
>> I think that cpufreq should simply refuse to set
>> CPUFREQ_INEFFICIENT_FREQ for boost frequencies.  Wouldn't that work?
> 
> I see your point now, about the direction. Yes, you're right.
> 
> Since we are taking the information about 'boost' from the
> cpufreq, then refusing to set OPPs inefficient in the first
> place makes more sense.
> 
> 

I also agree this should be fixed in cpufreq rather than by feeding
cpufreq information into the EM. However, refusing
CPUFREQ_INEFFICIENT_FREQ for boost frequencies seems not help the
example in the changelog, because the frequency marked as inefficient
there is 4.0 GHz, which is not a boost one. The problem is not specific
to boost either: with 3.9 GHz, 4.0 GHz, 4.1 GHz and a 4.2 GHz boost OPP
at costs C - d, C, C and C + d, 4.0 GHz is rightly inefficient, but if
policy->max is capped at 4.0 GHz by scaling_max_freq, thermal or QoS,
RELATION_HE for 4.0 GHz still resolves to 3.9 GHz. I think the lookup
should not skip an inefficient frequency when the next efficient
frequency above it is beyond the max limit, which can be done in
cpufreq_frequency_table_target() without touching the EM or looking at
boost flags.

> 


-- 
Thx and BRs,
Zhongqiu Han
