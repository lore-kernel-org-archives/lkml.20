Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CF49483B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436561; cv=none; b=J/xhxJSRghL6Xqaldo/+0w5VnS8KSdQyN02pgxovEyMi6pXtYWE+qnHa3liiMHHKAPAT65pDphV1YjsmDGwfz7bPYqSSJuL4lm6MQUdd9EvPuxkAy0mGgww0APxWsmqLGMAnIRF/w9iwDZ1ByCEej4NGn+E3JVlX3zQsN9oKrTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436561; c=relaxed/simple;
	bh=CdAz7fh+1ltkQ4tM2hXdLcQnn+Tcf3gIIBOSSClnYDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG5D743tJMfw2llIZp7T2nJ7PgIcXIa0BeaLI7wPm2KxjLtRkV+ae+bTtE+OygKg7CK2HWNEBCcFvsUzYWNuQjZRSOhetOJyabf6G6EESc5sMWcDGolOoYrmzZqVgVD7/xGzo5+jTUxFCUPImlr3nrLPjNtyYtnwqOIivV6KMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijVnPGEw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGWmApPG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijVnPGEw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGWmApPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788436556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bcb5WjUE5AVdlBj8rvAyCS6YYznNN90xNsiTu4NwOR4=;
	b=ijVnPGEwlSmRtVsbvOB384r7m7pT5g78WGkFX8KeOv//UsyWhzPtqYWjR87MhKsNPCfi+Y
	cs1Z55jploTlOJdy7idsrXqIC3pW9KRCmpkwy0g8L8LcjkR7uKgQ6uNPUJgaDmFpvTPlba
	V4ivs5kuEZ6s8YokG2WVFcatwKwkk6s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-S8ztlZi3Oju9KhicSZ2qAA-1; Thu, 03 Sep 2026 07:55:55 -0400
X-MC-Unique: S8ztlZi3Oju9KhicSZ2qAA-1
X-Mimecast-MFC-AGG-ID: S8ztlZi3Oju9KhicSZ2qAA_1788436554
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so1491873f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788436554; x=1789041354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bcb5WjUE5AVdlBj8rvAyCS6YYznNN90xNsiTu4NwOR4=;
        b=UGWmApPGVbza/KKKxURnGQvARKhI+9JCImUbINxSP43fOA3XsqNvRJttC05Neq5wNn
         uyXuB/khwUdN5kHxTq49uu9CfI7yYyXK0ouXaVyVdi8revtO9v3Jp3oAVXCbaCDp2rHf
         aJfGuVaFdHQHzIY+TUsK+xGOchx8LzL7vzsKNjsDySST3TDp0wwBe6uSlfJ342NMLFqa
         +trl+vEwcYHPImIwklidM23/e+FWgz18bEhbbo7l5wB3RY9kqWsNTIGxKOsAJ4gde08l
         1/DMaWZN/kFjq+8OoyODT769gWolSbC7gWgNk9RewB9NuGiXUn8Bs20VYJWTfJvHae7o
         IyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436554; x=1789041354;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bcb5WjUE5AVdlBj8rvAyCS6YYznNN90xNsiTu4NwOR4=;
        b=edF92TKzNy+RFSVKh2Bi0Swt3jbX63CJ1m06/BKTu5sT6a0BWm41K8uMx23g/EH3wv
         hvaYsYlAZrG5NKXm89+ywgvAOYdQ1JTBVzKte1Bu9PnC1s93K4aHVjy/ILV5+6akQfJT
         q4iLzce1aTk7v8HUEwT6usntkvqMaiDSo/Os3xUvObI8GLVBd0TFl+wHp4Rh+J8dzlIx
         vDlKr6XmdvjDRDZ3wzDyKu1tjxxWE3HdrUHMnok1Qz1w6JZ5AhDmfNRPZmEnc/Ef4hwn
         h9BrdROoA2liUKqDZaiXpkQHtNwrTmoUNitsce5VruifOgxCY0tf2azBNosy4joWNxBw
         2RWA==
X-Forwarded-Encrypted: i=1; AKwUvBzYylnDoluAHgGSFz0Y3DVImvIyvzErMfzZy4mmgrxLfjNUy4cMtBQOyplDswxyYYyKVs88g/ZMWPJR00Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpzXK2czZtAg0W89T89T5ZcP9BvNNrqwNWoYxX8+lHi0P0hjc
	pIWqL5WLenMQkV9g58yqwiGFpgT03R0VkYn80A3e+Ndjh9gPyF8EpddF4gFtzn7ZokVTaWjJRRX
	jBlnVykKzlTxDdXB3/YiqoEYvYFQaRSH/DPTivxXB9AjwcplOZjAygyR0RNpvSyc3Cw==
X-Gm-Gg: AYBFou0U89o1AtZbp2JM/wFZe7INAAgX+rkPOFSxcOEfVp8oSq7ArZE/n6fBtjcyUTf
	cXCR7YhHnjunypG76GwpHCSVgklyiBtPNJpk+NcCIs8ObN4Kv6JbOxWr+ZJg05IwUoC+s29aYDS
	jVPiAgxS8S2fylvsbO/gDNVlijVOfGSbc+/Qa4LpoghyxWQW7bvx1JMzlUVqCQU69PKgHKz66ya
	wkiDa5nMbW6NsRxokwbWW4io0hAoSw7EjPORAAe7+12dY2L6r7OqCcLw5JNH8E+PxjZ7zdxkCmn
	DPPoVvNDbE9tHbRkv324kJjGfLbPO0cK/VumUg8LAQorV3PWTIC43GKoImoBdxzXJzjszSq4RXc
	lxkCWzuLZC6JKhPmQiNwIGNQ=
X-Received: by 2002:a05:6000:2086:b0:47f:96e3:530e with SMTP id ffacd0b85a97d-48488efd18fmr19364415f8f.8.1788436553765;
        Thu, 03 Sep 2026 04:55:53 -0700 (PDT)
X-Received: by 2002:a05:6000:2086:b0:47f:96e3:530e with SMTP id ffacd0b85a97d-48488efd18fmr19364312f8f.8.1788436553272;
        Thu, 03 Sep 2026 04:55:53 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm12369287f8f.19.2026.09.03.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:55:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:55:49 -0400
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
Message-ID: <20260903075143-mutt-send-email-mst@kernel.org>
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


I htink we should  instead drop 

vp_synchronize_vectors

from vp_reset

and instead call virtio_synchronize_cbs from virtio_reset_device.



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


only needed for v3 and up

> +	synchronize_irq(platform_get_irq(vm_dev->pdev, 0));


>  }
>  
>  
> -- 
> 2.53.0

