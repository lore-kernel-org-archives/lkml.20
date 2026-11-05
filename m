Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914742;
	b=g1/iOxjHClj2AtUFvSsTW6QKVVCKqXtXMYWudi+66RdzFJny/4AtH+SuaaSAw0xUYuKK
	 M6stDrBaTqaXWPoFRlgYpah7vpozkVPl83ShaJXTZ48V80j/mauAw6kAvs+Mz72Dkh/dE
	 ghmiwWXT5hgDsndId3v/NbzhVZiJVu1/JmZRzbpl3WPSXRLa0wEVFPrZ0hkinGxn/QWOO
	 +BtoYRyLU9/RjvmKep6+ny4wpHqPEO6Y96shwYVlA5En28Ktpr5MembyXyo5iGSrfiXqt
	 837Z8voFAZFObPQEQ6vchp0YOh83/suP8Ga9CC/eKmC8PBPcw/GKjM3/2ghsD7qF9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
	b=iEHsW/dlBRiUqDmM/6oAUVQfSyVrV/0wIluG4ckuwbC3KcgDbUPNicBBpN+xVpC54DDD
	 jD553F1FIh1yojE1NPl6FFPxjsfvz2J7rmZieEmPDHfFUATY+GH1PecF/zzS+j9yiNghD
	 omre6PMO8vszVl6BOtmRpnOKqTcHYgXGzqu2e7t0ixSBZ310rzhZQeC2RSgX8gY5OOnnN
	 iI1W0vkTPnrKEIs3SfV1Q3Fxlw94aMWikbBE+gZF5AkY1vSFKu20Dn1rbXXuFW0iIS9k2
	 aWYehDVj/jRKehL+ZfdQZ4T2cqOm6+tfP1qZ793oaohTBikk3ZzPBlkQzuVFT2/QF3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjNyagW2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKlEAiLE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6670C606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6670C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjNyagW2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKlEAiLE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L623Z2890799
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=; b=QjNyagW2t0YDVsPm
	xuG3mHlKojV9a3jZJ7AqT1B4IgCLZaHpmVhePqzQX3p4UDxjaecymVJCzXene17t
	/XhFUvPvbXanmFDF7hNjJCtitsMz+5ViTFar/DXZRPmox0QlMSsfvZLg7/5aE5bG
	qrME+9vQSqQnnYMF7L7f3EKVUIoEI+cFKIWapqUuNT3ydJPohK0NUMJnAVK95juV
	wbnsVLv5mu3w8HKdJB2mUTey2Sq4sbZN8YLvn0z/VaCeKCYtx07/qexhsgsM8P8i
	R8fWxvKPpW88skcJ1vYpezasRc8qs4vJdz3DDymuiG1P64l02QPvyqRiJPl26948
	qSEydQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs14gg6n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:39:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so4495167eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914740; x=1794519540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
        b=DKlEAiLErhpqC4yjFEmMQR8fe9S3zuhglaD9coBDisU3VHYMtmexZMwwufLQgVh1Qq
         AY78ub74HPW23BzeTb77rINrLOgNrDZZ+A19fkgNDSQTP0ggnLNuZHWHbk2TmeuPq5XD
         Y48NVFpGdW4WPaLGUVw7Ke5n0mavi1rjAzf2zZCMEanPUIpYWaLyHEOycjiAv/mpBBLy
         eJJfs/9NeP7iw6blicceG2xMXY6GzRxID8SQmRQ4r1es6kid8GRtO0+wdsgwxEIagIa7
         1/za4FrztJtnksKie8MYXuFcBbQttYXiMFgOspuhxWkLlxJe/iFLJDignM1t4B8J+O8y
         UuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914740; x=1794519540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
        b=u2WK9LwIFlooVdYvRzkCYIXjczWLo1Ff20qzwueA2J1QI+FPkDaLUV8/RYoDAXB/FN
         K8V/drCeRMrQQfn4aBksgjy31g/xOiRS2RBN/kvL0qYmoz5KMoHudZqCCry/ZHlcU4UP
         eUxf+tJTB8i99xMr+20+QLEtG3uGAWp56YCJEbeWttM5QCBl941mQMfqe6bbMz+qhiRM
         1B6MYEp2G5M7tpGi++Y0OiKcRQQTS/+fIQx6klIXtY+fukFaEqJQlQoOpK66wtHy/sos
         YoahbXAh6bCuK9FRERvqR7P1JuVzNutgFK8ClT4VFAJX/3WfCPYROUh2kKR3ceQwR3Dy
         SmVA==
X-Forwarded-Encrypted: i=1; AKwUvByj/7XCg0T/uGGhjA+TACYPt1qx0cNdcFCvPm09amGvTr4CUV8Wx+ZCPbH4Shv0oLRBca9e2ogP8p/zGnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dzCwTXDb8I3fG5quWvskj6urpj4blY0zkBzEeqD1jld6uDt0L
	vg8TJ9ziglQA3UBv3ZGV5Ck1ysbAVzi94X+M7r5HAwawV5gPRjrgETxkGaqa4wIo987i8nHscPM
	v0VCQ0LWzzSP+YI6CNtBPGvRCK+pO2Y6tK2qUxtCmTQW5ygpKskQRsF3illzIxZUbqKY=
X-Gm-Gg: AYBFou3TM8p6nt3xvznjAW/xufI8T1NwllmY1SpX/EkhR8ovzIJDPuAOyhXBlN2PTEx
	X6nQ1Lnkh1o2fldOK0c0cdbAMBSsNbPehhmNmhZsz/f6u8kQhThkOO1A18Mz2UzfLOJ0wuqCGf7
	Rkpc/RxZXdsgygqLfmLWgp4M8SE+dea6adKNB7i6zIb1O1fTH93BJ1VlzQzysO8sgXtLyCnLr+p
	WYQOIRvE9u/TKHTHirptftBTT35spmUjN2VsZ8MmnkuZdFPlMGJxFvBuNSZ0gqs9mSvUvcVtl+X
	G3Y8t1/cJfgoAgKeYlLs4ckge50Wtc34htzXbkDFu2HIN2CUAKM8Z5ZdTBaoNBeNhPrNeRWz6lg
	E7L2xO8R6HeOS17BCIW3Yjs3zEe6KJ3Z/zbssOntI+GcU0fjE5rsZgJUTc8ijGKEu0c/5ipE=
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr535696eec.23.1793914739860;
        Thu, 05 Nov 2026 13:38:59 -0800 (PST)
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr535655eec.23.1793914739304;
        Thu, 05 Nov 2026 13:38:59 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm1033032eec.13.2026.11.05.13.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:38:58 -0800 (PST)
Message-ID: <9d91e39c-e29d-4e1f-804c-779a3aea21ff@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:08:52 +0530
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
Subject: Re: [PATCH v6 04/15] drm/msm/a8xx: Export slice helper
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NI1AaE6g c=1 sm=1 tr=0 ts=6aecf774 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QynUOb8fajV056UlVlEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: X6pMYGjlP2zSewBngZkDtx6ksbsusgUk
X-Proofpoint-ORIG-GUID: X6pMYGjlP2zSewBngZkDtx6ksbsusgUk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX8Us8DdjIlObz
 qwkvbTsVisGQu0ol5Lf8qPpoQSifvCuVcpLyyW3nv/sWDRiJet+kRmCCxr/QjVhbYiZSpUnYeZR
 hig41VGm+7cTBkankLYtXUsBh262fL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX1+ZnLYMvAdrJ
 QNk0THZD45f64Oc3p+vvXqvO3GfU/d4OUNbcakrB+zUNSCp62V58a7N5zwYYPC9zokr12mFwJIu
 f7G+EcjLlkhBt8gdJ2fruTf7iD5MU5nZxF8/mbkzw3G2G0+RfcouvUqhqr+XLr9T0BQQ3icoy/z
 dRiR2oAh0gIN3EbSan0vWq08lUV1BeiGf2OWwYWO6TNvUqQMNiGri1GoVwItHKNtcChulxz8Kq4
 GO7Htx/LmKo6H7kd9/REKgcDNeYDKdq7Uc3izTtaqUoF3nDTqgbf4BKvcbZAPoiNbis3Ma1m+bZ
 ldvrIHj40xNFp2MSbf6VeQWPV7xJKEJNJC+uOTQnUzzATucpIZ00GGQ03dtGS5RZFknxYPMcPLd
 x+Ok07yeQVhS3yweGeuhKIcXF7dB0BDokgEKmuUDfA+C8yR+8+8nCoYxgm+fLu/Z1qquUPe8wf1
 g+mN8W22mfp+05Gvmag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> Something we'll need from the gpu snapshot code.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index e6ec85b20fb7..4a3898e58aee 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
>  u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
>  int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
>  void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
> +u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
>  int a8xx_hw_init(struct msm_gpu *gpu);
>  irqreturn_t a8xx_irq(struct msm_gpu *gpu);
>  void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index be81f141300f..a29f8149493c 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
>  	}
>  }
>  
> -static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
>  {
>  	return ffs(a6xx_gpu->slice_mask) - 1;
>  }

