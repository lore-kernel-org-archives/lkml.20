Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB352E6CB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092227; cv=none; b=eVGBhQXYpPxBNjq5QbQhWeEjUByeaDUxQJOK06I5Oe9iVWIJZqbNumAfBrwwA7QlLNE0oORLU8pDsrWDBBi8nbJVg/C3s4A1gR3AuAkWk0/IzC4XwOvHj8j+SwdUC7UUgAjs1JgNtUPAipvMwppMmEvRxz6x5FF/XdAqwQChBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092227; c=relaxed/simple;
	bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMdZnOmq7bzUSjAqQHJ6CXNeEOMoL247WU8ypmHKKzp0z+o4wBWM7tO1A11vQOqJj0ui33rRqghsAK2o4WOS6r8F94SE7rfR9nfi17bHOkY1g0DSvKtvQED1HCDuxIJkMDhKMuUYfm66vjKjr8w9/+PjxF3itmT4kSKxaYpNYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDdWO0Ic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE3w7XKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDdWO0Ic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VE3w7XKs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEiq161584001
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=; b=VDdWO0Ic7hA9Za6O
	IHoZeJ3rjcok56tXS59Jzh4iBsDlb5khUy68C3lUw6A4snHF9AYKwx70JjQl55AP
	VC7CFoRFVjlwDX+5ydi4AwGC+06upSK+9742XEEcz9BnnhzuPsyIziW+YWYjW1FA
	DTNZkdIwUSj81AVMv1B8EBtxIp0FXJd3QFumDGRU0tqL7wKbL4dMJmCfr4RtC9lk
	QV0jwfDMR41WhSmz8xELL6oC8paFwVGrRM+KyJZG+Ms+dtVGg/vs+buJ1G/aYKJC
	kmuZjYcd/h7mdkjK543GR1rEARtsw70ouyMgUIQGuwOtn4NaOEbqn7Tev30aZWfT
	afkhxw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycsfru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:50:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so239594e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092224; x=1790697024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
        b=VE3w7XKsjFuljv+iJWMeMD9wzhDJD+spPkf1hJCkxp6wXQJwdTWMtXunSVCMpOti+K
         8DoiATDRggO+Kls7/BmYrPIMaSOw+DPogvuDKQqW9rVzOU+38oJ+MVEjA3KPXWpWoPKb
         A3yjJevurvBTwpyNrVm+cQ371XLnRK3uLCDwcQvVYsyGK4m4q9htT4zdDeRqSUiMj9h1
         NczgYqKOQX7t/xabrILptslBMxtLOfPzXuR/63tgho7Gybq1EL9mfMsP3zHQpQ5Hr7Tv
         f9EahACGiINwgALyMbzNNIyF3+AWebnPKebxAzKDsNcLghEqdNlH4xWa2G5JaSSU5t5l
         XwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092224; x=1790697024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oJvheW/djXhg8/qTziYpmXK2mHsppGLBw1ADVXJEV4=;
        b=oLTODM9w7k5fZZxknrJmPH+sf+N0Ne9HondKJyS3oFTfD1Y3PM+EbZnvB6S4nDVuLb
         jbty6Dl+O/Ph/Ll24kI2jg6JhFF6EBFPTg+w4aS1YmF0GBNBPhvUNLox1EeI8s7Cx2ON
         CdBpOxHLb0uiO5YVm2cc11pr33CeupgpIXoJQj9ohef/NLudCfD75P/CoeLW2NMvRJB/
         Fo5hslXlSV7kcC2kFdAvYKXEuAh0E5AQRJYMwUplsUZjvFqwFtcawNL3Vb4rZYegqAgR
         ac5lfMvTZiinOl6HxGDlPXgDExM+RRvDZhoN8yjtav0IBStt+TIg15WfgfyUkuVOgK5x
         0vVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXjvjGJC/hMADZXlavu+TP38q4rPxTjC9k4NpNBNzgOO4gG4tqMidGUvtffexXeJQg/8Q29cPjj/RM+xY=@vger.kernel.org
X-Gm-Message-State: AFuF++lmrUWdNqTd97FT59HKOZJ/m4CewHaMXQnhm2iqZyESXiiAnp9v
	HgrUdTA9VWFnDAb6d4bWXkZ28EgroufAr6mXFIbqkd8ov5FCUo2wgRZEraecwpQY4NsACEgr1+c
	QsFxqmWQ9MMOX4OzUnSffFVLuLlyklOoIC/1j0EB3lKo/bpZUrbp/me3nqx5ToSQKJ/g=
X-Gm-Gg: AYBFou364FwWFUwORTI941O0zDGr9UXORaLLkG7F/Qya7dlPm59nJcd9l1ASfMfMDbI
	JzhSOEbpf33xBaajOjJHx7iIWKTgmVyFMQfOb7SY823nowRO4uhqrbbbeL7r43mTUARhuSZsEMj
	3TXMQTHxAcbroTDvd9rGGU4Us+RquY4KcpUbs+A7lVg/NN+TpQ5bOXwmuGaWKHKyKZ97wL7QWt/
	spaXwZuaxgHDW9nI8MrQhOIyblMQ+2LVV676f/RyZwPSJ31Gt0sSEbZj1jLRBws1cKWlPoOEsOw
	YSj8H+u3V2uUiI1X4704CdXXeYHHn4oQBfOG6lQbYwcSw1XzMrmKVnwGaoSvReWDwCF4CUL+zW8
	nEHurTvGrKMvHYFY/W/bwZQ==
X-Received: by 2002:a05:6123:585:10b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c9b8b29c32mr7575993e0c.2.1790092223951;
        Tue, 22 Sep 2026 08:50:23 -0700 (PDT)
X-Received: by 2002:a05:6123:585:10b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c9b8b29c32mr7575932e0c.2.1790092223502;
        Tue, 22 Sep 2026 08:50:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d21fbsm1423207a12.5.2026.09.22.08.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:50:22 -0700 (PDT)
Message-ID: <3ae1124a-e070-4641-8a25-42cde4426f44@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h04xgFecGRyDo8_3i4gEJ1PKqPVbxDem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX32OrSWZHnVAB
 XFXLPHhJeLkK//TGwLDVsh9lq+utWjC1UXFjg6F+6mUV94EfB3XeA0qCtmPPYWFDFqyoC52o/iH
 r61lW3QoWJFaqy4RLi5SJB+qMJd596435LH1DLG1+yMFpwSw16OGDhZWJhZ9MFX5Zuaicx4SGrW
 v+Vk2C/A9HsjmCztu+dP8InrnYpEOEDqYBSXPPmX2e7eGAjcOBLbWM2lkWdxZ/TwIArnbw8cJc2
 goGH+2Qw4UrTl4liagx3ABT9OsvsJyWOEWS/xLuxGp3EBwfxcvzMSN9WTlzSKg1keM9YmCPlfCe
 h+ct7Pa3mC/sOOMVwDtl6s8ffPFTXm756ovnwtfGhIa/Brgo5Rlibb6Rwyj5Pzs5gKijYoYQd/O
 GmyuEx2MKqVKkkwCy3sf0aUXMy6ClmwTmZLa97be+q8UyGcb7g2z38J6WZed+oIpg6ZDy8c4RKz
 VwSc/YQS1Hg6mvjehPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX1APegZn7KOFJ
 JeM260HpUTTGoFs8uG46tJeGZP6pvQh2E7fo25xfBCPcyp6O4DdY2wgxw6o8a2b7sD6P6eaMaAq
 rSnaVQJIaaEZ54UkYa0snNl9AUvQuJY=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab2a3c1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vs6MQZ_DPklQwkS87yAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: h04xgFecGRyDo8_3i4gEJ1PKqPVbxDem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/22/26 2:39 PM, Rakesh Kota wrote:
> Update the PM8150 L10 regulator maximum voltage from 3.544 V to
> 3.3 V, matching the supported voltage range for the Shikra IQS SoM.

This is a good start, but please mention explicitly what
constitutes that range - is it e.g. because there are
peripherals on that rail that can only sustain 3v3?

Konrad
