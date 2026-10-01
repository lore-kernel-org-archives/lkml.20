Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3337497385
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867438; cv=none; b=HYiC0OYqBkcy5hkSdgTUuICiI3SVsXyuG+tuTEZY4KPdyxN6bJRp8WXQcSDwexFecJYdQqwHHGg6qgn+OuGUvH0ro3bBX0da3W/Ga8hmTuLRdWtMAzAtQvT7L/ysUDG2Qa7t185dGrwLCC8SyVRhPh/tdVBwGAq5vW6t/0RSmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867438; c=relaxed/simple;
	bh=BDHlP6KRGdFjTtK4GxRmpe0oZI27PY6tDJm5on4PkDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iGtdnGZuQB2D6WBgEPF1xzG1mffnGlb2ZABju1Sh+KnGqm4wC1ibLL7EQQl6xJRJxmBtWc7Fi2n3Ej8oUnHMC3hT8tjt3bg4LUb21J3SVKkjdbTZA56mKNvOdjOu0rVXGSaVxy2x8hXRl69XF3Kg5iVowSA2WyOUCls7uFc2+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDIwrdoE; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDIwrdoE"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so7313136c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867435; x=1791472235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7HO9HjcV+veIH/3O4cu1aJQGXCcymcqVyGYdv+R+ZPE=;
        b=jDIwrdoE/SuCx4nESAPqyb28UtQM24McsscoA256ziMEiTfMQn6NDoD/qH9Qo/jjZ7
         QUfktUpQUzeE8vrizZybSl8Io0mhTNz+b7UwM/W1bS1Hf+3UPD84m+fAJzWFL9uTVyuE
         5+MBSFrP/gzKpGnZju7Bf477CwKq0DXG7UgnvqipKJmJICP2RnbRc1/ADGBxYwqrhhfw
         AU0TdjY+Py0QfafC/BRO0APOSiw1wmP+y5mJnMr5g7EaEjxH+CM+uFV8uZTFMVo52K31
         syshSTZt/5jNCvzyBCP1PYUlrBvXaBmZDeKtd2oYQMlh2c60qsTNmI7rueAoVMHJ940N
         tHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867435; x=1791472235;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7HO9HjcV+veIH/3O4cu1aJQGXCcymcqVyGYdv+R+ZPE=;
        b=kHe6RA4WA8yygy354pUm3KYmirhcISzx3JL24JzrF/vg87QpsQ+4+MVRpu/2CtpBU9
         sK9FA3JIlkebfbCWsrSO6XTTVsY0US5Y9z/2pYyPCWzVMf1Gt3iztH9aMAZHTIm68Siq
         v1uHdPBwL2QcECmwg/257QR6lgFmAbUOkIyTt+3x2q8tjcHb/7EsfGA/PUusbCcLdsYD
         hav0jDfwOIJbdKlLHIAzhJZhgUGzzjokzEc6vlAHwnuK2CaqhJyTIBdVVHNYCEkB/Vvq
         0GlQOT/EimkNFLxkPBQ9fLEY8LFOoK5eeFNFQz1sUjVnv8G8idbl1xmf+MLjU4wEeFgB
         5EVg==
X-Forwarded-Encrypted: i=1; AKwUvBzXzahm2xY+3QHe64rW72KV3rV1DSbUY/9M9sF3/DVSK3QpcGqS/taxkYik/rs4B3CTp9M3kYeHaoiWQj8=@vger.kernel.org
X-Gm-Message-State: AFuF++kShUet1/CxW4zJAnKuGul4IwhYLyFDbj9aqB22MW/ZJl0s0spO
	y8+VcNKesk7FJMtzQHelVBOH+zGrSUdBuUzpsMcfkceUTXTTTfTkUG7kgEaPfg8o
X-Gm-Gg: AYBFou21EYlUmWri/Wgg5TkOnnwMr6Mv8zg9GCrneNad+eiCjb7r+uueNpRValbTgjO
	IDFnPY+lfaOVoYSNseHOI5zNoy7kZsH0tuHd75QGS98tJfIE51KUphqRyFmI/qgoQNEci9xE8R9
	DnEO/G4BLPsJbnK+fz0QV0yGy1i3c+KLAC+EfSEdLsAvK5kcIFwz4DGgxC4jy5V/ygmcYxVaiYu
	v02k86ZcPn7yJwbeEUoc5tfw74XXU2HgjlqwZSS3kj3hTqF+Pp07rdS7swhkoncnai8WPJOLeH8
	Trkb606yzbokcQYDV/SKOif/pWXmpkoi8+s1dINF4WSJOtNGrlkqZd3pHED4mAZYQyjpncQMjDM
	oUte1t0JbNN6KwgFV5MC4RRq8rw/YPqm3sEErwGEHYlh7Q/ICdeM2Os6LNUivutiD9kiR50SzMJ
	nMa+SL3pLhs79pIEP5Ss861yYtxs9aMj+GfyiiLeyUkrlddJE2QzdPByfCu1ZSJyyMkQ==
X-Received: by 2002:a05:701b:465d:b0:143:26eb:18ea with SMTP id a92af1059eb24-14d330b0e85mr4662029c88.29.1790867433781;
        Thu, 01 Oct 2026 08:10:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f2766157bsm37986c88.12.2026.10.01.08.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:10:33 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 23:10:26 +0800
Subject: [PATCH] mm/migrate: look up consecutive pages together in
 do_pages_stat_array()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bug-mm-move-pages-stat-batch-v1-1-255b7e915744@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOF3vmoC/x3MQQqEMAwAwK9IzgbagnXXr4iHqLHmUJWmiiD+f
 cse5zIPKCdhha56IPElKvtWYOsKppW2wChzMTjjvDXG4ngGjBHjfjEeFFhRM2UcKU8rLt6R+zI
 1H99CKY7Ei9z/vh/e9wfq4ZDzbgAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

move_pages() with a NULL node list reports the node of each page. RDMA
and KV-cache transfer engines use it to find where large registered
buffers live, querying every 4K page of buffers that span hundreds of
gigabytes.

do_pages_stat_array() looks up the VMA and walks the page tables from
the top for every address, taking and dropping the PTE lock each time.
That costs about 105 ns per page, so a 16 GiB buffer takes 440 ms.

Callers almost always pass consecutive addresses. Reuse the VMA while
the address stays inside it. After folio_walk_start() locks a PTE table
or a PMD-mapped folio, answer the following addresses under the same
PMD from that table or folio before releasing the lock. Other
addresses still take the existing path.

On 7.3-rc5 in a 16-vCPU VM, querying every page of a populated buffer:

                       before       after
  4K pages, per page   105 ns       22.7 ns
  THP, per page        92 ns        13.1 ns
  16 GiB, 4K pages     439 ms       95 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/migrate.c | 83 ++++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 22 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa7..5f470dc7dc746 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2451,44 +2451,83 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 	return err;
 }
 
+static int folio_stat(struct folio *folio)
+{
+	if (is_zero_folio(folio) || is_huge_zero_folio(folio))
+		return -EFAULT;
+	if (folio_is_zone_device(folio))
+		return -ENOENT;
+	return folio_nid(folio);
+}
+
+/* Look up a PTE in a locked page table the way folio_walk_start() does. */
+static int pte_stat(struct vm_area_struct *vma, unsigned long addr,
+		    pte_t *ptep)
+{
+	pte_t pte = ptep_get(ptep);
+	struct page *page;
+
+	if (!pte_present(pte))
+		return -ENOENT;
+	page = vm_normal_page(vma, addr, pte);
+	if (page)
+		return folio_stat(page_folio(page));
+	if (is_zero_pfn(pte_pfn(pte)))
+		return -EFAULT;
+	return -ENOENT;
+}
+
 /*
  * Determine the nodes of an array of pages and store it in an array of status.
  */
 static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 				const void __user **pages, int *status)
 {
-	unsigned long i;
+	struct vm_area_struct *vma = NULL;
+	unsigned long i = 0;
 
 	mmap_read_lock(mm);
 
-	for (i = 0; i < nr_pages; i++) {
-		unsigned long addr = (unsigned long)(*pages);
-		struct vm_area_struct *vma;
+	while (i < nr_pages) {
+		unsigned long addr = (unsigned long)pages[i];
+		unsigned long next, end;
 		struct folio_walk fw;
 		struct folio *folio;
-		int err = -EFAULT;
+		pte_t *ptep;
 
-		vma = vma_lookup(mm, addr);
-		if (!vma)
-			goto set_status;
+		if (!vma || addr < vma->vm_start || addr >= vma->vm_end)
+			vma = vma_lookup(mm, addr);
+		if (!vma) {
+			status[i++] = -EFAULT;
+			continue;
+		}
 
 		folio = folio_walk_start(&fw, vma, addr, FW_ZEROPAGE);
-		if (folio) {
-			if (is_zero_folio(folio) || is_huge_zero_folio(folio))
-				err = -EFAULT;
-			else if (folio_is_zone_device(folio))
-				err = -ENOENT;
-			else
-				err = folio_nid(folio);
-			folio_walk_end(&fw, vma);
-		} else {
-			err = -ENOENT;
+		if (!folio) {
+			status[i++] = -ENOENT;
+			continue;
 		}
-set_status:
-		*status = err;
+		status[i++] = folio_stat(folio);
 
-		pages++;
-		status++;
+		/*
+		 * Callers usually pass consecutive pages. Answer those that
+		 * fall under the entry or page table we already hold locked
+		 * instead of walking the page tables again for each of them.
+		 */
+		end = pmd_addr_end(addr, vma->vm_end);
+		ptep = fw.ptep;
+		for (next = addr + PAGE_SIZE; i < nr_pages && next < end;
+		     next += PAGE_SIZE, i++) {
+			if ((unsigned long)pages[i] != next)
+				break;
+			if (fw.level == FW_LEVEL_PMD)
+				status[i] = status[i - 1];
+			else if (fw.level == FW_LEVEL_PTE)
+				status[i] = pte_stat(vma, next, ++ptep);
+			else
+				break;
+		}
+		folio_walk_end(&fw, vma);
 	}
 
 	mmap_read_unlock(mm);

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-bug-mm-move-pages-stat-batch-f62a29ea5867

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

