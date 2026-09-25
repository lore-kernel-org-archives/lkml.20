Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ADC48A8B8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329869; cv=none; b=dyAkhtuckbHMMSvBelDfrbzgfNwPfVM76Gq/Aoxy01uRgVbvbz2Szyk2PCPenH3fQ/qOR0ZF1nW3skh/jPEAwmT3j2CYbt0MDAsCU0y7TxuRgezRDMPf6ZugrqmYQdINp6MUJ2Qa02pd0KV0DdkYAa7CY/8n0Js9NxFYtEWvGZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329869; c=relaxed/simple;
	bh=MnksAUFrnZoQ453I02yXVhjqgK5PCtlmo3eJI7f8BhE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qCNvFx00vRUoTuADizsuM9JJz0mq+9pU/0XTDceQ1mb+hB7uGA3WR/mQ7IW3Kooyqx/S7/LpS2tiAa+dMQdV0rbvV79iRWOBDxL1BzRJiTTd9ms9J64yPZqnMVEv28ayEAa54zXdrJHrR2yBsw189K5BNtDJo0Txe2byZ1QB2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJpZSQnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rfev45nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJpZSQnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rfev45nd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXV8289462
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=; b=nJpZSQnVNi0hEPhw
	6j2LaXbhj3nOebH+M45W9Aqf4MNtRlbFHkhlkUmKUSY9qPlaqg/ykbN2Gt5CiWuQ
	mRvODl98id6WkCUdsC+jVRXk3Q08EhvVpfYVOFhGcmwDgvsmdyzIiABNKZ21xqA2
	jJFKHeUdozDf/uqPJH0si8Aqd6BD9QzzPHQKlxe2ON0RnMB3+rciB93PLthR7MhJ
	hIZYnC4PZuuCfi/sXFZwlak76CIYSsoOdFZo0QzG7Kt4VagTfKgfJfAhLMxqhbeL
	+D7FmEtOrkpSA24WjttEibUvg3jy5eI2YbL/1bn3P1gz1ltmsxhxOnvGJhQivwcD
	1AuJug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881u092-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:51:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso108654385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329862; x=1790934662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=;
        b=Rfev45ndOtKMAHuNEhO/j39BQfh7PPjS6sJIMXOiY1GJ5ZU13LkDwVlirrlZVNhtfV
         +gX9g6ipFFHHSl/kUMdw7gyL/DJf2I/MCEkgY0Xpf4BQ6WAnAZ/ve5vtYA4vdyvbsomU
         2fRVLVAVNl6ZR4IJHja7AzezuWavep37+FF6gAvRREkbnEdgk0LHV3iIz72hHvrI0TbY
         G+zv2hfeQxzeM83PnNGrK5iD0thF15t9jzveGvUVxUoLez26ueDmorZZvvzw+3D31pfo
         hj2p7HBRHuTvGYJlne1O85LMNH3lkXZRmbaOb3vD8C1h/AxbAMgctLTMkcGJh0zWN7Ie
         1R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329862; x=1790934662;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dy2cVZV2brJV0iG/A9GNVh8lIWJOu8EaAs3R96TiPCA=;
        b=Dmi8+SAq/2VogMpuheBnHOEGkk610Mp1UZNrdycVKgSdq+ywTmvPMJ/qCgL1/5oiql
         3jDjWZpEe6gz5YxwKf8PzrYWCK8HoQZgSMAzi5gMo7Cuh0z70P1rS9qQxTXNvXqMbY1Y
         rBoKSjxdfBepEFdazNUugV5+/3+y5KvqPYJ0oq58FyPlNd3dHRiw5LvBMYRwXsdMU27P
         3hD7ksZWvRtKjpJNjADem1U+3/VRVqi6d4tnHHwt8zxgC39SZiESdDhVMZe9M3gn/6MM
         B9fuxMRkerE2dvET9yRRSgLciZAMVEuH3Y3STJYGEJppzjYghGMVFRD48inEe1RMIs7L
         4kGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyz6QpGNL5VetNMxHJhGl+rqWCgFk4Ag9YxAfeeS82qd8jeOSBc1hwHKS63ONLLU+YzGekirfYHjjubH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mEw1u/7eDc/kpI/Bx5RCPuOtA9Lh1FbuOMxay9VxX2wIeulN24
	6ht0TwR8kjf3JBQJPQOXV90L5hSC3fOHcUqZ+MfMSW2iShjl2WMI3RFy1OblA5YaJ12J4ekkny4
	G9E0KkBC6R9SLONBOqB2T5FY71NLXibGG0ijZzxlg4Vp/Wv5OeaO+RtTy4awW2801x1U=
X-Gm-Gg: AYBFou2Nw5NElYk2SuU9ZIWCXO9Sj0PJ0ogJlb1LnYa0P13ve4AV7npbVTZdGhmh675
	Q7WuZ68OHm6IonZ/sEIoc2ru3N3i6OOUzkbWRJm+KfLU8/sengzJACf6BNzvMK6K2GvNbblYDG0
	y4y+A21PavTW3uXtr87Olr7ZZLphh7Abba5WYJUdGLXACOQvGaHmb9KJ52k0Aon7edsic7Ji8gg
	agdIx/X472EuoZWhdHn5Rk45Cn/Bj4YJEDgTKxm3PTZAhhfgtlN0FoMt8tkBg+GQQW2HUm2OFNP
	fLq1ftL2Jfp+02TPFvbXZtua2eq41UwIVM8ShAjrVSVZPffMGTe1cRVRbY4r1YY+PmVt2PbMtvI
	R/mmwKL28qdmPjx55F77YfPeRfrDhZkBQuvkMYU1Ahy0126esoi8Go+w0pjMTx3iR61Ir6Dwvuz
	3BLfX+YigTT6u+LoKBYivFGDl70767DsvDfGGeDNxH8I/OHaFlQFuKbLXTC4N4aukRxw==
X-Received: by 2002:a05:620a:1b99:b0:939:35e5:94ba with SMTP id af79cd13be357-93c43b82bebmr319157585a.6.1790329861782;
        Fri, 25 Sep 2026 02:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:939:35e5:94ba with SMTP id af79cd13be357-93c43b82bebmr319154385a.6.1790329861314;
        Fri, 25 Sep 2026 02:51:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a4b0sm89001266b.60.2026.09.25.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:51:00 -0700 (PDT)
Message-ID: <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:50:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res
 wheel mode
To: Roman Stingler <roman.stingler@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
        Erik Hakansson <erikhakan@gmail.com>, Filipe Lains <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab64406 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Dp_lu2mDYKKqGQaK_HcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXzmDnZsxbfuEt
 xprnJN6pMgtBPuL4hLeNhGxIm4FAP5OtGSFPk1ofL9Cw008RnFuZYo3SPdtafmRBzAKISbAg4if
 MKIANDke4xOrFLfiSnpe4eyS6LifdHXR6ZlBXcCtX43TZEiJ1xjlW4WVIupUXcf9vOKMzEN8MEK
 8iBfyoGpjuS/o67CDceh3JEDtPCnleQ2Po48rKoQV5qDFisNHoKJWd5rysVRhBYeTqJS18iO41N
 +svfu9MUbl+oJ7ygN71iTqhAQ6M9nFJW8qyVSVJ0a5EhgQUK/zoEiNlqm5PW4820XaV6Ma1KpwY
 6Vltl571+cbndN+VVIPyrxOvg7I/Bm3Ob4H+NrzkrA3/pmF6xyLJjmZlp3m9X5kv03U11eOy9Oe
 EiEMAu9EqpqheXXr1vp4AAfbP39sSHXyOHt7PCQcqqUri9OnPnqHdC+FbInwhMX6PCTjPSw1lsU
 3jpYDDFj5MqVXzEqPyQ==
X-Proofpoint-ORIG-GUID: _iSRSTrRHXU8Nbw7AgBInxvpHhGWojxA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX97PecUBC5Dzl
 1g2JqHEMVn1sHRpgZYFD6LzZvwNYZqnDW6UbqVhmIN6ZGrJkAt1YCTOqyeTVWFVq1gRh6vtaUD4
 QTf6RB5a87RPFe4F6v5W+L66WuRrZSE=
X-Proofpoint-GUID: _iSRSTrRHXU8Nbw7AgBInxvpHhGWojxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

Hi,

On 23-Sep-26 20:11, Roman Stingler wrote:
> hi_res_scroll_enable() unconditionally puts HID++ 2.0 devices supporting
> the HiRes Wheel feature (0x2121) into high-resolution mode on every
> connect event.
> 
> On at least the MX Master 4 that mode is persistent state in the device.
> With hid-logitech-hidpp unloaded, a mode set from userspace survives
> switching the mouse off and on again. Writing it at connect therefore
> destroys a setting the user configured, and does so on every probe --
> cold boot, receiver replug or module reload -- so userspace cannot
> reliably keep it either: it gets no indication that the mode it set has
> been changed underneath it.
> 
> This became visible when Bolt receivers gained support in 7.3. Before
> that these devices were driven by hid-generic, hid-logitech-hidpp never
> bound to them, and nothing in the kernel wrote the setting.
> 
> 0x2121 exposes getWheelMode alongside setWheelMode. Read the current
> mode and scale vertical_wheel_counter.wheel_multiplier to match rather
> than forcing high resolution: a device left in high-resolution mode
> still gets its multiplier, and one the user configured for low
> resolution is left alone.
> 
> Note this changes behaviour for devices sitting at a low-resolution
> factory default -- the kernel will no longer switch those to
> high-resolution scrolling.
> 
> Link: https://lore.kernel.org/all/20260920094508.39682-1-roman.stingler@gmail.com/
> Signed-off-by: Roman Stingler <roman.stingler@gmail.com>

I assume the low-res mode factory default is because not all OS-es
can handle hires mode (I guess mostly much older Os-es cannot).

This regresses (new factory default mice) to no longer support
hi-res wheel mode at all under Linux, even the non Bolt ones even
though this is only a Bolt issue.

So in so far as this is a solution at all, it really should be
limited to Bolt devices only. Although I wonder what switching
Bolt devices to the hidpp driver wins us after this patch?
Do they still gain any meaningful functionality from the switch
to the hidpp driver?

AlsoI wonder if there is not a non-persistent equivalent of
setWheelMode, that would be ideal.

Do we know what Windows (with Logitech drivers) does here?

I cannot believe that Windows will not use hi-res wheel mode
in that case...

Regards,

Hans


