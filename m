Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F2331EDD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890070; cv=pass; b=uTPOX9IDBC5bXStPeepUdXn5P/+HbYmDWloVmPmFIDhF8r6RH58+SPnvQ9qvYrPRkQHvaC8+5dQb5/nZyaq3ibZQ66XZTx5I2RRsZtIsAwZmvbjZ7G5+dT9nHLKvcsqtp7SRUbz/NtCLMizIPrD2z8CxfJJNYATCZkoObXrbTe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890070; c=relaxed/simple;
	bh=CF4snVwJpsmNrxuorreVZbKmdbnORxXd+hH/uBo1oNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhi6LI3uVhmTb5QLqlK80FRiymQw1z7e/xZS8RMpu+72F4wbw46+gobtbzHbY8y35wVDZzUXKikPYyuclefWyyHB1ImTJvsnAsVeOtOBznodllLAQ3hWN3xU7MvwYcFaXtHgl/fBwWWCXGYtrp2wZcft302Qxcl3/dReWMJXPqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/0nWDv/; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/0nWDv/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1cb48db3eso50802a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890067; cv=none;
        d=google.com; s=arc-20260327;
        b=sSPebmUFJANEo+oYaAjxU1gwDvk6AtlyoCs8L6+OPdmI4RxqdLxZC34DDCMD0hwZZ6
         Am/aQVuphwzFL6yeqmQIygwXA2x9OAmaqXu0BbxeuKNLbnh2EUMwR/EleaLoBMmZ3HUm
         eWbpMnOPffjojCznduIv2phB4SKFyhnN/MNkY+S1X61Ysh2CTXCDvfGPX/lQWoEx/upE
         GRx0usIpfE/B0+CXu8zZd89NL3kh72L9NZckTu65+ZnFpR/q8/e3ahE1DOYKMmI+S4Gl
         npKQQtL7MECpWevEGLjZ8IaJGTKUWO/bnQ6ep6QS2/ts12iWJrRdeDMXJBI0qUU7qHQT
         Js/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        fh=4UMELDXiaxZaYxmu/XdJd/ic9PkNSEncE0cayGwjtiM=;
        b=YreoUrlpmSx3sB5Fncrz0mJCGsmUwFir/+vL9ymwUdYdMplKF5CzVWZlq1qM8Gy8nI
         fAzJNVLcJkWdhR+5WD0kCg0bziODRT9vw9QftJS+zod46k6hMVzzsUklEysBaL5ieXf6
         2QGBHMQJPM2AaM+5shpdUgyD5DtvbnoOS3BUAvIQ+zcn+HjLWiHSJPMUHSPAVI6iVfFM
         m8Y6OMJsfqbseshz5oEj6w/4e1FNcfvc2IREKVJb0+jxfdMLuyotYp3P0dsyrMREMpP3
         RRoWkorLyi0GkcFIt5pBfGO0f8y/RNa1MjSLA4zy7EaEb0MKUNv9SAU+SIpHO+Gkj5X5
         4i/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890067; x=1788494867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        b=F/0nWDv/7rFHbrVjPcT4ZnB4X5iup/fnyu0Qa6YPp2dgF0lP8NsXpEmT/5Yo03xVF6
         wzxW8BYTPqeIKOVdYxgKXxNm5QjQCPso+bHZiGu+s0FI8TaVBOO9pGL2V+Cy4WHKkfF3
         Rwl5n8+T1pAVbLHMyYEbhKUuR3eRi+0kfP4S17k03UukxPwsi+60Us/J5a/toASUORRN
         FL76kImhKDknV1ZUiFhYR3EZsWYtyt9H3UrDEwwQW2Y86iqKxzTffu5+hLbwgxwMR0Cn
         N/6VAJqS2bpo1LX8m+HBrzdkaU8NHrCyTEX5tIZiEoEJpv+PRSOXzWCLicj80Hhx1uJX
         s+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890067; x=1788494867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        b=OoNPh/oop74sklrDTJ1IuO4kGsgm8ctWrnuEk9iAbPgt75oahrL/OvDw0/k+pTvxvm
         ttX8nAkD1Ajf1FbVOHMVPmIj1z7bxKGRulCssHyo90nMLg/BaYepBB7tciRQq1PGJupd
         GDGth/KOFANJ+Cb2kwXakHN8g2S39eARWjaeT9xOFzXZzCy7YslBSTBz1jYACznEATKh
         fZyqniZV9Vd42nYNy8FNccpqMc4O4VGsJYujL5Kc8gQqmbVTSvjoXnb21/yWCyqwQxFK
         afn5Efi8Xl8TUIJzlGCPwx2wlbQ06iqH5VuWAhvPx+KxDcks2aKEX02CNpYhjXqOwRm8
         aSOw==
X-Forwarded-Encrypted: i=1; AHgh+RpBW2xUI2EuUy02ITW79VypsZoL9Jz/zjFH698/Salu39lbUxTf3ckNTdQ8TqKIzrv2qGkLivDThXPsp3k=@vger.kernel.org
X-Gm-Message-State: AFuF++lckjQrDE9qiNKLFkNAQ2nESd+xUE6pE++JBFdLjDod3IhhxEbT
	lWTS6nywlmt+eyU4k+wFkps1YzQmjk9YPgF+dOskEstuvJgRsOPkeyHprxEztH0Ab+vyHn+Ixzy
	rJl5hFd3z2f/GeUBUNenuKO2HviLmciA=
X-Gm-Gg: AR+sD11hiCnBEJJmk901vYMFEKgS47ndTEjT6ZKHlc89gszdltikPfrHX0SOEaEz3E4
	QZ1Bibix/uoGPMNEGIMQP87bsVrXVxcV0s5GO9QzZyLBxdkxlvLSSvUMy1XhcepkoEmMsQW3nf+
	tJD+a1SJIKTChe4q0ct4AbhFk/gKWbNE115j+t8nAMZBantWK8DjAhNfQXPWGDROZ9RPAoQlXN8
	sbRCfiQ6Klq7w9wriGbqCQKGbjbbuBuC/fhevki5Ab21wBEa+wFKpK5M2m+GkQ9Txas+WLAvij/
	hC9rbQ1SFVrEbLLrkKnAHxSTJ+TTRV0nqKHTARes+lig9dtDGT8UnJ6/XFvFOTIqQh5jXrqUxiM
	+8h3iH+xhNno=
X-Received: by 2002:a05:6a20:2444:b0:3c3:94bb:ceb8 with SMTP id
 adf61e73a8af0-3d267429a52mr3685786637.1.1787890066689; Thu, 27 Aug 2026
 21:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
In-Reply-To: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 28 Aug 2026 00:07:35 -0400
X-Gm-Features: AcwNN1XwharkwlC7cSncUV7uNpjfVtyCFXp0PJJugzLcPCDR30LNsSXNbwLuIPg
Message-ID: <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> zero whenever the GPU is powered up again and the timestamp reported to
> userspace jumps backwards. On an a702 six reads three seconds apart all
> land in the 500..1200 tick range, stepping backwards twice, and on an
> a530 the OpenCL device timer conformance test fails because
> clGetDeviceAndHostTimer() returns an end time below the start time.
>
> Save the counter in the suspend path of the affected generations, while
> the GPU is still powered, and add the accumulated ticks to the value
> reported to userspace.

This is useless because the entire point of clGetDeviceAndHostTimer()
(and the similar thing in Vulkan) is to match what the GPU itself
returns, and now you've broken that by adding an offset.

Connor

>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zer=
o
> whenever the GPU is powered up again and the timestamp userspace reads
> jumps backwards.  Accumulate what the counter reached before each suspend
> and add it to what is reported afterwards.
>
> Measured on an a530 and an a702; the GMU parts keep their own counter ali=
ve
> and are left alone.
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  5 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a4xx_gpu.c
> index 6392126f48f2..7d9dd9460f5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         int ret;
>
> +       adreno_save_timestamp(gpu);
> +
>         ret =3D msm_gpu_pm_suspend(gpu);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index f1df2514c613..c5552f1085e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x000000=
00);
>         }
>
> +       adreno_save_timestamp(gpu);
> +
>         ret =3D msm_gpu_pm_suspend(gpu);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index f9de9329dee3..106cc2ac55ff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>
>         trace_msm_gpu_suspend(0);
>
> +       /* only the GMU-less parts come here, and their counter is in the=
 GPU */
> +       adreno_save_timestamp(gpu);
> +
>         a6xx_llc_deactivate(a6xx_gpu);
>
>         msm_devfreq_suspend(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 3370cd44382f..f83960b31901 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
>         return vm;
>  }
>
> +void adreno_save_timestamp(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +
> +       adreno_gpu->timestamp_offset +=3D adreno_gpu->funcs->get_timestam=
p(gpu);
> +}
> +
>  u64 adreno_private_vm_size(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
context *ctx,
>         case MSM_PARAM_TIMESTAMP:
>                 if (adreno_gpu->funcs->get_timestamp) {
>                         pm_runtime_get_sync(&gpu->pdev->dev);
> -                       *value =3D adreno_gpu->funcs->get_timestamp(gpu);
> +                       *value =3D adreno_gpu->timestamp_offset +
> +                                adreno_gpu->funcs->get_timestamp(gpu);
>                         pm_runtime_put_autosuspend(&gpu->pdev->dev);
>
>                         return 0;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 114a40f79ef3..db080a6d515c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -207,6 +207,8 @@ struct adreno_gpu {
>         uint16_t speedbin;
>         const struct adreno_gpu_funcs *funcs;
>
> +       u64 timestamp_offset;
> +
>         struct completion fault_coredump_done;
>
>         /* interesting register offsets to dump: */
> @@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu *g=
pu)
>  /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI *=
/
>  #define ADRENO_VM_START 0x100000000ULL
>  u64 adreno_private_vm_size(struct msm_gpu *gpu);
> +void adreno_save_timestamp(struct msm_gpu *gpu);
>  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>                      uint32_t param, uint64_t *value, uint32_t *len);
>  int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
>
> ---
> base-commit: 140b13475302601368c0cf4e193e66126a49feb3
> change-id: 20260828-b4-adreno-timestamp-f4c846391b97
>
> Best regards,
> --
> With best wishes
> Dmitry
>
