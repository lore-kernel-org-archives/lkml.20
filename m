Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331592;
	b=ubHE4ftQqPZQRdOTkEsE+1Hadx7ffHZ3+7EpO7U+yOWEz3Mik7rgGkj7HEeGstzpeftA
	 zl3LD+jsb5bChPIatEletgC2onhvMgxShZEV/30YQa1U+ylnUCHxMPoqnLDhpAOMWkiNO
	 widYQfFG5X4qoy1Ed7c65WTpdUKFljl4VE38mPkrJZsJ3HZa9h0E/CpPSu1gZAMSV477n
	 T61sqDBIlAe9jt+v3qICd4eQ3LHQcvOs5776fjop7TcBLRmBGo0+RDWn/Xvix7FJQNbbg
	 i7LVBdkJVAy8rz1gr7L1QJQauFR6t9QPLOQvRAJSX4NeIzwitbzYm77dsQkPzpkzEBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331592;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EKRRknjMWCPzWVN1v0/d1lk7IVipZL2/q4GtTn0t/go=;
	b=Z1EiHZXjI1zPPmbJNXk32WGmprYHs2IOF1G0iSgYCXteJt/5LDprsZJsIrACl81m9cK8
	 X3cobR+gnndxfmq+HK77pUy2LdCmMN+4jk8ZLOerv5yRrkFLJDa1yGoGpzfjRBrM803iG
	 Pev2J6+qH9amDBl+i1fgXW8GMQRAmKtBxz/0y8rNSZmpDX0+qn6dVzv90WJmR0KADpF+C
	 x4W1BGaOeR0nOBGnRc8jJ2/tPDwTGJIvaEklD6tAv91moN13v6Rv2M1SYRcQTmuwfkv23
	 CXoroC4O6woTycuiGEjgK/04jGV3FhjodEq6ZdobVxYt++38sQz3OojpziLdjq4/oqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJO32m9s;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BrrYG0IX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC3606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJO32m9s;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BrrYG0IX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794331590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKRRknjMWCPzWVN1v0/d1lk7IVipZL2/q4GtTn0t/go=;
	b=ZJO32m9shSa4D7xCMK2ftnQDPTQklvKeswkYBHGBvhY2LYY/aBnhSWrepIe0hJv3EzdLsl
	taBWj0PD6VRRpEZquFY14GsvrgNdl4OZJn8F2+g7rQo89tUw9WtDgf1aRlQuqbtJUK1fdk
	v6VtOIMaeAbrA9JXpCylSIhnkG6Dsr4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-E1V0kmFUNLGmH0r6mcTazw-1; Tue, 10 Nov 2026 12:26:29 -0500
X-MC-Unique: E1V0kmFUNLGmH0r6mcTazw-1
X-Mimecast-MFC-AGG-ID: E1V0kmFUNLGmH0r6mcTazw_1794331588
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so2192076f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794331588; x=1794936388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKRRknjMWCPzWVN1v0/d1lk7IVipZL2/q4GtTn0t/go=;
        b=BrrYG0IX5xDbN5YVeeura7PJUFtwGNuDHcT/BZSvplvewOipt/IF9fNbhJmnZ+I12X
         S8HIQIyrE+S0L0SlW16G1/gd7olybX+vExvOKt375BnlG1383c74cfcnd2EEqEe7YUf/
         aLPJw73z5FLvQuQxkWPQpb728MJjhpcAEcSklE0KJjtUj3/4MwfDJKXbRzN76TKcztRs
         VxF1YkkVAb7nE0W3lPyBlfLARR23UwnARpRAdNODK9knuApTi11IeU+EK0XZq7gkMdXg
         vmGfkF9wTG/UL/TBNJZOLq02I1kgmUIg8rWUMXTTPAheKPMrucr3MV2s8Gy9QiaZVKAX
         4S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331588; x=1794936388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKRRknjMWCPzWVN1v0/d1lk7IVipZL2/q4GtTn0t/go=;
        b=NgCqtWO6zm2tLTytx8sPMycZecDQbQJlv5ZtdlBiuJZV6XAkftmaqnL3n/3cYTyawh
         8JfkKSqW4tLdleeFSjnA8ylfAazzoswNmDob7mhThFAAPKPmGjL2aYk2FtIwAMqTFAfj
         3R/ahuCdVsoC518K9fhgSNXE3MnqT2wrwKqNdOlGtzLpFzSvcLAaB5scjfxaAgLiKbSJ
         T3gWX8dsusbztP7CaTlvQB9/g0JGLXJcffVWiitiG775pZkiFY/KKtRDBljzA060uaO/
         4MGAgm5PwKNUv+IHwMn2XMHRktQrr934RphTg6FHude67GDI0TikXYvh0xLj65eu7/EN
         6ZEw==
X-Forwarded-Encrypted: i=1; AL+hErFgOS7gLHUPRqe4oFEmt69hhA/BuZyUU3oRfhxn4xaLlJL9ygHm3xHYpbgnkdOEuACoF0gbmPad+5X1HAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z85iIzZzlQ8lkOles6JlOxuf4xkhggDCFVnLVPNhig6F8tCuLZj
	kFvHyiSH03NpT4FjZPy+wD5vYw96azqyg5y4Nre/0QqrKUgJhtM17koyfrZFMyJ+CdQ5u8jKfu2
	sE9jLsVBHwMCOAPZBvo3rL+BEp2eV6FHWJu32yHEMSDIhtYpq6bSBfE9PyEGBKZmHbg==
X-Gm-Gg: AYBFou2BW53JtQFX1XI7XC65Ub1Yt4Za3v/rwGS/Uhi47U1zSARgsLWnXHv/wmNK35w
	AZJ0wDGFrSiWXOFvDfyQb7T6SbK/Eu6mjcCxdIHjkzhm1TW0CrZAMhLNdqHo7ezengbWpDON/s4
	z+4r5YIWgMsAKn0+CrJNfJ1DqCgXlewAZ5CMMR5affrgBzz02wE6+3+glh32poS6KD+9AVsK8bf
	3ti3tdz7zLX8qpn+KIUovAP5CHdl59GrwJyisWNI75uh/QfF+rof4ecv+UVpnCpJZnnzw2ThJOv
	n+wFhUFnvgmWCw01apS6Iv5i+aJ/tCB+nEjSg+bwBjPtLHj1vig+4kChfVR7jNmbQBzsg/iy1ws
	yWpOciKDmdaW3iYiBY4O603lIHGxkrASbnIAPw5T0xw==
X-Received: by 2002:a5d:5f86:0:b0:491:f34b:49b4 with SMTP id ffacd0b85a97d-498309aeeb5mr6440918f8f.44.1794331588093;
        Tue, 10 Nov 2026 09:26:28 -0800 (PST)
X-Received: by 2002:a5d:5f86:0:b0:491:f34b:49b4 with SMTP id ffacd0b85a97d-498309aeeb5mr6440867f8f.44.1794331587415;
        Tue, 10 Nov 2026 09:26:27 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm6152831f8f.44.2026.11.10.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:26:26 -0800 (PST)
Date: Tue, 10 Nov 2026 12:26:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: forfortuna@naver.com
Cc: Harald Mommer <harald.mommer@oss.qualcomm.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Mikhail Golubev-Ciuchea <mikhail.golubev-ciuchea@oss.qualcomm.com>,
	Francesco Valla <francesco@valla.it>,
	virtualization@lists.linux.dev, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>
Subject: Re: [PATCH] can: virtio: fix virtqueue use before DRIVER_OK
Message-ID: <20261110122457-mutt-send-email-mst@kernel.org>
References: <20261111-virtio-can-ready-v1-1-0b4dd020af0b@naver.com>
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
In-Reply-To: <20261111-virtio-can-ready-v1-1-0b4dd020af0b@naver.com>

On Wed, Nov 11, 2026 at 02:11:13AM +0900, Seonghyeon Lim via B4 Relay wrote:
> From: Seonghyeon Lim <forfortuna@naver.com>
> 
> virtio_can_probe() and virtio_can_restore() fill the RX virtqueue and
> kick it before the device is set DRIVER_OK. The virtio specification
> does not allow the driver to notify the device before DRIVER_OK.
> 
> In restore, if the interface was up, virtio_can_open() then sends a
> START control message and waits for the reply. DRIVER_OK is only set
> by the virtio core after restore returns, so the device may never
> handle the request and the wait never completes, which hangs system
> resume. In probe, an ndo_open() right after register_candev() can
> likewise send the START message before DRIVER_OK.
> 
> Call virtio_device_ready() before the first virtqueue use in both
> probe and restore, as virtio-net does.
> 
> Fixes: 083082a4e6d8 ("can: virtio: Add virtio CAN driver")
> Signed-off-by: Seonghyeon Lim <forfortuna@naver.com>

however, device ready means you can get callbacks: config
and vq.


did you audit the driver to make sure this is safe while
probe did not yet populate and register the device?

> ---

> Tested with QEMU 8.2 + vhost-device-can: with the CAN interface up,
> suspend/resume (pm_test=devices) hangs without this patch and
> completes with it. No new lockdep warnings.
> ---
>  drivers/net/can/virtio_can.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/can/virtio_can.c b/drivers/net/can/virtio_can.c
> index f67d0bf09681..ae35a00b784b 100644
> --- a/drivers/net/can/virtio_can.c
> +++ b/drivers/net/can/virtio_can.c
> @@ -912,6 +912,9 @@ static int virtio_can_probe(struct virtio_device *vdev)
>  		err = -ENOMEM;
>  		goto on_failure;
>  	}
> +
> +	virtio_device_ready(vdev);
> +
>  	virtio_can_populate_rx_vq(vdev);
>  
>  	err = register_virtio_can_dev(dev);
> @@ -966,6 +969,9 @@ static int __maybe_unused virtio_can_restore(struct virtio_device *vdev)
>  		virtio_can_del_vq(vdev);
>  		return -ENOMEM;
>  	}
> +
> +	virtio_device_ready(vdev);
> +
>  	virtio_can_populate_rx_vq(vdev);
>  
>  	if (netif_running(ndev)) {
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261111-virtio-can-ready-85cefff06a84
> 
> Best regards,
> --  
> Seonghyeon Lim <forfortuna@naver.com>
> 

