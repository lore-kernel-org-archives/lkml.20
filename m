Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743178;
	b=hf1X0GQFc4qzYBSVLynfWUFRZr4EztbMCHmYTN/DqF3k+l9pD8mLc6tQUDzJaoYpeoQs
	 nVdDV0r7S+PNMWL1Uk1PWlpm6KPm7OhKwCXHuLxRWlvHyy2lYFNLZrPddArmXoU696VE/
	 Ez5FekXCruuys8a8crwiqTzs4qEfue5aZbH0UhdyITZnatSZYEue88UIOmRnt3Otvbo4c
	 qsmzQUE5WhnNQ3VC4o0mSECUO05OuQFiO1Etj0SFz2KiMS88/ZZ9zSotz9maQTPhHTNUl
	 MhfzVKsmUmRpl+lVKblr0cvoktfkvuhMPnRQ/Jig0OPrmNK/PmMyiP4zY/uEYrMvA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
	b=nDktL0DhjgBsxql2Ko8KAZMUtXGN5pZfkzfsmhmFj7FlsoTfE7LGTi1DwN8SUCg3xeBc
	 9dng0VdB2BGefSpBBBmDBcCXr1EYfe/j5nwIW0Fafvvz8O7srBimGr16/KsFGA0CrJTWJ
	 LVEq7JYSb7vWIlOZUeE0/HEzqePSdZg92PUiwkmqYRXPJryNz7rgNA9QY8OMhHcDbvE0p
	 wlVamN6rqTgCwYDpeJ9QWywvqoi/CEIbYx+LIYjMwvzZYAA6FHKvgF16EDCjRfO+6/mkw
	 WLzCl87ySFo1rRtWv+6u9LTWemVxuOOegIIVnrhCGHNq0fm2Q9qB3ZdbsLB98tfFW1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CED4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMBH1048184
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=; b=eyvWj+otLQ0BXr1c
	5P4DKyOze42qntnvS0GIzRTMcrX2YMQcsvWL4X9TisOmvnlnSgnL/jGkiGrhZGB/
	JM4nCAMccp3ipJsz0sPhTehZi1lstygdrYT0d9g0Z5B/gi+EmIN6ynR9rYIdJQvj
	lKgAuES/X0d+AeS1N4UDPko66iKbUghw1jHtZ9EFSdNSfBsFk2A4Qo+qMDgWuklb
	ltwcxdfe1hf8V0ImNLcu44VH2Iffni5PZ8YCf3QzPrGJ5Hn6PLtYNkOw5RzzeWTi
	M8sZTKvIQXiE6IGIzWyymKcwpKKR0gTp0gZEfqk21r0KQt2qKZ5WNx0DtmkMiZLH
	+ZMINw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjq71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:12:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768885b4so908121b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743176; x=1793347976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=OgMXftD8ncNr/PKE5TlrhjqpIQ2POdj7PXSzYwe8VHo29y9I1S3ejcZHgBzyrShfIA
         CyVU6W/koEJ0LY85CDXSFQFhUAyyUXXwAGtP9waFPgPfQ5ZgjmDNUSpwwBlcMuqkucJz
         1K3Of8gLQZcTSHU7S7sAS3tBE7xjJxrtpdJIHpxk09YlYjYKFuJjrqu2z0lP4VgmbegC
         KhsvYIrD+XQ0Tvn2Tt/VuGVk3bJ4LGC37WrkB59ymGVkTq3O3+MiXtZZ3nYBME46Fjxw
         x9ArITPn6y+3SPyJraj23UqQ5zz/HQ5qyVnZBwjrhMenfnuuOAj5qbgPui7WSLvjWrNU
         I5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743176; x=1793347976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=fxR8mXOAU8vlxtITOjJbDgDdqM1luvGEJMsyBvZiENAm/dGVarG/ZI8hQA1XozX5+6
         UgQ199nyWNUEk7ZFmgbT7gQG1dUniT2rOn2aQipZzP07N1x8r8wFNEcBTsaIbJ41Wh7+
         Y7hG7D6V5RP/GQOzizkRv9f/5yY8/+51tPzbanrzRLGLemSYU8+VrU/dXNgRdG71Bz+X
         +KPh6iB4WS/pt4zWBuSbrBeoOyoD3X9e6nf+a7TFTYRnsSaP+KlmySTl4VFWK+Nbzhjb
         LJmuxCCqpipid3GjQNDEn4/DaW2C34UJfgIfiEIcy8PUcouK4fK6W1EwBuZwMSTK41qA
         my+g==
X-Forwarded-Encrypted: i=1; AKwUvBx+mAk0Kvb/ii0dEf7ME3YWkOuqO/7auL1cjtjPrIZ2LBF0OoAIDysc10LHkRU+4rPFpHZ1E71kREz7Q/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo2BbiorszaRjUthf5ZCExlo63Sm7P52vXxSNZ3JxbaAokn7SV
	Pqpe6DzE1dpKK8ZQIU0h8kB4VGihUrrFetexxCqICsGgIdPYS3d18nIil8WiTtf1PcVy69q/Lkx
	Wzp2YKhQDY4o+W6kFbder7IqSRRvOdy6jif/Ws9JWB81F8iKjLEpswirENJakDj/kG+Y=
X-Gm-Gg: AYBFou3Us1IW4pglxLuD+ZAnELaUKb1wBBh8log0Zh6RZSFzPMqbCHNlyBy+eJESpIn
	bvDTBeACG1LB76b3ws58nbBqnSfbRlnnR4LWgLnMQ6F6xDZwwIgN1b3z82ZwZ0afvy2o/uxTYpL
	1aGuHJ9jR006y2SrEyZcE+nQlOioX/1xS8UbV00RgOGQigg+JO/1bwdtPRs8/afCHANInRyiNeU
	n3//nZ2usbchhGRl7WCWfVfh96YPDLaXi9y7cPk6q0C9seh8FYyecPf28j9Rhp23YyR0DD6UcUi
	4fBpYb3b4OkJ+MPEZBBdEN2NgWa4r8Z1NU1oGcYmmHix1/8whhNwx/OOzgXwDOxyqqv5t8cuZi+
	Syi2cc+hAOmDMZWUfeBDhKq5BJMEKaN9Ezw==
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1404004b3a.0.1792743176017;
        Fri, 23 Oct 2026 01:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1403965b3a.0.1792743175484;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c797b685sm455376b3a.1.2026.10.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:42:43 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
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
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Language: en-US
In-Reply-To: <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX6lX61QwyjxyU
 adovx97dfA5GmMe0aAYp4QfZ0Asees4vUMLsaT//TuUnW650bMIhlrGYddVUNl5VUTahmJ36Ebc
 gt4l2jZc74InS16JNkcObCyYpdAmkbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxHdinzCh+dIo
 aXKXCCuk553an3cE+TedJ9SEcqjLsy/bv2svu6ujMCge34cVF060wwZFhHMzpLHbOwD2kN3dyDk
 uspIQSCsZAq7OJkjcLW2TS26qjr/xWMcYioCEPRB9F/uKBb485CuCX/lfv9QxYVMa2bMf6JpU5e
 +k23TNQ0R0gAmI2JBNx6UtwWQzAtHfMcYU7WiQhBP7LF7QS2i/xH4OHeC+D0uBNkqJU5RmBMUT+
 +OuRSpqgSHqAgoTNi46q2ln+syMcVc2RBemXTp4DCe0OehONjkUPssHMybZC773idwgIQAUZ+G9
 cyjjUnVEbJdzWsoKn1s7mq86PD25QL4ekPlwr1TyJHrey98tHIm7ECp9kgdGYdkZ4wCT3/TVK68
 Zx8/sWSKjyC61FrTBXd21qYJ5sFUe9qXzyL/faqmHoDm7+wdXjybTTnV2Jqo30drqJd3SYChX6j
 WyjD0H6dEaF4vw4uu/A==
X-Proofpoint-ORIG-GUID: bEd1aCCkEHfIT65Df-cHsrVxlw6jEAUO
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb1708 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eWRtYoRFSfl0Epy3KhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bEd1aCCkEHfIT65Df-cHsrVxlw6jEAUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>>
>> Complete DCP KMS registration, including power and IOMMU integration,
>> capability handling, display-graph parsing, and creation of DRM planes,
>> CRTCs, encoders, bridges, and connectors.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>
> Your tag is the last one.

Sure, but I notice there are checkpatch errors, should we keep this or 
remove?

   ● env: :3: WARNING: Non-standard signature: Assisted-by:
   ● env: :3: ERROR: Unrecognized email address: 'LLM'

> Best regards,
> Krzysztof
