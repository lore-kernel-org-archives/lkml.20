Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757610;
	b=J6N9UVy5SumDp5cwPeKR4qLLCJWmNEq5ZFD5guZHYlgt4fiUziUJbC73nJFtC48DkqeE
	 XkaZZft7QGLODVyW+CIWKWAkoDmP3Ex7a1D5REEJ3fLndNiesm7yV8GeAJVY4XBZuAmcl
	 w+ootFel5VXtTA9pAd3yJthnv/VkvAeoIrct5QcXgezk3BboY1fnKPXOpyvlJmfslRZqb
	 cuZpAwCZ7Nyi6r/F+XPhN5SOSfI+nNdkDP07azF2SS5YI5PzC/JVrXsaYNWjAOqL7gX+Y
	 G0EOpWxSZ3h5nUZSpgkm3JY5ezBoBLxlpCF3M41yPBeM6IZFxeTliWC0Gq1D6qXk+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757610;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=143hszKlCW7sBtVDn/0pbEhYSX5YyeOz7B9GvGu+YfE=;
	b=m+nXgm5t5QGlhAJpJqrSpXfJZyhWETYkdD1uMkvN4X1wNORQiPRMwGCgMepay1p3jtmn
	 m8PAz0ouin9aqMJb66+QlmHbE9045JPpuO731HAWicr6OOVbhkrH3ln0eQD0WvExdIDhD
	 PAJBq1KKkYnra/6Ro71kLx8e+DPDJEXyyALQaDrS+ndEPdhdq5p6/ffrSq0OJgugHKAMj
	 9IINumKJAUQDeC2Y7swiGbYm4wcp5jpe5SwF0Xyap/tNBuUCetNzCYwGv90Lvsb9QhSFR
	 01adu7836WpxIPdEinAQocaCDoqaHZXnNYhI2yQnk9N3n8txsvuuzdRCZz2ztoTScTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEhcF8Uy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ea4TIvqx;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198CE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEhcF8Uy;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ea4TIvqx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792757609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=143hszKlCW7sBtVDn/0pbEhYSX5YyeOz7B9GvGu+YfE=;
	b=LEhcF8UyVSSAqz5K+rG/fO4SS0rsCgyHB4R0Q5LwBWcAk5Q+vnY3d/ecfvc15cCcFaW/12
	rYLr/6lMWtc6G6si9jkz2uUr+ep3imVgfOFIC6Dfb/CJKQPzwjaTomIX5uixgwiqHgMQcK
	XXiEJagJGJw48AKIjWGugB+kJqXIv+Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-T2SSRiq8PaaBqRwDa33scA-1; Fri, 23 Oct 2026 08:13:27 -0400
X-MC-Unique: T2SSRiq8PaaBqRwDa33scA-1
X-Mimecast-MFC-AGG-ID: T2SSRiq8PaaBqRwDa33scA_1792757606
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso6252795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792757606; x=1793362406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=143hszKlCW7sBtVDn/0pbEhYSX5YyeOz7B9GvGu+YfE=;
        b=ea4TIvqxgM73jCpx3zkLZBEP4N9/3m9euuQJFBLWpkNDk0mTr6d3PT1CCWuHb4ufaX
         RYWwpZnnQc0TQMG9E0OXuujcPytRxSLqSNw/5vAl+EPcLfXqjKnoHp2Lz1yFUdwxgZIb
         TIq5y57DoiyOAYSzq/aT1Uxea6IJPMCT0bioY95QUJi4LgPHdUIihQ9l6Vzc1qV1Sh4x
         +pW3EFVHiQD2Z6Kv6wDGs6WsBIFPAsoYT9Uj3yGqdj/xCDjHZHrx9mMWksXeiy5rIo1p
         qk4JAjDAuujeL0Q4rkO73bQTqRHG/vrkV6dopaR5ODVfYHgf1mLWY2ZOmS9oAQH5/RRb
         ALag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757606; x=1793362406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=143hszKlCW7sBtVDn/0pbEhYSX5YyeOz7B9GvGu+YfE=;
        b=eByN8OtIn7x0vayO/DbGtEzDiFGfy5zYPm6JPLyKpRdcAtFAFkf7z0gtuHRgPbt6DA
         NIrNQSsMlxcjbnVpO4Fvpa8zKeSwO1hbq8KarQhfbfnRwzLJ4A/dfuwvwd+qIkKtd5GR
         7CK376Ao+npq39/A60s1YQktf9rDes82/tMGareMAsm8eGjkMFL6SFNYZgMGzgCJilwi
         QGM10Ca9XaM67Z07fIM5gc591LnPJrW8rdSWm+1aBcDxsfnQfPz7Z3B/jTn0mHw7mTrQ
         fKgLGE/KXhwUEI3UI6Ds8ROyRkxNoCVhDft64joPGYs/N9/cgBY5CXP8qCKKLCPFfPkY
         Kijw==
X-Forwarded-Encrypted: i=1; AKwUvBwTl0k4H5RF+Q/lm8HoNiqznBdjRjP3c0fgexsodvsWXks8q+3qO+KwoeWIea50MHoU4AYQqgRxF+dOKt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQZ5YnyA3HLXWqEbeW3c5vw2C812WvZJPDrqOzyx1xSkHAozes
	GJR+DYHkCs3ivYjET6lpxttIlb/1fq9iFP0kQOOXczGp4Yx9ov70ZoapV6oZFy5Rdw9Grv8ek+4
	EbBumCofKl7KwJNq1mVutaRbQhwAbXh9a3s575UIGh//B9Kq3hjq8DqHgiHG8CSn9eQ==
X-Gm-Gg: AYBFou17r6KAOdtxhk/d2dBg98bsjD8g1rtOndGULtJRDzftubKzp/2oLlGg8z3Yqi7
	Snt1RPLUoDAZxFctkLHgHgdr0eGodcSqpNlOZs6YIxKEtprYQjdb7ZsPjHV/SdlOjlrWA+GhkmQ
	hWoW+qPfu7XPosg1y2os8HaWzd8UGj3IMN1K6DyY4s4QIVdTXgbR0N50ffE08NT/aaLQQMyjQyN
	L2g5lGp9Ce96Zw6x4Rzj8rtN3gAGRWRg0FN9e+MMYHenU3p19cuffuLDHNaHKFg0EcxrOZ3itdX
	bWTNmpwhSpJimuagMy1TsTbkTmNSoUebKtgTXZXS38WCZQQgKhrft6WaiphCHL+tzlB3rqw=
X-Received: by 2002:a05:600c:1c04:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a211edfd39mr44050755e9.8.1792757605789;
        Fri, 23 Oct 2026 05:13:25 -0700 (PDT)
X-Received: by 2002:a05:600c:1c04:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a211edfd39mr44050245e9.8.1792757605196;
        Fri, 23 Oct 2026 05:13:25 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2958bf25dsm1862675e9.2.2026.10.23.05.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:13:24 -0700 (PDT)
Date: Fri, 23 Oct 2026 08:13:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guikun Yang <yangguikun19@qq.com>
Cc: Jason Wang <jasowang@redhat.com>, Eugenio Perez <eperezma@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost/net: initialize the whole negotiated RX vnet header
Message-ID: <20261023080824-mutt-send-email-mst@kernel.org>
References: <tencent_803981983647D9F9444561A4227F138C600A@qq.com>
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
In-Reply-To: <tencent_803981983647D9F9444561A4227F138C600A@qq.com>

On Fri, Oct 23, 2026 at 07:37:20PM +0800, Guikun Yang wrote:
> When VHOST_NET_F_VIRTIO_NET_HDR is negotiated, handle_rx() builds the
> virtio-net header itself and writes it into the guest buffer.  Since
> commit bbca931fce26 ("vhost/net: enable gso over UDP tunnel support.")
> vhost_net_set_features() raises vhost_hlen to
> sizeof(struct virtio_net_hdr_v1_hash_tunnel) as soon as one of the UDP
> tunnel GSO features is enabled, but handle_rx() still copies only
> sizeof(struct virtio_net_hdr) (10 bytes) and then writes num_buffers at
> offset 10.
> 
> The remaining 12 bytes of the 24 byte header (hash_value_lo,
> hash_value_hi, hash_report, padding, outer_th_offset and
> inner_nh_offset) are therefore never initialized, and the guest sees
> whatever its RX buffer contained before in fields whose layout the
> negotiated feature set defines.
> 
> Reproduced on 7.3.0-rc7 with a userspace vhost-net "guest" that fills its
> RX buffer with 0xaa and negotiates VHOST_NET_F_VIRTIO_NET_HDR,
> VIRTIO_F_VERSION_1 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO: offsets 0..9
> hold the vnet header, num_buffers is at 10..11, the payload correctly
> starts at offset 24, and offsets 12..23 still contain 0xaa.  Without the
> tunnel features the payload starts at offset 12 and nothing is left
> uninitialized.
> 
> Copy the whole vhost_hlen out of a zero initialized header of the
> largest layout, and rewind the iterator so that num_buffers keeps its
> position right after the legacy header.
> 
> Fixes: bbca931fce26 ("vhost/net: enable gso over UDP tunnel support.")
> Signed-off-by: Guikun Yang <yangguikun19@qq.com>


Which backend did you use? Sounds like you did not set
TUN_VNET_TNL_SIZE or did not set TUNSETOFFLOAD?
That's the issue then.


> ---
>  drivers/vhost/net.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -1161,9 +1161,15 @@ static void handle_rx(struct vhost_net *net)
>  		.msg_controllen = 0,
>  		.msg_flags = MSG_DONTWAIT,
>  	};
> -	struct virtio_net_hdr hdr = {
> -		.flags = 0,
> -		.gso_type = VIRTIO_NET_HDR_GSO_NONE
> +	/*
> +	 * The negotiated header is struct virtio_net_hdr when only the legacy
> +	 * layout is used, but struct virtio_net_hdr_v1_hash_tunnel (or the
> +	 * v1/v1_hash layouts) when the corresponding features are enabled:
> +	 * size it for the largest layout and let vhost_hlen select how much
> +	 * of it is sent.
> +	 */
> +	struct virtio_net_hdr_v1_hash_tunnel hdr = {
> +		.hash_hdr.hdr.gso_type = VIRTIO_NET_HDR_GSO_NONE,
>  	};
>  	size_t total_len = 0;
>  	int err, mergeable;
> @@ -1260,17 +1266,26 @@ static void handle_rx(struct vhost_net *net)
>  		}
>  		/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
>  		if (unlikely(vhost_hlen)) {
> -			if (copy_to_iter(&hdr, sizeof(hdr),
> -					 &fixup) != sizeof(hdr)) {
> +			/*
> +			 * vhost_hlen is never larger than the header above.
> +			 * Copy all of it: the fields vhost does not provide
> +			 * (hash and UDP tunnel information) have to be zeroed
> +			 * instead of being left with the previous content of
> +			 * the guest buffer.
> +			 */
> +			if (copy_to_iter(&hdr, vhost_hlen, &fixup) != vhost_hlen) {
>  				vq_err(vq, "Unable to write vnet_hdr "
>  				       "at addr %p\n", vq->iov->iov_base);
>  				goto out;
>  			}
> +			/* num_buffers follows the legacy header */
> +			iov_iter_revert(&fixup,
> +					vhost_hlen - sizeof(struct virtio_net_hdr));
>  		} else {
>  			/* Header came from socket; we'll need to patch
>  			 * ->num_buffers over if VIRTIO_NET_F_MRG_RXBUF
>  			 */
> -			iov_iter_advance(&fixup, sizeof(hdr));
> +			iov_iter_advance(&fixup, sizeof(struct virtio_net_hdr));
>  		}
>  		/* TODO: Should check and handle checksum. */
>  
> --
> 2.39.5

