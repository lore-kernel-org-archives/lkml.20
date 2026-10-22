Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640842;
	b=aFLBdUHIiafSwDlMlq/LFgakqpXsZeOdNIAp21htHT2h+uyIrrXE3YHn76QJB7rlGgu2
	 jr4G6hIZAEBuAhYV0JVvcdJcmWXYfHfwfbQCL2IMPP6wr4X+Jn6NI+8oMmx7YIiC2MXrE
	 Aewq4u3Bz18DYkCuvAbukO/hEWCP6JQD9KkctwCBKDApVDVyYPdyQEKLLt9Xab07Uy3wy
	 7bl+n5Kcs8IWLiayBgG40nzEhy6nH+z+vznpy2XCLbjpd1PstPIZ5S6lcaDI/AgGpzzPC
	 U3esY0hHXTsVIarMEM79FF06C7VbeFsv13BMLIOg8FJWEkXv0Xgo8w8S69yxm/J3QBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640842;
	h=DMARC-Filter:DKIM-Signature:Date:References:X-Mailer:In-Reply-To:To:
	 Cc:From:Mime-Version:Subject:X-Original-From:Message-Id:
	 Content-Transfer-Encoding:X-Lms-Return-Path:Content-Type;
	bh=xvUjiyMCs7JZfFFIwk/bmLJ9gLcg5Lr3+0R1L0w/QTU=;
	b=4aeTYQHS/j9yV6Qf7lEo9OQz0+wPKS7s4xerVPegKb4/uuFgaj+nDpoXBMjQ3WYnxAOt
	 /21TOQy8Wg2Qtg+r2z0MqVSAilro4tKc6LuIF3a9kwlW/M9VAhFkBR5XDjAZI42XJxlFt
	 xDooxnMrq8jwxNYf1J4I/GUkULLnaLtJrRwyCOvBlGd2VKShhYgo5CDbkknDro5VLEyth
	 tCkKKnpHbFJFCZR7Dp6djdWMjqIPjy8LEtl5/41ZVNyRcUjHFGz5/2lye0fcWhLOgQHac
	 MXUL/Zb6AigWuEnYmqP8vKdBu0+cPNM1Cpy6SzbwqwO6Gs0k2jUYKITZe3OdsSFMoFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=caIHNtGj;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43852606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43852606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=caIHNtGj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792640836; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=xvUjiyMCs7JZfFFIwk/bmLJ9gLcg5Lr3+0R1L0w/QTU=;
 b=caIHNtGj7S+FGLOLM79RoDHND8idRbnusE4dLA2jU7LKZmG6kVzVGkxrxTpdoOtI9Da0B6
 T+15oKGUDzkBUHoawmyU9+R3nmMZJywbSZ46pt3xmiYxCKA++lSBmHaVBusNOqPW0pcUCe
 h+91WnWeTY97+o0xOTtRGBhnx726WPI4mkds6e9zqp/NnzzTcix/whd9k7ZTVAAvMmuvKv
 5TzsBUXtc1FC+al2rurmZo0InAWl4KzsuPoVErJT7IlpNAXWA/Jf3iVqQFwkb+TzuSTFkv
 3SiMTKbFCc0k7GC806g2axwqoa5GeL2OUERdDC215KB+RO58nSa6vKz9iINspA==
Date: Thu, 22 Oct 2026 11:45:42 +0800
References: <20261022034543.51226-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261022034543.51226-1-lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <peterx@redhat.com>, <rppt@kernel.org>, 
	<azpijr@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: [PATCH v3 2/3] mm/hugetlb: disable PMD sharing for UFFD missing mode
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Message-Id: <20261022034543.51226-3-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad98742+f5b4f6+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

From: "David Hildenbrand (Arm)" <david@kernel.org>

For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
sufficient to have the VMA registered for missing mode.

However, UFFD missing mode does currently not block PMD table sharing, so
installing the marker will be visible to everyone using the shared PMD
table, which is wrong as UFFDIO_POISON must stay local to the process.

To fix it, make uffd_disable_huge_pmd_share() cover VM_UFFD_MISSING as
well. With missing mode covered, hugetlb PMD sharing is disabled for all
userfaultfd registered VMAs, so the helper can simply return whether the
VMA has a userfaultfd context instead of testing individual UFFD mode
flags. Add a debug check on the marker installation path.

The existing registration path will then unshare PMD tables, and
subsequent faults will not share them while the mapping remains
registered.

The alternative would be to unshare PMD tables selectively when
installing poison markers, which results in way more complexity. Or
alternatively, simply failing the marker installation, which might break
some use cases.

This also disables PMD sharing for userfaultfd registrations that never
use UFFDIO_POISON.

Suggested-by: Li Zhe <lizhe.67@bytedance.com>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/userfaultfd_k.h | 16 +++-------------
 mm/hugetlb.c                  |  1 +
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index a4351cffc60ce..224324dae017d 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -169,22 +169,12 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
 }
 
 /*
- * Never enable huge pmd sharing on some uffd registered vmas:
- *
- * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
- *   tracking information is per pgtable entry.
- *
- * - VM_UFFD_MINOR VMAs, because otherwise we would never get minor faults for
- *   VMAs which share huge pmds. (If you have two mappings to the same
- *   underlying pages, and fault in the non-UFFD-registered one with a write,
- *   with huge pmd sharing this would *also* setup the second UFFD-registered
- *   mapping, and we'd not get minor faults.)
+ * Never enable huge pmd sharing on userfaultfd registered VMAs, because
+ * userfaultfd state can be tracked per VMA or per page table entry.
  */
 static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
 {
-	return vma_test_any_mask(vma,
-		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
-					VMA_UFFD_MINOR));
+	return vma->vm_userfaultfd_ctx.ctx;
 }
 
 /*
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4a70716deaa41..3cc33ac85a15b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6303,6 +6303,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 			return -EEXIST;
 		}
 
+		VM_WARN_ON_ONCE(size == PMD_SIZE && hugetlb_pmd_shared(dst_pte));
 		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
 		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, size);
 
-- 
2.20.1
