Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0F383993
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942262; cv=none; b=U3vOgaC8b86zPYFWbZQnr85XNfwM8iX4CUx1NfYOE4tTsJzBdOD6SGkg1yZUqHyHkX7CXWXJx7y5gmnzPCgzG+WithO0voMJRdsJyrPNuy8uWWMiBdaztw7+bYYrECo7TIi9n/o825ctiWaz0tZ2Zgpb5P4o+O/Hnd72+7ZefD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942262; c=relaxed/simple;
	bh=ud+62vNrtpRD4J3vyDMNpiYp6k5bWYTZ9esKw8TJHoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fLxJYnvImxJyzNQqFySJDegkaOlMttaDmLxfzwqT8C0DAdxyYjcinIkdQLsHGtbM0bdRCe/kwHUqIRL2hfjSS6/58mFkSmCSUXQH4muO8QhFjo5WS0sw85azCXJ4uNOKl1GkKTfSrgAPNh3vlSDSzgUvmdIXMEjspm+6JnYRlZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGmDBETA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGmDBETA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1289106b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942260; x=1788547060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p42zDyAV7UZaUy//KUdiOCk0RqqsUcLlIr4kopLObvw=;
        b=pGmDBETAGqQmRuswFpfy0glDWr3lQvFTVJH34mSK6oZ9IsmP+dpw4lyGIzQkOuiE79
         8SQ7AOglZG6FUhavKhOu8H5R7avIz7ujwx0Km0BDZlzlYu90/UyV1sjDr7E+QmCjLTv+
         PfsJGUSyxCMd0uSnxVXpnhWCVrAT+cmgWOKVVMrk41gHuqqizqkeTDD9hx/0gwKi6vQg
         WoF6TLFYeukr95Bmsz6pjmyRcLYuTkC4vQN//x5fk7WKUosfjoFEPH6QggRaxEP/AG30
         R4o36WmOnfamqLqOn4JNW6sf8Tj0PW02vtH3h6+jneQxMHOy2UmkdfbRsSH0FS/iZntc
         XtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942260; x=1788547060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p42zDyAV7UZaUy//KUdiOCk0RqqsUcLlIr4kopLObvw=;
        b=icawQfmw9pxNMFuAJqAV8q9zJRl3W0aODzEPQkRmXAdWxfwwWYo3V/8e+pfA3jmZ2k
         QnLgIZqGmgXgHJLx4gz22lan4QMFrfMM1CYCNUlbyW7mF5CDC/+0ai4HksfJJC+p+AW/
         bNFWgWuy+BZfaxt/UiDQdmkjhIpC0sJDfbGZqrWYlCtt9YAyifbwQ9jonehrw/BfwcS7
         Zm5kj9D8jcHh/Iux4/D2ZMJMOhYddY+3mPD6frAnIHUwB5CAhEc8J8w2osA8WM6XiX9Y
         1QyKgyVV66UX4cxo3K22E2pWHqbUOiuuc+F7QFT+5y6BpZzZF1RbZKYJ8FTQOSPmBUAE
         JS/w==
X-Forwarded-Encrypted: i=1; AHgh+RqzorpURD+m6z3HoanBy2vENHYTXez+XV7QM0b/T1zDQ7U98hKQeWCo0wUxZaK2ptG/P5BxYG5fau7BoPw=@vger.kernel.org
X-Gm-Message-State: AFuF++lylEusnxRuoe8IltxhN/b+7d+VDRFieYfFbiyDuWo7JPjY9LCQ
	j99HG9ib57HxxkQSLr8WfZDmIrpeWd11PPL788W1EVmR31DpweQIn0sm
X-Gm-Gg: AR+sD12HcvWunCmWYl6cDQTgO9DTHEHZ3p6xTqlDorrgxjzPsyXbEc0VAwRck08gPeR
	V9ZMyLCFd1Vs627oYKBAWwN1pYzUq40STEtzZon3r3h7t0WMqNY6IQ3NKQYlE1P/CwA1aIRluyZ
	+pUXZgnjLeBc/iP7SQYMq6mQZRx2PiXwTWVeCGHZo3trJEUfqlFq8AgEUDw86p0AQ+r6JzKZbZX
	tN+JGRbu7qUqMfcOb4olKot0bE403t2aKsRLC1klopWDwFuZ0ezjwdPhr8GLRz9Y5nB/AULQRos
	Hd6DW5yKwfFLiUHh7txvi+XICLDBF59falzbYDsSGqq4Jz7mHStLN/5p63yCQT4yxNI7wLVEp47
	Jh02t0PYIC0gJMsRjG87aH/Bb5gV5q4pnJblYq39MQgDZn+kOS9u2/7Jll7I6WxP+eXmd6vv92a
	5UNWVeUU2Fz/vqXszj4FgI/Rjoz5XENY5Rk6KV/5WAbFOxHWXDX8Puw482fkXOmzOfjlbMUeGDt
	C3u1OxjQlmOGzA89/A=
X-Received: by 2002:a05:6a00:4f92:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-8562c04ef5emr16403554b3a.15.1787942260279;
        Fri, 28 Aug 2026 11:37:40 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:39 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 5/9] mm/huge_memory: dispatch on the folio when splitting a huge PMD
Date: Sat, 29 Aug 2026 02:33:15 +0800
Message-Id: <d405f7cba179d5383352f88cabe563eb900eaf20.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only anonymous folios carry the anon rmap and PageAnonExclusive() state
needed when rebuilding PTEs, so decide the split path from
folio_test_anon() rather than vma_is_anonymous(). Treat a NULL folio as
nothing to rebuild.

This only changes behavior for folio/VMA mismatches, which are not produced
by any in-tree path.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b2ede9a6ae5d..1cd8878edc1d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3244,7 +3244,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	if (unlikely(!is_present && !folio))
 		return;
 
-	if (!vma_is_anonymous(vma)) {
+	if (!folio || !folio_test_anon(folio)) {
 		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
 		return;
 	}
@@ -3254,14 +3254,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
-		folio = page_folio(page);
 
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd(old_pmd);
 
 		write = softleaf_is_migration_write(entry);
-		if (PageAnon(page))
-			anon_exclusive = softleaf_is_migration_read_exclusive(entry);
+		anon_exclusive = softleaf_is_migration_read_exclusive(entry);
 		young = softleaf_is_migration_young(entry);
 		dirty = softleaf_is_migration_dirty(entry);
 	} else if (pmd_is_device_private_entry(old_pmd)) {
@@ -3269,7 +3267,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = softleaf_from_pmd(old_pmd);
 		page = softleaf_to_page(entry);
-		folio = page_folio(page);
 
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd(old_pmd);
@@ -3321,7 +3318,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 */
 		old_pmd = pmdp_invalidate(vma, haddr, pmd);
 		page = pmd_page(old_pmd);
-		folio = page_folio(page);
 		if (pmd_dirty(old_pmd)) {
 			dirty = true;
 			folio_set_dirty(folio);
@@ -3332,7 +3328,6 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		uffd_wp = pmd_uffd(old_pmd);
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
-		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 
 		/*
 		 * Without "freeze", we'll simply split the PMD, propagating the
-- 
2.34.1

