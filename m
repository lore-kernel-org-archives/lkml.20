Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FA3B0AF8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566612; cv=none; b=kUwnj6zkezIwe4heanmovtyozq5sGvtxM0YXGVz0Sf3vG4sKRNg13pqshnZ0HwRx9ajerTCzPGVKzP0L81N293IY7leN3Nl93gb5AWZqBdEoQyMGHUogSyYCwJ2FX3JCnbYtHAA9E30b4vOzxqQDGaJh0l6MKe7fRyRw8qNFukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566612; c=relaxed/simple;
	bh=xwzSYXHIDR/wNSEwLPL36zWCEasX2wATwN606PXeDEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRkZcPQuB3DQsyoHIuCTfOrXyLirMmHE1QxjTDezl8fq2Ebpm2n5CCSYQEBQWpnNNiPX50pUBr/mRywe6qBvoMGmZGoDEfPYyUBeiuwQDmGzgen2Ueara0V8PwokSSALAZiW0GUzcB2XDdAK+XqZcuiA7rR6wH0R+qLILlRKVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOqUziU2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOqUziU2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2df982e04c1so26965295ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791566610; x=1792171410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xG7KgF2524MFFFHJwvMczQmuZ8uU/c4GICmzoy1aYQc=;
        b=nOqUziU2pbtFOLGNh6ZsQ4WKvFkp2sFtHCBKSX59Rc65ictjkmb50XevIfqa4bgLEc
         KN/Qy3q1bRb0fZXLc7s7ZJS3uguQRZFrHFo/ww6R2Wk8dMJwTLnm54pXhslYAZbxUnnF
         ODKziFOs+6gzvcTGQ28ANGmGpOMxpCdq8S0D119BIqYN8ecTpQPtj8uGHGarvJuEf4MO
         1yVv3nnd7r/4j5liQf0VHe6wuuLqlhqG9LiryGi+4sA9W8huLcYV/ijAah2KEOSrT9bF
         4lz1/6yJC75ofnXjttIIbAcfNdvN+3iNnVAGHolNDw0iN3L3LRR8oZyc/TUfT8mYCcCt
         3hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566610; x=1792171410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG7KgF2524MFFFHJwvMczQmuZ8uU/c4GICmzoy1aYQc=;
        b=PXzbj5AczFck5gtkJ1rIhqHrzxm4aiPO/f5S+Jr4hauVhWCWre378yWShavkBCek1I
         6HexXdlZevnF0GYkuBrSWyKECN5VdloBAFpK1xqmlu5gXLnd5lO3PHyuxwCZggaJ8WH1
         e99X4XsAmlqFwA/aq5fTpATYwF2dQS3pSZFNv0v8ayAhXSlLmhylJUGnr5+A4oy8C8z0
         MPvtagEG4bEnT2MYQ/4QiEVCZISY9mPV5RK2wejaKuRpFWfL/gbVaVQxE8BhD6LMqDIh
         vAngRSdm8Fgh7GM6dUJJ2wiIcNFAS9IdUzQy3ZQ+lsYmHBRuJK89g14wGA1RFjwsggLN
         kbIg==
X-Forwarded-Encrypted: i=1; AKwUvBzF46E3RYrXBfRHydioeM3iAbY3HRLScvq2n7/l07Qv/z8hXKQ6Y7cqM4u+9dJU48JnxK3YCK6muTOR9hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJpYwuVuscGXoxuTuvAZYAYOvH7MgM63JX5vlD2RUbNMzs6M8R
	bTwn7oq15JjZn1pAvBHre4881whbCi0VVzhUTpz+MJZk4b3ayFb6X66Z6pnwxgEuBuE=
X-Gm-Gg: AYBFou3sWFmd+34vBGt/Wp9+YqUHAmKd0+fBmT/Fw7PGyv+O66DzjGVpUymZxM+rfMc
	1zyUPL4asipfIc81VdwVJQFsAN3k4ZKT2MetxCCGOwkQkIpWJbsnEeg6Bq43YSKM58BWqEWgbym
	uLEHgU4bt0Pz/z+vruBPAXIpT/0tO10UwBupxoiCWomOsylREGZFEVURma24jnvDpw8GgKX2yVb
	SGoqu/9F1MCKk19QcDBEIRLdXc/n/Djy/ygspZ2k82baeQ7GRYWR6TP6qHpFE5F80KZOA/IbgAg
	pthTzIB9fHQldl8QVHlyC5akjkaZ9yAA12sTTJ/dZLBiPA2sp3UJEiMVnFoKNtnqcxaEjXG1J0/
	MGaFA6V6xWy8vhyJXEiWFxXaB1No6wqTYuJpsslqm11aYAQCig1pnCnCMHdwRQYNT85Lr0X3vIk
	HB95SpsC8HQ6aqTg/WKKYaLtd6IKISUF346KOCwLQsRIcpK0N/w7ANhgHOkre1+6LBKxAivNy3A
	w==
X-Received: by 2002:a17:902:c403:b0:2df:5967:8eb4 with SMTP id d9443c01a7336-2e842cdf445mr24734225ad.41.1791566610026;
        Fri, 09 Oct 2026 10:23:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9f78:f82f:d05e:99a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b78ecsm14467415ad.48.2026.10.09.10.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:23:29 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:23:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
Message-ID: <askjD1DxFvrV5ND3@p14s>
References: <20260926041943.1124650-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926041943.1124650-1-oss.patchbox@gmail.com>

On Sat, Sep 26, 2026 at 12:19:31AM -0400, Yuho Choi wrote:
> rproc_vq_interrupt() looks up rvring->vq and passes it to
> vring_interrupt() without synchronizing against __rproc_virtio_del_vqs(),
> which clears rvring->vq and frees the virtqueue. rproc_stop() and
> __rproc_detach() stop the subdevices, and so delete the virtqueues,
> before the remote processor is stopped or detached, so the remote can
> still signal a vring meanwhile. The interrupt path can then pass a NULL
> or already freed virtqueue to vring_interrupt().
> 
> Protect rvring->vq with SRCU: rproc_vq_interrupt() uses the virtqueue
> inside a read-side section, and __rproc_virtio_del_vqs() clears the
> pointers and waits for readers before freeing the virtqueues. Plain RCU
> is not usable because rproc_vq_interrupt() is also called from process
> context, where vring callbacks may sleep.
> 
> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Changes in v2:
> - Rework the fix: v1 only loaded rvring->vq once, which closes the NULL
>   window but not the use-after-free once the virtqueue is freed after
>   the load (Mathieu Poirier). Use SRCU so __rproc_virtio_del_vqs()
>   waits for rproc_vq_interrupt() before freeing the virtqueues.
> - Update the subject accordingly.
> 
> v1: https://lore.kernel.org/all/20260922190159.509836-1-oss.patchbox@gmail.com/
> 
> Compile-tested only (arm64 and x86_64 defconfig + REMOTEPROC/RPMSG_VIRTIO, 
> W=1, sparse).
> 
>  drivers/remoteproc/remoteproc_virtio.c | 35 +++++++++++++++++++++-----
>  include/linux/remoteproc.h             |  2 +-
>  2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28a..cd8f3a8b4870a 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/srcu.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -26,6 +27,14 @@
>  
>  #include "remoteproc_internal.h"
>  
> +/*
> + * Protects rproc_vring->vq: rproc_vq_interrupt() uses the virtqueue inside a
> + * read-side section, and __rproc_virtio_del_vqs() waits for those sections to
> + * finish before freeing it. Sleepable RCU is used because vring callbacks may
> + * sleep when rproc_vq_interrupt() is called from process context.
> + */
> +DEFINE_STATIC_SRCU(rproc_vq_srcu);
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -88,15 +97,24 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
>   */
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
>  {
> +	irqreturn_t ret = IRQ_NONE;
>  	struct rproc_vring *rvring;
> +	struct virtqueue *vq;
> +	int idx;
>  
>  	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
>  
>  	rvring = idr_find(&rproc->notifyids, notifyid);
> -	if (!rvring || !rvring->vq)
> +	if (!rvring)
>  		return IRQ_NONE;
>  
> -	return vring_interrupt(0, rvring->vq);
> +	idx = srcu_read_lock(&rproc_vq_srcu);
> +	vq = srcu_dereference(rvring->vq, &rproc_vq_srcu);
> +	if (vq)
> +		ret = vring_interrupt(0, vq);
> +	srcu_read_unlock(&rproc_vq_srcu, idx);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_vq_interrupt);
>  
> @@ -153,8 +171,8 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  
>  	vq->num_max = num;
>  
> -	rvring->vq = vq;
>  	vq->priv = rvring;
> +	rcu_assign_pointer(rvring->vq, vq);
>  
>  	/* Update vring in resource table */
>  	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> @@ -168,11 +186,16 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
>  	struct virtqueue *vq, *n;
>  	struct rproc_vring *rvring;
>  
> -	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> +	list_for_each_entry(vq, &vdev->vqs, list) {

How is list_for_each_entry_safe() no longer needed?

>  		rvring = vq->priv;
> -		rvring->vq = NULL;
> -		vring_del_virtqueue(vq);
> +		RCU_INIT_POINTER(rvring->vq, NULL);
>  	}
> +
> +	/* Wait for rproc_vq_interrupt() callers still using the virtqueues */
> +	synchronize_srcu(&rproc_vq_srcu);
> +
> +	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
> +		vring_del_virtqueue(vq);
>  }
>  
>  static void rproc_virtio_del_vqs(struct virtio_device *vdev)
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a44368737b39a..919d19fe99198 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -340,7 +340,7 @@ struct rproc_vring {
>  	u32 align;
>  	int notifyid;
>  	struct rproc_vdev *rvdev;
> -	struct virtqueue *vq;
> +	struct virtqueue __rcu *vq;
>  };
>  
>  /**
> 
> base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
> -- 
> 2.43.0
> 
