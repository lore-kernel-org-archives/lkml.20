Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703207;
	b=jtgrMN2RQ91kr672em7GFgUNDXOR6l0rsRBlGcZO4Etz3OUJDMPpbbFklGJdJbPz/EIH
	 bAA+d6TnbVLZTherM3ZoX94/q6Lgqpy8kbTlmRu3/9Eg68Remek3lawnwCwe0K/JVyErr
	 syhOEYeSsAP+KLTyJKetqRsyt54zwkNPTJwIe2LCgyECqSVflm0tdXKttVBYokt9V8soL
	 HgHXoYENFGcfmUIh+He/4hVZlOmoH89Lg20lDtQ9VPGhLLRndLUqzM2VP/3UzHfEQf7eG
	 aGtQFC+aFo/0AFr4DvNji44nt3xaqz/XFrQsc5Q1/kcC6toarnGFaLjAbijZy2h4lqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XEGPo9OmAyLDwz5LFTKPOoIV0906QQrJV7KlYfHzRWc=;
	b=DHI3SrrfLsvvjYCtPKtQWxBDyOQepXfCeD1VJ49WI8rxXdpXPM54YvTRfJJrtfHij0Y0
	 FL+3ulhfQPD6AuYH+7h6wprBDsHxTjhAMeLGnyeCiDpRJ7LrkOt7RtndXTpgQMqTY/1jD
	 Hlyx99d/mfBnSkl/qTVpnboYmd5XnT5eaZCGEfLysKa9pC7g2IjZM5iN88YLacxslwHP5
	 +3sTGnc/Byj51EroT+ONtd6R0KNnR95pFCMaPg/J9Vm9hwVvji5FYEcJBQfXtausOa3xP
	 rfYXkqKcYwSxobVcBS99kgzQDJqyN6w0Xhp9IJOuIP3npPuRuAqZwIGxVSpfJ6srSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F5J7tUDT;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553E606A887
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2553E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F5J7tUDT
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso9344666eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703206; x=1795308006; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEGPo9OmAyLDwz5LFTKPOoIV0906QQrJV7KlYfHzRWc=;
        b=F5J7tUDT6u2fBSKqTj01YuBLoLBgIoBhRe+6/lw5ZI7tBBrIsuWFMIkVIzURszS8/e
         O57GQZbUUMmTDWnImu8DsKfWfQk+H1HdtBBLFJgHSx1BVzOiTdvSh1aMBnnG/SiqLGss
         qXnRf5PCzHJbdzLT86iVrOpShKGxMx9w/FJXN4Aif2F9itdRqYZFhn+U94lmS+hD75ls
         TVOJKRq/fOSc/EweD6kgQZILeD1KStry9Xp/68CMids56QpaQ48xscN0+qADADej52FO
         VZlWsyEuLRgN7XpBE+fu7Zd46//yse9rVF9XCX5FD320IIC2w0iZPv3UUbA8MP86zN0v
         ytIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703206; x=1795308006;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEGPo9OmAyLDwz5LFTKPOoIV0906QQrJV7KlYfHzRWc=;
        b=20D9aW/wFLwPdMXD0xKQpIJ0W8IyaEV79CPgoWjRveFmgVlHxywlajUyDGlVMbj34b
         7+P/CXbmfCR0t2ZvPDi1bhusjJKG5XnAGyf+MwLhKCAAfv0ZDsbwuCrxZQ+34hUZbPPM
         nxXOxFmSWttu/msgo2KBCcUokEFmKLHXgR4tk8sqlEZQezu9cMvstrdKQVuV0o0/NWJz
         rzO3b6a68UwO6a5l+loC0MP8ooDRbTnmtBPMx+NGZFKZnBVqvLztKIB5GwyPZ4YfInDB
         Vpx3eVEPBKWLbriYA4HS1qNiGFYQ+PW/kRdShuEgrQ05iTGfV83esqOZV305rHfflelC
         wtsw==
X-Forwarded-Encrypted: i=1; AL+hErHWRqDfMoxTGmeYT8CDrPwsWqdNAl6iik6OaET4437UJ4eUoS+g6bgI6NyO1tLEOVTlzPXgFb5S3SYRqwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BwFlQE7ZdxBji0an9PZHA/LnSSTf2lm339GYFCO2Uq5b2rFb6
	0L8mmcG/ZYIAe2IjZCbgPhvUDWHS6HUADA5mA8cbOZCoJ4BSil6qbLSY6WiwwX85X9iL3hMhBOt
	oC7n5LSMPzs68hHEqTavBALT3dA==
X-Received: from dltt18.prod.google.com ([2002:a05:701a:c972:b0:1a0:8cef:34d5])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4508:10b0:1b3:a012:2e40 with SMTP id a92af1059eb24-1b50315f46dmr6499142c88.42.1794703205997;
 Sat, 14 Nov 2026 16:40:05 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:02 +0000
In-Reply-To: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115004003.3695475-3-almasrymina@google.com>
Subject: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

Prevent coalescing, shifting, or appending skb fragments from
incompatible memory providers or different devmem bindings.

Add skb_net_iov_provider(), skb_mem_provider_compat(), and
skb_frags_can_coalesce() to check readability and fragment provider
compatibility (net_iov_owner(niov) for devmem, niov->desc.pp for other
net_iov providers such as io_uring zcrx, and NULL for page-backed skbs)
across skb_try_coalesce(), skb_shift(), skb_gro_receive(),
skb_gro_receive_list(), tcp_skb_can_collapse(), and
tcp_skb_can_collapse_rx().

Also add net_devmem_skb_binding() and use it in tcp_sendmsg_locked(),
zerocopy_fill_skb_from_devmem(), and validate_xmit_unreadable_skb() so
TX skbs cannot mix different devmem bindings or transmit non-devmem
unreadable frags on DMA TX devices. Reject converting linear head_frag
payloads into page frags on unreadable skbs in skb_try_coalesce() and
skb_gro_receive(), and propagate skb->unreadable and compare
skb_frag_netmem() in tcp_clone_payload().

Update netmem_ref_test_net_iov and netmem_ref_test_try_coalesce so their
target skbs carry a compatible unreadable net_iov frag before shifting
or coalescing.

This issue was found by manual code inspection and LLM review; it was
not triggered in production. Verified with the net_core KUnit test
suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Fixes: bd61848900bf ("net: devmem: Implement TX path")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
 include/net/tcp.h      |  5 ++--
 net/core/datagram.c    |  4 +--
 net/core/dev.c         | 14 ++++-------
 net/core/devmem.h      | 22 +++++++++++++++++
 net/core/gro.c         | 16 ++++--------
 net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
 net/core/skbuff.c      | 24 +++++++-----------
 net/ipv4/tcp.c         |  3 ++-
 net/ipv4/tcp_output.c  |  4 ++-
 10 files changed, 142 insertions(+), 47 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 1d6832878930..867e3ab17c17 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3770,6 +3770,61 @@ static inline void *skb_frag_address(const skb_frag_t *frag)
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
+/* Return an opaque pointer identifying the memory provider instance of @skb's
+ * net_iov fragments:
+ * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area, 1:1 with
+ *   the binding across RX queues and TX).
+ * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp (shared
+ *   across all areas of an io_zcrx_ifq).
+ */
+static inline void *skb_net_iov_provider(const struct sk_buff *skb)
+{
+	struct net_iov *niov;
+
+	if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
+	if (!niov)
+		return NULL;
+
+	if (net_is_devmem_iov(niov))
+		return net_iov_owner(niov);
+
+	return niov->desc.pp;
+}
+
+/* Return true if the memory providers of @skb1 and @skb2 are compatible
+ * for coalescing. For any struct page-backed provider (the buddy allocator
+ * or a future provider handing out struct pages), coalescing is assumed
+ * feasible. For net_iov-backed providers, the provider instance pointer
+ * must match.
+ */
+static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
+					   const struct sk_buff *skb2)
+{
+	/* Check skb_frags_readable() first to reject readable/unreadable
+	 * mismatches and avoid chasing frags[0] and struct net_iov when
+	 * only one skb has unreadable frags.
+	 */
+	if (skb_frags_readable(skb1) != skb_frags_readable(skb2))
+		return false;
+
+	return skb_net_iov_provider(skb1) == skb_net_iov_provider(skb2);
+}
+
+static inline bool skb_frags_can_coalesce(struct sk_buff *to,
+					  struct sk_buff *from)
+{
+	if (to->pp_recycle != from->pp_recycle)
+		return false;
+
+	if (skb_zcopy(to) || skb_zcopy(from))
+		return false;
+
+	return skb_mem_provider_compat(to, from);
+}
+
 /**
  * skb_frag_address_safe - gets the address of the data contained in a paged fragment
  * @frag: the paged fragment buffer
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 25d11fab1b03..bf5f28e52fca 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1275,14 +1275,15 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
 		      mptcp_skb_can_collapse(to, from) &&
 		      !skb_cmp_decrypted(to, from) &&
 		      skb_pure_zcopy_same(to, from) &&
-		      skb_frags_readable(to) == skb_frags_readable(from));
+		      skb_mem_provider_compat(to, from));
 }
 
 static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
 					   const struct sk_buff *from)
 {
 	return likely(mptcp_skb_can_collapse(to, from) &&
-		      !skb_cmp_decrypted(to, from));
+		      !skb_cmp_decrypted(to, from) &&
+		      skb_mem_provider_compat(to, from));
 }
 
 /* Events passed to congestion control interface */
diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..88cc0a6c62f6 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 	size_t virt_addr, size, off;
 	struct net_iov *niov;
 
-	if (i && skb_frags_readable(skb))
-		return -EFAULT;
+	if (i && net_devmem_skb_binding(skb) != binding)
+		return -EMSGSIZE;
 
 	/* Devmem filling works by taking an IOVEC from the user where the
 	 * iov_addrs are interpreted as an offset in bytes into the dma-buf to
diff --git a/net/core/dev.c b/net/core/dev.c
index a230ecce9327..51f5e4800eee 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4175,8 +4175,7 @@ static struct sk_buff *sk_validate_xmit_skb(struct sk_buff *skb,
 static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 						    struct net_device *dev)
 {
-	struct skb_shared_info *shinfo;
-	struct net_iov *niov;
+	struct net_devmem_dmabuf_binding *binding;
 
 	if (likely(skb_frags_readable(skb) ||
 		   dev->netmem_tx == NETMEM_TX_NO_DMA))
@@ -4185,14 +4184,11 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 	if (dev->netmem_tx == NETMEM_TX_NONE)
 		goto out_free;
 
-	shinfo = skb_shinfo(skb);
-
 	/* All net_iovs in an unreadable skb share the same binding. */
-	if (shinfo->nr_frags > 0) {
-		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
-		if (net_is_devmem_iov(niov) &&
-		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
-		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
+	if (skb_shinfo(skb)->nr_frags > 0) {
+		binding = net_devmem_skb_binding(skb);
+		if (!binding || binding->direction != DMA_TO_DEVICE ||
+		    READ_ONCE(binding->dev) != dev)
 			goto out_free;
 	}
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c4f476947dfa..c685288f5021 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -10,6 +10,7 @@
 #ifndef _NET_DEVMEM_H
 #define _NET_DEVMEM_H
 
+#include <linux/skbuff.h>
 #include <net/net_namespace.h>
 #include <net/netmem.h>
 #include <net/netdev_netlink.h>
@@ -117,6 +118,21 @@ net_devmem_iov_binding(const struct net_iov *niov)
 			    struct net_devmem_dmabuf_binding, area);
 }
 
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	struct net_iov *niov;
+
+	if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
+	if (!niov || !net_is_devmem_iov(niov))
+		return NULL;
+
+	return net_devmem_iov_binding(niov);
+}
+
 static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 {
 	return net_devmem_iov_binding(niov)->id;
@@ -250,6 +266,12 @@ net_devmem_iov_binding(const struct net_iov *niov)
 {
 	return NULL;
 }
+
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	return NULL;
+}
 #endif
 
 #endif /* _NET_DEVMEM_H */
diff --git a/net/core/gro.c b/net/core/gro.c
index c093fe388dfe..4671f6346df9 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -100,16 +100,7 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 	struct sk_buff *lp;
 	int segs;
 
-	/* Do not splice page pool based packets w/ non-page pool
-	 * packets. This can result in reference count issues as page
-	 * pool pages will not decrement the reference count and will
-	 * instead be immediately returned to the pool or have frag
-	 * count decremented.
-	 */
-	if (p->pp_recycle != skb->pp_recycle)
-		return -ETOOMANYREFS;
-
-	if (skb_zcopy(p) || skb_zcopy(skb))
+	if (!skb_frags_can_coalesce(p, skb))
 		return -ETOOMANYREFS;
 
 	if (unlikely(p->len + len >= netif_get_gro_max_size(p->dev, p) ||
@@ -158,7 +149,7 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 
 		NAPI_GRO_CB(skb)->free = NAPI_GRO_FREE;
 		goto done;
-	} else if (skb->head_frag) {
+	} else if (skb->head_frag && skb_frags_readable(skb)) {
 		int nr_frags = pinfo->nr_frags;
 		skb_frag_t *frag = pinfo->frags + nr_frags;
 		struct page *page = virt_to_head_page(skb->head);
@@ -233,6 +224,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 
 int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
 {
+	if (!skb_mem_provider_compat(p, skb))
+		return -ETOOMANYREFS;
+
 	/* make sure to check flush flag and to not merge */
 	if (unlikely(p->len + skb->len >= 65536 ||
 		     NAPI_GRO_CB(skb)->flush))
diff --git a/net/core/net_test.c b/net/core/net_test.c
index 976d14896251..a1a9a8f91d79 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1097,6 +1097,9 @@ static void netmem_ref_test_net_iov(struct kunit *test)
 	copy = alloc_skb(0, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, copy);
 	copy->pp_recycle = 1;
+	skb_fill_netmem_desc(copy, 0, netmem, 64, 16);
+	copy->len = 16;
+	copy->data_len = 16;
 	KUNIT_EXPECT_EQ(test, skb_shift(copy, skb, 16), 16);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 3L);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
@@ -1635,9 +1638,10 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	};
 	struct sk_buff *to, *from, *clone;
 	struct net_devmem_dmabuf_binding binding = {};
-	struct net_iov niov = {};
+	struct net_iov_area area2 = {};
+	struct net_iov niov = {}, niov2 = {};
 	struct page *pp_page, *reg_page;
-	netmem_ref pp_nm, niov_nm;
+	netmem_ref pp_nm, niov_nm, niov2_nm;
 	struct page_pool *pool;
 	long base_pp_ref, base_iov_ref;
 	int base_pp_page_ref, base_reg_ref;
@@ -1728,18 +1732,19 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	from = alloc_skb(0, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, to);
 	KUNIT_ASSERT_NOT_NULL(test, from);
-	skb_put(to, skb_tailroom(to));
 	to->pp_recycle = 1;
-	to->unreadable = 1;
 	from->pp_recycle = 1;
-	skb_add_rx_frag_netmem(from, 0, niov_nm, 0, 64, PAGE_SIZE);
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, niov_nm, 32, 64, PAGE_SIZE);
 	napi_pp_get_page(niov_nm);
 
 	clone = skb_clone(from, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, clone);
 	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
 						 &delta));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 4L);
+	KUNIT_EXPECT_TRUE(test, to->unreadable);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 5L);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_iov_ref);
 	consume_skb(from);
@@ -1747,6 +1752,31 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	consume_skb(to);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
 
+	/* 4. Reject coalescing net_iov skbs from different bindings. */
+	net_iov_init(&niov2, &area2, NET_IOV_DMABUF);
+	niov2_nm = net_iov_to_netmem(&niov2);
+	netmem_set_pp(niov2_nm, pool);
+	netmem_or_pp_magic(niov2_nm, PP_SIGNATURE);
+	atomic_long_set(&niov2.desc.pp_ref_count, 2);
+	to = alloc_skb(0, GFP_KERNEL);
+	from = alloc_skb(0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, to);
+	KUNIT_ASSERT_NOT_NULL(test, from);
+	to->pp_recycle = 1;
+	from->pp_recycle = 1;
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, niov2_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov2_nm);
+	KUNIT_EXPECT_FALSE(test, skb_try_coalesce(to, from, &fragstolen,
+						  &delta));
+	consume_skb(from);
+	consume_skb(to);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov2.desc.pp_ref_count), 2L);
+	netmem_clear_pp_magic(niov2_nm);
+	netmem_set_pp(niov2_nm, NULL);
+
 	page_pool_put_full_page(pool, pp_page, false);
 	page_pool_put_full_page(pool, pp_page, false);
 	__free_page(reg_page);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 4b18717e230e..deee396c9c3d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4625,10 +4625,9 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 
 	if (skb_headlen(skb))
 		return 0;
-	if (skb_zcopy(tgt) || skb_zcopy(skb))
+	if (!skb_frags_can_coalesce(tgt, skb))
 		return 0;
 
-	DEBUG_NET_WARN_ON_ONCE(tgt->pp_recycle != skb->pp_recycle);
 	DEBUG_NET_WARN_ON_ONCE(skb_cmp_decrypted(tgt, skb));
 
 	todo = shiftlen;
@@ -6609,17 +6608,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	 * tricky (due to potential race with the clone disappearing) and
 	 * rare, so not worth dealing with.
 	 */
-	if (to->pp_recycle != from->pp_recycle)
-		return false;
-
-	/* All frags in an skb must either all be struct page-backed or all
-	 * belong to the same memory provider instance; do not coalesce skbs
-	 * that would mix them.
-	 */
-	if (skb_frags_readable(from) != skb_frags_readable(to))
-		return false;
-
-	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {
+	if (len <= skb_tailroom(to) && to->pp_recycle == from->pp_recycle &&
+	    skb_frags_readable(to) && skb_frags_readable(from)) {
 		if (len) {
 			if (unlikely(skb_copy_bits(from, 0,
 						   skb_tail_pointer(to),
@@ -6633,14 +6623,18 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		return true;
 	}
 
+	if (!skb_frags_can_coalesce(to, from))
+		return false;
+
 	to_shinfo = skb_shinfo(to);
 	from_shinfo = skb_shinfo(from);
 	if (to_shinfo->frag_list || from_shinfo->frag_list)
 		return false;
-	if (skb_zcopy(to) || skb_zcopy(from))
-		return false;
 
 	if (skb_headlen(from) != 0) {
+		if (!skb_frags_readable(to) || !skb_frags_readable(from))
+			return false;
+
 		if (to_shinfo->nr_frags +
 		    from_shinfo->nr_frags >= MAX_SKB_FRAGS)
 			return false;
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea..6d33c296058d 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1254,7 +1254,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 		trace_tcp_sendmsg_locked(sk, msg, skb, size_goal);
 
 		if (copy <= 0 || !tcp_skb_can_collapse_to(skb) ||
-		    unlikely(skb_frags_readable(skb) != !binding)) {
+		    unlikely(skb_frags_readable(skb) != !binding ||
+			     net_devmem_skb_binding(skb) != binding)) {
 			bool first_skb;
 
 new_segment:
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 08d0d4a639fe..19059d03152e 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2696,8 +2696,10 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
 				     probe_size - len);
 			len += todo;
 			skb_shinfo(to)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
+			to->unreadable |= skb->unreadable;
 			if (lastfrag &&
-			    skb_frag_page(fragfrom) == skb_frag_page(lastfrag) &&
+			    skb_frag_netmem(fragfrom) ==
+			    skb_frag_netmem(lastfrag) &&
 			    skb_frag_off(fragfrom) == skb_frag_off(lastfrag) +
 						      skb_frag_size(lastfrag)) {
 				skb_frag_size_add(lastfrag, todo);
-- 
2.56.0.611.g1030f0b940-goog

