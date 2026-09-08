Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EEB30D41D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836656; cv=none; b=cMKhhsKfiwfN3YR0GWE8VOqTPAhAUOPma4T4IIp2PXc9Wuv3EeQcE8sPbwDFJDZlCElbHrajU54+lLRn3Jsc2KebgrlsDosfTc24YPJHWocPdm7ZVUdSEaXurTjmffPYaWa1UyPkZ28UhopMRixeMzi1jS9UzVNcsd3t8pCTweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836656; c=relaxed/simple;
	bh=Spi40rx4E2u0S6TcpQdxQK6wcnBHvGkB92O2rN9o6oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmWiwBviNE6/DHulWLG54lXXkBihTOS5r0ixKV1HMHcdtWMyy1Bl7IXqNjh+hYlrsiLRm51Lzx9y9OKQ2U7J8ellSvVsiQq/x2APApUull4KR4fC03BXSJ2XRRyQpwZeysJ8rxSYT6fO4vYFLaNP6NChe/ZgsPhOC9HckWDb+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GgA/dNcV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GgA/dNcV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8525efa7274so2750559b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836653; x=1789441453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9QdH6WsgivxpcgrN4flEbJh0Z1iEZy30Xh6LMeUuak=;
        b=GgA/dNcVPjA/kt8Ca9lYm/Cl9ybINBvvzF4A/qxaTaay8Je+Mnzm3IX6zMyQ6PxZHh
         nR8nXPL0a+gdFLDKO68V203+qtknAueHptSNF0C/vJQQLrAPbtHnZAcIXltOpIaFdVyL
         q2pNJ+ujZiZuhxmFFiS7HTFNvsQn5WVYTTPJ6DAnhYwvCYdrCqC0B4acKVn1HH4yK3fI
         zWjlP+QDh5oVbeLo1oHQiWUspwNvKQBRg6ip2t41Rs8Y1VRZ3DmnsuTA7J8a0jWnR6V6
         jGAVJ7TMDFNBu5bSmQZ6UgAsO3z1rQLypv4lYqvALjhnsGBMGYWZO+2M1gOA+0ckb4B2
         VTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836653; x=1789441453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9QdH6WsgivxpcgrN4flEbJh0Z1iEZy30Xh6LMeUuak=;
        b=elN8/We95gW40VlfJAG4tVJ9dQnEqHHaRuOI415jTLeKiUPagvwY7jnEkBXJsOBntz
         gkAO/AMF0nQdqlLntw2M2JiyyIYlx6ZbHHYcbOMve8u8mX272kr2U3N0XRJNtJINlLq6
         mzD7D7BXgk9rcJz0yelIHVHEI/A+qR5u7oN5myl4e0aeKVv/RsG+ptgSFP8bP4CCY6Mk
         u+coJuWxldTzx4DYYMKTDEteITdJus1jE9ddSzDsZx9qLBfSDR4ekqZ9TQ0bgo+8WnmK
         +9j3yV7QCc/IIlW3LuY6M19mggVT+vX5OB8t19GO8VkDJipo+E3n8SA35N99QeDt39GA
         YB8g==
X-Forwarded-Encrypted: i=1; AKwUvBwJSaScTC0N1fb88sME3thOJrudznW1lC8Sm2Qfkyu+HeKBrSMQQ3kIGgX3h2IFx4sL7biouMFAri4gkx4=@vger.kernel.org
X-Gm-Message-State: AFuF++k9J+EIiJfXBsVSS8vJYFhgqiKLbFZ/ssjNBsBgS1B0lG0ngbZD
	lkgjbt2Sl3Ddd4nCWotX4dpZNl3cS+Pos/jn0MOEdXY/H2F9ko2qIIpcIbr5lTsL+6Y=
X-Gm-Gg: AYBFou1fBVqhg9H6mzI26pQ5eoZev+rxo/BXLvp+jcqoCFK8mP3gituQsYYrWaDX9E3
	KKZamr198A3nMY9hj7uuXGSGTnL2LtZiZcm25bkkDjSMTLmvZ0bdh1qmmb7C+wq3KEVvewH1VGX
	PgsniPeXU9z48pv0j4jdOIx6LQPu8KX6ongenuzEQxYSNgX5sWTHEE6QIR4xs8HWURrZm2FAWnW
	FGLhkjSLy2Ujtr8YdeMStBvTAxbnpTVwitCT3pdQduv4kiK3LRClYOm8ns39x958qd+JVWxRUju
	dIRDpVU1o7svXNn2GbSLW4iTfonTJKqShD1Wom5Jb5kx03caA/9I/9qQpqD+qhSLFO4lcFLBnRL
	hiLoI2EEx8z+mH60YVmE3okmiBHUMCYaA0cP74VeyeiZ42bv/hZrzmyryp74tWER3HYzriv0Wyt
	me6do7ReHuUmFG9maQj5U56Sg509ZaNaRBwN4X/Le80GyrBPBbwc9urxiqULlxfx/GtCf9fQyCX
	ZpR8tioeGpGuRR1Fgh4D8CI
X-Received: by 2002:a05:6a00:3021:b0:857:727c:a1f3 with SMTP id d2e1a72fcca58-8616907fefamr35713322b3a.21.1788836652665;
        Mon, 07 Sep 2026 20:04:12 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:11 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Tue,  8 Sep 2026 11:03:27 +0800
Message-ID: <20260908030335.96549-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_compound_tail() is only used by vmemmap_shared_tail_page(), where
the shared tail page setup intentionally passes NULL as the compound head.

Keeping this helper in mm/internal.h exposes that special case to the rest
of the MM code and can make the NULL head argument look generally valid.
Open-code the initialization at the only call site so the special-case use
stays local to sparse vmemmap optimization.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/internal.h       | 9 ---------
 mm/sparse-vmemmap.c | 5 ++++-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index da14c56fb24e..0dca33db068f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -786,15 +786,6 @@ static inline void prep_compound_tail(struct page *tail,
 	VM_WARN_ON_ONCE(tail->private);
 }
 
-static inline void init_compound_tail(struct page *tail,
-		const struct page *head, unsigned int order, struct zone *zone)
-{
-	atomic_set(&tail->_mapcount, -1);
-	set_page_node(tail, zone_to_nid(zone));
-	set_page_zone(tail, zone_idx(zone));
-	prep_compound_tail(tail, head, order);
-}
-
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 70143dd8b579..e453ce4675a0 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -189,7 +189,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
 		mm_zero_struct_page(page);
-		init_compound_tail(page, NULL, order, zone);
+		atomic_set(&page->_mapcount, -1);
+		set_page_node(page, zone_to_nid(zone));
+		set_page_zone(page, zone_idx(zone));
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0

