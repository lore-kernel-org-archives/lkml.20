Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827039;
	b=QFT9JRKRNNYh6A3VaoQkY3Zs3yLCgkQM0wdRS5PBvE1Mz3VcOujCdOr/DCwhIoYSG5vh
	 Bf3jKEO4hkCxj4KEXTiMNvb8HBWoQMVuIemgjR/WdxwpiqGpysYFUVH6n9Aa+e9F/ynaF
	 VXKYK54701iXfA/05OYTIJLKijQrVlPFY4cjjH1uEuJsTNrdLNQdihLK4yPqVKbz8i6+1
	 VpazbSYadhyvzP/0yBSzYAXJhDbHl55LgqEzf25raSj/Nsc2Z/F3dTVa29WrcbAQe5gWN
	 WOB07S0L+CSK68mBfMvGXx1qRjGFvPYDzqGiBjikfahpvLy0jZoI9BxkKFCX4UST7aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UIkIhG57Zfabw+sAXRL6qLfJWwSmpp1hPN2U2EZ5wCc=;
	b=Cy+gWb+kYw+hxB8o5yHJIsFHNKUcg2styu5qJi3DZRr7JQTZa31wOWc3/G8wFBdLn1Tt
	 AuOBSJ7H+HhTl84pWZVFxuzuLaiJL+Kyj7LXgHMmXOU6+g5/FzyaJXCfPCi/dMYYePHcA
	 Kgh1LiFqJ+ePR/sUwgqdXiSRzfkJJln26alCWevv90hu959OCKVypF0m59RlJQNht5zTA
	 EDS4OfZsSVLNMjsPPITUKM+EeHVJMpO4j/QrL4iYGiLXzvb0MfXw2zaFBwM4Y7pzudEUy
	 i3EiIjRV0ZPVDGYfCUKwz95xCJEqS6i6OxeXYJ94o0Rbr6KW2ngdEJ6BEow8gDno+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udSl0I23;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54715606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54715606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udSl0I23
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so3920894c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827038; x=1795431838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIkIhG57Zfabw+sAXRL6qLfJWwSmpp1hPN2U2EZ5wCc=;
        b=udSl0I23nKTERwbqNjwEoycYaHQTORz49/d6qKE63LcnavmrYfTRhvshGEHH6gjWrf
         32R30HwDvzDEHxtHDCYpWBakaU5ULu09GG/XdNFB1uISn0pIttbUMtb1kcYGuKegr3yx
         FBL9SrW9P4Nhr/0vzhnAw/8gn4MRasjxBbt/A/poTaK5d3V3Q6kcUwpVzYVJyCQYMDoO
         v7oRVOJ7iZpHvPfwjEfsCuNp+cYGsX6yqg64fZUOTCdJkJAItL5mYP8Fogt5EuMNuHBX
         1aFTCEqnm5NbQKQRe4NqwAo76JcUkOKV1Cwme47OYQTLxGjsl7x+zTCf9mAYgP+G1W1s
         iqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827038; x=1795431838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIkIhG57Zfabw+sAXRL6qLfJWwSmpp1hPN2U2EZ5wCc=;
        b=0eOl5fXI9REMxVPLnLzQLsba9TSIiZ00yGoFaDxJAcuZI9BUhFTcb7CAVWQLF6or20
         q41/0to2jOb5gYwYisdmRaP8V6hnAwvFO01ZZYqLd0EKLEKO4lAzogUoN6tHrqqUKbrw
         ANTBJL9LXVNBwL7qRQNXk0YogenS7zfnZK0ou3Qo2/6XXzB3SsoHeSV23EnoPNYEwx3P
         i530f8aY3LzAjX5qZp0mS/iSW2E+0gRX8q3+yKgaQ0DDPWJwFC3ZF0iHUTVt5joBMPqM
         MZPQngFfTZLZE/0ieYloOr9xrIqTz33n7GiAfkXzTtA43DSud3Q9s6P39AJA0nH//XW/
         eRpw==
X-Gm-Message-State: APuU4Z9U1eXiMxt8OVOKXeUerr8BpBbj/2aIVE7oNR+jAaUCU46Ss/uK
	slI68Ip69hAnYXHoAuD7NbN1UwIVn62B3b6gMWWSCfGkh0J1b8IoqTOp
X-Gm-Gg: AYBFou27jtJOr5c0BTz1n/837ZwZMuBwYwADXrC0/3N479djJw2JBCfTdAmNArpD/JJ
	4xy4lnmUObGBcXHWdSl147WTVbgsbphG/0qPNBu9ClunchN5S1pcBjTuPornG3L5mtS0CEdAXjm
	iFQjC0FxvWF9Eg4YXGOoJ03vl/I2ul6q45Fu7fs+Lwx5hNQOprJaTMB/mgwYNTzvs1RuJhQ/xXG
	HpHBm/Fi35S6pBA9+W0PiqH3A12u/0qS6UJBRllD2Vckvt0UScJyJkWC0NUn0rUwvFthSSSj1YJ
	cTCP+zC/dG148G4O63MdOKtIYoYwyUzDOZ+kq17lV1lAB+Y8/QMk7J84jztb1NUnxbK9lQHZQFP
	aCavnk8UK4twsSRV2g7bCVfNpEdWu8WhQrgpDbH64PW47C9/cQ/ww9qmENG/FzJTSa6xaJLFrOO
	bjO7jKxdonc1HQf/bGjug+qf3qR2xY8cs9wuJjnEY+gfG+k9ucRKsb54Mbsll410/w+pHYepZPI
	OPskIt1WLwZqAU5oqaQda9JqS5yTn8y/myfab0zje6Eo4k4XnX4YEh4pTRtYEXg4U3rAucLFhuf
	/ovKxO0BdLWOQ49odgNgRvBPzrM/ti7tsrTIBwCG2gcmuGc=
X-Received: by 2002:a05:7022:282:20b0:149:1feb:6da4 with SMTP id a92af1059eb24-1b5031244a9mr9354527c88.32.1794827038262;
        Mon, 16 Nov 2026 03:03:58 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:57 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [RFC PATCH 04/16] mm: userfaultfd: let UFFDIO_MOVE move memcomp entries
Date: Mon, 16 Nov 2026 19:01:10 +0800
Message-ID: <20261116110122.309748-5-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
References: <20261116110122.309748-1-nakixii@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE rejects memcomp entries as unsupported non-swap entries.
Support moving them without requiring the memory-cgroup, shmem,
writeback or asynchronous-compression paths.

Move nonresident tokens like swap entries while keeping a lookup
reference across PTE revalidation. The reference prevents token reuse
from changing the backing whose resident state was checked. Return
-EAGAIN for a busy entry or a stale token rather than moving it without
a stable handle. Keep zero-token movement neutral to zero ownership.

A resident pending token still names a folio whose anonymous rmap points
to the source address. Restore that folio there, then retry through the
present-PTE move path instead of moving the resident token directly.
Drop both RCU PTE mappings before the token-lock lookup and preserve the
existing PTE and exclusivity checks.

Rollback of memcomp entries makes partially unmapped large folios more
common. The per-page exclusivity check also covers that state without
treating the first page's flag as the flag of every mapped subpage.

Signed-off-by: nakixii <nakixii@gmail.com>
---
 mm/userfaultfd.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index d8a699981d097ae393a981a33cede5f5ce6e2725..0ed91fdd2e80a89073ce2f165e0d557a55218e55 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -15,6 +15,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/hugetlb.h>
 #include <linux/shmem_fs.h>
+#include <linux/memcomp.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
 #include "internal.h"
@@ -1150,6 +1151,9 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 	struct anon_vma *src_anon_vma = NULL;
 	struct mmu_notifier_range range;
 	int err = 0;
+	swp_entry_t memcomp_checked_entry = { };
+	bool memcomp_token_checked = false;
+	struct memcomp_ref memcomp_checked_ref = { };
 
 	flush_cache_range(src_vma, src_addr, src_addr + PAGE_SIZE);
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm,
@@ -1338,6 +1342,77 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		struct folio *folio = NULL;
 
 		entry = pte_to_swp_entry(orig_src_pte);
+		if (is_memcomp_entry(entry)) {
+			int resident;
+
+			if (!pte_swp_exclusive(orig_src_pte)) {
+				err = -EBUSY;
+				goto out;
+			}
+			/*
+			 * A resident token must be faulted back where its
+			 * folio's rmap expects it; the present-pte path then
+			 * moves the folio.  Any other token carries no
+			 * address and moves like a swap entry.
+			 *
+			 * pte_offset_map_nolock() leaves us in an RCU read-side
+			 * section.  Drop both mappings before querying the token:
+			 * memcomp_entry_resident_get() may take the token mutex when
+			 * it wins its trylock, and lockdep quite correctly rejects
+			 * even that conditional mutex acquisition in this context.
+			 * The PTEs are revalidated by retry before either move path.
+			 */
+			/* Zero is a pure value: MOVE keeps its logical owner count. */
+			if (!swp_offset(entry)) {
+				err = move_swap_pte(mm, dst_vma, dst_addr, src_addr,
+						    dst_pte, src_pte, orig_dst_pte,
+						    orig_src_pte, dst_ptl, src_ptl, NULL);
+				goto out;
+			}
+			if (!memcomp_token_checked ||
+			    memcomp_checked_entry.val != entry.val) {
+				if (memcomp_checked_ref.slot)
+					memcomp_entry_resident_put(&memcomp_checked_ref);
+				pte_unmap(src_pte);
+				pte_unmap(dst_pte);
+				dst_pte = NULL;
+				src_pte = NULL;
+				resident = memcomp_entry_resident_get(swp_offset(entry),
+								      &memcomp_checked_ref);
+				if (resident < 0) {
+					err = resident;
+					goto out;
+				}
+				if (resident) {
+					struct vm_fault vmf = {
+						.vma = src_vma,
+						.address = src_addr,
+						.pgoff = linear_page_index(src_vma, src_addr),
+						.pmd = src_pmd,
+						.orig_pte = orig_src_pte,
+					};
+
+					err = memcomp_restore_resident(&vmf,
+								       &memcomp_checked_ref);
+					memcomp_token_checked = false;
+					if (!err)
+						goto retry;
+					goto out;
+				}
+				if (!memcomp_checked_ref.slot) {
+					/* Do not move a stale token without a stable entry. */
+					err = -EAGAIN;
+					goto out;
+				}
+				memcomp_checked_entry = entry;
+				memcomp_token_checked = true;
+				goto retry;
+			}
+			err = move_swap_pte(mm, dst_vma, dst_addr, src_addr,
+					    dst_pte, src_pte, orig_dst_pte,
+					    orig_src_pte, dst_ptl, src_ptl, NULL);
+			goto out;
+		}
 		if (non_swap_entry(entry)) {
 			if (is_migration_entry(entry)) {
 				pte_unmap(src_pte);
@@ -1400,6 +1475,8 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 	}
 
 out:
+	if (memcomp_checked_ref.slot)
+		memcomp_entry_resident_put(&memcomp_checked_ref);
 	if (src_anon_vma) {
 		anon_vma_unlock_write(src_anon_vma);
 		put_anon_vma(src_anon_vma);
