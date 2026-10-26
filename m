Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027518;
	b=o36yMWwTTqE7UAkPoZdvTRdptgAcPPGXp+ucBOJoi5Ss9ETWIIajYzfYtmM9c8naZNua
	 yUpn5CSAH64YHRJMO0wL5YPQXoOrDrwdtLmmzE9SzZipYE7biF2RbfsSuYARvUsZUtgll
	 Kt0x8J+2lwn0rqqepnH257T7bzQavao+6x/OK9UDfCRRqHc2P+UC2Qqw1tSiqwaz9bmVk
	 I/Fn5HSjiYWsrPT6R4OT4DWHIsa71FRg0li0JIgWPvqnnCXEwz96CUJkFM6mCH8eeFqd0
	 SY92T78ed3nJsepO8c9Rwq8Q/gpxrc+Ia///TWoqOUf8tSkLNwncwGcz2P+eL2BTlAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
	b=KR7p9SPRz0a0BiTPMm+NiplBFTm87o84Xmyk9PYJjsZq3m+WhmA+VmpibkpMwBNiyd1D
	 GZYRa6XIMC6WPvDOUqueQlOrd6us3rVCetyJaaeX7bAJVSO7scfdOGQM3Xc5wlQHzsuaG
	 xWcyEcMCWIvlJ9nHyhCdkQ9ikzAF+vNntHdOHajMcUG83hjmsewJOITFH/LpES3y2lGav
	 IfcxdiP4xS9a7jUJ8XdyjjljxZd6U4GqgJ/oPfVSDWs2AZH1QUQ2SwqBsej595qdyOrUF
	 ZhrV8zIBHenDh8PUxNG/zJ377IugXO03seGAo/8V2QvOUOZxncBqaXZqvCrRoc3ooRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SadAXZ5S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4CE606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyWaPPud;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SadAXZ5S
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvxtL2707794
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=; b=DyWaPPudMv5hXrWD
	yfOs0uowTvmp5SjVQGyCK1Xy7Cg0TbbU/L2fUVWIk6+PCjGCaCcbukFB8GkQONVJ
	Qa7Kqxbl0scWGiN5FKPbYLFr7HmQIMQxOIX4Xmd03gnCDF3YgVBJcRTX6kerdp6C
	kpMXU6j+wuXBIbiDOrB93tJqnj6ImBFNeLKRlRLq6wEJRIcANruTZRpySHyVkncA
	RNqmHEIm+6LPBQZPk7FBUSAD/H/qn6aDghRUg7D6/UG88DOoFycLG7WRaTfAPaE5
	aoWw8TlTd9PJWBSKvCaVRmN8GSQt4KHLePGSkJtQGtq9InN5mDwDpuQYCiKge8cX
	3oyqUg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61cxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:11:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso164531e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027516; x=1793632316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=SadAXZ5SgIr5jwuMkiOeSkSHJmcb0rDb1bc+ovNCeIuziVQfQLPTM23kbDBHOSytXQ
         dWjFrDVr4rl2EPKtR5zV7QMOLW8e5+Og31YChxP2ODF9hX3oQ5up5/S90F7FsPSdTdFt
         /EssU+6lM4c+Ivg20C/AKBpl72z2E482kbEjzFFfPKgXDXIiaVCf40oiPx5TVfafTvIv
         rJojLq+98ksuEWMwCsBYG81SZ4hvQ37TBcSj763DjnKm+bAhbso4wj6i5db9G7AVjOQL
         esSKRwRNTjmAN4oaZL+umcIsLW1JpylvY2noSnIpF4u3OSTLk8EfszGd2axS96x3zOGg
         TqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027516; x=1793632316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI748uxWKPPDTZ/WsRErMlRZ+qLc7z2c01W+e2hpsZg=;
        b=rJqt2APfF707U2uq+j6dH+tE8QNqD7o1/muWf3zZrw+C5sJPwa6/1p9AdPkoQfW+/O
         VV2n4TzcemWvkG/hQtzvx+QtTP2XCYHV2X7GYGtlhivwYswraAv9q3pefZH+HWv0MDxt
         d4PjJ/90nifpN20Gdtl2XRZilBkZVxEXH/y2Ij75LxmmBtcN2g5A9QYmo9e11sLAy2oK
         UtLFA6aIMXZBdw3ojf1LfRw+o/DooQCPwAWIsOcJsV5/+7PtKCW4DvGcmjcZJD/mZvc1
         531ESii4BuZRP1SGobK+h8ZruVuH6zYMKnDBjIVizINLdcAQNnSCztvnjyWIdMaOUWTs
         9hrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdcBiGw8ixJu6dCCc+Ug/huzBDWy4qE6x1ZXQJfV8tLyXhQxV9B1vm72bzZ9zGu5xwQz+25Ax7Bn1sptY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkCHZRuVuL8Wgp/1Q3HwnIvy5XdEjxR1y8YJgY9oNSOonQhUXI
	TThjZ9Rqg1RJ6wkI1O8N/ggwEF5PvIgiHt8gOfVGVojjIzLze6Qvn3Ht872tmY4WRbr1pbULvFg
	WC2uEZZnos5hRc8Sw0Nt7GIq1NB9PO18FlbeCS9xmBSCnPdzHzESJh1eBYxw0C/i9sqk=
X-Gm-Gg: AYBFou0E63sL+/CUcPRtDLY0qInlfH7/zFE8/5JABQJ9Z0NkMtFzwbkrHJqKUrkxQBE
	OqFaJTyadBnu+95O5UFcMsxHs4wzyUAJaOBBFCt+MWY+CiwYFL8n7DQy3FcLplQWxY0uJIFDbBN
	zpGNn5UdZWW+hCwF9Qse6cr42uXhRostuvX85Y9rPmpWeJfBh7wVqt3BSGHFyzgKexLGM/YJFpX
	VwsCB8XtTTBN5WHq6gkl5zsh8Dm6mhRnjQ9Z2Z/HFwjfQY6MITz9XdIAlc/gTjHMeIYkE4s1MWp
	5QgevBpCGOb8vk6MTw+fPcR8RLwXow8AbKvelqF59+bYUnrZ9zlRoiXZjZEBJaN07pdk5PfC04m
	IGt4bufx9mo6mp2jwkBPDeA==
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821903e0c.4.1793027516419;
        Mon, 26 Oct 2026 08:11:56 -0700 (PDT)
X-Received: by 2002:a05:6122:8617:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec2506ae8dmr2821858e0c.4.1793027515922;
        Mon, 26 Oct 2026 08:11:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:11:54 -0700 (PDT)
Message-ID: <3650f273-d361-497b-8db8-7d5ca96283aa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:51 +0100
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
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CgphuN9jx3WVZ4nGq8wkAIPPzxBfNzd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfXxt5ddm5UUi9f
 S7Yl4S4CEvHekbrPclDk9bkIW+pqcl166bXRhVPOdSmd2g5URstJyUJQJwitQfIZlWZEmpAoadI
 8njtYO/I8lRQkHOjVgm/2jkkwb8ntnv8GFf2rsGosmvWCu9xJpbyU4XAM391s4hqDMIRpM0oIna
 qCXWAK8/adtNiOBo4q2FeROx6Cu4xREJ+kRApSPvGa9cdGKItJZmuOvdBzQ8rCpI7NZBtG6LgaU
 f1PWX2mneo/dG4V5AZACyTQ2MxWDJ0Yr0q3cmJEXqIpuqVieIZovshh4VPHpwCvWf2xz8gtUNbP
 NQlDgkwiCJOQhntfxwF9h7LDqR3qy2+wnUiXUNNiJp1VDLqrC8XTPnchAudAhjABTt7DR4evLDZ
 5XgJ2ePsaaEwS3jEkTiZqnRveb8RmL+sE+r7IGM1dCW2YW/cPjNOX3sdN8YfE2TIK1nnKrtmn0E
 K/pXHRYXCkDfil1xfWA==
X-Proofpoint-ORIG-GUID: CgphuN9jx3WVZ4nGq8wkAIPPzxBfNzd_
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf6dbd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfXxPApBhDFUpS6
 VlHMFNbhOiogS7SrjOpPwUrMyZM+tBaaok187uOi6Zarg+y3YOTcYSvkuknmfIKKwwOrFRl13HI
 nRqO5XOP+ndGyjgkL2Ynpd4gu5sf+Oc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
