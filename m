Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639285;
	b=yOmfVgrnK54lzkm0SsEyxstUoRPrUyT0cDPVbVCIHeZZV3bn1faBMClTkKrYgPL0ouyQ
	 LbWkbpJ0xQQKOROBOtPRXIYilnoMDDtdRF7g/gXE4Zi1FAxDNctfN4cIAlod4LNABOYly
	 XdC5mx6HfsfNBV0lNx9QFJBvtQNKoTO//F9xkIHC6JHR6VhQfsqSMwkBMF/dFun8aGES3
	 V66+zyH3BiMtNJVJhOtvSrXeNy/5iOek5hWUYPoTsNtxIGxlSM04a058lWfbuyW8TUg5Z
	 +OZRcjq2jauTvW1fLzTWLySig5SbphPVjDljvEEcGIpS/Z+VZiXuySr1Vrh2tC+0E3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
	b=2jp76Zmk105Poo1qYiLUr6XPu73RKq135tTFIcupOYNmvIKMNr2VTlQ1ojZvBlTDDkW7
	 iAgISTKMzTz5gi91rRG1aIabVSC8XyIe3DAShjRyvWv2ACYI20Ena8xzTxCUqXAtZ8YKh
	 xN6g+3Iq3nTHNpqywTqhMxePwH8zSmTHvAxPXyOgSATL8PS4ZEg1mlARTQJNNSK65tE75
	 ZNat6nBKg2DJq0UcZS2YxA6NLoZF7GZTrmjeSXK13ONS/EY14hdjbds0eWLO7Tt5IPR9n
	 Y/j3FhCNg0fX1CkbeRCXu/4TAv5u95bGOtih7QhgO7oc9rXowV21pee7sty6lllwRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ly+YjSo9;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30A606A905
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB30A606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ly+YjSo9
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e946155442so29418115ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793639284; x=1794244084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
        b=ly+YjSo9964637Q5hZz/Zv59Lrh35CMU7QkyhFHdt3lLJxiQLhpxGS3oO8cB+3/fi0
         n7GT2duTeUNe4EDJhqitnHamRNLwtXzs6tRR1/uanV090tVxTNNSWRMQQTckkQrLtJ3o
         aw/cGq2kUKKfoVg455YMqIf98cutWa1BoGhN1IK4JMrw0Y/myCj87OBx/HfKO1Cka55X
         rzu1T5bx47CTU2VgvOasvq6kjrKagqCpgLSFcss7tWEqYM+IhyBP9Ua/nyd6gAHcNrn5
         MLYODtD/GYwX6ZyLytvcYNYo2UWr/mq3CNeRyqfrvaQrShfp4vr5E5oeCaYJuGlv+7Z5
         i4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639284; x=1794244084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
        b=cdYjYW3bRYGAzNBwKC5ansxUSR124sz2R03F1gDki1K53EfWyDm2jk3BEODM+KON/F
         798nOGpE7StxQmOxy0/XiGsRS6OaH/GRIwh3iGhPOsaU1C+ABEbXMozgeDJXdtMGWe8Z
         0USrHtX1hiUAFFhZzHy1lKo9AyFptySmlLcICx0Lii90TNGhxb9gptxls86wDNIx5YC3
         IJvPW+p/I1T4SEM9hUXtI5ifkuliQG93GeBe0kdemIleA0cjUnFzV9z63RpaSGC9aKor
         JR3G7t24g2tBgnGOy9OibDgxEU7hxbwmETYpHTy0T+8iQe76RD1667CIKfiZ0yJdr/yE
         7j/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmYMQpetGMYa7OF7zqCFTpqCHFA0tpfEAhVs9p16/35BEns8TPAQpHEsYOuaZZV1nOai2kOsr3IN+uT38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+24cDKaIhgKjU5SKX2sgIdf/bBKhOm500DdcY/WxPEVsEydXcv
	jtIl/vgDkiLu4s5/SUOwaEG39OTbwzorKQfBS+M5WhYXc769a49snylo4mmEbzc/PWg=
X-Gm-Gg: AYBFou1X+uiGNih/xYBtGfOlXiIlQ4Lg7A5jzZKrlmeLPI70pRAODrbUKPTS5ZtDx5+
	npH4ABCmGK2pW5V5WwZ2zHzhPVQKIhwaSdgRD1APRg26KBxJGXrkUO8dDJUJowdbICkCfVcBdIT
	gtIXZAn4PXsjdnI378QJI65tVccTXLVIx+ZEL9fZitO2mbEtL+XAkqasl5QAvwMRqSeTOk3nfgg
	bQ+UASXmH8cG34IzKVlVyJSfFI9shpfT/aSIzk6pQ5XIiujpLjvXMuzBw2dAhBNXAkWpXGSrsGD
	I2z82I7GoE5RE1yhVOP0D1Ok3rA/uQiGA7QXeeoPfVYqZq27ZVhLuI9cXUxTqcfD8MzFhTbdzw8
	cUyt3/D1f0xZMzNZuwt2XZTxOMmARk7RkrhHKm16UYfL8+ew3vKcX/Z7r2Itg3Kx98dacOoiWJ/
	TPwaMs0CRYArHwW+7x25P7RBN4s3Ey2415HJOSa11lFN4VwbF3EMLRPV+jBueGKSojruqRdyR6V
	Hxo1LFSfzUotA8sDgQhI/FPkIEJoW4PGPClwYOFVcy7SR1fmVUUj3e4tZ/Vk0g6Dn1ysUPDWZqo
	Q+tMjTWh2Fed6PLD5ONbR6YAnw0YBxM=
X-Received: by 2002:a17:90b:4b90:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ae89851099mr8646712a91.52.1793639283927;
        Mon, 02 Nov 2026 09:08:03 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e1d3esm10064a91.3.2026.11.02.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:08:03 -0800 (PST)
Date: Mon, 2 Nov 2026 11:08:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
Message-ID: <aujDcTjvpWbIJ8wm@p14s>
References: <20260926041943.1124650-1-oss.patchbox@gmail.com>
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
In-Reply-To: <20260926041943.1124650-1-oss.patchbox@gmail.com>

Hi,

This patch doesn't apply on rproc-next - please rebase and resent.

Thanks,
Mathieu

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
