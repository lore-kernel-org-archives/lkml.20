Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430103;
	b=xH48lTDm/ZFlgSdjTaIZwONWBl9m98uaCFlwgWXZnSH509ay7Opg8RrnerqTeCqpBmSl
	 FGX8SoYz/nZ40Ajm83ICs0SQZCOMwPNLgvOhoC8G4XdbUMOzNvqhddYZu6eEwyWDd8j50
	 7QGDf0aw7Ht+NJdKG62ybyqrIPnWKlHxPTBIHKiVkAvWfl7p3OtT/8jGT+ZTlVh0AJwys
	 QS6HuQX6CtPXlHdZPgYkkiruXP/ep/jOoD7e17iwjgEkX9FHWcKPSsuH8nInlOKVFgzdw
	 mADQtND7iuzTAaFCgNdadPj2eiDSQJhpuYzszEvDNEJL41IUQXSqN7ZYhlPvIS7bgBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
	b=G6GLrKi0HhTsxSw04/rt3vlIG6vVM4EEhJ/7xKHXRqy9/pVGo/916BqcxsdXLQj0UOyc
	 W6CvWgaYvUuXgQRN1KAlUfjCv4IZc9EGD5Rrvm89uS/Kr3BevwJtwNI56ncFevjTI5ZGY
	 ur2tgqtpCwFGwyrIsKA0T4Sjdw9cmV0P4S3L6ZaDSMV3RSQsMMYm82/XdvQ6ewT4S0kRa
	 7Sk8dDozfudoscWjNK64K45G7xl0SF3IKSSXlArOG6VRXP+VSogF/1LKwjWFXJLXgC034
	 fQl6w0e2qNIFaAQuw3QvsK0WYo/vy2a6U/du+d+C1pPBjdNWumWsBEAuqyA2hKelclg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbSKHF4F;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbSKHF4F
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccca948203aso861535a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792430102; x=1793034902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
        b=EbSKHF4FBi6Gw+HdwmCL9x60cXnlqyYitVKN4L3pyMtprMmREDDBIzBG66tMtCwYqp
         4UWLpM2JD4dQ1FMWGSXIdwqpgL/FUlAHYQsLGIVq1pqQziVAA/ZI2m10KDdiaCc8LqJk
         +OVM0KKpNMxy2FK7jibs7HzP7jivBBwgaxhGRKFb84H/YrC0iM2u4bXeWYkzuh3uPnR9
         ot38svkI9O/siFVxmp3V321s42UPEQCUqUHkf6I/kIGrZeRlifFKsBkCk7c8kLU5bsCj
         vDNMthUAa6UA5DryUOuiJjRwigqu5xiYDx6PHZc7uSxKLQ6/4pq+9fdUZ2Or28YB9gmy
         90XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430102; x=1793034902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
        b=CzeDxWPrsLvPRBOnjDOeCDHV8zV9LDe9DZPmYe5hQyaUMP1gDF8mrEn76cdebocE8D
         0ShwAZvL/SSBONDd3yXQsebLFsJ7aaaq6t5Ki+HKAnp4w4x0r9ygskAc5eP3lDk8LF4c
         sKzOJS+aIC+C+SV30LJamXGfi3I1tXwQdfBEhMwLCa5vP0MhJGy0siFp1EI/HSYWMIOT
         52UFRQwsCe66pn5dLm09eiLjAFr5sNvQdbOSdkrnoyCF6AffgzH+z9lqL54rJy+1EdVI
         5h5MJR2+XxKJrjZlVvqai4uCwFQJpL9kRHpjlip2E5P3YKwMltD4RxU1qnaFDeJkk9K/
         bkOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFMXkaBBHgUhM9fwaua6l1VbbeRQ8M/bLG7gzkutHAEfcO8ifSfQEDrL6HHntrK8u0YIZw7vVD3bb+p0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtwQ6pSPE3zbKtimC4pZiYvFLjgbd6iG+4M0N94GtkQmq2LvpQ
	FU/tTZ503wsDcESGAAzx4Gi3E5nXyX1CXMooJohdBx3kbt70NiRPwR5kj/FjJnLsp2k=
X-Gm-Gg: AYBFou1HvfGAzJE/oX/tw7mvftb2xUY/onfK4UeHtlmNBJ+3baZScy/7f/CjB3Cfbl0
	KhQ7Of8SGOA/eVRqIatdqoxvEamFsN+hs8pM1HxgeZvhJCl+T5RZuKaduRC1Q2XJnb7OArWFL2T
	BAuDjVAamsPeeGmPZs/QD23x1tyqRSq7LxYR3S0aQprNdxo+95ncND0KhchELPdvGFz2iQT/5Y+
	GpJZcLflOdZLHRolLFHlIGW8cBBUDmptK3VYYaAas7h+OYH9GYSvyAhsUm3usXx2x2li2tFbuEY
	JYHl6xfS3webJxFSnYoyte8vfKImvxvXJL1JmFvOVaaubyC67gA9GtuPF59WT3CFVxPfVPOB7CK
	D04Nz3MqFQJ4+mDBWiICmBxKTqmlz0GZUnTspnvhaaRFaSQi+pZOJxMT4TWCXwV+ep5eHsD+hGt
	6n4yM8jkqii7ZG+DiniHuLhfqNuivdUA51veovHavKpccnKTqg/0F6YWoQSRSMZn0uPjKG06Q=
X-Received: by 2002:a17:90b:2c90:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3acef0ff0cdmr7098929a91.46.1792430102161;
        Mon, 19 Oct 2026 10:15:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:76fe:654:667:da52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm9453824a91.1.2026.10.19.10.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:15:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:14:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>, arnaud.pouliquen@foss.st.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: core: Roll a failed attach back with
 detach() when available
Message-ID: <atZQEuXMwMpvmoBz@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-4-hyz3367@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-4-hyz3367@gmail.com>

@Arnaud Pouliquen - please review this patch to make sure it doesn't break
STM32.

On Tue, Sep 29, 2026 at 03:54:52PM +0800, Yonghao Zhang wrote:
> When the subdevice registration that follows ops->attach() fails,
> __rproc_attach() rolls back with an unconditional ops->stop() call.
> That is wrong on three counts.
>

It isn't wrong, simply implemented during a time where any kind of fault in the
attach()/detach() scenario called for a stop().  I would certainly appreciate a
less reproachful tone.

 
> An attach-only implementation, one without stop() such as
> commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
> mode for all R5Fs"), dereferences NULL right there.  A processor that
> is being attached to was started by another entity and is not ours to
> power off: detach() is the matching undo of attach(), and stop()
> should only be used as a last resort, when there is no detach() or
> it fails.  This is reachable today: when the re-attach of an
> RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
> xlnx_r5 use the feature), the unwind stops a processor which,
> per the feature's own contract, "does not need help from Linux to
> recover... Linux just needs to attach".  And the unwind leaves
> the accounting inconsistent -- no resource table bookkeeping
> is done, unlike on the rproc_stop() and __rproc_detach() paths,
> and a processor powered off through the fallback keeps its
> RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
> core that is no longer running.
> 

Remove the above paragraph.

> Roll the attach back with detach() first, along with the same
> rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
> and fall back to stop() only when detach() is unavailable or failed.
> A failed resource table reset does not abort the unwind: this is an
> error path, and detaching from the remote processor, or powering it
> off as the last resort, takes precedence over the bookkeeping.  A
> successful fallback moves the processor to RPROC_OFFLINE so the next
> boot reloads firmware instead of attaching to a dead core;
> implementations with neither handler keep the processor running and
> untouched, which is all an attach-only core needs.  The rollback is
> factored into rproc_unwind_attach().
> 
> The unwind runs the same resource table resets as the detach and
> stop paths, which free clean_table and leave a cached copy of the
> installed table in rproc->cached_table.  Make rproc_attach()'s error
> cleanup, which runs right after, null clean_table after freeing it
> and release that copy along with table_ptr, or a failed attach
> double-frees clean_table and leaks the copy.
> 
> Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 19e0ea3e7240..c52212a1d180 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
> +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
> +
> +/*
> + * Undo an attach whose subdevice registration failed.  The remote
> + * processor was started by another entity and is not ours to power
> + * off, so roll back with detach() when available and fall back to
> + * stop() when there is no detach() or when it failed.  stop() is
> + * the only rollback that does not rely on the remote side.  A
> + * processor powered off through the fallback is marked RPROC_OFFLINE,
> + * so the next boot reloads firmware instead of attaching to a dead
> + * core; with neither handler there is nothing to roll back with and
> + * the processor is left running.
> + *
> + * The resource table resets are best-effort: when one fails, the
> + * unwind carries on with detach()/stop() anyway.  Unlike
> + * __rproc_detach() and rproc_stop(), which bail out before touching
> + * the processor when their reset fails, this is already an error
> + * path, and detaching the remote processor -- or, failing that,
> + * powering it off -- is the minimum it must still deliver.
> + */
> +static void rproc_unwind_attach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	if (rproc->ops->detach) {
> +		ret = rproc_reset_rsc_table_on_detach(rproc);
> +		if (ret)
> +			dev_err(dev, "can't reset rsc table on detach: %d\n",
> +				ret);
> +
> +		ret = rproc->ops->detach(rproc);
> +		if (!ret)
> +			return;
> +
> +		dev_err(dev, "can't detach from rproc %s: %d\n",
> +			rproc->name, ret);
> +	}
> +
> +	if (rproc->ops->stop) {
> +		ret = rproc_reset_rsc_table_on_stop(rproc);
> +		if (ret)
> +			dev_err(dev, "can't reset rsc table on stop: %d\n",
> +				ret);
> +
> +		if (rproc->ops->stop(rproc))
> +			dev_err(dev, "can't stop rproc %s\n", rproc->name);
> +		else
> +			rproc->state = RPROC_OFFLINE;
> +	}
> +}


Please remove all the dev_err() above.  An error messages are already generate
in __rproc_attach() when something goes wrong.

> +
>  static int __rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
> @@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
>  	if (ret) {
>  		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto stop_rproc;
> +		goto unwind_attach;
>  	}
>  
>  	rproc->state = RPROC_ATTACHED;
> @@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
>  
>  	return 0;
>  
> -stop_rproc:
> -	rproc->ops->stop(rproc);
> +unwind_attach:
> +	rproc_unwind_attach(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  out:
> @@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
>  	 * rproc_set_rsc_table().
>  	 */
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;

This change is not needed.

>  
>  	return 0;
>  }
> @@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>  	 * won't be needed.  Allocated in rproc_set_rsc_table().
>  	 */
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;


This change is not needed.

>  
>  out:
>  	/*
> @@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;

->table_ptr doesn't need to be set to NULL.

Thanks,
Mathieu

>  disable_iommu:
>  	rproc_disable_iommu(rproc);
>  	return ret;
> -- 
> 2.34.1
> 
