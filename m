Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1081C84A0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803108; cv=none; b=kfXQDI63P19EUV8FNynNbkCFwmxUPybOV3/coyn+eMFC/mGVQYU5S08TukORrn2WK2Bi0I7HAfikZgHdMqb5iGBdoMo9j5clKh8wzIqmVvQLbkpQASq1XLu+shed9poetk6/y1KHHA1uzKS3zq5MkCb0VBk007CLgSEJGYyxMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803108; c=relaxed/simple;
	bh=5UITjqy7/G5Z/0AEJJ8J0M6i7S2TCpc3cbZ2X2c32dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdYEEzHHq06GmxZotHHsDu56DWXD1t80gGjhAdP3ocIWTRtyPBkxYikB4ap8cOKZBni8JR34SX/iLPYWmocMajfmM6/g5e79Q/xxytBddsgX/vHp/bgHtTNWsvK+pxS9eOuxmIr+qG6NTVO1tddG/gn3MieAtWLJKVRUwtAmMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgBITuZY; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgBITuZY"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso1740935b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803106; x=1790407906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n7V6rVhzACsIJzJlTeUTwF6umMgMDmbC0nfLvGCwoM=;
        b=TgBITuZYB5lpqnzR+ejeiL+jF4r+z+m1HQbpK/UwUc3+DUq6b6kC6poPU93Ix32qAe
         gkfrE1Alh04kGF8r+SLmSjIfaCFT7z8VX5yWEyxWYkG/aqGOaO7p9OWBMq+bPudWcek5
         ll4apeG85Y2FBOzAKRcBWaL/fkNTyBaROzfjFkivYIoH7mk88d9wVOKE3MMq8LyfSbta
         lyRIMtVuZQPovxgxkiqJZw6duydhRX+TSHi2qWLlYmw7fp+0h319eymQ4tczfcbTpQJB
         mfCYVHdePOUwbz1cbwvNj43ofeEIz/kvV3MI8mBEuTrNraCLm+QGBaRT9xDFnX/eevag
         1zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803106; x=1790407906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/n7V6rVhzACsIJzJlTeUTwF6umMgMDmbC0nfLvGCwoM=;
        b=FFJQ/LVRd10qsv1K4WaXaacvWsBMajjt3RL+oXyRZfNlNk7wUMGg192irW4enGfByK
         M4uHOxffS7ZwT8jniBTywkAsH+qJRHrJqj1/7UE28lutS5zEAxfJU+QYSFm/saGc2WNI
         N5+I6pldZSnRfLoBW/X/6bMVii3Mc+WdsGhrFb7jRQ7QljfSsWCyGiLrSWh6qbx+VHZd
         4fpjVtANLq+vZlFG1L1tGTdETDJB9diPuAG6jMPfkffjROhED/8EQxzvY+4vq8784GWr
         p+GJS1lxlGGwQctRdcYvhIolPftmGNgxxqJMsyJCj/UscuKvDw9LHK9PdavQjIqZo+pb
         Y0Sw==
X-Forwarded-Encrypted: i=1; AKwUvBzkIKrFlbxayNMGPEP2lD7lHRRH/tHr6+mNNHgj2+fg7q0+aEYx2gndxmHGckmm9UpKkSir+jVs4/z3LmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lHXcHYd1T+0Q9wRuBOIkkVKUhJy11UE5Mm0SWq+AtpQ+k3i2Nx
	d2g1ePppKwIfRCMLcGf1Kgj+z9WEsV5NOonriCHI5AJ+fTxuJDnSRnwr
X-Gm-Gg: AYBFou1wHZXJASamDo4caa81WdXH47BrY7EetWpz7+QcJRnj39aWwEPl/uZWjw6cVs9
	Q2YH7XO58jHdZB1zdfFDKshrb6pRuMu2tRmg3/EZrZO9aeuUizwVTMyp6v4mTIg3IQGhXeXGOnR
	DUSAB8g7gMNDMXJg5gsKPRVrgNv4sHjLOOei4r6fvXTQjO2GzgqMRLk6rzIRguqiczZ9Mkem62b
	OlDPcfexYVQ1y9ouD2wp9Exjt1HIP602e17MsEXdKrM+5vn//BJ2isuJyg8khb/palQ0uNDfELb
	7j0FnXZYGP05DKq1VWM/iy2K87x47tDAwYN1/mcinIgs3VsSJwan2F3ewM37M0K63JGAPLae++n
	zSqHZmJLsNz4RrVJpzoI4UOumHy+QCZ6F764g1r6VDnZ+73sDTQv7auM5awjWyx9+t8S9MSpAPm
	V4bjdhROZrHojzBJSEp86WNkL+oKKNqS7re4HuD1BcwKH1ZTMnrZZe46dgDIUtilhmXErermp6C
	Y6ds0A4xlMwrg6i0qjzrVYCpz2/buv6B7CuLA7AxeWIgEgC2dpf7NAz0b2lGtvRGAhON8wqjn26
	WJJSVO/fxVCVhvWBDFKgCmHL5w==
X-Received: by 2002:a05:6a20:4386:b0:3da:f969:b077 with SMTP id adf61e73a8af0-3dd8c425bdbmr10860733637.11.1789803106328;
        Sat, 19 Sep 2026 00:31:46 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae9e9c8sm654498a12.17.2026.09.19.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:31:45 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 15:31:33 +0800
Message-ID: <20260919073134.639-3-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260919073134.639-1-aa9736195201@gmail.com>
References: <20260918064238.868-1-aa9736195201@gmail.com>
 <20260919073134.639-1-aa9736195201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With blocks of 16 PTEs a PTE-mapped 2M THP still takes 32 reuse faults
and a 1M folio 16.  Lift the bound to the page table: the walk then
covers the PTEs that map the folio in this page table, at most
PTRS_PER_PTE of them, and one fault does the work for the folio.

Its cost, measured as the time of the store that takes it, against
420 ns for a reuse fault today (x86-64, i7-12700KF, medians, ns):

                          reuse fault   fault that     COW fault that
                          (patched)     allocated it   copies 4K
      1M mTHP            5,400- 5,700   63,000-68,000          1,500
      2M THP, PTE-mapped  10,000-10,500         126,000          1,500

That is 14-20 ns per PTE, about 2 ns of it the scan.  Builds that
differ only by NOPs in front of the function take either 10,100 or
7,500 ns for the 2M folio, with a period of 32 bytes: the loop of
modify_prot_commit_ptes() changes speed with its address.

What it buys, 256 MiB after fork() and the child's exit, medians of 15
runs, two boots of each kernel:

                                   16 PTEs         whole folio
  one byte per page, seq
      1M mTHP                     5.7 /  5.8 ms    4.1 /  4.0 ms
      2M THP, PTE-mapped          5.7 /  5.8 ms    3.9 /  3.9 ms
  one byte per page, random order
      2M THP, PTE-mapped          7.4 /  7.5 ms    4.9 /  5.1 ms
  memset()
      2M THP, PTE-mapped         40.2 / 39.4 ms   38.1 / 37.2 ms
  8 threads, random order
      2M THP, PTE-mapped          0.9 /  1.0 ms    0.7 /  0.7 ms
  one store per 64K, 2M folios    3.3 /  3.3 ms    1.5 /  1.6 ms
  one store per 2M, 2M folios     0.1 /  0.1 ms    1.4 /  1.4 ms

The last row is the pattern where the whole-folio fault is pure cost:
511 pages made writable that nobody writes, 1.3 ms more per 256 MiB,
paid once per fork().  Anything that stores to more than one page per
64K comes out ahead.

Link: https://lore.kernel.org/all/36933711-ae0f-468c-93bd-d6a67d974c9d@redhat.com/
Assisted-by: LLM sparse
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
---
 mm/memory.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 73e5691b3ed8..85c883d1e558 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4355,19 +4355,12 @@ static bool wp_can_reuse_anon_folio(struct folio *folio,
 	return true;
 }
 
-/*
- * The pages of the folio around the one that faulted are handled in aligned
- * blocks of this many PTEs: a 64K folio with 4K pages, and the size of a
- * contpte block on arm64.
- */
-#define WP_REUSE_NR_PTES	16
-
 /*
  * wp_can_reuse_anon_folio() found a large folio to be exclusive to this MM.
  * That holds for all of its pages and not only for the one that faulted: mark
- * the ones in the same block exclusive as well and map them writable, like
- * mprotect() would. Each of them would otherwise take a write fault of its own
- * that repeats the check on the very same folio.
+ * the ones that this page table maps exclusive as well and map them writable,
+ * like mprotect() would. Each of them would otherwise take a write fault of
+ * its own that repeats the check on the very same folio.
  *
  * The PTE that faulted is among them; wp_page_reuse() completes it.
  */
@@ -4378,17 +4371,17 @@ static void wp_reuse_large_anon_folio(struct vm_fault *vmf,
 	const unsigned long idx = folio_page_idx(folio, vmf->page);
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address;
-	unsigned long block = ALIGN_DOWN(addr, WP_REUSE_NR_PTES * PAGE_SIZE);
+	unsigned long pt_start = ALIGN_DOWN(addr, PMD_SIZE);
 	unsigned long nr_before, nr_after, end;
 	struct page *page;
 	unsigned int nr, i;
 	pte_t *ptep, pte;
 
-	/* Stay within the folio, the VMA and the block. */
-	nr_before = min3(idx, (addr - block) >> PAGE_SHIFT,
+	/* Stay within the folio, the VMA and the page table. */
+	nr_before = min3(idx, (addr - pt_start) >> PAGE_SHIFT,
 			 (addr - vma->vm_start) >> PAGE_SHIFT);
 	nr_after = min3(folio_nr_pages(folio) - idx,
-			(block + WP_REUSE_NR_PTES * PAGE_SIZE - addr) >> PAGE_SHIFT,
+			(pt_start + PMD_SIZE - addr) >> PAGE_SHIFT,
 			(vma->vm_end - addr) >> PAGE_SHIFT);
 	end = addr + (nr_after << PAGE_SHIFT);
 	addr -= nr_before << PAGE_SHIFT;
-- 
2.43.0

