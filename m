Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623319;
	b=XXbSSoiNFs+2K7YrvyW7hzBdhNO1EicsJMRvOXDQ693GyaJ9S2d3+owkmbuEL7Lj3yZF
	 FOVOLZnesj37xMvEf7qzAVuOGTSJvcAkBLVEmChjF5ZCK1+9UjTZqJpM2+Ks4MhZVLyTu
	 rYEpdAuUo7L94MI9LuntnvnRAQaBTniqKHR56J67g1LFSirAa1rWZaWrVL4X9KR6pPzfF
	 Jo5Co+AMrHkV3e6051KGzMtS+CGpMmUcdP+ERMBFoeCJ3leiCBkiAyX6MgYRGZVewUEX+
	 GsNA6GztQ3hJ6KJXs/EFuNOZnNmwNHRcbn/1fgVTM1/N9e2IaHvONS91mynLQuX6Mcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O4E88v6TnIIh+ETRycvbXAskumAVYN69m/ippxnJhTg=;
	b=h1cOIt5OGgkgD3hqkPCgZaxUhfaY35qCscBQxWZS7G1K15fnarRH/FVrb4ssz1ICB9PD
	 Kr4u+hPdnIfCBE6E0F83bcYFNDIwKzdtumEVeaiGKlZo0ny4claYkjdDkpVggqx+iJpjW
	 1tB6V9SR2UE1ri7O72yK1V9oZUvBix+8cdVOZCI0qOtqTh89yc3yU/MDInmU8OPVvdrou
	 7Xpfboeyo0T+U2Vvr/c8CwpxYe6TA7bW1NinT8ImoDq9R5Z7fWLvVKGZ2b2k/bDI5kENP
	 +2/glMCdoEYYconBY9GAT2aTe7cSX1fmzzzjvvgvwdcu7rgfKNMMxlHWj1YBFzWu2Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wuupda1p;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C8E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wuupda1p
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0d63f60bcso11357147b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623318; x=1793228118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4E88v6TnIIh+ETRycvbXAskumAVYN69m/ippxnJhTg=;
        b=Wuupda1pCGwl5/yDZp6M6l/JiuYQeP6eLG6x7f5seUjwFikPGUj7hetNT2VhTUrahi
         mcG9E3/32eVhexoLvkRO2bzcO4XbGGOEQJyHN3lcJ0yOy4bkwqyRw/Z2Fby6z6Ltz2ly
         KFdBN/Zoh7S3Ocg+MPDfn4L12s9hThwr714dZj3s0e1g6GcRHuuAKPbJTNUShlmEng3J
         jyk0hvjpgB14KwvDUXRsv3t8UuYYq+QpgP9spCNjollqVOwhSwSDFiFiuSvdBDRCXO8L
         Y4nzMI0sQk//6mFO/rZg0QB8rbC1TbGhIo0FPPEQlIFRehO3rNUDVHYYAeNDsX9WSaBZ
         61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623318; x=1793228118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4E88v6TnIIh+ETRycvbXAskumAVYN69m/ippxnJhTg=;
        b=cwQ7Z1KsDIlz0DZUowBfmBqW9Yk6rE69/75+uqLlyUGAMunMyXNpCwAKdpqo7Gs8Fy
         4gH0FTpwIAEvZyos5JJdZ6Yp2/jOFi4J5Q9fHJH2/J6o/wNwwZSD5HB2FsD3osAeaYYv
         v4gIhAbgz9qKk/9xgipbAqIchczQphAUWyEJ7K/AZjm3poeMc24Wm5C0/WDmf1nc06bz
         Y0uaK4cIxrEP6MAIIVFAJy260rNn1xePxrvjX9e7qnPybYjG6ycqHSwo0QYAgPzm2Pwl
         KJKZxshOUchRFS38dJ3EXKGVjlD5HOVXsJ3+iKLJwqPYRkQ7aM38+AIlFlmVq5MDCax1
         Q2dw==
X-Forwarded-Encrypted: i=1; AKwUvBwJEiWgxtzZ68TeHHdnKqOb0HDz0I0xMqgBBvnjHDJKLRw/xfQQtydmcbM/z971Nsktn5O0ADOzE+uD8VI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgPbjq6FxWPasBiR3R8ZCkU9e1FOpY8rAltDoQmK++RW6CofA9
	VMQJZwGQlMQeh4ulLylHnAfZCZsQu6XXZuTVnguHDEgSE3UAUr5YhHGT
X-Gm-Gg: AYBFou3OWNzKsk8g20vuN0HYzjGxVHiOQCiP/ff0hbnGG95bFNUNG/OH9ITsKtpZ3RC
	MeqLXeaihk1cMA3iopEahDWwEDRt76ksgBO1D1hRG+jk0r13Z6kpMJW90Fxfw5nu2izsjrJxNd2
	fxraq8NV9+k2R5cSU5SdxfdOELY+qzWJJU/JJTyrCRiZ/tV+ePKv6wOkFJFgLT2FvX5UGv+YVn/
	mRJ5x0QqlCkGqK6kUNO9/dvP6tY621oVAXbZJ87ZJ/Q4E0AnL6xHSzJsye4gxBcYv4pvaeGU6j8
	Jdfh5S9A1jvY7d2sXZDJPJebwfsRWvo8GZy51jYc7KctVUqwh57uqFV9ewPUwALTKWcMM8+kvCs
	I5SLTVJxU3UL/m1KNiotQegASprx+9i1PArRg0zYDRVRp22Uluq29n22aqtB1D4jTPjhCbWNQGQ
	DZBBYjNZTC3On1TjXFJCRXaPKBA6LhbOUnV1+oC3+cH5iAtqpzjtVTjy9IgCkDHTIkO1SR2do3G
	BMLS2Yt1Q/Ri0fPDAqs/1rvg/7F2hKXWX8c/PjPMCMJmIe3TrDfPRuEARkZIJSSyZ+/k/Z/AQXY
	f2+cG2ZQjws=
X-Received: by 2002:a05:690c:d89:b0:8ae:a0c0:463e with SMTP id 00721157ae682-8b133d7d1a7mr24871677b3.53.1792623318346;
        Wed, 21 Oct 2026 15:55:18 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300735f3sm18293307b3.8.2026.10.21.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:55:18 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>
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
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v7 1/5] mm/memcontrol: flatten try_charge_memcg control flow
Date: Wed, 21 Oct 2026 15:55:10 -0700
Message-ID: <20261021225516.1620680-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021225516.1620680-1-joshua.hahnjy@gmail.com>
References: <20261021225516.1620680-1-joshua.hahnjy@gmail.com>
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

Refactor try_charge_memcg by flattening the nested memsw/memory
page_counter operations to separate the logic between the two.

When page_counter_try_charge is made stock-aware, this flattening makes
the control flow easier to follow since each page counter now has its
own success/failure paths.

No functional changes intended.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index a05d9a8baa1b6..cdd6aba91e444 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2721,18 +2721,21 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
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

