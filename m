Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545953;
	b=LKTp/w/7vZS4Eox0ltPJ5wS+VyVmw8RPq6XiPXmy3Y++BD/vcuJC5m7KWa2TbWqKmE6M
	 DGaBfJtH+iiBnxij9dRXy6SWgOK1y1HHH3H7UFaBdnUKqWnwbj7XfO06r74ULr1yAwsn4
	 Dh8eIgt+aLllvcADVBjTWiywLk76VwDkQWiJlYSCXR5TWrAy7wOHDIWOCxPVELaZB/ggi
	 I3GIvaAWIHKsjShUitT5yIyMuilP7wKjhNjGePhJ0E1AC6gv6d04sV7kdJD6rv5hNhNBI
	 YZLHjd+58lDLchFGjYA94ZM+KdIoHd0BEGHcqFWCBejYJtj7rUfkymdI5ZYpC5xcNGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=all53W212qfVQZxgrADCjlSx0QnufdCZT2b108/WkDY=;
	b=yiWc8eCl8LBjo4+QoSsxuYJhBYKcmrd8yDNBhZAqojANqsi08RPf+onfJnJo9iZLsFA6
	 Igji2K2Z4m7ZefcjGwVr7ygD6JawIghyO37xf1jwiS9gjiK3EV7Q0qhd3DonJ72PRAVml
	 CYg6xAHlzC0H5+kIdqvJACJ+C44SH3VtZTLeuPYAqPR0oRtrdZul6xk+Ee7hXFPYIOkmf
	 19yGy3gwhjbsfSMVw+xRteXbDxSpaH+2f7Sks4YAUwVTreo7FnedmqTgqJO7/F18TknHB
	 dKoZa3TM3uXVE8+1BSibxrmQPumEyo4gnGix1EdJ1W4tOP4ECL7Ro4OqesvmwUpvpRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c66KTqbR;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C010606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C010606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c66KTqbR
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1203401e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793545951; x=1794150751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=all53W212qfVQZxgrADCjlSx0QnufdCZT2b108/WkDY=;
        b=c66KTqbRspE1LbzUnoODsXMOSNl+w9Gclx4wCkMY+MY9x7ZJYPZ3aOr0JmGnZje5LH
         LlNumCa8xwizIeOxvV31ghNVRoQZ1VDyObHto05hW3nQDlokziU4fv6u2qQMUImUThaJ
         ERA4h8llTxu72O9Bgn2yE3PRwtCawaS07wok0as4cOJesaYTmRKX6bxtMazlzWRtoD+l
         gxz+dtrAQC8ADPmQ56kH9TaJazAMNK6c0V1NnLXnq9c/rf8YFG4V1I+EW8t6iSGVHhUN
         /5GsMi7B+wq1mqHJAXfsTy3ddNvxs/MbQG6Qvg2RUAGb0m/8g3sOW6+zCD2EyBsYZKNP
         htzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793545951; x=1794150751;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=all53W212qfVQZxgrADCjlSx0QnufdCZT2b108/WkDY=;
        b=RUc29JNErPBqNwfuqLX6UqVO94UrZmE0sO04q2lWvKtQCr0NkY6+ueSOKu3UwmcwoO
         zoiXQWwNy6lypqG62cZYkscCdHuIlMmTLaKiwI9j9Bi0lUOrYd9eyZNMQKs8IZWrmX6a
         Zwq4WW1ZiwhannAllYio91EDdGGge5jjGw3ggCja9b/Twtl/zgRrHS+zm3adP6CoAh1x
         vY7yUhzutT+w6vbuCG+RDA3xoIFOYoraF0Vr9ZgD3UmCkbNf3ArPERJKXm8QP37QimZg
         M7XdWwaTe2Hp7UI8iqJL5Pds1/2Uk//dCRCrW7BXHKQNvHQOagX1INHuWKYEUt4qIrsq
         TTkQ==
X-Forwarded-Encrypted: i=1; AKwUvByzmYX0yckFeCmwaW7mmnIEz6fZh5whUp19fe9AtqFoxn9jFQpo0fRrbq8sgn+qC4Rh/c2BfgbOpTi81T4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2x4RSNRa4NXockpaRrEJlZdJhe4THvW0eluCp/KMZ0DG3cmDA
	34jdPrFkJlvxDGIvNxpwhIpWvJMmixP9N6+trn3BQF5vBY0VW6u5576L
X-Gm-Gg: AYBFou2+wW2S5ZbB/4dc6wrIWewIRuKc7XcnkRtjxjIon81+rCVlZtQeR9IPPQXKHde
	lZBpewiBaFEhECRJ57AzHQJrvF6BGgrGghzi3Ay112/1VhkoIRRswtFrSYlIJThLzWzrV8lCpzD
	ym2AZSNNcf4sQe0F2w4h0jxXXpgCezFGRC+RfZus37SKOX0K0YzCeX6Rh6gFaeHyj0ws3mfOoh1
	pVw5EJVclAfn7K8M5afZgvu6YGssXBaLHFFL07OOvsmdoTPJMGgFSNP5SNNt5Ip62CUHyNXqml3
	JrBh2ziZZNDl+zeiypS8Twe1dZ8NflM9Wm4n+kO1InSuTL8Z6yc/zwJrNjeoIjNgKPz7YxhZsCx
	75v28XrpiDFknhf+j8HROKG1yhcv8/aOVaX9Aj2HGDnOVwnOXmtdjAsIEebAzl7GyHoC8VScGE3
	ra8TTfGUsiOA6m6UKggOZe2INLbU1jW+G9lmQWsS4xmdHGODEsbdLJEj77pMrSM0oKjUmmL28Gw
	djISGavvfs2tqetqTEA8kPErTtcN1z6/7gBBFUCE4OzLi23Hdffrz503ndWR26Kp9rl4YNe/OnE
	9YI4AU5J68w6tkRht8nwZ2fUJ7RzC7nNMsmNAAIN5M9IBuSTyNMDMTeyDFqjFi3KvMMsFjyFKH8
	M50KAQwLQGtwlQusZN/cnpfSf69cK+YzDb45AskPqmpCu2B7ZgTVbJ4WHkBnkUiaRZ85W
X-Received: by 2002:a05:6122:c250:b0:5ec:7589:f9e0 with SMTP id 71dfb90a1353d-5ec758a14bbmr1957487e0c.11.1793545951557;
        Sun, 01 Nov 2026 07:12:31 -0800 (PST)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bba011sm8346081e0c.5.2026.11.01.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:12:30 -0800 (PST)
Date: Sun, 01 Nov 2026 10:12:30 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "David S. Miller" <davem@davemloft.net>, 
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
 Eric Dumazet <edumazet@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, 
 kvm@vger.kernel.org
Message-ID: <willemdebruijn.kernel.9c17365c41b3@gmail.com>
In-Reply-To: <20261026-v6-7-topic-virtio-net-ptp-v4-5-008af03cd43b@pengutronix.de>
References: <20261026-v6-7-topic-virtio-net-ptp-v4-0-008af03cd43b@pengutronix.de>
 <20261026-v6-7-topic-virtio-net-ptp-v4-5-008af03cd43b@pengutronix.de>
Subject: Re: [PATCH RFC v4 5/6] virtio-net: add XDP rx timestamp metadata
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steffen Trumtrar wrote:
> For the skb, the timestamp is read from the header before the XDP
> program runs, so XDP_PASS keeps it even if the program changes the
> packet. XDP therefore works with rx timestamping enabled.
> =

> Add xmo_rx_timestamp so XDP programs can read the timestamp with
> bpf_xdp_metadata_rx_timestamp(). It returns -ENODATA if timestamping
> is not enabled or the device did not timestamp the packet. Install the
> metadata ops also if only VIRTIO_NET_F_RX_TSTAMP is negotiated;
> rx_hash returns -ENODATA then.
> =

> Like virtnet_xdp_rx_hash(), the callback finds the header relative to
> xdp->data, so it has to be called before bpf_xdp_adjust_head().
> =

> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Assisted-by: Claude:claude-opus-5-5
> ---
>  drivers/net/virtio_net.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> =

> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 23af10c613b48..e79b65653fad7 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -6848,8 +6848,30 @@ static int virtnet_xdp_rx_hash(const struct xdp_=
md *_ctx, u32 *hash,
>  	return 0;
>  }
>  =

> +static int virtnet_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *ti=
mestamp)
> +{
> +	const struct xdp_buff *xdp =3D (void *)_ctx;
> +	const struct virtio_net_common_hdr *hdr;
> +	struct virtnet_info *vi;
> +	u64 tstamp;
> +
> +	vi =3D netdev_priv(xdp->rxq->dev);
> +	if (!READ_ONCE(vi->hwts_rx_en))
> +		return -ENODATA;
> +
> +	hdr =3D (const struct virtio_net_common_hdr *)(xdp->data - vi->hdr_le=
n);

    Reading `hdr->tstamp` in place from `xdp->data - vi->hdr_len` violate=
s the XDP
    metadata area contract (`Documentation/networking/xdp-rx-metadata.rst=
`: drivers
    must copy device-reserved metadata out of `[data_hard_start, data)` b=
efore
    presenting the frame to XDP) and breaks standard XDP metadata consume=
rs:
    - `hdr->tstamp` sits at `[xdp->data - 8, xdp->data)`. Standard XDP pr=
ograms=E2=80=94such
      as `tools/testing/selftests/bpf/progs/xdp_hw_metadata.c`=E2=80=94ca=
ll
      `bpf_xdp_adjust_meta(ctx, -(int)sizeof(struct xdp_meta))` first, in=
itialize
      fields in `meta` (e.g. `meta->hint_valid =3D 0` at `[xdp->data - 4,=
 xdp->data)`),
      and only then call `bpf_xdp_metadata_rx_timestamp(ctx, &meta->rx_ti=
mestamp)`.
      Initializing `meta` overwrites `hdr->tstamp` (and `hdr->hash_v1_hdr=
`) before
      this kfunc runs.
    - Calling `bpf_xdp_adjust_head()` before reading metadata also shifts=
 `xdp->data`,
      reading arbitrary bytes at `xdp->data - vi->hdr_len`.

    Wrap `struct xdp_buff` in a driver struct on the stack (`container_of=
`, and in
    `struct xdp_buff_xsk`'s `cb` verified with `XSK_CHECK_PRIV_TYPE()` fo=
r AF_XDP,
    matching `gve`/`igc`/`ice`/`mlx5`) and stash `tstamp` (already extrac=
ted in
    `receive_buf()` and `virtnet_receive_xsk_buf()` before XDP runs) and =
the hash
    fields before `bpf_prog_run_xdp()`.
