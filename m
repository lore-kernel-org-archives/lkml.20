Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985985;
	b=EwlSbcp62Vlj2ZtG/K3MFx9SUZEeZM2wE0svg0ZgJXDWWsAkjzmQwJRodyVYo3/+foA8
	 F6h14JtEEE7MfMHMv7lqAG5MId+vtkGzk7iaAAu5HYTxj0tdQ6Ee38zse9dckYiHuR+Qj
	 sqXdczqVH5g2R+DN4FNHuZoNBMvrvXcVVh+IMR1DdXc83u1TSQnbxZIQMsH6bTvN+42+d
	 ti7xfiHAdI0+OVWxELXyGFcQWk7tER96wFaCLLnxa74/XU51x/i5Wra9PYW5X/hbNQh7W
	 sgY9yo74oUiaAF175JCejJXkEwEPpCI9J0sc17Q5qj8D3S1qI7ngQdoB4OmtV2b+6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p0x9++uNro13Vk87W18DExzirs+o51T454SovrEtgJc=;
	b=0W/JD3TvCpDAEG3X53F4pe/xV5RDXnwEtRnYVVp0/NMC7/1Bl8ojPqZ9N56HAzNYz/qt
	 CynVVyJtbmZmtIDs6e9W8aEcjYs1fIFn4NNTHTBSaRWkswVjwD625du3qZvSlGLejId7u
	 Mz6v3a8C8U4lsYkRmnyzi+6OGBQdPKJPhWB8K5SICgcfI2dwWL/EYVvfAGJuaNNN1V+Cl
	 q7IK99D0s0PHMBO+aEybgdYAtV8LA1DUj00s5dFINpjE9+N6q+AqHEim35pgSO4zBGMfS
	 y9ls5cUn491KN67Xiajm1RqKuG9JCOUyOy/fO0n8ys96h9RgabYB+ERsGPDTQE1e1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keZhQF5B;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58604606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58604606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keZhQF5B
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b32bbd39d5so6045757b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985983; x=1794590783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0x9++uNro13Vk87W18DExzirs+o51T454SovrEtgJc=;
        b=keZhQF5B6ATSgp0QFwSKtxGWxVnmf4njMjFAB6J1K6w761NPExQ0FS17bKGaBcL64F
         wb0raGvyDVzsOFKiYvPB5MUbp8cFFD/lyJdRvUGLrnqBEOuNrik2vA2tJIyz4kUnJ7bh
         Lg4629bBXvxfZXx5pW3LOUY9+vDPcYkTmCrYYZdh7/jc+MD8i2o86UQfOm/YDAusf0B7
         fw8N2SfhECK7iNZaJOAZLZYaNOUKUjw5/QZnDkGZNy1js3KV/K0mPpJ+NLi47+98sChN
         gz7z+Ok7raHogJBCm7LbvQ5qMkkF99kOiKgn8TiX22yZYGJbj0drGx2MLsXOB6Brlsvc
         U4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985983; x=1794590783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0x9++uNro13Vk87W18DExzirs+o51T454SovrEtgJc=;
        b=kkoMTBKqMmeGoxRtu2Oz/N3JUMm625vabidoDHuioqoUEYx4PxIK00PoXMFVwJELsE
         K4cHQtr02Rr8f5y+KufA+2ubM+vAZjupAhWJix6LC7QmmJnUkhWNuKPYK0q7t8Q6sotM
         Tnm9BKB7LwQDJnC93ZZbT5gw6ZkR8EZkVUL87qrtOW+csaO7u1zkv3IReXOb4MUivWFS
         w0kw7tjpBgfxAOGK7G0vTqOrcHhYzWfrrqVqZLRE7B3wdflP7rP+6dvry0s26sDIG7wX
         BIO2y6XJbR/PgUYtGqhdh4Alj/sV+gxiW2PZw//ge2mL+vYT/MSjLkFM1MYOMjl7KiSt
         aHHg==
X-Forwarded-Encrypted: i=1; AL+hErFRSJ9vhruOCbxI0iBkk7W3C8DyMyTbd/dqHzzr5b8KCdxZoIy/58L5j2r0hIHFl5kgbl7fGjpQvJkrxco=@vger.kernel.org
X-Gm-Message-State: APuU4Z82V3AgbQ6tRQ8fc7+QfXH1XJbGIhvwWsA8S4FvUenHiwcy8WKe
	HBLDfgZzvGz2XVbRQwU/c6R9BdU231mbJKI/Q7Jnzbf1H+xMpVzS1y4S
X-Gm-Gg: AYBFou1vxfs6kduP8vcsCp9xvlQUIxPnnB8grdt0zfqUqimBXfb8I9DuqXoDIIAJshs
	QDZWe5Ser9gDQEqSpLwWQaz3JI/BbnH5fsEZrMHt6FufDELoHemEJzOzDunFOYJBYrh8vUCMK5z
	irQo0ZUCfwSexKyhnkNBszREgI3pYeerlmlot22wQxLPPplz7fB+l+U0gbxu8OqJ1u8q2Q89DWn
	UwpuOELA1iCJASGk9L2ZgH9lrfSLS487OrK1c+er01pBDzMXAMpi9e+xdM4ViIfrWGPX88/ujBN
	YSFc8gJRaE6lKzEqUnGIpDluwedjkOdwyPY3T9tXheERCwTru2eKBQxITfM9Awh7iNNqPYQHI4E
	v3c3LUrAxYzBcOj7LIa7/Pc0mt70vJvxHrhRt9RVXeBd+3XXWDvCPQE13nfiHciCpNEHL94ytzE
	pxtfvCnO7tZFwa7oV6UYzoR7Khd7Ujt0vQ0igxPfFggKRNxRXQRp5JuLdwtl/TltfMVpEsN+IKn
	J4lthDV7j1K5jbt0y0to+6OzXDLr3gwM+i0V7mrhgbRoCdtkjzrSKFfV8eFCKRAkT7du6d/5rLx
	QmlpTtUoksA4/SiC8jykt+gwlWA1TYj5R41W51XH5xzOV/y10sKJkZA9R08v
X-Received: by 2002:a05:690c:660d:b0:8b3:416:b1ae with SMTP id 00721157ae682-8b3419158b5mr18015257b3.16.1793985983165;
        Fri, 06 Nov 2026 09:26:23 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:70::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c1353e783sm2325876d50.9.2026.11.06.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:26:22 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/2] mm/page_alloc: only skip kswapd nodes below their kswapd watermark
Date: Fri,  6 Nov 2026 09:26:19 -0800
Message-ID: <20261106172620.318113-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
References: <20261106172620.318113-1-joshua.hahnjy@gmail.com>
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

Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
NUMA restrictions") makes get_page_from_freelist() skip any node whose
kswapd is active to avoid piling on an already-pressured node that is
constantly churning to make free space that is immediately consumed.

But kswapd can also be woken up for order 9 requests with THP defrag
set to defer. This means that a fragmented node with plenty of free
memory will have a kswapd thread continuously spinning and preventing
order 0 pages from allocating on the node. This causes the opposite
problem of piling on pressure on all other nodes.

This behavior was observed on some Meta production workloads running on
2-NUMA systems, where processes with a preference for node0 allocations
continuously allocated order 0 pages on node1, despite node0 having
hundreds of GB of free memory.

To prevent piling pressure on any one node, only skip a node during
page allocation if the zone also fails the watermark kswapd is
reclaiming it up to. This is the high watermark, or the promo watermark
if NUMA balancing memory tiering is enabled. Make sure to mask the
reserve flags so that __GFP_HIGH / atomic requests in the slowpath
do not get a relaxed version of the check.

This preserves the existing fix to prevent piling memory on the local
node, while also preventing memory pileups on non-local nodes when
the local node has memory.

On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
and defrag=defer, I ran a process that prefers allocating on node0.
With a fragmented node0:
- Before the patch, 66% of faults were served from node0
- After the patch, 100% of faults were served from node0

Suggested-by: Daniel Hodges <hodgesd@meta.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5423ff4805f84..8e8a2c8d6e6a4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3882,14 +3882,18 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		}
 
 		/*
-		 * If kswapd is already active on a node, keep looking
-		 * for other nodes that might be idle. This can happen
-		 * if another process has NUMA bindings and is causing
-		 * kswapd wakeups on only some nodes. Avoid accidental
-		 * "node_reclaim_mode"-like behavior in this case.
+		 * If kswapd is already active on a node and the zone is below
+		 * its kswapd watermark for this request, keep looking for other
+		 * nodes that might be idle. This can happen if another process
+		 * has NUMA bindings and is causing kswapd wakeups on only some
+		 * nodes. Avoid accidental "node_reclaim_mode" behavior.
 		 */
 		if (skip_kswapd_nodes &&
-		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
+		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait) &&
+		    !zone_watermark_fast(zone, order, kswapd_wmark_pages(zone),
+					 ac->highest_zoneidx,
+					 alloc_flags & ~ALLOC_RESERVES,
+					 gfp_mask)) {
 			skipped_kswapd_nodes = true;
 			continue;
 		}
-- 
2.53.0-Meta

