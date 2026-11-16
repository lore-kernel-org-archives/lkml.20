Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867374;
	b=bhPQfyu/VYGtFCOi3mVsTqd8rttmBl2aIUfmBLgZ6tq34cXzhWs8WHj4He68ZEzeuGVU
	 ALMZU99/jq4h0kGifwacA/ctXAib+dY2uEtrwPP3ggPdDZMTPEdSSwBfNKh1P9ejS1n2Y
	 6HLb/E4KnPG0JTbLO2/5J1kEfN3ZB1rc+bfh7rm2ynXhsdWB0c/AGf2FVxWKlsfoCuP1g
	 u82jk2ZHeB5X3lBIEy44lu7mv+QMEXQ7HNRLncLHPZhXkYCZCG3uflY83EjlMHLZx35Ay
	 hFRb5wGbpIBdC9D8eQf45gdibGS8pLaRAvvfaxuaY5EltaGFu3ugwHDvE+dwLYRZMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=L7R1P89DbfMkM5Fqa2JcHWcdkWhJH7Nt4jSHJnkgB4A=;
	b=etlevDVbx7iTY5tZko5lR/lcqabmKRNY268ipYXhkzyXMC4KbyD9M5XG5E0Z4t34/CKH
	 FOcuKkeAkXZybzLVDqR5dM+0fy0q+yavZE//QFtKQxtjJVRHZh67yBx1PeIxyvITf+/Lx
	 TyJWU76d0mRgBREioVpFZZONdJkWCnrGWRUKJuKcNpreELpnFUm34RMxiXW5YQZIOLsgB
	 mNp49Ap5HEx/kZdlL00aBgCTVTmdZO373WL+CPBpoxrrpvmdxCidoeSZcDKFuDVD+/dm5
	 x3eYpJeNHtlSSuGi2V4zHJBgyNLiEeLFhK0SCY0D2HgfeMn7XDSwm84eDCVOhdteDmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uyp17ghg;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176B606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A176B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uyp17ghg
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso4700280b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794867373; x=1795472173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7R1P89DbfMkM5Fqa2JcHWcdkWhJH7Nt4jSHJnkgB4A=;
        b=Uyp17ghg64bxxnjMPY4NaSZBXDfeNj6e4/dc/8QOCvU56FMUxI0lmZ6jcwSS6qfNl4
         DVWlugjebTM87F/XKWA6eMGnhJ6m8WFsug5pbnmLBzTb9QW/CYk1D0KN1CNnN5353nMu
         KXQIirioKoYIZDgzbIsOKDnHYh2vXcVp+gueCG1vUgFtS18VJAPuvqIAyKMYbAvuycmp
         XR/+a1mugAvLcAhOaB0RKuNI3XUBGilXw0xe9laeEmb8xjUDty4Y/c3OF0/JVg7+Nhgq
         MXvyvDcBDLrCHs3KIbxca1Eyf1Mo87rWftR7Bg4ErTFzcHtE1mOGXLwaI6a3PmWV8EYk
         Ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867373; x=1795472173;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7R1P89DbfMkM5Fqa2JcHWcdkWhJH7Nt4jSHJnkgB4A=;
        b=0PMiJVaXotsyRxDBhyLxT2/f2W6tBP5sn5wwiT50OP6jYpGOPkyC2NAcXY+GF+uEVQ
         7GTrRF3hSmwqXrv2bVai+QhHJAj8WkIivJW3mVk5TwlqXmiMUZQJw9FGxRHvnTpyYhHn
         JWgKQJuRFZCxLQZok5KHV4HSFHUdRwEonni3yhF8upDQFxeDD7Xq0P3mvJikGJeUT02y
         eJg6px7YcGHjcvyMPzJwWzAP/G7tGRUs3gqcWfNrWMnssVbP04ZKKyTgaKokPvz5uOt9
         C64Fi3Bw2glLTGfkLvmDX6NARXfuRMBvZLtclXtnGG71Kt2rzn9sesGlNEeRr6151apN
         eFug==
X-Forwarded-Encrypted: i=1; AL+hErGKnIWXlQ9dSx4mLInFPnG2av0nrUqZGhxzcRMwxzYGhoNySZ+ZQP/gnHA9H5Dd+0l4FmMlZP2jU2ViaPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ERpMT/Rpr7dxJd4VB0Dk6jE5Is2ePepKFSSyj5kA0GiDbCB+w
	4vDn8up+xmUuxRG0c1GCC5RhURuXg2XMXss6m5LXvs1ELRphZrotXzUaF13a7ZOQV8WKKHonbR2
	Wj3skR3zp0JG79N+tUqsnoA==
X-Received: from pgcle8-n2.prod.google.com ([2002:a05:6a02:8b88:20b0:cdb:5eea:8c6c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2590:b0:3e1:282b:b69 with SMTP id adf61e73a8af0-3f7a7bc2dc2mr12230987637.28.1794867372545;
 Mon, 16 Nov 2026 14:16:12 -0800 (PST)
Date: Mon, 16 Nov 2026 22:15:57 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116221557.3128331-1-jthoughton@google.com>
Subject: [PATCH] hugetlb: Don't restore vmemmap of non-HVOed folios on bulk
 restore error
From: James Houghton <jthoughton@google.com>
To: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

When hugetlb_vmemmap_restore_folios() fails, it stops processing the
list, so folio_list may still contain folios that were never vmemmap
optimized, e.g. because HVO failed when they were allocated. Their
hugetlb flag has already been cleared by remove_hugetlb_folio().

If no folios could be restored, bulk_vmemmap_restore_error() then calls
hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
including those, which trips the !folio_test_hugetlb() check in
__hugetlb_vmemmap_restore_folio():

  page dumped because: VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
  WARNING: mm/hugetlb_vmemmap.c:503 at __hugetlb_vmemmap_restore_folio+0x270/0x300
  ...
   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
   hugetlb_vmemmap_restore_folio+0x1c/0x30
   update_and_free_pages_bulk+0x2c0/0x368
   __nr_hugepages_store_common+0x2e8/0x3f0

Otherwise this is benign: the restore is a no-op returning success for
non-optimized folios, which are then freed as intended.

Skip the restore for folios that are not vmemmap optimized; they can be
freed right away.

This is very unlikely to happen without fault injection, as it requires
both HVO and a subsequent vmemmap restore to fail.

Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list of pages")
Signed-off-by: James Houghton <jthoughton@google.com>
---
This patch was originally part of the series that enables the HugeTLB
vmemmap optimization (HVO) on arm64, here[1]. It has been modified given
the feedback received at [1]. Based on top of mm-unstable.

[1] https://lore.kernel.org/linux-mm/20261003002123.505555-2-jthoughton@google.com/
---
 mm/hugetlb.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cb2de24affdc..6e9f3fb04a3c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1628,21 +1628,28 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		 * If are able to restore vmemmap and free one hugetlb page, we
 		 * quit processing the list to retry the bulk operation.
 		 */
-		list_for_each_entry_safe(folio, t_folio, folio_list, lru)
-			if (hugetlb_vmemmap_restore_folio(h, folio)) {
-				list_del(&folio->lru);
-				spin_lock_irq(&hugetlb_lock);
-				add_hugetlb_folio(h, folio, true);
-				spin_unlock_irq(&hugetlb_lock);
-			} else {
-				list_del(&folio->lru);
+		list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
+			list_del(&folio->lru);
+			/*
+			 * remove_hugetlb_folio() already cleared the hugetlb flag
+			 * for folios whose vmemmap was not optimized, so they can
+			 * be freed without restoring vmemmap.
+			 */
+			if (folio_test_hugetlb(folio)) {
+				if (hugetlb_vmemmap_restore_folio(h, folio)) {
+					spin_lock_irq(&hugetlb_lock);
+					add_hugetlb_folio(h, folio, true);
+					spin_unlock_irq(&hugetlb_lock);
+					continue;
+				}
 				spin_lock_irq(&hugetlb_lock);
 				__folio_clear_hugetlb(folio);
 				spin_unlock_irq(&hugetlb_lock);
-				update_and_free_hugetlb_folio(h, folio, false);
-				cond_resched();
-				break;
 			}
+			update_and_free_hugetlb_folio(h, folio, false);
+			cond_resched();
+			break;
+		}
 	}
 }
 

base-commit: e1f34fb16e0236c4e60b5f392f1cf5aee76f7d0f
-- 
2.56.0.679.gc527c65306-goog

