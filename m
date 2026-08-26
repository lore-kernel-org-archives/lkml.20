Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08C435523
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754890; cv=none; b=rSyLggOw9+ENS5z2hStQKBWaWJRElP9RGC8LISd1gj/SdyTZOX2sgRU9H3qDUfQdLVXG8nTEDch90n03pIOuWUTApub8Kl0SgAfDom6TeyowDfn/gDaj2WnBYElOpZzakVuGVLLSIJ21A2hfTM6D25iQanfG/B6foYxoxSmlPiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754890; c=relaxed/simple;
	bh=ZzuGnHIAIfA/t8cFWVOgErYASeqF6iVH4G5HnM/IRx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/7Xt5ciKZR6HrEy/cWeWFXAPcI/6UuLkUDZzntd+YD9UOc8We8B+NpBaeVu7RmNBO0Pj4JVaoR9IXoZdkrH/jU6PPxftIp4vGg/rSQNGgQx6jewvwgFKxGIjsB5L6jdOh7rJyYTdYISYoJJfxk6pVCJ6EpGHkEMMcB9nUeIx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=oTAmHFzb; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="oTAmHFzb"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so804184a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787754887; x=1788359687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yn02buzACRQQNaPjkaVeG7aAyIjhQMcWh60YSklrQcY=;
        b=oTAmHFzbXGDggyZIF6m8s5Mdk0HWGy93R19XkbKA+kLC7DYACBhdcwNPW1V08Jnq+J
         ae4Lnt4nDkkZp5WCrp8QRbaQc/1Qr7YbQ5q5zpJ5KZn0Xa6W0OjP8OgtZ7+FiWb539JH
         YihLQex2w3R2+IUlZhcSQO9gK6m7TdzzChyws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754887; x=1788359687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn02buzACRQQNaPjkaVeG7aAyIjhQMcWh60YSklrQcY=;
        b=p450PIml+2n5YFFBRwHHfwgsCHZwxNgPUK5gmWT0KhCGdi1VHsZ1bZX6CbRRU4iBOU
         51nXFYwT5rD1ivEdEQh+oseNEZJfSaMXSt6hWgz3vLoIW7GW+97kOnLgi4668EXKgdkQ
         DtAhuYusLFCdP94G/uzfxaFD7b06UG65bQKTdwxVdWxwpt8zk8J0gmGoIReYCrKUGUqs
         4gJ1++jYHxO0ZlriCFcs5Yp6ylcd4eQcRCt67F/PNYt3hDMVmkKLfpvWAxkxbWwCVbHX
         FUVUUjrRsFDnXO9N1vjO45G7uRD0ZRPPQjeED8kSqmxYNv2LTh474HQZ7IQinxYQ4Jvy
         E5zQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGxS0AlS8apFLzyFq2hbTn9gxz2esNsoE0A5f2BCOUKkhWk1SoiH9x8YHZblUCgmPl8D8hyy445dhWYQo=@vger.kernel.org
X-Gm-Message-State: AFuF++lU0PaLATzzTNPFHYubyBuSD/5yDrVMYvjWwtTsbSUEbq5gQ+94
	1ggZpu+zJAcvqGr7NGYD4H+EsTDg/E9RBPUge2RKOdPjDaw6tENXpGgkj/rZuvdGStM=
X-Gm-Gg: AR+sD10SZAHDXpcb4Z9gQIfq3JR7a+YtPw8FE3+efBOiVX3abpY/zKFsap0rWBKinwi
	VgC7cvYpWNcwLsPmMrFcjfGAaAza8a4jwZwmOfTZiS7AJY/8rB8WrHSdE0e3INTPTTGoNAP93Er
	mWAEZiHYMiEfT3Btte9wm/WgReLQkofe9Pv5oYokDybf2OdONKZhnw1BZv4Wun4JNrvJHPSL+v4
	b2bcQfemrCwk/flnPAUjbhXPU2cB5VI43SYVmfzvQyjcPqPTLMm0BtnQNdk//kcZ3lm2RUyR5P7
	N2br790PijAFEjczVotaJylEbMz2sR/pWfqA/d+to1RFWAHAC1bGV2bqhgzT10wDNZkQTtprBrW
	1bwYRJazMHfFrwsRp65J5iHB9eQ0aN3aE73NhSEZ14Lkwix4X46rn78Pb5hNU4M9JCp/lQujKB2
	wLtGBBdWXs6LqAyJHYJHHeoeOhs1Aq51+zr4bfDfEhjCnArTuaBOZ0pDD4JqNOIUw=
X-Received: by 2002:a17:90b:4e88:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3966d3e1aa7mr17670746a91.9.1787754887451;
        Wed, 26 Aug 2026 07:34:47 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a57396sm4760198a91.13.2026.08.26.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:34:47 -0700 (PDT)
Date: Wed, 26 Aug 2026 23:34:34 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: MoGGuU <Naixumogu@whut.edu.cn>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: Fix job submit error handling
Message-ID: <ao706o8ReDs-IXqf@rock-5b-plus>
References: <20260813142059.151644-1-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813142059.151644-1-Naixumogu@whut.edu.cn>

On Thu, Aug 13, 2026 at 10:20:59PM +0800, MoGGuU wrote:
> Several error paths in the job submission path can be triggered by
> unprivileged userspace through malformed DRM_ROCKET_SUBMIT requests.

I think it would be better to split this per fix.
And I've tested this patch, it works.


> 
> First, the input and output BO handle counts are __u32, but GEM lookup and
> reservation helpers take int counts.  Values outside the signed range can
> become negative.  A combined count above INT_MAX can also overflow at the
> call sites.  Reject counts that cannot be represented safely before looking
> up the BOs.
> 
> Second, rocket_job_push() arms the scheduler job before collecting its
> implicit dependencies.  Dependency collection can fail with -ENOMEM, but
> drm_sched_job_arm() is a point of no return.  An armed job must be pushed;
> it must not be aborted with drm_sched_job_cleanup().  Collect dependencies
> before taking the scheduler lock and arming the job.  Only operations that
> cannot fail remain after arm().
> 
> Finally, rocket_ioctl_submit() discards each job's return value and reports
> success even when every job fails.  Return the first error
> and stop submitting the remaining jobs.  Jobs queued before an error remain
> queued, giving the ioctl ordered partial-submit semantics.
> 
> Tested on RK3588 with zero task counts, invalid task pointers, invalid BO
> handles, and oversized BO counts.  The requests returned the expected error
> codes without warnings or errors in the kernel log.
> 
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
> ---
>  drivers/accel/rocket/rocket_job.c | 34 +++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index bb77b6bf0..c42bbf486 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -206,21 +206,20 @@ static int rocket_job_push(struct rocket_job *job)
>  	if (ret)
>  		goto err;
>  
> +	ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count,
> +					   &job->base, false);
> +	if (ret)
> +		goto err_unlock;
> +
> +	ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count,
> +					   &job->base, true);
> +	if (ret)
> +		goto err_unlock;
> +
>  	scoped_guard(mutex, &rdev->sched_lock) {
>  		drm_sched_job_arm(&job->base);
> -
>  		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
> -
> -		ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base, false);
> -		if (ret)
> -			goto err_unlock;
> -
> -		ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base, true);
> -		if (ret)
> -			goto err_unlock;
> -
>  		kref_get(&job->refcount); /* put by scheduler job completion */
> -
>  		drm_sched_entity_push_job(&job->base);
>  	}
>  
> @@ -556,6 +555,12 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>  	if (job->task_count == 0)
>  		return -EINVAL;
>  
> +	/* GEM lookup and reservation helpers take signed object counts. */
> +	if (job->in_bo_handle_count > INT_MAX ||
> +	    job->out_bo_handle_count > INT_MAX ||
> +	    job->in_bo_handle_count > INT_MAX - job->out_bo_handle_count)
> +		return -EINVAL;
> +
>  	rjob = kzalloc_obj(*rjob);
>  	if (!rjob)
>  		return -ENOMEM;
> @@ -639,8 +644,11 @@ int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
>  	}
>  
>  
> -	for (i = 0; i < args->job_count; i++)
> -		rocket_ioctl_submit_job(dev, file, &jobs[i]);
> +	for (i = 0; i < args->job_count; i++) {
> +		ret = rocket_ioctl_submit_job(dev, file, &jobs[i]);
> +		if (ret)
> +			goto exit;
> +	}
>  
>  exit:
>  	kvfree(jobs);
> 
> base-commit: d85a5e9dfb42449d9f37b0ddc6ec30b129f481ce
> -- 
> 2.43.0
> 

Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
