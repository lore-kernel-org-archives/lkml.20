Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901132;
	b=dA75sCHTLOHsZLag7VUC0uDRLnumb5UyJX74Ji0gLczwt44dVr47jH4wGxSQCEZUE9f5
	 ycfJSSvmnHjeIezEjHSF13x4+6IuEUFs8smKeF0Y4lejentiOK+dei+14vzBIacy9mPBk
	 obygVbofCngV7sAmVVPELH5wS0yRz492JZj9H+/vfop67VHoHBHs6AasatDpDJUp0ui2M
	 WOV2BwB1R6g0xH87XyYFQUWqKaTT7NY23ZggMbSPxLIxSk45Sa8bKK7FiejxyzMzys7G1
	 M/QgHS93AhK0qZ+qWevB6JzjngTdDVWhhVEps1JQ13duJQoVc3kQIo1Oh6SKD4rTqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zvCxPvVOFJIOuLk7jZ+/YMB/FJuGHwhz7cBx+wq9rrc=;
	b=gGtCmLzMMuNYZLbi7E3c3uke2QftiULD36EXa8dXRvOqaS6FQ/4g8MzJa1R1InKD/13h
	 03urtBW/72MCF6KQERUD/FGm6WKW46gJdi3SjUnK+Wnj2HEmfCwIPFUgP/mFRb+mbEDUB
	 V3iS290Lb96Dk8eR5GR77PLnsZXueGA+S9PJ7Y7m3Naua9B7EghVTZZCYJLdX39x8os9z
	 O9qRHMZ0qx3smQzzhM8DgQ80Q1OU8CHt7jt+a8QLQCsd5SteVAcpemMDZnEfOsoNV3ZZF
	 47uCodw1wQA1Y699o4wQzAzRxAwkdUH6wgIrlHW6B6vyToQDI9ziwmSMMuKamMTmZ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="lk8Eqk/A";
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F109606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F109606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lk8Eqk/A
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6ba724b6fso996846a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792901131; x=1793505931; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvCxPvVOFJIOuLk7jZ+/YMB/FJuGHwhz7cBx+wq9rrc=;
        b=lk8Eqk/ANxqBoYF9wNEhF9PgvqNm6Y9fcRhO7t5ImQwmGN8F0Wo3LZnC+7EZyndme8
         6nWDV3Xzw2AYYK5ekdjIIERVB3Wp9MZMmT9HowWh8OsTXj+Z/UwCBdAWBkyQlCI1K4X/
         EncHtdyuZVmtfW4nIyMJQOnBWuL0L+vwDvTlXZ7OiG43EFy2w/YuEJ3NpmxU6DTjyyes
         rpnJDVwhnJ1lDK5Zz5bi6zioJ2W7ZM3TI5JwEuxo56Qyo7FqlHOdKE74S5TseXxXEc39
         WQx7ccXD7oaVLiBhbPuN5B+AlbBE/BgYwrrPjQN7JDwh4tzp6qqumTL/d/jVVaC9sasL
         1vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901131; x=1793505931;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvCxPvVOFJIOuLk7jZ+/YMB/FJuGHwhz7cBx+wq9rrc=;
        b=GBSwRC9G/idOoUUrit5F1SvrowD6sOBhF8CKxPdv8vrWIdVXoL7HYisqlHQHAqnqK6
         bVivtsEIMpGT6y/5zkrXSA/sgYMFWJXe5r/O71rI3unn43ESwlw0qTl8Q5EBgVN6bnhm
         ZmfWil/WyJ5xrMmiIbg6ozVlAVMl0xkWhezR49sKe1IzJhQERuQIWWC1+VPufJjOCEg4
         NypQ2Heyjx3gtMiqP63x3p6yU6c9equg0I2q1cwsjQLuDJ8W8uX0gSUvAPQQKmSAWSp2
         HC5LQy6yvS6d6ABGSHHUdpwTFvPsMd5APk1gIrZg9vpQgXx/Ugsb/DE1XvX8PPvEx00Z
         j5UQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/U1RHOOWPYsy/2/GbnDbe4rEymX5kws3WXQq9IBbrXzleY+yhT8WvDc3zZpbUZeNHZsW2+WcIi+f72Vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm3peuwjRo3bgk5IQ4OWtcIvStWaPzNDAD6z1bGI3oI/VbhKby
	grFk1WF+3RsQmUiHDjKYVhSnQPV00IxgAdigW35oBALfAPP/KETxDLTck/3pheU2csSUU5O64Yo
	ZZpUsJQ==
X-Received: from pjbme8.prod.google.com ([2002:a17:90b:17c8:b0:3ab:8c4:a67d])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc8:b0:3aa:f2c4:12e9
 with SMTP id 98e67ed59e1d1-3adea093fdcmr3009518a91.3.1792901130531; Sat, 24
 Oct 2026 21:05:30 -0700 (PDT)
Date: Sun, 25 Oct 2026 04:05:22 +0000
In-Reply-To: <20261025040523.678027-1-weiwan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025040523.678027-1-weiwan@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261025040523.678027-2-weiwan@google.com>
Subject: [PATCH net 1/2] net: Make PSP skb extension survive packet scrubbing
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

skb_scrub_packet() drops all skb extensions unconditionally via
skb_ext_reset(). It runs on tunnel encap/decap (ip_tunnel_rcv, vxlan_rcv,
etc.) and cross-netns forwarding (dev_forward_skb, netkit_prep_forward,
skb_do_redirect).

When a virtual device such as netkit is associated with a PSP device in
another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
decapsulated by psp_dev_rcv() lose their SKB_EXT_PSP extension when
scrubbed during redirection into the peer netns. Without SKB_EXT_PSP,
__psp_sk_rx_policy_check() rejects incoming TCP data segments at the
socket layer with SKB_DROP_REASON_PSP_INPUT.

Introduce skb_ext_scrub(), a selective variant of skb_ext_reset() that
deletes every extension except SKB_EXT_PSP, and use it in
skb_scrub_packet(). Scrubbing is safe when the extension slab is shared
with clones: deleting an extension only clears the per-skb
active_extensions bit, and the shared slab payload is released lazily by
__skb_ext_put() once the last reference goes away.

Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com
Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail.com/
Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Wei Wang <weiwan@google.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 22 ++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index af1cbc2799b7..027404d70c72 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -5083,6 +5083,7 @@ void *__skb_ext_set(struct sk_buff *skb, enum skb_ext_id id,
 void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
 void __skb_ext_del(struct sk_buff *skb, enum skb_ext_id id);
 void __skb_ext_put(struct skb_ext *ext);
+void skb_ext_scrub(struct sk_buff *skb);
 
 static inline void skb_ext_put(struct sk_buff *skb)
 {
@@ -5152,6 +5153,7 @@ static inline bool skb_has_extensions(struct sk_buff *skb)
 static inline void __skb_ext_put(struct skb_ext *ext) {}
 static inline void skb_ext_put(struct sk_buff *skb) {}
 static inline void skb_ext_reset(struct sk_buff *skb) {}
+static inline void skb_ext_scrub(struct sk_buff *skb) {}
 static inline void skb_ext_del(struct sk_buff *skb, int unused) {}
 static inline void __skb_ext_copy(struct sk_buff *d, const struct sk_buff *s) {}
 static inline void skb_ext_copy(struct sk_buff *dst, const struct sk_buff *s) {}
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 93c2f440b9ec..3eb0159129e2 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6380,7 +6380,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
  * operations.
  * skb_scrub_packet can also be used to clean a skb before injecting it in
  * another namespace (@xnet == true). We have to clear all information in the
- * skb that could impact namespace isolation.
+ * skb that could impact namespace isolation. Note that PSP skb extension is
+ * meant to carry information across namespaces by design.
  */
 void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 {
@@ -6388,7 +6389,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 	skb->skb_iif = 0;
 	skb->ignore_df = 0;
 	skb_dst_drop(skb);
-	skb_ext_reset(skb);
+	skb_ext_scrub(skb);
 	nf_reset_ct(skb);
 	nf_reset_trace(skb);
 
@@ -7431,6 +7432,23 @@ void __skb_ext_put(struct skb_ext *ext)
 	kmem_cache_free(skbuff_ext_cache, ext);
 }
 EXPORT_SYMBOL(__skb_ext_put);
+
+void skb_ext_scrub(struct sk_buff *skb)
+{
+	unsigned int id;
+
+	if (likely(!skb->active_extensions))
+		return;
+
+	for (id = 0; id < SKB_EXT_NUM; id++) {
+#if IS_ENABLED(CONFIG_INET_PSP)
+		if (id == SKB_EXT_PSP)
+			continue;
+#endif
+		skb_ext_del(skb, id);
+	}
+}
+EXPORT_SYMBOL(skb_ext_scrub);
 #endif /* CONFIG_SKB_EXTENSIONS */
 
 static void kfree_skb_napi_cache(struct sk_buff *skb)
-- 
2.56.0.257.gf7497c7d27-goog

