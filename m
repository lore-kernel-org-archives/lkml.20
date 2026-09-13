Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0937B032
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308759; cv=none; b=nYDEertNUv1pib1xM0XtR2O4X8HYdHSY+g17wXZ351loi8H2xCzIjOgBwzwHyElzSTtMWUhCfi4ntuIvH6wJ8m0+VHrAaX9Nd1z+Ni6nkfqUi2GqJ7i6mY2A7wp+c38Bd9T2+7iBQIsvkOWqO/9b/4WtqNUdu1IEAQlS108H83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308759; c=relaxed/simple;
	bh=OWAWubmf4ss7J8Yo4qOqfqNHNCDMJhQKtVRn6E/gf2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pygkAR9X6EY+99nzB6YGgguKOc6tLwH2cir+8wD79B3KsTVMfE+RTQtQxsmuGZ7VxEDeYPoOyO59yzszB/oAbdljaxTwOpGUDGnp2G+uHRbTi03oTrQDuyT+OT0DhlF8QtNcfcYDuowP72ACYIq5YlCQyV28Sz2QYu3fcVsJyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=sq44tiTC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="sq44tiTC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6e954afbdso18391355ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789308756; x=1789913556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wihnFaWb5iWKnqc8laOseCAwwlwT+036etp63VgAL8=;
        b=sq44tiTCI0EUo5x/dVF1TYevwolBzRo3VRJXwY42GcdaAoARQN6AhT5YINRaiHnB2A
         YPl4JQhNqXFr/P3MXWvhCwX0IswBVVqLGQ+y6Ig4UWKU29sLAUGv4ovLmiJ1QwGkRR/S
         j8VRqlkNy0mSDYn6vZw2mJfiXnN2md/7EDt7jmFig6u5nqJvgUhpzASUSIRvJGiWmNA/
         glI3UCcHqUnkm0vL6VRGkUC6kRFkIX2gEPJOlRsfuYgo2vpjhpOK3ubCO1ycpB7gE+0+
         fFyXbA7udDZiL9Mziea/KCpi1qRlhgDn9rIq5kbP+dqCq0hzLtK9U2rNvNcwNGdX9gGA
         t3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789308756; x=1789913556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wihnFaWb5iWKnqc8laOseCAwwlwT+036etp63VgAL8=;
        b=snw6qLWEIbSCLK8o1wCozc4Wb+vbK4NEeqVP4GgA+IKwIoK+obb+8A/zDPx1QdVxQ9
         TBV/Du6ZRUEU1co5A18FcFZc0wLU2I0Q4iVQmDnFcPSus7KXYq8YG7m5aZPBKzT/oVI7
         mgHH/sUb9rzHCO88+E70d7oWTQfBAmPpR5WXm7kV2R+HYZSxE5DD+mBzaqxQGe/uHt36
         UzTDm2cPy3IHzIdyRHhgRHBBQ8kRfY2kUzSRKVrYuX8LC2jUaKg4vOmOr3lf8uViWNaa
         PpKKvaTg6z8n724RRvnM/QpA2Bj75egEcEvxaYVZ7QrLlVTsnJfOmR3lCdG0uEgXkZF4
         3Puw==
X-Gm-Message-State: AFuF++kTkgONDxjFp6/iJeagYG30PZLn8Q4xnHLssD2J4+IRh1PR31JH
	nm9bM67OG9dgPJjBN10Xw2lWzRX2/iNU5u6wacWb4YUQbp/GMkaNW3nhL7Ksxnjqo5d5
X-Gm-Gg: AYBFou0/GletFKn5YX65R+Z1eCRRUyDHuE6FrKBiQxn8W+thlrFd1YYLJdYIoRpgRyA
	ScwEgyAFpCzBEhjhWNFjv/t0BqEHglmQQJKVER2SPfsop5W/dhahMFeSxq3zvSmNCRT8AAoDUng
	MNgkww4Gk3PgI1iXWQpLMWNfhdKdLc5CUzSSqY5duAzoPglWYk/Aq1m1ZxTZcCSogbWaS/DFz8W
	1Xib/swrbObeA/owx14nHsg17bGXAHP7+7Qy2YnKQ32yVRypwMprEilVHNqC7EsaoCcjQ0zJcB7
	Ny7nb1pKQVoEhUNTcV3S+KVyRURSE8ThUxK4hwOae3nf6Bir0akN+xt+CbveWuM12G4v4PZeBhz
	sZsrzndYr0nVq2qSOtCIdBmJhI1mbkyHrL+zMf2ElmWkeN+D/cN8L8PBQAodYgbeEY7iyuD+oCM
	Ccnqi10OtDAQEPRsUkfJbMuhe7XRAeT0TVR0cVlExzDjriK+7yHIT/PW1a9EZZU/W5wuJ3U+J23
	rlQn90p56BgE4KkXM7ZpyESmCigfQ==
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39d9c223eb3mr22110578a91.21.1789308755971;
        Sun, 13 Sep 2026 07:12:35 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm15481457a91.13.2026.09.13.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:12:35 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	zihanx@nebusec.ai,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	kuniyu@google.com,
	kees@kernel.org,
	richardbgobert@gmail.com,
	jiayuan.chen@linux.dev,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH net 1/1] net: gso: limit recursive IP-in-IP segmentation
Date: Sun, 13 Sep 2026 14:12:12 +0000
Message-ID: <a4f108b00c7d3c0997bfcee84a9e7e481c07ad5b.1789302084.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789302084.git.zihanx@nebusec.ai>
References: <cover.1789302084.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPIP GSO/TSO support makes IP-in-IP GSO dispatch re-enter
inet_gso_segment() or ipv6_gso_segment() for every nested IP header. The
only state that tracks this nesting is encap_level, which records header
bytes and has no recursion bound. A sufficiently deep chain can consume the
kernel stack before a transport GSO callback is reached.

The unbounded callback nesting was introduced when inet_gso_segment() was
made stackable by "ipv4: gso: make inet_gso_segment() stackable". GRE GSO
support predated that change, and IP-in-IP GSO/TSO support later made the
affected path reachable.

Track the number of IP GSO callbacks in skb_gso_cb and reject the 15th
callback entry. Thus 14 callback entries are allowed to complete;
GSO_RECURSION_LIMIT is the rejection threshold, not the number of
successful callbacks. Initialize the counter for each top-level GSO
operation and check it in both IPv4 and IPv6 handlers so mixed IP-in-IP
nesting is bounded.

Fixes: 3347c9602955 ("ipv4: gso: make inet_gso_segment() stackable")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 include/net/gso.h      | 9 +++++++++
 net/core/gso.c         | 1 +
 net/ipv4/af_inet.c     | 3 +++
 net/ipv6/ip6_offload.c | 3 +++
 4 files changed, 16 insertions(+)

diff --git a/include/net/gso.h b/include/net/gso.h
index 29975440cad5..2665acbb9205 100644
--- a/include/net/gso.h
+++ b/include/net/gso.h
@@ -19,10 +19,19 @@ struct skb_gso_cb {
 	int	encap_level;
 	__wsum	csum;
 	__u16	csum_start;
+	/* Number of GSO callbacks this packet already went through. */
+	u8	recursion_counter;
 };
 #define SKB_GSO_CB_OFFSET	32
 #define SKB_GSO_CB(skb) ((struct skb_gso_cb *)((skb)->cb + SKB_GSO_CB_OFFSET))
 
+#define GSO_RECURSION_LIMIT	15	/* First callback depth to reject. */
+static inline int gso_recursion_inc_test(struct sk_buff *skb)
+{
+	return ++SKB_GSO_CB(skb)->recursion_counter ==
+	       GSO_RECURSION_LIMIT;
+}
+
 static inline int skb_tnl_header_len(const struct sk_buff *inner_skb)
 {
 	return (skb_mac_header(inner_skb) - inner_skb->head) -
diff --git a/net/core/gso.c b/net/core/gso.c
index bcd156372f4d..e96ef6350064 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -117,6 +117,7 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
 
 	SKB_GSO_CB(skb)->mac_offset = skb_headroom(skb);
 	SKB_GSO_CB(skb)->encap_level = 0;
+	SKB_GSO_CB(skb)->recursion_counter = 0;
 
 	skb_reset_mac_header(skb);
 	skb_reset_mac_len(skb);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 32d006c1a8ee..2bd88ba05eb9 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1374,6 +1374,9 @@ struct sk_buff *inet_gso_segment(struct sk_buff *skb,
 	int ihl;
 	int id;
 
+	if (unlikely(gso_recursion_inc_test(skb)))
+		goto out;
+
 	skb_reset_network_header(skb);
 	nhoff = skb_network_header(skb) - skb_mac_header(skb);
 	if (unlikely(!pskb_may_pull(skb, sizeof(*iph))))
diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
index 78f50c93c536..391527a1a47b 100644
--- a/net/ipv6/ip6_offload.c
+++ b/net/ipv6/ip6_offload.c
@@ -103,6 +103,9 @@ static struct sk_buff *ipv6_gso_segment(struct sk_buff *skb,
 	int nhoff;
 	bool gso_partial;
 
+	if (unlikely(gso_recursion_inc_test(skb)))
+		goto out;
+
 	skb_reset_network_header(skb);
 	nhoff = skb_network_header(skb) - skb_mac_header(skb);
 	if (unlikely(!pskb_may_pull(skb, sizeof(*ipv6h))))
-- 
2.43.0

