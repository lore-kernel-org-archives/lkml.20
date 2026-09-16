Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF24E1C7A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592764; cv=none; b=jpSwKfLAW9cYW/JAWMkoeCK1mNTi7koi6RMxh+YuPu32InMz33pmCneb6C/AQ3I8Wi3UGLkbVAgFxsedwjcjUtWs5F+JK1SI4RObI9WyRiql4G266DsKODF7Ysr39YDx4FeCYPa5rRSeEvcdsVhZZEXYkUU5dt06HWoM3Ue45eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592764; c=relaxed/simple;
	bh=IQNpo0voZl44flDTr/7bJrTih9RnNbJtVb25BrCwX4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlrUn8LaD7xFjY2Bmg4ysDamJrUfRXYJ9NFCacG/TO/Dp7+PxdjJzyYtpZLkckTtmt2XfbaUpkU/Udeslu6eQVLG9cPT3T4KJghqGIu771bff+QuKb23nt741KnUt1amfjNd04gLepZKBXg8DqYc1AT1QCQAXfGZjklvUWJsdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHPK4bAu; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHPK4bAu"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3a9768so157374b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592757; x=1790197557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzgD7tpJ/TV5FYPH6ulvzWsXqYOY3DYINqe8nFmUw9M=;
        b=aHPK4bAurX8scni84dKccg0rLHmPsoLmjjaVuhlPtnrHrP1Rko8oJF3wSb15S0yMcW
         AlAlcHXG3KoTvbmi78oLTlkFhwWeMdc0DxHLc56WPvrdRnb0LbjtAGtKauHFtgjx5zAG
         W8FXOB3CttFaKBpaWmRw4n4gwDQR5Q3qnnzqjqvUZE97gs31dBjswkrvdEaLFmkvZz6m
         LYzfqNui6IUWxlBJUZWPWf9mHTPHYy9Q5mRpdiaHClVSqEP7Go/6A8C2muguFQZbuod+
         +TKahYvAsVSaaYqD+NZ1abceH4BWiMGAnWUSHz7VX0AUMPV8hv+t+CfWPeO7N2jAlF9f
         +dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592757; x=1790197557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzgD7tpJ/TV5FYPH6ulvzWsXqYOY3DYINqe8nFmUw9M=;
        b=QjU7t+74QRzjSxphE7nnbbE+sv4fKUg1DG/K7lctu0W27kJx2sjr6xKNL+So2nbaWU
         0ofLD03zrwJ0UZ1FEXCbEfG7XD4xSvRFfPwl3cv1os2RCzyAOg7qaWOsqdediRB7Putx
         D+cjssdxX3XBwkAGrhkWoEDW/43PvGqFADWdlyycvYfd7Ip+mRHuWaQSHXsQm6kuFFd3
         AaD3TjkKfr0J8aYXquArqjGFeeDdeqxw8SBLEWFGYdOKb+fsUb67kZ6RxWKpovaQHkn+
         UFwU3A+QAvM6PuZMnVMy3RHsL+nDn4UmmggBTp1Q7Q97FYm2ljxPlZpAqFsIv0IpZNKL
         Nn7A==
X-Forwarded-Encrypted: i=1; AKwUvBx/X5cvMm8ubuxvZkmcqcpv1ueKHAcQsYA2s6s7L1LvsgLtmFcS+2KeH5g5HBySu8KDHgqocxbLMHncyYk=@vger.kernel.org
X-Gm-Message-State: AFuF++lZM6bv3TFb5Rd/K4q+BUBCcQwhoU7Yi+j9YqIyIluDi7aJR9lR
	Tf1MkvPH+RbR3kDSeP6Iu4nsmEGGG06uR90DD83r2/FuRiQkSveEP4Um
X-Gm-Gg: AYBFou2ObBIkOTrwqx7yJR/pZGKbPY5SZzGuqHt5z3V+yRYH93eShb+l25Odd6jycCs
	FmQ9Dhikk++cG3j1ju7q0zld9vfNYV+/SQ3e3bhm5j5y41becic9ezDHdgdvQFGjW6fQUEOUCJG
	SpjtgSyNNyt9AOHjNT/Uf/bBDZfFTkTxjzWJ94RYK2EqckJlkUQbaXgxvyUZ/qpRJTVobob++LS
	y//rhQvG8SF2Rg3MgTlv1kUd5O0mnK2dziGTSZsPOMWTLX1eJA5zO9NhqUGmpMIGwqYRhOpS60L
	61s1KSqDVZjOZSoXt4RPXm8Io9R9Y2uHtbbLowxiKqXZYJC4JWWrcXGpNL+HfpWUChtXFSPqrmw
	dZOsQFNga73mRXEMY7+Nb5yRyL9y38r0Pj/3ADjirSNVKqomXBSP+sdJedC4wxh1pa0LuMKQGoB
	cgssNQzbgk1y43NKxGrBAcTn05C5GhTiIAqcY2TtVDs3kv+hhxAljds4QHlvuQ30WQfd9UMZC1t
	CIzn1rg9+Pr/HS4UVv/iCmX7OUs5Sfg394QimRf
X-Received: by 2002:a05:6808:1a0e:b0:4c3:7695:1177 with SMTP id 5614622812f47-4ca497b2b58mr4346226b6e.6.1789592756726;
        Wed, 16 Sep 2026 14:05:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4c::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d796b64sm891126b6e.15.2026.09.16.14.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:05:56 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 1/5] mm/memcontrol: flatten try_charge_memcg control flow
Date: Wed, 16 Sep 2026 14:05:47 -0700
Message-ID: <20260916210552.891730-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
References: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor try_charge_memcg by flattening the nested memsw/memory
page_counter operations to separate the logic between the two.

When page_counter_try_charge is made stock-aware, this flattening makes
the control flow easier to follow since each page counter now has its
own success/failure paths.

No functional changes intended.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1460cba53588e..48c475909e6bb 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2707,18 +2707,21 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		batch = nr_pages;
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
-	if (!do_memsw_account() ||
-	    page_counter_try_charge(&memcg->memsw, batch, &counter)) {
-		if (page_counter_try_charge(&memcg->memory, batch, &counter))
-			goto done_restock;
-		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, batch);
-		mem_over_limit = mem_cgroup_from_counter(counter, memory);
-	} else {
+	if (do_memsw_account() &&
+	    !page_counter_try_charge(&memcg->memsw, batch, &counter)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
+		goto reclaim;
 	}
 
+	if (page_counter_try_charge(&memcg->memory, batch, &counter))
+		goto done_restock;
+
+	if (do_memsw_account())
+		page_counter_uncharge(&memcg->memsw, batch);
+	mem_over_limit = mem_cgroup_from_counter(counter, memory);
+
+reclaim:
 	if (batch > nr_pages) {
 		batch = nr_pages;
 		goto retry;
-- 
2.53.0-Meta

