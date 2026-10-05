Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E44A2A69
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212093; cv=pass; b=Ivav+c2j258lbCEWjwXqKEEwDyqCUoyN6DdK4MCKmaNWsYhiU3HHxKUL5ePb1GnoSLm1lAka7kOCCTb9Gekfoy+CKGjXVr/hS8zBxufO8NrrPwjbizTsvLeN/Ra57MyZYdNJ/nNxO7AAdme9PbAVBa0s46gckhi6Xjf1VkBzLsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212093; c=relaxed/simple;
	bh=i0nQ0+XMImW6Os1ZaVv1TSv69h48b+lQNTkAWPRE4ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fo9uppOx6EarAve+plVHeKTLoGFwc/f8VBJ+hCZ68FeJzF12vii6xqUGC8M9dtwPyqz66fL3Q1STHuNXg5q4JUVRmQ4WoRIWyDJIKchMyfC9LRRpPu9LY5aOPPKsdNyY+28oBadIc57cbcWCfJhh505ml3u9q5acRgfDFyxOtNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwT4N7zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzwXXbOO; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwT4N7zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzwXXbOO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP4OC2015019
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 14:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ApQSUFVI2oW1ohSRn0/36SH+054N3pE3T9i78ZQXk34=; b=Rw
	T4N7zleli/KGH+oInNyb2+VoirvJOg5zCbCk38L1ROJ8Fl66nVnmi+UkTbfqzU4P
	9qCE9ocv7QpBM+AkQJjHBtKsTShJ/Yp5ONAk7292RkWgV71cLF2L4AR6p3rf2eyd
	DKua+QumR3H+jlYmHD+y8oCtnK9K+8HT2RzTCZCh8VLBEK+N+GgtXF2qUENI1del
	WWxwCfdbx+AVQdOH488yGn2aua6NePMuCFKILlxsG+yqOg+PqoRhBPZ4XAFBsoTD
	2XS+CCi0DYi8BPT0DruTloZ8aOkkE2ma/IJquD/etbhYStCPgrZMdkq2l5YoLvlT
	fqSrMkfiqOS6M6NakaEg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs2k8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:54:45 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46ac13882ccso1759690fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212085; cv=none;
        d=google.com; s=arc-20260327;
        b=F7+dlSw1UWpi+oaWhbVBbsTdXZpQ8Vu1jyZIGRCTlIskAJ5YZ8vhXBUUxptvTcjPgr
         QLbT1wgbQXDCZLuv44wVP7MF1nttQYY3M1x3ywLtlCjTBaJOfh2eGkw2uC534kwix7Sh
         wqyyRGIsk57DpST6+lLKqwWiIunzzFQ0d1mRsxYQ4Fd+t0pUdUYJMgc7OF1WetB9zDy6
         zV1nUf3VDUv2CD13znbn0jvM/UI7XeDPPUR6BoY4oUWNvfve7qHRVja7yB2n1PTGhS4e
         ZB18RFoiDRLUGnpzM0xM58TYE/cmMHWlKlGHsUFYpP3JB5CS2LtjimQDt7LciCuMaDGe
         ZByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ApQSUFVI2oW1ohSRn0/36SH+054N3pE3T9i78ZQXk34=;
        fh=3ExihctfamZW1gSF9ASPb+7pIujzKyXHPTWouoQghPo=;
        b=K/kXyPQf45Xv8sXTXjP/ax97kqWySYU5R6U7XMkiklchROfjyLS8ja7rtGT4Jxza4D
         jt5rLjsLStab8e6gYslvffruWCNd+5LTDu3vrHAfsj2PSg6sMGP21DtYk8eLonYiX9RQ
         uxsAiD/ovqBHKNv5162OGT2x6+E1iayVQAajWzjHPH44dZ7aYEss5kiSy0NrGrX4hLWm
         VWQCDMpiab1xkq2rxVCKN4sPR9oZGJSlm6foxAUR6axrQO9SP9atHo5LpBrKWUY5oSAp
         j4RhUV+g0vvopkUJHukSUWhxotVPIavaKwFy4fP6Ow/vX+x6ROSmGgMVSFD5f4xYQyMX
         36DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212085; x=1791816885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ApQSUFVI2oW1ohSRn0/36SH+054N3pE3T9i78ZQXk34=;
        b=bzwXXbOOzb2FvOj6m+iji/8UZDINJmyrqVgsFo+qesrrzY4uuM4DmVHCNnTZ7cJBIR
         7f8Q1rZ4hdWGV/t7DiZ06KPcE3V0l/FZxWk+sxzu3D76fFFfaMy3aJ75/BaXbiB2XAmI
         LSKF6Wp4btqTTDlX4YCrr9g/nZmTjncDnd9J3SLr9fIhtWt+bOGQ7SpNj9P4WWHPRQgs
         3IDvWcHPq7hZlCSoDBlWQe1+rlwHshd9W5qMm1UDchqWEMn9HCcICeC0MKnwak6RPviX
         +mP8J65JCZUX61Nj4ZrQJEQlF73I5v27dLQVjZDVnhU+n4PfuoIQ4Ky9O53pkyvAa9EQ
         wLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212085; x=1791816885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApQSUFVI2oW1ohSRn0/36SH+054N3pE3T9i78ZQXk34=;
        b=VcQeq9TQkFqlgPh368UyWwtOZdhMUdcz9KUARFgpDhp8qwQAabVbciC318nYcyCu52
         509aHv2lMskQX9VkZnFOnsexIsMAMMDt1Lirp+cGIhZFUwWugLOur9tcCaAlzf/hud3n
         YBIQUgGRgV29Cba+S0YJwhJhbY7BEpAkcET84f3O+EK3Vnl8mDDkHljvdrsNwtLV6ggr
         gu/wE+2Nbmn6tGsodLnsOiV8cEuZ8uvMxpPhRfD4oM+tXR2jesrxqDZ7/Jy/nr6WPerJ
         5WqnnHrnlpwVS9ABq/DkRRthehbL5HAF65jDDvqO0nPw8LvSwBt2TF4BLoYThWQR5zTq
         6dfg==
X-Forwarded-Encrypted: i=1; AKwUvBz7HdmbhMK4fiW2J7XydjsCWmHNOs90EzIUc0NCyOYr/WWT8i7bVVmzHnYVI4NS6FB625gpPgVgjL7k4NA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeOBMV1iP14NcrQ/mNHOP0+QXV9kaQkQodpF7kkeT70e0u1gxj
	VqkvpKgWY/cgM7myU0h3U9f1aYg48qc1F5umuiP3Lpz2qAmVZQ66gBBW4yOJLw2UD1339qtNR+Y
	JGlYqER3R93yqh6j0Q9w4+0SioMLTAijxMuRRc1sgJJqVSxhFXvQIAemVRIaM9VFgvTJQZu+gc2
	OhuaPVXYy+r8HJBDrUtA8x4CB0NsJr8Xoq3uy/94FT6g==
X-Gm-Gg: AYBFou14FoDoejSU/1WLYT29/MYFKbm4mPOcfa8B/PgHyLpkhJimXZ9WycwrWWxYWCs
	d4tqW/6ULhW9WH5GWzuQwvdtjj2l5+byMGuTGHoGKoI2zkbmmlH8/9zilpvb/Dec6noJ+UHrKv6
	cGrJkCGbVRJyUwVzXjRjmA12X7/sbWARVyUrcPJoTHZ8x/1iK13aUbEs5w
X-Received: by 2002:a05:6870:d892:b0:447:a816:9328 with SMTP id 586e51a60fabf-49e3a59bd9amr5060471fac.6.1791212085056;
        Mon, 05 Oct 2026 07:54:45 -0700 (PDT)
X-Received: by 2002:a05:6870:d892:b0:447:a816:9328 with SMTP id
 586e51a60fabf-49e3a59bd9amr5060455fac.6.1791212084569; Mon, 05 Oct 2026
 07:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com> <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
In-Reply-To: <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 07:54:32 -0700
X-Gm-Features: AclHuK9HudIjSgMqJ3EcpweDFeA8JvXrNOQ7VzbVPGFBjWu5VmzRi8Z8u8xEFGw
Message-ID: <CACSVV00sJmmRqpTJUD4AfB5-LJRCtzdWDTKVCQwH+y-uYYYMbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on handle close
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NP3M0K2a88zJ8LXximBW2lD8H6E2gU6u
X-Proofpoint-GUID: NP3M0K2a88zJ8LXximBW2lD8H6E2gU6u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfX132VLDpgnj8p
 3X9bRbte1Rh80IeFXPKOYhwdF7mrd37vl48YD8yYk5tvtE9N9mWx++kRdbKoN3ZZgczmu9I6xQ6
 2ihFhOxHgHnBMYajSBdMRV+ItaPkZv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfX7OK28P/IbGMh
 PqoQo7VLa/G/chDe/3JLOARG0/tu97SWRc3YZpt2LubLQpQqRc8PFA3r/2iarDQ9wDU01/JYNWc
 jJ0xgFyySTo9Duqg2VHmLmhwCWYph1utlt7FZ1pTlEeHTpu2b6wOBEpXLUgwMYu3wUQuSaYCVC7
 yZOaAFRvbOI4fUIevpSX/ZEMveYcYGsmwa6uHtuM3HU/eyEJBbN3lsj8GoWQoPjDNK1kyzusK0w
 9yqMRp9snzo0i4ssfNDV6dAFWjSrAOSkriOnXdtSEwNqZFfmwwABwIKv4Ldjm7JEakTRb8pW3LY
 T+Hpkbh8AOVxEuYngJNTOGOVbAGw6tXwyGxr6CPojqk1nvpzCqmjHqF4T6ZifnCgGI4Nj+btNOI
 +x81KnLk2pnTovrYDinoTorrO1KayjwK++8aTNfvOZ72kRui0yau8Xej/nrLP0+hzXw1pdZ4wPn
 d6mqPQfhGm4oGG/AYtw==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac3ba35 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=VfJzBMOGgdBi7dMCBGQA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050058

On Sat, Aug 22, 2026 at 1:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On targets (like A530 / MSM8996) without per-process pgtables
> msm_gpu_create_private_vm() uses the global VM, so all DRM files share
> one GPU address space.  msm_gem_close() unmaps the object from ctx->vm,
> which on those targets pulls the buffer out from under every other file
> that still has it open, and frees the iova for immediate reuse.
>
> A dma-buf imported into a second file hits this as soon as the exporter
> closes its handle: the importer's texture keeps sampling the old
> address, which the next allocation has taken over.  On a530 this is
> every ext_image_dma_buf_import sampling test, reading back all zeros.
>
> The VMA teardown a shared VM needs is the one already used for kms->vm
> -- defer it to the @vma_ref drop, when the last handle and dma_buf
> reference are gone.  That restores the pre-drm_gpuvm lifetime without
> reintroducing the reference loop, since a BO with a live vma_ref is held
> by userspace anyway.
>
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 13 ++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
>  drivers/gpu/drm/msm/msm_gpu.h |  3 +++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index f90afffe3442..e73cf49c360e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -63,6 +63,7 @@ static void put_iova_spaces(struct drm_gem_object *obj,=
 struct drm_gpuvm *vm,
>
>  static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *f=
ile)
>  {
> +       struct msm_drm_private *priv =3D obj->dev->dev_private;
>         struct msm_context *ctx =3D file->driver_priv;
>
>         update_ctx_mem(file, -obj->size);
> @@ -84,6 +85,10 @@ static void msm_gem_close(struct drm_gem_object *obj, =
struct drm_file *file)
>         if (msm_context_is_vmbind(ctx))
>                 return;
>
> +       /* A global VM's VMAs are torn down by the @vma_ref drop above */
> +       if (priv->gpu && ctx->vm =3D=3D priv->gpu->vm)
> +               return;
> +
>         /*
>          * TODO we might need to kick this to a queue to avoid blocking
>          * in CLOSE ioctl
> @@ -95,7 +100,7 @@ static void msm_gem_close(struct drm_gem_object *obj, =
struct drm_file *file)
>  }
>
>  /*
> - * Get/put for kms->vm VMA
> + * Get/put for VMAs in VMs shared between contexts: kms->vm, gpu->vm
>   */
>
>  void msm_gem_vma_get(struct drm_gem_object *obj)
> @@ -110,6 +115,12 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
>         if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
>                 return;
>
> +       if (priv->gpu && priv->gpu->vm_shared) {
> +               dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP,=
 false,
> +                                     MAX_SCHEDULE_TIMEOUT);
> +               put_iova_spaces(obj, priv->gpu->vm, true, "vma_put");
> +       }
> +
>         if (!priv->kms)
>                 return;
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 0c2c35636251..31d84e2b123a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -879,8 +879,10 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struc=
t task_struct *task,
>                         to_msm_vm(vm)->pid =3D get_pid(task_pid(task));
>         }
>
> -       if (IS_ERR_OR_NULL(vm) && kernel_managed)
> +       if (IS_ERR_OR_NULL(vm) && kernel_managed) {
>                 vm =3D drm_gpuvm_get(gpu->vm);
> +               gpu->vm_shared =3D true;
> +       }
>
>         return vm;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index d27d54bdb7a7..7722776e9129 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -223,6 +223,9 @@ struct msm_gpu {
>
>         struct drm_gpuvm *vm;
>
> +       /** @vm_shared: Has @vm been handed out as a context VM? */
> +       bool vm_shared;

nit, this seems unnecessary, just check if vm =3D=3D gpu->vm

> +
>         /* Power Control: */
>         struct regulator *gpu_reg, *gpu_cx;
>         struct clk_bulk_data *grp_clks;
>
> --
> 2.47.3
>
