Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1E26E165
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007656; cv=none; b=exXlEtzjNnO2Xf6ydLlWENFRYzTfbMiQRnlS0JaIZk0u95hyDyZ46O6Fu7aa4NklhGWxzqnQAviTIbrBdshB8NCX7jAbh6a73v5N+Dn4bWBhkCpSWEmQX/ZbMJITMSqWEzN3r3aAu8fMldh0KYGI0MnQI2BtLQhnhSz38AZme+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007656; c=relaxed/simple;
	bh=Jy0UtrW6h82ZtQ6t/QbHZtFNdVzH9nghsmYf6hxhxTA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qZFT07gM1VH3bN4/GLiOnqVKfexc+TZomWBamh9Q5fARiJpcMY37d92Jhc2jYHov6vT6YCJRu3nPRS1fgG7GvicG3yA9p7wSF1riyHSnEU58XqIqbVUvgcGLICJ5vR20Db4cp1A9sRdGaV0nbZ2zU08wgHX+fN2zU3VM8SVM04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SPPEjnhE; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SPPEjnhE"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1063893a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789007654; x=1789612454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCBRc7qyPLFL+OJFBYmAJyv6e7+fNwOVRVnLSpwhyZU=;
        b=SPPEjnhEEI4N/S4ambGS/HCnn1kJGSxc3REAiB+yanjsSaXh2LrYXmNx056n/7xJbs
         NexEhrA/bx4cbRizn4B5kvrR1nnBxylmE0KckSTzhqarkckkplxt9pjd0zKqTuVLiyDq
         icSDopvFvWuBThITMnZBMp1GsWMnMt86x/wWgzW0rNPWTqlxP+AKJH+5K2lyqhXQh71x
         2i4y1sLSQbgUoaIq7LK0TPxKgEjJOaV+LukurivlfCe794wwWyIppMZFxUaM0/9ujAq/
         MJMW4An14FmzIjl+3nX5jeMb+scR7cJ+25Zb67cYbci15ye+tR3PrdoO+3JFkJMg3BDY
         qaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007654; x=1789612454;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCBRc7qyPLFL+OJFBYmAJyv6e7+fNwOVRVnLSpwhyZU=;
        b=WOUDmWdqYaOeWerhvrpgof0p/MOIkAZ3JPgO+T6FlCxKQWwDlSfDeSBnxZkrUPtm86
         YvKHHi/0FZO2OjW0MxrK/JxC0WqGdyJ9vQkmorYZSfvz6wDGmUBu42bbkKJbrDzL2kTt
         SrBHi3t3sdOGUk5W0CcWqa2LIcQzVMGRZai5XIl5L332b5F1wPXDl8Yt/mpcGciXdHoN
         2B5RUt2ZfvWbNZOAqRXraIJYRgAmdxAhN7D+qzuA9WkmfJxVREF/hryXlwur0mTI3DyE
         asviL+QWDjSPFiIlgdYvbXhwszP38YBxf1dJzulM3Pd0vcK2VhSdAf/RSOBFmDnAS3Il
         wirg==
X-Forwarded-Encrypted: i=1; AKwUvBwShRM6WIFH1r2apk4M+30E8Dw1gbFyyObKUrrjtkX2QPoA6u4AP1AVuyS21bCNCc1g8IHryaaEzKzDXn8=@vger.kernel.org
X-Gm-Message-State: AFuF++lTJw1WmuVfGJhggALHju6NbFGjuvGk32MUPmNAuNjAx/j0fHpp
	Lw63Jnsk+SizzySo9ryh+1DV8v7jk9hPSWz+WjY9MF0xrsMRTqT3oIYO8b1Wr4KLKv3jaxCWRPM
	hVdZNysYlG5UQ+CZ/kjnUnQ==
X-Received: from pjqo17.prod.google.com ([2002:a17:90a:ac11:b0:396:54ba:892d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5485:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d77a1d83bmr1950372a91.6.1789007653937;
 Wed, 09 Sep 2026 19:34:13 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:34:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910023411.514987-1-jthoughton@google.com>
Subject: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, jthoughton@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Userfaultfd minor faults provides userspace with the ability to manually
install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
holes in the VMA when a naturally-aligned THP is present. This is not
true for khugepaged collapse: the PTEs will be retracted, but a PMD will
not be installed.

When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
userspace is likely to expect UFFDIO_CONTINUE to succeed on the
should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.

This is not inherently a problem, as MADV_COLLAPSE is an explicit
userspace action. But, especially because MADV_COLLAPSE can be invoked
by an external process via process_madvise(), a rogue caller could break
a userfaultfd-minor resolver thread. If khugepaged is later updated to
install PMDs for khugepaged collapsing, that would be a genuine problem.

Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
faults, as MADV_COLLAPSE will only resolve such faults if a
naturally-aligned THP is present.

The naturally-aligned THP case is the only case where this quirk exists.
Collapsing otherwise requires all PTEs to be present for
userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
correct. This check is essentially bypassed for naturally-aligned THPs.

Suggested-by: Lance Yang <lance.yang@linux.dev>
Tested-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: James Houghton <jthoughton@google.com>
---
v2: https://lore.kernel.org/linux-mm/20260828222640.1638457-1-jthoughton@google.com/
Changes since v2:
 - Drop cc:stable and update the changelog for the main patch.
   khugepaged doesn't actually install PMDs, so it is impossible for the
   kernel to silently install mappings that userspace didn't ask for.
   Therefore this patch does not need to be backported.
 - Update the uffd-unit-tests selftest to account for the new behavior
   (new patch). This patched selftest is equivalent to the reproducer I
   provided in v1.

v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughton@google.com/
---
 mm/khugepaged.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75639298efc2..e6947fe142ee 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1894,6 +1894,13 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
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

base-commit: 5acbae5f7eb3d5275120abfe698c394b7325dcec
-- 
2.55.0.1007.g17ff1f9808-goog

