Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6E4E4331
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718822; cv=none; b=JbGJaCq5Y41AMLMSnpSRnibNOIAlBHDaFXJ5t72U1fXUK6bIa6c7Hk/jeRj17+och6LTUlTVnQ0pnEeU0ELz5ilGHSOTv3H86o9kCtCDHKSwbhspQ06KOcppT9iEIpz/c7ENk5cWaWuQzb6J+sylotmW7fRRnCoCDg/3SQ4/inU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718822; c=relaxed/simple;
	bh=tDQHc0EXD8+r341j469ejenZmXHJE1eFjYq8CYYnI78=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UXeH6Kq/bZ9RHcPchVEI5fm4PWoSRpUgNnVZY7mBAjdBsNDn1DPV1RkrIBeCPxCADxlMMYuO4AFh00Otvy46RkYc7jydzwQ1NPLY0aziEyiRjCXQOspTC3V4r2a0xPfpk7eGuDhqlrHUOMUS1bLYnbtblC0yAtky4n1svi20vV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AKVWr4pY; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKVWr4pY"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14a62326b51so2160027c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718819; x=1791323619; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMygNuDtUV+X2v5M1Qvd80fwfvhUlqB4ex468SXCvkQ=;
        b=AKVWr4pYfSz/FKW1HzeKHf9d4AVY573yFRImNr4uoEqTglT11rrl+aRD/zWFWIqw64
         Ah9xER9dBN/9SUHGJejhH/TqIJ/rZHD2CVvPcrWJ+Yf3uyEMEKXTnMcRgs97NEDNdCrg
         GCnlD7EOMLwJ4x3WRkcWEHQIGHvCDZnbiRXnGEuBALiX729tOzF5LpcGdQ9Zxyb7iTcX
         ErVw7uUDMk88loOFsfbAiKUvWApj02U/JAu26fdTbHcYKEhQwgreEuO71tJpsGNpiV3G
         SnSGviOQGMU+2UfXizw1tA9B44blX8QH2vtJvtDlba7fwQ0iYqdpXwiPte6M/lRCQMN1
         EctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718819; x=1791323619;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMygNuDtUV+X2v5M1Qvd80fwfvhUlqB4ex468SXCvkQ=;
        b=Uw+tOVV5NhAp5yYlAMF0Lq4SGBeSNF3ihQf5SnbDxm/I3nVgu3kWrrjisyNpjZ7Len
         vNZYD/6nq308Qu48k+DNayP53p1Xo+VSaPF9/pBjC5BY9Is5X1KgC7aPVNmQxahVrWsA
         6mSh3zpeYfVH8CsmcCB1EnOhEV8o9opNahcJ3Z+Lf5h8zqguJ2pS3q7I99l78uTgfe91
         akkiSjU2E/aK3TdnecDg10/b+BvsVkkz+41S192GUp+iJjWFw0vr6i/S5HOLSlx5voEB
         LUGpEjYJ9TuMD2G5msNXgBIkv7g2gGUOVi+g1DPccn+qRiSafXW9mM+7T1d8Ez3z2b+i
         /zAg==
X-Forwarded-Encrypted: i=1; AKwUvBybJUOX6HRGnFbPH815nFDTDOkxlReuh8hyr8iD49eqpiG4n/imnMjkV6J/pg1Opd/B2kOF9gtp64hMpik=@vger.kernel.org
X-Gm-Message-State: AFuF++kwliVITH+xtfnFkGqy3afSoMFRX90JARbuk9taHQ/Bg+srXbQa
	9J6aXiyU4j8NhGF0LPr08Wld34L4f3rv2T7hWIcKgGuFBiz+0jItSdTym8G0fQNZ+cWLpwFXyVB
	VEznJ6ncwF5cQ4TxRkkQGXA==
X-Received: from dlev29.prod.google.com ([2002:a05:701b:465d:b0:143:6e9d:bb50])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4188:b0:143:2984:6519 with SMTP id a92af1059eb24-14c9e6774f4mr781938c88.36.1790718818118;
 Tue, 29 Sep 2026 14:53:38 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:05 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-15-nilayvaish@google.com>
Subject: [PATCH 14/15] mm/page_owner, alloc_tag: use folio_page() for page_ext
 and codetag
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page, &old->page, &new->page, and &newfolio->page
uses with folio_page(..., 0) in __folio_set_owner_migrate_reason(),
__folio_copy_owner(), pgalloc_tag_split(), and pgalloc_tag_swap().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/alloc_tag.c  | 10 +++++-----
 mm/page_owner.c | 15 +++++++++------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 82e2c3448dcf..c93efb224ce1 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -534,7 +534,7 @@ void pgalloc_tag_split(struct folio *folio, int old_order, int new_order)
 	if (!mem_alloc_profiling_enabled())
 		return;
 
-	tag = __pgalloc_tag_get(&folio->page);
+	tag = __pgalloc_tag_get(folio_page(folio, 0));
 	if (!tag)
 		return;
 
@@ -560,16 +560,16 @@ void pgalloc_tag_swap(struct folio *new, struct folio *old)
 	if (!mem_alloc_profiling_enabled())
 		return;
 
-	tag_old = __pgalloc_tag_get(&old->page);
+	tag_old = __pgalloc_tag_get(folio_page(old, 0));
 	if (!tag_old)
 		return;
-	tag_new = __pgalloc_tag_get(&new->page);
+	tag_new = __pgalloc_tag_get(folio_page(new, 0));
 	if (!tag_new)
 		return;
 
-	if (!get_page_tag_ref(&old->page, &ref_old, &handle_old))
+	if (!get_page_tag_ref(folio_page(old, 0), &ref_old, &handle_old))
 		return;
-	if (!get_page_tag_ref(&new->page, &ref_new, &handle_new)) {
+	if (!get_page_tag_ref(folio_page(new, 0), &ref_new, &handle_new)) {
 		put_page_tag_ref(handle_old);
 		return;
 	}
diff --git a/mm/page_owner.c b/mm/page_owner.c
index cfc31c92d765..39c381699a63 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -365,7 +365,7 @@ noinline void __set_page_owner(struct page *page, unsigned short order,
 
 void __folio_set_owner_migrate_reason(struct folio *folio, enum migrate_reason reason)
 {
-	struct page_ext *page_ext = page_ext_get(&folio->page);
+	struct page_ext *page_ext = page_ext_get(folio_page(folio, 0));
 	struct page_owner *page_owner;
 
 	if (unlikely(!page_ext))
@@ -398,14 +398,14 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
 	struct page_owner *new_page_owner;
 	depot_stack_handle_t migrate_handle;
 
-	page_ext = page_ext_get(&old->page);
+	page_ext = page_ext_get(folio_page(old, 0));
 	if (unlikely(!page_ext))
 		return;
 
 	old_page_owner = get_page_owner(page_ext);
 	page_ext_put(page_ext);
 
-	page_ext = page_ext_get(&newfolio->page);
+	page_ext = page_ext_get(folio_page(newfolio, 0));
 	if (unlikely(!page_ext))
 		return;
 
@@ -413,7 +413,8 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
 	page_ext_put(page_ext);
 
 	migrate_handle = new_page_owner->handle;
-	__update_page_owner_handle(&newfolio->page, old_page_owner->handle,
+	__update_page_owner_handle(folio_page(newfolio, 0),
+				   old_page_owner->handle,
 				   old_page_owner->order, old_page_owner->gfp_mask,
 				   old_page_owner->last_migrate_reason,
 				   old_page_owner->ts_nsec, old_page_owner->pid,
@@ -423,7 +424,8 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
 	 * will be freed after migration. Keep them until then as they may be
 	 * useful.
 	 */
-	__update_page_owner_free_handle(&newfolio->page, 0, old_page_owner->order,
+	__update_page_owner_free_handle(folio_page(newfolio, 0), 0,
+					old_page_owner->order,
 					old_page_owner->free_pid,
 					old_page_owner->free_tgid,
 					old_page_owner->free_ts_nsec);
@@ -433,7 +435,8 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
 	 * when subtracting those pages from the stack.
 	 */
 	rcu_read_lock();
-	for_each_page_ext(&old->page, 1 << new_page_owner->order, page_ext, iter) {
+	for_each_page_ext(folio_page(old, 0), 1 << new_page_owner->order,
+			  page_ext, iter) {
 		old_page_owner = get_page_owner(page_ext);
 		old_page_owner->handle = migrate_handle;
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

