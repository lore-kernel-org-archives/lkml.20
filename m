Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018609;
	b=PosfQgyO2fhkez/64E7/rolqgBLmf8tS92OzfVCULJOBWjDh4fqiyVZXQwU4okElo7Cp
	 0ggXaZOI37i7T1mUAk5C8Zque9EQixhTP+NoOCFm93dVpDHJpnDTdRHoKja3s4Rh6kUch
	 bgI9B+33ue+F2ui3uiVuisIg7lFwyfGPbTQW9+YzrK0YPXw2l7c3ThDRc7w5RloNFo0o5
	 EYXXHK0lzh00l6ZHnSrjEbSFDxNUlgIHglI81rBzF2lSavLOex5Fw+It7bWSz+qmfI9AT
	 QcnPPXIUsgYmRbjpO4Nj5NaHqS7U6StKR/GRiGHUFj+5tA+CqfBCsFu3I5z8mU8F1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rk2LQoLYWw0mFOLNx1z1W3nO6yp8GrtwTIj/Q1DWuIQ=;
	b=fO0iNC9Ojk/fnehqcNzGbWTQodiE/So2TOy2b9A/j+oBjMycM8kj4siHHkUMIzl1nSGE
	 7QaUXIRGL0Ev9lQz9SwgAZeq90D3P4MnC48yBAHDWEF1pG2UeEtrny3oi1YGEqRFX0MtC
	 lHWSG74+xVYdpA404mizY/7L3V0kZEQ39Gm7tfVPMSWm4fWhYxLtWRL39VCb+LGl7WL+N
	 /2tCG7cFUvi6k8AnMRo1dnXlCubUCHLU3EqaNsmSBdmnQRKmTtA5IyXu4Rq1zJZFVu+GW
	 kvFUn7t0P5qCBOklNkTRD7O7lFlic+SDRI4oJHz08IMWXwZOOklz5TTuKijayt+yXwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DQrfViLY;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2B606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A2B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DQrfViLY
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so2385621eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018608; x=1794623408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk2LQoLYWw0mFOLNx1z1W3nO6yp8GrtwTIj/Q1DWuIQ=;
        b=DQrfViLYVnqnsvYu7I5G3a2g07WCAozacDWqLsfFGfWswBNBJjeohBRJhCw/+U0yh/
         /Jc5nOhs/ydA/PfS+tmvSG4dpBEpNu4fR2GZ+PTvLPCPxyR4yV3SC5y/n474JKkmyC7L
         nhtTuezggNGntX5n0Dlo/8cHXzQbqv1TxGIixMh6Ukk5Vhm8ZeTnOi6+vy6Dbo7y6xhK
         RFgjGcLYBL7Ki00PnYxIbg4Ud+HfpX5VQBQIFSLjqV9cPrkcIBlGaHA56gRbmqLRodG9
         o/mkyQUIpFzCYETiDAMTY2N7MNM/xldlbYJ/kIJkJB4lNniwIdd14nRllsSBbkskApZa
         RMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018608; x=1794623408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk2LQoLYWw0mFOLNx1z1W3nO6yp8GrtwTIj/Q1DWuIQ=;
        b=q9UQlrlvdxhoyt4I3g17inGZABtS2rbP4YQpcWQWvG9hPxcbCgs+LjzpeBUquX73iN
         Bq2f5KGU+U+ciRZ48090hnTArcUhzOqugyAKVeoP7s1qmmmhljc8CnpVzi3wNBjHVn3S
         5tnvpkEdWLJq2ODVxeiDaHnJq8e8dHPtHjb0TeoSswzqrsqkRDYTi+lkAu2RkLVjroPv
         zveMzhkmhSeoSkK3JFLGqcXS9WCOs8dXtHhUlPD9T2zxzOw4aUH0hS6Nzwt+7w3BUBbN
         vqxwm7GQ4ABR4ACSO72+cO4a8HgTYtab3er+NG1Om2DQOZiAhW3cSaHYiTAZ4Y5wtHeX
         5UoQ==
X-Forwarded-Encrypted: i=1; AL+hErHWEBJC+OotPfmaN5WMyibLmdkNK9s7a1BlenwUTe37yOcYuInBKHmmfTKbrPkQCbuhulfAKZlDMizNXdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9thFhPuKFUuLN9ih6CF3QFq9WjrFsHgo+KhAKETN4cxLNlyrw7
	0Dkx8h2kZFOfOuc0RJcDwuBZU67mTd9dIfcxUq3+X1/EV+fqgoneKRJmOF6vgcseZt8=
X-Gm-Gg: AYBFou3Iclxa6mmMDPRx3bVAwf/+zjhk/AmqQVafG+ymnGHg+Ql8LKQuHknNctsTOqi
	q3W8iLFUTEQyRXvPN0WexhUJ8vco3xz65YfphtEQk4uXSTxJH+t1SZe9LZ9zoc7Ev4PlGI/XXRr
	104SLy6QNr5uu6DBwQ1FaGaTKCLBELdixADydlJU+laAt+VjUmBLhzt7iqpGiYpDiWCv4jMcbGh
	67I57HMyUsyLkSyaKNJcC4W6hIy7vd/PqR2I+bb2z8FVAIR3cELlHNIAhJd7AX+CxwjYmdzxQb8
	F4pUdFl4e+VDWD70lNuQFscjubKC3F8HqK61EYrHWYAWYhs5Bn07dWDbHQF8y4P7T/Q4XbMIbY8
	6uMuIQqbfCteSdi6CPP1/ZYmwyiV+fNkVR+TK5LNKwwtwxqifVq9bkkzPTzvrbGvcCAT1N9PStQ
	R3YCgKPxlQAd/0G0ps3mTIiYrHk4qkL59CA9+QMmx66pAgPqkE1sMyuwJWH4M+oWjphu+mbrdLe
	CJIxjQWyODxWY1PUrmvY4i2R7dEMGZfZP3XVfli+ZAR+vo7Fzah3ZvCqVWhe7CT8wuA7AFEK7Bu
	Lltq3+xoJ6ajyrgO2+8V8+M5jbz22WumALIKZUZaCakiyL+62Ng4RcIR/quJ
X-Received: by 2002:a05:7300:dd06:b0:36d:b933:675c with SMTP id 5a478bee46e88-36f75b1f6b4mr6307886eec.17.1794018607721;
        Fri, 06 Nov 2026 18:30:07 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:30:07 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 10/13] mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
Date: Sat,  7 Nov 2026 10:27:53 +0800
Message-ID: <20261107022756.77731-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Pass the caller-selected allocation mask through
  vmemmap_optimize_folio()
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 68 +++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 6c248e8fbdde..148bd27bb327 100644
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
@@ -302,28 +307,42 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
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
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
+	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN;
+	int ret, nid = folio_nid(folio);
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
+	ret = alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES,
+				      nid, gfp_mask);
+	if (ret)
+		return ret;
+
 	ret = vmemmap_remap_range(start, end, &walk);
 	if (!ret || !walk.nr_walked)
 		return ret;
@@ -490,17 +509,12 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct list_head *vmemmap_pages,
 					    unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN;
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
@@ -514,23 +528,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * the TLB and clear the flag below.
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
-
-	ret = alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES,
-				      nid, gfp_mask);
-	if (ret)
-		goto out;
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

