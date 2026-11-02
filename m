Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623469;
	b=R8oFaPETem5j18uOf5o42exf4yVcpbl/q86mQt6IPPXgilyATWUyhYTZpspPs6A5PYac
	 GLZ8uAkicHzq032OLtDVEWaHRZuaUG2h7fevQ+0xMVQ97UHZbTOVLiGiKeK+i50SliUoe
	 gtX70LDHUzJ2H9GO0+8O+U5FvttMbGCk5aDinFRW2PcV4AZx0NIZw/P3qLQW6xZnZy5hz
	 DzO3EEI00//BAWNX0NX5h6jPgrz2mN+MznRtSRAmUn580stsyWmaABSew97jXcU3GueR3
	 uaxhD8hJSlFSQ3eK/AoV+o8nCpwufwF4avcFoZFLSVvcbZFrpp5KvL717Qp2mAl8vyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
	b=pDEcS5wLVXLzLqlNjThsLdEe6HANtBsgPGPHUa7k1Puq4NgP5sjWjK+cYf5qqywf94c4
	 0tLbritY981TSqGqLA/46bMz2v70xPXo+AGzKLGMmxavdZ3uxz3gvBlH6I0L2XFnEaDGw
	 I2NyEauQvFh4XV/Iwys/S2X7MjgCzLn43Wyhg6r5DG1+LO5hmOj37QBTrOMxW0zWN+xCS
	 I5GX5Sb7uDGh1As4gMl5CmylwZc+6DsTWDtqCiVhEoGTrnpf06e+BHKO5Y+vd9h5SAO78
	 yGgiCmK/DoKwChInATjAGQ8y5s+jEJSJCKtzsLF7PfIsEl4gs+MakcA74rbF5YapOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE33606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE33606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALPY1821086
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=; b=EOioltV4rTXNoKF3
	ipmP8gz3lEBkTW5wy4eLvI4Uk9sWVyL/sio7Fh0GJKxk5fXSaL0VhZlQ37M5gKkl
	utI1djX5mcfcMR2+HBR7ym00h560mBPHQ18bsMi/7RC38I0QdVzzCaVslhFxPB8g
	WOQ8v9kMSmzZEf1Jp88whqKbJ/1aklD7VKWlFCwzgWhsfVoWp2Oiw4bKNw404hw6
	HfrnjxMrD+UPUO/PmrzmEn2hqobqG7OY2RbeXRZ+2UxMZ06IrUJGvsgmVvVdvgaB
	C2SVui3qlW+SumQ0SbJk3E6Qz5H/SzHMVgy3dcp4nnWhlThLJ6KEXmc17CFlcK+f
	ur6lYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hpv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:44:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso18297985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623467; x=1794228267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=A7QlGTJTg1R7aVCIxrZBno96wyT57p9MR4SyTVob30EUPPSoSOrERvCYWxWjWVfxtX
         vRfgFikK0k5G76xM2d4jYhiJymFPWnXigQ1jPCl3iohwDdiuO2MttOCSMRve8gRyM7Mn
         nhB87XZnpJqf3ciYGDiP7t6AUdFmZWBM7hpdN4L5qTZBp45kJuVLplZ1N2q1Ar8CSF9p
         D26ml7GQzQ3RGKyZHBgso6ACO/zP+FuGRWVGvM7B7sMU8ziPFRvxF4D1uEAYX+lVnuHg
         HJ5ORisL/e2+33bdKsNvUPtFIJTRXbMwLOyRR3L4NCJsQYP/l8jLef0Ele42dGrM2icI
         ydaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623467; x=1794228267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=Uwy3ONK/TwdO9waVFDHm/f0XBQgqwOnYf3qfTtHAaFpWwhAtbMyPVNQbWP/Jd9y419
         BeZ2wRHeoanPTeYGZ2tFyMQrrM0/b8BVhPDZLV9eu4SYkac86lCAptv8nfoyUlvbkfxU
         tz2eO70HgKhTZgjrn3IUuiAymeIxV/Uaywp/77Gi+/KMDH1P+oY/HAM5EjZvX/esM60U
         ySjLushI8Ys9KvJkuFxPAlAsnjVWz3BnNj+boYXq8Q8PbJKJzl96b4zTMk9+Qn24+5h8
         ypfQCAmzd0V6MSqDOsWDjGc2FUgGWxFCEIEzQaHcYkhc2xeDWawXQKqpPhZsNuUSzTLz
         IS3w==
X-Forwarded-Encrypted: i=1; AKwUvBzqMWA1r0YHihQ5OnmB9DhTu6xzlJa5AFz2jeluIP5niGQfadCnfGXWoGbTKiy7qD5DErszQxd9Lj4oAZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrwyQ9CvbpYQ/tSfd2P8yxXcftKgNmB47ZUZfyJC7C6hbN3Pop
	hVZQu+1t5CkafALOkx8eJVvaUk6UM3RQ+6nn7Bnp27R8qhkexlYlE8vf0ydxse7SztGIX4JX+sv
	WzRAbidwcnMQKSwyNUyjVXD/Pr24j2xMhzq5CvfN5IuZnaRC+P1CoO+pFQGxlBbdQcw0=
X-Gm-Gg: AYBFou11DcwckoHOcnLFXGI3io6J6nG3owRM0B1F2sLTofSQ6KHglZvF30FWLwVK9ku
	h4eM4V1fz3uYI6E1NDuwqtgkzPeI3+rpuj3MLY6nrTmPNXbDjxuKUi+S0qbnl6SYjR5MlLNTIA5
	wLxC98XCqI7bVXrIANQ3qiZ/918jot9fLoGwv4R36/MLZSq3ByMhW2nPAqgNl4mjgyUw6RHy3Oq
	kHEccfSGTWoD8A/YMqofgwyoS664BpS4eJyktDRsu9CUdl6y6oWD5yaST7qrZp6rzTyEzoY0We4
	pIz9CksDRneu9NE2rSQ2uB69EJaR5B3Q5oJ21Rt8rR0rpZCEC2dDMQodxwk0nYlkAytGrbjwIHK
	29ZcJd351PBrqubW2Atk72yLWKX2cY3efT6yPGtsw07KpD7kiKPXAlalwmfRpIpswFB2KOmY=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564911085a.4.1793623466934;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564904885a.4.1793623466454;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe101d4sm389225666b.40.2026.11.02.04.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:44:25 -0800 (PST)
Message-ID: <73f05be8-6335-4d48-87fe-71ba5fb1d2c6@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:44:19 +0100
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
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RAfF9ljN8XBQDkB-RTWMiilr8G41EYJV
X-Proofpoint-GUID: RAfF9ljN8XBQDkB-RTWMiilr8G41EYJV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX/zqG5TeeRvwH
 IgUhSZAgMy2EFCiMnPI/lYdvxhwWTIyCqCqAcGGd8rpMWyGcSoBFqWX4nfUVCyeP7K+sr6UxxYT
 iA8CZBOOuS1KznPJZe/fYgj8DfpIrm0=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae885ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX0iDnep08Hq0t
 QPvnBFtRvX8ontqtGxYgXVCcsUhy1jb9Qne3KGPqEQYjpKH13caoAzpu7yZsK0xrkcW3bAIMsNS
 jfwjkoZYBrtmRShaeeTRRKQOfpi/fbsveolN42tJmu9uv4993g7zBjdGdS8wHlNNA4ezR3Cw7N6
 DX8gdaofkAe5vvVEgrYts9O5DzqsRhhkDinRFGeRCr/67L7v4VLWyZhDnozntEyarN03IfOMSbg
 fuxaQG5NgULZWCqEtj9V0fqDT+j8mEwHwDwDWkSHBHLhrbhy8SiEKIefXDVV2i7x1z/NjsdUBOh
 ZwSdWxuBOrJQ24VIrleJqPxCaj6209vkpBaOA/M0AxHGFEjECeYxhc8UyCxO/NArH0RweObHlMq
 PaM3BJsaa2LEdJNhSbrNQ95I94UG0oNe4BgyXau4unWii9eaF3J+l4nKebogpCkyRmQ09PADjUU
 phaVGbjMauNFmui5mjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
