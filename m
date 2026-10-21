Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598889;
	b=wB2fjyDtlrbZlQXKzBNeS1lytvLXsasYpvH/Qc7VxJ+rfefX/ehlzFzmEIFW4fnXmGaJ
	 VwTTfya8kkZlsA9QZQwYInFArnQEDIVIADaTl/kHhRw3P1eJM0xq6XEboE3j1TMG5KcBn
	 y3RhEawBJEIk+IfgHLYnmSBNpKgItJ1moyblhbwHAfxJ8U42nYI+TVXxyM3iH5WsnZqRU
	 brZVgkfd0U/y3JUJBgCY6lWZSykfRMHCWEICJe2ux1g4mU+58QrhQVClcID1gbTzlCAYg
	 4WTZlNp9TtfRfbnuQzCNYk49iSTQMa7jNs3jrX0Xi9GW5JmN2VdPxN3p3egrdCkq+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X9ryqUAM6f5c+cPgmv1D0weqpdaiSR+OTe2zmh4p9cw=;
	b=HpKnoz9yG6pOPRL1mc297GjTR6aojKbJD6uEYNXSWnsuIfVW0p5W/p6CxEfZJVY09FjN
	 oIirffghJ/nyqpXs9Z/5SwKIwADyGxM29nhxrotZqGJPWTLRXp5qO1B6ldcODQd2x805n
	 x9tDVLSnXXi20aE76Ewi25UgzOpGjOSKnEtogtyKuyS2XVmHf0oYixmMIAB29GfVkObBO
	 f8/WB59HpEzq4pIsqS9OiESyR47LjIJorm1YkDMgnQwZSCIqSrH3NEvpFjgf44zIRKCru
	 5nP4b94Hth6UCkeETSXGlKOGItxOKfeZdl31StCOjAR9l/6KqmRC3mFa/s04pVPEIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJIhAU1Z;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E133606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E133606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJIhAU1Z
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so516283e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598887; x=1793203687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X9ryqUAM6f5c+cPgmv1D0weqpdaiSR+OTe2zmh4p9cw=;
        b=OJIhAU1ZqYNHOVpwM6BBsVN4jI1NcKcfp6xMI5SNPksAG3lTeBhZ0a8HY+akTHrtER
         QvQO60Zz3vFEwWCYQFRk00/6lHb5zSB9241Uxgyw2HuZMRkOXGfVN4lIwChVjbE6bfUr
         LmyoYDkFzSOSvYg8m9FOf/Y/KhvetxKBVaCpAXzaB+QcS0DZB1ePyWuDQbV0UMimhhqc
         AyAbzi/ByZpALIe8OwCYbEiwQJ0Ohdio85WI6lBu70Mu3VQdpUVRN1tMms/7FglxaMpQ
         g+5EkmomJw+HShClIcrzP9OrLotgNuPdSrWOQyUYVnHyqugal/VLOHpyak4LPqMD+45n
         iCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598887; x=1793203687;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9ryqUAM6f5c+cPgmv1D0weqpdaiSR+OTe2zmh4p9cw=;
        b=0o/jZWkYTR+owczx/+RDOKQ0t93g72X+344+P2VFzL5UKewGcQlkJ0+3ObMw08QSTM
         YxM+VtXLae4djrk0ADynUGYvh86OW+4TZ59eOmEds1PZ9LonvGAMe7qkGviGo7Ajv6P+
         2gTCpf6I0JSEi5Lt+EPyXQ11EWz3QJy99uo+wxKGGb8tb+GYVsLBKi/LPtHILRZIaHl5
         /ml1ftbAhWgv2dBfmM5hme9TPzF2jc1snp6qYGOTKCVajKg+Rp4o52yvESls8P4iKwo7
         OiJ0moxua5y2gSTTzDwEPQLWObpGBgUpXpi82e46qfFajh/YBpYyI6Lpqsc7wWpBSdYy
         UlEA==
X-Forwarded-Encrypted: i=1; AKwUvBydLKIbKxqQt9C+VbgecMIzWaGTyWjJyVfZL79vTtfD7kSbo6xfti4L5oAZz+6PNJjRndr3+f7d+jDVwW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCkO0ryzBmA2qhjaH2SkXW5SuLet2d6Kcn0zBt0MVQ5VC7ot74
	D5WotaD/io2VwmoAW7yz7LP9wKiCyDIcxbYSn6SELZTW0plqlniuAgu9
X-Gm-Gg: AYBFou3IzBGpWxaspqL6Ni0S8PvoMLeJ54E2ikdLrPQPv1SSuVZ1H0V4RcAULhS3MdJ
	op4YHEq1PaFkp1LiGlM8Kl+N+cv68aB88ct5M7T5J5eZD/YxRr4jF1YUDh5lRB0vVzM8j4aZdXB
	J0IVUo3/83CgSZNqqJSy6mjKX0dmxHpwrZtlh/105J4WMEq43Al4d5aIV9wAeNsUr26zLpaV8h6
	HCcD+KVfPO+KV5xybea3CCSH3zXWVM5JF8BbjepArOT9JpyegLcRx8Wf/tsnBXEBzifrMoHjLIL
	GZj2ziK3MTv5tpA7Zyp3Tv7SXbaiTqBDjMiPWXmqg/XbzkoCTBF+5LeZYPWeXeYiuBHn7rROwAv
	672SP8BAuBpA+96Rg3Su5CXPPa3maCdEZtsza+6DuggQE3E0t5JZTyFZd4agK8rnhaOCetQ4BGE
	qmhnpVkZPgMZDD8YMMFMAHM0+61xDo3MO5hs6CZ8f9PuioJETKujejYzQGVn3tcor+z4TbX3no/
	3nZh7p+w28S7U8fFUY7AMUqzTW+ngEsHQjscvV3sZe4BDyB/IFeEl+AexAlLCdzbvzLljI0MibK
	3FHKzyLfBDwLtB/AIAGJC9T5W0QjysTB6/QkGVP9obx5fs3qapGLiDniReWaeO8x+o2UP2EG+ht
	pQdyw9ncZTNZSUBbGJbA=
X-Received: by 2002:a05:6122:3483:b0:5e9:fe71:58e4 with SMTP id 71dfb90a1353d-5eaebef969fmr1112707e0c.23.1792598887188;
        Wed, 21 Oct 2026 09:08:07 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9788c68sm3721538e0c.5.2026.10.21.09.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:08:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:08:06 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Simon Horman <horms@kernel.org>, 
 linux-um@lists.infradead.org
Message-ID: <willemdebruijn.kernel.190b5b13a550@gmail.com>
In-Reply-To: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
References: <cover.v4.git.mst@redhat.com>
 <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
Subject: Re: [PATCH net v4 1/7] net: account for ingress-resolved virtio net
 hdr state
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

Michael S. Tsirkin wrote:
> The following patch will add ingress resolution of uncommon virtio net
> hdr checksum metadata (software checksum completion at ingress) which
> adds performance overhead to the packet processing.
> =

> We should make it visible, so a hypothetical workload relying on
> uncommon metadata can be distinguished from none at all. This way issue=
s
> in the parsing will be reported and not quietly pay the host-CPU
> checksum overhead instead of offload.
> =

> Flip every call to virtio_net_hdr_to_skb to test for negative errno
> only.  The um vector raw transport even ignored the return value
> altogether: rejected packets went on into the stack with their
> metadata unvalidated, so check it there as well.
> =

> Have tun, tap and virtio_net count these events per device as
> rx_csum_sw, exposed via ethtool -S.
> =

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/um/drivers/vector_transports.c |  4 ++-
>  drivers/net/ipvlan/ipvtap.c         | 36 +++++++++++++++++++++++++
>  drivers/net/macvtap.c               | 36 +++++++++++++++++++++++++
>  drivers/net/tap.c                   |  8 ++++--
>  drivers/net/tun.c                   | 41 +++++++++++++++++++++++++++--=

>  drivers/net/virtio_net.c            | 15 ++++++++---
>  include/linux/if_tap.h              |  1 +
>  net/packet/af_packet.c              |  4 +--
>  8 files changed, 135 insertions(+), 10 deletions(-)
> =

> diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vect=
or_transports.c
> index e1fb2a76fdff..8b7548458663 100644
> --- a/arch/um/drivers/vector_transports.c
> +++ b/arch/um/drivers/vector_transports.c
> @@ -210,7 +210,9 @@ static int raw_verify_header(
>  		return 1;
>  =

>  	skb_set_network_header(skb, ETH_HLEN);
> -	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian())=
;
> +	if (virtio_net_hdr_to_skb(skb, vheader,
> +			virtio_legacy_is_little_endian()) < 0)
> +		return -1;
>  	return 0;
>  }
>  =

> diff --git a/drivers/net/ipvlan/ipvtap.c b/drivers/net/ipvlan/ipvtap.c
> index 66c949d94261..9e2f1c7073d2 100644
> --- a/drivers/net/ipvlan/ipvtap.c
> +++ b/drivers/net/ipvlan/ipvtap.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <linux/etherdevice.h>
> +#include <linux/ethtool.h>
>  #include "ipvlan.h"
>  #include <linux/if_vlan.h>
>  #include <linux/if_tap.h>
> @@ -74,6 +75,32 @@ static void ipvtap_update_features(struct tap_dev *t=
ap,
>  	netdev_update_features(vlan->dev);
>  }
>  =

> +static int ipvtap_get_sset_count(struct net_device *dev, int sset)
> +{
> +	return sset =3D=3D ETH_SS_STATS ? 1 : -EOPNOTSUPP;
> +}
> +
> +static void ipvtap_get_strings(struct net_device *dev, u32 stringset,
> +			       u8 *data)
> +{
> +	if (stringset =3D=3D ETH_SS_STATS)
> +		ethtool_puts(&data, "rx_csum_sw");
> +}
> +
> +static void ipvtap_get_ethtool_stats(struct net_device *dev,
> +				     struct ethtool_stats *stats,
> +				     u64 *data)
> +{
> +	struct ipvtap_dev *vlantap =3D netdev_priv(dev);
> +
> +	data[0] =3D atomic64_read(&vlantap->tap.rx_csum_sw);
> +}
> +
> +/* checkpatch warns but this can't be const: cloned from ipvlan's
> + * ops at newlink time, with the statistics above added.
> + */
> +static struct ethtool_ops ipvtap_ethtool_ops;
> +
>  static int ipvtap_newlink(struct net_device *dev,
>  			  struct rtnl_newlink_params *params,
>  			  struct netlink_ext_ack *extack)
> @@ -91,6 +118,15 @@ static int ipvtap_newlink(struct net_device *dev,
>  	vlantap->tap.update_features =3D	ipvtap_update_features;
>  	vlantap->tap.count_rx_dropped =3D ipvtap_count_rx_dropped;
>  =

> +	/* ipvlan's ethtool ops are already installed at this point;
> +	 * clone them and add the tap statistics on top.
> +	 */
> +	ipvtap_ethtool_ops =3D *dev->ethtool_ops;
> +	ipvtap_ethtool_ops.get_sset_count =3D ipvtap_get_sset_count;
> +	ipvtap_ethtool_ops.get_strings =3D ipvtap_get_strings;
> +	ipvtap_ethtool_ops.get_ethtool_stats =3D ipvtap_get_ethtool_stats;
> +	dev->ethtool_ops =3D &ipvtap_ethtool_ops;
> +

LLM:

  This cloning pattern in ipvtap_newlink (and identically in macvtap_newl=
ink below) has serious concurrency and hardening issues:
  1. Concurrent Data Race: ipvtap_ethtool_ops is a single static global s=
truct. Although newlink runs under rtnl_lock(), ethtool readers on
  existing devices (e.g. netlink stats_prepare_data() and strset_prepare_=
data()) run under rcu_read_lock() without RTNL. Whenever a new
  ipvtap/macvtap device is created, ipvtap_ethtool_ops =3D *dev->ethtool_=
ops overwrites the global ops table in-place, temporarily clearing
  get_sset_count and get_strings to NULL before re-populating them. Any c=
oncurrent ethtool query on an existing device can observe NULL or
  torn function pointers.
  2. Writable Function Pointer Table: ethtool_ops contains function point=
ers and should reside in .rodata (const) to prevent kernel exploit
  targets.
  3. Hardcoded Set Count: ipvtap_get_sset_count returns 1 unconditionally=
; if the lower device ever adds ethtool stats in the future, they
  are completely masked.

  Instead of dynamically mutating a non-const global ops struct on every =
newlink, either:
  =E2=80=A2 Export the base ops from macvlan/ipvlan so tap can declare a =
const struct ethtool_ops directly, or
  =E2=80=A2 At the very least, initialize it once (e.g. guarded by a chec=
k or at module init) so it is not re-clobbered while readers are active.

Additionally, in general, ipvlan/macvlan/tun/tap changes are preferred
to be individual patches.

I don't think this is as important as the main patches 4 and 5. If you
want to submit quickly, I would drop/postpone these second order
features. Maybe go back to the previous tun-only counter for now, if
you consider that important enough.

>  	err =3D netdev_rx_handler_register(dev, tap_handle_frame, &vlantap->t=
ap);
>  	if (err)
>  		return err;
> diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
> index cc975dfb7380..3288cc6ae6c2 100644
> --- a/drivers/net/macvtap.c
> +++ b/drivers/net/macvtap.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <linux/etherdevice.h>
> +#include <linux/ethtool.h>
>  #include <linux/if_macvlan.h>
>  #include <linux/if_tap.h>
>  #include <linux/if_vlan.h>
> @@ -78,6 +79,32 @@ static void macvtap_update_features(struct tap_dev *=
tap,
>  	netdev_update_features(vlan->dev);
>  }
>  =

> +static int macvtap_get_sset_count(struct net_device *dev, int sset)
> +{
> +	return sset =3D=3D ETH_SS_STATS ? 1 : -EOPNOTSUPP;
> +}
> +
> +static void macvtap_get_strings(struct net_device *dev, u32 stringset,=

> +				u8 *data)
> +{
> +	if (stringset =3D=3D ETH_SS_STATS)
> +		ethtool_puts(&data, "rx_csum_sw");
> +}
> +
> +static void macvtap_get_ethtool_stats(struct net_device *dev,
> +				      struct ethtool_stats *stats,
> +				      u64 *data)
> +{
> +	struct macvtap_dev *vlantap =3D netdev_priv(dev);
> +
> +	data[0] =3D atomic64_read(&vlantap->tap.rx_csum_sw);
> +}
> +
> +/* checkpatch warns but this can't be const: cloned from macvlan's
> + * ops at newlink time, with the statistics above added.
> + */
> +static struct ethtool_ops macvtap_ethtool_ops;
> +
>  static int macvtap_newlink(struct net_device *dev,
>  			   struct rtnl_newlink_params *params,
>  			   struct netlink_ext_ack *extack)
> @@ -99,6 +126,15 @@ static int macvtap_newlink(struct net_device *dev,
>  	vlantap->tap.count_rx_dropped =3D macvtap_count_rx_dropped;
>  	vlantap->tap.update_features  =3D macvtap_update_features;
>  =

> +	/* macvlan's ethtool ops are already installed at this point;
> +	 * clone them and add the tap statistics on top.
> +	 */
> +	macvtap_ethtool_ops =3D *dev->ethtool_ops;
> +	macvtap_ethtool_ops.get_sset_count =3D macvtap_get_sset_count;
> +	macvtap_ethtool_ops.get_strings =3D macvtap_get_strings;
> +	macvtap_ethtool_ops.get_ethtool_stats =3D macvtap_get_ethtool_stats;
> +	dev->ethtool_ops =3D &macvtap_ethtool_ops;
> +
>  	err =3D netdev_rx_handler_register(dev, tap_handle_frame, &vlantap->t=
ap);
>  	if (err)
>  		return err;
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index ff67d99deb39..d7520622e809 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -649,11 +649,13 @@ static ssize_t tap_get_user(struct tap_queue *q, =
void *msg_control,
>  =

>  	if (vnet_hdr_len) {
>  		err =3D tun_vnet_hdr_to_skb(q->flags, skb, &vnet_hdr);
> -		if (err) {
> +		if (err < 0) {
>  			rcu_read_unlock();
>  			drop_reason =3D SKB_DROP_REASON_DEV_HDR;
>  			goto err_kfree;
>  		}
> +		if (err > 0)
> +			atomic64_inc(&tap->rx_csum_sw);
>  	}
>  =

>  	skb_probe_transport_header(skb);
> @@ -1084,10 +1086,12 @@ static int tap_get_user_xdp(struct tap_queue *q=
, struct xdp_buff *xdp)
>  =

>  	if (vnet_hdr_len) {
>  		err =3D tun_vnet_hdr_to_skb(q->flags, skb, gso);
> -		if (err) {
> +		if (err < 0) {
>  			rcu_read_unlock();
>  			goto err_kfree;
>  		}
> +		if (err > 0)
> +			atomic64_inc(&tap->rx_csum_sw);

(repeat) reset err to 0 in all paths.

>  	}
>  =

>  	skb_probe_transport_header(skb);
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index 242899f7fd07..19cb443c89b0 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -210,6 +210,7 @@ struct tun_struct {
>  	u32 flow_count;
>  	u32 rx_batched;
>  	atomic_long_t rx_frame_errors;
> +	atomic64_t rx_csum_sw;
>  	struct bpf_prog __rcu *xdp_prog;
>  	struct tun_prog __rcu *steering_prog;
>  	struct tun_prog __rcu *filter_prog;
> @@ -1935,11 +1936,16 @@ static ssize_t tun_get_user(struct tun_struct *=
tun, struct tun_file *tfile,
>  		break;
>  	}
>  =

> -	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr)) {
> +	err =3D tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr);
> +	if (err < 0) {
>  		atomic_long_inc(&tun->rx_frame_errors);
>  		err =3D -EINVAL;
>  		goto free_skb;
>  	}
> +	if (err > 0) {
> +		atomic64_inc(&tun->rx_csum_sw);
> +		err =3D 0;
> +	}
>  =

>  	if ((tun->flags & TUN_TYPE_MASK) =3D=3D IFF_TAP)
>  		skb->protocol =3D eth_type_trans(skb, tun->dev);
> @@ -2605,12 +2611,15 @@ static int tun_xdp_one(struct tun_struct *tun,
>  	tnl_hdr =3D (struct virtio_net_hdr_v1_hash_tunnel *)gso;
>  	skb->dev =3D tun->dev;
>  	skb_set_network_header(skb, ETH_HLEN);
> -	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, tnl_hdr)) {
> +	ret =3D tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, tnl_hdr);
> +	if (ret < 0) {
>  		atomic_long_inc(&tun->rx_frame_errors);
>  		kfree_skb(skb);
>  		ret =3D -EINVAL;
>  		goto out;
>  	}
> +	if (ret > 0)
> +		atomic64_inc(&tun->rx_csum_sw);
>  =

>  	skb->protocol =3D eth_type_trans(skb, tun->dev);
>  	skb_reset_network_header(skb);
> @@ -3739,7 +3748,35 @@ static void tun_get_channels(struct net_device *=
dev,
>  	channels->max_combined =3D tun->flags & IFF_MULTI_QUEUE ? MAX_TAP_QUE=
UES : 1;
>  }
>  =

> +#define TUN_STATS_LEN	1
> +static const char tun_ethtool_strings[TUN_STATS_LEN][ETH_GSTRING_LEN] =
=3D {
> +	"rx_csum_sw",
> +};
> +
> +static int tun_get_sset_count(struct net_device *dev, int sset)
> +{
> +	return sset =3D=3D ETH_SS_STATS ? TUN_STATS_LEN : -EOPNOTSUPP;
> +}
> +
> +static void tun_get_strings(struct net_device *dev, u32 stringset, u8 =
*data)
> +{
> +	if (stringset =3D=3D ETH_SS_STATS)
> +		memcpy(data, tun_ethtool_strings,
> +		       sizeof(tun_ethtool_strings));
> +}
> +
> +static void tun_get_ethtool_stats(struct net_device *dev,
> +				  struct ethtool_stats *stats, u64 *data)
> +{
> +	struct tun_struct *tun =3D netdev_priv(dev);
> +
> +	data[0] =3D atomic64_read(&tun->rx_csum_sw);
> +}
> +
>  static const struct ethtool_ops tun_ethtool_ops =3D {
> +	.get_sset_count		=3D tun_get_sset_count,
> +	.get_strings		=3D tun_get_strings,
> +	.get_ethtool_stats	=3D tun_get_ethtool_stats,
>  	.supported_coalesce_params =3D ETHTOOL_COALESCE_RX_MAX_FRAMES,
>  	.get_drvinfo	=3D tun_get_drvinfo,
>  	.get_msglevel	=3D tun_get_msglevel,
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index daab43ac92ce..b0441bf8e875 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -125,6 +125,7 @@ struct virtnet_rq_stats {
>  	u64_stats_t packets;
>  	u64_stats_t bytes;
>  	u64_stats_t drops;
> +	u64_stats_t rx_csum_sw;
>  	u64_stats_t xdp_packets;
>  	u64_stats_t xdp_tx;
>  	u64_stats_t xdp_redirects;
> @@ -158,6 +159,7 @@ static const struct virtnet_stat_desc virtnet_sq_st=
ats_desc[] =3D {
>  =

>  static const struct virtnet_stat_desc virtnet_rq_stats_desc[] =3D {
>  	VIRTNET_RQ_STAT("drops",         drops),
> +	VIRTNET_RQ_STAT("rx_csum_sw",    rx_csum_sw),
>  	VIRTNET_RQ_STAT("xdp_packets",   xdp_packets),
>  	VIRTNET_RQ_STAT("xdp_tx",        xdp_tx),
>  	VIRTNET_RQ_STAT("xdp_redirects", xdp_redirects),
> @@ -2502,6 +2504,7 @@ static void virtnet_receive_done(struct virtnet_i=
nfo *vi, struct receive_queue *
>  {
>  	struct virtio_net_common_hdr *hdr;
>  	struct net_device *dev =3D vi->dev;
> +	int ret;
>  =

>  	hdr =3D skb_vnet_common_hdr(skb);
>  	if (dev->features & NETIF_F_RXHASH && vi->has_rss_hash_report)
> @@ -2517,15 +2520,21 @@ static void virtnet_receive_done(struct virtnet=
_info *vi, struct receive_queue *
>  =

>  	skb->dev =3D dev;
>  	skb_set_network_header(skb, ETH_HLEN);
> -	if (virtio_net_hdr_tnl_to_skb(skb, &hdr->tnl_hdr, vi->rx_tnl,
> -				      vi->rx_tnl_csum,
> -				      virtio_is_little_endian(vi->vdev))) {
> +	ret =3D virtio_net_hdr_tnl_to_skb(skb, &hdr->tnl_hdr, vi->rx_tnl,
> +					vi->rx_tnl_csum,
> +					virtio_is_little_endian(vi->vdev));
> +	if (ret < 0) {
>  		net_warn_ratelimited("%s: bad gso: type: %x, size: %u, flags %x tunn=
el %d tnl csum %d\n",
>  				     dev->name, hdr->hdr.gso_type,
>  				     hdr->hdr.gso_size, hdr->hdr.flags,
>  				     vi->rx_tnl, vi->rx_tnl_csum);
>  		goto frame_err;
>  	}
> +	if (ret > 0) {
> +		u64_stats_update_begin(&rq->stats.syncp);
> +		u64_stats_inc(&rq->stats.rx_csum_sw);
> +		u64_stats_update_end(&rq->stats.syncp);
> +	}

  Because rx_csum_sw was added to virtnet_rq_stats_desc[], virtnet_poll()=
 already iterates through virtnet_rq_stats_desc[] and syncs each
  field from the local stack stats into rq->stats at the end of the NAPI =
polling cycle inside a single u64_stats_update_begin/end(&rq-
  >stats.syncp).
  Calling u64_stats_update_begin/end(&rq->stats.syncp) directly per-packe=
t in virtnet_receive_done() bypasses that batching pattern. While SW
  csum is off the fast path, it is inconsistent with how other rq stats a=
re handled.

>  =

>  	skb_record_rx_queue(skb, vq2rxq(rq->vq));
>  	skb->protocol =3D eth_type_trans(skb, dev);
> diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
> index 553552fa635c..4eac24bb1df7 100644
> --- a/include/linux/if_tap.h
> +++ b/include/linux/if_tap.h
> @@ -41,6 +41,7 @@ struct tap_dev {
>  	struct list_head	queue_list;
>  	int			numvtaps;
>  	int			numqueues;
> +	atomic64_t		rx_csum_sw;
>  	netdev_features_t	tap_features;
>  	int			minor;
>  =

> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 52ae3d875e97..e6aec9ecfa99 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -2913,7 +2913,7 @@ static int tpacket_snd(struct packet_sock *po, st=
ruct msghdr *msg)
>  		}
>  =

>  		if (has_vnet_hdr) {
> -			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le())) {
> +			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le()) < 0) {
>  				tp_len =3D -EINVAL;
>  				goto tpacket_error;
>  			}
> @@ -3136,7 +3136,7 @@ static int packet_snd(struct socket *sock, struct=
 msghdr *msg, size_t len)
>  =

>  	if (vnet_hdr_sz) {
>  		err =3D virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le());
> -		if (err)
> +		if (err < 0)
>  			goto out_free;
>  		len +=3D vnet_hdr_sz;
>  	}
> -- =

> MST
> =



