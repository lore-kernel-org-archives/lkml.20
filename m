Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660069;
	b=tNMtBmMrxqtyQigc8B6oPfDGdl+0JXAE8axgrONt9BLk/Gg2CcHTKJ9MPQt9s5pX/HQz
	 sC0WamC+HQbwlxVNKYGbf2VPTO92dxdZjg2JOmWhG6oVuajoliqQZBr8kl2yKuf+HAB8a
	 Z+QZfQJfMG/RvLlndwAO6TJRFk6C15Q//xFpwek76aSTlbtV233s3hqHf3Ns6G9xGUgv2
	 kkDrhl832PYkKyXgUYQaHCuvzqzP1FD0MG6YusMtLgFLRISE6FdRtzQnfCcirmy90oYMn
	 7fD2jwV18gnLdbgW7J3uxC2uJl+OMG8EaWqcRuIB6S7qYaZSAYo3JlcLfblDvxBa2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
	b=EnQb7GH2aO2Oer1XQBOoRqc4t+uBTjFCuU/vRED+EIV8zpQVmrp30r+H/aIjJCKhf+x2
	 oEmLhroj8bvSZGmNsMoWmuWhBW8ATPnGl9gg5wX4lR0EW5F8vjq54BukRc3m9qust5UMh
	 9s0t8CytsWnDvpROVg12q0mLmkdM0xdGCVyhL6D7EuQYGMz3RW2swt3uqoSbQ8Vbhd98j
	 BgrHtMS2WAc3sZg9AsFrx3VDeUb/ponoj9itvL7Gtpa5mgEFkNs509RJljE1tlpeJqMr/
	 VTqRVdiBw2MK/DXPJM0bgt8V6b9fQGb2d9ONBOF+NdKWKny2tFXhLhksFn0uad/VqXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778C606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3778C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70SYD4113275
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=; b=R4vyjIq2Cag29CA8
	G4x6yXFU9bVRvJaCxHAHKK21/QDksBa4W3iQwfghy4OArd1fa5BAEKpgNFuMm811
	s4ZDQkT9Q+pzZ5EJSN8yqQQ+aC3d5umK7YrCL5VNf15qEOzj5NmSjjiM+BomNkXm
	KFdAQEJYZie7sRvpKs04i++qDNl2H4HS6U1+yiJINSiBApcfSR2BKKFJ9Rbs7neA
	eylqhMXVkzVtV638K/yOFEVmjZuju2tCXHN8SNpAzbITz0TmuM9KM5P4uXCuBsxl
	Nafotz2yQ980oZBjQYHLbTvGak4/gGUS3eNhz01F1IGcQcndKt7skDzR/su9U7UP
	nQzhTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso48456485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660066; x=1793264866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=EunLO7FC6tEUbG/IxFwpfvusOCqC43hYuhEo4vfvPmUPiZChiO4Pjx4bBcID9E8UA2
         HJIW2Y7CYSTuplHvI/s6iNk8ZhKxec1EBoZbxgErpKLG4TUqFKRBJSI4AzkzL/rCr2tW
         +r3R476asrvw0fMpwu2rw+Mm19ODh5S7eRAmEUKuDwnWctperTu1/+QCdTbsnkHi8nGT
         6CGD9j9Wwfix4rduGCwUCJV+twg18Ty3tSx2mvvfpC9BoGWbysWi8X10cacO1J2ov61v
         GuPXiK12eGRrsOjt8rm/gh58AvSTHoU3t8gdgCDemGyHOWNRtfUQ5r0p4esbDvu8ZfSe
         lmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660066; x=1793264866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=ejsob+ELxFriy53nALvNVAzUSIWckbFvmq9aveNCthGFgPiZ3vvo+gDZlLcRFfxixL
         Sz3hkZo+LNgQmJwK4VxQFII8/tR4FdtmqHe36r69e5B/7sGGN1tMIcpJGXUJqA5FIJ51
         NHZqM5BztOwRFdKiEkbYcus8WQTIRmbNyZYNu+karYtv4chny4/4zXAOtaHEUzwUeKVn
         AinXBMyLrCi5eonzZeQTMlcl7kEdVKjXGOEsE/vKzkIE07NLvrpzd72kKX46VIhXjzV+
         yNN1S4L6NvpkAIJk/42FGuP2JmPj9rYZRR4YwoeqS52Uz81vmVsh/SZ7kYq6OHUHGSEl
         cE1A==
X-Forwarded-Encrypted: i=1; AKwUvBwHwVumG+coGVj5NsQVcH4y3DItsBQ3TwBijlTMXgDF/nRqK7xOdYx3tmlInxQg6eEtyoWDZRYoPIQepwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWRscUGeByM0Zri0CNKbW9kLmPKKbmaXbxlQ0WuI+mpYtSpJDN
	F0YyTaNbhgBzlCQ2uLFwg0n5L6fZflg4fg29mTV0MS26Alt3CUT5hsJa4C9OcabJM2r+zAjPUmn
	wR0JW3E75VoFG/gH7rShS46RgOUQFH1FJZDt+6aYIVwxeJeq9qSE4YK26GTeQrXKiI+M=
X-Gm-Gg: AYBFou1x5OIRrv7INmcpcybPxPz8M+QCBy2ZkQLZl6Zw13NLlrlFABHwr/+9FGQzjzc
	mvc5yPSBzU2vmAUzM1P9Mit5oeNjP7FlQ+R2Q+a0Mb+tGulG7Ru4QmtmlkCkS5d1K6V2cNT/nsS
	sVZpjDiRj7FncPSivjcyF+dUPJ2z/VoBPud9v7rd+3/gIYc5fZdle5pPzkh9IA1uR66/yMx8EB1
	wJxK1+UaU4NV68BM+RFP9nZVRKPnpO6y7UC+1jj+hO+09R7yc7RvX9S+MOLsN1o7gBxLbRhQ1vu
	LyjfvSnvGndTbTWGfjzm1sh5Xnh8RcwrARsle6EMMYm7iOcOa2iDSIDDuj7cAQr1mG/demq4K+5
	rVnqP34gG9OsEGf6LCxxbuw==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955688985a.2.1792660066453;
        Thu, 22 Oct 2026 02:07:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955683985a.2.1792660065814;
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85290266b.24.2026.10.22.02.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Message-ID: <8cc2f172-0df4-4494-bc1e-3124cd25afca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:39 +0200
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
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+91/eXPlMmFb
 +Ab+IGkdPuy46t6WHljn5xQwdsXjnhL0Xd+5ZNJ8l9HxgesFl8ZGq6E5U7hZWQ9b6AC2kefDJIS
 QHZ24NI/oCmfDwNKTW77XKPYSKb3IakUZmL1ARhxBd7wCovWm5TpyK2spbEc1DiPqAkKWx+37J1
 TC4xsJInV0KW9sEBSUL3/srhCr2eYjNziMTcopev1KqEpVkAAqZUNxrDnYJiTvWJ/GwfUSFlH9D
 wV6x+JbXeyaW3n7ceys+aSeKRUa31z2jyUk90HxvCiODDmt++i1R2XdQrtunW6t/SWNxgrT0OMI
 IteGdYoNU1SkGVvP8SMR3xdhVTxSR71i0Ghke4DqkJxV3Kwf4HYBO7CK0AhayRID4JawJt3cigJ
 dnLPdJRloN3US6W8qYG2MiY1nshJMhsD3A4newK4KJx2izx+wC0ZCL0pM1rY32C53zmY5NwLQQs
 9kJzWGhWprLT17HjoTw==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d263 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=amIBzKCq339hV6VJ64AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M7DACtmR_KQL9exPOMnWl3OwVVkpCVez
X-Proofpoint-GUID: M7DACtmR_KQL9exPOMnWl3OwVVkpCVez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzctq3KTnTMgV
 qf1IGHbg+p5m7vX2TkY8N4/jcXb0+KUpuvDmH9v9qdIDS8UfdOSXTinz8BoDhIAmSCy4OeGVUmv
 Me0/cEbGsQ4eYABnGKZL+btoaNK5wF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> The SDM845 HDK can be fitted with the display card, carrying a Truly
> NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
> and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
> bridge.
> 
> The configuration follows the vendor kernel, with the bias rails at the
> 5.5 V default of the LCD mode.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
