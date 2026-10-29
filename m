Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308272;
	b=lbqAiBt6+3vk8xAjYia6sKXTRONBJCpnh4UKA9Hr4gPJ+KjHhbKxSYq6O9wImZIHiPWG
	 8d2/hKQ2DxJWERVgFkhGp3GTMJkZPsb2Easz5YcwFIVcza7k91rowUAu/ErdRqrzE1jkp
	 s5ViRKa4ZNLD5QpUSjQ0pmIZOYkBM2vn31/9ntdrBeXO+1zU0ScO5vDe3p4QAH1JW5xUV
	 YsdvZotNdetMgiMAxk4uMC9pd6gtLBzeurDEFoFDbX4DNoie20+wenKUIBWeuXbGeCqzM
	 RFSDFnjWollK+7WYXkvHqznqOcWs8D1dVARXJ0DS5stJVZd6qL9VZCstUnNX1+slvSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xzTZOWrqKv6fNEBwqt4RIGlP144euiJEy1QT6Ind6Eo=;
	b=SM3QJVIgCYlPzXeUYy6DoLeS45gK/VcUAZCrUKR652zdmxhMPF6gSiD8/nHdo9JdRWtw
	 dawC3QH3KUoSQf8i/BLicAABgLY4UBw/9/fbL0m/EW23y1Ac5XPJQXzaqvWxGqVJxithc
	 C5vnEvrl3UlmV14LV04V1rSCepzDlv180522w9XqDK2l/uSulxaNaKkMcb5wW4HQWkhIm
	 Q0qKrvUOlNlkiIXNgAiTXNn5geRnsUAiJA+iVVnVbSIaJYh4HAGt/Xg3TlBXaQRk2VRCj
	 R8COzO0tFeGDMZkitXef+0Qy2NOG4T7gu6yJy7qqx2tUu3pxjHrdxGclLHwyRpsiWew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=a4urQiFo;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE05B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=a4urQiFo
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df5e315bd1so7571eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1793308269; x=1793913069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzTZOWrqKv6fNEBwqt4RIGlP144euiJEy1QT6Ind6Eo=;
        b=a4urQiFoVINK9O9VOI3lbcGVtqq/7F9FLOoHBPfOSD/usbAXLimX9QiG6ZluHBqVBa
         EkKOk5r6E5GRzW7BVbU2iCKarQBtvRMHCaHfPY9hT/U1MVh+T094bBtSoPeQoO8+cbrw
         ybcO7WPu8XFxFP239b+3hgqR1pUzpkvPedc1xgiTQyaxsBwrCbBocrD5/cg5sNCDUpNI
         RLlWimnVWqDZBG2d+w7/skprg0t5DmXvuOKjtn0qi1k54L0dftPv+jyMwZXU4RCU8Qln
         BvpbIqdZr+2KEHS7cXzpfFTd8ilHCyUkaZ6RNKkLBzntIrArnwEvzUHOMAmYmBw3lhVU
         TAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308269; x=1793913069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzTZOWrqKv6fNEBwqt4RIGlP144euiJEy1QT6Ind6Eo=;
        b=AKAvsBhKUaxMQYN53Gg89q5FqB99J72oy/SU1bc2uhnDtjQZQGGtXHRNgss0C6JjpO
         iiekHCL1UlBBCEOez6JxfHkz0OAOR3avHB9s8YHKpyq7aDhwbO5q24uhMHwzS+H1gwjJ
         SLzHm3/ZIlJu++XZrKYlLnC+C4Op0bgzL30oAXHTTRlAFgjk6r8n5miyE3mxX6PEr+/l
         wGuBGzI40pmj4Y5EypuglIY+ZQu3TO4SiNUAxuFlgMhu33kVOVwvtRG9YfA2l/13tjXK
         BWaFhn/SsO8YPK8pdmvX8eqRFzjVFA2ZtBATUu1tSVJCuvEJXO9lRu+D8TH/17mb90Is
         ytLg==
X-Forwarded-Encrypted: i=1; AKwUvBw7y+MQs8rbvc8VJGk2N9L0tSWOpRoy70/ojFY0xg/zlrRZozGMgFZH0XVValWw7eO7cTLSi7i+kiaslo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh5Zk1/9rz0l+nivfZERhZkljx8x0p0RgJ/ZfLbH1kDZTyyhhU
	7mH4sJjVnQIG8D6FAWE/W0/ARVcrcj/Dk1KGiRYLAXKeSGAzrWCoaf+p+sPWAWxqTx0=
X-Gm-Gg: AYBFou1DLImCy82GcmELZm/wNdLAVdrDU8U3dGMAyhKN58KV4PsCcqiC6PQQ1R/yKjA
	GETugyevbCJKZ4bQOlykYjnwxex0hV2dpH3jgl6nKDSaz9yFy9OjF2nfEwQApzFG1XaaXFpj6fb
	pQ2QtJf1742j2a1blKR/ErxuTY8IxhzNY7pwC75vhw44q6FIOh4vpJqVgFFYGji/+jSSnLd5wh6
	PAx91dTmdvCCUP60ToN6HjC4vhAEkMNYZ37PAntCKOq8bK1l5CjJ/gua05zEAaa9sezvfrodsx9
	xE5k+klvnXNQwUB2hsoYgD5TGijiP2v7pYde2nBhJCMYLSb0LC0kgS9Q2bGSq3v0EP+gxsxQ7je
	bm7KELYm9V3zapB7SOKMNvO40yTc48Bt/v4FZdtcxgGdbN8HjauOvcPEyc6eGwLSWwfLit/3+/f
	cNeF/ZkMtfY80CCR5tO62RbnMb3+83JdwPMndrThRagR4dCqe1Mft+wXwReCCCXCNTOQVL0XhQY
	8X7+Lq9SaYXJQXFhXsRZnbRLiLtmJYM0HdF0zt6ZK1LHxvbPhet74LgAxfs9yWh+/x4UW/0yHIB
	kc/FSaUcrCVBVpqHfOGiBIJssV9LUo+h6ShXiP9lN9TrSdNEVWtFjl+xGO3OBos=
X-Received: by 2002:a05:6820:1381:b0:708:f388:af75 with SMTP id 006d021491bc7-714f24d6463mr371100eaf.46.1793308269535;
        Thu, 29 Oct 2026 14:11:09 -0700 (PDT)
Received: from jkain-desktop.corp.nuro.team ([64.124.43.154])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e77c8sm498519a34.2.2026.10.29.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:11:08 -0700 (PDT)
From: Joseph Kain <jkain@nuro.ai>
To: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kernel@vger.kernel.org,
	Joseph Kain <jkain@nuro.ai>
Subject: [PATCH net v7] net: stop defer_count outliving the deferred-free list
Date: Thu, 29 Oct 2026 14:11:01 -0700
Message-ID: <20261029211101.2089535-1-jkain@nuro.ai>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the llist conversion, rejected frees retain their counter
increments. A producer racing the counter reset and list detach can
also leave a count for an skb already drained. Deferred freeing can
then remain disabled while the list is empty.

Undo rejected reservations and subtract only the number of skbs
drained. Allow admission up to the configured limit. Retain the
halfway notification and also notify when the reserved count reaches
the limit, covering reservations published after an earlier purge.

Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
Signed-off-by: Joseph Kain <jkain@nuro.ai>
Assisted-by: LLM
---
For 6.18-7.1, apply the drain change inside each NUMA-node iteration
of skb_defer_free_flush(), using sdn->defer_list and sdn->defer_count.
Initialize n to zero for each node.
---
 net/core/dev.c    |  8 +++++++-
 net/core/skbuff.c | 17 ++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..7843ef511d7e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6937,16 +6937,22 @@ static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 {
 	struct llist_node *free_list;
 	struct sk_buff *skb, *next;
+	long n = 0;
 
 	if (llist_empty(&sdn->defer_list))
 		return;
-	atomic_long_set(&sdn->defer_count, 0);
 	free_list = llist_del_all(&sdn->defer_list);
 
 	llist_for_each_entry_safe(skb, next, free_list, ll_node) {
 		prefetch(next);
 		napi_consume_skb(skb, budget);
+		n++;
 	}
+	/* Subtract exactly what was drained. Never store an absolute value:
+	 * mixing one with the relative updates in skb_attempt_defer_free()
+	 * lets the counter go negative, and it is read as unsigned there.
+	 */
+	atomic_long_sub(n, &sdn->defer_count);
 }
 
 void skb_defer_node_flush(struct skb_defer_node *sdn)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 4aea06d5167d..b1d3fd783283 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7388,8 +7388,14 @@ nodefer:	kfree_skb_napi_cache(skb);
 	defer_max = READ_ONCE(net_hotdata.sysctl_skb_defer_max);
 	defer_count = atomic_long_inc_return(&sdn->defer_count);
 
-	if (defer_count >= defer_max)
+	if (defer_count > defer_max) {
+		/* Undo the reservation. An llist_add() does not release one --
+		 * the skb stays charged until a flush subtracts the batch that
+		 * contains it -- so a rejected free must undo its own.
+		 */
+		atomic_long_dec(&sdn->defer_count);
 		goto nodefer;
+	}
 
 	llist_add(&skb->ll_node, &sdn->defer_list);
 
@@ -7398,8 +7404,13 @@ nodefer:	kfree_skb_napi_cache(skb);
 		return;
 	}
 
-	/* Send an IPI every time queue reaches half capacity. */
-	kick = (defer_count - 1) == (defer_max >> 1);
+	/* Half capacity, plus the skb that fills the queue. Equality alone can
+	 * be consumed early -- if the producer holding the kick value publishes
+	 * first, its purge drains only that skb and the reservations published
+	 * after it match nothing -- which would leave a full queue with nothing
+	 * pending.
+	 */
+	kick = (defer_count - 1) == (defer_max >> 1) || defer_count == defer_max;
 
 	/* Make sure to trigger NET_RX_SOFTIRQ on the remote CPU
 	 * if we are unlucky enough (this seems very unlikely).
-- 
2.55.0

