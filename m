Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703206;
	b=HjNFLhSClsBCkpXNy7igiCxf60kkx0CFspPAVzv9LUVZr7Hu5dFonlLv0udqBzrL0eMO
	 PP5fMMnW1a5d/7qirUydzdDcPBNugHPENIJe+t9rnReQ2LiWLFPAkmDMjkuozZwMYCXJW
	 MBUSPGhSllRbkUDtGExR0nYh0eghTUEQhsFy2pJ6P0A/ee6SkBU6mMN0Y3+CIe+rxF9f6
	 uKhBsvO0niMI/8LO4pWnCGRmsvLR0vhqbR14+Tavh7Jt4O6ZHQqgBU5NDRWXXApUxtop/
	 duJw45y1kgmh7Z1E4bY5L0ja1hhwZik9xh9Pvq4B2NmwifMkXxyxdBDDOhHh8Ak84nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
	b=vgx+EjqniQPxofJA2mQahLQBCGw0MrBweK8DY23XisGo+c99lkcFhpnASnTWa8AR0lro
	 RtHxc+7Wt/YfNPJVJHcGwNtFbdfXx41iVxBpDA3bdNn0CGAVrjKIJBiYvcVxAtLyBPmgy
	 DuM5bjm4dasFunmjmLhwRTJlwzZ+hofLYizZZq9w015LrW1nBHvpMry/UmgQ01gWbIOpz
	 yf5/hB7HprWSpn5SRZVcLx9AslADfRooHZi8/O5xj9pdQhj7bf9xf3ZuD4z8w1JSeut3R
	 gDHUfQGDvpuR7yBKZLA0YT5wqflwje+sajkHrLZ3asFTS20/bGduFbs1X5H0PJtOaRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWFbI0St;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D13606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D13606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWFbI0St
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3545125eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703205; x=1795308005; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
        b=jWFbI0StH4kwRNmVtrdLlCwT0MVW1ZK0uool8mJgjrQfYZfjOozju0+oVOC8BlrtWf
         z2GbCNhAi/DwMrmZZGYVzvQxE2y6oPLYJ7W1PnoBItcx6N+BwxbtCJM6dDC3RngQgs0T
         20JS8sW+oYOYcV2WwzE9xMZ3EEnQZ7MRJSrClIQv89Fzs5tRDNeeMy3O7qlAylVSddjV
         RFzzz2F8aSfKT7FYSyLaFGgT1Pj4Fb7/DLCJzaSTTRww7zm8k7OVG0GfcL2h0foaw9X+
         kSQiAjUYebAsK0ElPSOqKpeb9QEAzwDv6557/VHW03wy9hD/uvF0iDcVvBXx4OaTDaog
         IjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703205; x=1795308005;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
        b=fX+XpcpkdproRQumzp7WkDw7OqWa9oYYGEkPSpUA5grao091iH0w8eQmTCQO8jl+gb
         FTs/wpeytno9ElnrrMlgwMWlLRT3ni4LE5K8ww5FH0MQZrYMOE3CJ0MXuprVOwzB32Um
         5kYHLOpzYF3cyhCb0nl6KBhv0TZCejRnJJWr1E5hVrQgkQ2yk2JAu9A9xkAOJdY4zFoo
         56bkRepWJF9gO4Nl1Q7E/q5DL8AwBoZHRTrUEiWznf9PrtwJ7FvlowEteB3J4qTJ6iAi
         pUnK9bA9XC5GTrTUG1A8B1xVaFp5b7WapYO7XCM14OLMQh5Hf7vGR5KDam8UgTJ7m1YQ
         2ohQ==
X-Forwarded-Encrypted: i=1; AL+hErFGTD0suXThtc8flPRGXiu1n8MYZIaLkEhgmZcHxmXj6fDPxxaAZXwcYpzw8P3YMcBIjibjMIt44W4qg7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nkKM7//8bHUDkiq2STkLuvYgggWtG5fu+rEF1L3CrBuhLjS9l
	USlSEE/hEE/PIsWqkfcCSjsqgKEHdYUKTEtfYU2twDzADk524/ihmPc/sJCl+2ZeuEfeZeL/2U6
	vCEL0+TsSiDMgobd4FksD8iV7Fg==
X-Received: from dldz2-n2.prod.google.com ([2002:a05:701b:4182:20b0:1b2:5271:f03b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f905:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b50311d32amr6524859c88.27.1794703204891;
 Sat, 14 Nov 2026 16:40:04 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:01 +0000
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
Message-ID: <20261115004003.3695475-2-almasrymina@google.com>
Subject: [PATCH net-next v5 1/3] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
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

skb_split() and skb_shift() do not accurately maintain skb->unreadable
when moving fragments between skbs:

- skb_split_inside_header() moves all fragments out of skb into skb1
  (leaving skb with nr_frags == 0 and only host-readable linear memory),
  but leaves skb->unreadable set on skb.
- skb_split_no_header() unconditionally copies skb->unreadable to skb1
  even if 0 fragments were moved to skb1 (k == 0), and leaves
  skb->unreadable set on skb when splitting at skb_headlen(skb) moves
  all fragments into skb1 (!skb_shinfo(skb)->nr_frags).
- skb_shift() does not clear skb->unreadable after all fragments are
  shifted out of skb.

Fix all three cases so skb->unreadable accurately tracks whether the
remaining fragments in each skb are unreadable.

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2e81aacc998b..4b18717e230e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4508,6 +4508,7 @@ static inline void skb_split_inside_header(struct sk_buff *skb,
 
 	skb_shinfo(skb1)->nr_frags = skb_shinfo(skb)->nr_frags;
 	skb1->unreadable	   = skb->unreadable;
+	skb->unreadable		   = 0;
 	skb_shinfo(skb)->nr_frags  = 0;
 	skb1->data_len		   = skb->data_len;
 	skb1->len		   += skb1->data_len;
@@ -4556,7 +4557,10 @@ static inline void skb_split_no_header(struct sk_buff *skb,
 	}
 	skb_shinfo(skb1)->nr_frags = k;
 
-	skb1->unreadable = skb->unreadable;
+	if (k)
+		skb1->unreadable = skb->unreadable;
+	if (!skb_shinfo(skb)->nr_frags)
+		skb->unreadable = 0;
 }
 
 /**
@@ -4730,6 +4734,8 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 	skb->ip_summed = CHECKSUM_PARTIAL;
 
 	skb_shinfo(tgt)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
+	if (!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
+		skb->unreadable = 0;
 
 	skb_len_add(skb, -shiftlen);
 	skb_len_add(tgt, shiftlen);
-- 
2.56.0.611.g1030f0b940-goog

