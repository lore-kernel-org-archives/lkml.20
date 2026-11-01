Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545050;
	b=EO6xLi8xnThDwEdPNkhwyvEBot1kcex7A3o24kJoMNuvTYn7UW5UHUzRH8LQrledNzd0
	 k9onJkCwsCjR/QyZg8TghOYvQd3oK2wJPy3vuNqYrr9ipezh+2cvycnBKcwjJfzW+d0C3
	 Kvlz+5h3/IQ4+sbJ9uwec6eoRSUu9fGTI1rfFqq9J3yxxDCg3Kuhi9LdtaqGxsk2qTskj
	 SZ7lvaV/1B8SYHNL6GWA0+mVpaySWCollzbjKJcPwd4ji/IxOISP+GRk06XFKyL1mAyow
	 VHLWA2Qphtoe04nww1WBf4TH5ouYaXqz9+cuocFWLjKeoqJmzePIsdItHqzo36b8kEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PGMqY+oZ0RvA46OKAo95DoA/lt7CWx4VsMgHlnaoQfk=;
	b=lbOL89yRqFhwXlY3eDuCNdRz2C6LAzDddJU47a3MdewY8Yz7xAenQlLSbQ6Wj3oy0X41
	 xlX1l4tq+mdTjMfS4eRdjnOXGkxyY4ZGL/xi6KfG3eiMoyAjrrWkgMATsT4TsmhalpRv0
	 8I2zHN6FMNVCa7CXvMTj//dJ0uUZMl/Pq0R2ieAkc3pBgUAxkr5fFDQBvJUbNPW83VGm8
	 /b+H3zB8UaXv49krzV3GbLuE4CVWBKAO/DwAkbGJWPxsEimbt3v/YYXwgsh23aDcIaeE+
	 JK0ZKvf/pWiUFiE/hqf7bapmr7xTVnH5d4kM/KCQTyuWZLyktfdTA9rbzC0MZTv9Ncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnrXzXXD;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A353606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A353606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnrXzXXD
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-745497ac8fcso876336137.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793545048; x=1794149848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PGMqY+oZ0RvA46OKAo95DoA/lt7CWx4VsMgHlnaoQfk=;
        b=YnrXzXXDO7AHeU25pOIfi0Q6lPUH72unj6hi5PzCFWFZGiCB388hJtBD4DzkllGc0J
         WjYLOaesnpl2Ohx2FSGQZ7elGKhBPrhrMVAFC0sbmKfpxK2SBy0nYgvnF+rduLVKFnx8
         HTTNgv3IVA3IBj3uVKN+W6/NnvNeDYQTzm0P/2p+qvHzppQ3RhVoZOFRu/NGE2/RKSLz
         yl/ECevi5DevNrtT9nJzjLqRv8mVzjwhfJ3+lB73hYrq3W8PuFf3375FHd7pjS/wsQ1S
         hqa4GbMgsJczYccs1pMnSzN2k8J31zSr2av627d2jfhIEAdGJ2dKq1AnkS0RDkJIVjJI
         JNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793545048; x=1794149848;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGMqY+oZ0RvA46OKAo95DoA/lt7CWx4VsMgHlnaoQfk=;
        b=sfDb6kYIUIySZh8yuH3Pr4pX0HxJyE/GBvoazorhPoQCK5nlGanwFurz3jxQhyjV0d
         jJbTH+nvcU2BHfUok2qjgNxv0tXLTUc+53gQo5bhQArGMQOXe502mpOt/DN8gdgtY8m/
         DB01X3RTlulBcqNXHZA7aR2gfcsQqm/Aw2q5ueHqMGwEpL7scolhHvubpkY2yzPvzhyA
         JMa8gDVvgvw5H+Tm78SZj5STdeB7MFH99BHm/Ga2fKM5bkrUGr6moZBQkP/umccm9HsK
         ACUOkK3VIKrYWZ7JYCe8c6i2ZPVa/uDWOkTiWBMo0+8QdI1HowSpTj7g1c1VTnu4zGGm
         7Djw==
X-Forwarded-Encrypted: i=1; AKwUvBw1ePlX3Lbbewk43caiVP90n9cReuZyykNlz7Rx90D2Gd9tZYRSMD5n5CI2ePcnWnkGXGmAdTPLlzWuOG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkVvofZwZT5FKB4XUQAkv8MUPFDfo8IJE767k3Qp9WIX3dmAis
	K96rn1oehf5CVmYlwPIV1fv4s+hW0/hLpQ6oecixx+wEm0k8pCNj/RizZKQXig==
X-Gm-Gg: AYBFou3zb0BCJKSKaJZ5RQgRlgLfpOEJ27Hv8Qn+kQi82Hti5ews1rjBBeL16GvQnra
	8z4Xn7FtfcmBvT8VSnwsA97XMX3EOcg1/fadMId8yix9ZOdbpC+wvHO8yxxxZ5ipIgcuzNoXtpF
	GeIbFni/ltrwasGVVFr/X4CufX9hj7iErEk++SeYABktV66Y2yRJ41rSLjDouaELfyvxjtD1/Oz
	O8zpZO8tnWySf1ZUd5O5YdOCu8/2fjvOu5h0L3W5GGiGcDppvoCsZRzHesByoDpGO9TubeqsEp6
	xEy4bfEjSYnrWvI+Jxdcqauonah47kag4aBWDaoICmPB31i6qEVIA4rkqvhjeiYV3eBGoZq7C8c
	8O8e2FEToF9BBIwTGN2M58RTfV5cBD8ga5WWATyxF3wwXl1XjMw3bpXg6nXr+bitCGkkm87VEmz
	Gee/+nIuo1Bq8o01UJ0sD1Hk9W8w6fz0oIfzHl7AAFukmI7sgtMXOA+6qaUJ7Uw0dFsKDfOdel9
	0SEpwdKKAT0Z5qUbkhMgk+OUDCVc7E/uJAAEoJDsbbXLj+O28d7woAKff8xC6T/zTDPl0NwfKWc
	hbHgI/Gytr8ZPzkn7t3g11ZPYi5wUeYmvYNRwO4Ij1Ugz9aj9vVfSe94bjEnBTRNgfDuTTZPNGj
	wlFo4CqY4o5uL1M1/SelMYr/kSDq2lTz1beZwLGEUKeps4LtehyfIXjfGtXZccsQ2pGn1
X-Received: by 2002:a05:6102:5709:b0:7c1:f530:2d8e with SMTP id ada2fe7eead31-7d072d33bbemr3289437137.35.1793545047921;
        Sun, 01 Nov 2026 06:57:27 -0800 (PST)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992edfb5511sm9722277241.0.2026.11.01.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:57:27 -0800 (PST)
Date: Sun, 01 Nov 2026 09:57:26 -0500
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
Message-ID: <willemdebruijn.kernel.1d6388f036c46@gmail.com>
In-Reply-To: <20261026-v6-7-topic-virtio-net-ptp-v4-0-008af03cd43b@pengutronix.de>
References: <20261026-v6-7-topic-virtio-net-ptp-v4-0-008af03cd43b@pengutronix.de>
Subject: Re: [PATCH RFC v4 0/6] virtio-net: add receive timestamp support
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
> This series picks up Willem de Bruijn's work on a virtio-net receive
> timestamp. The device puts the time of arrival (TAI, ns) into the
> virtio-net header so the guest can use it for PTP and RTT estimation
> without taking the timestamp itself after the host-to-guest latency.
> =

> The series is an RFC. I am mostly interested in feedback on the
> approach and on the wire format:

At a high level +1 from me.

Some comments inline.
> =

>  - The timestamp is a new field at the end of virtio_net_common_hdr
>    after outer_nh_offset and ipsec, offset 32 (see virtio spec),
>    negotiated with VIRTIO_NET_F_RX_TSTAMP (bit 49). Header size now 40
>    bytes.
>    Willem noted on v3 that virtio_net_common_hdr was not meant to be
>    extended this way; I kept it as the simplest approach, but a
>    separate struct for the timestamp header is an option.
>  - Timestamping is enabled at runtime with SIOCSHWTSTAMP; all
>    supported rx filters behave the same for now.
>  - XDP programs can read the timestamp with
>    bpf_xdp_metadata_rx_timestamp().
>  - vhost-net passes the feature through; the timestamp itself is
>    written by tun. The tun patch is only meant as a reference
>    implementation for the device side.
>  - The timestamp is in TAI.

Is this a requirement? It is common for PHCs to be synced to TAI,
but not 100% the case. Does virtio need to specify this.

>    The driver reports it as
>    SOF_TIMESTAMPING_RAW_HARDWARE without a PTP clock (phc_index -1),
>    so userspace cannot tell which clock it refers to and may compare
>    it against CLOCK_REALTIME (currently off by 37s). Options I see:
>    convert to the guest's system time in the driver (correct only if
>    host and guest agree on the TAI offset), expose a PHC so the
>    time base is explicit, or keep the raw TAI value and leave the
>    conversion to userspace. Which one is preferred?
>  - Like the existing rx_hash, the XDP timestamp callback locates the
>    header relative to xdp->data, so it must be called before
>    bpf_xdp_adjust_head().
> =

> A virtio spec change is needed as well and not yet proposed.
> =

> Testing: the feature needs a QEMU that knows VIRTIO_NET_F_RX_TSTAMP and=

> sets the matching vnet header size; see
> https://github.com/strumtrar/qemu/tree/v11.0.1/virtio-rx-stamps
> =

> Performance: I measured the receive rate with 64 byte UDP packets in
> a nested QEMU/KVM setup with vhost-net. The variance between runs is
> larger than any difference between the variants (without the series,
> series without the feature, feature negotiated, feature enabled), so
> I cannot show a measurable cost or the absence of one. Numbers from
> bare metal will follow with a non-RFC version.

This does not seem performance sensitive to me. And it is opt-in.
IMHO no need for extensive testing for performance regressions.


> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes in v4:
> - zero the header beyond the known fields on tx and in vhost
> - grow padded_vnet_hdr for the 40 byte header (big packets)
> - install xdp_metadata_ops if only RX_TSTAMP is negotiated
> - rename VIRTIO_NET_F_TSTAMP to VIRTIO_NET_F_RX_TSTAMP
> - move tstamp to offset 32 (header size 40) to match virtio spec layout=

> - drop XDP restriction for SIOCSHWTSTAMP, add xmo_rx_timestamp
> - add static_asserts for header sizes
> - add support in vhost
> - move virtio_net_common_hdr to virtio_net.h
> - Link to v3: https://patch.msgid.link/20260921-v6-7-topic-virtio-net-p=
tp-v3-0-3350851c4f88@pengutronix.de
> Changes in v3:
> - rework to use virtio_net_common_hdr instead of adding new struct
> Changes in v2:
> - rework patches to use flow filter instead of feature flag
> - Link to v1: https://lore.kernel.org/r/20231218-v6-7-topic-virtio-net-=
ptp-v1-0-cac92b2d8532@pengutronix.de
> =

> To: Michael S. Tsirkin <mst@redhat.com>
> To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> To: David S. Miller <davem@davemloft.net>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Richard Cochran <richardcochran@gmail.com>
> To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: Eugenio P=C3=A9rez <eperezma@redhat.com>
> To: Jason Wang <jasowangio@gmail.com>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Jesper Dangaard Brouer <hawk@kernel.org>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Stanislav Fomichev <sdf@fomichev.me>
> To: Eric Dumazet <edumazet@kernel.org>
> Cc: virtualization@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: bpf@vger.kernel.org
> Cc: kvm@vger.kernel.org
> =

> ---
> Steffen Trumtrar (6):
>       virtio-net: move virtio_net_common_hdr to virtio_net.h
>       virtio-net: support receive timestamp
>       virtio-net: assert header sizes
>       vhost-net: support VIRTIO_NET_F_RX_TSTAMP
>       virtio-net: add XDP rx timestamp metadata
>       tun: add rx timestamp to the vnet header
> =

>  drivers/net/tun.c               |  14 ++--
>  drivers/net/tun_vnet.h          |  18 +++--
>  drivers/net/virtio_net.c        | 171 ++++++++++++++++++++++++++++++++=
++------
>  drivers/vhost/net.c             |  17 +++-
>  include/linux/virtio_net.h      |  30 +++++++
>  include/uapi/linux/virtio_net.h |   1 +
>  6 files changed, 214 insertions(+), 37 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20231218-v6-7-topic-virtio-net-ptp-3df023bc4f4d
> =

> Best regards,
> --  =

> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> =



