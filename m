Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300004;
	b=AqtgkQZKbJyhEBO7GrKxuNiIjLATx99wSnxa7spZ9bbN3OBzzFlwXMqOWxA49wDGc9P4
	 U9AiQL/PrDk/PLTbgHLe9or4CxWdISFSeBAiTDAqr4gsg1GwolCns/ZKoujZqr82IQrxL
	 gN3+0HVwowbdQLgzZSIhAB/3Fx2XF/buSPgirFVvC+HPllMRW1+10OrOiC6nc0lWVKrHb
	 FeOXeDSe6foF+7ksgpuLiOhJm9M89M5pypsEI9N8ViM6XY3X43tTTMYOKpK7Vg/WryspB
	 wjpOPilk/rV5UX77w0HkS5Iasuh3MVoyQ21aABNt2/COaFS52dkz41sNLVutk9ei1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300004;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=Kl5aqa/5huOMBjE/HMjqhWjp8eowVgL7maZxpKhEQks=;
	b=f9PVLo85/iyJy9iP8/6zUugfIdeUU+PI/93vBf6mUmsJuNxLpDuc9xpNbqrpX8xxJnfD
	 JF65ZpaJfMK8wgGvHaqJx303zs1YZqNghgV84lZvPkR5ik/c24DncKwq1FccLaolos5dr
	 sPWrvVaNt9KdZMPFb08b7b8mf5kp4z3AnxbZImPkqoJNprA82YiXHQ4Ad75faphi5OEQH
	 R3dj9VJsRbiOJCyFBLZiph7ou+dK+w9PweE3t54WD14jYY3oExdIVQAKUmjzIkifZ+vOp
	 5KM4plx8LtaC6gdlG/60EO/OBj3tI97wT5WlPgABz/A65OyT1Wis1K6E4E6F9Env2ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVtuQAMi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QkvjLFKA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98B606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC98B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVtuQAMi;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QkvjLFKA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793300002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl5aqa/5huOMBjE/HMjqhWjp8eowVgL7maZxpKhEQks=;
	b=VVtuQAMiAv65Fe3XELvJjdXkKosmJPa0vP1v1zvwe39B3SDIUo9cHK8YV3+qNJgWF/n1dK
	E8szOXFWU4a1Es9L0lpiHyPSF1uhTYp5cmzORtGwqf5ECuicU27phZLuzldS5r8HbClRjq
	8KoN7b2/qEIwM9fdZ/2iPEuaUSv9DeQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-COjq_tZSNcefvc-0PKt7UQ-1; Thu, 29 Oct 2026 14:53:21 -0400
X-MC-Unique: COjq_tZSNcefvc-0PKt7UQ-1
X-Mimecast-MFC-AGG-ID: COjq_tZSNcefvc-0PKt7UQ_1793300000
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so21201635e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793300000; x=1793904800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kl5aqa/5huOMBjE/HMjqhWjp8eowVgL7maZxpKhEQks=;
        b=QkvjLFKAJ21o+Kfz5fyVkBTJurdpBUVDy5cRc+5uewTMggJZPomJ09kxvhZd7m8Ot1
         X1rxlz+4f8xSeN2j1UpxPexqELsoLDr9h/ow5K2qZ9RrZHzri+6bIVt6dUFPXUD0A7GR
         SoMY2t5MkQ9I90tg2YzG5uAkPsLYT1SCc0Kidtki3VB0zAhZQBQ66m/9gTK7y1bk1a7c
         WQJEl2Z0Kmi/zDSIdXlBu3ZA4SUEGrL1Fz09Xb+Ggm8Y0RZRITNyzWYdv8lnz3dwbzHt
         9Oxnf8y1whBIRrVh6ROlQa6pMuzzTrAjCj2U6Ol7dAfmERIR90MT/hfwOUvhzIb7iHRq
         9YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300000; x=1793904800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kl5aqa/5huOMBjE/HMjqhWjp8eowVgL7maZxpKhEQks=;
        b=WrglaJ8SFlW+2OfermEOA5EKwziGXM4eM+QRNBuaLaVnTe+ziqv6Axt/20TSksXblH
         VmiiPGR9dNv0t/ctxpbmZLq3+udPWtsKez3Gf8Zzmy9nfg0KYT+p60TV5Xwa4Yva/3f2
         YL0TRmEHdS35gvfgHbLGWyXhHEyxrRx05+eisgep0wxdSaQPuutmx7y2GI18WvGSx7BW
         HPuO8nGaLnKv8lTl3bVunU8+xqFfF9uTko3eY9HCZoWwDucKJUPyOE6w0Q8oPw2Juxvn
         0HizgHSjZxPdRj9qAy732GJQeQ4HkEOREHnbpuVjW9wSnczh3UFBFSNo1FkbIpzeYE5y
         4utQ==
X-Gm-Message-State: AFq9FYJlEAjRZsjXcZeMHuf3LHJe6+dy5WMFqn2PMCjI/P1JgyoCSLpt
	WM0UVyKMSAXeW+6MK2l5kr42JjrUY7y0phPUg7aviTBf4Co2kQe1SIcl71BP1e9CfV65hBq1mIR
	8cwRKOFNOg7SkspvQuwTEaSbzdmfUV5LYjYrT0XtrFf5RYTnyby0eqPyj33MdGc3vF1nehGPjny
	OWnlDdXGFz4YIksHJyHzeocqgbznd9vzyP4yCDG7hYIE8=
X-Gm-Gg: AYBFou3D6OOSx8aVXSpN/ACqGj9s7j/DE8X2SFAcv3JgDVnDzJ2wSlojxlUumRmiVfs
	puTXVj1yE0UBZHEApCpr6HZTzLD6FwbeCaz6hXJ+GpY8bngzaCLITqzbhOHPIndoWYEgOlbDGv/
	o1JwaueGaokM1CC3klzMO3T/CfHTiVxvDtqXYGQWTBcoLuK3AQxDFwN32eIUC59e+m1PrWm4YkU
	9I0TWK1pdUbYBspLdmPpw5PCz1UiGC8JAArnI5jppPcp4bfYXvUDGjIc6YRjDPfcGbJ9Zn2Ava7
	uURViC8zSwna0mPxldXPTEk8YaDy04lF8dyRtdFplP6numacPcYfgGtTTelTqIrV0nIqPpwhh/L
	Z8aeAxq+fDu3vIkrY0sqdQ8WH1oiGjJnaaOnPpsN2rqzt
X-Received: by 2002:a05:600c:8183:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4a96710c712mr125672965e9.25.1793299999940;
        Thu, 29 Oct 2026 11:53:19 -0700 (PDT)
X-Received: by 2002:a05:600c:8183:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4a96710c712mr125672195e9.25.1793299999308;
        Thu, 29 Oct 2026 11:53:19 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm3822575e9.4.2026.10.29.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:53:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Willem de Bruijn <willemb@google.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Simon Horman <horms@kernel.org>, linux-um@lists.infradead.org
Subject: [PATCH RFC v7 1/5] net: account for ingress-resolved virtio net hdr
 state
Message-ID: <305bcadb19f4a539a318c6b87c829fbe43d0ffdb.1793276116.git.mst@redhat.com>
References: <cover.1793276116.git.mst@redhat.com>
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
In-Reply-To: <cover.1793276116.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The following patch will add ingress resolution of uncommon virtio net
hdr checksum metadata (software checksum completion at ingress) which
adds performance overhead to the packet processing.

We should make it visible, so a hypothetical workload relying on
uncommon metadata can be distinguished from none at all. This way issues
in the parsing will be reported and not quietly pay the host-CPU
checksum overhead instead of offload.

Flip every call to virtio_net_hdr_to_skb to test for negative errno
only.  The um vector raw transport even ignored the return value
altogether: rejected packets went on into the stack with their
metadata unvalidated, so check it there as well.

Have tun count these events per device as rx_csum_sw, exposed via
ethtool -S.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    v4->v5:
        count on tun only: dropped the tap, macvtap, ipvtap and
        virtio_net counters (Willem de Bruijn)

 arch/um/drivers/vector_transports.c |  4 ++-
 drivers/net/tap.c                   |  4 +--
 drivers/net/tun.c                   | 41 +++++++++++++++++++++++++++--
 drivers/net/virtio_net.c            |  2 +-
 net/packet/af_packet.c              |  4 +--
 5 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vector_transports.c
index e1fb2a76fdff..8b7548458663 100644
--- a/arch/um/drivers/vector_transports.c
+++ b/arch/um/drivers/vector_transports.c
@@ -210,7 +210,9 @@ static int raw_verify_header(
 		return 1;
 
 	skb_set_network_header(skb, ETH_HLEN);
-	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian());
+	if (virtio_net_hdr_to_skb(skb, vheader,
+			virtio_legacy_is_little_endian()) < 0)
+		return -1;
 	return 0;
 }
 
diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..101994870bac 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -650,7 +650,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 
 	if (vnet_hdr_len) {
 		err = tun_vnet_hdr_to_skb(q->flags, skb, &vnet_hdr);
-		if (err) {
+		if (err < 0) {
 			rcu_read_unlock();
 			drop_reason = SKB_DROP_REASON_DEV_HDR;
 			goto err_kfree;
@@ -1090,7 +1090,7 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
 
 	if (vnet_hdr_len) {
 		err = tun_vnet_hdr_to_skb(q->flags, skb, gso);
-		if (err) {
+		if (err < 0) {
 			rcu_read_unlock();
 			goto err_kfree;
 		}
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 770b8fe085c3..82ea59594eba 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -210,6 +210,7 @@ struct tun_struct {
 	u32 flow_count;
 	u32 rx_batched;
 	atomic_long_t rx_frame_errors;
+	atomic64_t rx_csum_sw;
 	struct bpf_prog __rcu *xdp_prog;
 	struct tun_prog __rcu *steering_prog;
 	struct tun_prog __rcu *filter_prog;
@@ -1944,10 +1945,14 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		break;
 	}
 
-	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr)) {
+	err = tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr);
+	if (err < 0) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		err = -EINVAL;
 		goto free_skb;
+	} else if (err > 0) {
+		atomic64_inc(&tun->rx_csum_sw);
+		err = 0;
 	}
 
 	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP)
@@ -2615,11 +2620,15 @@ static int tun_xdp_one(struct tun_struct *tun,
 	tnl_hdr = (struct virtio_net_hdr_v1_hash_tunnel *)gso;
 	skb->dev = tun->dev;
 	skb_set_network_header(skb, ETH_HLEN);
-	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, tnl_hdr)) {
+	ret = tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, tnl_hdr);
+	if (ret < 0) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		kfree_skb(skb);
 		ret = -EINVAL;
 		goto out;
+	} else if (ret > 0) {
+		atomic64_inc(&tun->rx_csum_sw);
+		ret = 0;
 	}
 
 	skb->protocol = eth_type_trans(skb, tun->dev);
@@ -3749,7 +3758,35 @@ static void tun_get_channels(struct net_device *dev,
 	channels->max_combined = tun->flags & IFF_MULTI_QUEUE ? MAX_TAP_QUEUES : 1;
 }
 
+#define TUN_STATS_LEN	1
+static const char tun_ethtool_strings[TUN_STATS_LEN][ETH_GSTRING_LEN] = {
+	"rx_csum_sw",
+};
+
+static int tun_get_sset_count(struct net_device *dev, int sset)
+{
+	return sset == ETH_SS_STATS ? TUN_STATS_LEN : -EOPNOTSUPP;
+}
+
+static void tun_get_strings(struct net_device *dev, u32 stringset, u8 *data)
+{
+	if (stringset == ETH_SS_STATS)
+		memcpy(data, tun_ethtool_strings,
+		       sizeof(tun_ethtool_strings));
+}
+
+static void tun_get_ethtool_stats(struct net_device *dev,
+				  struct ethtool_stats *stats, u64 *data)
+{
+	struct tun_struct *tun = netdev_priv(dev);
+
+	data[0] = atomic64_read(&tun->rx_csum_sw);
+}
+
 static const struct ethtool_ops tun_ethtool_ops = {
+	.get_sset_count		= tun_get_sset_count,
+	.get_strings		= tun_get_strings,
+	.get_ethtool_stats	= tun_get_ethtool_stats,
 	.supported_coalesce_params = ETHTOOL_COALESCE_RX_MAX_FRAMES,
 	.get_drvinfo	= tun_get_drvinfo,
 	.get_msglevel	= tun_get_msglevel,
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe..dd3f39516f90 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2535,7 +2535,7 @@ static void virtnet_receive_done(struct virtnet_info *vi, struct receive_queue *
 	skb_set_network_header(skb, ETH_HLEN);
 	if (virtio_net_hdr_tnl_to_skb(skb, &hdr->tnl_hdr, vi->rx_tnl,
 				      vi->rx_tnl_csum,
-				      virtio_is_little_endian(vi->vdev))) {
+				      virtio_is_little_endian(vi->vdev)) < 0) {
 		net_warn_ratelimited("%s: bad gso: type: %x, size: %u, flags %x tunnel %d tnl csum %d\n",
 				     dev->name, hdr->hdr.gso_type,
 				     hdr->hdr.gso_size, hdr->hdr.flags,
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 823e0911c910..c0cd36be53d6 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2921,7 +2921,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 		}
 
 		if (has_vnet_hdr) {
-			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le())) {
+			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le()) < 0) {
 				tp_len = -EINVAL;
 				goto tpacket_error;
 			}
@@ -3144,7 +3144,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 
 	if (vnet_hdr_sz) {
 		err = virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le());
-		if (err)
+		if (err < 0)
 			goto out_free;
 		len += vnet_hdr_sz;
 	}
-- 
MST

