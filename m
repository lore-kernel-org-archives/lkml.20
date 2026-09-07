Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FFE3C9885
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775389; cv=none; b=nGdDl6WR3BdVLfcLIMO98cm8WUmPQxvV0RQTXnIdWYSKCEayCootTi+SFK3Y5yU5Ks0USH+O/KbOi7EFk3VZwqfbeDwx9US5IODNQrg6WxBgczbI2WApiM45rlUHi+Amip1fbLMAZ6z8DuzO/2S9p0YTvrQAexZI9m1cBRs8NAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775389; c=relaxed/simple;
	bh=u858oefPAQOSDb/at8+AC4GTZzgA1wXI5Wvo+XpkcEs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BETDW748a9MN4SF2bbGLTjqCzpHmqmXGitlsZ1r2kEKWK0no8P0LS0gJHS1rA7rYtf/M5Waw+vcbUlhQekb7UlwACbvjcuKMN7q18jXAmI5ElarMm5Tb8gIjxImPnBUNTXWere8SN9SDPRdWss1Q+eddzjhO9drL4t64hNaPcjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQRtzyYC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIlZTHUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQRtzyYC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIlZTHUU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXUN057358
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=; b=YQRtzyYCoQeBsG1h
	AFgmG6KwSpRtxBE1bN2smpW6l7Bqr+MbeN/Y1OK415m1icVP29jqpr45n0zgM4s9
	Nw1CtkwBjwYnVHNPAqez/ktgS2VEP8mRSHiSzjPKrKTYjIYQ3U3T6mSMW/Uy/Hyv
	yYCYS+eutao0fPWc9afp6060B94x+udB4g9+v2wI6Xg0DJhWEVJFtr7Ex1+rBucF
	TEXBbDCjiArU5hoOUYhn8HLdSCRNB4ueEKp5F66PRbpBKsx8FFClebPahPCdR2rU
	Br7gLmhttZMF89bIN3D3TmeJOMfwG9q14sW9++7EzG4cf8holOHeLF+0qNWb4GO2
	OHkTSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqg8f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:03:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cc0ed09b5so32916266d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775386; x=1789380186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=;
        b=GIlZTHUUVln0yLTS6fvU/wBCfxairKfKmhBm0O/W0Nya1FanIoFSj//YyjCXlLWTKe
         1fnF3nTWft5a5SgFDmZvOAmbDepuen02oHahg3sQ8yhh4UIYw5ACUjcU7+yIcISdJZah
         Rw+3U+DyEKYvN2Fc/PDip8qmGWfMGaO1T1gb+jU7W9rQVo85wLQqgSuSjLdfVx6nGLwa
         cac/ee6PAnMlBPZijrHXbZJl0xG/msW7W/qFGMEo5/szbKQuls0RiB064m1fmmAfaRZl
         kaueh3F2RAfDcmDdzOygcc4w4Q/DP88JNJNjMqhN0///v3mTnOO8kCWW2kHhg9wc4M5v
         iWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775386; x=1789380186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7itov2a9EU/fIEUTIADuD/V5VWTNPPlvnNHpxB9/h0=;
        b=WEkxNHCZcKb1pe7/mj7V/5CNxskTBIB4nUXRb2VNwXtkVFkeYpmTgdyNLLv/t6MmvB
         YIN/RmiJfj30fsHUFF7ggdFlpxIMohwqpDBkZuYLaLITrpcEFHnt0WShr6QcNVFG8MT1
         oAGG+Y/6DKAsHga5YHqh5HyZLMb2DytuoXSaWU1aFtFZEyvQAPYTEWNGnB02jjhsm8N5
         joTSs2R6+/047I+E14pK2Nzgn7verTZ2otJgUciy+XU5NvV0q2wFF+f1D1u9y6TFAlFk
         DSYyKcT88kmQ88ZLrg9tZazxpMcMQ7qWPI3gSAiBW3uAksDOXwXVoLfucBHkZadPuW9j
         bpdA==
X-Forwarded-Encrypted: i=1; AKwUvByvW1txGw2/3nE/MZsggHb3ZkHgORSuLCvmCAGoNFmzRZKJtq6N1YwuzuH/uJS/yayYrm4j2ffQJvlf0Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++nCQ3OTgiOKTthtuofR09rQkRm/lwSI9W03KQk5WtjXARZySvOy
	juuLaMtWrawVqflU1ocCBQ4PFUU0/UBURrDb1poabMtc4uHGYN5RznJ1S6LyEJV924ZZBTxYWor
	Mr+hd4HDVmnV78moop3JgbkR17ipRX4IHUjpKlhk/V6EBWsFnoyugZJJfu0Txo0C0fQdhy/UaKw
	U=
X-Gm-Gg: AYBFou1sKTeysKguM22PydWpRCXKHcYK4OiFwaxZQFISXL1MxfLXdF6tzZIIwdIrKux
	gx3XY+vql2t4FSs8+S6itHslPJPWYUmtSEf369YQHVWEIu1LcFc78yFLvX2ksy9fOdnvbR31KOn
	W7bKpHGdQAMbDTxnLpBRJ0EielYsfxfhF3Jtbu9z1ScT1oJV8PABTchO7JnzsYJH0OclX+EIuEk
	gvVj+bUhar/FBRtKqyb25VHVqPH8RCd5gasvgPJ2IfCbH3D01EO8BNkjscHgqvh+WMLLPBO4O7K
	zUrIZe8nc17YUdQxEN2hi1O5X88o30JkZpIB95P06DgvUMqbQin0nSSMHaWrJCXUQ+/kPBHW4Ji
	wAL7N9Ya3ZNOXFw27Ro8I2qLa/3/GiQNRS3+aE5k5r59upigEVHKapvMJq+Z+idA=
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr2208354785a.0.1788775386293;
        Mon, 07 Sep 2026 03:03:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr2208345485a.0.1788775385724;
        Mon, 07 Sep 2026 03:03:05 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5e04:77e4:65ed:d6d7? ([2a05:6e02:1041:c10:5e04:77e4:65ed:d6d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28042627f8f.21.2026.09.07.03.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:03:04 -0700 (PDT)
Message-ID: <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and
 selftests
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX0YNrqCZk+q5/
 zIeim/D2sCQIUaEe339NSxipSqT9ktmbkJh+H0Vevo+5KNui2VaI9RR122m3604HSC7VUbeZX9P
 +AT5O9f8XZdMptmWcXkEZgjxZKnN8Zi4gY3ul1kc53n7oM0WRzMpl5PZfclVJCT7G8xnqiDD8fi
 iMgpbZJ5TAnJ/oyLb1r1+EzOwhBU2CzLnvQaJ5A5IfAUP2K9iN4QES/oGJJtB+Ilgb7wlS/A4vT
 vBiV1WrMs+3AZWl7blv1e7Q0Us2Z053F1OJSqZvIvPVBxwYuYDcuRo19GHcXXRvSrfymY5Enyu7
 WadHcYQj4dxCeKMHBxVAR8DklbT5uLmyHS6YQCo+lujlI8viYrUom3wYpz3I2VGnBkotSwXBzZp
 kAifzSA0sL7qamzRk4g6c+xKEv+aslNJupeVy0pYuENVPuM9tiHdGEOE1rkPj2dirE1XQ38Js68
 OV5wz5GOB+MWMXEUkJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX2mVTPn6jrB5a
 y6Pvqwzm6b54YlZvLeBQbo7HE3iixFLCpfT5SilxjK2Enj94eXkMHnQxS1p94PL7wnTNVBqzcdm
 HwSJhkVrpr0/LIFPra6MY6KpduVWFek=
X-Proofpoint-ORIG-GUID: MC3-i1xTHx6AkMRP9OTLQl_RcHOZBB-b
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e8bda cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sDQwJVceT08lulBnrQ0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: MC3-i1xTHx6AkMRP9OTLQl_RcHOZBB-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070110


Hi Rafael,

On 8/6/26 13:01, Daniel Lezcano wrote:
> Powercap controllers frequently expose a hierarchy of power zones (for
> example package, clusters and CPUs). Until now, each driver had to
> implement its own hierarchy traversal, parent lookup, error handling and
> teardown logic.
> 
> This series introduces a generic hierarchy description and helper
> functions allowing a controller to instantiate and destroy an entire
> powercap hierarchy from a static description. The framework takes care of
> duplicating the hierarchy description, rebasing parent pointers,
> creating zones in dependency order and performing the appropriate
> rollback and cleanup on errors.
> 
> The series also adds a kselftest exercising the new API by creating a
> synthetic hierarchy, validating the exported sysfs hierarchy and
> attributes, and ensuring that all resources are correctly released when
> the hierarchy is destroyed.
> 
> The patches are organized as follows:
> 
> 1. powercap: Add generic zone hierarchy creation helpers
> 2. selftests/powercap: Add powercap hierarchy creation API tests
> 
> The API was primarily motivated by the recently posted SPEL series and
> also provides a migration path for DTPM to use the same generic
> infrastructure instead of maintaining its own hierarchy handling.
> 
> Link: SPEL cover letter <https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/>
> 
> Daniel Lezcano (2):
> powercap: Add generic zone hierarchy creation helpers
> selftests/powercap: Add powercap hierarchy creation API tests
> 
> --
It was easy to migrate DTPM to this API and AFAICT Manaf was able to 
migrate also its series to this new API.

Is it possible to consider it for merging ?

Thanks

   -- Daniel

[1] 
https://lore.kernel.org/all/20260819165605.1398880-1-daniel.lezcano@oss.qualcomm.com/

[2] 
https://lore.kernel.org/all/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/
