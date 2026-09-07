Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C9381B1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817578; cv=none; b=E5k05FjGKOZKNXLQ8YOKzHOdF5oO5iYj+OKJVpbnLJYcBZfuww87vOVE8kiu4l77d4l1JkOG50MKZ2rcRHSkh/LTtwgrsCZ4FC8GxDRqLafIcb1ETpDuE/u/nwM/Mak6GD9+dXpLkERV5dGN6ttAJyv57ehRUgjcIBxYJgGtzMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817578; c=relaxed/simple;
	bh=BjK9vT7j+uUDxOu31cZD0dg87r12JRq28IJVMhS7if4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDeu0Y6Uo7DrVYZZpf78SWqPHAvNgvsXY5KDAxtDFiQNJmNP0n/dELOoMwVPrLM2rrSBKh98nAOlCgadYgfRr4Fv0YPaX2bEWd5XONkOjnKAmG/2z/88MTy93mTeOYczXSOnhGN+OEnw4ETg2EzFkD+XB9/75eIElFNA3AuTbv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xmnjynj5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NeBinvfQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xmnjynj5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NeBinvfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788817575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GC0WWsmiiFckjnXpIAV44INGlQO0KgKkCU7zQg2E+YY=;
	b=Xmnjynj5fg/5gXnDjlfIjgjFv4oMylMnmUaxGuSIFNjrrsHmYSJLTuQLdrY6KPW6PdJOLU
	EUnfp/pvRpFqmJC3IXnqo+4AJI6YYtl4TSdjfo3u24olUwWr2iFnsLv96csrKnMR036u1r
	xJ23tXTudbEQGM1GtBmEEBIp/yeHtWQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-e0S3uqjpPgWvhZeTu9KSAQ-1; Mon, 07 Sep 2026 17:46:14 -0400
X-MC-Unique: e0S3uqjpPgWvhZeTu9KSAQ-1
X-Mimecast-MFC-AGG-ID: e0S3uqjpPgWvhZeTu9KSAQ_1788817573
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-499b99a8a10so35310725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788817573; x=1789422373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC0WWsmiiFckjnXpIAV44INGlQO0KgKkCU7zQg2E+YY=;
        b=NeBinvfQFy0qoVXjCAhCzqPc20h7PTe4SpLTH0wZDqd+M4Typ1Xs1o7jKZo/3WxcSl
         vc1WH4pq7LFiNdcf+b8B0V2N4j8vZcvhavlGxmhyWKPAC22YfKukUd3awYNZVz3aaPtP
         /aoWLnhr62znw1D2w9jCF/cOUYnTBxL2Me75H8C/POEIINcp45QMrZN7Dm3oAsVT/WOH
         iDEqPvNLYjYjmOWcLkY5//a/bAPssX+rslxvHf7KjeUVTVY5nQYFg/dEZDPj4F1TcrZi
         DDUrGwtKpgwQCqLHUCh9OYUj/6U3W9aQUPtuVXGJ6W3pMMnrWjiS2gsgQ8Skiru+XyKV
         qi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817573; x=1789422373;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC0WWsmiiFckjnXpIAV44INGlQO0KgKkCU7zQg2E+YY=;
        b=FYzf7rrQ7sDAgpdRih0FyK/LaII29EIXCSyXv4+uTe5dFdM9ss13/LJy9d9pasncDR
         2dYhx+QsorrisF8Wq+6Wg5C1qSYwAVSIGFAR9ycNvIGVI7e/xxKQMYdBZjM9F4efu7Vg
         6A0J1qLAbqcx1iUFJyNOu/9z/Ips3V1kc09pxalwxsc+Z1qYGVyNu/cGfZn7iRRy8XQ8
         7FPX/VHSU0uqwzwwJVRqhFx2r46w5ii3Je+ZMFvFBrL8pLvJvvEncRFCQ3+fZ28A0Jua
         Jgna09HdXaJodXhApOfQJ1CSbvmeeEdBxVPcKAeWH6ow7bThhQ46UGCN4z8bSfCDIWKn
         QZFQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ8FBBXS0Q7az0ktE4Uworg/Vz3jhYi4CVrEhqf4yOw0E2a3oWvEWmMYPdYae6UECSZmNxNP4+SigD5xo=@vger.kernel.org
X-Gm-Message-State: AFuF++kI87aTmNQD9QwJxxahgDVV7lyjU3H/cm5oRbU7VqlG9W1iwp9y
	DhGwZpdBk2xK0QDUELk/TqXMYkB65ggrJxhRpDZQZ+UlZWjleOljUL66FZ5+6iqaQE8DOTVaqzZ
	xu63NTJxWV8pRk7T6put5cZfn9x7kiDObYYgNKBoruLg9f2p7vNAdIg0ln4b4XxIRfg==
X-Gm-Gg: AYBFou0UfqdJ0JAJV7IrPmPlJBWJbzaSUWI06my8OHuCu6qbJALWm75gS3eQBXMMiaB
	bTWIDM0VfwK4KUOCchOH3CgVelbuAWG8hkUzrAJ014z4B/bgaaNXwzZgC+fK5ONPQ+QW0nggitk
	m7Eza3of22EaV2n+fnGe58qDgJh4+mk0ZWt13O9qEdNU9uoRa7pSG8X0CIfsNM1iOV3Rkyiw+YE
	WRTZci8x5XrCPF54+5+fRNq3GsGnNWHBayHPL3hUznekInM+9g0XayuhFljx3IfnrqOEzhrGWSx
	tdklhQxldT494f0fG/fXDtRIb+nuKuUPOsNR9gLiWZhyTHICLFZ0nripIHUebHx5TOdELx3GUKD
	QvJM2gsc6KbH8XPJA2DPpn7s=
X-Received: by 2002:a05:600c:3145:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d1757294bmr35387245e9.9.1788817572586;
        Mon, 07 Sep 2026 14:46:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3145:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d1757294bmr35386945e9.9.1788817572138;
        Mon, 07 Sep 2026 14:46:12 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0af538d0sm194010325e9.8.2026.09.07.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:11 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:46:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev, linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <20260907174559-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905152059.89560-3-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 05:20:58PM +0200, Karl Mehltretter wrote:
> virtinput_remove() unregisters the input device before resetting the
> virtio device. virtinput_recv_events() drops vi->lock around input_event(),
> so clearing vi->ready does not stop a callback that passed the entry check.
> It can still use vi->idev, requeue buffers and kick the queue.
> 
> Reset first, as virtinput_freeze() already does. With the preceding core
> change, reset waits for callbacks before input_unregister_device() can
> free vi->idev. Recheck vi->ready after taking the lock again: keep draining
> completed events so an input packet is not truncated, but stop requeueing
> buffers and kicking the queue.
> 
> With evdev attached, input_unregister_handle() currently waits for an RCU
> grace period, which also waits out IRQ callbacks. This masks the lifetime
> bug on PCI and MMIO, but does not protect sleepable callbacks on other
> transports.
> 
> Fixes: 271c865161c5 ("Add virtio-input driver.")
> Assisted-by: LLM

which llm and which agent?

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/virtio/virtio_input.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
> index deec24e8e682..7b654af0a42c 100644
> --- a/drivers/virtio/virtio_input.c
> +++ b/drivers/virtio/virtio_input.c
> @@ -49,9 +49,12 @@ static void virtinput_recv_events(struct virtqueue *vq)
>  				    le16_to_cpu(event->code),
>  				    le32_to_cpu(event->value));
>  			spin_lock_irqsave(&vi->lock, flags);
> +			if (!vi->ready)
> +				continue;
>  			virtinput_queue_evtbuf(vi, event);
>  		}
> -		virtqueue_kick(vq);
> +		if (vi->ready)
> +			virtqueue_kick(vq);
>  	}
>  	spin_unlock_irqrestore(&vi->lock, flags);
>  }
> @@ -350,8 +353,9 @@ static void virtinput_remove(struct virtio_device *vdev)
>  	vi->ready = false;
>  	spin_unlock_irqrestore(&vi->lock, flags);
>  
> -	input_unregister_device(vi->idev);
> +	/* Callbacks use vi->idev. */
>  	virtio_reset_device(vdev);
> +	input_unregister_device(vi->idev);
>  	while ((buf = virtqueue_detach_unused_buf(vi->sts)) != NULL)
>  		kfree(buf);
>  	vdev->config->del_vqs(vdev);
> -- 
> 2.39.5 (Apple Git-154)

