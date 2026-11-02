Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619452;
	b=LOhwcSsAUAa/d5gXGQIP+h1/NeI6XJVRxcVUv8SqouWyUPOFVUPKcTJwDW0e54KGUvc7
	 BssSsKDo6YNZCWqt7XvsPPItC9OEcJYt9cOl3GY49Zk5ZbXRLFRYn1HurFmB0Mz4w4aN3
	 Sxfc36o+ElTvfjoULy1tomen0jZNYKvg5EC6+SukVnD1hcKmeUaX8cF8rzBqCdphvUuOm
	 VI7ddbynjrUT8vmJWlPgybhVLXJOTmuRX/kwLRz/agj1jjptJnaUNUOAP0KGThBqC9kln
	 cswsNVZ5XIJR3tcXnnyGFJJkpqknKKCAkOBNQBll0zCkL2Ma+p1MtRosMXRDLBjEMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
	b=vVTx7SMVF4RgpNHHtzrwyvH+oDFvbItXi3cvcklV+P+4YE1jSQKYO5AM/NO75mAHqs9e
	 IygPprVsE/+blIyq+UgAsSzwFwEBV4K0x+/+wAZ55S7z0JJnLmUysR8PlvqKshzU2PGAU
	 GcnkQQI6pZ1MXe9DQlBdynoPM2ksgEkHh3O0c9zXdVSJEtjAlkAEqqbiUdWuoq3Jh7TaL
	 iCprUCk6dKiCKguMgLj1Nqc9XM5K8PHGMpb5qdmLselVFl8W4is3+rfNS853ZhSEyUY36
	 NQKTcJcI7McpFCiqueAPbYNcWFQg7rE1rgp6O28wLz/Wq568km55o+sWtqGUJDKWf+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FOHN0Jo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggj04WYg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BF606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOHN0Jo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggj04WYg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2t3V076883
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=; b=FOHN0Jo/PPK4bIMZ
	8ckz8jaPw64Bt/NYZ5hr6Vqm9EXJQX3hi49V98CCSiVnEzYlaNbn8uqQlBfL8wQG
	6NiI2Yq6NZDrECUimUKIRzfF+qB+WavE5yfEE533hKZZZ2uNT8tYmN3qFNmn/o/7
	qIXmokyr8r7n6iM+9Wo25RlFB9Tb+ZcWy5mAPwMmDrwCeijBqm567M+KSduQMwf7
	+QTurWTUrHxW1Tn4bmcm1qBSPRwc/Fheu3cZ4tDlrCkNMrlvsgLRtXzp7kuQb8Yi
	/jxmJGjjkgXL1XF3o0iczOMKPpntywZjNc2lGqQJep7KQVGZvTJghg3vYlGSzTf5
	9zntRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r3vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:37:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so49559585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619450; x=1794224250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
        b=ggj04WYgJzqmPAev88g0BRuCuvwKSPAxl1gJr/jASV07q3snaUSDCn22kwabFRPvKT
         lT78Q3Cm/kpt5d0SVAwhZCM7a3HZQM6DTPZKNxv8B5oWWKJNGmdrrRDhmXGpdN4aDECx
         NuHLYoj8MM6hRP5bgv2wVUoqWymC+ZDoBkxoCxcDqWtCID3kf2xOqoPPHzTqnri9K2z7
         6NNKEwORzwjgWwnExPPM/tWUtr97x93deCwqZFWzkTJLF3IfVuWCKzGzrr5KqamMHeJ0
         /RooypBSxZbhhIqHgqb9/Mu09JcL+dA/ZvZD1Nmb5/X7WGyZGGposYF4WXmVer8Y9+hu
         6Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619450; x=1794224250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
        b=cWKZZnCmcoKw7tMX6THpGQ3KKl97WE4M2CiR/MIoReHarJCX0zgyIhDXliVbZEInHJ
         l5dAF2fhfGIlmvi1FKfcGT5xh/pg/oRVFDJIVU5J5E1Gu8oy8e3GaLsiRbK6zSdaNqXN
         B2qrYuJptppH/9sq8VohH3hfIrcigO/GwmOxNKWbxq79YIZvsvnm5htXYh1tHB1j1HpB
         pQSPU7WIHWcuwz5Ypu6/mY6EjvKBytSpvjllCMx7/5n+l4GQqQNbLLyrXpWOFTvdSH3O
         F3YoPJkHmZbGhpoZgFNaLJ1JFTMLAsQ6dQdld29PlVjFA58TeWcYRJ3DGmzbZliwdbnc
         bGNw==
X-Forwarded-Encrypted: i=1; AKwUvBzyNqE0X+xOUi6yMShGoMyZdIqCmWwcF+X1JuVd++rVKa5smCllod32LcdUbn2F+3/I1I58fGnbsI+pKlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgyg24sJowjrdz+aIjg9t0GtTQTTkoRNzUSLwnYpJwlRaPSysb
	M6N6cPys83+yg4Ho3pLN6m7G7lZrUFWUyF91LYgSrKWESCe1L9qE480sMI4k3XKnDUNzYwhcFUX
	fIr/QQMY4BJUZs2344T+RRn+o3usSf0GADTRwPl5UZczefN54uq6ux6uzqznMiUo1Hqs=
X-Gm-Gg: AYBFou0cBm5ExKl7gyn/1m22hFqMjhdqHBjO9aXbufnqxAjT6Tou55OY1Mo+5QDGUoT
	LbkSVtAa4MV80nb+edlZVP/eCj2FY+QUp0baUNpR6jjg/3ch5h8Jfod3d/a9NEtJipl7DSzaaSf
	CALT0NqrHeduqe6qC7sMAcTbV7QKTSpqFxP7BgpUVUh/Jb3C4V/YxlDJp5GOxS5RkY6S5kRlFJK
	k2FcmSjGVhAA0qtH06JaHWScAjLML4fbnoLysILGCB8ExPbyR2CQJm9HljFNiIruJrGgSnBgw97
	pxEi28RVQwkQpRWPixp3MX0fqfYl5Ll/+YuQXOP6DDSRithRxOTg2nxvfpHZJT7I8neUk23466A
	kIu7GFn4sLbgucl30DaEPtx13bbE+ohv+If34ncWj8WeJpsLmGFXXDkaK5fIFxDWn+5nQxxc=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1571834585a.2.1793619449799;
        Mon, 02 Nov 2026 03:37:29 -0800 (PST)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1571829085a.2.1793619449327;
        Mon, 02 Nov 2026 03:37:29 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd22bsm372126866b.28.2026.11.02.03.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:37:28 -0800 (PST)
Message-ID: <b967b192-b34c-4def-b7d7-35c0a21cddd2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:37:25 +0100
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
Subject: Re: [PATCH v2 3/8] drm/msm: Keep DRM private data separate from GPU
 drvdata
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-3-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-3-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX1HncLzCzwwgQ
 GnRp82g1ecZT1IVs46q6vRQvuwJwB0I0Be9njkxC7cWHuzmacRq24XiFFYL3ZEDj5EG3FH5Ns1W
 mthz6f6NKyd8JwQj/5Ko+kw+1e9YPuoqg0EpCPwehsO/pxdCsP4bNeuKVOnIjIbZG4L0GynmwIS
 4Rp3mwx1BJy2mSR+m89IqYe3Lx2jRq2kM4bOJfTZCSgjlIlKfavhqNVnfun7U9E7z6apMctMqa1
 OsclilFFLEAQWxVVaTVY//WOat8hYygarD35Yubwldbq3B1EYxFTzcGzsN52iEOdlP6a/V3C6Re
 tmmhcSLlPBXSUg3Ai/Up0L3ilY5HfpdHNBSpptaTEIMXmG+uPG9/DIONREv8NIMa6E9Nrdt/Fdc
 V42OXnsG69sSbh7K7n5n86kXr9DTOZEES+ACICLwD7WwMwH8udHIceryDV5yl8C1BdKqjdiVhNh
 P80fIVHXsPdofrJyZLQ==
X-Proofpoint-GUID: _EgbQp6EPIYrJqRgp2uiRu3hCVURSDx-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX7EHFV2bb0YPV
 KL2tKkNCvrac9ra0n5/S6f5Nq7iXe9TrHhj//F2e+CUUkci/BgM8JdYn6KJHBOFoHH8nrMtynte
 YNH8nfVim5tMya9NCe0BPHRCqc//MVw=
X-Proofpoint-ORIG-GUID: _EgbQp6EPIYrJqRgp2uiRu3hCVURSDx-
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae875fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ifS9znPv-Fj3RtktaGwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> In separate GPU/KMS mode, the GPU device is also the DRM component
> master. msm_drv_probe() stores priv in its drvdata, but msm_gpu_init()
> overwrites it with &gpu->adreno_smmu. So, it is better to avoid using
> drm priv data in the master's dev->drvdata.
> 
> As an alternative, store priv in a devres entry of the drm master and
> retrieve it from there during component bind. Update all component
> drivers to use the new helpers.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
