Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B835437455
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198540; cv=none; b=tjVHygnpJHali5CEx705x2XbRZ9XMltVwCTTmsc6mgXOgexuTR6GZ09XMl5TWd6cjSmcDzKdgACK6eOr+fLNSo7sMk+orUC4jO5/0+vpdO0zx7J6X+krFwWA7FaY22qhftvWLtKRbNKyAT5IK5gKV/36zy39XPS/KvcdXXx5Lac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198540; c=relaxed/simple;
	bh=tcb54Qnt2GyKPrrk5QtRoEjYtXqxoV0Zul100yL4uUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=if/Y2eUFCpHUjqoGRUEizfLLhr56c+skeXA4XEAR4f4Q1Depx9Uj0F3sQTPbyhOyKrTEgOju/pQBlJMFOL4qOLIT8wp9ftQNH3gWAQ8sv7CgzqMSH7JJADC1D3YGcQfHJIQGo1A/nKdjohhR8TSwGnIes5U8f5uC1p9evovmdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qeY5HF7s; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qeY5HF7s"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso40641a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788198536; x=1788803336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vU3022IZTIrb8u3t2YTCnTCe+NuA1eT/LdRMgAStZmk=;
        b=qeY5HF7sPN44DqHyjo9hb6XrePRfPGhYb9ab9rlbWj4ntt1aLxZZ4Iczm7WVQoO7LL
         ZRNQk247JwVLFjzHEEZMRleHvL7l1CWF/MrgYn8I6mbSd8TO4r1ul4zO+OyL3NZECVXa
         W8FZSwd7CXLr1sgLzW10sit2rVI2E8fdmNgMOn0Ia0Ow67LNZnHY57qQE6A77TI4lErs
         gNhJ9AivKD4QHER91YRkPyqE/ZBNXPageMaOMWSTZ47wFXZvipCZX5Hmub4eFJjNQ2hB
         S7aYnKIGYRBnCNHI6s9x7oJjS5cA7R1haR7fOsTH5cb1IhAijKFij4YJefl+pRr1K3Nv
         T9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198536; x=1788803336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU3022IZTIrb8u3t2YTCnTCe+NuA1eT/LdRMgAStZmk=;
        b=iqDxYOmdgusH5x9SWagRuQ5NmE07zNEyv1fDXzZua2G6ObYmlSq390KY+8ju/C/X2n
         nYEGeyVoQZf8upKBwXrwfr7Wis352f8IFDQlnkV2AmyXOll7raxJP7DLmHjw0UvGddD+
         /nr/fCr/GMo76EcMC+Km65yd/6KQLOAPBc/wJPzKAIEHfUUJ0NBOtTnhcFgFFO0NX3eK
         +hgyFWQS5b+XqkHyGYZjc1+++pCSI1ebnRnDiSu23nLZICET/q5XfQdPxMG3Py3TdaFM
         vWu8PEORwiKeepM5c9T3VLsbouIg4PwhwC9cCngg9SIlzitsfkIqzHsqrcn7fHZJ25tg
         tVBQ==
X-Gm-Message-State: AFuF++nk8Z4UeVSniQzCj81rH0gUHoHRFf6mdMhU1247SWm77eHxfGw7
	OAIKNFqtVvImulWzbwMhSmhFOrwLj3C9ubPS9uLZGsog75NPveTaZGKqSv28dsIeJawfNnx1QPk
	ZLLZl
X-Gm-Gg: AYBFou1iC66vfQZSq+ZKU5qmvhLU/UKDVFMA/T0+Q+NZNNNuX+5ynU0Qp4Ic18DDvAj
	gE0YPaJ3+LPFssLMwmDlw4fBqvOXnlL0JsaJZ2xqZ0MJFI36Ke3UG/tp5i0WGOuMkxQIyM7Ngkm
	YvEt9jsNWrr1OzBs7wl6iww3z5uAa7dn3jRloIXhAALzaTg8+v+9W0YzdB5RQsS9z6pIItE5VxA
	jnPbcKwdnykLDyCzSABkzS6mCT/6Yo7K5cnUmsWWR8CiOseXwly3wz9N2JXsqD8zJ7N+MlfKHGO
	YBR3B/iMQgcbr9OyfJKAUDpRB//ifHfK66AQwbuLKqM/hEtWtO1z50/8F6oFqz+A9fmb5daMswC
	y9ow6bGpVyfuo0eBXRgnmzynSz3Z43ZycQSwZCpTCMmuOUi7sS9PWrXF6ECPWhgpzf4cxCo/9jb
	YkD/l0k4Dn8MUyDKuLdfiAV0AOWmON+aBtoNs+Q+8TQBEv9OTfT98R
X-Received: by 2002:a17:90b:6c7:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-396d0e25905mr43315795a91.2.1788198536190;
        Mon, 31 Aug 2026 10:48:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm731964a91.7.2026.08.31.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:48:55 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: linux-kernel@vger.kernel.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Damato <joe@dama.to>,
	stable@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org
Subject: [PATCH v2] mm: memcontrol: raise MEMCG_MAX for charges that fail without reclaiming
Date: Mon, 31 Aug 2026 10:48:35 -0700
Message-ID: <20260831174836.3102406-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Charges that exceed memory.max and return through the nomem label can
raise no event and simply return -ENOMEM.

A non-blocking charge can hit the limit, get rejected, but is not
visible in memory.events.

This was noticed in a production setting where bpf_mem_alloc() attempted
to refill its per-cpu freelists, which triggered a non-blocking charge
while at the limit.

Commit d6e103a757fa ("mm: memcontrol: do not miss MEMCG_MAX events for
enforced allocations") added raised_max_event to cover charges that are
force charged without ever reaching reclaim, but charges that are
rejected outright were left out. Getting an allocation failure without
the corresponding MEMCG_MAX event is unexpected and makes debugging and
monitoring harder.

Raise the event on the way out for rejected charges as well, by routing
the -ENOMEM return through the same exit path that already covers forced
charges. The existing behavior of raising a MEMCG_MAX event on every
charge/reclaim/retry iteration is left unchanged.

Tested with a module that performs accounted GFP_NOWAIT page allocations
from a task in a cgroup at its memory.max, and measures the resulting
memory.events:max delta. Without this patch the rejected charges raise
no event at all; with it the delta matches the number of rejected charges
exactly. A GFP_KERNEL|__GFP_NORETRY control, which reaches reclaim, raises
the same two events per failed charge before and after, confirming the
existing charge/reclaim/retry accounting is unchanged.

Fixes: d6e103a757fa ("mm: memcontrol: do not miss MEMCG_MAX events for enforced allocations")
Cc: stable@vger.kernel.org
Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Joe Damato <joe@dama.to>
---
v2:
  - v1 raised MEMCG_MAX once, as soon as the charge was known not to fit, which
    collapsed the existing per-iteration events raised while a charge loops
    through reclaim and retry. Instead leave that event where it is and route
    the -ENOMEM return through the same exit path that already covers forced
    charges, so only the rejected-charge case changes, as suggested by Shakeel.
  - Add Fixes tag and CC stable, as suggested by Shakeel.

v1: https://lore.kernel.org/cgroups/20260827233119.411152-1-joe@dama.to/

 mm/memcontrol.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1271d390b617..158b0562e8df 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2656,10 +2656,11 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	bool raised_max_event = false;
 	unsigned long pflags;
 	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
+	int ret = 0;
 
 retry:
 	if (consume_stock(memcg, nr_pages))
-		return 0;
+		return ret;
 
 	if (!allow_spinning)
 		/* Avoid the refill and flush of the older stock */
@@ -2770,16 +2771,11 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	 * put the burden of reclaim on regular allocation requests
 	 * and let these go through as privileged allocations.
 	 */
-	if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH)))
-		return -ENOMEM;
+	if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH))) {
+		ret = -ENOMEM;
+		goto out;
+	}
 force:
-	/*
-	 * If the allocation has to be enforced, don't forget to raise
-	 * a MEMCG_MAX event.
-	 */
-	if (!raised_max_event)
-		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
-
 	/*
 	 * The allocation either can't fail or will lead to more memory
 	 * being freed very soon.  Allow memory usage go over the limit
@@ -2789,7 +2785,15 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	if (do_memsw_account())
 		page_counter_charge(&memcg->memsw, nr_pages);
 
-	return 0;
+out:
+	/*
+	 * Don't forget to raise a MEMCG_MAX event for forced or rejected
+	 * requests.
+	 */
+	if (!raised_max_event)
+		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
+
+	return ret;
 
 done_restock:
 	if (batch > nr_pages)
@@ -2848,7 +2852,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	    !(current->flags & PF_MEMALLOC) &&
 	    gfpflags_allow_blocking(gfp_mask))
 		__mem_cgroup_handle_over_high(gfp_mask);
-	return 0;
+	return ret;
 }
 
 static inline int try_charge(struct mem_cgroup *memcg, gfp_t gfp_mask,
-- 
2.53.0-Meta

