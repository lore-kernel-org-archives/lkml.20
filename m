Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E239449C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351115; cv=none; b=luJjXUoKY2Z9UE/m0jMt9lcnje0T7gWmNDrCHDiW0Ih1VA9c1oL5RNpEExdT6HBooMH3OkuISl70zR2x/rDUaCkLph6bl3gqH6F6Q/qAU84FngFbu9OzsrHl8DT9+eTtmUtUtCmvZIUn0019zowzJhgEv0/02g+HGabTgDNi0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351115; c=relaxed/simple;
	bh=Vu1OEGJY0sfGYXqHMdYCr+ypEnanJIoLQdbho9+4MPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb0drNR6Ie7oDh1iZB7DC/p9bSvxe5GYU8QhM4RUn1MlSJi/AkQJI5pUKBV1wMHN84NtMaXSokD6hRsnWrAobWyp1nuDgjs/z4d7fnuEx+jdeZzPLxhznqz/RNRwN0848RBXaNilGT2q0mqXyXBoUhHQ56qvdH1gTESTa5W5lEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dwtjsdty; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dwtjsdty"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso393763a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790351112; x=1790955912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L//QOJBSEUQCRGlQ7vfBAjq5WzB48vbfjOdL7wXVsS4=;
        b=DwtjsdtyRp2asp26bHJqVenKdZ33zXv59BICMKPYVq/SW9a2JWfc5qVBv74zcz4n+h
         lAF8hCtppr7/mvWYFDBH6KW7rYB+QKuasFMdNCeiIt64+SbljXIi9FFHXn1oYNpZ+te2
         0wykMMsO8qhpHSbjGwBM1DCG+C53QWK7vtyyunwQznIhn81rahD+CNuyDZB/Qpc/2Tn9
         iKSk78EKdu3mBBJFPCS0SfTSCt4fN+m2nFVZzGRW9B2KL40RZ9jovxZM721p411yS1e/
         YZAt/YKA9cOwet/xm8Q+I6LtQupxLDWl/c4DnADpjGSuYj7ndedMSunqBeHne8wXJ0OG
         OQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351112; x=1790955912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L//QOJBSEUQCRGlQ7vfBAjq5WzB48vbfjOdL7wXVsS4=;
        b=at04uvZ19R6dPF/vD9xpf1X+7h/AlsRyJ5qAMPn7O0c/eeLm+tdLCfP8fO/jaDf1km
         IsstOdLQIWh8xHjRx1yym2uf33crgKqqKp9c98J+zSPsf4g3YtKYqKNZX9OTR9a5wA5M
         qcJYqCd8lt5wFDaE7EygOKyzjQzwlzqohUId39g72Ufpn8sDctAky+mftvb99Bs3z+rN
         bH87953JSHCKSsPs5o7aA0ye3yDbjKMQHN5bumfroqR4Z67wnLusRurgXrv9pvV04dmh
         8EonHlgq/0+NQ1jvetnEoLgADLhc4+TLqvf7eCdib3KJKf442mUqB3kZ71ABjQH4ZFkH
         kbDQ==
X-Forwarded-Encrypted: i=1; AKwUvByObNd1CG/XcCFxCUUXP6k79UtAMtXe46NJOli/xXxmMQIHXP5xcZ9KPoS51OrtYIX2eCLn9vBs2/7Dix0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZNvfoDqE0Uqy2SvPFkEFjATc1JsHZt/KJJ4vVPiF/GRaUYN3Y
	TEMHfxvkjUO3uWWS4bjYR9o4c2yOlFhP7GDIjW5nVmQ3lcMgyk04a0BiB7aN7tG8g+I=
X-Gm-Gg: AYBFou20v6ykjD4nWHi26UlW70OUDee1Wj969BwuZq6e4o/ILz7uHlLvyUBs/0F1+hr
	ar7ArkfxfgW+En8QMHDq1XKOS2oTh9y2PYbN9rFih73k5CpC1FWzREqflGpXV/kH6SuWLSU3ymJ
	q0hlegQmzz23EHUEWkpeAUuccXSn7NBlJB7Hh5xE6U7Xza49WdkCjK7/y4BetYJ41FWXAYN5TpI
	SsfC9bnWDMj/JLkQLSsKb5yIYIKm5XAImDrw4KxM00wt+X9EG9hYDeoycfNrvahITxSDV5q80xP
	mru2WBU/du+XZQ4TYEiYHTEq79KWx2jh+7yqM1cTG6HWnhO24VkgVGWGufqZdpa1UidAPYzz1Uh
	2ZsaGHTckfQLkp26SQ+qMdZ1nZLN44N5cAfR/LkaiHxVK7YNre1rM8BiGrtB6GqqENHiPdWjSPP
	qvKit0UE4VlconpAOgPcfI27paL+9+QypWstqGKmQhEiTy7u75wDoyWt59vHN9ViO3Ie7t4SgV8
	sxtFEbEB2cXng==
X-Received: by 2002:a17:90b:254e:b0:39e:6a81:f351 with SMTP id 98e67ed59e1d1-3a098bb66b0mr5149743a91.43.1790351111768;
        Fri, 25 Sep 2026 08:45:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:448f:6909:f2ff:6dca])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8d31b4esm1874051a91.3.2026.09.25.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:45:11 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:45:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] remoteproc: virtio: Load rvring->vq once in
 rproc_vq_interrupt()
Message-ID: <araXBOapuzox1ljT@p14s>
References: <20260922190159.509836-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922190159.509836-1-oss.patchbox@gmail.com>

Good day,

On Tue, Sep 22, 2026 at 03:01:40PM -0400, Yuho Choi wrote:
> rproc_vq_interrupt() loads rvring->vq twice: once to test it for NULL and
> once to pass it to vring_interrupt().  __rproc_virtio_del_vqs() clears the
> same field, so the second load can return NULL after the first one has
> passed the test, and vring_interrupt() dereferences its argument without
> checking it.
> 
> Load the pointer once into a local variable and test that, and pair the
> read with WRITE_ONCE() on the store that clears the field.
> 
> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Found by code review; compile-tested only.
> 
>  drivers/remoteproc/remoteproc_virtio.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28a..fafd73e1368a0 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -89,14 +89,19 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
>  {
>  	struct rproc_vring *rvring;
> +	struct virtqueue *vq;
>  
>  	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
>  
>  	rvring = idr_find(&rproc->notifyids, notifyid);
> -	if (!rvring || !rvring->vq)
> +	if (!rvring)
> +		return IRQ_NONE;
> +
> +	vq = READ_ONCE(rvring->vq);
> +	if (!vq)
>  		return IRQ_NONE;
> 

We could lose the CPU right here and meanwhile, __rproc_virtio_del_vqs() deletes
@vq.  I don't see how READ_ONCE/WRITE_ONCE would change that.

Thanks,
Mathieu

> -	return vring_interrupt(0, rvring->vq);
> +	return vring_interrupt(0, vq);
>  }
>  EXPORT_SYMBOL(rproc_vq_interrupt);
>  
> @@ -170,7 +175,7 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
>  
>  	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
>  		rvring = vq->priv;
> -		rvring->vq = NULL;
> +		WRITE_ONCE(rvring->vq, NULL);
>  		vring_del_virtqueue(vq);
>  	}
>  }
> 
> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
> -- 
> 2.43.0
> 
