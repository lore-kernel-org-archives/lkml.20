Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759780;
	b=k7jLTch+Fyw6ogEFV3UcTctdjT1SJd4HdHEriC3v9kTttoll+SF4iLqTYl+6iudqgcr+
	 vuaYP5XOx6gWZ7r+I2g3whvwbZlIAt1DpPw8k4PZFHQbEm6b8+1AZEPiBqgfQxEwqzzNC
	 fzp2t5zBf7E+Ri0nMjRJX+RZSxChckaTWG/K8WE/gttER+Xd/xppc1upEHFum/k4nQ8gB
	 wVQqw+eG27bLOhrzeiTfC+vydQjXC7U/lxpLm07tc5yJU8VF00Zj5HfD3Ofx3q5ueBhCU
	 66zqok1C7czHxiJzzMfJvY4q1ujrkzPKGjhZF4C7w/nI2hhn28q3InwvNLIzd6LfiRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=okHG2gVXQbR5G/Mx7seqYCkqeBXjomKsQCHd4q6G+sE=;
	b=Vx1gb/KpE5oqwf93c/8T82bS3RFyN0iBygnti1nE2X97uZWyyt7pSICF20f9WPuszlwK
	 qRWWuuNl7uWIwzZjgXuIjoCNbTsbj7wKkSoetqrygcpbxzMdsu93WlUpD2XOIFCGNs02X
	 irR+5Sarb5PmCv39hBFSHrUc23oVBCw8OZswYRlLCAK3JpM3jZBnmTox6WHN9s/E09d84
	 eYiXF+tQG7TdmKk86Sv3UdintFz2NgMSwTSmOBW7fTMbFShxxWuvZeZ+oqMYKBaSP5j4g
	 KDCV5Q5iGpJ4y+blP+zZ4cZug7/8h1xdyYJVksd5t05MIOqZvBXBEYXdS5UNP9ZZowQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Al6OVXL9;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95F606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD95F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Al6OVXL9
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a058f74a54so73047b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759778; x=1794364578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okHG2gVXQbR5G/Mx7seqYCkqeBXjomKsQCHd4q6G+sE=;
        b=Al6OVXL9MlUD6tHofmB47MXhlH42RKFOAtJilmwIUhRilyOlDu2eQxsCIvM97kQVXX
         o6nY2bYFGvSw6sZSQhHKPkhLsd73TQaKVtBahyBgYGufHuOd3VdO7pkhJUZpu1GIYyoU
         sJ6GzjzzDtUBevVGdQ+pBoh919NjMnbgTIYh0shjEwW3rHzkxIsJALIbC4Q2xqZ1wmHC
         /byIoCm5Q9r2a0zmZJTW7yr/aCjAwqFlJ4f+PBf451qYisO/0cx/1rqiYU+ZLZ3CcnO2
         bmXOzlJpuRC/sUaqmTV4npmoYpQCu8Q4hO061B/YbOJ2+x5N/CEWhFzXyx26KhkBPk6P
         vQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759778; x=1794364578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okHG2gVXQbR5G/Mx7seqYCkqeBXjomKsQCHd4q6G+sE=;
        b=HGdpWLnYdaeP+2RQc4P78QB/Ohezg/RU3Dkm4BLKzdZVTCMuXfnhHCmmY7hlQXTxc7
         7364BBqD6LZe2e/zX7A/F8+uc7zkiOjVEohU231xstcCbFXVOABa+f9TAdA3lTT/QWsX
         53YNan8LcB2hRNkcOi6vcLJnQ57ZbyLBw28SqKmHFfmaelNCuNXVthZ4XJz9e7id23U0
         czv0mqnyueUiTZ18nX68CN1sDrAVcvobB4TZeHWrk02a7SQsENJ/egD5eTMg8PEGSAV8
         3vNRJVdbt+0auXJE9YCmACH3mGsPSRB+cveyRvjp4vZncWPy2nAENFYKfCiB1SWz1nbt
         gy3Q==
X-Forwarded-Encrypted: i=1; AKwUvByXLQmfHNupv6hpg60pl82P0oOnyJg+h2M/v9kNGRp0oY+v5lPfc94nt4Ypm/e7sXLhjf/8LF469tArmf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zT7dddYGYtcfmIbOPZFQg0lRV0mcJwaDUEUoSEw+fyQho1Q3j
	z4076twF1phaX+ySo3yJ+gOT+G/nXHqVAKRfxEdFELxbtxd/nGJmPVx3+16EMSH4BiE=
X-Gm-Gg: AYBFou0gCVNcxnl/s3nlVXIR7L+FayvipJYxwmExSCA0JQ7neVclDRZGXPFTQjPbyyL
	3ZPJ8bA2lYtYaPodHT2AO1cFoA53SLi8H/nTEvSl+No1fjZbCCPziIGrqSSNh8a/ETJM7m+0OJG
	cALQV4VNbw30ebj1AZEyYvmKu7HTEeGZA/I7SUTZ20+xPJm9PqX8jvbQ8dmCn85wqdIjE7nU8wa
	9IRDq0Z0VgYyb3kK17bBlp5lz3qzjcx87HuhOvWYgO+xZkhtHSnmhPwmYEsRlQOmkiK7pqd5NQb
	BfzKVVvUYLfcWOsVIGIMt5N3GsD3Qn7JKniTmfPQVhm/zxfCNdTrOsqR+oyHc2XkNwYnWjSkWCh
	TkSG6kUd59qIEtLKJQl7eb6coBu1n7IOeDlkMGuWAE/w3yVy6YOK+R+OKLSEu4uAuIUvA/b0eem
	hJPDWYLL8MNhdieah8Nm4ZP5T0tJzcxHgm7traCad1OCycv4G1yxClZFfWSQy1IVXNqDbZs7BzM
	KRleg1pWc9jr1/o4FMOkAJn/qF63NEM6iItZ+BSRWFx0fym2FTKBtVeoF1j1XA7xc0355GLZaWr
	fZhIhd4eScB7VnwsCU80cDATd58EtSdmUh8jizaVeN4LcgucEDVEeyvn9bEv8BhfXsmwYKM=
X-Received: by 2002:a05:6a00:4b4f:b0:8a0:7c97:52a1 with SMTP id d2e1a72fcca58-8a9bffd5de5mr12523463b3a.48.1793759777952;
        Tue, 03 Nov 2026 18:36:17 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:17 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 09/12] mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
Date: Wed,  4 Nov 2026 10:35:07 +0800
Message-ID: <20261104023510.260766-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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

Vmemmap optimization operates on one folio at a time, but the current
interface exposes a raw address range and requires the HugeTLB caller to
prepare part of the operation.  This splits the common mechanism across
layers and obscures its natural unit of work.

Make the folio the unit of vmemmap optimization and move the common
mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
eligibility and state in the caller while making the remapping code
applicable to any eligible folio.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 64 +++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 7d51df1cb78b..64967f18e3c3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -233,6 +233,11 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
+static inline unsigned long folio_vmemmap_size(const struct folio *folio)
+{
+	return folio_nr_pages(folio) * sizeof(struct page);
+}
+
 static inline struct page *folio_vmemmap_shared_tail_page(const struct folio *folio)
 {
 	return vmemmap_shared_tail_page(folio_order(folio), folio_zone(folio));
@@ -302,28 +307,39 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap a vmemmap range and collect old backing pages
- * @start:	start address of the vmemmap virtual address range that we want
- *		to remap.
- * @end:	end address of the vmemmap virtual address range that we want to
- *		remap.
- * @vmemmap_pages: input/output list whose first entry supplies the new backing
- *		page for @start; replaced backing pages are added to the list for
- *		the caller to free.
- * @flags:	modifications to vmemmap_remap_walk flags
+ * vmemmap_optimize_folio - optimize the vmemmap backing of a folio
+ * @folio:	folio whose vmemmap pages should be optimized.
+ * @vmemmap_pages: list holding replacement pages for the remap and displaced
+ *		backing pages for the caller to free.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Remap @folio's vmemmap so optimizable entries point at the shared tail page
+ * while non-optimizable entries are copied into replacement pages. Caller is
+ * responsible for freeing the pages left on the @vmemmap_pages list, even on
+ * failure.
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_free(unsigned long start, unsigned long end,
+static int vmemmap_optimize_folio(const struct folio *folio,
 		struct list_head *vmemmap_pages, unsigned long flags)
 {
-	int ret;
+	int ret, nid = folio_nid(folio);
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
 	};
 
+	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
+
+	if (!vmemmap_optimizable_order(folio_order(folio)))
+		return -EOPNOTSUPP;
+
+	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid))
+		return -ENOMEM;
+
 	ret = vmemmap_remap_range(start, end, &walk);
 	if (!ret || !walk.nr_walked)
 		return ret;
@@ -488,16 +504,12 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct list_head *vmemmap_pages,
 					    unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-	int nid, ret = 0;
+	int ret;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
-	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
 
 	if (!vmemmap_should_optimize_folio(h, folio))
-		return ret;
-
-	nid = folio_nid(folio);
+		return 0;
 
 	/*
 	 * Very Subtle
@@ -511,23 +523,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * the TLB and clear the flag below.
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
-
-	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid)) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	/*
-	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end).
-	 * Add pages previously mapping the range to vmemmap_pages list so that
-	 * they can be freed by the caller.
-	 */
-	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_pages, flags);
-out:
+	ret = vmemmap_optimize_folio(folio, vmemmap_pages, flags);
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
-- 
2.54.0

