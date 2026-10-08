Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E983AA4E1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430830; cv=none; b=gow7rwq/oTjg6VeHm4PbO0rwZ952hiWoET1ZWl/5h0aVGk18FyB1DS3BWwOE4wqkty9p4bKRHYI5iLUzf4FVC6Dv59W/aEteZtBz1mqJbQ9eLyKyw7yihlAp6/2toAsTR2A7gQ2kfV5JUaL3HEy85Nq6Kc5K23dAk+ybobAqSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430830; c=relaxed/simple;
	bh=hrTmsIBbiGmKQOjn02ezrfotZmF8vX/5RB2XjzX5QhA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oPwDoTvjqWpvv8NMornDB4D0fSwmLnw85Tbg/H055uc/YjtyXa7r+J6/KxJRM9nVPWeQSbOq1IeENQVkZVkDS0df0qegR3DytnSnrR4tkEZsytlhQju1aAK0DtYa/kjCWkLJvnCDEQcW/BuD4B6xOOFRDp6SXeVtm3ZgCiw+Qt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHkkdScq; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHkkdScq"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso1477658eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791430829; x=1792035629; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HwPYJFKEdiyX4935OotxW9r3+hcqkRnlBB6xoiIvRU=;
        b=LHkkdScq6uzXozHIJBnIIMqQ2J9jfS7swumkyAo5RqEuQVt2AA02IoWv5W0c6gf4ka
         pSMnD52fZDDt0BGXA5gfIGzdCGFyGxgplzCP90TxkejQqR5FmDp/xLERenEHSy0RGVOr
         S/0lAcZay5ejr9Aw9DV6VziDGJL2KC3jRNn/0PJzYvvIQgvxgKzQewjjlRvNkVWZAEL3
         MM/+Or2NfoPP6PKOcSpflvVfP+BPPklocVBbBoV+KFCsb5PNI+qTtgiQBZ7qiMGbhvED
         +2r45tKK4b704c80tb7dmQX4UrgGYanuZ7tiWd4wM8Bq8W7IRM59fDe/1nmd/4nKlb4H
         Pl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430829; x=1792035629;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HwPYJFKEdiyX4935OotxW9r3+hcqkRnlBB6xoiIvRU=;
        b=KeQkaxguf960eACVOc1vimLdZaahLKyVhG2AkLVcSLfgkVLGnOn0sse9OrI3EFAt+W
         8nX+cCsxyR/IIftNOzVzOikTj9ODW4K1ZxfWfTFgNI2oHx5gzwbCw0Auy40iDnaxyqlb
         0rBHUO7XCqZozKuzAPbdH1y1F3aTGwX+jO5TX4tQfErg3Gpd89Ch8RTstDQGNIaOBSRp
         AZ95INP+H+djbwwZbOkRd5xwCThhrF+OcF5IJmjF4dtaH8cAUBqA5yqbVor4YvIEIuR/
         yjjzMd9zPD4LpYmecxcJ4J2EJ+QT+1QIo5PUfuBkPTQMv6ql/ZCSgh1w3pBrmqw93dT8
         4XVg==
X-Forwarded-Encrypted: i=1; AKwUvBxvCpByFFzqNd9wAF+H06/mtA+/6LKO3IWkpHanhjpZ76nfbkzfRl8iS4Q28Y7soyYn/bKvYsLppjuLKv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkNAqgusRjM4BqY+1tEuPRBD3hUImiVUgfOpZ2DVlAVj2pmKgL
	P7NZwaOJuZj5pHHekzkL1jPz51xbX0syJi4lV48gaFfCGOJsiZ2A+iXP09SB5ckycYIHFMmD00t
	cuJmA3imnNCdSaLj1bijzYlcrOg==
X-Received: from dybmn3.prod.google.com ([2002:a05:7300:d203:b0:351:79dd:52dd])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:8617:b0:351:11aa:5d5b with SMTP id 5a478bee46e88-3515dde8bbbmr4820551eec.19.1791430828091;
 Wed, 07 Oct 2026 20:40:28 -0700 (PDT)
Date: Thu,  8 Oct 2026 03:40:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008034027.1403188-1-almasrymina@google.com>
Subject: [PATCH net v1] net: devmem: prevent mixing fragments from different bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Antonio Quartulli <antonio@openvpn.net>, 
	Pavel Begunkov <asml.silence@gmail.com>, Ralf Lici <ralf@mandelbit.com>
Content-Type: text/plain; charset="UTF-8"

validate_xmit_unreadable_skb() only inspects shinfo->frags[0] and
assumes all fragments in an unreadable skb belong to that same devmem
binding. However, tcp_sendmsg_locked() only checks that readability
matches the presence of a binding (skb_frags_readable(skb) != !binding),
allowing consecutive sendmsg() calls with different dmabuf bindings to
collapse into the same skb and bypass per-device and unbind checks in
validate_xmit_unreadable_skb().

Add net_devmem_skb_binding() to query the binding associated with an
skb, reuse it in validate_xmit_unreadable_skb(), and check in
zerocopy_fill_skb_from_devmem() that existing fragments match the target
binding.

Fixes: bd61848900bff ("net: devmem: Implement TX path")
Cc: Pavel Begunkov <asml.silence@gmail.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/datagram.c |  2 +-
 net/core/dev.c      | 14 ++++----------
 net/core/devmem.h   | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index 173b5d97bd409..ed8f1045f3cca 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -712,7 +712,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 	size_t virt_addr, size, off;
 	struct net_iov *niov;
 
-	if (i && skb_frags_readable(skb))
+	if (i && net_devmem_skb_binding(skb) != binding)
 		return -EFAULT;
 
 	/* Devmem filling works by taking an IOVEC from the user where the
diff --git a/net/core/dev.c b/net/core/dev.c
index e76762e29360e..ad2b587dfee27 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4054,8 +4054,7 @@ static struct sk_buff *sk_validate_xmit_skb(struct sk_buff *skb,
 static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 						    struct net_device *dev)
 {
-	struct skb_shared_info *shinfo;
-	struct net_iov *niov;
+	struct net_devmem_dmabuf_binding *binding;
 
 	if (likely(skb_frags_readable(skb) ||
 		   dev->netmem_tx == NETMEM_TX_NO_DMA))
@@ -4064,14 +4063,9 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 	if (dev->netmem_tx == NETMEM_TX_NONE)
 		goto out_free;
 
-	shinfo = skb_shinfo(skb);
-
-	if (shinfo->nr_frags > 0) {
-		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
-		if (net_is_devmem_iov(niov) &&
-		    READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev)
-			goto out_free;
-	}
+	binding = net_devmem_skb_binding(skb);
+	if (binding && READ_ONCE(binding->dev) != dev)
+		goto out_free;
 
 out:
 	return skb;
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 4a293a7d1149c..8c74037633ae8 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -10,6 +10,7 @@
 #ifndef _NET_DEVMEM_H
 #define _NET_DEVMEM_H
 
+#include <linux/skbuff.h>
 #include <net/netmem.h>
 #include <net/netdev_netlink.h>
 
@@ -118,6 +119,22 @@ net_devmem_iov_binding(const struct net_iov *niov)
 	return net_devmem_iov_to_chunk_owner(niov)->binding;
 }
 
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	const struct skb_shared_info *shinfo = skb_shinfo(skb);
+	const struct net_iov *niov;
+
+	if (skb_frags_readable(skb) || !shinfo->nr_frags)
+		return NULL;
+
+	niov = skb_frag_net_iov(&shinfo->frags[0]);
+	if (!niov || !net_is_devmem_iov(niov))
+		return NULL;
+
+	return net_devmem_iov_binding(niov);
+}
+
 static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 {
 	return net_devmem_iov_binding(niov)->id;
@@ -243,6 +260,12 @@ net_devmem_iov_binding(const struct net_iov *niov)
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

base-commit: 6d25ffca055a77787c21a36b66c253f76239411b
-- 
2.56.0.385.gd3acb90ef8-goog

