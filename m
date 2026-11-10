Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309912;
	b=ga+VGguznJhnruG2wR7VLgGxZHoggZ62n5KhjIueoE8/zul84NdEoe8BYJfQtZVAdnif
	 xwhnQyLUXlS7Iao53uywGlYcnHyqvxJJtPO96s7pSlZoZYc+hdjb1uhW4SmP0dvj5inPa
	 p+XbDoPQcm+RwmVfNXzo/p4ymQXezbL+8g7/l5LUrFhjpqBptbfcX5u+DzV5B7hC+VO8N
	 Se8F59Fn3Xh3iJlP9aqtO5fdHywFrTeJZUs6LZlIUVyU4iJs09v4o/nmktemY/xCLu6to
	 YdqlP5ezpQbBtU2ICBDWKlTRsmvpqc51XOx5DcEJhnyTajvaLb5u+YxPzPJyIwWnq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=olyA0GkCFOlLCJET/iZgvs7pvm9Jf8w/7sECMvsdEs0=;
	b=IjTHPQMJqYw0G51eW38FdSU9aisTEir3tox8EfgK6tBykTQDHHAVmvky7pp52rg0oNVs
	 DDLaSP/TsIowiX51Hb2BxCclFJX4G8KJWh9gU9phobv+qbBJJiSATqHhKilarh0yQhXpo
	 oPgLd6aHV6zO7V/9ZkQV8NTTH0z3UrFgIS2OL9O2T1NXcTnLfOeBoAo01MuFTY+YBfnCx
	 Qn+qK1YrL8xPxlaD4RsjtaR37A+518DikXGy5lNqIeIaq2vlOt16zwWw/wwyNTM3sAhIb
	 5Ip+EKI1V6wcbKXxusl0UeJm9Cswy00ysdUVaJnm9dK4F8SORQrFeU/P9FEt2jaIKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T8yWAAYk;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF0D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T8yWAAYk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so3218883eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794309910; x=1794914710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olyA0GkCFOlLCJET/iZgvs7pvm9Jf8w/7sECMvsdEs0=;
        b=T8yWAAYkgz2a+nkOHuIH9bIYxYu5yNNTOvK3dDPfSZjQZYOb1MhwXxRQStfiX+HXum
         RU2XOqcQDy6cfalegyRSO7c+u0XYRx2svEHpBNXRFeqHMi77HOBGDssUWiO9yePLG6+0
         4oAYsFleFq/PfWACKOn2IlmdMKTLurs/g4TbsYqfV+fCvOl5B/3b40QKpYh6IzJDPkxX
         AZaLuM8ofZj4og0fb5RvRqLQxigNnqMRCXpxlLB5LufP1WeuiQND5XmgnQBQ1QwA4MZa
         S3QCn7j4ndeGbiS1Iru7LaE18aFo6DvuDqgQh30HTy5eXjT1nyyM6XvfLV792823ZYwf
         IKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309910; x=1794914710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olyA0GkCFOlLCJET/iZgvs7pvm9Jf8w/7sECMvsdEs0=;
        b=xhh75quU6SPPE90rXdVfw62orZlxTwG4od0/ZOSe1gUkO4G4fWoAWQ/X1jOnwYkApt
         XVi2pLc23oLCnipsCMmkslkz6fTjiiDJU18yLmfU5bgEIVNK2c+vI4oWi1YGf4OVFY7u
         9kt2cAjtcukPccyUqZ5U4CIY5nI/j4lLtzS4jayNfvV79vuhbgre8OBcvnJZAt5vva1C
         Nh23B1q8oGSXoYBCP9NhPxErR2t8YkrJSp/8+AEvgczsMVBVDnl4OWaL0MesqEHZ1FLe
         9Qwm662sIXUt/540XzgFbcy52181OZt2ys82I4YonY5bafcp/OtP7D/WKn2E8PYrCmxq
         syIA==
X-Forwarded-Encrypted: i=1; AL+hErEuV/N+fWbV378xzQlLcOSqxsGUiSMs/AxI5+MW8n3lLlPozubh9fbfnM2OBJWYQ3ZqGS7X6HWbWqe2ZYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cz4U7cnRV9D6BdCAk8FbZ2irnHb2BTq+RbovxJW+xdFnLuwQP
	sSl6pBOj4crN/GRDobnl3N1xbIIj1PnfVYYIlDVP5etk1vYt6HTBgGXVHxYM5lAk30Q=
X-Gm-Gg: AYBFou3vAuV7ZwXugXfC/IzswMsDafe3lgN5EZ1I8rM8GQgpnLgVl0o9U9x7Urmmv9Q
	YlXqT6V325rClMBStX5QKRCv8A83grW2KFyNOTRfCsm9YoJIQI0KXla4mPpNf0tXpqg//IYjl2Y
	h6bsj1x9EyDmzJrWbGxN3/xLGb3q2/PQXjvJ/Wp4smDVvfxFoOdhvfoO/vnB5K/jHKGNGnmIkYM
	su+B0leOzkvDo5+npYR2cwFlFWqYOoxYqLMxuP22CEgqD3ytQs0VNZMFHoCY0jV1CqBYk3TFcWp
	S5AUHUkvossbpE9fH6mQDS6cOmj9PwzPO2V69EKlO1Gfo3ppV+YD9R31U3CMj34Aa/Kplsf5qPG
	CgFDPfeGuUayWddArDACMiwPqNJqanGKaw77g0d+xUfVfterHq5iIyXhqg9GB9nDooaacb7YBLP
	tPhPGSNaWXRrx8vHKtuEQ/wJ0LoTB84uPaXY6ocMFRK7BCsFQjagXggPyiDatD5aKr5EdR7N+sc
	O8sbwnBi5aQP9nluoEwLcT/yjx/VqxMOWokgs1n9E7LVa4JGlv3WuGSSEU5JZMRWE/pRNzP3Yj8
	Mr4iYbZuQ09KohkVLeSvftA4uqfcKyA3BpcGehD3QSmgVP4DdnAfxm2+7yfAkEwYOQ==
X-Received: by 2002:a05:7301:1522:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3751ee747dfmr2528761eec.15.1794309910199;
        Tue, 10 Nov 2026 03:25:10 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm7608755eec.19.2026.11.10.03.25.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 03:25:09 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] mm/hugetlb_vmemmap: fix PMD split TLB flush race
Date: Tue, 10 Nov 2026 19:24:56 +0800
Message-ID: <20261110112456.62827-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Bulk HVO optimization converts vmemmap PMDs for a list of folios into
PTE tables before issuing a single global TLB flush. After publishing
a PTE table, a concurrent single-folio optimization can observe it and
remap its PTEs before the deferred flush:

CPU0                             CPU1
hugetlb_vmemmap_optimize_folios()
  hugetlb_vmemmap_pteify_folio()
    vmemmap_split_pmd()
      pmd_populate_kernel()
      /* TLB flush deferred */
                                 hugetlb_vmemmap_optimize_folio()
                                   vmemmap_pmd_entry()
                                   /* sees a PTE table */
                                   vmemmap_optimize_pte()
                                     set_pte_at()
  flush_tlb_all()

This can create overlapping TLB entries at different granularities
that map the same virtual address to different physical pages.

Serialize deferred PMD splitting against PTE remapping with init_mm's
mmap lock. Hold it for write across the entire pteify batch and the
final TLB flush, while optimize and restore remaps hold it for read.
A remapper can then observe a split PMD only after stale PMD
translations have been invalidated.

Fixes: f4b7e3efaddb ("hugetlb: batch PMD split for bulk vmemmap dedup")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fbdc3410-a4cf-457e-88e6-684380fbadfe
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ba8e11e399b2..ba6559bef742 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -158,10 +158,8 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	VM_BUG_ON(!PAGE_ALIGNED(start | end));
 
-	mmap_read_lock(&init_mm);
 	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
 				    NULL, walk);
-	mmap_read_unlock(&init_mm);
 	if (ret)
 		return ret;
 
@@ -308,6 +306,9 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
  * is skipped, the caller must flush TLBs after all pteify operations are complete
  * before remapping the folio's vmemmap pages.
  *
+ * Note: The caller must hold init_mm's mmap write lock for all pteify operations
+ * and the final TLB flush.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
@@ -318,6 +319,8 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 		.flags		= flags,
 	};
 
+	mmap_assert_write_locked(&init_mm);
+
 	return vmemmap_remap_range(start, end, &walk);
 }
 
@@ -358,6 +361,7 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 	if (ret)
 		return ret;
 
+	guard(mmap_read_lock)(&init_mm);
 	ret = vmemmap_remap_range(start, end, &walk);
 	if (!ret || !walk.nr_walked)
 		return ret;
@@ -392,6 +396,8 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	if (ret)
 		return ret;
 
+	guard(mmap_read_lock)(&init_mm);
+
 	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
@@ -559,6 +565,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	if (list_empty(folio_list))
 		return;
 
+	mmap_write_lock(&init_mm);
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -583,11 +590,13 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
+	if (nr_to_optimize)
+		flush_tlb_all();
+	mmap_write_unlock(&init_mm);
+
 	if (!nr_to_optimize)
 		return;
 
-	flush_tlb_all();
-
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 

base-commit: b95f8bb86713c860ce8536d22a988b949b884d5f
-- 
2.54.0

