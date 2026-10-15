Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B381387596
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075750; cv=none; b=ihnAbKXH+0l8P1pPBirMSqcSf/XJLeXMwxDAp+rOPwRU6+mnEUH/E4Kv8z5ytwujwSeVddoPui/lkOs8ji8GiGWoMAlnQVTvgV0lcybNK1z0saZyaj0Ssu6UPouAlYH7yA7eB7XmjpflBepkuf7On8BwCHmdraMlVa0EcrWQgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075750; c=relaxed/simple;
	bh=jHY2q4KRw1a+3cM8OlSYrnjimO30abUuFA2g+e/yfvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilpG2BlM76b6Ru3/vte+GhteJ3DjrWINtJnEUf6rFZHAm82TxR2ttiu47gA3vBCUuS+yRZl2S2XHbrP+RWv33W50UCSpgnpY15d8VGSGfE/w83J0y/ywkmoqRCKTPLmE475hLptASHSukElpXtcFI47yRmeUET3zijYwOR6DriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMRaOIGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvMxDlBE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMRaOIGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvMxDlBE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPwlP1596393
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=; b=oMRaOIGh/vAinRbc
	IIWDc0kEgaACGgan4xoD6xDYDPm+RzNyOkkz7TM51hbBKbOjQb1ILunCf5VbMU27
	sN3FAVVmoaU2fOFriiMN9P8xIiwH1+4Y9aS5wKiivJnqDP4DCqna4Y5DFSeFwBrE
	DDap1AqxDjV7beRhj3x3TKUxJ69iCO5SlSeOdmwmwMuVvw0cv3bQpv8TsFzegaob
	0EeooP4PM2j4QnWeyPeHEgONSvsfeoTRusutVcLXzc+1W/e92f2IXJOdiPMA4RfB
	ieflyfGRnweFPpXbDoSXHKTShXQqHER1p6oR3LMDFxUOKwLoS5VGPpNLM0ld1lx/
	U2iKzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v91pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so95002085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075747; x=1792680547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=KvMxDlBEGmP1aSNDlEzKZRI5ryvnlwJVwCNSHFWcuaC7ibn3t0l3a281057+KsfV/j
         OjDlH0q5DRmsNci+r7tWEL4mJLMrUi0a+KQUCUDLJwSAXhB7d6NR7CKKaIlQoqiLGjvq
         yS2bzpD2QqFs6oa1R0sZbp/IA9kGLq4ux4YEStJ7xVGhlEvyaP0+Knw/BrgJltoqM6Ws
         xQnrn4Y11qO6UWqK/O3lLIs0EBrltdjifM2fEc14g7pc+TYSqBaynL7jtIkuyRPYsPx7
         ktvGlrg0h04knHT3g16Ea8cT3FqvU2FZjqevvCabQ27Wa3b7vm0ljkB6XCr7CkSZbo1H
         1ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075747; x=1792680547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=tXkyF/5qRcTslTYpxbhbc3uc+ianLDgDgRGHJli1nGwcEMQjL5B8ixFpVxpayKsVIr
         /fpvr9/56NIfIusmmh7GC5WGW3noVmbZucY8xq1Le+tCg/zG23AdKTC07nZBA/NgOhXM
         JNrSp91PkcTghdZfwhhHCEYjbcyNZXY4MlNHCSk4/1bEjZq+sgFzhJY7RejG2TeGN7hJ
         qYTLAOh/TPT0IAWI4TZjhcrnU1NJt86PUPGjhXtgvHWV//gSTOOa9B7rbyPTjJvZ54kq
         OMSu4mEgCMH+UhejUP3W0371sQOEAhwtAHXOsqaoRUev9QR+jn1VAmXp8DiPlSlmhsfy
         XD9A==
X-Forwarded-Encrypted: i=1; AKwUvBwZHFN3l9Yd1xkpSS3gedM9gKR2abokY36yoNvQTDY/8QAD8rJyyGbbXoaT0sxuGTKydYbvccXE8baIg5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxeXjKXTxF2jehXoH7yv0yBHSMJyYk25AXzFIYF9zNFSZeTAdV
	Uw78F0GwqSrl3dFY8QUkBOy/5ThZLxB9VIKh/ijogI28Si/ieckKKCPFVMXWfNy5bhmOf0p0RVY
	6tNc6slzsIDzkfpu+PAXMfeMEz/XSraWGdGaKNRPVgSmkXsW6ZwXSp8S0mKwElSFFTnI=
X-Gm-Gg: AYBFou0GX30opCNaA1ECq/mnKhzA+QfC+dKhBnYj9hYYShlnYWnipk65+9kHt3cCfdy
	gLy0w/Ew5a9Nsvxedsgi3s0naxjlo19x0XumTOZ0jvXD1E9ypIl/wmFqsoTP71AC2GDd52+pJNX
	PCG69uuxFLEPQhwDArGIZrvfT1yQRgdmPPm9N1JIM3zfn+qfHSB5undavLoTdBLwj3x/3QwTQFw
	Fu5Y2T7bG7vpiO19kGzRFeQ5gEwNS/DTBVrer2s/fG+swPAFXFS9OGp9U4MQKkU63fWV6cKLIRZ
	at8wQU4bH9pf3Mdc6nxCSdfhwqiAiA07UIS8PH8Z9uP9rGLKzXHIRu94FhrSDhWj5nlucM/GEWN
	040lZIBgDwr2o7ix+TcAhMA==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842943785a.1.1792075747447;
        Thu, 15 Oct 2026 07:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842938185a.1.1792075746898;
        Thu, 15 Oct 2026 07:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm7442501fa.30.2026.10.15.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:49:04 -0700 (PDT)
Message-ID: <300889d8-cb0f-4939-9b67-c60d0b1499d3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX4uhSe6AGBUIy
 t3wHV6a6C9lX5hqVGLuQpMU63Soa+kJjLRBMHShIK8LIGdFfMxOunvdgdTs2LF34HUpQ5wN/5St
 Sqnj/ivrzMICanWM9vTxCp2jVo3LInIHSuATmUXCMPFgmuc6lqN7necKjEn+bbwgeNRXm+Dq4OQ
 YULiPetRjIgUAVMYCKbR7rVBvU7d0EqnV7mPoSv7XB4OXLwsuNU31jxr64gZFmrkX3F8t8g13Rl
 U+6wsvqZ9whKnNCVWbSo1ZGdRNM19RciVlkz8SONesgP8OD+E1r+GtQFThDI1Pm03xZJSZrjREG
 kYosekmMJdLjKvbWTY9FoxuDzGgynFIsqRjYPoMOOoHwlw/++9qciKcK0osdbXTQW1mdPFXCp6m
 pe7n8nH5AdRgC7bHI6SnignLt0w1kt8yxN0tLz4OTb7xqYkBbKaPNhrhl+MYSo7nt6oe8f8Rn+Y
 9E3WGcDu7Phyb47M3Og==
X-Proofpoint-ORIG-GUID: 9Mh5zGx2L3iFjorSZYu1kOaLvvy2BSvG
X-Proofpoint-GUID: 9Mh5zGx2L3iFjorSZYu1kOaLvvy2BSvG
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e7e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-rt_0zctJVaUuj_7EdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX3hyITb8OOseP
 CrTxEJN2V2ijiZsC46hm4MdyWq1Cq9vT3PFADyqMhwmgB6y6v4XHa/wYJBHrapincBlbfKZZsmc
 7AG2RsGOBONcyY+w8RILYth2u5blUIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 10/15/26 4:28 PM, Ilpo Järvinen wrote:
> On Tue, 06 Oct 2026 02:50:26 -0700, Gopikrishna Garmidi wrote:
> 
>> This series adds initial support for the Microsoft Surface Laptop 13.8"
>> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
>> cluster2 fused off.
>>
>> As on the Surface Laptop 7, the keyboard, fan and platform profile are
>> handled by the Surface Aggregator Module over UART. The rest of the
>> board is close to the Qualcomm reference design.
>>
>> [...]
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
> 
> The list of commits applied:
> [1/5] dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
>       (no commit info)
> [2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
>       (no commit info)
> [3/5] platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
>       commit: e93536b1fcf775356b06ddc845461e64d4c87313
> [4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
>       (no commit info)
> [5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
>       (no commit info)

I'm hoping that's the tool acting up?

Konrad
