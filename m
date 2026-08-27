Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D633D4E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874437; cv=none; b=AeZMNoC9vIpjRZV1hF1VZnScWn9+TdsiNKZBIf26KafZgXoa873BnzyEY5EzduSNi4c6NHPoeflXD+2I1Soj1gwFJ1XAvD+5ANKH0H2MXpvZBTL+XJHZ9rebKn3TRmhrKaSg3DAb5DLdfKFwizjcunEQ/eVXSOwuEk56prQtz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874437; c=relaxed/simple;
	bh=5KzYUWK2iMjN/jkCYyA0SSNyFYYVrGI616WrTii3wdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S1I9w196CCj5NusqeVivUIWeMM8cxjFU4AyDHBoHFI/iyaMStKbbM3cIEU8cTm3/HbUMQoQpcJDW0PRU7dyMdIut1RTIP6szjt7H5H/pCaGcUKpuZuNc/t2r196iYKoYR/wK4D7lmX/r3G8ZdQtzexAuNnR9jOx59ygUl6Lv1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INwDxHpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INwDxHpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6021F00A3A;
	Thu, 27 Aug 2026 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874435;
	bh=ENEA/CG+RwJeijNigZCVNh2GWKHCE7Bxn/GSW/9uiZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=INwDxHpoZfJUz25nZdJH2zfsSzwfFzAyCq2FqmEWlBP/GIKCFg/m2jHIsLx3VwVxS
	 xh/43XUdKqF5D4nTevs3HGd144LxVkFnODKo4C95dPRhqb4SpHum2Y3vEJbEsw1NAp
	 V77++kFgREKKbbAmEs+92hhZhKGorzALq19VoZmMIkIVt/JihqdY5X30FXuDwllrFN
	 Nth4Umk8k030Ui9vMATIdgnPOCR1RUN+snvhn/XI/JLehg/Fb2/eLr/G4g72q6viLE
	 4faxZXpglvH1nlx5TQlL951jrYNTDKOgBVmextsDHvp/YuLtcUOc4BjXaOWHBPM5dk
	 DWuu0pYhXa/kg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 1/7] mm/mglru: separate folio generation update from LRU accounting
Date: Fri, 28 Aug 2026 07:46:58 +0800
Message-Id: <20260827234704.63163-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827234704.63163-1-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

folio_inc_gen() currently updates both the folio's generation and the
LRU size accounting. This makes it difficult to batch the LRU size updates
when moving multiple folios.

Extract the generation update into __folio_inc_gen(), which only updates
the folio's generation and reports whether the generation was actually
increased. Keep folio_inc_gen() as the wrapper that performs the LRU size
accounting when needed.

This separates the per-folio generation update from LRU accounting and
allows the latter to be batched by subsequent changes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmscan.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fdd13299a04a..8f187d296b8e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3296,20 +3296,21 @@ static int folio_update_gen(struct folio *folio, int gen, const vma_flags_t *vma
 }
 
 /* protect pages accessed multiple times through file descriptors */
-static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
+static int __folio_inc_gen(struct folio *folio, int old_gen, bool *increased)
 {
-	int type = folio_is_file_lru(folio);
-	struct lru_gen_folio *lrugen = &lruvec->lrugen;
-	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
 	unsigned long new_flags, old_flags = READ_ONCE(folio->flags.f);
+	int new_gen;
 
 	VM_WARN_ON_ONCE_FOLIO(!(old_flags & LRU_GEN_MASK), folio);
 
 	do {
 		new_gen = ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
 		/* folio_update_gen() has promoted this page? */
-		if (new_gen >= 0 && new_gen != old_gen)
+		if (new_gen >= 0 && new_gen != old_gen) {
+			if (increased)
+				*increased = false;
 			return new_gen;
+		}
 
 		new_gen = (old_gen + 1) % MAX_NR_GENS;
 
@@ -3317,8 +3318,21 @@ static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
 		new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
 	} while (!try_cmpxchg(&folio->flags.f, &old_flags, new_flags));
 
-	lru_gen_update_size(lruvec, folio, old_gen, new_gen);
+	if (increased)
+		*increased = true;
+	return new_gen;
+}
+
+static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
+{
+	int type = folio_is_file_lru(folio);
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
+	bool gen_increased;
 
+	new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
+	if (gen_increased)
+		lru_gen_update_size(lruvec, folio, old_gen, new_gen);
 	return new_gen;
 }
 
-- 
2.34.1

