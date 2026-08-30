Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492CE2459E1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064181; cv=none; b=DSOd2Tu6lM6MWXkjZgvDqkbfX1t9wyu00U21IQik4B7GbcPCTsdMIU74pnIXd5hAsnmny9hJRAYBkfgzMQ8JDUrBFgyfJLDilTVm4HEfVqNQh8eLM6zzhDVysfrWAsMersCQK4cscMDVGgtVx04vUM4XUeaoTGTJhbP+Tf0NkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064181; c=relaxed/simple;
	bh=Z2P/u8p2VN2KJWt6zvZw7BNx1xVUliqSH9psL0YD++Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwMW8nRFBRDgThHeHqxYgiEzS7yg0L4dTbLJw38guhwK9dNwy054kKvl1iQw7M0wxWuo2VUCgJL532/N7lHrUvpdDjNfqzk88zyN3hfuuZrjP8AGzdl2/nG10VpT8UI8Bh7nDsMdsTn+ejwaBpdJCrECLpjm5dPx4njXjDB+dhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL5HnAV7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL5HnAV7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d319b84213so3379165ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788064179; x=1788668979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uO+fdQnTYZ+Aocv+Kahxqh7F24JHdH1Qim2aviwHKRg=;
        b=mL5HnAV7XbmoU5X2+cf0KqtXXrvJ6SOvOTRUyZUQAMZyWgoJY4+UnusyN9lP/Kl2Uw
         b9rJH3skBNhfpMO3BR9tSY1X/guvQfdUV1J9/OnbQP/Sy7ThbdDlCxLtNRa76/NZzYVx
         kQwe9cRXjw9qmOk/TxNpXY5hZWxXI3uOkpXaf966fWLdYUGH5sl6w93Yb5gfZ3+4B/Zh
         DEW+O5VDQlAFAN6bRvkYtxLevYvdYZPeM+XYU52Xfy21N+jxbVe9vE0sUUJVe2ixeQDB
         T5/47mxM/KYN8MtNldYrHo4xTP6QOFF86eGPHpD84zhdt3NGBT292dvjMQCTpQ5Cc+uS
         6lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064179; x=1788668979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uO+fdQnTYZ+Aocv+Kahxqh7F24JHdH1Qim2aviwHKRg=;
        b=o0q1Xy5DPrkKxU7FAlYQ5lOPEZ/HgflePFdFH+VgJ53pO0VNVY2KzTaoSNagXkrWMT
         yn62r/u84LX5gtXrSF8mU8CNTZy4sN7MAglMtxxM7Z+9jum9ssys/7epx+VYXjuhGylU
         iIMPBDHY0YaLrbTT/htQJ1sfCzOfVdm/8+kAUeAAMXJr3Qq9uLeVOXQvaZYSYT+i9yzH
         NxMt62Uf6JvIOwLmVm3gBSgCBmwBAcuqG61LN+MjZjb+H/CDKx3DjfhHxDKrR42x3xRI
         qthqoRuzFu63UuWdc6EyWKx7Tz/pquwwEhYnm0fj1HY+vkCSit4SWr5hqrw3V72/IRvv
         5r0A==
X-Gm-Message-State: AFuF++lCdpYRuNO/BPSl4PStTV6BwDqVrQdUCeDJWGclSxgsTc67s6oo
	1L9ShDehzSTkiFoNI1sbwUI9ZEvvM4W02aRnKFv3ok9PginL+ncazcJYwHgIMTSn7s2JeFw2spE
	=
X-Gm-Gg: AYBFou0zeMGBlQG93a3yx3AyJimJdHFX8k/w2rm/kB0ymRuJBr723PCF0CUQn3IiUoX
	GGEuk//alhsbhEnDx4zKLJywIPG0J+mDvB/ajgtws09oh5ljhz91PogkfMfBELMIFE8ZUa9twkn
	gfVnKBtP3pKKOkI/AdtTFfMLdmtVoFud2Fz0Boq36+n6glmUvKXoA1UlhWlnxgVmKm1bXkUbL3j
	2vlLPBCZP0PMR2KBHTVDWA4rVCFSV/GPpkUjLfHMOsy8yi9G22TK62h3fUtJpii1YhJyM8TiVos
	qJUYREmY97J2z90FYmc4AwFWZbMXDpyHliRN7grJdy5SjD+F7xIpGqH71IKIRpJ1V3w6XOxRhQa
	812W1pRsl1ZSXSLbzZVj8s82zMvf65vuVt1YWLORrm/YlVtGv+MCzuEJByl+QzS3nDx/botcDSJ
	Po/bnKkW5o3O6dBOdkEKj5L4owTWG8u2syQqpbxvTPHHbMbbUpE1T7la0mMEyOGoiHGLapD20/0
	opL1+eoesWOeoqkYFSZ+IUPw8FZcoJmzwPuGHKONFS+Wi3OhJA=
X-Received: by 2002:a17:902:ec82:b0:2d2:a952:2628 with SMTP id d9443c01a7336-2d74def63efmr160857695ad.2.1788064179371;
        Sat, 29 Aug 2026 21:29:39 -0700 (PDT)
Received: from o6.lan ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8f98d46casm7493535ad.83.2026.08.29.21.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:39 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	zhaonanzhe@xiaomi.com,
	baohua@kernel.org,
	hannes@cmpxchg.org,
	ryncsn@gmail.com,
	youngjun.park@lge.com,
	baolin.wang@linux.alibaba.com,
	hughd@google.com,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	david@kernel.org,
	ljs@kernel.org,
	xueyuan.chen21@gmail.com
Subject: [PATCH v7 2/4] mm: distinguish large folio swap allocation failures
Date: Sun, 30 Aug 2026 12:29:18 +0800
Message-ID: <20260830042920.2280454-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
References: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

folio_alloc_swap() reports most failures with generic negative error
codes. Reclaim callers consequently cannot tell whether splitting a large
folio could make progress, or whether no swap space is available for even
a single page.

Classify failures using both the global free swap count and the remaining
capacity in the folio's memcg swap hierarchy. Return -ENOSPC when global
swap space is exhausted, -ENOMEM when splitting cannot overcome the
failure, and -E2BIG for a large folio when allocating or charging a
smaller folio might still succeed.

Use this classification for all folio_alloc_swap() failure paths,
including capability rejection, swap slot allocation failure, and memcg
swap charge failure. Callers are updated separately to split large folios
only on -E2BIG.

Suggested-by: Kairui Song <ryncsn@gmail.com>
Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Youngjun Park <youngjun.park@lge.com>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/swap.h |  6 ++++++
 mm/memcontrol.c      | 23 +++++++++++++++++++++++
 mm/swapfile.c        | 26 +++++++++++++++++++-------
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0544b2ec4c56..b23108d992aa 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -525,6 +525,7 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_p
 	__mem_cgroup_uncharge_swap(id, nr_pages);
 }
 
+long mem_cgroup_get_folio_swap_margin(struct folio *folio);
 extern long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg);
 extern bool mem_cgroup_swap_full(struct folio *folio);
 #else
@@ -538,6 +539,11 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id,
 {
 }
 
+static inline long mem_cgroup_get_folio_swap_margin(struct folio *folio)
+{
+	return PAGE_COUNTER_MAX;
+}
+
 static inline long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
 {
 	return get_nr_swap_pages();
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 109c08be91cf..4b42f3fc6075 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5676,6 +5676,29 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
 	return nr_swap_pages;
 }
 
+/**
+ * mem_cgroup_get_folio_swap_margin - get a folio's memcg swap margin
+ * @folio: folio whose memcg margin is queried
+ *
+ * Return: Remaining chargeable pages in the folio's memcg hierarchy.
+ */
+long mem_cgroup_get_folio_swap_margin(struct folio *folio)
+{
+	struct mem_cgroup *memcg;
+	long margin;
+
+	if (mem_cgroup_disabled() || do_memsw_account() ||
+	    !folio_memcg_charged(folio))
+		return PAGE_COUNTER_MAX;
+
+	rcu_read_lock();
+	memcg = folio_memcg(folio);
+	margin = page_counter_margin(&memcg->swap);
+	rcu_read_unlock();
+
+	return margin;
+}
+
 bool mem_cgroup_swap_full(struct folio *folio)
 {
 	struct mem_cgroup *memcg;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 70b90fa9c2a0..651682b1fe63 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1735,7 +1735,9 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
  * swap cache.
  *
  * Context: Caller needs to hold the folio lock.
- * Return: Whether the folio was added to the swap cache.
+ * Return: %0 on success, %-E2BIG if splitting the folio might allow swapout,
+ * %-ENOSPC if no global swap space is available, or %-ENOMEM if splitting
+ * would not help.
  */
 int folio_alloc_swap(struct folio *folio)
 {
@@ -1747,11 +1749,11 @@ int folio_alloc_swap(struct folio *folio)
 
 	if (order) {
 		/*
-		 * Reject large allocation when THP_SWAP is disabled,
-		 * the caller should split the folio and try again.
+		 * Reject large allocation when THP_SWAP is disabled. Check below
+		 * whether splitting and retrying can make progress.
 		 */
 		if (!IS_ENABLED(CONFIG_THP_SWAP))
-			return -EAGAIN;
+			goto failed;
 
 		/*
 		 * Allocation size should never exceed cluster size
@@ -1759,7 +1761,7 @@ int folio_alloc_swap(struct folio *folio)
 		 */
 		if (size > SWAPFILE_CLUSTER) {
 			VM_WARN_ON_ONCE(1);
-			return -EINVAL;
+			goto failed;
 		}
 	}
 
@@ -1775,13 +1777,23 @@ int folio_alloc_swap(struct folio *folio)
 	}
 
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
-	if (unlikely(mem_cgroup_try_charge_swap(folio)))
+	if (unlikely(mem_cgroup_try_charge_swap(folio))) {
 		swap_cache_del_folio(folio);
+		goto failed;
+	}
 
 	if (unlikely(!folio_test_swapcache(folio)))
-		return -ENOMEM;
+		goto failed;
 
 	return 0;
+
+failed:
+	if (get_nr_swap_pages() <= 0)
+		return -ENOSPC;
+	if (mem_cgroup_get_folio_swap_margin(folio) <= 0)
+		return -ENOMEM;
+
+	return order ? -E2BIG : -ENOMEM;
 }
 
 /**
-- 
2.47.3

