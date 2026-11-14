Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794668623;
	b=Vr+nEWYuTUmDGJEXt9n4e4Dup69q0WoG2RDuvins/gbDoQvrPmYpseGRDJntlpc3oion
	 JLKWV/aL5J0zl9AGME4UXbH/sGifpHoQ5q36grD6i1yTHs7ZLJzD0xO5EW7Y0G0LgmuSQ
	 M3BkFZ7tq/WhJ0vQ4mbzCqxwarxliSXDDWzuEJ/FMKYNIwvx5vcVNvgQQzgOrbawyownL
	 BHMCqXzOr3Pf/O/PO6bwGDiv0+7JKQ1aEfX45s2cmgnIq4kWUlZXjgdESSMnzFaiv6APh
	 sxheJilJsctKrjPEmWfWs3v99qg/AuhQcaTrK9tnHUO2Npuaf0MIe979qPtzKybpEmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
	b=SChr/nhfbro2cuOtGOK65QGn1GH1VfdgPsCuOyP5FZQHE0n3z9IU5ZoHGBs9Qjhob0v1
	 aUdi2uvY25xvNwxp2Mel1da53ANXmfcNcfXk+aUw3Tu/cppXJOO1Y8JXf89kaZFAEwTfY
	 KU5o73N2qMLyRtMNLzFS9mL4se5eei63Cag9PxQFbIUsyu6//8vCDyIR/ponycupXWcDE
	 InleI3SuXru7CdHZxt1Yc8F6b6dPU2TSRLjHd3e+f54mNrLM4oXGKcYus1Wd7+ZUZ9ewu
	 AnGBLWl4yfoA9l1ZCfRVSGyLflE9FXTSPvVuVcbsIoj1kA85Y1fogeS+IJ6ZM3+W5qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJo1MP3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRmdTzyx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048C606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5048C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJo1MP3c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRmdTzyx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkhn34184261
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=; b=CJ
	o1MP3cF9U778Fl4UAjeW5R/pFXcIzfxcQ7rXLhxZjZpIMvPmteXIGV1bTl3Q/0uC
	hZwirgGUScYVlk+F5XMDWGUbg6flsUK6Dmk5Ef6/f2K+OeIq6i62seYRD4B42hrV
	VM3e1ZyYM9pkvjEFdZIZ5JMeAW5BA8O8tlVswm5rkbvag0+b+N/EzC4kIM4GOzsk
	zN2PJR6Qga4G0eFO7vLbdVSaIUv6qNSB5atb69gwAzQv9ANqEzxRDX9cz0yPeKsq
	B+opbSDTAGS4DpiAzqpKkD2zoFBA5R31CWGRCWO2jSjthas8be5uQQa2qSc69eUt
	fuUe4FvonoYrntg/UIjQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk2113u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:03:42 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71ad455a8c1so206394eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794668621; cv=none;
        d=google.com; s=arc-20260327;
        b=nwZz5ML5afL/pGtiYHvGVDawZD2toIEN8nhphekO/skYaTX7nMDZ+ZWX9OoCFW4buI
         S/3A7+Wj+02ibje5Uy3eOzAkNrwSD4rp0K0aeMs3HCSAFOh0h6bSMmhefM/n+r08u1nt
         e/8B9fLUTnbGTJmvxa3IJfkBQSE5ia2KmkMHO9pEoeJIuKsPtlB7Jx/Sr5wL4aOHgjFK
         ismAXRyoJgVmN/TlhSzcEK3w004huudIvBsRFZcHO3i7TtwzeV9wNt6KudkhnsFu9I/c
         +/PhIMrXzGrhlEZ6k1Oa7LJYw/SuGZGV7Zz5Rar4kya0oBb1oxBRPhodCisTkM0Yydqe
         ltFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        fh=yJfiRzCk6MVw5AvgkeptR451k1TuFC3jSVb6Dj3vIN0=;
        b=YI1B8h2eUEddhKsZfxwiPqQ09CTAfc6ot9fvTEJw9zbgGBgQUVqT6CpFu42ePUiozb
         TLD+AIidjx8Y4Y0YL4ALZrAbj6sO3dWswxNU/EF2FumHTBHixsFXfzky6sn2m8FeU932
         K0DcfsHERN0Pt7y9IdHGrzWb+4x58zrWvtl/oFU73CrKGePWz5+BT8SfWSL+LLzx3S/l
         iIwcWd1Rb8S524agBu1KcD07cjw4v5fFez0zLN3u6sHOOs/1/YpZwJZeXwdne8pohl61
         96B4hYb0dtwt/MpkVtXjbt6s3RS8mKo20ADGPVII3K4aqCys50/g+u11k0/2vahOJmw9
         qQ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668621; x=1795273421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        b=gRmdTzyxeck1puoWqPpsrthiBIw3Eu1cKf3QHcfnBuqRFpdu1fQtuIpQLW79qiszyk
         jnHFMgRAfVi1SXNBeVi4gr18Uy+4d/aRdpOI0mFAsjElbsEFo76ZlZzxTeNVlCVKfdYL
         czvavHj+z6q0nhvEQX3+PubD4uMxjI9+ssbNcU4xlE9IO+VZz+0FbidXLx7EFX2VrUIv
         hE+60HnxDvjO221tQYXFJcEZ3/Qh+SOqYpzjZOWNwW2iWHTY1QfjK0mWKdesF9nH/vXB
         5yUchoWyEW3EbZdE3ZnG9cp3UJune0eumUCfvwNrBr6hJYPTah8ecwjQbsE7jJ40k8sp
         cXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668621; x=1795273421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        b=2IUnB46x0gsuHlFh4dcAPHaG2YSRT3tlDLVcfvc0rNAJro/GE5pw/wRjBrUVHNZi4U
         Ly7Owk8BNkTvHuSxXUyP1yIsw/LYgt9IVjtz+I/E1hy4b9Yz9IlJkBS6lRe53hnm/lIx
         uwShVL5v+uctMRAPn6btfg2oQgON8P8/LnNUAYbznLIFreE7IM4x+mf5iu3VdZoU0eca
         XZxXHP1+q9bFUTprYd+WMiLVFZz7o8L3+D2sC/6TEViSR9FLHFq96BpzRaBK+tVEOuI2
         76mLhf+JydEKGPf22Q0i9TqvAL8yjeuAVFrJFo5ZfkUXoafudpDQuKMeLc6f5OMYgW4i
         0XRA==
X-Forwarded-Encrypted: i=1; AL+hErHOE68b2ADr6oicOKkcEf0N024awEy1kJRb81VedmQmrX3sODHU/ouFr/m91VGAB4ihZsv/7a6TOAEinwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R38Pbwh9e1kPBju6yW8zoW+xbM1DzY7RtQSS4GUPZf9Td2M/N
	lpFbZlaj1xW0PaqW2CDjEGx8SogI1ITVihprsobV1cocZ/V8JWznBp/1mZSRtoNsN9g3RVjOWck
	kHOvuZN7QPvmNu1Iw1VWNyc/z/4woG/xLF9lmck5UA1arZDWZGIGmwYedJyOBKwiMGF+YgD/LqD
	/YiMi/udP4AldyJj3wQwv7FjXxvlyp9DlBk2C8jY9MPQ==
X-Gm-Gg: AYBFou2YvbNz9DPenpVud+dAQrwjbCZLO2JL5opkD96Zk4qUu7MnhA+uNluaxkPPGzd
	4K0iAnSMzC+M7+FEwnZRfs0EVksAEEEWFtYSoZndNL05zz/3RevscH7RPE8xypokmpD6/N4+AYz
	gcE+dkm68GjzvU20+kyWvMFJvk0ncb0xLR4y7JACjYa6qrn0tTTmsE2ytqPeOpWJPM87AUVQKSJ
	n6sqFpQ9zeUoMjabEao0Q==
X-Received: by 2002:a05:6820:c0d4:10b0:712:c3fb:b4dd with SMTP id 006d021491bc7-71ab5101a6emr2292830eaf.58.1794668621133;
        Sat, 14 Nov 2026 07:03:41 -0800 (PST)
X-Received: by 2002:a05:6820:c0d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-71ab5101a6emr2292808eaf.58.1794668620683; Sat, 14 Nov 2026
 07:03:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114081902.1669-1-arpe1618@gmail.com>
In-Reply-To: <20261114081902.1669-1-arpe1618@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:03:29 -0800
X-Gm-Features: AclHuK8KPquTQTMdHPjuGHN_Vjcpb4fNt0tQaGS8PVmX6JLmxM8xgl-PL0FADhg
Message-ID: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
To: Jiwoo Kim <arpe1618@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kPvKXRltIyV7KtJOgGNANTkNoT7jtopa
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8784e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EtCpCjh61Ki2hOajGtoA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX5zXnt3dLThGK
 GsVuuSVeXX/gUPmePxTeIxMo0csarR05E6xUFAjYKPIdFr4/F32bqULVhjrD4fY3yav2ouX5y6p
 Te7olu2FDgtyoEz/g79ioyvvtEkCW2t61iKzmmuOc4tc/A8VK2XudrbcG2Bkk+szYIYeIhZbQm2
 NNx3X+3acjsUOsEuHRyf2+7e9IjicL3XR2WpSd7X6znnB528ZCKwGz3OigUlcNJ76W6hKwsNv9V
 /efWquBUygs851ksTBNtUTLbpi+Jkowy2BXRLoIOfIrZlf7kElhbOTpHcMVHtTWoU44eVCJkg4V
 HGn7sh6qoFO1TZvOCzGyd+cYaw9A/wIO4bq7vIp6uJrq9c6pEVcuQwhJ43EVsJEdXmhOcXhZAl6
 BvQgT3d/qSUgvz5YZYrx/woBm8f06TpARdcB7PK7qs1YiCrczpMaaMpX1SPabWrsf71PAWTEXz7
 btbt6bUAc1SmlTU3+qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX3mZ9FeMFXgJ0
 +2MqdMGwQ/cri6NzVdoqMKajaQCwsq3Oc66LtDSTzhh0qeqeHBtQr6XpUfsXFxl4yki7vvk+OlB
 e9A9fPo3QUYZxhEn/XCxk/rjX2FFnBs=
X-Proofpoint-GUID: kPvKXRltIyV7KtJOgGNANTkNoT7jtopa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On Sat, Nov 14, 2026 at 12:19=E2=80=AFAM Jiwoo Kim <arpe1618@gmail.com> wro=
te:
>
> These fix what happens to VM_BIND jobs, queues and entities when the
> file or a VM_BIND queue is closed while jobs are still pending.
>
> Patch 1 makes a VM_BIND job that is freed without having run apply its
> queued unmaps before it drops the references that keep the unmapped
> pages alive, release its BO pins, and mark the VM unusable, as the VM
> no longer matches its pgtables. Patch 2 destroys the VM_BIND entity
> when its queue is closed, instead of on the final put, which can come
> after the VM's scheduler has been torn down. Patch 3 puts the queue
> last in msm_vma_job_free(), as the queue may hold the last reference to
> the VM.

msm_gem_vm_close() waits on vm->last_fence which will be signaled
after msm_vma_job_run() returns.

My expectation is that if thread A is in midst of a VM_BIND ioctl,
perhaps not having created/updated last_fence yet, while thread B is
racing it closing the device fd, that file_operations::release will be
called after thread A's ioctl call returns.  Is this not the case?

BR,
-R

> Changes in v2:
> - New patch 1, for an issue that Sashiko reported on v1 patch 1, which
>   that patch makes easier to hit.
> - Patch 2: changelog refers to patch 1.
>
> v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com
>
> Jiwoo Kim (3):
>   drm/msm: Release the pins and ops of a VM_BIND job that never ran
>   drm/msm: Destroy the VM_BIND entity when its queue is closed
>   drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
>
>  drivers/gpu/drm/msm/msm_gem_vma.c     | 77 +++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_gpu.h         |  6 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++++-----
>  3 files changed, 102 insertions(+), 31 deletions(-)
>
>
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> --
> 2.43.0
>
