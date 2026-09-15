Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3595244E053
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456415; cv=none; b=l4YcAuYyxsSOtuitBNT9Tj9ampsTPwzrM+vjSfv+qgqJ4o8Sp+S2YWL3NrdEE63j1ItHuP0B4uz7vZ9fyZ+iN4JXJR9w7pPgpBH/QYJDkm2aJ6XrUtiNh6rb9vALS4CnoMuCXf+OoScYapNZy5cyPJynCghnhdwMveKJe7x4o3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456415; c=relaxed/simple;
	bh=UTsJbixj5f5upm1yDL4v2oYlqoNy1xwwPfF04Oakgjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQZ3oKObGCOKYIMNE76vhXXIw+yeoiWP5lcZ8QDbHMPXU++j7+DKft2NDBKLSsD100LhHLzOf+z9pnS7dwEmTrWiU2zRZVEgRX1dyRMcvFp6BtBNKu8GuViVF2k50o4VcLzhPp/7byPgX6K7nB3/+ldbVbUTmhU+cXCLyoCSCRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdeQMyLY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdeQMyLY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so35141135e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456412; x=1790061212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/q6Adnz7lpVRwZWpJQefNRmiB7gYNF+Y1dkZ8i2uhk=;
        b=TdeQMyLY483Qp3Ir6tu8G6PkGn6zU2tSNhUlJuxdPVNh6QrxeOSx0ZvzVGn3YZaE2i
         jsXLQpnqLRsGCnCCl+SWQz2U36ut6w/rJp2DPnwcSnIuKg9m02l+CS9DvG5IOD88bmnJ
         804fzUEtb/ji/A5EsdGcWuLSO7IxCSO9vo3gYwkvRgPyUg7hNRiObI9uKfGRY8KmXVmU
         lVVzBNjmh4mH+Y7hz1z0Sbq5Lc5+Gjdi/6W9/42Yotkzi0P08HGaXlg0W9PUQozt+ZFw
         x4jiZcyA6inmc60uXUgXidAfiaerZU2bcmEgwvf5z1PmgroC1/U3JylX2a/flHzKcuB/
         5+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456412; x=1790061212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/q6Adnz7lpVRwZWpJQefNRmiB7gYNF+Y1dkZ8i2uhk=;
        b=pTKp6oeU8x1QwiHYz3yvThpakpuEJw/dUuY6a+Wc+YQeWk9FjRPXaXlbbvV0sSWe+O
         6HlabJaKszvCUwEsQLI15iJ3+2J95tqT8/k03jRFiElw94cBb/aieIV/MxbLy7eNTQIW
         LDyQ0H3vHrM/7GzxefZDg7oJSd1x2PXa484Ivjg6X78XAE3z4Z/d8udAwS4fA7oPzst3
         0QvGCUtrcFwnuSQs4bn6Js5isbod/s9SB7GwLP/53AKbx8MJoGaQlrhfI3ZP5gJcD/gw
         NJzRmdb6F6immYebZsQ2u2cfZwaYAp8sxu+9P9miul2qEQvllUezB2fMOV/GGY0C4LD1
         BtyQ==
X-Forwarded-Encrypted: i=1; AKwUvBztE3RiTbw2EoAeTY3YK9FRcO0HL64VQYJ+RXmZ/0fDgIvvF08dxiI8ThSbVS70utAwuNtBGot9p9imPPs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0Sw+rDeux65syAItFWPUBrTdZdyW2OgXmzksfWaATVE/C5Sgc
	2oVwCa00ul44SklQqt/xJb3g2LX5xM+47obMso431/2bqhKW7TlB/GGg
X-Gm-Gg: AYBFou0QqUlLLtssZW6+aTWGWnaU1/hojna01uAMMRf+Fk6ZHQ8Yvd9NX4uHS7waEy6
	3sqJ7vFZUgzUM5/ocl9p1Mnp8j3MFXfJoFDlidHIOdDriFXUOf7KUIOSiymUzKQR5nJUAaPCyiw
	LAx3Ee6hAuqcqinfh2Uek+1fTnorKt8AGSE+feOkxLbn3tVmnYVF5Z0c8z/yUojYiHXHGCzZih1
	W0rvUrCkfR/e/Jq2QhIlNzeOCUXFyKK5Z+qPDgeLYXERHi/zI/QXKbiKJR2MUH2K/9szXtTGkw5
	MLlZs+lzGqZ2RRnz86f82L63EE/UNOO8RSRhFoir/8Z+43KiWh6SYnPNO6xYlbLDjhCGQrA487m
	hebh5XWVupZmGtqvP6WJE2J3gRMzvRNwOAIKzpHRzcdV4JOxYFRWWdY4rObv/FXLJvsB6UJKB+K
	WYtNHSHr5L6n/jIa3KqH9VOwd8zhdFzr6Soynj7mcMupwhbVMpfPd7ckoCxO+Mnreu4XEc/rmyF
	Lk8UI6y8qfNO94rGyWb7SMg3nGSdnfgwRwc+syGvtOysQ62N+fCKCdc3dPmY9afNyGPgOLmJ7Yk
	9rkLTpU1zm6rDoUMEg==
X-Received: by 2002:a05:600c:3586:b0:49e:747e:c00e with SMTP id 5b1f17b1804b1-49e7a64e729mr82091545e9.9.1789456411633;
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm42941345e9.6.2026.09.15.00.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	osalvador@suse.de,
	stable@vger.kernel.org
Subject: [PATCH 1/2] MIPS: mm: align hugetlb mappings in arch_get_unmapped_area()
Date: Tue, 15 Sep 2026 07:13:24 +0000
Message-ID: <20260915071329.15125-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since hugetlb mappings were made to go through the architecture's
arch_get_unmapped_area{,_topdown}(), every architecture that implements
those has to align hugetlb files itself. The generic implementation and
loongarch do it with huge_page_mask_align(); MIPS was left out.

A non-MAP_FIXED mmap() of a hugetlbfs file therefore returns an address
that is only SHMLBA aligned, and the kernel then installs 2 MB PMDs for
a VMA that starts in the middle of a PMD. The consequences on an
Octeon (CN63XX) board running a process that links libhugetlbfs with
HUGETLB_ELFMAP=R and HUGETLB_MORECORE=yes, all within a minute of
start: the neighbouring 4 KB page table is clobbered, the TLB ends up
with overlapping entries ("Caught Machine Check exception - caused by
multiple matching entries in the TLB"), process exit trips
BUG_ON(start & ~huge_page_mask(h)) in __unmap_hugepage_range(), and
freed pages leak into unrelated kernel structures (oopses in the irq
maple tree, in pte_offset_map, ...).

Do what loongarch does in commit 3109d5ff484b ("LoongArch: Set hugetlb
mmap base address aligned with pmd size"): when the file is a hugetlb
file, use its page mask as the search alignment instead of the cache
colour mask.

Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
Cc: stable@vger.kernel.org # 6.13+
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -9,6 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/elf-randomize.h>
 #include <linux/errno.h>
+#include <linux/hugetlb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/export.h>
@@ -72,8 +73,11 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	}
 
 	info.length = len;
-	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
 
 	if (dir == DOWN) {
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
-- 
2.47.0
