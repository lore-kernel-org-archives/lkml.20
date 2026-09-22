Received: from mail-yx2-f15.google.com (mail-yx2-f15.google.com [74.125.224.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11303364EBF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040799; cv=none; b=HcW6BKiQoyLMv49jmLT3MRfVUr5PsykNKGEeh1jnfoJtbQkK8+0NkSMlgsG0gJ5tu1drhs7KTEwTZceeZ3cg2KYtg3aTkdWWkEQG9I9jqWs+fCFZ8zRCeakI/BAOwSccj/XZsN6z7tRxKzOaSWyeSGFuojy5G9JVSzzrRNk4hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040799; c=relaxed/simple;
	bh=RwQjF5gp74MpRivf4d3S2U9VdDQkXPXaJDMAW5/Hpzw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mKowRwaXq/WXnomNZ7WaodNLu9SaqyglwcpL2DpgZoesEIfBkFwHDuZA20FrOhBhWmnPgymxm+buBgE9WoQsygiQ7n4nReY8/vvoFfo7Rk70YpsVJ+7jPrlibXH91qjWAYXsVJCPILlPFu4dV8CrSd66N8i4a0JGQwfrMmg73TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ttd/2bSd; arc=none smtp.client-ip=74.125.224.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ttd/2bSd"
Received: by mail-yx2-f15.google.com with SMTP id 956f58d0204a3-66e4aae3149so2799225d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040796; x=1790645596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ay4065FSvCY9ZRaYwz1DEwsmCGDvPHvVukTn40zk1F4=;
        b=Ttd/2bSd5NGIxyqMvAwb/7BTPyziMqL//NqakfFXG8bZsB80Rcydmd9yhbQ3KvQeJJ
         Wey/D7Bkdkmw8r3sWHl7+LzMAiAT7setx8n5lMSZEuoXCj6hTeYK/hQskV1nQVsB95ch
         MnKGJ3INOgHEcaH8SdZFPxRXnWZOu9ohk6pSRyYAa/ezCOOIKY3Ji+QtyKg+gmt3TZC0
         BLdS8xqLa9azi0jrvRA6jHe+kzuf0cVInDEZJqpDDzaWBUf9rr/7jk7i1coxu98IA3u2
         Ej7SnbNweNfzU7BPjile9+d5IPdIuMJ1pZHS6pnagLbW+KE2Mufe84/c1rkJgFfIp6v2
         HCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040796; x=1790645596;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ay4065FSvCY9ZRaYwz1DEwsmCGDvPHvVukTn40zk1F4=;
        b=ZycE6mn6BKsgCAl0c69Y6HwGsaFAZ6iRnVsEUkWEdxhWz0NXPnUdPxN3E9e9E3sOux
         /RkG0dDhKv2VqXZXNbl8Xm5eZTmxmWYFiB1Z+jyITdLKOu2HCqmgiyxM0CU2SBPC1aw/
         rQtcpKL+h1VnK41F5isQGy0rsSgIjAC9DYYGh5wxo8UgyoCbPqWrvn44J3JnmrFTZOkI
         e8j87Lyaymuvy1sX+d9oU0pwKOsZHNM/5HwWmiV/scA+HpKT+sFB56diU525R2z1f6AX
         nQV+nQDohhVylC5r86rLoC17W6oIUVuY7/hMfCPws/sgeFyw7YvhxR9U7noIhfLv00/9
         eupQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4/sW4Zs1PWFCzB1rwo0kGjSiH8SF/it5wWmEV72w10+svxkVS3SHVL2Dw0IMFm0qP2Jpark5TQiL2Uzk=@vger.kernel.org
X-Gm-Message-State: AFuF++kwUejlihxR2QedJ+cU6Z+hy3p3Cz2Jw16HT+b6x8dH8HMc3kKf
	KpoZ3UIn440/XzRgdK0ECzY2JoKkdFavGpELudM0Lq9JBo8LLqFU8YqC
X-Gm-Gg: AYBFou26qsG2So4b0y/5ckb9NdOt7+blNdnjbjjRytOJGH/f3oLqmjxfBYFcNpqRtPm
	UVwTxkWlx0Mykssff4UQD0Eaup7InOFVwDb4tNERqdZibBFWI2GKVIgYxUSD5pCO7dFnAPl/p6v
	VIwkytTKGOk5FI1WvOXFS8KyqbIwX6ViOV3QmPRzO0m5TXR22z0dZmtxmoyqlPXB43V28HxLZiw
	SBgCHfoT1mQtJfoqERP/sidZBg3WKRByz6CQf66uSPts/X+8tH2nHCg7g+SvuWaYiCT0MP9MaEO
	IWDgpQmUIB6nx3QB0ZGHPm9xwcHf11MAUHLnoW1PxjIC830IoGb2jggzoovH/xMPwFEdYP4Kx0H
	fh1nnp2G39tTSVxL2fNshm0dn5NPQ1Hy+qAiZ9PCbl8LcQ6Hjgadk/GJqCLqH0yzDCtbNAlQ3o6
	Ws5Z6R32zUnRCWWq84gQIC15CSObaDvfuc33elzR9L0+P7oN4waf+XonxDCeDjNFYrvZUbm2jlN
	+Hv3bwnBpPXgfD3IOSbP1Y/IiCEhm2V8LtQkidbpAUpJNAU2p/4
X-Received: by 2002:a05:690e:1c09:b0:672:b6ce:62cd with SMTP id 956f58d0204a3-672b6ce65d7mr1585414d50.69.1790040795858;
        Mon, 21 Sep 2026 18:33:15 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672c768e6a3sm159526d50.18.2026.09.21.18.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:33:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:33:13 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Jason Wang <jasowangio@gmail.com>
Cc: virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <willemdebruijn.kernel.3b33970b82622@gmail.com>
In-Reply-To: <20260921-v6-7-topic-virtio-net-ptp-v3-1-3350851c4f88@pengutronix.de>
References: <20260921-v6-7-topic-virtio-net-ptp-v3-0-3350851c4f88@pengutronix.de>
 <20260921-v6-7-topic-virtio-net-ptp-v3-1-3350851c4f88@pengutronix.de>
Subject: Re: [PATCH RFC v3 1/2] virtio-net: support receive timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Steffen Trumtrar wrote:
> Add optional hardware rx timestamp offload for virtio-net.
> 
> Introduce virtio feature VIRTIO_NET_F_TSTAMP. If negotiated, the
> virtio-net header is expanded with room for a timestamp.
> 
> To get and set the hwtstamp the functions ndo_hwtstamp_set/get are
> implemented. This allows filtering the packets and only time stamp
> the packets where the filter matches. This way, the timestamping can
> be en/disabled at runtime.
> Currently, timestamping is handled the same for all supported filters and
> therefore handled the same for all received packets.
> 
> XDP packets are not supported and timestamping is skipped for the XDP path.
> 
> Tested:
>   guest: ./timestamping eth0 \
>           SOF_TIMESTAMPING_RAW_HARDWARE \
>           SOF_TIMESTAMPING_RX_HARDWARE
>   host: nc -4 -u 192.168.1.1 319
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> --
>   Changes to v2:
>   - update filter handling
>   - move tstamp into virtio_net_common_hdr
>   - remove new struct virtio_net_hdr_v1_hash_tunnel_ts
>   Changes to v1:
>   - rework series to use flow filters
>   - add new struct virtio_net_hdr_v1_hash_tunnel_ts
>   - original work done by: Willem de Bruijn <willemb@google.com>
> ---
>  drivers/net/virtio_net.c        | 127 +++++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/virtio_net.h |   1 +
>  2 files changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index e34c52d059d39..ef6238cb336b9 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -416,6 +416,12 @@ struct virtnet_info {
>  	u32 rss_hash_types_supported;
>  	u32 rss_hash_types_saved;
>  
> +	/* Device passes time stamps to the driver */
> +	bool has_tstamp;
> +	bool hwts_rx_en;
> +
> +	struct kernel_hwtstamp_config tstamp_config;
> +
>  	/* Has control virtqueue */
>  	bool has_cvq;
>  
> @@ -499,6 +505,8 @@ struct virtio_net_common_hdr {
>  		struct virtio_net_hdr_v1_hash hash_v1_hdr;
>  		struct virtio_net_hdr_v1_hash_tunnel tnl_hdr;
>  	};
> +
> +	__le16 tstamp[4];	/* 64-bit timestamp, 2-byte aligned */
>  };

What is the alignment of the structs in the union and thus the padding
here?

Moving away from introducing a new variant of the struct with every
field is the right approach.

I don't think virtio_net_common_hdr was intended to be extended in
this way. But it might be the simplest approach.
