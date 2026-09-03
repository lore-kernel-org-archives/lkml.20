Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F63B42C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434943; cv=none; b=h97IUu3kvTBAwkjh0AKIDA4kxttlni1KqRVFmWBgpYlFwHL9Am7hTTB7eJZpUMVBkVyeyTNPz0aEDdb/mvd2YPFPKbrynICBwuylPN9azZ40rLjRFtKuHaxSge0NVsji2RoaWEQ0w29k/WGZD9J5aN7RT1TkWN69bwJN13ebfMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434943; c=relaxed/simple;
	bh=izIoxQQPPhWNBGA2zN0F8lnUVzBbBYH0WQkACSGnoZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmgZZq4V/VGukYhzjDhPgytbinPAGm3Qzb9T/qYtWsdoYvyfKcLVXY8lrVyLzfp5Vx1rVbcS05flDu8A7N7BMlY6TK+z+3g0gdh6DjmQacMgU7wNCAedcD9zZrr2FQaA216op+GDErhUiYRAb8ShIHVBTDLw/LaslJzqq1UHB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXgrPdQF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mBiJN+kQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXgrPdQF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mBiJN+kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788434938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7VfWNLPahHWyir7K1ES/2Ml0Y11JC1XZzjOhYDml2w=;
	b=QXgrPdQFk2ya7Wb8jXi8ir0b2Xu9GCV+GiOO8XyXUb99DEPnReJUozxNp3MtNfHnyIPf+t
	q8YGw+qw/IE01rzU9T9KKXrx2DEWeT5yeTuZJ6ZpBaXxGMpkixIJEfRoXagXrFu/B9e1ol
	9y8lqgXv8xBbojNpnR8402RnYCsmcjA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-qKJtSKmONDCji--I2Q2ypQ-1; Thu, 03 Sep 2026 07:28:55 -0400
X-MC-Unique: qKJtSKmONDCji--I2Q2ypQ-1
X-Mimecast-MFC-AGG-ID: qKJtSKmONDCji--I2Q2ypQ_1788434934
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b0d7a07acso24465555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788434934; x=1789039734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7VfWNLPahHWyir7K1ES/2Ml0Y11JC1XZzjOhYDml2w=;
        b=mBiJN+kQCJmMiEEXkDgOC9YcE9yTwHgFPLSZ93qjlVs/RTljHaqhybSE617rXQaN14
         GXxxEUCqC+MxJt9mXmfVG/ngl50asEegZgpKl2ttGUCLRSH8yGutK8yir46MutrJUgRt
         hxxbVbXkoUTaAHFvBuVt7nTA5YICOCVUfHduQdE84dPU3bLuDkHRLoVPVtaeOs+tggBq
         PGNnY95XBfKSInAf5G3g8oMvVoXRhH8YFpZYfe4eti4EU+ooL153fzySk1hv9U9NBzv2
         cQ3UaxNSNH2XM6Y0NRei1NkJSXd/cbjP15ktRjKqPXHvk1XJvC4x9aD3RiFmlhmly2ZN
         RuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434934; x=1789039734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7VfWNLPahHWyir7K1ES/2Ml0Y11JC1XZzjOhYDml2w=;
        b=eL5bhiwfboDVpJJmdiANtDO5mwXxbATeMTGDuRC8XyWw2p0kjldtaFO8/3coE7b8Vu
         TDzvc/XQqjJCCjPcr4V5URQ8ArkG9z4zNWae3nb8fvG42LdvWZ3hPlM3eIREM2eXtmro
         cXKa5e9d9gw0M9Z2vG1jYsFa4emqkoPs11N5kPgmZYzNa3dhNdXbwgnGLOU2i6DEpFSK
         c2apFPC6lsBSKFkU8t3Rv8dQ5PlHsDCXlFW6x35WpJ6S+royokgDuj4Yh9Yfx1tirQRm
         onNaLEkhBIxce614JwXGrpp3Prxbu7o/dAwT5gZofFIVtp3fOcuCupzbQNgm9spP4oZ3
         B6mA==
X-Forwarded-Encrypted: i=1; AKwUvBwpGnmMvXUUI5h6Fc7hdLSVlfRp5XftacmDo1wzukMd83iq3GZ/qx5T60zW3xcRn0TbsN0iwDYcydW1KeM=@vger.kernel.org
X-Gm-Message-State: AFuF++mIOa8pMzhfpbmiF2FtJRMplBDeXUUsvqNWeNKgyidK1qUqK424
	D/NBt3IZN4Jn3eSO2PJmZkhGJn53DLiqgF5gPfBUD7W/YG/x1yZi3iXNT+O5qzUOSflhIEk1tzP
	rOmnV+b7TqfoZxEVn0WtkaP72Z2+awant31PKbHNy0UhtDS+7w99vSaI4tfTk9sglwg==
X-Gm-Gg: AYBFou2kEAsKIOouDJpfYFXF7XkpNB5qZyi0FaKrKNAH/aMxGPYuEa+3IRmocVPychy
	hh8/kGPFHU3U3wekC3N1yVQZTv8/fPdQl4gclvIC3o8dAGbBJF9MK67P90MovSSKWRR5Gf2nG6P
	5FsFB6Z3FYJM8Dht1tbQFV6ZzsY1SgzvGbT5HBF0CfBTwdgswTidY1hhQGucG8+0ShEbhs79/Ge
	ZJo9uM+AJiQ+2iHFUwc4ZL9YgZjp0dWJ8UJ4rIlXjrxWOoxgHSU0WffflmKpwjPBbXkf9yE1dyF
	FscMDeYGyUpS9DiZ9qjMMWsvysCWzh/YPv+zpCqWj2SsLlpyzXzXB0WGxSHmFHAN34FwwSGqWN2
	a1Nv420q0WhhQ0Lkf1z/0zog=
X-Received: by 2002:a05:600c:608c:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ce5826c6amr235855325e9.16.1788434933509;
        Thu, 03 Sep 2026 04:28:53 -0700 (PDT)
X-Received: by 2002:a05:600c:608c:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ce5826c6amr235853945e9.16.1788434932899;
        Thu, 03 Sep 2026 04:28:52 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm62587755e9.7.2026.09.03.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:28:51 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:28:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, virtualization@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] virtio-mmio: synchronize callbacks during device
 reset
Message-ID: <20260903072404-mutt-send-email-mst@kernel.org>
References: <20260818040433.66986-1-kmehltretter@gmail.com>
 <20260818040433.66986-2-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818040433.66986-2-kmehltretter@gmail.com>

On Tue, Aug 18, 2026 at 06:04:32AM +0200, Karl Mehltretter wrote:
> virtio_reset_device() promises that vq callbacks are not in progress
> once it returns, but vm_reset() only writes 0 to the status register.
> A callback that has already entered vring_interrupt() keeps running
> while the driver tears down the state it uses.
> 
> Wait for a status read to return 0, so the device has stopped raising
> interrupts, then synchronize_irq() as vp_reset() does with
> vp_synchronize_vectors().
> 
> Fixes: edfd52e63672 ("virtio: Add platform bus driver for memory mapped virtio device")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/virtio/virtio_mmio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 510b7c4efdff8..a2ca03dbe803d 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -55,6 +55,7 @@
>  #define pr_fmt(fmt) "virtio-mmio: " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/highmem.h>
>  #include <linux/interrupt.h>
> @@ -254,6 +255,11 @@ static void vm_reset(struct virtio_device *vdev)
>  
>  	/* 0 status means a reset. */
>  	writel(0, vm_dev->base + VIRTIO_MMIO_STATUS);
> +
> +	/* Wait for reset completion before flushing callbacks. */
> +	while (vm_get_status(vdev))
> +		fsleep(1000);

this is only required for transport version 3.


> +	synchronize_irq(platform_get_irq(vm_dev->pdev, 0));
>  }
>  
>  
> -- 
> 2.53.0

