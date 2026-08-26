Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EEC43E06C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753628; cv=none; b=udHHO0IF2QFl4h4g1hVlybwQ3bNYuG59xqnhUvO9LKpa4HzgASSOffcSMzLeL/hpkpScIsLIDo8jCPPUuseqUXqJVckVNVG/LrdVe5aF5WIw3673Fv2qU6cQ/Nopbmishki4c0UsYAdp0FE1uIT/BZuQ8YULd//V9ahOGfyeZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753628; c=relaxed/simple;
	bh=IUcNzTHy3wT2qcJQgNjlntxMIsoy4CibauEbkAvXCDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz8AeHpTg9lJD/xg8MLmGPy2k/KLu2cUvktb1GdYSE5Rz0h69d3TiwfBz1YCDomGZBPDtPtxGRkzMYYMbnwwIsXAl68o7fZnHlsC8xeDczL7yfblZRGERqrgpPHAvaHCZdTmecqjfwohkO+IBn0pneDcBKrtuuJGEjIqCBdozb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaBJQy+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjutFRz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaBJQy+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjutFRz+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDur1B1120308
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=; b=FaBJQy+sn1Nt1ZUr
	WxZHdm0HH3f0GBYIEuRJ4qzAbvAVzcKYqAg3ooEoE8FeaL+P6kTOaqASDCx4j6Pv
	9AlEN6/QCt3blvrK/+xbVPUIK+kMdYjKoZ9H85o1keNhhBE+6uK2eX1FcgHbnCk1
	Day4gmK4ErVMH+LnsLOkmcB54legvIOzPkx2efKxAgezTvDk3Fp7fxhQ0Qlu2Yas
	l/mxtNBcO50St8vS/r1qobZEZeEc+jVE7rtwQ1yOE1MjzPe3drZOgtCVf9zEqy2t
	IDVet77Dtri1fme4DZq/KRK6EDzPCy61edjTMwFzM7BFbeFVGIZmOYN7MCrUztH9
	TSUwOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k2gqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:13:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1912678a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787753626; x=1788358426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=;
        b=WjutFRz+krrIlQjIkE3F8gieaH9s9hDX326V0VjlCQXVsU3oO5LyLqwN8azpaH3JGM
         +ZpqAebrJZQKdoTOxCVuHZ3cu3d8ObYjgYmglKyKZYlzmp78c+QUpIHpxz8E9ItlSQAD
         uBWi0H4vg3vm9hV5OjfBgnhgY7uyQApzFN/TiHXlQVuvP1BPpdYQqRamSfGLfA7JFRFq
         /WlPuOX6bhKhY4tw0jUTtt+bEd85A4gvcDfZFKqd85eEQvNHDOA4w8fz/0rnUSHiH5Fb
         LjFj0SlaTEMCfiSUGnagJ8FeAuWdAo2LUUmbRuUHhF/yfqAKsi2hN/NLzsNwt0LIPNt9
         s5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753626; x=1788358426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N42qRw68pisAkSMx+a/fTTqRlQcCyUKQ3UbvKZ5lmxs=;
        b=OuP6Q+lf8ulfrG+dwAda61mn3Y0lmsmvszH1fsOm6OlGuIDtre0IXb2Up1QpRDfKkO
         WaH5601/uF0rJsKJqdSUkJdGtyjVn1zpupXkZH5s1q003hl5NPgTxLA7EdtwOkSuRp0M
         oeoZr4j1eA5eIpDu9V957pyr33ROxQWzvECuHky05j0ZhIOCVgfjjZqq6p8qVCOtoPVL
         w8qB8nhk7O68pZuId5lINKcEKDNojefG7c725J5Mie2sL9H2svzKEyvzXXnCUfR/hkfn
         kj0h6tzrihetYhOzTSmYHIKo0KHL9fyONdsgvwNihI/GtImU4dL6SSzpsID7K4A3YF7Y
         Pw9Q==
X-Gm-Message-State: AFuF++kmd7G6gxukZBt9NyOJ992NrT5Q1aqvmQkFUTTNl5hCxB5V80fv
	xLmgm4dgj/Kd6R919dXl4HqJ9cz0jJF2S5wtdishmTq+iGFup/Iy4qAb8Luh3crMSKE7zuQI7C1
	BkVNWKu0So/yQpHOnHU5pr8Kdf+ikNOz84UZxTuPIDhV/a0FgaM4EBzVhOX9vZmvU1MA=
X-Gm-Gg: AR+sD11VlmeTFj94jTbMEUVvx11PAp3tDPvR2bf+9QQtkJ3uDtHLqaer9HoyO1MHjcw
	HcX9pT8JHR1AM+wiyGYzftJqQTacGuIKUsPC0NBEtiUyjQ+y2e9bwTDLzejYBG9uKfIqDxVhxJp
	8IQn8yxfhMSTlKutEjdtjdnMQLPROPO03fJqn1Ygp1GbS24z5ot47WuLZ67kC0DayqamlRESyr8
	LBIW7zHZr01sO2Kay5SkjM5d2aDUZyOoWKOeknM+yb1MMyjQYzxy7PxxEZheBYjwm/KGRAXdXcY
	5gnFlQkahfqXTeajdrOJlCCzyQBiSAAR40hW9Ex5RgCi8raM/MQ87hw0qeD9Ge+U8vopCZQtd5t
	Wthair6+EL1XzAYDMot82OKfyBbmt+ELcfkhnljYpSMA346EXD45Zm65ddaKI
X-Received: by 2002:a17:90b:3908:b0:396:54ba:8932 with SMTP id 98e67ed59e1d1-3966d5f90femr14020078a91.16.1787753625649;
        Wed, 26 Aug 2026 07:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:396:54ba:8932 with SMTP id 98e67ed59e1d1-3966d5f90femr14019921a91.16.1787753625065;
        Wed, 26 Aug 2026 07:13:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f467c9sm8590148c88.7.2026.08.26.07.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 07:13:44 -0700 (PDT)
Message-ID: <7eca1c7f-52d5-43bc-afcb-1f6ac198e391@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 07:13:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc8
To: Guenter Roeck <linux@roeck-us.net>, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
References: <CAHk-=wjxkZx7-MT_tk=CxbtvPLjZtrSvcL+muUZAo3GKxBiaqg@mail.gmail.com>
 <f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ef49a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZRRb8Y5EZIRNeyjAlFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExOCBTYWx0ZWRfXzPNPsXfYTwio
 7T702Ns2bGuEZBMKIYe8+VRUFv5STAyaUtXXV3rb/yRh+WqjDcmKIBPFUzSQP10O6LeSdWv1pzq
 P3wROwcywpsV5n+wlhEo9pYWi6z1apM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExOCBTYWx0ZWRfX14jp9wB10tAN
 fZZ4sBT+SoaVBkNW96IzUEF1y9JlTOVYgUWkNmrkLi+v0d6i/7Q7Mjsg1khs/2gdo38l/28HqpW
 Ok9cVVWsPUwwndQJnTgy2IyGwa+ys4VDOsJEqEGzLIcB3oM37sw5HKfwt39O+UqL0Yewpoo/gEl
 1J4+LXJKZ05En0TOx8P487DT77kF643AEslRYEkVXiIwsDVryPj2qSGNXTA3dcupK79K5uzpKud
 X6TtqS2AXQp94sj4cCxuGDzDVCThinUfxfFVtjvW8xDBTNAhKCAuT2ZIdxKRz27kFgQEc4CCC/1
 SvvPLP/Gxa/N2qaFTwud/ifl1eoJdY0mZWE8NfvJUjz5qarvBeFhqPsHIuwFF4uo0Yi9ucSzKxd
 TrHup/SbvVNRnwuJpv5M5tRCvsfF4ixAzZOaUo0VA69d4TB4nC425UPZzVIveE9U4XxoVFMayqq
 e9vrhxDRkkmIHtsYwYA==
X-Proofpoint-ORIG-GUID: 24B_s-YAzsYWUanE77nDepCUvtJ0kxhV
X-Proofpoint-GUID: 24B_s-YAzsYWUanE77nDepCUvtJ0kxhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260118

On 2/3/2026 6:16 PM, Guenter Roeck wrote:
> mips:allmodconfig
> 	Building mips:allmodconfig ... failed
> 	    Error log:
> 	    Error: configuration 'pcb110' references undefined image 'ramdisk' in property 'ramdisk'
> 	    Seen with Ubuntu 24.04 after recent updates. Not kernel version
> 	    specific (now also seen in 6.18.y). Apparently triggered by a
> 	    Ubuntu update, but I have no idea which one.
After a recent Ubuntu update I'm also seeing this build failure.
Is nobody else reporting this?

My AI agent says:

This is not a kernel bug — it's a mkimage behavior change in u-boot-tools.
Your system recently received an upgrade from u-boot-tools 2024.01 → 2025.10
(Ubuntu 24.04 noble-security), which included two upstream commits from June
2025:

- tools: mkimage: validate image references in FIT configurations (commit
7a8b25a)
- tools: mkimage: propagate error codes from fit_handle_file() (commit
21705d3)

These commits made mkimage strictly validate that every image name referenced
in a configurations node actually exists in the images section — previously it
silently ignored undefined references, now it errors out.

The offending files in the kernel are arch/mips/generic/board-jaguar2.its.S
and arch/mips/generic/board-serval.its.S — their configurations reference
ramdisk = "ramdisk" but no ramdisk image node is ever defined anywhere in the
FIT source. This was always technically wrong; the new u-boot-tools 2025.10
just enforces it.

Fix:
Remove the stale ramdisk references from both ITS files.

I'm very hesitant to modify MIPS files when the only reason I build for MIPS
is to make sure any patches I process don't introduce any architecture
specific build failures.

/jeff
