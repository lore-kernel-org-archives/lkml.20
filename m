Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEA3AAF65
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956010; cv=none; b=UI+BVU2U8IejwRV1MuJTqLhsS53zTiBQsigK4KUDYf8NFbh+IcyasQQ9O1HBR3kzcFrMDTNJxOZoZSzqERANZTsaiprGuRHEgLiSCiIzoSAhoxSz3f7IetQNT3s0bwwO4ZOafCEBBrrX28s0oM2gGdLCvtb/PQu6ZK9jL+NqKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956010; c=relaxed/simple;
	bh=m1+rCSt91Jphcwaj86X1T10TuVUcrZvXIyXWFpploj8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aySrLu+60o2Sa3WyWzk6oFrvRioJdAueLBIoNWtXGbw9n01Vd5YGYHtysiQGGdineTjkJ8gZjqJGZPWh8rPnjmWcMWgPUTuh8H/rMSg+RqMV24rj3oX9k5/ZvDflsukCOF0+xCcHEWzeKIZ6QGGGHNKxWVxHbkAx1PTy/2xlxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U+dBzxuR; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U+dBzxuR"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso386091b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956009; x=1788560809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hySmi/S0MNUtUUZ5XQrsRwLdmYAgAagHNThvawMZTs=;
        b=U+dBzxuRBjErwRo91jTMeW7C5WOC/28nsI4jCSFH3lXNJgRahfzs/HOIBlEbFzmD8t
         bod0UhbzLVkzdX0E+2RgSYyI4UuGIqJQUqEM5UpCrdPuFnkYTx6dQNLS/t/3DU6zeDQb
         cTo+7lNThsPvPm4jqu8mIJAvkkHHdU7m55LIkAGXGsSCFuMxURiUT3pw50chsA3PQQf1
         5esZ6pi4oA9g8Bi03br/PD7kC5qNdi9/bBR6bknjSWYMpP7T0Hn8V+LTl3JJJCF1d8qV
         /mkcGz33Zwfolr4x6dE1+9/ZVH6QInnmcFWizkgrla+Dwb2S0G7Kqj9vLC/Y2TtbpGfA
         IzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956009; x=1788560809;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hySmi/S0MNUtUUZ5XQrsRwLdmYAgAagHNThvawMZTs=;
        b=VCM7lhfy1eKBK9y3JCjNkakf6yGkifIBEwj/AmPWAhdN35RqMxKbrVi88qnLFXQfwx
         6jCHH7O4DNVk5fK8NNM7gOQAffAav/y58PhUjqUMH82IgNHkpHUjoSQGiZMpztbdN2+n
         NxaWEfCdtBdvNC1QjXoYUsw50ApPeYQ+JYLmNmqlwpApaVHNnH4DOtPaq12zNzvFDdgM
         TvBdjrYGYk4eLd4Il/OYD4gMsqIPAON73ae5CdSa5/pPyf6iqWvtuzN89GGyimuYtQRW
         BREmjro9chseQYTbJog8d7U5Jw1+UO2+sVkp7SCZyGVgtBbYVt7dAH7eCErkC06EEY9Y
         NFFw==
X-Forwarded-Encrypted: i=1; AHgh+RrUnZCDed8GJ5wIpbuRjfXd217zbXRxleUKw0FJU9qSUUwCcLtGJpFMBM2w/aTyw30cHGTG5qUJhI9pYsU=@vger.kernel.org
X-Gm-Message-State: AFuF++nAJsQDrL8dLXZcQRCQGWANDQnINyZJx9UJYYm6NU2ItIpwq4Nd
	U55Y8WzSpe2PeSaZjnbRJoNyiGtNRosxmphp7V+MO91IPcrf7XUeplbePU0vf7PI1GJyvr2xxPj
	HT5deVr4lx7rt0nWimKENZg==
X-Received: from pfo26.prod.google.com ([2002:a05:6a00:2fa:b0:84a:3b83:9673])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d0b:b0:851:80de:db56 with SMTP id d2e1a72fcca58-854c892307bmr20792523b3a.13.1787956008574;
 Fri, 28 Aug 2026 15:26:48 -0700 (PDT)
Date: Fri, 28 Aug 2026 22:26:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828222640.1638457-1-jthoughton@google.com>
Subject: [PATCH v2] mm/khugepaged: Don't install PMDs in uffd-minor-registered VMAs
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, jthoughton@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Userfaultfd minor faults provides userspace with the ability to manually
install PTEs with UFFDIO_CONTINUE. Right now, khugepaged collapse can
map holes in the VMA when a naturally-aligned THP is present without
explicit action from userspace.

This is a problem, as it bypasses userfaultfd minor faults that
userspace is expecting to handle.

If userspace implements post-copy live migration using userfaultfd minor
faults, this situation is currently possible:
1. The VMA for guest memory is userfaultfd-minor-registered and nothing
   is mapped in the page tables.
2. A stale copy of a page is present in a naturally-aligned THP (from
   pre-copy live migration).
3. khugepaged collapses the mapping of the THP, installs a PMD.
4. The VM now has access to the stale contents => VM is broken.
5. After installing the correct contents, userspace attempts to map the
   page with UFFDIO_CONTINUE; it gets EEXIST, indicating that something
   unexpectedly mapped the page.

The naturally-aligned THP case is the only case where this is a problem.
khugepaged otherwise requires all PTEs to be present for
userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
correct. This check is essentially bypassed for naturally-aligned THPs.

No changes are needed for file_backed_vma_is_retractable(), as zapping
PTEs is safe. Userspace must already handle cases where PTEs are zapped
without explicit action (e.g. due to reclaim).

Fixes: 58ac9a8993a1 ("mm/khugepaged: attempt to map file/shmem-backed pte-mapped THPs by pmds")
Cc: <stable@vger.kernel.org> # 6.1
Suggested-by: Lance Yang <lance.yang@linux.dev>
Tested-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: James Houghton <jthoughton@google.com>
---
v1->v2:
 - Applied Lance's change to move the userfaultfd_minor() check to the
   right place.
 - Suggested-by: and Tested-by: Lance. Thank you!
 - Adjusted the commit description.

v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughton@google.com/
---
 mm/khugepaged.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b237f6e7662a..22356229c1e4 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1899,6 +1899,13 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 	if (userfaultfd_protected(vma))
 		return SCAN_PTE_UFFD;
 
+	/*
+	 * Userfaultfd-minor-registered VMAs should not be collapsed, as
+	 * userspace is expecting to explicitly install PTEs.
+	 */
+	if (userfaultfd_minor(vma))
+		return SCAN_PTE_UFFD;
+
 	folio = filemap_lock_folio(vma->vm_file->f_mapping,
 			       linear_page_index(vma, haddr));
 	if (IS_ERR(folio))

base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
-- 
2.55.0.897.gb25b4bd76c-goog

