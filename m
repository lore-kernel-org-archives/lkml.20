Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB794C10FB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062382; cv=none; b=bcWSPs/mwm404wf2h3I/VCbTydkM3fxNG7Fbbkh7++z/UYORvbsqAXIA9YqX8XEdNsXuv/GcgFK7vDk7I+NddiIB6JATJRSo/V5Fc5bzw2P/bEta4T0712ZCJvhoIh1aztuohbzbiN1e5OVtLgv6BkJW4uoFDmRC0xiR6jx+VwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062382; c=relaxed/simple;
	bh=udTCXoH2ys2FdEoRBNtdbhJ9j02RTcL6VxtoF7/cxRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgQItWGF69Ux/Ndoklq9jBCJm+CEXCA/iR6Roplc4uoAuGjFNxdecrFfPWqrvsbQMwgadD2M2L/WWLZRLEyBv3ccxHc/UlAxeWOLlQK6CO85rZ3GqydkOa4W4MQlKpvVZUIo7h7L76pMKxEaIJ3bzAWcO7wyu975+DSVdAYVVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIHXasmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqTyAww6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIHXasmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqTyAww6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOoO2114149
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=; b=SIHXasmoRyUIV08p
	WIsNmvIbkDCmlJTcWWDH/vBGuX25ARY9bmlRdiZpN4xJl40j08Go3G7TJu7ip0J7
	tlHqKn8pG4c41IlHWlCqI/7FBdwTHJhJBiVgN3cafUAzrov41ilKQ9k/srbjiylG
	2MdcnJdS7WqQhDArjyYcD6J592cJnym6OzODFBVglydQfP6QjtbyQpr1efHj69D0
	ct43yDV0rF8fkJt7PSjfK99fXDzG+Dav8KfvkBng5K6QIo1JYmcQdmxu6lnNQN5C
	EfZTzh9fVMlzGogPw1UQXrAYStQXBc8zUbSnPYeU57Tb6oUytX3JVpYeigGZd1+e
	6dJVqg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyaqb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d44237e2faso265949e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062379; x=1792667179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=;
        b=OqTyAww6BbKHtop5ocGFl1s2Sq5mF4nZ7KAxnQxHajjhqm75qISsPBW2ja4/DRNfYG
         WDIc/t97hDNMzVHwWGvwVQ5aawFOhGUMFg7hhHr/q1C8SJJ3MgL0B6/OgfrwhNxeztus
         D44FqXAe/yObijcZWEfToHrnzHy0WUMClNABYO+G/sL04Tvoc7cY3W3xFzD3qZfZ5Nti
         Xng1M0s0L54B8amOMapj5GWQj1+b5kAPfHgyuW59IbKQzssPMpPAGREjXY4ts0IuNL76
         7yeh9jnGpBqTE5VNpCCe16YZR86ug1dVPBbfS2iYe43HUQlWT+XyqKAJm1z69RNU/q/O
         xbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062379; x=1792667179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=;
        b=gb5jjcDy8QOFG9DuCBlBIDNhOjaAU8dyz0lUuwNqQLJeNr8Kr6rJ2iPlowh1BqOVx5
         yd+I/f8tr9FzWWDVEWyeV/gAlXZBbrIyQEufCEOrQbHFhsJhnRYR+zLBFCQZLTLTVLva
         EPirxt/hMsGHgWKS1QjimLF8xLokAd+chgXDPi00nvr+y/OtZToDSuhkV1aa32y8gKfo
         YkDiJRxsiBMKVI9lCbX9TtdkRZbR4aWKIrDX3O1WDqmhWDPCfOyLLbTCdXFi8lZsj6NS
         Oat/ofVQngHKndAW7c4SmcrZaaQI6RR+xOGgs3dOvQmIkm2Dx7GIRDrPRqYI3YTwxrSO
         ncEQ==
X-Gm-Message-State: AFq9FYLd5k6ypty3NbKHXjHM0UFS3sIQhRRdMoQ1JR49W8QekleZ4bbG
	Z2/vL3U9FE4rqIYp0nQZRPvBbK6QTzSbpk/dvbQpDQMPez5649PTQoPQ0UtHEpRTDZ4yWATqgCH
	F9/w/tqUtNSkQhVHtbqO7xnROPvebW0Q4+ZhII4zGHoFOlHCXV9z5eGqRayy5xc3QSBQ=
X-Gm-Gg: AYBFou1YYrtif4m6BNkCLQjjcEf2JU9dr2H/E2kNdxRR5h7iG7aNKS1lvF9Uo+Mrb6n
	yEGGoHHhPS594QbnRAWOCyBq0gv7BD9Mr4VrtsPx8UV442i6PWdNamxe2J6RjmFyO7lgobe0Jor
	jLZp9jLaNMlGbVLiJMJ/VIgBD04jKyEGOPwaS07OYiya5C8LxAjMnpe0E3kYVJMAz3faemX2wo5
	2+38NvFKESlXdRO19sc/FaZ5BIwhvdZmnoj2RmceKQNd/BrSbaXJjuOcf/VxSZGIgXbv+2zIGVC
	Nsqn3AqdkFw/zd4yysduIXri5fnCPC8w6k+5haxymKtoxpNXnhj7RYjHwY3Vfl1/IPeW4kCiO6n
	YwosdoIXBu+2nqC46FTRIxQ==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3996586e0c.0.1792062379122;
        Thu, 15 Oct 2026 04:06:19 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3996576e0c.0.1792062378544;
        Thu, 15 Oct 2026 04:06:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e42csm111355866b.26.2026.10.15.04.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:06:16 -0700 (PDT)
Message-ID: <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:06:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dG-hm1N5ARSGdD-OXSsfe7-ZOPoTP0nR
X-Proofpoint-ORIG-GUID: dG-hm1N5ARSGdD-OXSsfe7-ZOPoTP0nR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX4Vnj9cnH4q3P
 T7UWl5KiPRZ0Dv7nzRrhlRnuNEJBdEs+oH7yb5zM3lQM7zwbVeeF+vRZiXREaZ6u3boQkn7z7GS
 eBr6AeNXJiABhAfQ1P3/RWGEoJ46A68=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0b3ac cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JgZe5hknAAAA:8 a=LKHdihu55Qpm22szt-kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=hhpmQAJR8DioWGSBphRh:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX8sAyLSYkEQW0
 pE/B/uXDjo/1mB4EAe1a/iZ0SEpNOvBLJAybv1Hh0D3d/eFmfLPf8XrwFTbkO6N/x0aMeVG8XNk
 7Dmq8hvKUX2LvDkTq3ofBJ2Ik1qBNI2VUaVLD/iRhCPUWc9Wil2xxI9U+f/W0jVbjDF3PbXMnMu
 fWrAqlpqeCebFUJ2O8zBLYb9VU1dk1K9OmAo0ViKpx0z01j0k9kMi1CcwJ+Vr7ebCfZFhaPQ6Oe
 Wczkc8vWp05Y11DFlTaP6SkrSYn/WUFe2lGiR/El+WRPL/cqHESlGVcFOn9b5bD8qC0vnkzGy6Z
 b6blNnJLIhKBBCb/GEu6jNcRcvxpCzVnUHxiJ6lDM09kwe7kq3hBc9tHb3aqZWUnuK2CvG2ENxB
 zxX6rBZeXmj5yQWInLbyneFk7ZsE86EOvlT7UHj516NYeTCBjzXDkavLk5OQpyy84iSWuFIPAG6
 0xKoY/uPsHFRWddXciQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/26/26 4:00 PM, erebion wrote:
> Configure the required regulators for Bluetooth and enable it on the
> Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

[...]

> +&qup_uart1_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	/delete-property/ bias-disable;
> +	bias-bus-hold;
> +};

I don't like how these comments are spreading across the tree as
everyone copy-pastes them. On newer platforms, we settled on
setting bias-disable everywhere and there don't seem to be any
issues. Are these edits beneficial in any way?

FWIW I think this claim of lower power here is just preventing
leakage current from a floating pin.. 

Konrad
