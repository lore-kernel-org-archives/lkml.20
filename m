Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD2423160
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534047; cv=none; b=D6JL4WRKun3U69a0nIyAmSgcYJdBTXrWWbbuDcjkys0VWClYfY4cNs155Iak3zq7ctW1+BG3OLVa4B1/O+N1o9D6j2vFAf0QM8RCTQWRYNstclk/wz/UsEeGS0K9OpLTFFP1BC/JapOHSIB0PB3MfRQ/6NrJ9QFbbCBsZ4GgVEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534047; c=relaxed/simple;
	bh=xenbfa5yCH/JR4BPwaxvamXk4SoB151dSO6VnoNzG8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZTKrLnLafQMdhH2cVDMTSPZ6gYR5DAQeTY/++TIKxqy5cPRB1bP9LVypkpodf/TraI797aLtxu/9cMdPBjN38oy52P1mLWWwfi3/hhzcyaG3ctFyhyIlQAtGrOSEp6kPquM6g2FKCbwUUi0DW0adUWfhD44CtuDtxezSo0AAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=md4dWQHn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="md4dWQHn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso843670a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1788534045; x=1789138845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BC8xeNc2okLWoyrNypTJfEB3etD6w4HkNrLeoChjYjY=;
        b=md4dWQHnFPazdhCR3saT4L7FZzy0q2h7pCepTqHtJPnl/MdPYbSfI8j0/MyWTxSSlC
         si+WioGK2QP/5AMQ3GvfA+5FQdpS70fYLiYS3awXrTgIM8Pe+nhxkWrz4BrR/VgTj265
         IChehlicDExyyN7tGOsI1RX5gFHkOQqPW+8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534045; x=1789138845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BC8xeNc2okLWoyrNypTJfEB3etD6w4HkNrLeoChjYjY=;
        b=SvIuUkMj+COOv1kVtFx2hGwYmn3LrGmVfJZB1av38Xcw6zDZk5Y57F8vdVCXJBsI5m
         9B/R5uIl8ORLGBUPWcrayDC09zqpDI2nyQIJ7YsMEZdNQm/DUjY96/zIDXHtTreSNZMa
         +8CmTTyvIE09FiujmisMUonQ0f6HEAN1ixZkzyXqdUj65RpWs9UhWMCd2He6W/dLTQt7
         SxJehpw+WqC5ZQEQXax3Z2jXvsF3vVr3oEfz4yrs1dQJEkHIhBxYqPSvQYBC89c6OWV8
         bfykAzzzj6PSwRuC2OU5kc0igwIoHQ0LyNtxMrJEMBt73CrduG8ltrmih6rnPar0RFr0
         ttkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSOAd5vsx1EFvYt4JRG1htYA6vHwMe6b6OZ5CXg2Yf9a2ETjqOfj6JSUuuQbo55laRERuMjs00BpkVd5E=@vger.kernel.org
X-Gm-Message-State: AFuF++npu1UdWZHCvVG64C3lFD751H3JdMhom4e9zJySDNccKR5vegRX
	Lben+dxAUjpAZEhgR+nnBX1yzL85ar1YycLjsyyoZXWLdnD38W+778l+6clk2+5OP5A=
X-Gm-Gg: AYBFou1km302xLXPZ1xDfU89FlKwe3GRyxDvh7UT6tKcp8zmNMSJwSI439LsA7mI1X3
	h7Q2+WqbM4QtjTQlnevW8K4ZPr6pJw0f5RE7njEcdiRDDZzrISI4S6TBKdFUea3LGq71EIULkl6
	pah/qeR8Q8YxNJdn8wBKCU3XbaDSivmD+Ik59m7+c4VI8+C5VRXF3vE3fmP9oqsEQHXqMit3ur7
	CbLMDEPgL2LCN9YL5PfOLD73s+lE3kFej+puaJ5berl982CEAjQZl8zL2isPKlsTScfxxn2PdxO
	71WfdeGbYsYeG7poNjYuzWkLQSFISZ0mHOmonN3FGLiwI/GahlSaxkRkAPQJU3sQeWtQf/bpmaK
	VSyIpu8KD1BKhex1i2FIjjgv0KyNetkzT8sc25qsE5sEOOeIVVSezKc4zfFMlwgjN2Cay4jkWe6
	YD+0Mrw58upKDXheaXHeSjuh5QQkZbp3aMslsSGWBlXtX5OQ+fNVcUMwlb8DGOfQ==
X-Received: by 2002:a17:90b:582d:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39b2627fe18mr9810550a91.25.1788534044869;
        Fri, 04 Sep 2026 08:00:44 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d4dbsm10522755ad.33.2026.09.04.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:00:44 -0700 (PDT)
Date: Sat, 5 Sep 2026 00:00:16 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Ross Cawston <ross@r-sc.ca>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] accel/rocket: Add per-task flags and interrupt mask
 to UAPI and kernel
Message-ID: <aprXAS8mkycmfM2n@rock-5b-plus>
References: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
 <20260217-accel-rocket-clean-base-v1-3-d72354325a25@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-accel-rocket-clean-base-v1-3-d72354325a25@r-sc.ca>

On Tue, Feb 17, 2026 at 01:39:51PM -0800, Ross Cawston wrote:
> Add two new fields to struct drm_rocket_task (UAPI) and struct rocket_task
> (kernel):
> 
> - u32 int_mask: which block completion interrupt(s) should signal task done
> - u32 flags: currently only ROCKET_TASK_SKIP_CNA_CORE
> 
> In rocket_copy_tasks():
> - copy the new fields
> - default int_mask to DPU_0 | DPU_1 when userspace passes zero (backward compatible)
> 
> No functional change yet - old userspace continues to work unchanged.
> 
> Signed-off-by: Ross Cawston <ross@r-sc.ca>
> ---
>  drivers/accel/rocket/rocket_job.c |  8 ++++++++
>  drivers/accel/rocket/rocket_job.h |  2 ++
>  include/uapi/drm/rocket_accel.h   | 25 +++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 369b60805d5f..34898084cc56 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -96,6 +96,14 @@ rocket_copy_tasks(struct drm_device *dev,
>  
>  		rjob->tasks[i].regcmd = task.regcmd;
>  		rjob->tasks[i].regcmd_count = task.regcmd_count;
> +		rjob->tasks[i].int_mask = task.int_mask;
> +		rjob->tasks[i].flags = task.flags;
> +
> +		/* Default to DPU completion if no mask specified */
> +		if (!rjob->tasks[i].int_mask) {
> +			rjob->tasks[i].int_mask = PC_INTERRUPT_MASK_DPU_0 |
> +									PC_INTERRUPT_MASK_DPU_1;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
> index 4ae00feec3b9..6931dfed8615 100644
> --- a/drivers/accel/rocket/rocket_job.h
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -13,6 +13,8 @@
>  struct rocket_task {
>  	u64 regcmd;
>  	u32 regcmd_count;
> +	u32 int_mask;
> +	u32 flags;

Hi Ross,

This patch grows sizeof struct drm_rocket_task, and it would make error in
checking if it is bigger than job->task_struct_size in rocket_copy_tasks().
So, Old userspace application would get error.

Thanks,
Sidong

>  };
>  
>  struct rocket_job {
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> index d0685e372b79..ae0d8e48afcd 100644
> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -90,6 +90,11 @@ struct drm_rocket_fini_bo {
>  	__u32 reserved;
>  };
>  
> +/**
> + * Flags for drm_rocket_task.flags
> + */
> +#define ROCKET_TASK_SKIP_CNA_CORE		0x1
> +
>  /**
>   * struct drm_rocket_task - A task to be run on the NPU
>   *
> @@ -106,6 +111,26 @@ struct drm_rocket_task {
>  	 * buffer
>  	 */
>  	__u32 regcmd_count;
> +
> +	/**
> +	 * Input: Interrupt mask specifying which block completion signals
> +	 * that this task is done. Uses PC_INTERRUPT_MASK_* bits.
> +	 *
> +	 * For conv/DPU tasks: DPU_0 | DPU_1 (0x0300)
> +	 * For PPU tasks:      PPU_0 | PPU_1 (0x0C00)
> +	 *
> +	 * If zero, defaults to DPU_0 | DPU_1 for backwards compatibility.
> +	 */
> +	__u32 int_mask;
> +
> +	/**
> +	 * Input: Task flags.
> +	 *
> +	 * ROCKET_TASK_SKIP_CNA_CORE: Skip CNA and Core S_POINTER MMIO
> +	 * writes for this task. Used for standalone DPU element-wise
> +	 * and PPU pooling tasks that don't use CNA/Core.
> +	 */
> +	__u32 flags;
>  };
>  
>  /**
> 
> -- 
> 2.52.0
> 
