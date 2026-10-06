Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ADA3B2D38
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326880; cv=none; b=Z3rnG8rPq+5d6px/LzDZa7TJzabTGYiC6GqxnA8MzhS1+7TX8rUA4GQnpLWD4L+Gu3pUqxyA/h6LCQVCm7p2pfMXINwa422sPnLrwBDmxb5d5Z4Ej3F6LcF55cZUaMyxy2MzsUD0uM/VGRSD4XHeCsW3SRnI0CI5CP9xGUIMZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326880; c=relaxed/simple;
	bh=mHaCExpqq/Y7fEbbmhobTh33ojfO5o1xv6vpAgO1dIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOuVZmSHXRQ2uq82AF/4HP0P7pWXQ5xhXpegi2vv0xBFhT9cRnLdM5TKI83+oyYq2U+3vbB+g13McyomDf2WrUvoDLdlDHHZln0/HWt33Fhsulxm6K308u1xTrp7ihmVpVwBsqUrXrvlV6OOhPbWM+tuMSswIZegAFW2NaKO6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=gjUFkYbM; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="gjUFkYbM"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-918f75a68f0so14297216d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791326879; x=1791931679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MT8LFBKbAblU1rf6rEhd8LliNpbGxLMtyrIqhKh9Xu4=;
        b=gjUFkYbMdbfl8hj0i7xDLwAXIGNIGyX3qsJ9QwmbGwuNh8am97ATdFwujrmOT8IxoA
         m/593wWPrCorWy2qxeSeRLI5mCIYMeOyhi4jf3bfAjrwasGWUChj4VV9V8RLOzGFHkqH
         kI/NhuU1nUo7pUNWzOFaNOhuA8suMs7Loi3xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326879; x=1791931679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MT8LFBKbAblU1rf6rEhd8LliNpbGxLMtyrIqhKh9Xu4=;
        b=v7gZFedReWb01aNDhNtMpeu17DImFK5lsaQDEBKg4gKmkr5fC1+aqLhtjsGulc+SGQ
         TSsK/F+BbYyE+WQC4c9El0N+uHV7cxxNQBdH7hRcwAijz841Uj9AA0F6qmbBn56tIPk+
         dy/F9kyTKMG0RCigCpizYSXCc35+/JEqM9oyrpXryBcAh0/OLzqkdY2Vg2LG5XLU+F4C
         2yQIrADySnAC17gHUJAjCafTXrdZft0vlaLi7m8ky2+UNGjT2jVJYjSLVo5AOvf6OdWr
         qWRRTs8D7T4yPRtBOpI/7gPUHVQmBo5GA9Z9kWEvHRTCC6P/ZZEqiV4UdVV8e9yrktY2
         WtWA==
X-Forwarded-Encrypted: i=1; AKwUvBwydjxymSPRfP4tubY1maJ3mJlVuGo57Pa7U7zS6zXGgUy2nCzOuL+P7pisBR+pLemR3cU/nbknxEKZGXA=@vger.kernel.org
X-Gm-Message-State: AFuF++mv1j1jtl8678RByKJh3Zv1OP6jHlVsNbjdu6kYoqeZs+n3FqNg
	lk+0NGZuDBBR0q7QH26oKEU0qElw6SnoDRI2G5m0/WZeU8FZfbysl/vx/BV+rXyYSnchjlXRLRF
	89H+1f/M=
X-Gm-Gg: AYBFou0ncPaj1Onq1xsC9gP+QSHTq3ZAZ2PbIX8TjQfbI9EgJSEHCWG4wizbo1Fedyz
	PY3Lc+dsA6Ckp93hul1KIyTiA/QkOZyUrqGcV34imzbjWWG4b14rLJXAcWr88bzHPavkXM41qJn
	6rcWPM9zkHPfkzhhZudUEPpTRQk5it1R2Kf2iWKwZhSXSlAdNjIPR+rDgJr6gnZ8q5GQaU+qWdo
	NDo6/LwvWXLiWMw110oryT6m4OYV2lE6IcXQ2xT3JvcDJ+W227ylJKD4eeeT65JO7U7aBwtYRBJ
	dZ3ae8KvGhH7CyaDgW9UDqcv8Zv2KxPpTmFTfiyylMcimKt9dcDXlZKhncdr7DqTX5lfMBjKfoz
	xQCzrQD1CUdFxGUPXUfCJIK7GU5WGHQ8WmpwaPqJat1Aj1Sql2l4zXoc1A2M3wzAxuhSiJ30XTa
	AMJGngScuHKdXUqGCIp6NalAKYfMuntcQuBDQlHoX7ExgfCrCkWwVj90l58lp6IFVW/lzxMaj3w
	XFZ5lOidRvphOQhq+4ioSEj+t26hsIBAtQx3oWUc/7di/gsLo8XrNueQ7TXrPXxfmFRakQjZ9w=
X-Received: by 2002:a05:6808:f93:b0:4b9:a88b:8892 with SMTP id 5614622812f47-4fc46373d6emr765933b6e.40.1791326483877;
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49a7594bsm577379b6e.17.2026.10.06.15.41.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] neighbour: stop using device addresses in hashes
Date: Tue,  6 Oct 2026 15:41:18 -0700
Message-ID: <20261006224118.50200-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTM_GETNEIGHTBL exposes the live hash multiplier and bucket mask. For
ARP, that multiplier is applied to the IPv4 key XOR hash32_ptr(dev).
Since hash32_ptr() merely folds the address, timing chosen-key misses
through the unprivileged SIOCGARP ioctl can reveal the folded address
of the loopback net_device. NDISC uses the same address-dependent
first hash term.

Give each net_device an independent random neighbour hash discriminator
at allocation time and use it in both protocol hashes. Keep it immutable
so that lookups, insertion and rehashing agree even if the device's
ifindex or network namespace changes. This retains the cross-namespace
hash distribution that motivated using the device pointer, without
putting a kernel address into the observable hash. A dedicated value
also avoids making a salt used by unrelated network hashes observable.

The existing NDTA_CONFIG fields and neighbour key comparisons can stay
unchanged. Update the net_device cacheline documentation and assertions
for the new read-mostly field.

Fixes: b14f243a42c7 ("net: Dont use ifindices in hash fns")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 +
 include/linux/netdevice.h                              | 2 ++
 include/net/arp.h                                      | 3 +--
 include/net/ndisc.h                                    | 3 +--
 net/core/dev.c                                         | 4 +++-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 512f6d6fa3d8f8b4a861b87b1b2d5f8c4156d6cf..f6e8e7522ea73e25f0eea304fef5676c3be57c8a 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -30,6 +30,7 @@ xdp_features_t                      xdp_features
 struct net_device_ops*              netdev_ops                  read_mostly                             netdev_core_pick_tx,netdev_start_xmit(tx)
 struct xdp_metadata_ops*            xdp_metadata_ops
 int                                 ifindex                                         read_mostly         ip6_rcv_core
+u32                                 neigh_hash_mix              read_mostly         read_mostly         arp_hashfn,ndisc_hashfn(tx/rx)
 unsigned_short                      gflags
 unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
 unsigned_int                        mtu                         read_mostly                             ip_finish_output2
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 87cafc932e9e6584405821a87be0e31e0fc65b77..b7fd5c40bb7831f403c4558e2fcdacad50b8cdd8 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1878,6 +1878,7 @@ enum netdev_reg_state {
  *				disabled together with the latter.
  *
  *	@ifindex:	interface index
+ *	@neigh_hash_mix: Immutable per-device random salt for neighbour table hashing
  *	@group:		The group the device belongs to
  *
  *	@stats:		Statistics struct, which was left as a legacy, use
@@ -2209,6 +2210,7 @@ struct net_device {
 	enum netdev_stat_type	pcpu_stat_type:8;
 	netdev_features_t	features;
 	struct inet6_dev __rcu	*ip6_ptr;
+	u32			neigh_hash_mix;
 	__cacheline_group_end(net_device_read_txrx);
 
 	/* RX read-mostly hotpath */
diff --git a/include/net/arp.h b/include/net/arp.h
index e8747e0713c79f6f4934bb8474498f59cc5b189c..f32d2318ba08353e5c0f31479d102043a9d8127a 100644
--- a/include/net/arp.h
+++ b/include/net/arp.h
@@ -4,7 +4,6 @@
 #define _ARP_H
 
 #include <linux/if_arp.h>
-#include <linux/hash.h>
 #include <net/neighbour.h>
 
 
@@ -13,7 +12,7 @@ extern struct neigh_table arp_tbl;
 static inline u32 arp_hashfn(const void *pkey, const struct net_device *dev, u32 *hash_rnd)
 {
 	u32 key = *(const u32 *)pkey;
-	u32 val = key ^ hash32_ptr(dev);
+	u32 val = key ^ dev->neigh_hash_mix;
 
 	return val * hash_rnd[0];
 }
diff --git a/include/net/ndisc.h b/include/net/ndisc.h
index 9e5379ad2d8e004e1c6be2ed6b37aaf4fb55d553..ab9c7750052e8ffc53fe1c9b69f27cb239b4e4c4 100644
--- a/include/net/ndisc.h
+++ b/include/net/ndisc.h
@@ -54,7 +54,6 @@ enum {
 #include <linux/types.h>
 #include <linux/if_arp.h>
 #include <linux/netdevice.h>
-#include <linux/hash.h>
 
 #include <net/neighbour.h>
 
@@ -346,7 +345,7 @@ static inline u32 ndisc_hashfn(const void *pkey, const struct net_device *dev, _
 {
 	const u32 *p32 = pkey;
 
-	return (((p32[0] ^ hash32_ptr(dev)) * hash_rnd[0]) +
+	return (((p32[0] ^ dev->neigh_hash_mix) * hash_rnd[0]) +
 		(p32[1] * hash_rnd[1]) +
 		(p32[2] * hash_rnd[2]) +
 		(p32[3] * hash_rnd[3]));
diff --git a/net/core/dev.c b/net/core/dev.c
index f660fccfc0dbc56d7e1a9643525229b278bca547..d6922b4ee64fe0fe60896a8ce69cf90bf174a156 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12131,6 +12131,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 		return NULL;
 
 	dev->priv_len = sizeof_priv;
+	dev->neigh_hash_mix = get_random_u32();
 
 	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
@@ -13353,7 +13354,8 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, hard_header_len);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, features);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, ip6_ptr);
-	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_txrx, 46);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, neigh_hash_mix);
+	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_txrx, 50);
 
 	/* RX read-mostly hotpath */
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, ptype_specific);
-- 
2.53.0

