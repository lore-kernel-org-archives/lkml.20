Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE074F85AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718812; cv=none; b=PyilDVdUXDBsbx8w5hmdYw8yUm+/T5MjQ/UBDzguy+aJSb/4F3saGepVOahslFWgRC2FgdGdKVCJpQheE5lac9ee+Eg4NOFjBt12UDk0uJn8SUR55oebNQ00e0R1jToAglxHxsAr5JlnGLYJ3zxTrPJe1gjWxBWbHRoVk/SUDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718812; c=relaxed/simple;
	bh=zy3WB88Gh+9giL7f7lt1rNCdYpvZX+8pkullc4ajsNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JNIX70YnjVn9baHT3jNQ8PsuSGjyr4NlZf4Ipv1UKEF7xrmY0RDtF8E8u567Fkz8HHZAfwZc1H60dqbCdgsdZ3iuT1BViRN5wFlKuguC+HU+VQ3s3YzzrfSJdJV674I+lbXw3QC43EPM/WL7JAOZD8ZAB7srDrGCR1V9yo0Dnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=axZHPMz3; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="axZHPMz3"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6925126eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718809; x=1791323609; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CeEHtfAYQ81dX38UqxtJ4tymGYkKnxF/72M2lR/Oxw=;
        b=axZHPMz3zMa655X6tjVJvx8NKEdnhgunsp1ZBLgKkrXzVcdnJJEUOnOhQxhrAqUjUL
         +i+hVx0CLIcYKKnzLXRD83EvK87BK1IwLPqd7sZEEh2FpW3JtBWG4D8ya9TGavWJNn7o
         FzjjVU6QTQo0EM/+U6LMRhTFU2dSbk9BTuyTFmdnKlHlM971HMqxeggKbaTXFTkXEqLp
         KIDH04okSyFNoE0E1+cI+bwqVxUGcT3iwVSGakBqga/jtBnvSeqOCLb1oOkhLokv2dge
         SAYrmytGQPjGNaDcTb47hRw2cL6cmbRt+hJPBfTCqqK/kq0JMSKpri6RqAUn+8g+zOTg
         ENwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718809; x=1791323609;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CeEHtfAYQ81dX38UqxtJ4tymGYkKnxF/72M2lR/Oxw=;
        b=JrIT9PH+wJVWtvNtRNCrxpZWyvJt39NK1weYF6tDCeCxkq1PbDGUsDDBzTCdJFB7Fy
         sLbmoZUBRz0Yjy1icdniOVKdqx5nknwcs5dhjdNF6VpUxGEVpKWcMAxdNRmKqMNWxhsC
         V+NUiUi4smbsgv/hqHZiVhscYTbTZkwAJTqis2tfqWsBbLJTNwc9Msx/TUMjuq0/e4a2
         Ylwwh+GQazRK4TFHfObqPTfcrhZZwG8b1CkXbXslCuTQixOoEdpQcu8CY7pE2ekJ+spg
         NM0MDn3QhQmDG8cJzuEUBiS4y0zNgZn2vU5bbyW1t+1+h9jXFjc/HF5z+ADUZVFxOozB
         vo5A==
X-Forwarded-Encrypted: i=1; AKwUvByzmmclASV9ardCE2hb1lmypiLrhmXmiLmiuBiHKBsgi1V5Zsq9/WAYOiCoW66oXziVPuI6IQRhwWjXccM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9YTF+LhYnAbOslY6hk+XuvSfrFae10amAThh8RPef/9AfE8Is
	zHeqvREmARRA3bypok2ItHmiZozDtZ/WZpchSh6dXGkENbj0j72952wdsUEczpNZTIZE2H6MSdF
	VY+MIbBds0hrEVC+dCeGbCQ==
X-Received: from dyox34.prod.google.com ([2002:a05:7300:7fa2:b0:339:75cd:ba34])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:e109:b0:342:3bf4:77fe with SMTP id 5a478bee46e88-34c62a54248mr735000eec.11.1790718808576;
 Tue, 29 Sep 2026 14:53:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:00 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-10-nilayvaish@google.com>
Subject: [PATCH 09/15] mm/migrate, vmscan: use folio_page() for movable_ops helpers
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page, &src->page, and &dst->page uses with
folio_page(..., 0) when calling page_has_movable_ops(),
putback_movable_ops_page(), isolate_movable_ops_page(), and
migrate_movable_ops_page().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/migrate.c | 20 +++++++++++---------
 mm/vmscan.c  |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f..b027c938d830 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -266,8 +266,8 @@ void putback_movable_pages(struct list_head *l)
 			continue;
 		}
 		list_del(&folio->lru);
-		if (unlikely(page_has_movable_ops(&folio->page))) {
-			putback_movable_ops_page(&folio->page);
+		if (unlikely(page_has_movable_ops(folio_page(folio, 0)))) {
+			putback_movable_ops_page(folio_page(folio, 0));
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
 					folio_is_file_lru(folio), -folio_nr_pages(folio));
@@ -282,8 +282,8 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	if (folio_test_hugetlb(folio))
 		return folio_isolate_hugetlb(folio, list);
 
-	if (page_has_movable_ops(&folio->page)) {
-		if (!isolate_movable_ops_page(&folio->page,
+	if (page_has_movable_ops(folio_page(folio, 0))) {
+		if (!isolate_movable_ops_page(folio_page(folio, 0),
 					      ISOLATE_UNEVICTABLE))
 			return false;
 	} else {
@@ -1199,7 +1199,8 @@ static void migrate_folio_undo_dst(struct folio *dst, bool locked,
 static void migrate_folio_done(struct folio *src,
 			       enum migrate_reason reason)
 {
-	if (likely(!page_has_movable_ops(&src->page)) && reason != MR_DEMOTION)
+	if (likely(!page_has_movable_ops(folio_page(src, 0))) &&
+	    reason != MR_DEMOTION)
 		mod_node_page_state(folio_pgdat(src), NR_ISOLATED_ANON +
 				    folio_is_file_lru(src), -folio_nr_pages(src));
 
@@ -1308,7 +1309,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		goto out;
 	dst_locked = true;
 
-	if (unlikely(page_has_movable_ops(&src->page))) {
+	if (unlikely(page_has_movable_ops(folio_page(src, 0)))) {
 		__migrate_folio_record(dst, old_folio_state, anon_vma);
 		return 0;
 	}
@@ -1375,8 +1376,9 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
-	if (unlikely(page_has_movable_ops(&src->page))) {
-		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
+	if (unlikely(page_has_movable_ops(folio_page(src, 0)))) {
+		rc = migrate_movable_ops_page(folio_page(dst, 0),
+					      folio_page(src, 0), mode);
 		if (rc)
 			goto out;
 		goto out_unlock_both;
@@ -1903,7 +1905,7 @@ static int migrate_pages_batch(struct list_head *from,
 			 * If we are holding the last folio reference, the folio
 			 * was freed from under us, so just drop our reference.
 			 */
-			if (likely(!page_has_movable_ops(&folio->page)) &&
+			if (likely(!page_has_movable_ops(folio_page(folio, 0))) &&
 			    folio_ref_count(folio) == 1) {
 				folio_clear_active(folio);
 				folio_clear_unevictable(folio);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 91295070ca33..150ffeec3d47 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1709,7 +1709,7 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 
 	list_for_each_entry_safe(folio, next, folio_list, lru) {
 		/* TODO: these pages should not even appear in this list. */
-		if (page_has_movable_ops(&folio->page))
+		if (page_has_movable_ops(folio_page(folio, 0)))
 			continue;
 		if (!folio_test_hugetlb(folio) && folio_is_file_lru(folio) &&
 		    !folio_test_dirty(folio) && !folio_test_unevictable(folio)) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

