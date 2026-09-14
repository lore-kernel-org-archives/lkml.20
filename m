Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9846D0A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389061; cv=none; b=UMc5qNleb7vpAyJflDmM1XWFDP/Quk1k5HUx2bEsnEB7xp02LAJe2GL+8dsvslY3/ohwzh9Vh2Nl8rngQo2VKmcQ/ss6GvHW81Rpu3DcAU4opdV9yx8lP1e3rYU0MQFyvHgFwl3+auGd0FiCbojcozM5hr2zruWNyjRsT5YqaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389061; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmiLu8ynsmUjl9adjSolFQFkb6e6rCN10SweImFZVEGoKsEHRzg8raxkvhLHEjEwcj3tdeKsAt65p56JjUUmY+mNrzncObQolYWPxe20gJBWQFRzsJsdl7I7R+QdedvZ8HU1xU1qJ9s4VHxxRVePl9Qh8d6X6ZYUfPiHW2oJb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3+NdD3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CV9xJvrN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3+NdD3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CV9xJvrN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2fp901958
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=V3+NdD3yWu5yOc78
	hCJf7MuzAMU+xjqGvaDB/5FB9PUqPZC7bZ3MeTNRjJVbpFWdLPVxVpI2l+JWUg8f
	bHGc//vhzP3W6WJruUhjdoy80HBl4KXBBQiLF+oSbUjtV+CRWmhomBDGCc8tDgE1
	AGbhBQMWY5uweODDA5DFyl+CYEvX0ygPIk7dJzLF3xugLiLSYf5MtuMXpscky5+e
	WGqsVwwt7EektvHZgVLjrTNkujQJdIS7SS8BuYKv9oS4R1iNzhyoEcNVKyDG5atD
	c43d3aSNuZi1diVLJxGh0uYXFz/iRRjEwA6j+P23hOs2jyvL1Ma8gP170kXgtz4F
	c5V2gg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrue5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:30:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85355ddffc1so532309b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789389051; x=1789993851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=CV9xJvrN+cOxMefaSj5SU+kwSNa4sFtkJ4yzfOwvutABKUulPit1C5qV9IDRiKWseZ
         NaOR0uux0TuRL7fy6dpPv0lSLKQL8qBSI5Qq1xHaFZznldnQlKoaCa8RWfAQhgtAC5x1
         U/IcFA87rYHDaXNp8aJewqdXdlDh3uVK7gHnB9w3lgVyrsogQBKhWjjlyhtX9WdX98px
         mbh62F6VRtCnRh8Po/2ZqiTWdTIvBq3tbZwCrWQqJ0XhdrOpiPBZpwir1lCVpFYvB+jI
         hjcfX6k2XMWpN4S6sMuBbeTGhRZyySGmCeod1c744skssqu2MuJWPoPQJLEA4whPODvS
         /xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389051; x=1789993851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=TqS8w7RKFaRCw957Po0AIdVfpztCldl6yj8A2Mj6AinDAqSNZcs8Usk+6GkROfXaTK
         zd9c8iIIEP2pwpsWI6ppXCskdJzIAnGG96M9VTNpbrkWIz/BEyFMUo4bkcz6f7e/tk0m
         OdjkT1XjYTAWlpq7bTpA0UZ6uxXjUOTYutw04tKxVo6KFISeKTPOnT4P0Cc/kx1ihy1b
         F+2T7qY2PQLAH7qSbJ0ZzlCWwgpUSzFr0EqnkAVWXJE4WHsCktQkM+3G97XWtAWStqYQ
         zNH7WOZfWRCq5YXlJdunonTpC0mr3R6sz7tjcxbCGjSgJEiVZUKByZkQcjgJP3sjRUmI
         fU4w==
X-Forwarded-Encrypted: i=1; AKwUvBwk+dpLFWMZelzsdevBAg9GYnn8FWEsr8LVGqtxeLVay5JcRQ6pckyntNAnwWnYtpGTUba5xHjClkjZoyI=@vger.kernel.org
X-Gm-Message-State: AFuF++kubKOS32H9F21TPvQMCyPv8WqUVWSRlsTwmjHlpffPhQ3xs7P/
	xtvtQMaVoHLb2VyN2qRwYolN3yqldIjSyPY8xyoo2gdRZjN6/qeBsO2S1NWY6H5cvqXl46grfok
	HF/pmLkb1i06AdHW3MUMWjJKMmglaCJTI+eIIiBa+J0zbFbJWoyyJM28VXTd6mD2c6+U=
X-Gm-Gg: AYBFou15hQNpvEUfsvjULP46C4b/PF04kigj9LuikVlUIBJ4UI1OVOE+BNIkepIEoLC
	p+yzvjRnsS+JEzMATei9OdAR0Wjd2GKQ53dmBy5KSfj+5vgHtOEqCEVkhL+NlJTl4VTcZ9vHKG0
	wo1s3L+nK5cOMtXEv2e5MDPNT1BVd6JLm0f7j4NxvZkcu6wMqNTFM/ivbrB45f8GNICsW3+Maxl
	ARuRTFBTWWJhbQrv86jh8DtwizGUR2vwUOL9v57vQbAdL3diHGZNuU8DqB6P6wyjEJW+zgDq/W9
	ViJoFYUJUntd9QIWBOcs/ozW4pBCH4JzGxcVto5fN9IpKhKJ+A8Ohf1I4VSSO9yGI3E2eCxwa6L
	OT01PQ17Qq1qy+E6zGXEkWg==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373752137.1.1789388536203;
        Mon, 14 Sep 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373738137.1.1789388535775;
        Mon, 14 Sep 2026 05:22:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:14 -0700 (PDT)
Message-ID: <1f44c90b-a8a9-4d9c-9b98-3412b9086b3f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZWx_bETIUCDP-2joebdXFj3GZe3ha2DU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3OCBTYWx0ZWRfXyjAE1EX24RLN
 p5PQc+1aQTmZu6VkOiKTtLpkNP91uOtN4mM/+RvDWOdhRqIpPt50lHxU7relaS69lDLXf0kxOGS
 0gFwZuBEhAO4y1P0UkLuBqiuDU9hJsc=
X-Proofpoint-GUID: ZWx_bETIUCDP-2joebdXFj3GZe3ha2DU
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e8fb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3OCBTYWx0ZWRfX3z+HpwwHW2xS
 1bN3RWGnhDtNNcDJz3/xFliVvExXwUhNfUd7eudHfV6qDcYsGP4fpZd5i7zbtm821kIOtiKBDJ5
 4YOdZqFZMCMiifrE+5qIOssU98xcuGJjNVTWg59HFaLw2wa3MEe4O5oTYKIEbBjsFEKiAcrKBHK
 ftVmYKLYHpVwkn+Xf/gNUXXIeYl8n74nNgtEk2DQHEAw1PVhs8PcdVE6wGJYcUnJNOMNJ10F72Y
 zOohIaNi7aOPGWBy0nKE4wjM+VM+Gz9AgHKHCoGs2a5Iy0uVfoIX/xrd7cnnq125sbqzCDRPUj0
 qsZVzOr3flAJZQr9F34ssfSriZ6ioqYh7BHiOThVPL3LWdWhzjejrVPTmFrrAYZtcG8WKd9+cLy
 KTL0mCyIgVsJGSpAZzxKcpvjmI+L9w0tRW3dmdj7ku+z9hNX3WH+Q4c4e4jnLjexvSklbjFSm//
 tNDu55YDGtkkvdoypeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140178

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
