Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF404BAA1E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446463; cv=none; b=gIuovqZF2T85e/Q739UGhSxQZsfvxUqV7ucoKNNyURfUkkcFR5/cI3hC1vQnwFqaXwfNxwuR2sA5Z38NOyqNaKVEcZe6I8moAErr4setIOQIdtQRrlabq+O1o2qbNZl9mhcKQNhFvsBPFPGja70H/LEnKNfVaI97W8Ag/3wsww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446463; c=relaxed/simple;
	bh=gi9mZjH3jh34DK+gNA1UPkWEDaxFzIUHDuBU6k1qR0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxwxfGDf4vd93i8SdoYaGImyShjoJ2SnX8lY8mX9jeT+zjekxdIJFEKlJ5FRBEsiibJv1ZtigkT7Mlvx720kv8T5dZVj7/DUKR1vfAWWlhJls0R0YBDuBwE9DAIoyQcf2S1Lw1XvOJz3yL1cF9F6CjTqWH4YGME91aMI3frPA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBK842fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxbUoW4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBK842fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxbUoW4Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAR1M035590
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=; b=dBK842fY8gNu9XDN
	zoQ/UYkuTkfbiLqEi4fBQCgGl9oyBZdCDJmCFcVDFZFjvnJRgMY9MPDQhoNDCwbZ
	y0mHOy/k4LNRG+bpWh5Df1Wb1ArEMLzE5G4brP2JMUWle0O8Rtgjdhs19Jdfesqg
	cDG8Oer+Vn53UWUFfedl77YW5MjCY7LOzVoIvj7Xkos6DqbkOI0j/TOqTGcwsXs+
	chGCtnybaWc+PM7RscvWvIspRJZLCQ7v03uOvljsvfCrHxSLyBHccf188DZwK+DA
	gExti/F1jJGJsFNp6vObuyiy+HUdCU13YOHDqYuaMxhhi3kNU80Xv1yVmTw4g6PN
	XbUPMA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1kn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:40:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso96992137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446452; x=1789051252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=ZxbUoW4YwJJlDwOLWm4FSL2NyKK/vyGbL5t5hnJzOvzj0w4s5y9edXuC4k9eiPlSiy
         SPw2Dh/hj9Ho6StS4KfcU+ngIwfXCEqCiGdF6aDRowTHWVsd4IXHYi255Lcg/k6O4hrN
         UF9JCw1e11pZJyOm5r4Psw+4NGzRD3Y/BBMmAbTZnrilt6pcNB8xfBt4t9Oxk255imFB
         7S26UiSKGovpd5mwSGNk8TSfyGAuP3JWV9Vgp+Fmt4fB0bvOGnhXxHdMJxoKBhFyNrnC
         1drvGz0Hyc0Jxf+Lpj3PXxUiZ9d/ctNLnXbCH7XQWmTP+hCDcNrPCRv8Sr+PZimTj1Oz
         Xi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446452; x=1789051252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=O3xHVj8WDDDxCxHi90edn2Nh0L+dyr/DSrbHrnLFW/bvcXk9BPuwK5p/XXOxUh/T5a
         /7OFcoQjHSJR2fTzByHTFD/D/crRRs/yT8qyBdsEhMaauYQ0l+MpRUTfQqelGIgN2v5y
         /rGa/4XIp58u2XzcOl0tzB3OEYfwOm4FcCrMvZfB057xT0Vj2Ixk7+HZCcV89NfIZEbg
         9D+Y63fbxQoYROMeIYE81/RUduDPNWPVQk9EWHonlwXESWbxHiwBabRr+mEkkNpNOl0Q
         KdaJWTpf81J2whVK6lLSF+K1A/I9BGurPbvgdSEF2Pk4397AbiHte5nP3cf9Z+vmDird
         unFA==
X-Forwarded-Encrypted: i=1; AKwUvBy+yxyVGHtez87Gn5mD3MbURnPCNW9S7A85AHyNqmLiuiuutNNLe3jG/jgpqB9X7leNbDcJn+9rnUCxvhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kHfv0jsnoEjFrVwoLXf3ytIKhkQulzt+w1VTB2dwHAVX29+dDV
	MG7S0NoY0xIlUfnUAGhPKqfRXGQeC7mbsXzMrlkel/M9CzDHmYcX3wK2CQxuKkt51F5FKIR2V3R
	ZVIJHFViaeIHQAWPegO8vdg5K6piD6Ygqb2HeiUaYN4OFzRNZvAkdtQ0QNyj77Hji8eU=
X-Gm-Gg: AYBFou1fnmnh3xqp6ejhcxBX9FDVzEovre069JbOLLarcpgR8E0yFa2d2RWllEAU7KL
	JrfOqIepiZUwSaQ/xXPEcvkTK8O/9XCV3gibFezgW40xCRw0Sjheh8TGk6uawjmAzrwz/P94AvO
	+Qq/IW5y7DeoUn0euMHc3h3FLuQ4aARgEZRbFfVBGTV/JOtfWQKVrvVIOXeHU9KjKUWvLxEfwIh
	eZBxFsIi9JEaNiXhXoaNdVVQ+0VnsOaQW7VO9Ttcnyr86P8HbQRh4Vb6uLn4Teozy7Em3Hnao+P
	l4YM/fRcH5/KcWXgGHTVrSG1mRzO++cCfTuM8pizWwi6Uvxsms/LPiw+0wFpD5VBveM+k1eqEGT
	8ag+EtP2su4nlImjs/5OAPQ==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626568e0c.2.1788446449939;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626554e0c.2.1788446449511;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705866acsm147251fa.18.2026.09.03.07.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <a5d83aa4-7065-47c0-bbda-35063034b0d6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
 <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
 <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZlaDGGp9iIcW20WVYDalXkG0E1eaocB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX5Z5lWmuiU41k
 ShuAvCELAKDWMTsaxvQt53e4Cyl1bcvmefO5x//JvxWyyGVXgZpkChNBhb3iUsy1IpTdE4QSnwA
 HllSYnqYGHEqE/jiM+rI95bdPSAB2fzeHW+lmqFYQxnx3xYv5TpLvWGCDp3PT3WYHuc/RUg/XMB
 dBwG8qLAy+qipqJ6k19VsJiW5RgnO+X2DsNL5uoqQ1Unv40tj6BNJQosWmpZCueqkg3AUdiYSrj
 YXuakhugqnAAQzkYFqQCJNiCXwbd2AUSVx9lhL0H2Yi7sNurK1+wmJUGHkm73I0bBL/uxaDy/H3
 LieowybGz/TJmBfMHKmeCPLN5XbxLe2luuYKzQM0n3sZaRuhWSReiF5wAd/q4rFiDlgbEIVYUOG
 xmiCkSf0NmXqfdD4VLkvq8HSHaPVkxzNGBxLgYm8ze90ad14jXbExScxU3Z0PJItnNNiXa9R04m
 HvYfpe5RN6JCpFXNmAA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a9986f5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=z2R-DqfiRA8ArFDFZ6YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX9KWM2KuM+aJ2
 nmKb80purVj/9+5r42AbGtj8DasADSM7h0xyilAxcFGCSIMus8yRmNnkkZv+ubR7iV+jw7jcFHb
 PEjF8MMLOULVbjkZ86zQV8q+bKsSZzU=
X-Proofpoint-ORIG-GUID: ZlaDGGp9iIcW20WVYDalXkG0E1eaocB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030127

On 9/2/26 11:31 AM, Xilin Wu wrote:
> On 9/2/2026 4:43 PM, Konrad Dybcio wrote:
>> On 9/1/26 10:47 AM, Xilin Wu wrote:
>>> The TC9563 PCI power-control driver powers off external downstream ports
>>> whose device tree nodes have status = "disabled".
>>>
>>> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
>>> powered-off port functions during PCI enumeration raises an Arm SError
>>> instead of returning an all-ones PCI error response. This prevents the
>>> board from completing boot.
>>
>> I agree with the premise of the patch, but I'd like to understand why
>> that happens - do you have any details?
> 
> Unfortunately, I don't have further details. The downstream kernel also includes a similar workaround, so I suspect it's related to how the TC9563 chip is designed.

I'm curious in why the port is still advertised on the bus if
the i2c interface writes some magic bits to "disable" it on the IC
side.. but perhaps that's just how that IC behaves and we can't
do anything about it?

Konrad
