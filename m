Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334CA48423D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102115; cv=none; b=X1vj3n6nDm6lK4MFMlpA5NE8Zk7IwLJd3Zka8vU6/ZVc7qV79g+VUZAmmIPASqqlqI8PZttNyhKMU7IKhCLnRHEC6gBf8AwPZ4HvSrIfBeNiugSAsDTtWPq+HQY9PGaXbFqMqICR5tbLiQg1tL4bBqtJuXqCrMmZpICEy4iW8YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102115; c=relaxed/simple;
	bh=dHHZ3K8y10/env+CSCM+isXdc2ntqu+4Ms7TXC53OGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSrNNrnx+3m+ThpRfrLxJKyUGKIPdklIOj1hPcOJxlf7ssKr6o26pPEBcoHCeZCTL+XtS2a4mRL+3v337M8l6wWg2wt2SfO7cX0704wOqNnbb3J+fp5eLdPxWke0ym0IAr9uMqQSy6hJ9IzPBpJ2NiTyQZFZAc3+qjcQFguE7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrX5vrFP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MfCqLLiM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrX5vrFP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MfCqLLiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790102112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I3Aqw9/+f4eSPjaI78DYRAV/Pprlcx0/eYJ061KVMvw=;
	b=WrX5vrFPrcfGz7je4bYnJLCFQ2d1vxu2lB/jM/KJA+2ggPxPFtmjJTuFvXGUw/rspLLR4v
	H+iliE8cpdFjvyhXymUHOUCvTp9YJraN/a3npy3LNZ+5X+yUNjoMGvQ/cYkG8UA7ARE2FP
	146z2X6shjGTF6RdOWbO4PX0Sc8aONk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-nC7jP9ITPk6WEuJmKWCYuw-1; Tue, 22 Sep 2026 14:35:11 -0400
X-MC-Unique: nC7jP9ITPk6WEuJmKWCYuw-1
X-Mimecast-MFC-AGG-ID: nC7jP9ITPk6WEuJmKWCYuw_1790102110
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so657525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790102110; x=1790706910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3Aqw9/+f4eSPjaI78DYRAV/Pprlcx0/eYJ061KVMvw=;
        b=MfCqLLiMC+e1io6Hno8W9aPoP5X/X8XC61uoKadrov75HjmoBJQLqRJm/kF+BPh//B
         Zgjnrey9QOuFiwjKAtSI+TIusW7dTMmec2cK1YCl+9BW0B8poNZ7NXQMvZQn2l1ELfRF
         Ek2wScPGfNu/BauOenhrDVDGBByANHMXo8kMJDIU/lQWaNrs6Nib+pfbcI6MulVp6dxQ
         WZyoWw3pcg/4HMnvMDcfTzJJVbtEHLKi1tjGPQp+caUa3+6Rq3F1YD+a4jXuaEo8FNM7
         sFS4fY3iHHrbzfNyJ80n0EMXvd1dSbYL4388U63JuHexeDRpxqii5cv6FEjr0OJ0/xhH
         6wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102110; x=1790706910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3Aqw9/+f4eSPjaI78DYRAV/Pprlcx0/eYJ061KVMvw=;
        b=OF8cOblGhrFL1js4+Rii5VnoZtr+WvK98OL/rvB7Mzkp5GdUwqfuLkvpL7iMNuYDAm
         3UMJWSFouyxc6w0BH0Qfv+elK4iIiYzGoaGFxvgllvHRGElOZvwoDW9nI7Y/jOBuI0ID
         n/kx83kXCh8MlfkUD9GXMvPbigpP6H1+YyZ5TZfEXPwBJVibnannItZKrmoYH8Xest9h
         98wX7ngtij/SJ30tp5F94MzVb/khFU5TvKe8I/nRf3GFwtxSBSQ/wswGuchoj02wowvM
         KzjNjnTcAdhtkvMYmPlte8oeLEXm2w7KY0bTVczO2HX1KYopuFEThnHxYGknT2bj+Tz2
         kAMg==
X-Forwarded-Encrypted: i=1; AKwUvBxC+aHJ/6Z+TVzWyuEq7JRgL9qmWYDqJNVhmUBL8VT5U1B//2PRwxd2gq8ux678i7uy+yTBB3j4RNsfc4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++myJiZECsPmOHTEkgLfVHOUriIUA/1qPWyLaP4pLkE+Fj/5KCy6
	ZUxUA7rEWuwA52s0ZdpNY7eAPbc0gj96jdKrMpAnQd5qfv9rZljhkd1QnB3+avXxC2D8FXRSmn0
	43oVtmwL1iIE8rq0YXHrzC9iQkghfcJwYnV0LifdNEpEtcVx7A+7yWJJqoIqcMKnj5w==
X-Gm-Gg: AYBFou13qg85xa4fnxCjX723vsNOCW4qOI1qQmM4E/CbwQucdMYykvcEY5ymJwqeLpg
	9GMu614i1J4yixlACUxbe3e47JP+7uKalmM6o3WB/vBCmjo6riXZe6lV1nLMNglBJKHCQ2BxQ7K
	LznPqgFEv0fn+0c9PKaiyAUHqDbjdX9Ye77ghHJdzlLcnkm80olwrZGDNOjN09pTbfZfPUvLtNp
	jfrFeDIqBFBYk6AfREvM7FBHHJ+CzSXVppBv/y4s7nzQrA9oFjVZnsoU0Ar2TgtMGGq5ZTQAGB/
	59mJbWudN8dFTZjah/7+vY2NUXKqQqLr0kfYWCyVEbcd5ElU6AFKGYf7pMIt1e+SoZ3gug==
X-Received: by 2002:a05:600c:8b30:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fdf34b3b1mr1051755e9.35.1790102110120;
        Tue, 22 Sep 2026 11:35:10 -0700 (PDT)
X-Received: by 2002:a05:600c:8b30:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fdf34b3b1mr1051515e9.35.1790102109563;
        Tue, 22 Sep 2026 11:35:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm286912f8f.29.2026.09.22.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:35:09 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:35:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Siddharth Karanam <sid9.karanam@gmail.com>
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio: update multi-line comments to the preferred style
Message-ID: <20260922143419-mutt-send-email-mst@kernel.org>
References: <20260922171636.201408-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922171636.201408-1-sid9.karanam@gmail.com>

On Tue, Sep 22, 2026 at 10:46:36PM +0530, Siddharth Karanam wrote:
> Some multi-line comments were not in the kernel coding style.
> 
> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>

not really interested, sorry. whoever is editing this code
can change the surrounding comments, this kind of thing is
just pain for backports for no gain.

> ---
>  drivers/virtio/virtio.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index b6c9e927bef5..c6dffced864a 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -51,8 +51,10 @@ static ssize_t features_show(struct device *_d,
>  	unsigned int i;
>  	ssize_t len = 0;
>  
> -	/* We actually represent this as a bitstring, as it could be
> -	 * arbitrary length in future. */
> +	/*
> +	 * We actually represent this as a bitstring, as it could be
> +	 * arbitrary length in future.
> +	 */
>  	for (i = 0; i < VIRTIO_FEATURES_BITS; i++)
>  		len += sysfs_emit_at(buf, len, "%c",
>  			       __virtio_test_bit(dev, i) ? '1' : '0');
> @@ -80,8 +82,10 @@ static inline int virtio_id_match(const struct virtio_device *dev,
>  	return id->vendor == VIRTIO_DEV_ANY_ID || id->vendor == dev->id.vendor;
>  }
>  
> -/* This looks through all the IDs a driver claims to support.  If any of them
> - * match, we return 1 and the kernel will call virtio_dev_probe(). */
> +/*
> + * This looks through all the IDs a driver claims to support.
> + * If any of them match, we return 1 and the kernel will call virtio_dev_probe().
> + */
>  static int virtio_dev_match(struct device *_dv, const struct device_driver *_dr)
>  {
>  	unsigned int i;
> @@ -565,8 +569,12 @@ int register_virtio_device(struct virtio_device *dev)
>  	INIT_LIST_HEAD(&dev->vqs);
>  	spin_lock_init(&dev->vqs_list_lock);
>  
> -	/* We always start by resetting the device, in case a previous
> -	 * driver messed it up.  This also tests that code path a little. */
> +	/*
> +	 * We always start by resetting the device, in case a previous
> +	 * driver messed it up.
> +	 *
> +	 * This also tests that code path a little.
> +	 */
>  	virtio_reset_device(dev);
>  
>  	/* Acknowledge that we've seen the device. */
> @@ -615,15 +623,19 @@ static int virtio_device_restore_priv(struct virtio_device *dev, bool restore)
>  	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
>  	int ret;
>  
> -	/* We always start by resetting the device, in case a previous
> -	 * driver messed it up. */
> +	/*
> +	 * We always start by resetting the device, in case a previous
> +	 * driver messed it up.
> +	 */
>  	virtio_reset_device(dev);
>  
>  	/* Acknowledge that we've seen the device. */
>  	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
>  
> -	/* Maybe driver failed before freeze.
> -	 * Restore the failed status, for debugging. */
> +	/*
> +	 * Maybe driver failed before freeze.
> +	 * Restore the failed status, for debugging.
> +	 */
>  	if (dev->failed)
>  		virtio_add_status(dev, VIRTIO_CONFIG_S_FAILED);
>  
> -- 
> 2.55.0

