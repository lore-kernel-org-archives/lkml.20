Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09571E7C18
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164857; cv=none; b=e3N6JCvHZQ5STgCwqJDyikvmm7uhFJS8tWTU8x8GTz48xGVDwF8lzcIduQAL4v8S5yKFlXTFI7akoP40tiK6owT3+NPiUPgT54x1Y+505QNcgiD4Vrp0P4a5OzFesnO7b8sPu24KkprumMyoHdebuLWwQbjjUSGYUIQAaEj7csc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164857; c=relaxed/simple;
	bh=D0hVL3u+P+DKgbc0k33AbvhNVDj3aw4G1RtdJ+Joxrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZXYozKoYiAr04djdCUFEN5HVCckvhor15bumg3w1w6AAARBGA6def3Yyv/DlWhLD3Uh1HMwPS9tISV4P3dB2k8pJ46zbgUp92aAW4mv00p83gatd7sIyb7LG/d0b0GpeXnAsMOysuPbH88i95Ww1PUdS2z4QAFGmXoKJlalSvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHKlyMh3; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHKlyMh3"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93ece7a73b9so7341185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792164854; x=1792769654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wCPy2TJXUd/051khMbJz0nmRExXjWEjeWV3Tkd6L+Uc=;
        b=UHKlyMh3Q+hgDePkw97G6uZIVaUI0vUvAhA1Ys8QliwRy3zVH6laLh8GKK3xzNb0LU
         k7amoJyFbCimbeF6ObwpssURt4UQw4iiyFST7WDjUVXk2ulukObvHMay1MFHWYmEhSad
         qlE+ztF8EPPjlorue+Lz1cEaoBIVx6C3kAV4vt+olXfYKDgUt9eARplmGbGnDF8sDqK/
         SOe6rYgnPB4YGgpANEEKvbHKnTN1237El2Odj+tI6Im0alYX2sX+OUmimo/omFC7ILvC
         KNgaTUO6PCsTcRqCtEEl4oxzVqv9W1xqk9sXmrFWfEu7BBR526PT1tyH7+DCF87pRwOc
         ltCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164854; x=1792769654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCPy2TJXUd/051khMbJz0nmRExXjWEjeWV3Tkd6L+Uc=;
        b=UaLBQDLWBtxePhE5WJzIKEoYNHChosugBfyT3bhXpD4iXBtZXEqJQ3ozr28XByZDkt
         /c1UOxGbEmn3SLgMgbzof2qrSIBa69IQDnZpmTGmVbycobus35hLJNewjdfxbkmlsHvF
         iqxVZrbbGuA5748RgGqM74Eto0z/Ub6gDG90Wq1I3x7N5QxitMa/9Ui+nCZkSrjF6t/V
         kN/u0eJxF3NAwUv1gWukR/KgafmPzKMmM05ehhQPZhAgEmNzLAryYT5I1Lln3K6I7pdZ
         rNUUEEx2R/jpELe9hvRoa3qjbkzwfvqRDksmqBMgyhFf42TyuaV54HZSTsxTnxqGXabB
         X8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzq60IBVWucBrqpdjATJTcS7lZhnS+pcFPfWR9bCfkWkCTX3fxmX5r4k4Pns/6gc/VZ26bMEQCuk3iamuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeJgiU0vW4hMHAnVMBmgG1mHC2bKiVnN7shuxdSQt+k3kivKw2
	444vN6/+U3umsXFmY/xbhSrY/XJF3AgR+ELAn0a6ieL3e0RYWd6EXbA9+RqoJR6An/p+qI65vsB
	TvALa
X-Gm-Gg: AYBFou0yDl1HvyU7c9yVEbCoGqu5k8WPe0zw5jRwHBJC1szWt7FCsEkAjPLWfoHMNhu
	e+b5nFdwLdav7eclLg/bGn17xRCdZdw1haegZYwu1AxYxFtvdl0v2I3QDh742v7Uwj6YBPZkYNc
	FVvg8T6jMVRiOUEcOUCM+HX/U+GUdfPZJ55z+kRNhh7T9C24SvXfYKkoVSc54mywacwo/745Kkc
	76XyfI9Um65xgVtyF94s9yPa3sIl9bmiXCmpZ99Iym5C23Ou+ngQo0pKmVzv/nItZQZ84sUtvBc
	nJJlTaGA9JpnKPEBjGk6HjX/6eydjjGKhoUvfKUTTpYSN7sqNnLAivOzqWbkkeZCGeoTcNsgA3L
	jeiZCX61jjJz4Jm+Do38RPxF8v4prYYvWL444tt+rYouGucO4JDzUTSw+pNSTe8Zxqb0Iguqt2G
	ScVs9Evt3wdF6ETsKkCD2P7P21XscAzDPhslcHT+s3Li2zkaGp+ZrMKcwejTSF4knO4JTXkC48V
	g==
X-Received: by 2002:a05:620a:880f:b0:93e:c12c:f13f with SMTP id af79cd13be357-93f29df893emr29655085a.73.1792164854385;
        Fri, 16 Oct 2026 08:34:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16b5e4sm236439085a.14.2026.10.16.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:34:13 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:34:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: core: Reset freed vring entries to
 FW_RSC_ADDR_ANY
Message-ID: <atJD8lUISK6yblmy@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-2-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-2-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:50PM +0800, Yonghao Zhang wrote:
> rproc_free_vring() resets a vring entry in the resource table as it
> releases it.  Resetting da to 0 leaves the entry looking like a vring
> at device address 0; write FW_RSC_ADDR_ANY instead, the marker for an
> unallocated address, which is what the entry means from then on.
> 

The above is enough to describe what this patch does.  An additional line will
also be enough to justify the modifiation of the comment (see below).

> That matters on the error paths of rproc_start() and rproc_attach(),
> where rproc_free_vring() runs while the remote processor is already
> running: the failure originates in rp_find_vq(), called through
> virtio_find_vqs() from e.g. rpmsg_probe(), which the core only
> reaches through rproc_start_subdevices(), after ops->start() or
> ops->attach() have completed.  At that point table_ptr is the
> resource table installed in remote processor memory, and whatever
> the reset writes is visible to the remote side.  Whether and when a
> running processor reads the entry cannot be known, so the value must
> be safe for one: 0 is a plausible device address, FW_RSC_ADDR_ANY is
> not.  On the teardown paths, stop and detach, the write lands in the
> cached table or in a copy of the installed one and reaches no one.
> 
> The comment replaced along with it was written for a call graph that
> no longer exists.  It described the teardown callers only:
> rproc_stop() has run, table_ptr points at the cached table, and that
> table is NULL for a processor started by another entity, so there is
> nothing to clear.  Two facts have overtaken it:
> 
> - rp_find_vq() has been calling rproc_free_vring() when
>   vring_new_virtqueue() fails since commit 6db20ea8d850 ("remoteproc:
>   allocate vrings on demand, free when not needed"), and that call
>   was present, unchanged, when commit 9dc9507f1880 ("remoteproc:
>   Properly deal with the resource table when detaching") landed: it
>   runs from rproc_start_subdevices(), after ops->start() or
>   ops->attach() have completed, with table_ptr at the table installed
>   in remote processor memory and the processor running.  The comment
>   never described this caller, not on the day it was written.

Are comments supposed to describe all the paths that lead to a function?

> 
> - commit 9dc9507f1880 ("remoteproc: Properly deal with the resource
>   table when detaching") and commit 8088dd4d9316 ("remoteproc: Properly
>   deal with the resource table when stopping") later taught the
>   detach/stop paths to take a kmemdup() copy of the installed table for
>   processors started by another entity, so the NULL case the guard was
>   deciding between is gone: table_ptr is always valid where the teardown
>   callers run.  (Those callers have since moved to the rproc-virtio
>   platform driver, 9c31255ce5fe.)
> 
> Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")
> Fixes: 4d3ebb3b9990 ("remoteproc: Refactor function rproc_free_vring()")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 40 +++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..123aadb467a0 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -403,6 +403,33 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
>  	return 0;
>  }
>  
> +/*
> + * rproc_free_vring() runs while a remote processor is being torn down
> + * (rproc_stop()/rproc_detach() paths) or while a boot or attach attempt
> + * is failing.  Whether the reset below can reach the remote processor
> + * depends on what rproc->table_ptr refers to at that point:
> + *
> + * - teardown paths: the call comes from the rvdev cleanup in
> + *   rproc_resource_cleanup(), by which time rproc_stop()/__rproc_detach()
> + *   have switched table_ptr to the table the core was booted with, or
> + *   to a copy of the installed table when the remote processor was
> + *   started by another entity (rproc_reset_rsc_table_on_{stop,detach}()),
> + *   so the write cannot reach the remote processor.
> + *
> + * - error paths of rproc_start()/rproc_attach(): the failure originates
> + *   in rp_find_vq() (virtio_find_vqs() failing in e.g. rpmsg_probe()),
> + *   which rproc_start_subdevices() calls only once ops->start() or
> + *   ops->attach() have completed.  table_ptr still points at the
> + *   resource table installed in remote processor memory and the remote
> + *   processor is already running.
> + *
> + * Especially in the last case the reset has to tell the remote
> + * processor that the vring entry is not usable: with da set to the
> + * invalid FW_RSC_ADDR_ANY a running remote processor sees the address
> + * as unallocated, and notifyid is invalidated along with it.

Why is there a need to describe all that?

> + *
> + * Reset the virtio device section only if there is a table to work with.
> + */
>  void rproc_free_vring(struct rproc_vring *rvring)
>  {
>  	struct rproc *rproc = rvring->rvdev->rproc;
> @@ -411,20 +438,9 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  
>  	idr_remove(&rproc->notifyids, rvring->notifyid);
>  
> -	/*
> -	 * At this point rproc_stop() has been called and the installed resource
> -	 * table in the remote processor memory may no longer be accessible. As
> -	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
> -	 * resource table (rproc->cached_table).  The cached resource table is
> -	 * only available when a remote processor has been booted by the
> -	 * remoteproc core, otherwise it is NULL.

Just remove the last sentence if it has become obsolete.   

> -	 *
> -	 * Based on the above, reset the virtio device section in the cached
> -	 * resource table only if there is one to work with.
> -	 */
>  	if (rproc->table_ptr) {
>  		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
> -		rsc->vring[idx].da = 0;
> +		rsc->vring[idx].da = FW_RSC_ADDR_ANY;

I agree with this change.

>  		rsc->vring[idx].notifyid = -1;
>  	}
>  }
> -- 
> 2.34.1
> 
