Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835033;
	b=ya8mOU3epJee+6k5ZeOAhKeQ6Oi4+vN7MWGz07Ga481ZljvsQEQ/Dni/PcOqz36WTX6h
	 3KGGLdtxj1ghbpu6C7bY7P4/8gcuOff0FEC+0L+Q19eaoywvqJRn2EixlzyKgZ8Ye8wdN
	 vLnXEBcAzTVqKASh8DTFk1YMt9OJ2c6Cjr+kgiZ4Evvc+mSXg0+iCpe9CjRLdpaH6VJWS
	 xgM/L5ZSuhQ7DnfSYjkcro9EBSA1UDA420GafCTgPs6Xf139ocb8UZ47g1ZqiUEY9STtz
	 64E9Pg/LOBSAoUSbkAtK0E41R8jrKqVUrEoXQ2v9yIy+GNWGC+a8kd8iO7zrbeOS3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RXyZYe/CTboqHUSipMlaWiZYB5WKA52593Qh8Q69WAI=;
	b=wNHgHs+f5MG0lwAmQeENzXb6vqzNCyklvz9GKx2V9s9vjEcRkuxs7t7/mvtIspbEceSa
	 8oU4x2/RzVrdu6bTuAa7vx76soS+EY327uV0OLQZjLLZmuqk10VBnQGmbu2iXLEZgMiku
	 yz+sneDDx9OM2SwJKe8t8v6dAysRKhSCbIP9x6G5lSzKuhQAw19gYkbOFNEkoxBDzcrjx
	 lMMsPvDUrG2PB55SKK05ATjx96hHWJ2GERl/GPfFOYpPqzNSpLje8ytpWl/1dwrbigzdq
	 2yI9ChlWngNbRVOda5qjqM/0lbZf/29I+K8/TKkZ2WIgzGU8vvMDXB1ZtgDTX54KSpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HS8B4pqa;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE63606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE63606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HS8B4pqa
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b32bbd39d5so1324467b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835032; x=1794439832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXyZYe/CTboqHUSipMlaWiZYB5WKA52593Qh8Q69WAI=;
        b=HS8B4pqa554AlFeqlrC0uUxfD8ae0uZvprOtQ67IKBjZlbVK3Z1QJu7VdesAVcphgD
         bk1EEW8kl5HWaJTYKdqN1eXPhdct59jvUlPNjPiWl7vf92mAxxmmUMwaHNO9MSJ0bAwc
         2aZN0qVlxhVqtcuvS/Ri4N0riJqR+P0fuNM8JY34SrL8DHZ/dgdo/TzQPnEYge6Ff3ow
         YrHQ7l1rCsZQsUs8/lZm5ToZcM1MP0CQwqqEtT4Nj7dRd4D8ue2vp8x+CK7OYmJCEqz8
         ruW+egnRjjpHNfnlb5m/nOy11289jLPdEqlOMFyjgC9YfKUwgFaVKPTidFh6hOAaZhwi
         gEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835032; x=1794439832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXyZYe/CTboqHUSipMlaWiZYB5WKA52593Qh8Q69WAI=;
        b=pQSlPL8IRGE8loqgLf54g71ivFETnefoyTdOp6Au9vaqGkt5JVoaTStjVj210DDF+5
         L9zrFJA/SDLTjJOw3s4Ry5aek+AgiDKVWFTGwIepK85K/zZJSC0yiwM7ddYRTIHRvzwX
         UaLvbaEIWR9H9MSTh7Eanfwqfp9XpOuMjKMx9MgcUzE10Y/wl6Cl1OJZrbTI9T8XJ0zz
         zJfPHXaUembNcLrgZRKVtRLDuAD9X5gHc6ZBGO5pSzhzlZA8UdQiZkTdpjX7w9Z++5ue
         q/WQe3D6ZSjOc3iydWlwzfBOFKxNwa7z+TigduaQu6GzpR9TZlj5tqClCxRX16IfpTRV
         F5Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxzPOwcRfesvCi203C3OIvFkStA5SM9EbTA9dRu3oT20rSDZAQy0+8VWJayDdLl3o/IhOslLsOyfpaiK6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sjwp9O70OWtxQsoLfaaGLMVvPE+XN5xGLNZuAZ4AQ/nMuZbbQ
	A3jUKp6UNGAPr61z0dhG+NYcqaGp/aCdHrvFy05/CBwp6I4n14qtN1bb
X-Gm-Gg: AYBFou3K/fRVf0rVMqiPmY/bKoDGb6NoWKp9A+xewQ6sTFEAl+MRMYFTVSLMdINV9Bf
	B4IWPzEKiRiVxG8dQ8TYvNkdGkABgtQVloiyYWMi6l8MDByhkpHDCJlPX7K3QGZmOWFxuEHIr0T
	rSmpePaVnnBSvloBrfYgpWIXxYNJlk/0a1yyxOHTX/yBDEPFFIu2bigys8RrdvXTBh8+IoTw8z1
	CIhf1ZrLRjjrGPMZnatkecics1EeTplVVU2hsD8kpq8k9mhabRZ3aHcTQOZlEeOFSzu518T2lPg
	XBzWYKFDPRuSCUja+clyM76tLr6wHhxXxvxA+QLRR62UcSNWo4byaHSrCo5wUsElCCafWe78tX2
	6Q+qF4J51lmi4xCIhob1UswRDXGz6dmk6QkdY9rf2I5PpKHCmSGmdZdMl5b0ytd5tCtZUUnzjFi
	re2mRXmWafIVxROrrNFufj64L0ceJEittQZnOANcggDHaL5XJiDUofDoaZ5kbbY3LZrQCHKe8eT
	utSdvfmmAqq2dNVl3xY6Uzf1BIYhAcX/2JIA2Wcl9/ghj7fq+RFF44HsBvzr01bf8upYPr/yNtz
	lmn5aiNK9sEiwmtR+kaZe4VE+MM9AhMvXVkM7uyCm312s4rt6UlRVeLFKNhI50bkIwVNRBEhmhi
	YSI21Lg==
X-Received: by 2002:a05:690c:82:b0:8b0:eb6d:d887 with SMTP id 00721157ae682-8b2b678e12bmr130360207b3.56.1793835031679;
        Wed, 04 Nov 2026 15:30:31 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:50::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c313esm29215227b3.15.2026.11.04.15.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:30:31 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v8 1/7] mm/memcontrol: flatten try_charge_memcg control flow
Date: Wed,  4 Nov 2026 15:30:22 -0800
Message-ID: <20261104233029.3282438-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
References: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
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
index ffbcea28a608c..66f38efb800ab 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2811,18 +2811,21 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
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

