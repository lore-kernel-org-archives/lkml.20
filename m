Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005197;
	b=0Q/Wc30IVoibVlwBR76PbLIGBPTCjhOOUF+LVXECT1tlbVYAA4S19PgqxscmlpsgynVH
	 mvesRnYC0Z6iiS5yLCFmHUV+Hj5qZ15ijidrXt2gqI7j6z22EbMIYlNg/A2Wo3CmeDfmI
	 4e+JdHWz6dVjvDdKOmYXCUOvLRizgbVVbh4DImNFj66ulWF/kTEeGtmXf4XNVH4/XOvUH
	 Dx2SfCgyq80ieWfDX0ak2pIdv7sOCCUvuXPo1DHDPRTXnkjrUNdZ1AEiC60JdfAU/6QqH
	 P/KqtnMW1DaHKmkdbQ+z9fNCNY7XX5YpcItyVGCG6fhvrB0QWfM7O7pRFgt6FLAWmoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EITttCplPBszuYmRY3XITt4UQcQyLGgPfNuHXF+5Hgk=;
	b=hIRBiKpn6Ll9VMSoV982htNifHhDTr8JXw+tF8a2+2M3z+Y05Y4PzTM/Q+5RsDKjIMQY
	 jT4x7ZyTLlraCEoS5RLx4uj25bl8Y0zCUFfFH9bEKejwFpyLRQ4MdFAGKCdB3SOLYNizh
	 wMe6I/HNYCZ3VplxTnDzPuyT4E4eXHlfcA/ggWMmI5ryeWG4AQbZlm7XoH6R474aCRu1s
	 hlB1j36CkqL6ofj4CQRBIwPFsOyxbL63bmI+QDQf6JyTQcvFTgWsy48Rv9MrC2GikoVhK
	 QrgqwXxvsZRm8dNU1LHKc3/uHPKnvrDzyV/7GsfSyiDVcr/9ULgvddjuiy7jF5y/dFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFlPsP6N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMHJQPWp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFlPsP6N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMHJQPWp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9dE2728036
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EITttCplPBszuYmRY3XITt4UQcQyLGgPfNuHXF+5Hgk=; b=UFlPsP6Ni/9BBo8w
	bsRJcpKJmfnq3F/TPwop48kefP1i+H/QqCheh0KVa3P+uejNFwzIxLwT26hltKF+
	2jfLLZjYsEi7NFvvoj8ojZQ6/KQuSdDPHMD/7o139NLK7xP9l+hhnHVgYcMZsk8L
	ZQ5wpqL8fXckWanU3awtl8nmxk0P17qWRYFjAGcweH1OZD49SZPrU1raE1b6Z15S
	XSzUUdkQf7D3rW8T/CJ/xNRDE3XcirAPbXBkbKt+jXGzmXaNd9fsAw60+7vYpmu0
	1ms5Y7AOf4NvWPrzV8h5OrvYy47895KXSIHwaJvQaZwqmGSA0dZ6gNVL1uAvgqst
	MTXx5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nqjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:59:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so2807871cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793005195; x=1793609995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EITttCplPBszuYmRY3XITt4UQcQyLGgPfNuHXF+5Hgk=;
        b=hMHJQPWpMIdzWQgpQb32wEzEd77qcQ/Hpd6jnBk3H7XsyWcTkG8w1hYDDCtOa+hhB7
         7SmGrQBRcGzpjqZl5misnqnRfbw/BLHV5iceFcn6z/QCe478yv2tiNsoakFqDLlYJD/f
         2F2Qt6zLAL7Wfr+wf+hBDfYAb4CqTu/BjJKxji7fZlqRgIRokKgskGss6SF+aKVk99m2
         +lob1YnGZr1yBM+KjMjQ0+VBwjxM3ilcxthSezQcMAW5azCDjillSKaeMP9VIlC3qZzV
         H7Jd+1EJodH4CG1UQfi1ciFf/2JS2PXKLJwucrjmkVWyFaWEDRSgAH41BgBJAPfM+VLm
         Xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005195; x=1793609995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EITttCplPBszuYmRY3XITt4UQcQyLGgPfNuHXF+5Hgk=;
        b=RD/ijL8Vxuh7DbSbyX4iKqKaOkZ+VBGI7bKiLl1/A568yQZ1bb4D9jGjihBrDmBzdP
         YhGGRCYSQ9d6b4HjK6RLQwIVPFfpC5iUNa5CnhHF8gSBPg4Jw0hZa1LJTLgqkXUsjdtS
         c/v6BqL6KcuvGXgOBB0aN4x5OKLI6h8l9BfrcSc5542708MySeKRr9Z0NhdK4Prqm+nz
         hqpoZ+mBfcNEW6dWD83s7wy3lZncq+PY+s9c3mFO8PfBuKW81/rop1whT8bTobstuHio
         34HpzimXrk0VC8I7DanVKEm7rjfeK5Ta/XGeHHxJmWdqIVBLNDssetMLAdopyyIvy3x9
         deBw==
X-Forwarded-Encrypted: i=1; AKwUvBxLgDOLp2Qb2bEJ0gKs4wMFjyS952E9M/2b4Y6RddkZKVnVzHg+LR/lVtnB/bpkih3i/nR8LnvtnG3GLs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcZpIuDvSVgFc3IWRfEYrqsLsoyLF+EXHORClkDYoRu5AcjURn
	sB8IH8qexfPuLJ67l3VJussTUsHufZRTVegVQrZv/G0BY7GesKlCkBmwb1b5LK1h4ALLWfwIdJL
	04YYcDR2EHSNUw35uXMHJagL+K8esnv4oDewXXtb0A1YLUEvXvpDjnD9L+fqjgyx405I=
X-Gm-Gg: AYBFou131lmQiBO24p9Z/UnzJwMhujl5yWqzNlpbis3tLHpqYQY/bAc8V4esYsj20qk
	Vh6B6iTleqvZwT/Obt2jSNZJnIpJL30Dr15sqK7OO/iCd0LVa/BAs16M5KC4f1pHryEOcmpSARD
	rMEaqcIjFwoGBUe70omWoGzySO9Yl4TRCBaZOre7lHVnrqRLgJ80Erf1VHCJoOEclnxckB2gH1n
	1MADJNiRKyQogrvADukSI2gVS18YmuaBGCK1ZqbaR2qnTjZqzt8bmQUAKm/rP1OyS4G6d39mH3H
	RmnW7UE8CD9iC4/riJKohGdIox0bDUOHqw3FgITeOYGb9GjSKJellvP7ZMLxNdfhvjrz/S9xRFm
	dMcMXzw+O7tSJU15jq64/cg==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr940738385a.1.1793005195103;
        Mon, 26 Oct 2026 01:59:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr940736685a.1.1793005194699;
        Mon, 26 Oct 2026 01:59:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3437518a12.28.2026.10.26.01.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:59:53 -0700 (PDT)
Message-ID: <109df222-efc8-4298-9bc4-937ef9edb59f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 09:59:50 +0100
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
Subject: Re: [PATCH v5 02/10] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-2-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-2-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OMoDaT9mp3TIB7wXsTkkY2Q40LkSzdFg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfX6t5TE2A3Wqkq
 vJrxddJvVfmfJRfzJOSR+h4W/Gb5ShaSPrbEVaUq88HOJZlyzJD3ccYjkgIfrRu4mp+QBkjNo6e
 o4GGlkzqOOhXL3haudigmUebftyA4jE=
X-Proofpoint-GUID: OMoDaT9mp3TIB7wXsTkkY2Q40LkSzdFg
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf168b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mfa03keUj_DI804JYAIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNSBTYWx0ZWRfX9MTQpYb7mQxo
 tF955m/HsM4oVeIrg+hA403HJZK29jSm7sR3MpiIxabNhTDZVq7UDKRc7ng4l708ZB+DbC6rr8R
 q8e6sKMrs2mEmvkdMxEa2mFBV2/zzPnvb7YrSCwDsqSXC3HCUM3h46aKIQX3RsjxZ19bYvqzu8+
 JTqDEjfIzDdIoR6x1gNSLi8DtSEfaFiT/hwZYrUkT729fji+KUItSqWQq5DHgrwDP72hGG4ItuC
 YnkEnvZ0wVhM0VgxolH0kZkWqqXdgKUZAsv4Wfjj66ux2aN7cD13WiwkPA6kG2x/kIqndBLzdO7
 NzfaFntxdzdqFu047+q0pq2qQiRSHIJiiKyj6dxD95Jd8Evebz5ti05UjltO9Hna2h/4DvpeMnf
 mQADSL7ZYH9CxZFrQHCzrCgZojQWl0+/DEgVivRhpQdjNdHNpnZw1QjwM32s+503ecubhMGjtJB
 +9Lve8I52akd6SJLJWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260035

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> msm_framebuffer_prepare() bumps prepare_count before pinning, but returns
> straight out of the pin loop on error, leaking the count, the
> msm_gem_vma_get() reference and any planes already pinned.
> drm_atomic_helper_prepare_planes() does not call cleanup_fb() for the
> plane whose prepare_fb() failed, so nothing ever drops it.
> 
> Since commit 8ac37c88f991 ("drm/msm: Refcount framebuffer pins") a
> prepare which finds the count already non-zero returns early, assuming
> iova[] is populated.  With the count stuck, every later prepare of that
> framebuffer reports success while iova[] is still zero, and DPU scans out
> from a NULL base address:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>       iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11
> 
> Unwind properly on failure instead.
> 
> Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM:

Regression: writeback path double-decrements prepare_count

DPU writeback swallows the prepare error, so cleanup still runs for
a count that the error unwind has already dropped:

1. dpu_wb_conn_prepare_job() (dpu_writeback.c) calls
   dpu_encoder_prepare_wb_job(), which returns void, then always
   returns 0.
2. dpu_encoder_phys_wb_prepare_wb_job() calls
   msm_framebuffer_prepare(). On failure it logs and returns, so the
   error is lost.
3. drm_writeback_prepare_job() therefore sets job->prepared = true.
4. drm_writeback_cleanup_job() (drm_writeback.c:501) calls
   dpu_encoder_phys_wb_cleanup_wb_job(), which calls
   msm_framebuffer_cleanup().

With patch 2, the failed prepare has already dropped prepare_count
from 1 to 0. Cleanup decrements it again. Because prepare_count is
unsigned (patch 1), it wraps to UINT_MAX and never reaches zero, so
the planes are not unpinned. The next prepare of that framebuffer
does prepare_count++, sees a nonzero old value, and returns success
with iova[] still zero: the original NULL-base-address fault.

Before patch 2 the same path left the count at 1 and cleanup brought
it back to 0, so it was consistent.


Konrad:

I had a hunch to suggest using refcount_t in patch 1 and I think
we can go forward with that

Konrad
