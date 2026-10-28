Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202430;
	b=WY/W7rgyxK1Ay+HAzdKODXf8CbS724Yl13/2z42/UJqXMet/gqlJP9dulFzM5tLX2q2q
	 4Uc80PaeF9aewA5ORFxJkic4NAiWUpVtHM+uF0xNzBugNrXocZ/H+i8T+q8EnhS5DQ8Yp
	 P+PSIsBcx0HGOL1EiimZ+C5LoNt5JxUCeeqrNraXCZfUkLPxp4+eRq/ulVnVQC+olFU9f
	 ByUl4racCEtbZMmhOWzmv4MaCG2UNEXHMw0KZ0zEVjV/8VI2S6VClPR2xpn3v7OL2eBK+
	 YVw9mzFp4B7geb7s64e3b8Vro6OXEMey4RWjvWUGtOuHZ6nPb7b0GXzZM5xyHjC81oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kDf0N2qKy2D5WoUW21DkgIjyXDWbzLDsDhnlR4wrAP4=;
	b=isYT3hUhXxhBlbwXeIU1whVCcsBA7ebwGlDKI1vGlD03Q06DM43pLr4mlLMeB7E2Rm7r
	 a1Ao3iZ7Sr+qNbSVCXmq4s2DAChjBAw1gBVpZFxKE7oTvG2H82eYNPHeL6kld7ZxSIgeB
	 TOsfM3lkPIH1/qp7i95cSFwKm3H5yoBCEHM8cWZ0nOROQfjW/Itkux1EELU6yNYPBXMq8
	 wcNelalj+JmDWRdNGDXYrv4zTry58cfEdVI5RVoEB7Uh4ZGGIx20AaCosoOMQdhuD1qXJ
	 3QgqRNYJEAHUfWDuQwk9Aa4LQVAJBvtWqlva6EH/RZcfqYqz931+xFMs4XnWMqwkhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9rNEbnr;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9rNEbnr
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cdae9336a3eso187838a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202429; x=1793807229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDf0N2qKy2D5WoUW21DkgIjyXDWbzLDsDhnlR4wrAP4=;
        b=F9rNEbnrTLCd6DeinpLo/r8PZVWERyRj1NQW7lLlEjSoLuraWAUoMcPzpEW2wkzosa
         OOk4K0drF/BcuFDZ6kUzbHnwNN6OAg4CTB6ybcK5u5pTYL3RfkYayiJVka/8vZ4kepne
         eOPONAywM1h6/fKGFi5xCubogNvzTCm8T055uBbcVq890bNnqKSZnH+hM6zLscL/NcVi
         yWEtQ9y0mR8Cr5l/J4zLED91orvRJYCOOtKHNbOQvPxX6Fu4pkWAH+OEUp6wjPnAg/S1
         7gNCuuex2tH0d4tvcTDh2vXwyZjgsZ6argQi3IDyau6VDXhVIAT6mPtDU78wlyoVJPbm
         0U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202429; x=1793807229;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDf0N2qKy2D5WoUW21DkgIjyXDWbzLDsDhnlR4wrAP4=;
        b=tEAN2MUqUPtopk6WGq1YULP1cdsZ/FOnW0P9y3YmIM8gJZ+nEivfAogAOA4voKA9lr
         3R3M7F0eR7l6TIB4MuUrnOy6ijcSBwpE6ukFka8/GKqcrul9RUzgy3cTsPng1CQ9Y57J
         0hw+KF+7Q/uPJFr2IO0t2++C5b5XjLCo8+f2Pu728lnxBBzqvfgF4OURCc9dGQ3oE5Kf
         0L0R6w8YAP8oEmZ+B482G+OYMMG7C5AfXBTcl4GzED/xqrU26NEE4R65zJPzIuL9CAXS
         eNg9SmN9p/YB3o7S2Qm9PipoHOr8vGmY/LNCO19TuerOoPjFRRFgTF5/lU5M0ZxVqe4c
         AR/g==
X-Forwarded-Encrypted: i=1; AKwUvBxZndKlOtrC1xB8mZ/x4ATTzTJ9VDiV1oaNJgWq5gAHBehRS0y3cIEH/qWNx8RPvfESQM0fOi6iyddfZpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLon149YUAt3cq2UiyGj0M8+KZ0FWi4mYrPia3nClrK5BXgORHJ
	68ek6Unr+XtlkkiEgouVCSaqSSjBfzC5y+5GqelMyp70EDKrB8sTYgO1
X-Gm-Gg: AYBFou3t6p5kuP7MxtuAXKxKZ29H32eJiOtePI0uFod3ZDKywhMPOc9PXINDcSlCzm6
	7y0PuGYRbBkcv6GnwmLJdOHOX8E+3Z0M/o53qaa+1wcESC2BArkpn0qhuV9KtPyI0Gokj+8xBiT
	1y4tOav/xx5Jbp67Aa8zSZQ3h1vgCoYe8+lyF3SJ7JWxz+snZKF5RTER/dSSN8E//C7CtzoBBIo
	VyB30uAwNKBIEu3yopWcNRmpZP5ighRWGcSWjA9DTlKreuBzQrhgtMlAHWdlWS8Y4Hb8Y5Y/1gs
	nZFppOLjUeCFyJXpoZlmWfz0FYyj+nICWsgDllQTvI0suIj6SYmPyQgoTAc7aSzRYeLukRnaSs/
	rZJQ0qDiIlqH+rZYA10wL5Joj6coImHp7MvAaC/zlwrlPiWQKHtxj7t7oVutt5pZFJoaKJuKRBE
	iu4aH9W/inl9oEm2GeJx+VFKYrogJFg3Rs2kAJ8uRrzs93FO7TUOA3RN6Xk41PdMzVxWKZsf/LP
	dBL/+Q3yGuIETIBrqyGuf8mi4FaaRmA8mIcIf9d6Dc2osI6KQVL0JF6h/Bgy/wa8QotzoDN0zol
	sWG5KIr9+rfLWlMq6+xQtX/y8bc0aOhsxobLcWz3pyiNTGfu9TUJN3WXbHAi+GTrgFAQHPBCv03
	DhZmVgAvTbZWY26+y4xHG8FkpsQ==
X-Received: by 2002:a05:6a00:3493:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a6e8b8347fmr2113647b3a.40.1793202428981;
        Wed, 28 Oct 2026 08:47:08 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f66bcesm1375802b3a.15.2026.10.28.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:47:08 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 29 Oct 2026 00:05:46 +1100
Subject: [PATCH] mm/damon: skip folios already on the migration target node
To: SJ Park <sj@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    Bijan Tabatabai <bijan311@gmail.com>,
    Bijan Tabatabai <bijantabatab@micron.com>
Message-ID: <179320218513.2.7432933245840036676.damon-same-node-skip@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While measuring DAMOS migration overhead, I found that the target_nid
path isolates folios already on the target node, then puts them back on
the LRU without migrating them.

Skip them before isolation in vaddr and paddr, as the vaddr explicit
destinations path already does.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>

---
DAMON KUnit and selftests all passed. In a synthetic same-node fvaddr
test on a two-node x86-64 KVM guest (8 interleaved runs per kernel),
guest-kernel cycles fell by about 29%
with 4 KiB regions and 90% with 16 MiB regions. Median kdamond CPU
time fell by about 76% with 16 MiB regions, with no clear change
with 4 KiB regions.
---
 mm/damon/paddr.c |  2 ++
 mm/damon/vaddr.c | 22 ++++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 2cfdc356b415..5b773012a876 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -368,6 +368,8 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
 		else
 			*sz_filter_passed += folio_size(folio) / addr_unit;
 
+		if (folio_nid(folio) == s->target_nid)
+			goto put_folio;
 		if (!folio_isolate_lru(folio))
 			goto put_folio;
 		node_stat_add_folio(folio, NR_ISOLATED_ANON +
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index b549496ea8e2..cd71fb1ac209 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -786,14 +786,15 @@ struct damos_va_migrate_private {
  */
 static void damos_va_migrate_dests_add(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr,
-		struct damos_migrate_dests *dests,
+		struct damos *s,
 		struct list_head *migration_lists)
 {
+	struct damos_migrate_dests *dests = &s->migrate_dests;
 	pgoff_t ilx;
 	int order;
 	unsigned int target;
 	unsigned int weight_total = 0;
-	int i;
+	int i, nid;
 
 	/*
 	 * If dests is empty, there is only one migration list corresponding
@@ -801,7 +802,8 @@ static void damos_va_migrate_dests_add(struct folio *folio,
 	 */
 	if (!dests->nr_dests) {
 		i = 0;
-		goto isolate;
+		nid = s->target_nid;
+		goto check_nid;
 	}
 
 	order = folio_order(folio);
@@ -821,12 +823,13 @@ static void damos_va_migrate_dests_add(struct folio *folio,
 			break;
 		target -= dests->weight_arr[i];
 	}
+	nid = dests->node_id_arr[i];
 
+check_nid:
 	/* If the folio is already in the right node, don't do anything */
-	if (folio_nid(folio) == dests->node_id_arr[i])
+	if (folio_nid(folio) == nid)
 		return;
 
-isolate:
 	if (!folio_isolate_lru(folio))
 		return;
 	node_stat_add_folio(folio, NR_ISOLATED_ANON +
@@ -840,7 +843,6 @@ static int damos_va_migrate_pmd_entry(pmd_t *pmd, unsigned long addr,
 	struct damos_va_migrate_private *priv = walk->private;
 	struct list_head *migration_lists = priv->migration_lists;
 	struct damos *s = priv->scheme;
-	struct damos_migrate_dests *dests = &s->migrate_dests;
 	struct folio *folio;
 	spinlock_t *ptl;
 	pte_t *start_pte, *pte, ptent;
@@ -858,8 +860,8 @@ static int damos_va_migrate_pmd_entry(pmd_t *pmd, unsigned long addr,
 			goto huge_out;
 		if (damos_va_filter_out(s, folio, walk->vma, addr, NULL, pmd))
 			goto huge_out;
-		damos_va_migrate_dests_add(folio, walk->vma, addr, dests,
-				migration_lists);
+		damos_va_migrate_dests_add(folio, walk->vma, addr, s,
+					   migration_lists);
 huge_out:
 		spin_unlock(ptl);
 		return 0;
@@ -883,8 +885,8 @@ static int damos_va_migrate_pmd_entry(pmd_t *pmd, unsigned long addr,
 			continue;
 		if (damos_va_filter_out(s, folio, walk->vma, addr, pte, NULL))
 			continue;
-		damos_va_migrate_dests_add(folio, walk->vma, addr, dests,
-				migration_lists);
+		damos_va_migrate_dests_add(folio, walk->vma, addr, s,
+					   migration_lists);
 		page_idx = folio_page_idx(folio, pte_page(ptent));
 		nr = folio_nr_pages(folio) - page_idx;
 	}

base-commit: d865f2677c44cb2171b833d6775cf692756fa8be
-- 
2.56.0

