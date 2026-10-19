Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E24E1C84
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409502; cv=none; b=QNsBtMZ0VXAZD7LqpskfetlXBoYE4ELuZ3UQoy3soB5J+DPGImoKEnD5VRmSrLVmvyKp2UQqLwqppB4LbvljtMBz1ctKIEyfAEST4b0DBihY25ErUYNhbGmb6qLQr1YzJgf3DVdkbqDRNLpc7nZP2SFx2wr6iiY+SE1uUwRq4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409502; c=relaxed/simple;
	bh=qXa9w9B6VmRUK8+yfBIT3IG+f2OvO6k/wb9tNQappVA=;
	h=Message-Id:Mime-Version:To:Date:Cc:Content-Type:Subject:
	 References:In-Reply-To:From; b=AKxv0c9jrrX5QHCTZCUSrnQLhZxjgezOLvD0w57WUYsqbnbJiU7tVgsS/SqrgOQxEYjyK9HLOKWDoUqIm9G2hQ4KKOx1V4HRdNRA5M/ir9Ixo4k2P/mvWhhNnH+kRsoMfOmSO/m1DZ/llURUwxYpQabOP/YOYCW5U9cwtfPlpFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZAH2WzTV; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZAH2WzTV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792409494; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zNdUrREfRi6A2agO64v8XOxx7iV4RKo6fmZLB1LQoIc=;
 b=ZAH2WzTV4UssXPn14XA4UoWaN86Xw6Arj3z5b8l++x2nw85hDatT+OY29rpJhCfbqf4cTs
 YMxprNX9E1tbc9MzTkLUoitjeq3EySUqB3VTbYDaiuu/HSnbhtNfMxUOgeG7AoZZLguPAO
 bS6hyNdEl1x444/55dLPyosRd497buv6iHteZyo3kUlKrYnftKywtyFtmTlSPG81DosL5b
 67rZsnnzRtZpx2crmFaLLqEz16LrsbChq7RcLvsB747tHLPL5juYDnZjcqdvHg8pXVuBPn
 NH2ka5BtrkscWylgSfktyjwIwFYiBnuVAkBwbn5K05cJikSUo4Phh88M275itg==
Message-Id: <20261019113034.97690-3-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <peterx@redhat.com>
Date: Mon, 19 Oct 2026 19:30:33 +0800
Content-Transfer-Encoding: 7bit
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH V2 2/3] mm/hugetlb: disable PMD sharing for UFFD missing mode
References: <20261019113034.97690-1-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26ad5ff95+1716a2+vger.kernel.org+lizhe.67@bytedance.com>
In-Reply-To: <20261019113034.97690-1-lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>

From: "David Hildenbrand (Arm)" <david@kernel.org>

For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
sufficient to have the VMA registered for missing mode.

However, UFFD missing mode does currently not block PMD table sharing, so
installing the marker will be visible to everyone using the shared PMD
table, which is wrong as UFFDIO_POISON must stay local to the process.

To fix it, include VM_UFFD_MISSING in uffd_disable_huge_pmd_share(). Add
a debug check on the marker installation path.

The existing registration path will then unshare PMD tables, and
subsequent faults will not share them while the mapping remains
registered.

The alternative would be to unshare PMD tables selectively when
installing poison markers, which results in way more complexity. Or
alternatively, simply failing the marker installation, which might break
some use cases.

This effectively disables PMD sharing for missing-mode registrations
that never use UFFDIO_POISON.

Suggested-by: Li Zhe <lizhe.67@bytedance.com>
Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/userfaultfd_k.h | 13 +++++++++----
 mm/hugetlb.c                  |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index a4351cffc60c..fe78ba14dc68 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -169,7 +169,10 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
 }
 
 /*
- * Never enable huge pmd sharing on some uffd registered vmas:
+ * Never enable huge pmd sharing on the following VMAs:
+ *
+ * - VM_UFFD_MISSING VMAs, because UFFDIO_POISON may install markers and we
+ *   want PMD tables to be unshared when installing these markers already.
  *
  * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
  *   tracking information is per pgtable entry.
@@ -182,9 +185,11 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
  */
 static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
 {
-	return vma_test_any_mask(vma,
-		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
-					VMA_UFFD_MINOR));
+	const vma_flags_t uffd_flags =
+		mk_vma_flags_from_masks(VMA_UFFD_MISSING, VMA_UFFD_WP,
+					VMA_UFFD_RWP, VMA_UFFD_MINOR);
+
+	return vma_test_any_mask(vma, uffd_flags);
 }
 
 /*
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 2c64ca985dfa..fdd65e019a55 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6304,6 +6304,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 			return -EEXIST;
 		}
 
+		VM_WARN_ON_ONCE(size == PMD_SIZE && hugetlb_pmd_shared(dst_pte));
 		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
 		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, size);
 
-- 
2.20.1
