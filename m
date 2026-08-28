Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6119450F2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896258; cv=none; b=do2e9IveljpH8C5YtMXkJh4bCVqhnWHGTJT9+5jnc8Drm1zZl/XJgrHsSQdGudGhshaYM08WluXZCDmM/ivfh+c21m6wbqWAtybb8xEbZrZa24+DGtu+5gjTdBl0Eb6jhB4DJvMMx7P+66T/2ILHe75jYYkhpSzsgT8MhKZJdIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896258; c=relaxed/simple;
	bh=Nw3oewzCt8XW/7eO8oiogBlbbeVU9OECZ3MdfUUt33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0s+0jS5G8EJVDG1aEQReAu9cZbnl87Bk4ToD6k5CwHZHdvpD3Wo7FvT92h0Wleq30hMQYhRfJrMAs9tHsSg3YlcEFNjpmyw4P1L4Hu2y7Ypa5nlY4PO7URCqoFOWBQM6O4Q2oETFwBElQthBNepyXChLLIU0AKZKC99s2oGr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=AuiazvN6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="AuiazvN6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3968e063f84so580742a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787896257; x=1788501057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LpkQSACoNhXcxF8SalSGxWUmZp7l1S5RyOE6epy4FMk=;
        b=AuiazvN6wUGERoJdOVNbgq8vCpShIlAvLai5dJeOTItWxgwdHWUO9wMe7UGJjCG1WX
         bZ2B7q2Hf7LeuAXZuViFayl1WJbnmL15ZJfWJK72zzcbvuumJ3y2eRQERtwqab0NuWq4
         VVZIJjOj39o7wkpt+4dVnNsSGbjDsegafYUBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896257; x=1788501057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpkQSACoNhXcxF8SalSGxWUmZp7l1S5RyOE6epy4FMk=;
        b=ZnJc11kG3dMo8h30S6fQdPc1L+SeKl2O15W8LWWUOplkb41mpabsIQBf1DeBzWE9j8
         mEjWfqBUsmzwKY/tiuVLjEDuB2iUa3UXZThCqqXXBsRIFdIKr8DPviVP8kj0F1+Ncqmm
         GgCcs2KF+pM3ahlt7zxvDe1RGZEtUNPh264ZzQTsFGYMpioI7fvCn+J9X0+eBVLKTFZv
         JHYDhD57AV65QtJmoB4YxeUe0XCByuJdtURzDQqS83DV4YdTKCTsX8IrVFMbRik4jOxG
         x7naQ9G55Qek5Fvbv8gpI8LmMtMAYI9nD19nCH4KcBILhzWx/vGI/z34lufkXGgSLHL2
         Xp0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9OlDCqQxpfmbEgmFLiWu/PClYB2BRmsuIhwpiRr/OleLFLPJhRPUm47bAzw+giFl7MMQVetzrUlNdgio=@vger.kernel.org
X-Gm-Message-State: AFuF++kJIWFit19vyIG6kQtXCbO+V0+qlpjAk8RfGQ9ybZhQChmcPswG
	c6ztGcshTWy914cCFRghPo+b5fPei7qIYZlQAh5YsHOI1VV7U9JQkjBfDfV/gGj9UAvL8o4fKHj
	xfEIl
X-Gm-Gg: AR+sD13zqxRSz4G2kH0UkwdY7FAyVEYHikEF/64AI3QZZZDgiNjKO4X7BERYM7cnXCs
	LXHjFUwN5rWvnroMthIRbBSuycgCUn7b1u9uq8aO8KCBDspXZ67b43W0775OABM4BP7sTML35Qk
	XiOsNKm6bdP19qXxWHh6IYFVYFFB9tMbl1YWIbexo8U9SR2SbdUuexjqIkTqswBLuXobB4s/VRP
	JwmPzGITjtzqAoTFUbBUlq+dg/p1k4tZdxQtzBSizXGbfAfyH6jQgf0XraSqb6DvSsaJ7sed1LH
	WUnYDGrc9QUbLagA7OCZcoZXNmTsCzNgVKfQZ1g35v+nkCzeGa8EzjqKi10HEy4LHqgpVMPYhUl
	gSZxSiwxyZQXTBx1xEXsiwvA5154iQN/WEGiiO+xh0CM0evU9d7XeGt9kvjwNVNGUWRQKhDDk6z
	e+xhRBYWRwK85kFviyT4W6Wq7TxeFUqEGbQoFNUzll1LJC9hdSvOT+yndlYgDKNQ==
X-Received: by 2002:a17:90b:3ec1:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396d0f2dcd8mr6908508a91.10.1787896256905;
        Thu, 27 Aug 2026 22:50:56 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc07777sm1228032a91.12.2026.08.27.22.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:50:56 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:50:42 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: MoGGuU <Naixumogu@whut.edu.cn>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] accel/rocket: Collect job dependencies before
 arming
Message-ID: <apEhmia-SLEe-39S@rock-5b-plus>
References: <20260828050805.38548-1-Naixumogu@whut.edu.cn>
 <20260828050805.38548-3-Naixumogu@whut.edu.cn>
 <apEggyjyM9yCqg4A@rock-5b-plus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apEggyjyM9yCqg4A@rock-5b-plus>

On Fri, Aug 28, 2026 at 02:46:16PM +0900, Sidong Yang wrote:
> On Fri, Aug 28, 2026 at 01:08:04PM +0800, MoGGuU wrote:
> > rocket_job_push() arms the scheduler job before collecting its implicit
> > dependencies. Dependency collection can fail with -ENOMEM, but an armed
> > job must be pushed and must not be aborted with drm_sched_job_cleanup().
> > 
> > Collect dependencies before taking the scheduler lock and arming the job.
> > Only operations that cannot fail remain after drm_sched_job_arm().
> > 
> > Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> > Cc: stable@vger.kernel.org
> > Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> > Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
> > ---
> >  drivers/accel/rocket/rocket_job.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> > index e6052d1973afa..b55e12aecfe64 100644
> > --- a/drivers/accel/rocket/rocket_job.c
> > +++ b/drivers/accel/rocket/rocket_job.c
> > @@ -206,19 +206,21 @@ static int rocket_job_push(struct rocket_job *job)
> >  	if (ret)
> >  		goto err;
> >  
> > +	ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count,
> > +					   &job->base, false);
> > +	if (ret)
> > +		goto err_unlock;
> > +
> > +	ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count,
> > +					   &job->base, true);
> > +	if (ret)
> > +		goto err_unlock;
> > +
> >  	scoped_guard(mutex, &rdev->sched_lock) {
> >  		drm_sched_job_arm(&job->base);
> >  
> >  		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
> >  
> > -		ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base, false);
> > -		if (ret)
> > -			goto err_unlock;
> > -
> > -		ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base, true);
> > -		if (ret)
> > -			goto err_unlock;
> > -
> >  		kref_get(&job->refcount); /* put by scheduler job completion */
> >  
> >  		drm_sched_entity_push_job(&job->base);
> > -- 
> > 2.43.0
> > 
> 
> Reviewed-by: Sidong Yang <sidong.ynag@furiosa.ai>

Sorry, I typo'd my address in the previous mail. It should be:

Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>
