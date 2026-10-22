Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673886;
	b=HWQQy2dH2+1uwwWnEOJCnjii64Dq7mEOFe5u4FwbnpbLN3/a+MdSSQdjpl4ww3Mc6F5d
	 2J2m3xAkKLhSo+xhyo5p0W4clQnrKRW3tV9eJ2Ih+s16zByf227hdHJFoFTtSryKzCGbF
	 Bj0c7sNrwT2dBOGN9WI8Xy57zbSuyIQxjQdcZO8GQgWZ61sk7bGMCdC5ch4eDL1DdLGLF
	 LABEEDuvBiNu0TVpHQgohXPjSQVTXdBEWJmJuxaR+RrrFfF6zdMq+DAumqwnLKZkQZQ8I
	 z5yjtRnAVm0kNQiWj/xtExbBGVJhvR+fXuPFX2Pct/GpyNsoBEpiVOiFXNk7fHTHAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673886;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=JkOX/PkEAI8mnSOFgbqqjMUWsWOosAz2unpOFyKd8vI=;
	b=A29i+w6rh4f/qV2SqqnkE9VlEOMhV9JqNQBVN8VvKxmhtuivlINvb+SmU/qX5+wwQnme
	 F3qs25IAa5hp2K25ZI2rH0s3BzMhV7BN/4VrXjGrevyv2f6BSShbC32/holx8Ccx+iBJA
	 cDwNCrhnIklWW63+PMTECjTvqmcv0ysV/aHHDT5hJf6c4clFAlbixEx8TLCKB49A6KROW
	 vLs4wn+vF9LYPiT7YJKSpoHqX96T+lUaUO4lhi5fir8f8lZh0gNhA4PlKjZOq6hHM7IdK
	 CyR+bIA2XqlfiQmPzTufBpZJFBGQkvzeTlOmEOn3BWgZc37AFqkOrDEZw9rkOJlEKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QDC6uWPJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TOfSJazn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EE606A331
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393EE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QDC6uWPJ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TOfSJazn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792673885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JkOX/PkEAI8mnSOFgbqqjMUWsWOosAz2unpOFyKd8vI=;
	b=QDC6uWPJ4KYCjRg+SE6sTaS6a8J3ZQzGH7UFPzW7J6UoIMdRl6FOrxHbM5Hb0D+VEr4XrM
	dDWOJCNdQjhzCWX7GT6uATCskOT5dTu7JLUd51i0ISiMDw97qi4rQTF7gJcII3KSGbyzwg
	ai8KFfpldFWXvWTBCkhd84mdjJuw4mk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-SGK3FoEuO4GEzlAJy2sSuA-1; Thu, 22 Oct 2026 12:58:03 +0000
X-MC-Unique: SGK3FoEuO4GEzlAJy2sSuA-1
X-Mimecast-MFC-AGG-ID: SGK3FoEuO4GEzlAJy2sSuA_1792673883
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0c896d05so1520514f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792673883; x=1793278683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkOX/PkEAI8mnSOFgbqqjMUWsWOosAz2unpOFyKd8vI=;
        b=TOfSJaznayAo/abAV/AELbWRIL6Npz82sUAm9DLjKGuN5QYzakLJ7abzVXHFXu2w+1
         KhpgAB7VkcfNppytK/5sJPB5oLoKv7K3cU2BClxpfmtWCnd+vLHqvhCvuq5lGJZoElQI
         ts8F8zIF5bEeJh+Kwf/l0eTAYNpmFx4I2OGbqYyUda0fyOIPgOnoGtEq7z5IJoSyVTmA
         1buQE/j8wflm44vRc9p0wJm9ZrewpgTRf04418xVwETh6B14DQw81QyKYAu0/pzTR2dg
         1o63m7+5G/cy2uyKV/lVGu3bReyyuE5NlEdy3uGMFHi+9G2o7wF3zEX2CKe8ZM93V4p8
         lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673883; x=1793278683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkOX/PkEAI8mnSOFgbqqjMUWsWOosAz2unpOFyKd8vI=;
        b=GAR3QwTARo88znA8+/Io9sFglZu5DgAHpvX0W/Eegafv1McZgr2sS2pbxwyQ9h8Fwg
         489Jb9RhttRFqn2vrQF0SbnNf1gJIFepH3cP0HR2bU8PD3e6up+W0COQVZYkCtnPn6FF
         vSaV0PF/LqpirbGBZGQ2NPYKUaYP+4GxVRGm8putnVVtcoV8AimcciYsTwbKW/z9DQqZ
         CVFuFCInq1qCMD0JboHLnfrLkUHWOuMqjKZD1O9fnxoIy+s61Aqu0GV7yOL14Rm9KbjG
         LAfYCt2GfRDsVnCZDAeCsHs3tR2+RsULrfrwAL4qG8ypTWo8q2shtkY3UXQJw/C39rD/
         A27w==
X-Gm-Message-State: AFq9FYJAKEsjvx7Gjy+1RaIigFdTt1i5oSTsoxHSP4xWVGr+6tP1fyEF
	cHUcuiUeQZm/tjLxzxqqD1+VsiGMVUXRoIveYyU/q5VeIEkieMpK8VmXM/ce9aFGFiwDHARY0Df
	DZHgf5ll2PLBN/SonQ3DYdCqpTvejQwFJ2ZpwOTYXpLZcQpcKfUY5oA8KIu0vFKpDLWQJ3ThqwG
	vzMokBBSkInlR3nVWw0U96ZfTiLfubQMndOGouarcEV2Q=
X-Gm-Gg: AYBFou1ox96mRulFXcJQLINfCswb3EboN06kDT5u82Hd6Jk9ktkI9lre9gPw7UpX59F
	fLL/I8oimtNKjIrm4cKsZGnAnVy/CIxaY6q3MnFVfSh3sh7ypOaSrbo1xckYitEyZlaH5sRU3tx
	ZhKFSww0wemavQneAQ3/IgZDJX4vfSqZRTKdRH86Y4SsJXWv0ProjqeHxGZMs0EO8MByl2LkAQt
	OYPdD3DFJ+mJef0pj8x3jSLeToE7kfndDRpppQoWstL5iY8nMDncIDWzNXznbWhendSqeTv18ue
	LChFgoxyH3ImvREOIXP10JRpf/fA5tEdwxlGT4+TvJKKe9y20NXMNs97tCEHLs5IzHM=
X-Received: by 2002:a05:600c:b90:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a1fdb20d7dmr101027655e9.26.1792673882488;
        Thu, 22 Oct 2026 05:58:02 -0700 (PDT)
X-Received: by 2002:a05:600c:b90:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a1fdb20d7dmr101026945e9.26.1792673881845;
        Thu, 22 Oct 2026 05:58:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a265afsm80608645e9.7.2026.10.22.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:58:00 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:57:58 -0400
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
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Simon Horman <horms@kernel.org>, linux-um@lists.infradead.org
Subject: [PATCH net v5 1/7] net: account for ingress-resolved virtio net hdr
 state
Message-ID: <94796ee3c32e50665ecf70e2b390db1bc2773be9.1792668082.git.mst@redhat.com>
References: <cover.v5.git.mst@redhat.com>
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
In-Reply-To: <cover.v5.git.mst@redhat.com>
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
index ff67d99deb39..73e883394446 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -649,7 +649,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 
 	if (vnet_hdr_len) {
 		err = tun_vnet_hdr_to_skb(q->flags, skb, &vnet_hdr);
-		if (err) {
+		if (err < 0) {
 			rcu_read_unlock();
 			drop_reason = SKB_DROP_REASON_DEV_HDR;
 			goto err_kfree;
@@ -1084,7 +1084,7 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
 
 	if (vnet_hdr_len) {
 		err = tun_vnet_hdr_to_skb(q->flags, skb, gso);
-		if (err) {
+		if (err < 0) {
 			rcu_read_unlock();
 			goto err_kfree;
 		}
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 242899f7fd07..197fb8726f8d 100644
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
@@ -1935,10 +1936,14 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
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
@@ -2605,11 +2610,15 @@ static int tun_xdp_one(struct tun_struct *tun,
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
@@ -3739,7 +3748,35 @@ static void tun_get_channels(struct net_device *dev,
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
index daab43ac92ce..2e6fd81df9c4 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2519,7 +2519,7 @@ static void virtnet_receive_done(struct virtnet_info *vi, struct receive_queue *
 	skb_set_network_header(skb, ETH_HLEN);
 	if (virtio_net_hdr_tnl_to_skb(skb, &hdr->tnl_hdr, vi->rx_tnl,
 				      vi->rx_tnl_csum,
-				      virtio_is_little_endian(vi->vdev))) {
+				      virtio_is_little_endian(vi->vdev)) < 0) {
 		net_warn_ratelimited("%s: bad gso: type: %x, size: %u, flags %x tunnel %d tnl csum %d\n",
 				     dev->name, hdr->hdr.gso_type,
 				     hdr->hdr.gso_size, hdr->hdr.flags,
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 52ae3d875e97..e6aec9ecfa99 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2913,7 +2913,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 		}
 
 		if (has_vnet_hdr) {
-			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le())) {
+			if (virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le()) < 0) {
 				tp_len = -EINVAL;
 				goto tpacket_error;
 			}
@@ -3136,7 +3136,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 
 	if (vnet_hdr_sz) {
 		err = virtio_net_hdr_to_skb(skb, &vnet_hdr, vio_le());
-		if (err)
+		if (err < 0)
 			goto out_free;
 		len += vnet_hdr_sz;
 	}
-- 
MST

