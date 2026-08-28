Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FB3CA4A8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896066; cv=none; b=a49HWqPMx2dqLHko6xyVNQY+ZWN2IQnNgZSW7PJRp28IRMbNWa2DFkV4EHfjodFYoWHFWwJa0Y1ORQzyqbMkCKRCOuec9r5D/BTTziwW820Ot30+SnoFffkxNaDtIij2IASpXKXxYSI2ebU/y3bYsCN/PPDsRboP7V6r3c+Xgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896066; c=relaxed/simple;
	bh=/Z9wNHZIwyW+w88vEhoqsRCl3N9CQ+qcixTfXkLqC2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3Ezl30qkvWw73CbLk/uc9bHQgdpAGoxhkNO+qI51iUYTPt1TUYx241NNDszK6132lzUyxzhmL68sTZk0BR8rLM21dFfiXcXJI0eqmzu7jhll/VgRWeIXL0hQkq4E678Tc9X/fxCmQ8dsBD+159VSFWA17I5drElI49Ts6dVt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=BRdXGL2T; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="BRdXGL2T"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso750533a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787896064; x=1788500864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Zt5PXljQJqHa8ejgOjMYryQAjVgVBZDMdimKNGAGng=;
        b=BRdXGL2TV+OK0BzMETDaVEysVnMgoNJvQv+z6exLF3Cc7RHePwNkJaH4IXGkIm7S6q
         kOixfkVE/bEV1iFwehjo+5Yt1vn0dAdLjbAxmlB5RD91CZotAy8DlYPLHIXhyZXCO+2s
         ffzDaCQ6c8hgmZVWzg5QsRErcb5yFxWxOVdoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896064; x=1788500864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zt5PXljQJqHa8ejgOjMYryQAjVgVBZDMdimKNGAGng=;
        b=mxvcgE4sQuDLodobGIDL7zAQREBvxilx/zXAAj9eIJnZrwEg86nNXOsfKUirndQ84y
         6cL2KeBRh0tk5fg3rV6YYuPgJCSrCyrkdrvgC5z3QUenWtGC6Cn2gDS/+TnFb79Vm2S3
         ar5qUrXX/exfSZJmfHBlyChPMHBMgTll6P0vcQHoc/1LxsKYzRJANNDrEIW9TZPLvwhI
         0QonuOU4gx77KbMFa7EBBze4PtKSUXW3L9T4kCzwKzIFcIb569DGYymBCCVaLEcR8t2y
         iF+H9HWzWoCKnypMko9Xdfx9Hz0TxHm5U0d0dOiVK07Q3Lsjt1pc40ajuSfxPmgcuXAq
         t6wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQ0PxcFGWWVXuImmjcfKJ1zhkCiN4ry9YQ17k/gwoMrtbOAjgva7XYZH3xxMET2lPnem9yrqNu05gIrzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mBSj3xsVDFeQsyed3EKJrz9w8GTUGNJRmlJ1VoNQXG3FH868IC
	nXXPJ31tJCtLZMmhzAy1gSifux7KjfD+lI18J3C+Pnz0FcWY8xGMcbxG0VFwYlxuOVg=
X-Gm-Gg: AR+sD1075a2euM45l7fsFzdt5tmVMedve/k3iVi3y31Gx48k1EQY5dHNnfDHjdWbIs2
	Yzja++8eYL8MllWvUqwsx8Oks2+LjkRZ9NCeokP/ssvrpDAZxu8vRdOMOP9dK0V2lkYgKLwC6mV
	rz+1GrASetmLsUfbX0lw22kwW8TEf9pweUdYrabLmhenJ0YahGKWo3nqks0BxvGnLHmtv3+W7FP
	6Ta0de7uqFY9SxOGWkkERCS6atMl1HfUVw9ypOM6ZpRaK15c7MUVw9RkeBGYOe3tuw+Vyi/Bkoa
	NpsmZ08TegvqneA67oIeiQHDGIquJjLDJ/vAhawQu2Ze0pZZlGEd7MdNZH/s7P/piwtwyV5zjZX
	8ugXacw+epx+2jRGI5qw7XkbXC97tC1WCFWEQlJmkTVgScdajJwOyM1k0Xsh+EpPY3cmT+2KdMf
	f5/GZXLBzbaOkA9TbCmGf1yB4Ia022c/q5lB6iMmjBYJPV4JnpaGKv4CjjWoGkXGI=
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr9519889a91.1.1787896064320;
        Thu, 27 Aug 2026 22:47:44 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm5740448a91.15.2026.08.27.22.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:47:43 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:47:29 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: MoGGuU <Naixumogu@whut.edu.cn>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] accel/rocket: Propagate job submission errors
Message-ID: <apEguR4JBTEvsHds@rock-5b-plus>
References: <20260828050805.38548-1-Naixumogu@whut.edu.cn>
 <20260828050805.38548-4-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828050805.38548-4-Naixumogu@whut.edu.cn>

On Fri, Aug 28, 2026 at 01:08:05PM +0800, MoGGuU wrote:
> rocket_ioctl_submit() discards each job's return value and reports success
> even when every job fails.
> 
> Return the first error and stop submitting the remaining jobs. Jobs queued
> before an error remain queued, giving the ioctl ordered partial-submit
> semantics.
> 
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Cc: stable@vger.kernel.org

I'm afraid that this patch changes userspace API. After this patch, userspace
programs get an error on submit. So it seems that the stable tag should be
dropped.

> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
> ---
>  drivers/accel/rocket/rocket_job.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index b55e12aecfe64..8f1bdf4a57f20 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -646,8 +646,11 @@ int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
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
> -- 
> 2.43.0
> 

Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>
