Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8436A352
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791687; cv=none; b=OZo+2f2QUug35YaV0Lcwm+KpKjQik4Yg1+IAgce+H80B+o6pAtbTGlEH1iMkFrjkEcEjs6R/GfN89tiXTvdhC9PZgBYNcrSyR88mGF6qYfYqWSaZz1KRfuNypAgrcgkLK/jlOpEYpxt2crh95z7CJIg7ibcCr8Ifg2xvXxcJ0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791687; c=relaxed/simple;
	bh=CeOaPRCggz46p3spwHEOgqlgtyutb4XizzRTAZHvMq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra5P1xYuUoDR2PlCNF2/xD3UVr9jl9suKOjEmYK+4JNJyar7WpDqvVRlYDGTBivqb3GIL9icC7bqKRRaNZNCpIYq5+yV5H1lSrbxKAst/qGwznmv87o20G75b8j/ySnduwmqB1/zYXNghVwNjUGsFZwCb0ToHXTkYxhz3cebKQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLIvoTe8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diITGSmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLIvoTe8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diITGSmk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdLk8376732
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=; b=jLIvoTe8JcIGrIEx
	FKkVKBJKeLXfhi/O0xFuGAw/17S8IUgUXu0/sgdBfU4+lYbRKIFmCGfXoCUikKhB
	ChU2AGcBhSu8Rg0Eg13XffrN3sNxhQNi0FxuAKlHYQMu+BgkWOptV3x8N6XPDBAF
	AIy9lPxWQmVgIoMyo0M9V8FjEvvLhwMIVvP1PZ6vsb4YiU/6pp1vAUrkcNdbT9P+
	Cn4dOLyvr7Q894jj8PZ/FItStJflxBOTAwi6t9/hqfNMjonH7oWxmJZ3n7eVB1DO
	r5or91N53fbMh0M1lm83b313H/+3o2xAAIBBXSAkcGFWOqZ+39YNWoetPQjAeGHG
	tcZaUQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg1e4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:34:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7824ec38da4so79729137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788791679; x=1789396479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=;
        b=diITGSmkkLy4Osb4nCGjKOPMRit7PK9IUHCEYlpeM7GxNvfsBY6rmKXyQSmjGGGQje
         psa1eIzD/+uWft7s9q2B/RHhwUQoOW8LB+mo2GyDpI5VsRjeuB3Lj4emv6Z3XCHQ4TyW
         Dl10kWCAlL56wd+5n5hO89tP4995qBC7WlRz8AMgvPAU/zvv2T/ctlqiXAMUEhyoN8fg
         NB56sVMEckyTH5M6mPTzp1trunp5iWYCyvikCpZCGsQDZvR0MvpPIvTJ8kNYhFItdttC
         Xdmio6izfJt7HhOzCWqPM0BjwfE5YsC8X/+tmb1+vkcSY/PQxEYsZrfdm8GSpyxiT6KT
         er+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791679; x=1789396479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osuZCFvrB7vpquUKrOkkWHbBAiTf97Zyon+VcJgxcbk=;
        b=ZbVdRv/UlthxYEmazJE8pnzcWss+svi1TtCxj0UHDMnI2hRWfwc2jxhBCdncxjfaUp
         k+TIvyUkHjegaRwIsjjgZVmb5cbtPnlRZIX8pWRkyKM02i0QWDQFxZpT0uw+UAuGBDA8
         hWj7IVdCmVPGRVGo+FmpoAp8RqltNPyNASKJqvZQek9M6DQ7JpCx3C2gLlxR4wpA5WbC
         ZkeCQeLzDefzeJU3ktDbEGIv/iCL18G+WSTUzV+wANp+d0ZNTuRqLe3MKyUq0e5DuzRD
         +Wbx9czN9Diuvu1lCIUlJbYYkxh/nQOkZevjeiJ0vE6EXoyclNjCFYhnE+cADTJjzBSq
         Nrhg==
X-Forwarded-Encrypted: i=1; AKwUvBw0+HOGzG72EgGDbpvOadrttWCJkFi7UhzK9VSwvpw6/tVqy9Y31NzTBn5LUpFS0PH8NQ9ZIKH5RFzi3wg=@vger.kernel.org
X-Gm-Message-State: AFuF++nMNH2GaU4ldsLRVQTQcTM/5ciOZMgPi2KlO4o3Mf1D5DYmI+rf
	1QqUmfkrX5QEWxKNhWDNdATPU26PZECqZ0Ic6VES7+XIPnsf3i0cbtHNKs3C+HpI7JrY7KXpwO4
	DSgf4B8NKAYwO/9rI/0QC4LM4aLWZgNN+1HpL3u1BE6ZIZKn/d63/cYC4zNWnjJv5FWE=
X-Gm-Gg: AYBFou2sVsZ9vYFG3gY5rPCL09sGIB4pt+Ek04mzZn7uXFsq+SN9tL+IjLcAs9Z3LKs
	ANrk3vDMRPKWd+5gescfKwmWyeDYlDO1tngf5Az1k+Hxrk2mioWbZgyJrmxgw6t6iPrej8n4S9d
	WYGR+YG55jMv1kVHUi3sBBNdQ9HSA2dD7Kg+SZc7+TKHoK8aWmu2CURTlGBf1cOnOw/zWjmEx2g
	bugBHE25PlexH3Ajt9IoKTpR90v5Tl38unEDX3JInEKjGplkLVs6Fk5DjEOCj5Poe/3/pw6+7Wo
	eCuSsjWivdR9HiHqUAYeWNf9ZMYdu+z4QzHiIyB8Mh1zygdBRTfMzGofRZXsuMD/TYIMsmRCVwG
	/tAiAzVjXSapmyfz0TW6I4A==
X-Received: by 2002:a05:6102:508e:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a60ee3f0bmr1885960137.1.1788791679121;
        Mon, 07 Sep 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a60ee3f0bmr1885953137.1.1788791678627;
        Mon, 07 Sep 2026 07:34:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm485710866b.46.2026.09.07.07.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:34:37 -0700 (PDT)
Message-ID: <0916741e-442e-431a-9831-9457e3af1cf0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:34:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
 <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
 <86bja94234.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86bja94234.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX7Yf6hgrO7RvJ
 /6oKpxxB61thznsDpyM014sedBMtGh7x7javZOV3lmIFG/0Kl+OYJBL+R5BdUSPd2JVspQZH4il
 42P+zJ/fgyiMRy67bKK2oAR4soqg8BNXIJW3uUGoeL7tgrimK2dlnhRUl9NOIv6EunILs0N9cVj
 dfLyDYrSfvxe9PGBeDB7q+l1XsLikGGOS6pJ8xejQCoQS338LBXyFTgbxVcsZdL0kfQbnVeQjSZ
 PbfV1ruAWlc18BPysv4/6b6Yo59aAFS19yIwf10SVN+s4ZTAi6ZbEGd5p3m48GFyxGp14nMOk9Z
 iciTWRQg9E7OuaTXfLm9NF7oogoLE9omesBKHaED7AYNg/JjkM8K2KrTnusfQtrGKvNvhDS9Yly
 xDlHIqppNDIbBBH+0mrOAjFF7hEbA/1hHa8Fz5ml8mAZt9Tdxg+giGJSYy31szMOiJU2SxWmBUd
 xpDEFcCYCybp77+Xuwg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9ecb7f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=YAGKaBiEDj2kTEL75LoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: h4dJdhyLHi9-uQTI9til0635MuSlWLgR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX29/od3fs4aAC
 q9ElBXRQEBVgNrGwfMEOPIpTdlGGxdlBFTlub5FGKBx1i4yI5GvxpaenObWwNUlkQnowlgHTjsc
 Whgp+ps7LiMA2t7QXJ1eET+t993s8GI=
X-Proofpoint-GUID: h4dJdhyLHi9-uQTI9til0635MuSlWLgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070160

On 9/7/26 3:34 PM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 14:20:26 +0100,
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/7/26 10:49 AM, Marc Zyngier wrote:
>>> On Mon, 07 Sep 2026 09:18:38 +0100,
>>> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:

[...]

>>>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>>>> driver probe. This shouldn't impact or cause any spurious resets once the 
>>>> device is booted up and probe is successful.
>>>
>>> And yet it absolutely does break things.
>>>
>>> With this patch applied, the box resets within 5GB of heavy network
>>> traffic, probably because some transaction get delayed, and a watchdog
>>> fires. With the patch reverted, the box keeps receiving packets, and
>>> everything is hunky dory (100GB+ so far).
>>>
>>> Which makes me think that the set of hardcoded parameters in this
>>> patch is not universal at all.
>>
>> They are, provided the configuration is for the right SoC..
> 
> Is x1e001de different from x1e80100? AFAIK, it is only a binned
> version of the same SoC. How do you explain the above regression?

I somehow skimmed over the fact you said it's on the devkit and not
on the mini-x mentioned before.

I pulled the Hamoa settings I could find, there are some updates but
none seem particularly related (maybe the PCIe one? I don't know how
the network card is connected), please give the attached patch a try.

If nothing else, please "bisect" the QoS additions until it stops
crashing. Although perhaps applying only some of the settings may
have its own set of dragons..

Compile-tested only
https://github.com/quic-kdybcio/linux/commits/topic/hamoa_purwa_qos

The Purwa icc patch is a bit of a mess because some nodes seem to have
moved around buses..

Konrad
