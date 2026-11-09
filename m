Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233186;
	b=E2Jh0lB9u5U8ILnefbpSOs5IdSZJGzHiILvoM0j9XsNvsFIVfK5JRCcZeImK3OXEuP+m
	 jlutkRAc/KPbClTm9PCf3NuUSNCEiYsGQZkiabboWrAkPuRG5/gyI4ZWFbIJY5eWv6Tda
	 YWxMB1BkBd1VQeb5tiDBMMAPF6kM02aRKLoxEqJ1cnZrNaPisk9z8RuwBaH9Otj8on10q
	 VjnSl+V6BIqkkXEfI6nogczVWm8rzhCquo8L6S/Uuj/IZR1OUV99fOAnsLUVdFUMfUwHQ
	 GlEiwFEiFVzABQzPiXn9K3p9A9QE9mmT2DUxPlJbIKa2H5Gr+k9DrOTH8/Ox1fUhF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
	b=Kcmv3N0ucnY63S/pR0G+m33X0lhIvf8OxxF7Oa7w8ya3gpNFPt2MgCVxJiaya0BR9i7s
	 Y0GyP8FLOvI3c6vk+FA0vXT6/al6fInBZqaTFxKD8DMz9IAllCgD8Z2/rBMpFiIh66Q3T
	 FncNI4H79PRa8TSAGPtwN6jJXqBINFu0lebq3Eaeaa+xoEYY3jSSPCMMdLuuwZFjRdgR5
	 fy0zM4ew+O1XWd2owZzvl66tHMFGt4+KZwmz+Tdm1XY/WcQNNW8YmWul46OF1MxKvxz5O
	 otUkT3UwSuHV2/GkeO3yD7sV933O6tj4caW6vjmpX52EVQ2UcIq+tjbrr7yNSHw5Aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83511606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83511606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2r12928715
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=; b=pk+5LGwYMAfOSXFA
	lecrTQTHD6VN3Lmy8W3ERVHogoxBAZJ1A1qTiGq8rGTwbGZHTJOM4gK/hVZMng2d
	/hLXksJJ2FQIwT50rDlyW9JkjHHr4FSthKCkNi0D1VwcshthvB4zcuwz2Fhz/gx+
	e6ca0MF62VNUL2A2gQhezg4RDfbM4YB5VkkEep9oALmlUBbKHlXGSf5oyOAfa3xb
	wPeMyTqKsdm7KX/AjraZ5/LRui/0jHWtnn2CPteSmveQe0+AtdnsrQgWJ8JUeYo2
	55ITnY5cWnOe0EOQVCvtYsTzOkQYIcokK+cIOs/3lo/bI9Gn1OOzFaAWIJRmXESw
	kZHkVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8rvgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:06:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so27095137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233185; x=1794837985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=JPdOO1fQ255VZVDrnKHesNUXl0eflubl9d0pDkGDLqlddilLDRxFRU9aq7FH6kR8rF
         H9DepIE0Kpo2s/8rbWea4e8F28QsdV+lfXm9HeYiVE2d88lNZi29JUBEcGraWhoRYr9A
         zEA3SeSZfhQzbDt5eC/UxKoXNSATL3bUKVLHIwZaG6gLY4YLnxRsY5k+ANLksymrWEoy
         qXEhmog2nmrhoOHknplkVQ2NVVn/2llyFTU/3C/9yaKmrf3+/WIoJ0qAuLHR2lz7ws/Z
         cQREcUZr6mE5F0UOd7YFdd7c6aggvzpmM8UkuDCQEeCF5Z+GMS8PPHA/ca+v7DxzcTyD
         2zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233185; x=1794837985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=pA54iPnIJbEQDHlQotMP6DOw37RdkflOj1JORe0Oe8BWxeouNJfkDehL4EltBlgR4G
         NQLEs3INKBfxvAoSTaofHCaUuC0Nm+21EgfD1+PfFFJbwLoF1qG7LSFpa4FGQ1Gj0qKO
         CyNC2a4b7n2Gh9A92+WTPDDcWMIRSlDTK3c2/ZPs8VKyPC+Mm/w1LTDM9xW+KKBo1nGd
         7zaN8WPe4+wv7py9nDGHAjan2B+UkD0Hk90hFPmJPE0luWqcyiogcR+U0rylMlSQ/QVb
         yE4aNVXt6Wl3N0R557BTuojLZpHmCpf6s2R5o+lOI984/GcXj+InEaP3GDGA2RyJ7vYi
         XsZQ==
X-Forwarded-Encrypted: i=1; AL+hErEh3JGeCHNQCkoNK1xBlKAJKYmPhwIJyHcTdnA3df28Jj8vMgfTFa18/loPq2otz65aPbr7nQx1knLGSSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mU/LgAoUXBO5DVEnZ+uwQ0BPrMpKfDSDm2yswyFR/ylZ7qaSG
	cX9uUVxM6SGVfi58+ViJ76crqGsYDYr+K7wuSO4WXOac+YKpnjsAS6Gm9A7D/EMC9U7S7gQgIYP
	8b8n6cbYKWoX4keb9wTtoGQEqdUIhg1Vy09I2p9FHZOY6WWcpjAeEdHnDPX/g/7I4sWE=
X-Gm-Gg: AYBFou3YFZU6lltyKB4d8JhRBg3rV91mGpRt1wIYLLwyXWe/uW6QdDJ/ET1ulKkDuRu
	dO04XnAerd17spevdjaHDQBI6reftpcXZcV+6p/fS+jWVi3k+slVAJ6AGhOnfUu8yhqJS13khK4
	w5yH0h9leAS/pNDgPgzOfp0Ee3wbctwqTzjv0hn8Hq89HPBXhfOjrN81k8RhTHxsgqCfQIMnnY0
	flSBRZnDBCxwhHftl29Dm3XSORCKYC98WSv/rsw0V8EIZDGj1wwGofPGAoW/GLNoPJxT7WGWJMG
	jgzcVibbIDqxkSd8UpX9wMErA4MmKd9u9zx9BUkJHMD1lzX2/Dcur9yv4uWm59ioK6goqZcEfby
	WL+lZSDKOah+YouEfmIN7qv+Xij0H4ONSi3Uh1oTxvhDWV3F0O0XXHH6n6Fh82ymjtM3tnQ==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947692137.3.1794233184538;
        Mon, 09 Nov 2026 06:06:24 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947543137.3.1794233183505;
        Mon, 09 Nov 2026 06:06:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721c8a9cbsm1525983a12.0.2026.11.09.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:06:22 -0800 (PST)
Message-ID: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:06:18 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXxSMWTohmdWUV
 TM3cFpJzVXKPrhbpWpNnnt+dLblaFT7WaK1PB2r6OUh1TZWqKS4ukAS/6cD7fLiKMiHr14bIkwi
 Fm0Q0Sk8dzQ/UaII+/2ZnPD5O+8xF+FJf3rXLtlViil+BNkBO+oAH2Sqd0ZVCEoS91ydYkI1sY5
 xsumnHUjVHVgJ4D6DXsUrANND4pTRu6S4aOyul4IB47aN4greYMQdT8XT7s7zPp6h54Ph7oXo2G
 NWew9EGtAmos8wSFqY2/uk71pPffaBl/u8u1rpw2/GuxOzagnPj94KS62xeLZcYVzHW8gk2w8AA
 2kzOwvuy4p9b5GpunxGUS2sFj0WcGKrd89T80MgE+DSk5d+e2wd+7xYKLBufqpK02o/4tGya9Rz
 W/iYTz78qKd6uJ+2S0ZMCLgccCN5ehjiJLzcyX1WIgp6I6C370/+4JWL7c9EaSFBjKo40nknbf4
 w8Ke+mgwa8+yCmO1q3Q==
X-Proofpoint-GUID: THLSPmr2MIcvs-20DJe77yMcrdhzoERR
X-Proofpoint-ORIG-GUID: THLSPmr2MIcvs-20DJe77yMcrdhzoERR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX+V5nFgNcfdDs
 zmt7AQ5RHYT7Rn980CthBcVX5Ap1rh7VisWW+KxhEjs+KQUDqMSp2XZVhfWloTtdifwWRK3xVCq
 8zxk/xJ6CMWV76TLFcr9BUN52PDYkzA=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1d361 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tDZyZ9LLp4Dxownb6IEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> On 10/23/26 12:35 PM, Jerome Brunet wrote:
>>> Preparing a clock protects its current requirements, not the resources
>>> needed while changing its rate or parent. A transition can temporarily
>>> use both parents or access an unprepared clock, and a parent rate change
>>> can cause other clocks to be programmed too. Raising resources one clock
>>> at a time leaves those operations exposed to insufficient power.
>>>
>>> Failures make this worse: hardware may already have changed when the
>>> operation returns an error. A matching cached rate is then not proof
>>> that resource reconciliation finished. Retaining a temporary enable
>>> reference without a corresponding prepare reference also breaks a
>>> consumer's normal disable/unprepare sequence after a failed reparent.
>>>
>>> Make CCF acquire the affected tree's and parent paths' resources before
>>> notifiers or programming, and reconcile them only when the walk stops.
>>> Keep fault recovery independent of rate shortcuts and subsequent
>>> consumer reference-count changes. Require explicit recovery of an
>>> ancestor's uncertain parent selection rather than reporting success
>>> from a descendant request.
>>
>> I don't think all this is necessary to address the problem described
>> here and in the cover letter.
>>
>> IMO a new provider API is the wrong layer. The framework already has
>> the hook a provider needs: the rate change notifiers. What the core
>> should do instead is fix those notifiers, which do have a few issues.
>> You are fixing one in patch 1. Another fix, about setting the parent,
>> was sent recently:
>>
>> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
>>
>> You want to act on some changes before anything is programmed. PRE
>> notifiers are the right tool for this. The user of this change in
>> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
>> it, ABORT drops it.
>>
>> Also, what is acquired here follows the requested clock. When an
>> ancestor switches parent, the chain of its new parent is not acquired,
>> although it feeds the whole subtree after the switch.
>>
>> With notifiers, the parent fault state is not needed either. As it is,
>> it blocks every request on or below the clock until the same switch is
>> retried.
>>
>> Could you tell me what you need from this approach that cannot be done
>> with (fixed) notifiers?
> 
> I'm a little worried about the ordering there, since some device
> drivers may also be registering listeners in parallel, so we don't
> get a clean split of what PRE means ("has power for sure " or "may
> not have power")

Do you have any thoughts on this? I'd like to proceed with this
series in one way or another.

Konrad
