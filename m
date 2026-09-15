Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6BB40911B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488648; cv=none; b=JYtMXyhyAeXwwicRBzwT7IC+mUBzw6AKO2w2qIvN88Rm50i4J4AKpap9juXKjh2z7QGRk+r2cgsJ/PGeryD3yQW5Ig4S/RyHBn9TLVJxvGu+byTauH7PoCsjbxygmMqip7M2lOAajqePX+QznYuHx5o45+jIOncHj0izPzValkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488648; c=relaxed/simple;
	bh=eA254CkMPb+QSDDxpCysxmFLZpZxszLdbOsdYPrMxJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlTJjvPtFI89E6wpikUq9JNrtHyDcH/q20BJF2Y8idBHcqmV3DBSKe2STU/tne3cNQIz9OW7/kOwx67LXOtAdOMXLvtwDIHFlYhpBqvWhLG9j9i2MuzQ94shD9p715E9aTaqAjlhGT6nK9H7XdnRxyjJc3E7tiZa7Yq1iBmgWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnBKmLPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNAOKgmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnBKmLPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNAOKgmW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAW4i291046
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=; b=hnBKmLPc/w5CBx7L
	Hq7kQEDW0G5F7lCOkAJgkT5xBUbGtpZhr4bPIZNsh02QWms7UwsbelepREjSlbPg
	2a1w9HjYLi72sAHL8Hb2A9/VrBvc6fiR+uubFtdB1uzi1PvRak8YgvmuL6O9sJwW
	3LPUJ+NVYQo00kXQpcOasvbhhAu37iErP632hLUROCES/gNNta3gHuEjK1bQ5KJS
	9JBP8g0OhcnIm/aTtPQLvco9neG4H3fIh9vu61JN6Im6WJE2NN+NskYYOt0nNJCV
	CpBCitmwGkUTYYrBlq+UH8g+SuaxYBO90xMzZ3znQrtZ2HrYM4QbQqhBLs7Jyuul
	BFpFiA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux2swf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:10:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d5444845so5620762e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488645; x=1790093445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=MNAOKgmWnKyP4q9AMNADy6euq51HgvuuS7IOxVzdlk9PoJK9tJv8cLevrrLXzTraoW
         QJl2ZE9mkicFq8n9iiyqs0JMdiNqaqBp9koK/mz0WUdvTupeNqLBKHNgT3PKT2UXsY8H
         ZQpTD91PNHDZ6lQ7iPFoaYT9FdcP8OuKO1ZdLKIw/4jrx9DgFEqaLU9+L86xCNGzLzq3
         vnrdwo+tIdreAj4d42/WpUI7/kf3Jk29Jq6UliWoxF9apwqzO4hm7udAxmrpZKRE+uQi
         EgDndsjcy9g+FDpRds/jAkWAo+r9pe2d50FCOvDsVSsTDNDPa1MvObn9RCcN7Vqru8jD
         6lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488645; x=1790093445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=PxwDHbzhkH8lnUMavYpGOakJPvBi1y9kJExQKYEPkeaUfjzPYksk8eLUCnEnmEmF9A
         4Bt9oBm6wyEsvdIhTq0XHcNMif50CQyfk5o3boW6FaeVwnJ7JIfleHdUeu7hAD1OgK95
         pww+l2A7NknciHZRVnMjtEubp23gwRcD4JqVdLK5nSJxsfIcEtUQgwHR9QdVXbyqgTuD
         CuZoLnURwbVqgOPs7z3c5LJmZ+rU2hB5GGciDB6YOSq1hCO++KfaZLuzT/lbEv75od7C
         0Dxzf5p+NcLQmF2RCcezyxmDc9tFwCzTkj/dqC5z9/yTSRGEi4ioebCQzj8mrsH3jrkA
         Golg==
X-Forwarded-Encrypted: i=1; AKwUvBx34P0zH94qnBvIgUx0PgjC2hI+E5L55CA0rMk1bis+q0NcLWQolNG+dFQYMnWt/XSfOO8I5KaP1CKHPU4=@vger.kernel.org
X-Gm-Message-State: AFuF++kPHGNxIWDYs8++qWBiuxlkrLgFvPwD4d+Nqr+hs6495OdbbnD3
	Xu07OBc2ObjcBHzjawSQ44GNe8kUVI8IMTZj25jzGFjIPWeSGl9SvawXEFzPU3WdmEdU32SCnnJ
	n4OQtCnvyHdui4aX81vZzsJ51kEr42vQYDclOqxaelq4hm/5B+yYFSnsgztdiOOxKQsLrTasE+S
	U=
X-Gm-Gg: AYBFou3WyIczQ9aRCiwVD0V3lRRpbpPz5Q3svYvGY7C+9rNJto3ocHJKJ8D7MGiVfEY
	f+Kwy9pAgEmmll8wcfWcTn3ivQakiUFgsY4PC1/+FPCMTACOyUyO/FCR4KRDjjIFJ4xTV3T93nm
	+1PhKMUTj7snVvVZEckIpWdzxAhNCL7DBSo65uMA6VFHOkYLsCzRvIDbJ/ZR5kElqT57T5rjpjd
	2Rg4shTK9nndwBREJwgptzNvtSIhcBIQdR1KRBbkcIKabOPQgrLUdoMsuLfpJPHtK9vQ541B+ES
	fIQi0+rTqvj9Lhdj9Udq8Lb4irZwXh6U4KsYsQ1KBP4k83fYhYbXoCy81/IVA4S2/apHJ+gaVHm
	jKSB1P3oRd1ks57EfedvS7jaNsAzp
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251464e0c.7.1789488645577;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251376e0c.7.1789488645134;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm78795f8f.12.2026.09.15.09.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:10:44 -0700 (PDT)
Message-ID: <d366d3b2-a054-4945-8c02-877921a6073a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP
 tables
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqlbFwMZp_TAExFq@SMW015318>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqlbFwMZp_TAExFq@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfXzO7lS03wwSJr
 v3Ri1gwy6zXS+OTA16kODsVlCu0PB+W6Ogg1RS1w2URUrv92RmKAbTidmUfyaGLX+bgO5J4U6Is
 Y9VvD8uBBzxRBt9JjGqqPPZ6rjv8CIa4SGRwIcDbwBNw7v6U0Kxv7wMomZLW9kZHZcREjI9c/t/
 0LFkDDiHgqyxiYgNnhTQ9j8Q02LXceLSrDtNk72gPaLUnY1FsQ5p9KzG5SMdEFkvTv1bNpxqj/2
 ehkHzZjx2jhTTlwo1ERRCWFxtaX/0tKkvh2Xo/bR/HfIjaOqFNpr3wnG+f0RTYWMBUXQ8bvh15j
 9SlpEt0Scvl2/Ul8uVKDeaAhQmoUhokKfmBK9eueYtdL0m3ugP/a6haKkAplckEfMAhQF3mxrFg
 a7XMP9jALlmbn53HKKnOUgWfzMf0Ff7AA7Cy6OpZ1ofQZhNPpXb97JbtoOAjwk6OldRm7nhil9X
 0Bg0HDZRPW33n4bV+UA==
X-Proofpoint-ORIG-GUID: 4df0Bed7gbFYWjuZwi4QpvHGGaFz_Yfm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfX9/NHMeH8JYTu
 GXUcy+0vFfwtWgKxEEDlAbo8PRvRVvrZ8WnPWpMkH7UWu1mzHrGAfTrT+dShNYIyawycK/UpZI/
 aS5pCjgyjTLxNesfZOCbB+dEIEjDMrw=
X-Proofpoint-GUID: 4df0Bed7gbFYWjuZwi4QpvHGGaFz_Yfm
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa96e06 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IstA8FdGA62tgLsOMVAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150236

On 15/09/2026 16:49, Frank Li wrote:
> On Tue, Sep 15, 2026 at 09:23:09AM +0200, Krzysztof Kozlowski wrote:
>> There is no "opp-hz-real" property at all defined in the bindings and
>> new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
>> warnings like:
>>
>>   imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> I run below command, have not found above warning
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y freescale/imx95-15x15-evk-pcie0-ep.dtb
>   DTC [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx-m2-pcie.dtbo
>   DTC     arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb
> 
> Anything wrong?
> 

Older dtschema?

Best regards,
Krzysztof
