Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC65328C3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868733; cv=none; b=kh3Oxyh0tNs6CvCuiW90SVL/q/CVZ0W63lVU868wl9dnqnt+lF0pnN+Ae6yxjBR+tRJfJRGgMfRWlqASUqqE9CbuuwDKULtPqH1dA3LS1NfeDpLgWujbUvzRSEadaAUuF+ZoAlTaIVZ6YLL8cbv9fzxS1UaOPLL+F1BVBOmSACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868733; c=relaxed/simple;
	bh=2qPyWET3trPzTgVqWB2JmqQ9sSYlsEXWGFMqfTOJbLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/odMpMGDZPQ6k3OtLtd/plOV1HbM9leqOcF+7mjUpP1W/ust7ZcUt01NsK6pOZSp5APFdE43qvZJ9M8PGDHlpjBbQGdmKG+6Q6Xx1qqO6hRkvbR8NfC3i/e93O11vz9mXbSYLdJfNIFOsKEd8JC/qMqJSjZwGlBTl6TuPRfIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=Y12V9EFr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="Y12V9EFr"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-85377c8bc96so4078029b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788868731; x=1789473531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFIwOj0sP1GTzIynCtDi+0y4dNanYu++LBe/7IloGpU=;
        b=Y12V9EFrTt8W2D8L4UAC8FTUsrgEHncE2c+qTojFIiDe6XESmjofpzawzQsdRr50CX
         5/n/NB7Ed633mXoY4XFjd6j2UNBVHK2AK2mtQ4YJ930S7XoXwFqdav3zIVzPD1MbCJXD
         5HWBJ8VX1UU9c2ysshSWVViFctb9bxcTOEZHMJWtdl6sDfJ5osp+zmbTBH31IQ+ADAZa
         Y1JIHG6F6Y4Yx5gMt5wG3vph94k+SMVl6FjI/SYrspkT2lmRvIlDUFfZ08cMCMdGnPwZ
         v6Ict+HCEyLVpqXv+g6OkqZ+vjL0c7Z+PF9bssmAM1HWk9j5NTb3p1xtC+A9Mfn58fC2
         0MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868731; x=1789473531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFIwOj0sP1GTzIynCtDi+0y4dNanYu++LBe/7IloGpU=;
        b=BUin8Dd5z7KnEjqAU9kJPwTAURWjQKBbfOllqOubhiwxZIpjoN8yP3XvaAEoheExT2
         NLH4jWvDLC+vN1B3tiCpw9Wl6PKD/Z9sUHlbMls2xYoFYc1z353eKKpvNyaxyFF5uQzC
         zbraF2oAUWULCPD9cYWnilzdXCLpS9Ronlv7U13gXzxmCYOnaMDJ/zbHYnYTYrWBbLbD
         MNuUk7yI8OW/mJJlxd2QoqVoe6YI4UEv1tIAVvUnZKPZ/nPbmu4r404v+/5iFYGbZSt8
         EyookI7fQi0ZKZGXyBNKupVIyMQIcokBIiC1CftCdUD1Sy/IYd/uF8A8pF500Jv4X48f
         5Pig==
X-Forwarded-Encrypted: i=1; AKwUvBybqHMLRy0vzcdRNB0z/2ZxMbp3cKalRH644LIVAjbQD0NQzYL7bcum0BdPMRvE31+MOhdoe4lihyr/qL8=@vger.kernel.org
X-Gm-Message-State: AFuF++loMItPHtNDw5hacn1UurZkKJAmEwujvb//0q2Wh5f/UpjJv+KL
	Glrt//9C63t1d9jqtH0Ab2Lwtk1LdlGQeKUvD6als571pL/kyzfh0me0ItS9bHllXmw8
X-Gm-Gg: AYBFou0j3cGYRZY6VEaiT7V1jWnM3CHCgrGLu8deMDfnREcOA7b4ZpNNbriEk6bjykn
	1jiL26dm8pmGaVfo6JMujpIvajm5dT5YllGC2Dart4fblVtxBeAysNY6eOPQTqOOwxGYUSkL12C
	1vnkOLSM97kJlDFhQmbPvF9C2/BTcqymAXD7M32FULx1KGvRn4N90Cgi9BuiXpdczVysEMXz8j/
	2CJ9Uz4X+5aChctg2rE3uJ64VWufc+1P9cujtdOYOjq2cYuQQlrwDvtvI0eiiWEIdnCoq3RTRHd
	PNkcuup70gZlVzw2HOm0gS32gpNBC6nvlkgMVsyAo/TdqQAXI0o4EJ7gXBwGNdEGhmlYjrHJKSc
	pV7Jt5wpUeVQ01nPMjIr4GKAWKzme/d+xNT/vpGZMNJr1dmHpVr0yhHMreBUFYpC/YZhRjWkIrZ
	XgDvRK4OFJrK6xJZSO1mPbTHL1EncPb3jYYoF2jqBGVZqh/cXYSmUCB1+u3RC4cC6fgUXTqqy1z
	oJfdqIl5WWjRS+1ES8=
X-Received: by 2002:a05:6a00:3020:b0:85f:d76c:e23e with SMTP id d2e1a72fcca58-86169676529mr38474570b3a.23.1788868731079;
        Tue, 08 Sep 2026 04:58:51 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-863884ff3c9sm3512837b3a.42.2026.09.08.04.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:58:50 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>
Subject: [PATCH net v4 1/1] ipmr: account multicast table and route memory
Date: Tue,  8 Sep 2026 11:58:39 +0000
Message-ID: <050b58f7fc6b45da0fb12768ebb62d18fa46133d.1788784801.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788784801.git.zihanx@nebusec.ai>
References: <cover.1788784801.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A netadmin in a user+net namespace can create many IPv4 and IPv6
multicast routing tables with MRT_TABLE and MRT6_TABLE. Each unseen
id allocates an mr_table via the shared mr_table_alloc(), links it
into the per-net list, and leaves it until netns teardown. Those
objects were not charged to memcg, so the host unreclaimable slab
grows with the table count.

Account mr_table allocations with GFP_KERNEL_ACCOUNT and mark the
IPv4/IPv6 MFC caches SLAB_ACCOUNT. This matches the established
handling of IP addresses, routes and alternate interface names.

Unresolved MFC entries are still allocated from softIRQ with
GFP_ATOMIC and are not charged. They expire after 10 seconds and are
bounded by the socket receive queue; see commit 0079ad8e8dc3
("ipmr: remove hard code cache_resolve_queue_len limit").

Fixes: f0ad0860d01e ("ipv4: ipmr: support multiple tables")
Fixes: d1db275dd3f6 ("ipv6: ip6mr: support multiple tables")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v4:
  - Reword the opening paragraph for IPv4 and IPv6, since
    mr_table_alloc() is shared by both families, as suggested by
    Ido Schimmel.
  - Note that unresolved MFC entries stay GFP_ATOMIC / unaccounted;
    they expire after 10 seconds and are bounded by the socket
    receive queue (commit 0079ad8e8dc3).
  - Point Fixes: at f0ad0860d01e and d1db275dd3f6, the commits that
    let user space create these tables.
  - Drop the 4e16880cb422 archaeology paragraph from the commit
    message and cover letter.
  - v3 Link:
    https://lore.kernel.org/all/cover.1788765185.git.zihanx@nebusec.ai/
changes in v3:
  - Drop the table lifetime / unpublished-alloc / empty-reclaim
    approach from v2.
  - Charge mr_table allocations with GFP_KERNEL_ACCOUNT and mark the
    IPv4/IPv6 MFC caches SLAB_ACCOUNT, as suggested by Ido Schimmel.
  - Point Fixes: at 4e16880cb422, the first GFP_KERNEL IPv6 heap
    vif6_table. 6bd521433942 only wrapped that already-heap state;
    d1db275dd3f6 only expanded the table count from 1 to N.
  - Cover: unfixed evidence is Slab/SUnreclaim growth with RET:0, not
    a host OOM. The memcg OOM log is from the patched kernel under
    64M memory.max using poc.static.
  - v2 Link:
    https://lore.kernel.org/all/cover.1788622674.git.zihanx@nebusec.ai/
changes in v2:
  - Drop the shared mr_table refcount / list_del_rcu path that broke
    the ipmr forwarding selftest.
  - Limit the v2 approach to net/ipv6/ip6mr.c.
  - v1 Link:
    https://lore.kernel.org/all/cover.1784795838.git.zihanx@nebusec.ai/

 net/ipv4/ipmr.c      | 3 ++-
 net/ipv4/ipmr_base.c | 2 +-
 net/ipv6/ip6mr.c     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index e5f2b1c6150d2..b9c544d48c452 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -3376,7 +3376,8 @@ int __init ip_mr_init(void)
 {
 	int err;
 
-	mrt_cachep = KMEM_CACHE(mfc_cache, SLAB_HWCACHE_ALIGN | SLAB_PANIC);
+	mrt_cachep = KMEM_CACHE(mfc_cache,
+				SLAB_HWCACHE_ALIGN | SLAB_PANIC | SLAB_ACCOUNT);
 
 	err = register_pernet_subsys(&ipmr_net_ops);
 	if (err)
diff --git a/net/ipv4/ipmr_base.c b/net/ipv4/ipmr_base.c
index 867b24beded11..a0ec6d19a237f 100644
--- a/net/ipv4/ipmr_base.c
+++ b/net/ipv4/ipmr_base.c
@@ -52,7 +52,7 @@ mr_table_alloc(struct net *net, u32 id,
 	struct mr_table *mrt;
 	int err;
 
-	mrt = kzalloc_obj(*mrt);
+	mrt = kzalloc_obj(*mrt, GFP_KERNEL_ACCOUNT);
 	if (!mrt)
 		return ERR_PTR(-ENOMEM);
 	mrt->id = id;
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index 3f2ed9b77deb5..9d8116b5edb17 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1427,7 +1427,7 @@ int __init ip6_mr_init(void)
 {
 	int err;
 
-	mrt_cachep = KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN);
+	mrt_cachep = KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT);
 	if (!mrt_cachep)
 		return -ENOMEM;
 
base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
-- 
2.43.0

