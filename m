Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3FA3B6360
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838511; cv=none; b=fvizi/HuLDiSGweO273h5T/4OckCzRHYIDdVZb/bxtXQL2HP4sLYQ4azS9Pvbrtzzr12nNJTO5NG8C6HIWJDTVT6a0TtPMpjeO4ZO5BF5puTXFMdoHajkkF/34CSvQGze+L00N/gYRG2DXJPujRe1d18bBBRa2sEoC06/O48Qy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838511; c=relaxed/simple;
	bh=HEyh+xhAzG49tn2riClelZqb7JdjP+uvGlyXFlv5RtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TotRwOBchEjBq1b3RUafl+vnY5wzCoFxHfj60ME9Dj3ATfjvxjJzGkWdf/p6MRX7PmZpab+asjfUmCSnK1prY2TQjJCDxr41++CC7YzEqN+J8+yOK0UkUAEGsyfATiokp0wub8/W7vVQhaQhoDMIROOEnTFRB34jT5D/vUWGG3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=bYLGo0PG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="bYLGo0PG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1341576f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838508; x=1792443308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4F888OOQShoEbLEfTPQFMYtPAYv48mf4TMQuqRsHmQ=;
        b=bYLGo0PGhg9wZL5l6tc4lZihAikDN6k3GJCXly9CIvV2XGGtu2C1PKSpwNiV3niHxS
         +1uzmO/7R00OXsQ5C0HydOM+bZ0DOV78eejprCDWIvI6tH3mxFzt0J7pnkKht/1Fwh6M
         SCOcvvX3u58PjJLgJ86twXCCbhjafUOt0YMRHtjxofr6d10ReFsdqlFWslpbD34YJBGs
         wUaq9CT82SL7oWAydBRoUhpCmuGrKZCMKL2obJxQP59G6eJXG3HsvQlJ1P7V1smRG3yL
         6yWSX4FlnLKOoDrbjv1wFfJclYm62IpyBlxid5OrKg8bR7LuGQrz5HjG6zXy4cSG22S4
         5IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838508; x=1792443308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4F888OOQShoEbLEfTPQFMYtPAYv48mf4TMQuqRsHmQ=;
        b=tIHC0cAAjdhqMuTEbJ5zPCStNq29se/iXDVaC6Wg7VFY+nKwlGHMQYk7iiaugXB/xm
         gm4JcS0O4lFkFq9nvxufATN1p6enlunU7OqzEY08nl1x+KXzmyEMlZxQLCrjU7+A5IxT
         fM7jhAhiZaxVaIJu0n0A8cLaWNEw2lRot8taco8xY+UHexpNVxwAoqYKdK4WxQ0Umige
         DhQg2biXc0vjZs0+VOSdYsH2kip495xrH3bf7UuY8jRfRZI21q4wBMEXxZTPy2Q+bWSo
         b9n97CLCPBwgkZFjqIWZsYZPVreflTAw6KctbAx04iPakORHd/Sxjzb1CI9VISXsZ+a0
         fb/w==
X-Forwarded-Encrypted: i=1; AKwUvBzLhc0SAOs3GRYKGGa79lHvZCstPEAEmz6b4TQ1rQ6nHst+9FeNLSvQOunc0cWjrw+1q6QPCbvRPLk0x6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5hEEOpy/HZadAWoc5Kx2/kbEVWJ70oqgRrWx3HG9dIK1Uw0wo
	CRllU3Lsjj59U7YSFwwO13lhMBjUer9Hgz4A5cTl3nSugw1aYFEv9xnN8az2pIv2M+4=
X-Gm-Gg: AYBFou1L+I8fU05LrD0zNZgL3e61b37t8DSnGi6iJmt6POfBR1QvHKeOQheOYfFvXF6
	E60vaRILlp9tsCT47+ROaQXw/d+1Fh89ikl7VDVqHZGlA065BtvWkFswUD2gQt325VQK6PFRq8j
	RqWDnODMbXAymXI8C17SIsYgbQymwFA8SvXIL/17F5CBa3VNh+g+itB2i0m757yfrgCbwwvpio9
	0qheQTVRfTVgjIShwnHHlKz7KOV2Uae4obThoOtHTfJ2gFKReCgUdQ/QbsM/Cjyxg0FGKKUpzpt
	NwO7b9GjtltAKGWmfKtJkUr/GHZKauSWy4DocQpv4cU3IOgZ8TFe2rjW3YiAY3waHPyNzpzifQD
	rYIuthKhiJuG5Ib6bxdYlx1wkaDf/kIGRzvfoIEb6GC9po4A4EufmJr+I5qPydi/U8kp1o17utz
	V1L6Hu8LcrlWphdcoPpRCO9l4FnN6PZ+hINIq8BZ0KF1exr7QOiFxetZ7ryPLCuOljegVUp+qoa
	0Fc/0UbbevWbIqdxveJlJ+5EhnGLs3rA/mPMFNLTbnf+eFJ9ov0Tn1UduijOxDdhU2zwRk0GPc=
X-Received: by 2002:a05:6000:29d3:b0:48b:3b4:1c8e with SMTP id ffacd0b85a97d-48dbaadebbdmr13615323f8f.20.1791838507920;
        Mon, 12 Oct 2026 13:55:07 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:07 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
Date: Mon, 12 Oct 2026 22:54:44 +0200
Message-ID: <20261012205447.2717801-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012205447.2717801-1-max.kellermann@ionos.com>
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preparation for the following patch that adds tail caching.

For simplicity, hlist_nulls_del_init_rcu() is now always used, which
is also valid during rotation, because the entry is immediately
reinserted under `memcg_lru.lock`.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..3d4bc12cf18e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4379,6 +4379,29 @@ enum {
 	MEMCG_LRU_YOUNG,
 };
 
+static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen, int bin, bool at_head)
+{
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
+	lockdep_assert_held(&memcg_lru->lock);
+
+	if (at_head)
+		hlist_nulls_add_head_rcu(&lrugen->list, head);
+	else
+		hlist_nulls_add_tail_rcu(&lrugen->list, head);
+}
+
+static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen)
+{
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_del_init_rcu(&lrugen->list);
+}
+
 static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 {
 	int seg;
@@ -4409,12 +4432,9 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
-	hlist_nulls_del_rcu(&lruvec->lrugen.list);
-
-	if (op == MEMCG_LRU_HEAD || op == MEMCG_LRU_OLD)
-		hlist_nulls_add_head_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
-	else
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
+	lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
+	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin,
+			  op == MEMCG_LRU_HEAD || op == MEMCG_LRU_OLD);
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4445,7 +4465,7 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 
 		lruvec->lrugen.gen = gen;
 
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[gen][bin]);
+		lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen, bin, false);
 		pgdat->memcg_lru.nr_memcgs[gen]++;
 
 		spin_unlock_irq(&pgdat->memcg_lru.lock);
@@ -4479,7 +4499,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 		gen = lruvec->lrugen.gen;
 
-		hlist_nulls_del_init_rcu(&lruvec->lrugen.list);
+		lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen);
 		pgdat->memcg_lru.nr_memcgs[gen]--;
 
 		if (!pgdat->memcg_lru.nr_memcgs[gen] && gen == get_memcg_gen(pgdat->memcg_lru.seq))
-- 
2.47.3

