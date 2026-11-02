Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661511;
	b=ztrAjLPkwzGIeasPXx9tP9ikVxXRw3a91bF2E2MqLHbt03qKeuCd7aLbu5ZksmCbC1IU
	 GBc/Ef45+AUjr4uGVnuF3QwhYn5CRz8/AcIX5+C4taggiSnnXDA+xjdq8FcJ8eFhScuik
	 cwnW7qqSp1jCk2PlX+g0Yl6KN/shlEHnj+9oZyMPTf0fATvoeXhy1rh1maen8iMgUfyNx
	 ZupTV9my46ZkwgpOSpa9jn94BS0t1VjIdlIlh7GmYiCybZUSOR90ncdf6W3Um798LTj+n
	 lhA58fv7NVsJu1XOZ2prizHZO2LtJAizf0R6vXZs+/uoIYC4SVDhBLyJPzb83PTbgYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fdn28Y1abRWwiiybnob+FFic6b5c6iPaoksPj551sIg=;
	b=nOHl7E485QBcWINEgGF5hZQyJGX5pkVIRNmOqhVL5+P0MF/2u/9Hc9mgRnZ94qrXE30O
	 B9qln7AkBxpdKjvDL74bmbNhQ2Ce4wpjMhB2SkC5FTvLhhaOrFUXbKONb9K11T7UMOQya
	 ACVdz7x4RflhImOc8guD9uvqJ8YuVc9iqmLcT8Q+r70+h3ALA4xO4FNXYUY66bTCpFP55
	 jV27v9u8awIAB8xbRIu9Luw+DKAiaQV3QpDQehhu10q6bLhUUK75jtWzgD8ZoNj3bJ2rZ
	 nJxSjG8dLZv8jvJDO7MHQu1TWexZZBIQ1lFUyDqL84q7ptnE1XX34/kI99sGML+bDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p24lSbe3;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA73606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA73606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p24lSbe3
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so8551393c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661509; x=1794266309; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdn28Y1abRWwiiybnob+FFic6b5c6iPaoksPj551sIg=;
        b=p24lSbe3zghPulirC9xnISg5IUD2vCoooPAlZZ0OsC3AkubLJwLwbMyzkwoeuleulr
         /yklYCkXs/As9gRREyNQh1RhVYQHQKD+N4mLqqT66kFe1/xg9PG1dBbohBRetw5KAbId
         cIVUu0cupZ0Y7lLJT4AfPCHh4g6PTxvEts5sA/N9idleAqMhw7WX0hl3bGiMnnarS9R4
         ShoChii6oH/JJErOdRWjCAz3iR2kXRhDGU8R7HvfhO+H1ywUL7mqaioBJrsn2mtqkCPk
         fQrwaFSJMLbN6WQZ2ekF54h6eDK7Kwe5RS3qDqdlTb/IemplAgqgk3VXvRgXN0K8bd9p
         5fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661509; x=1794266309;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdn28Y1abRWwiiybnob+FFic6b5c6iPaoksPj551sIg=;
        b=zuNOG1zxfLDktXCu41lTS7ZrQH45ajcUFxBh8CBzsCRgZIByQdWQ1O9j3fmJbpODab
         YfuxcAYbncd+pnWKrBBEbOsiGP0O4JGY0ZZalHqaFWtv5Mlv1RgTN5MfNOdxF5vWTu2c
         0gdBS/HqcoTZaCDrswLI3GeSJKQmTCxWq3zmQzARtaoXBUig4LnQtmOJdlhjkh3yrUhf
         D02ZR2D/Ckl7y049mYN2GgippxUqJLVuRC1SCMzcPL84oeNb6+Kc3wi7T1eXLBuA5bRS
         vyy+08Xop8vng8C7jyhDSRLqUv1PMSQcmTntKWBOD8k2TuigSlzM/nJdfvu/Ky8SbKR/
         +SyA==
X-Forwarded-Encrypted: i=1; AKwUvBxtbHov9oSvKQtWkPKUOIVkFVmvzGvwknqwkjbZv+/H9HRyQd2qpiEAGNzVVt2EjPlZPTPowL/eVCos1xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZSoPR6SGevFLb6vI55TfYx7tuQPq4sD/Y5TbJQpDth2oV/L7g
	NEZxnIQ99AR+7b1uGqhDQFDWCxhKd8DA9SZ4YMwPghgkGPFDBKPbKYoCsNJTBjYn2bcVcEqeuoH
	VF2YnzK3r+IpSgjrj2l7GCprIRQ==
X-Received: from dlbtx1.prod.google.com ([2002:a05:7022:fc01:b0:19a:484d:c761])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:418d:10b0:192:e5a8:6bae with SMTP id a92af1059eb24-1ac5e6f5eaemr17575373c88.40.1793661509182;
 Mon, 02 Nov 2026 15:18:29 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:24 +0000
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
Message-ID: <20261102231827.4088254-2-almasrymina@google.com>
Subject: [PATCH net-next v2 1/4] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
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

skb_split() and skb_shift() do not accurately maintain skb->unreadable
when moving fragments between skbs:

- skb_split_inside_header() moves all fragments out of skb into skb1
  (leaving skb with nr_frags == 0 and only host-readable linear memory),
  but leaves skb->unreadable set on skb.
- skb_split_no_header() unconditionally copies skb->unreadable to skb1
  even if 0 fragments were moved to skb1 (k == 0), and leaves
  skb->unreadable set on skb when splitting at skb_headlen(skb) moves
  all fragments into skb1 (!skb_shinfo(skb)->nr_frags).
- skb_shift() neither propagates skb->unreadable to target skb when
  shifting unreadable fragments into an empty skb, nor clears
  skb->unreadable after all fragments are shifted out of skb.

Fix all three cases so skb->unreadable accurately tracks whether the
remaining fragments in each skb are unreadable.

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f6764117243..dc761ceb4d204 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4225,6 +4225,7 @@ static inline void skb_split_inside_header(struct sk_buff *skb,
 
 	skb_shinfo(skb1)->nr_frags = skb_shinfo(skb)->nr_frags;
 	skb1->unreadable	   = skb->unreadable;
+	skb->unreadable		   = 0;
 	skb_shinfo(skb)->nr_frags  = 0;
 	skb1->data_len		   = skb->data_len;
 	skb1->len		   += skb1->data_len;
@@ -4273,7 +4274,10 @@ static inline void skb_split_no_header(struct sk_buff *skb,
 	}
 	skb_shinfo(skb1)->nr_frags = k;
 
-	skb1->unreadable = skb->unreadable;
+	if (k)
+		skb1->unreadable = skb->unreadable;
+	if (!skb_shinfo(skb)->nr_frags)
+		skb->unreadable = 0;
 }
 
 /**
@@ -4447,6 +4451,9 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 	skb->ip_summed = CHECKSUM_PARTIAL;
 
 	skb_shinfo(tgt)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
+	tgt->unreadable |= skb->unreadable;
+	if (!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
+		skb->unreadable = 0;
 
 	skb_len_add(skb, -shiftlen);
 	skb_len_add(tgt, shiftlen);
-- 
2.56.0.385.gac671c819a-goog

