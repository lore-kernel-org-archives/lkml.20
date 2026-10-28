Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211536;
	b=raN+ePqLVU/6St5tAvGqbyYiAQnSkM6XAUzRbZ2OIoMXbDoh4Sj3S2+ZaZ3scR8r6GwI
	 wKCy8jQuWoh2TZgkeATdAyc7GCzNnytpFK3Bm0CIc06Kn7oMldyBhnzd1tPpxYNIM43NM
	 8yFhz02bMlzfKctolQTFRIFhd+PyLAGPXMT/PnqSwebsnqWOc5D+0DzClPDg7ub2ZekMr
	 ioPIq8qAZpr83nf0W+Hjro+9Jd8/2RG170PFaNVro5yb3S7rsQHE7dPs6FWV0R2CDXxS3
	 kARfTp8KrtuknZb5a6+0ywSxpqCPOCgb0Xk7MrGd2xWjcn4T/iXNyIz9wG0OE8oibng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
	b=ONXA7Rmk9DJao+te9qIHN290yC2KwlkH1ffET5kW2BqHeT5zOWNDcv6wU2zKarbVWjJ5
	 Vs+mQlCg4TA9Tn/qr7xjcRttADZeFbRJffwkqEKFh+odOw1Bwbb1RrKKkz66L3k9NVIaJ
	 qieMYEOwYREQG93guY37fqy833t6t1ISdeDzAnq6yilaGdsB1wGr+kTiQbInd4pEpHkvH
	 HJpdqghfF+dBfgQgmBWIX7z8NrstHCKQ7jvN5i3lg8P+rAHLrdRC8oeDBCZPQ1j0ummi8
	 Z+8YYitp7ZubVOGiIt096VYdA8ST2Ui4w9H9HLq54ZRSXqt/eWdfwX5kilpjHzt0HvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOQcgXV9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYYAwfKM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95205606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95205606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOQcgXV9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYYAwfKM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAbHX423467
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=; b=XOQcgXV9Lj+oXRyn
	kwPCaHCeR0liIWmvAYjNH2tIdi3QlrLgwReaySAZ7kdCuADVmSQuoFTqTlO9Qpyi
	N8yV/UprUjvm11+IvtVi697FkkwxwPJdjQH4pHEFlDR9LpYcVgXi2hDDcpqpcAUf
	T8EzuWP5ddi3RRoRftoSo+LrxqCLB//+hoICVg00EE4rGZcVfOA08qHtVRXvlHhq
	w7mPHbxGjQNPZqFHw8ywbBlgUdZ5HPHQaa83mUA99X6TO3XFGhM9rn0uyCSYIyiq
	jLvvbeoMcuaWWb0pecbYS+ZYQML6m4d9R0vx36qVfynK1UCO5mQGkzK1rA/DQ2zz
	pSMiJA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp2ak1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:18:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so3777657c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793211532; x=1793816332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
        b=CYYAwfKMzgQVOtFpd2EvXA2InjmL+07fCIVnVqYht7TN8/vbA1pkOwJHm2q75G5+J9
         k4SlKGvS8hz5L38VBSP7BbxpJFILPKeyEqX1H89XXK3CwBiyV7eTeHlgmGESWl1T831u
         hWZIBq+dX68sUEr8pdVuRVvF8WEg/HIaRG4dWsR7hvZsHWfxDlFs2lbz2GKQlGMf3hPV
         mfiTmOlY0L9Fg78E2YnTVA2u0y8W/OzUEd71tgzEFHY+36Hrb0HBlWXAmS4tUygojzHy
         CdkYcHFxP/V6ndxTUFooU4iJrOKOL1SjO6ieMj2ZIsY1O+EFRRzUbLiYNiQuH/CVZBNs
         rBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211532; x=1793816332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UlnfjAbRNJJM1s06B3PfnT7wYrAZbMHSeL83sIth3Q=;
        b=l0XRFCBF3jaa2y8GghLOnwLCmDB05+qmkY2gXx1H1+PeQf4Na8i4mLxUdf2ZZxee1z
         cA0VrIyB5LeIMP6p/z8u7yNcvLu1b9/idak83QNq+Byj68Jrh3MNvvz/8bEoqtB8Z8mJ
         /UsU3WK45iDjPP4TlF/IgwyI4HoCcZ8/p6FtTyODrkP7YLWthk5DnSqnfwMiWsKxDJrG
         JzeylukVyVEPEG11obNuTwe2qCK5Yi7Dq3aBJtGsAB3uQNTCL0WTbGUhsPEK0iAOEuXb
         GEqprQW54tsG4+JJ12nAP+P8AnDtLrXT/YPeH662NEf7H2AYMJMKywfzXek0OnWUx5nF
         tJ6w==
X-Forwarded-Encrypted: i=1; AKwUvBze5laO1tQyCUpHrC8Ue4yGwcNMAiIa5Ub7h3t5PvOMx8JJFVIVRQVMEKp0wsljdtT7ezC3+sIvmEblgeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4x+2gcSdvSvhqBtBwO6z30/Mi9FQNniR2VU4rpkPGT/Cvc59u
	3OczyOeKUvn2b4aaWHedEaeJcJioSZaP7sPQFrZTLIQzReIi/VEToltjbYnjQnXY3MmNlKslul4
	a/y+jerfDw3+gqGL+FLfWPayptwJICzUl9rTgOMji4e9WTmt+UyjbWOZQZeGpoHJiSCw=
X-Gm-Gg: AYBFou3qUpHGFhC1viL9VnhmZLUxyq85op4icKkXrv8Vtwf8oG7gmFsj5hLV9G3QVXM
	AKh7m0qzJMsVhoS4xAxaos3KDSJ6R3OVayBB1YXxX7K16dniaGilZfoGJO9jCNFpvRTOZX2ehGB
	wnHq5VtDQeZbC8aiEaYPSqgKHGOdiFnXghneYBbd+gCh0cu2f1+ilzfbhbyQYGsUi8wdMInjSNS
	FEOIeXmKKWpMk8/BrTrecaCk8XqiZ0T9S5qNSwoUjfSZDXGz/7HpNCkWisqSY37aymKzDjd6pRo
	nROnAsllWb8xjomJa3BNIAVZbo5BV+Ti3FkFyt1UAC3WRLhleodqg6N2VDp+JH1y66mSn8Dd/iQ
	kxXeVwGBr0sPSTz7ufhMhO7PC7Du31VLEjz/PUINR11UBkgSk6jeh823AJzbFc2p1lyuQOus=
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr4594459c88.17.1793211532329;
        Wed, 28 Oct 2026 11:18:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr4594422c88.17.1793211531646;
        Wed, 28 Oct 2026 11:18:51 -0700 (PDT)
Received: from [10.206.103.99] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm9112551c88.18.2026.10.28.11.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:18:50 -0700 (PDT)
Message-ID: <687c4153-4a78-4ac6-ba88-1f3f818a84e9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 23:48:43 +0530
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
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
To: Akisaira <akisaira@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <TY4PR01MB140065214AE2B04B2A7D9235BA66F2@TY4PR01MB14006.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <TY4PR01MB140065214AE2B04B2A7D9235BA66F2@TY4PR01MB14006.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6xrN57dFfjJJT8cQm32E2lmZ90dVfW1B
X-Proofpoint-ORIG-GUID: 6xrN57dFfjJJT8cQm32E2lmZ90dVfW1B
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae23c8e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=ALlH8rN3-6IN5QnqSCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX7mZkRzCLIpZL
 V2975DHGvKmFKr3M3lz076vavb4BykEEXDVaCIKrOZ8NFcK+oksOz30vQfoXlixQ0mseuZoJYJE
 NiD7Nm8KsBrVnSjDAE9+YPb7PSNel+7mOjtLppR5MAYM6PkN/gOirmBoUNCfqMCTTqUkviq6/+C
 4o220bT8cAuWsZacjIW9RlJRrHo8bUcBcr0DhkPwnw78yoXz2ekXT7AiEUxhieEBClF0+c361rC
 ewg2Kjbz8l1LSyNW1hMco/LwqagOw4Ynpca/YaFEv5x2UyIsdUikjjBRjsjClcKwm+grqfNgrhv
 iuhJc67C+McESupymavPkDFH9cE6+C43sWC8tcaWLQzuZL5YcUpJ/STfPb3E5PXvCD/yDW36bgM
 K7cHysbCPUJoeV8mSat9urf7qUeYDXZaq0xiHHh52+iK8e9aTmX7FfJFinpeINEUyhLvLr5Wi4T
 1ZM9fD0yW6KSGXm1OYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX4DpNsDCDztns
 vb57l7Wdmi3baZ6grKI8616AL9NPbuASnQ/fj2jzSnS55I9alKRWFbzQ+/UYTzTHjmD/1mz39Ca
 mrEzu4Hq4Xa6eOQAX3YpJRBF6Hsu+Qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280072



On 10/28/2026 11:23 PM, Akisaira wrote:
> On Wed, May 13, 2026 at 02:22:55AM +0530, Akhil P Oommen wrote:
>> With the introduction of sync_state in the genpd framework, any consumer
>> device of GCC and GPUCC which is not bound to a driver will result in
>> bootup warnings like below:
> 
> Tested on SC8280XP (Huawei MateBook E Go, gaokun3, Adreno 690) running
> Android, on top of v7.2.9. Patch 5 needed a small fixup there:
> a6xx_gpu_init() declares the GMU node with __free(device_node), so the
> explicit of_node_put(node) at the end goes away.
> 
> Without the series, GCC and GPUCC report
> 
>   gcc-sc8280xp 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>   gpu_cc-sc8280xp 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> and six unused GDSCs (ufs_phy, ufs_card and the four
> hlos1_vote_mmnoc_mmu_tbu_* ones) stay on unless
> fw_devlink.sync_state=timeout is given.
> 
> With the series, 3d6a000.gmu binds to adreno_gmu, both sync_states
> complete without the timeout, and the six GDSCs are off. The GPU works
> (ANGLE on Turnip), GPU and GMU runtime suspend when idle, and a game
> session followed by five s2idle cycles gave no GPU or GMU errors.
> 
> Tested-by: Akisaira <akisaira@outlook.com> # sc8280xp-huawei-gaokun3

Thanks. I am testing the rev2 with some updates. Will post it soon.

-Akhil.
> 
> Thanks!

