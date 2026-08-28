Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A73C9ECF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895916; cv=none; b=I5ZI96jNLNaBYO7Xd/HQ4uJUbW0722UPqX1yMuMkInokqnmSGLD+I+q0O3Lgzk5+jf5924rGtnRW4qVA23X8+YcN9MyW7nifpt1ljw6SV6xGq3gVD/3lBbjxtmCpfDVJset2iKMe0akSla4fX3p3prclybDciAPIVeta/pM3QEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895916; c=relaxed/simple;
	bh=GUotgCHYkagED1ZiL9XiH/9TVtTNLBsH2gIVijoFfPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J332hqSvuY456GyXIM19DGJok0OmArtb4GWDV0k8k9WZwXbeN1YYgGmZhFKWyBXTsSPjcFyXDL8nhp+Y2i5DgjK928w54Ng1JaXkq/XnKZA4jcSgtbh02uUH+E8Yhhp7k6XCDONtuU/119Zi71+4HLRqArCSk+AA39vYHTzv81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=H6paxxgy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="H6paxxgy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1205288a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787895914; x=1788500714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfUcgIwCJiYcPweMkIb+GXJK0j3pn/tPAjbOK4olTtY=;
        b=H6paxxgySAlIcQ3OTwznY+DSy8/j+Akq7SE4TbqM3tbLpWXqisIlygSRztqAHvTVj0
         CX/os0eavA+xYWqvsziVJ6t4NYw8ShG78PmiuEvahcULaFDMUsh8lqDuuqzLlro0bzDK
         ynQDktWqcppF479KWdZ77twQoiqb37TSsh7Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895914; x=1788500714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfUcgIwCJiYcPweMkIb+GXJK0j3pn/tPAjbOK4olTtY=;
        b=AmDDUDOFzZSKQLfGIhRVXWOiORyrY5yzEYwf7E9oHz2uuGDfpRzzzYILghrszUrQxm
         KqEj0MCaW5cSAUrfnOBuBjGf30084wVq+Q1H8EzLcrfymttF/b/BCg69wl+XF7k9kjFP
         A02SAPkJwe7DTzxJDy3oEGA0YqOS6u4Y9BOLug7P3+h9UpevTplly8QEKrKYBDBDnAnM
         YXPdCFM/vEtZGMOeI8cTzfYroadmI95YD4FUEU+5bF6g+eITyqImJeAX0naRSMn9OTkE
         W36siI0TzzGfwe0HBna9b+oncI4+eUx1yOszzxXpzQmKfUZPdT83Y+0TM4us3RKRPqFi
         xVyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3S3WPeF/VDsTis81Xbjt0b8rwZ4CEkaqOvXWhqBv91AV/+D7W4gR3MQgJ/atrq4jNm8Lt6P4fmP5PwDA=@vger.kernel.org
X-Gm-Message-State: AFuF++m0gGOqZavVKL2KynIGSJTLYiawONHGmTe6FKNDyVleKOCKiUdi
	DpOSBsQ/rjKNoDiaih4o8dWiaFqK7CMZavyrC7q03636zTDaGzIhiYQyTciNbejBfQQ=
X-Gm-Gg: AR+sD13gG6R1TxeASRumUDpFJ/5ZxFEqD91Wwj9S4mR3c+kn2P4v3HAvMFQz98jk2fA
	lHA+Ziq9x/AYJF6ONAtcXauCenxXAm9N398Rn7kBK21jaLJoD+9rPPRQiQKZlXhRotoAdjG9LGx
	OjNCgaMHc7qm8uQplH5trzSxmY7DU6uoArEs51OM6WcHtdhbW5FDd095gu7KU0rQx4oj5JnC4+z
	Mt8xgvX7Kw5+HjE1U317n9nq+lPMw3BHn247qBjWk1aAXnYx9CVQErrITQwZuT9Z5z7gGBl6bop
	LWl9vFedDIdVcujRbeAxdN+l7q55EcVBBJscEKN8h7FiQwUKbMviLIlEvVCs1z4wuo44pRhf7Fs
	/xmJ0M1GJJErm0MP0gHWuo9Vs38R4ECYesPqnqOOTLAWExubvbn3Lx3WV0dlZne43BSSl7uSMcx
	GzmrVgf1OxTfprlNU9WIhjxLlglqkEDx0c2QhIlEj2xq69PtLILe+DxE8GSyggU74=
X-Received: by 2002:a17:90b:380c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-396d0ef3c2cmr8708512a91.12.1787895913751;
        Thu, 27 Aug 2026 22:45:13 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda368e6sm1107298a91.4.2026.08.27.22.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:45:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:44:52 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: MoGGuU <Naixumogu@whut.edu.cn>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] accel/rocket: Validate BO handle counts on job
 submission
Message-ID: <apEfoHtWdtSkSW3s@rock-5b-plus>
References: <20260828050805.38548-1-Naixumogu@whut.edu.cn>
 <20260828050805.38548-2-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828050805.38548-2-Naixumogu@whut.edu.cn>

On Fri, Aug 28, 2026 at 01:08:03PM +0800, MoGGuU wrote:
> The input and output BO handle counts are __u32, while GEM lookup and
> reservation helpers take int counts. A count above INT_MAX cannot be
> represented safely by the GEM lookup helper.
> 
> Reject each count above INT_MAX before looking up the BOs.
> 
> rocket_job_push() already uses check_add_overflow() for the combined count,
> but stores the result in u32, so it only detects unsigned wraparound. Store
> the result in int so sums above INT_MAX are rejected before the count is
> passed to the reservation helpers.
> 
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Cc: stable@vger.kernel.org
> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
> ---
>  drivers/accel/rocket/rocket_job.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index bb77b6bf0f231..e6052d1973afa 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -190,7 +190,7 @@ static int rocket_job_push(struct rocket_job *job)
>  	struct rocket_device *rdev = job->rdev;
>  	struct drm_gem_object **bos;
>  	struct ww_acquire_ctx acquire_ctx;
> -	u32 bo_count;
> +	int bo_count;
>  	int ret = 0;
>  
>  	if (check_add_overflow(job->in_bo_count, job->out_bo_count, &bo_count))
> @@ -556,6 +556,11 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>  	if (job->task_count == 0)
>  		return -EINVAL;
>  
> +	/* GEM lookup takes a signed object count. */
> +	if (job->in_bo_handle_count > INT_MAX ||
> +	    job->out_bo_handle_count > INT_MAX)
> +		return -EINVAL;
> +
>  	rjob = kzalloc_obj(*rjob);
>  	if (!rjob)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

Looks good now, thanks.

Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>
