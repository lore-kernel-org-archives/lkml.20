Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C042B3C09F9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151087; cv=none; b=k65IBd95uY3/gmav3xuYh3mVQNZOzmVtkhWt4tYPq4SS8YwpcrJe0/bskM9i0E8qERE003C1cx8DoBVfsDWFq2W2XN9EmQw+P+0kj5EYe4GwB4189m33Dw2JVg5ZcYg9WP0WPlSWJH/hNICbvOCK7VLVpZsVNjJlAbqUOiDHfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151087; c=relaxed/simple;
	bh=TSPukoHwuGOtlLSCKsfDe7vaSQqehsHcKRp+PP2zfx8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bKvdnK6D6bspskUkNMMcmxq1k+G8KxikFDQDQibAF1sADLzxmf/tsEVUVmSwgd6wJO0ib3wVbZU7eghD6sBUCbzk9RG//3IRxrijku0YZGR2xeYoQhtv9ekkHtdIdmAuXRnPXF7KjozwRRBsj1M4C7agPuVjMpR1VOTSUxzoqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq9BLN8k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq9BLN8k"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so21386725e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151084; x=1788755884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGoBedQqRgsKG7wNi45We7BTQ5QQ5aS5jrqdXZyohA0=;
        b=Aq9BLN8k6bsE4sId3E2D0ABNkFXHZiC3HNXKofNT33evMqYLykTK9GFxD2WCWiI2PB
         MHnFmKFT0nIEvxN0kRpImutCmbe8kT9D8wz9uhCUlcwpan0jhcV2LZ7MlbTcB65FLtRt
         vTDA50OwF8Fr7kVXBFAq3Tj8ivdRTENez2zX2YmCF61vg8gwKj23S8Iquvz8PwFZNu77
         A6HoJ/53Krzhi1E9rZVBuDk4IynVtTdWpJaDn8QtB3ymLxzfFZ3dzfkOBx5nnjnEzURk
         Pgkg0MsLA/Cijt1vCz8cvNFdYBf/xSSw76/flw02sS8zEFvlDNC0WCBxgnuHJmhSUxnz
         zQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151084; x=1788755884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGoBedQqRgsKG7wNi45We7BTQ5QQ5aS5jrqdXZyohA0=;
        b=eiquvzBkIJaOg/avJv2Vl7DVzJQECmxCv/i3yd/CtATXC20Cs8Y4qXyZiF3oAZm0qV
         amDoFomFdknC4pvNeC3juLGrWtPfLbPdlarlxesOPXVGsqtaUqCmji1nls9AjKR8cQtb
         8gNC0oub1qOhMLInKX1ruZO7lTMKDqE+3oTTqLET3nFgzu7lVlHKyQljDsDv2pV6VGYn
         +h2c+bXWuBIUvWI/DQL/1GeIwy7SdGUjs+t3ttwHHC9AJtNE3/yYUjmBhrd8Ka0q6ChK
         8mctUX761cB79rTgwD8j3ffEf8i5YD3nSybum0bhSW6t10impOm91iRFM8gp2HizQVTC
         j8Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqkevKK8Ah8Tfv/LQ1jWMY6M8BYMjmMeg/g275EzdKzVVfapH3B01yGSQJiUwMCfIePeSuknu0nQoaAnYw=@vger.kernel.org
X-Gm-Message-State: AFuF++lBmFukDZ2vlkMlmNVLW96A2C4biDQIt2+54/E9j3UN1mI3fJrV
	0H2s7dFVffyhyiXkXvUYNLfPSaQsWxogQvAtTBRTGTztb98G9F0TjsEw
X-Gm-Gg: AR+sD12Ub++PbFdAjQeEIe4hQW14E41NmpJoNmrQq+xD8Cr7knn3QkmAD7X0wfojj3H
	GKVIntEfx0ms3iGnFWLK9sZAEbJzh9y01LmQL0PlfEKq2AY3w1AurZB+i9XH5j5RcIL9ZxgAgS8
	+I/3/p52+frrce1JwQlu6l54iZZM5SpG/IQWXb5u2gptAKeO8auM316oP4iTw7v5rNAlcLAXuHn
	sB0jJBeWflpmDw/1HsowW71b5SH3nzz7x6xQjKn2VKxzsgXeiwoeN5vRY9y0Atg/8lztBlrzh7u
	Ks4TO4CTKx4HQwdwy5N+t7puiC1oGth1FTWqYO4fH9X2dvzOM0a4nHL/ipdOwCq1gIfQhoQlbQ5
	aCc7by4r8Kfrroj90AOev5EXSqk/T/G0Y/SwtIWkzHcUh46GAlfCf0Zoxn+gQIbWFYd6rXEyS9g
	JLFRzTmuatvPF66Bql9f+iGetvhCC8+BTEDPVl5JdG0FA0XxRH8fPQJO4Lds60sVWKkWqNZOt6F
	H2bEdsRImgf9OsHve6NEviJPwPYWfKOhgk+788VmU27/EoPhhH8lfqQ9bP+0lTMKmenrKQlp1dX
	0H5f544jwgZPu7owBb+Lu4SqUSv2YmG2by5v6WBscEWTcEWQFtQB5cizY4AwjNNNng==
X-Received: by 2002:a05:600c:1c29:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49cd940c70emr9007825e9.2.1788151083769;
        Sun, 30 Aug 2026 21:38:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm79057735e9.9.2026.08.30.21.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 21:38:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Lan <lanbincn@139.com>,
	XiaoHua Wang <561399680@139.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.1.y 6.6.y] netfilter: nft_set_pipapo: account mapping table allocation
Date: Mon, 31 Aug 2026 06:37:55 +0200
Message-Id: <20260831043755.29692-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 69e687cea79fc99a17dfb0116c8644b9391b915e ]

The pipapo set backend data structure is one of the ruleset objects
that upstream changed to use GFP_KERNEL_ACCOUNT for memory accounting.

The 6.1.y and 6.6.y adaptations changed the other pipapo allocations,
but omitted the mapping table allocation in pipapo_realloc_mt() because
that helper does not exist in these branches.  The equivalent allocation
is in pipapo_resize() and still uses GFP_KERNEL, so the persistent mapping
table is not charged to the allocating memory cgroup.

Update this allocation to use GFP_KERNEL_ACCOUNT.

Fixes: a0bb39980635 ("netfilter: nf_tables: missing objects with no memcg accounting")
Fixes: 1c4f72fa9699 ("netfilter: nf_tables: missing objects with no memcg accounting")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This patch is based on 6.6.155 and applies unchanged to the tested 6.1.y
tip.  The test configurations and full serial logs are retained in the
audit dossier.

A/B tests with a 32,768-element two-field concatenation set left two
262,144-byte mapping tables.  The fixed kernels charged approximately
512 KiB more kernel memory to the child cgroup:
  6.1.186: +524,288 bytes
  6.6.155: +516,096 bytes

The two-page difference on 6.6.y is within memory.stat measurement
variation.  Ruleset loading and element lookup succeeded before and after
the change on both branches.

Tested on:
  6.1.y d64a499eea6b62b5121beceed9e8a1f57b00d863 (Linux 6.1.186)
  6.6.y a4a971135a2ff64382ae4235b3ae60503bb1036a (Linux 6.6.155)

 net/netfilter/nft_set_pipapo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
index 7c8d28a031ad5..8ba76eea3eb18 100644
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -705,7 +705,7 @@ static int pipapo_resize(struct nft_pipapo_field *f, int old_rules, int rules)
 		return -ENOMEM;
 	}
 
-	new_mt = kvmalloc(rules * sizeof(*new_mt), GFP_KERNEL);
+	new_mt = kvmalloc(rules * sizeof(*new_mt), GFP_KERNEL_ACCOUNT);
 	if (!new_mt) {
 		kvfree(new_lt);
 		return -ENOMEM;
-- 
2.39.5 (Apple Git-154)
