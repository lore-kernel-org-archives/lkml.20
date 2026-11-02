Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661513;
	b=0tIQtX6hA115BxeQ+SuiRdRdwBwusdU6aaEASxgHKgRZ3pLdPnlKTP6LcQmPYQXZKQpf
	 R4RJ54WELhMYE3HqogT3f0aml2XWUbe3DAbI1sa0YSCfzxPHl0h6xooA5pOG3wQOT8xuT
	 tP6Sw+Yrt9W2X9rbZ3d8rDJiZbT4OrmIo2McSZC638T/wO8dzq5V6dWs9EAgSRj+WYdTH
	 p69c8xM6YUpAlAqGAZpjnIcHXGjSWNdeX6d7UPXlLSmmxd6SGr++nyuIRwGBjOI5OZrxs
	 NV8H9qyj+0zQYU9mKeAh5E9Q5dBaLJPlLSOQw0nM6zkr3uN6G52CFdX36HvFzs/yqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
	b=LYbH4PwnQn44VTbivGlO6PYussA27KHH8PJvh2XU5e7SzLeX6mNCeioIdjG0EEd4MVjW
	 RX/CaXCdGBUN+bTL3xMqiXz23znnPHLWB18fllUGeP3LFKfsGPHjAS34e8D214KrFWv4q
	 wWKLMNOYsKoz9Y4sHte8XJMLJtVYf8C2QJ65Vr5wNQh9yBMIouC+goUvfphHm6HOInM4u
	 OmHMRQeVrMPf2EzK+RBWS8sVPJpdfESRdFuJ1ml82b2bYVewN4suxZpOUOoJkv3JczC5S
	 c2mU7xjGay8oJoV3c8BHpOB97e5pv552irp/TYP55O7NWRu0naZUsIcY9KHg3s3hgGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oATVqC1Q;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C97606D832
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C97606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oATVqC1Q
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3698bd5392cso151417eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661512; x=1794266312; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
        b=oATVqC1QMEhoI1Ulhlhe3jyucxLPgzRzsyYEmjqj0Amsi21VsqaIjvDWIauH+hARoz
         haFOyPWMMrYnf0DRj19xNJ3iTIkUQnxcvKb7/boh58eEGckWLl0VU2h+WOzajFHa6mPC
         QeKdx/Y+7tY2xrxHCAUBS++U0Qqa5Y2/MpXYSnbyDdVai6CHPN5TgGC/B8cEUDVTBA/n
         B8dQatK7uCK1iUghwh3o9+LhzSJms81Z1OL8/RgNyDmIRhcU/TfWGtMPjLK+YU5FhKka
         HTmgXzadUIoTz0QdESEM9rIt0RncoHSpG/nLuXemsij9dPoIIc1UW7A0Cg6+8lktVtm5
         W4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661512; x=1794266312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
        b=ChhYQjplLUkPlUzdMPS85dSFjRNwc65RBvGGTbzNmdcMiCslTtrLWF0hfaMd5WUHZi
         NBs8qwKOk7y/clJa3et6kjOMAK7yPKb4hVM0Sgu8e1tli6YsW6P2Q41ptas+scSfc524
         m6KQSpzntrxn4NF/DOXZ/MlIyM6vvwqy0eVFGUshb/bstU7c31GoEopffzClqxK51ec2
         n1xibOft2zjL6q4vMMROG3afW78mbNz5bHvI3+e7OOaxF/zAN5GQwl7hqV7vjJmuI2r9
         20JUYrzPL02uUyozbQpnralIbcALty1c4+SWGm5wrzTj/R5H8R4ud9BUS/t23IX6fYT2
         4big==
X-Forwarded-Encrypted: i=1; AKwUvBzLvAFO7vbpF5biAo6djDbkPf+V3i8QtPmog+wNsnyq0OuIwPCkWVRLmoeCezH5kpXYtQYI+qTj2ux1cA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZKgTtEp6dT9fRTdGTMFpwbdUeIudR3EOMeVRu15GoThgvvVUr
	JCMd7ULvANYS/6CMEV+ziKJIlgE5/7pm8MohyXwTkmDrvHaKr7Ow366Az8lszLyy9Cr1ZEzYncY
	WwzxTy4ki71dlMzve54yrPCmi4g==
X-Received: from dlaj6.prod.google.com ([2002:a05:701b:2806:b0:1ac:f9af:14c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b889:b0:195:8fa1:b447 with SMTP id a92af1059eb24-1a9494d8f22mr20542156c88.12.1793661511373;
 Mon, 02 Nov 2026 15:18:31 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:26 +0000
In-Reply-To: <20261102231827.4088254-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102231827.4088254-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102231827.4088254-4-almasrymina@google.com>
Subject: [PATCH net-next v2 3/4] net: add skb_frags_can_coalesce() helper
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Add skb_has_net_iovs(skb), assuming skb->unreadable and net_iov-backed
frags are equivalent for now (with a comment noting the two can be
decoupled in the future if readable net_iovs are introduced).

Also add skb_mem_provider_compat() and skb_frags_can_coalesce() so all
multi-skb coalescing, shifting, and GRO paths can share a single check
across pp_recycle, skb_zcopy(), and fragment memory providers:
- empty 0-length skbs are compatible without mixing readable payload
- page vs net_iov is rejected via skb_has_net_iovs() (0 pointer chases)
- page vs page is allowed via !skb_has_net_iovs() (0 pointer chases)
- net_iov vs net_iov compares mp_priv (walking frag_list if nr_frags is 0)

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/skbuff.h | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e4..1e6e919c656d5 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1882,6 +1882,16 @@ static inline bool skb_frags_readable(const struct sk_buff *skb)
 	return !skb->unreadable;
 }
 
+/* Return true if frags in this skb are backed by net_iovs.
+ * Assumes skb->unreadable and net_iov-backed frags are equivalent for now;
+ * the two can be decoupled in the future if readable net_iovs in skbs are
+ * introduced.
+ */
+static inline bool skb_has_net_iovs(const struct sk_buff *skb)
+{
+	return skb->unreadable;
+}
+
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
 {
 	skb->next = NULL;
@@ -3763,6 +3773,54 @@ static inline void *skb_frag_address(const skb_frag_t *frag)
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
+static inline void *skb_mem_provider_priv(const struct sk_buff *skb)
+{
+	netmem_ref netmem;
+
+	if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	netmem = skb_frag_netmem(&skb_shinfo(skb)->frags[0]);
+	return netmem_to_net_iov(netmem)->mp_priv;
+}
+
+/* Return true if the memory providers of @skb1 and @skb2 are compatible
+ * for coalescing. For any struct page-backed provider (the buddy allocator
+ * or a future provider handing out struct pages), coalescing is assumed
+ * feasible. For net_iov-backed providers, the exact mp_priv pointer must
+ * match.
+ */
+static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
+					   const struct sk_buff *skb2)
+{
+	void *priv1, *priv2;
+
+	if (!skb1->len || !skb2->len)
+		return true;
+
+	if (skb_has_net_iovs(skb1) != skb_has_net_iovs(skb2))
+		return false;
+
+	if (!skb_has_net_iovs(skb1))
+		return true;
+
+	priv1 = skb_mem_provider_priv(skb1);
+	priv2 = skb_mem_provider_priv(skb2);
+	return priv1 && priv1 == priv2;
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
-- 
2.56.0.385.gac671c819a-goog

