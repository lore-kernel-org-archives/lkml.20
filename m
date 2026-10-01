Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B3288B9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812877; cv=none; b=ly4256rYFoT56VS8HJbhDkN1xgQ+hTzHo8LpsxSYIs7lfAok5CxSNtxzjfoxJRFDrpehsL8uZNFL4IeVOK9lj35vQgJpvOpmcqxnc2RzhaMlUH1HVvnJCIT2t665yBa1Wb1sdksUsAyYSM8FLmGRpgguMJrww/3IR6VPGTHusbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812877; c=relaxed/simple;
	bh=V7Z0lo0BEjogYiV25NYNKTeD7zQZ54Ay2SS/FBwCFv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lbv9g8OMkw5AhUUpyjIUMnONjiJ+Mt1XfhdBLnu50hMSV7CrfkU4Pk2QHYWPccb6Kp6xf6LvRJfk9f3p1ZfpMi4kMcp5oi5hEPRDFI6hXxmXNZAaWCl9OHsU0yNEZf3xE7gGX025mw8u/2tzkPz9zFSzAeGDWewANavBQGUJUoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9b7pHjf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HfbZSCRe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9b7pHjf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HfbZSCRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790812874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17b3o9vAQ4ol6sSQnDn082zijc6Ge4gxTOdOGz1SJGg=;
	b=C9b7pHjfQouYhPFw8ZYMmhV0slaMGB905yNHDhayA76xqEtpG4T5Sf9mDf4QxtnbvQ1Q39
	6xSh6j3YP29kp/K/JB7kEbpZNPWP7z8norCSmzJvVAdiQnweDge/Z/NN4fX1nwFg1RYJyL
	1fGEvBVqlAvpcTfeTSJcX+YuMTPMO4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-KDHaaKveMoyKVW8EhNXK6w-1; Wed, 30 Sep 2026 20:01:12 -0400
X-MC-Unique: KDHaaKveMoyKVW8EhNXK6w-1
X-Mimecast-MFC-AGG-ID: KDHaaKveMoyKVW8EhNXK6w_1790812871
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49fff093efcso55272795e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790812871; x=1791417671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17b3o9vAQ4ol6sSQnDn082zijc6Ge4gxTOdOGz1SJGg=;
        b=HfbZSCReF3KkIpJ3LsPIVG8yBbYwYKNORKVDWZQFbBhDpdLNuN1N+pxFM9jCOfXh/q
         8REzFNKhkveayiys7MiOo7ANVMg1Cap4zckM4gQNTWBpKSHMIvquGtvhRG2AbQd3HwWt
         tR9PfS6hyx6o0HmPbxRnUkFy5Bs2SGWTlE2xu9g6dlWv3VBWlUpU4ev61wuQo9efouE2
         rFzYW3sFLENprR86P1ApT4P7FszlPaJ1X9CRp8CFeas0ZosTvguA6FOqgQlSG8Xd2sar
         b5ArOs8l8/drbKPOm8F5GEnWtdt9zZX91LAiPvgJ5Z3ocN/OdOuzQlH4HzAUaxYv5fMa
         EgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812871; x=1791417671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17b3o9vAQ4ol6sSQnDn082zijc6Ge4gxTOdOGz1SJGg=;
        b=d3yJ4LV4za6mSxWvzr2/eWWpth4mBB5BKGoUHhsk0VklNN63Ks588CmH2M/VyNfRTK
         fNkfpBIVgwI04E9C4jF4uGON9wieOJNL4wWl58GDWuClt4EUYRM9OaljcJ2OWXivNEJL
         tBY6rIn9fow7bdUHmG3zvWvjU1N/1u9ghZbYSFLT8aNSsT/osP2mHPpsioaxIhzqyg1c
         ap9uNpyfn9SHsX8fq0lW3zF516YxDVSSZpGtya54lDNuGkw1e8watkTnwOw0/iYK/Y43
         oxA0OCw29I1W/uVoW2/MLtFpjIaI0ejXyLhZaCiVY+mEglMtki51jN98AlqpCATnURj2
         uLqg==
X-Forwarded-Encrypted: i=1; AKwUvBzIBqQ5IHibp1XZhR/3FlhmKrZ6v2qzxE15jFNsfUF4xjiavL1YknrjDEW+0xN7SqtWJh6BEHzm06JuSbM=@vger.kernel.org
X-Gm-Message-State: AFuF++koU4hwg0BKWVHGSNQ8caX+zz28VJ8rgtFpuAlZjQDVnOilXWFb
	Y0iqwuhexIxs6v+Xzk/fcrAfCVHhyr+IgzkiiXQm6Obrs3U98pjKuiz6MZsoQhKTca3pDjggmAJ
	/sNWehcgckf1luDeyjLmbdeDGRCsmHIuHf4RDhNGn41oRpAi4G8pSq7i2soDr6dQstZ6NVBC3vA
	==
X-Gm-Gg: AYBFou1n9m+k26brdqQSWikzHNFLjJ19eH9FvSS3d8kV0Sd2OcsmrNm+3iXxKcWSnKa
	Fh3PqRXKaiXoglpreBEUDxXQeAeekuAuPiC6jiWpeLignEN1njXrZEDHkXSz3VmQfSHjBiR8/Yd
	A7kIRfylLJZeDcEqQnl8BYhRht/kwT5IdUvHTcahGZClmanUNcK2/R+Dkgo58aV7nYx1IiMU13D
	rNaAZ3e2fs8VA3xlGO36BYbl1eOu9Po1775nuTRvnrLQRPLQWnA5PaQDqTqUSa1KotS3/9XOfKA
	ePALWxfvOogcIHoEYEHaQuv01EN2wBO5QXLtexCbetuCw4cdkaxtcteqquGmYjj5nL9SCg==
X-Received: by 2002:a05:600d:82d1:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a01ad7d7a7mr56140825e9.2.1790812871272;
        Wed, 30 Sep 2026 17:01:11 -0700 (PDT)
X-Received: by 2002:a05:600d:82d1:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a01ad7d7a7mr56140525e9.2.1790812870775;
        Wed, 30 Sep 2026 17:01:10 -0700 (PDT)
Received: from redhat.com ([2a02:586:1d05:2c0:d92a:1b52:ee3f:b73d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f936e3dsm21962555e9.8.2026.09.30.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:01:10 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:01:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Zhu Lingshan <lingshan.zhu@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v1] vdpa/ifcvf: Time out and report device reset
 failure
Message-ID: <20260930195908-mutt-send-email-mst@kernel.org>
References: <20260930155920.1684465-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930155920.1684465-1-oss.patchbox@gmail.com>

On Wed, Sep 30, 2026 at 11:59:01AM -0400, Yuho Choi wrote:
> ifcvf_reset() writes 0 to device_status and polls it without a bound,
> and ifcvf_vdpa_reset() always returns 0. A device that does not finish
> the reset, or one that was surprise-removed and reads back 0xff, keeps
> the caller in the reset path forever.
> 
> Bound the poll with readx_poll_timeout() and return -ETIMEDOUT from
> .reset, so that callers such as VHOST_VDPA_SET_STATUS(0) see the failure
> instead of hanging.

No one handles reset errors. You can not timeout this.

> Stop right away with -ENODEV once the device reads
> back all ones and is no longer present, as there is nothing left to
> wait for.
> 
> Fixes: 386a26208524 ("vDPA/ifcvf: synchronize irqs in the reset routine")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Use standard is present APIs not "all ones" hacks.



> ---
> RFC for two reasons:
> - The spec gives no bound for a reset; 10 seconds follows octeon_ep's
>   OCTEP_HW_TIMEOUT.
> - vhost_vdpa_release() ignores a reset failure and still tears the
>   mappings down, so on close a timeout turns a hang into teardown while
>   the device may still be active. That needs a separate fix in
>   vhost-vdpa.
> 
> Compile-tested only (x86_64 defconfig + IFCVF, W=1).
> 
>  drivers/vdpa/ifcvf/ifcvf_base.c | 24 +++++++++++++++++++++---
>  drivers/vdpa/ifcvf/ifcvf_base.h |  3 ++-
>  drivers/vdpa/ifcvf/ifcvf_main.c |  4 +---
>  3 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vdpa/ifcvf/ifcvf_base.c b/drivers/vdpa/ifcvf/ifcvf_base.c
> index d5507b63b6cdb..8a6c8f8314d53 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_base.c
> +++ b/drivers/vdpa/ifcvf/ifcvf_base.c
> @@ -8,6 +8,8 @@
>   *
>   */
>  
> +#include <linux/iopoll.h>
> +
>  #include "ifcvf_base.h"
>  
>  u16 ifcvf_set_vq_vector(struct ifcvf_hw *hw, u16 qid, int vector)
> @@ -201,11 +203,27 @@ void ifcvf_set_status(struct ifcvf_hw *hw, u8 status)
>  	vp_iowrite8(status, &hw->common_cfg->device_status);
>  }
>  
> -void ifcvf_reset(struct ifcvf_hw *hw)
> +static bool ifcvf_reset_done(struct ifcvf_hw *hw, u8 status)
>  {
> +	/* A surprise-removed device reads back all ones and never resets */
> +	return !status || (status == 0xff && !pci_device_is_present(hw->pdev));
> +}
> +
> +int ifcvf_reset(struct ifcvf_hw *hw)
> +{
> +	u8 status;
> +	int ret;
> +
>  	ifcvf_set_status(hw, 0);
> -	while (ifcvf_get_status(hw))
> -		msleep(1);
> +	ret = readx_poll_timeout(ifcvf_get_status, hw, status,
> +				 ifcvf_reset_done(hw, status),
> +				 1000, IFCVF_RESET_TIMEOUT_US);
> +	if (ret) {
> +		IFCVF_ERR(hw->pdev, "timed out waiting for device reset\n");
> +		return ret;
> +	}
> +
> +	return status ? -ENODEV : 0;
>  }
>  
>  u64 ifcvf_get_hw_features(struct ifcvf_hw *hw)
> diff --git a/drivers/vdpa/ifcvf/ifcvf_base.h b/drivers/vdpa/ifcvf/ifcvf_base.h
> index aa36de361c10e..57d00b881582b 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_base.h
> +++ b/drivers/vdpa/ifcvf/ifcvf_base.h
> @@ -29,6 +29,7 @@
>  
>  #define IFCVF_LM_BAR			4
>  #define IFCVF_MIN_VQ_SIZE		64
> +#define IFCVF_RESET_TIMEOUT_US		(10 * USEC_PER_SEC)
>  
>  #define IFCVF_ERR(pdev, fmt, ...)	dev_err(&pdev->dev, fmt, ##__VA_ARGS__)
>  #define IFCVF_DBG(pdev, fmt, ...)	dev_dbg(&pdev->dev, fmt, ##__VA_ARGS__)
> @@ -112,7 +113,7 @@ void ifcvf_write_dev_config(struct ifcvf_hw *hw, u64 offset,
>  			    const void *src, int length);
>  u8 ifcvf_get_status(struct ifcvf_hw *hw);
>  void ifcvf_set_status(struct ifcvf_hw *hw, u8 status);
> -void ifcvf_reset(struct ifcvf_hw *hw);
> +int ifcvf_reset(struct ifcvf_hw *hw);
>  u64 ifcvf_get_dev_features(struct ifcvf_hw *hw);
>  u64 ifcvf_get_hw_features(struct ifcvf_hw *hw);
>  int ifcvf_verify_min_features(struct ifcvf_hw *hw, u64 features);
> diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
> index 2af1cec958848..6c569f01bec91 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_main.c
> +++ b/drivers/vdpa/ifcvf/ifcvf_main.c
> @@ -444,9 +444,7 @@ static int ifcvf_vdpa_reset(struct vdpa_device *vdpa_dev)
>  	if (status & VIRTIO_CONFIG_S_DRIVER_OK)
>  		ifcvf_free_irq(vf);
>  
> -	ifcvf_reset(vf);
> -
> -	return 0;
> +	return ifcvf_reset(vf);
>  }
>  
>  static u16 ifcvf_vdpa_get_vq_num_max(struct vdpa_device *vdpa_dev)
> 
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> -- 
> 2.43.0

