Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981D49A3A0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400941; cv=none; b=KK7wzTULnqMcX400tyldY60iUvzDZO+NtzBYf4SIgrwEHAhIjxnmUGQCTR7Vc31VFrHcg8FZIBt0I3jp/BojpR+A50BCfiPUUU9Tz3QC+wlRzc0d6USfO0lNyTwLWAMKn8XCfLNYIAmzCqABjWdp2yp8HWiHyrt8Bc7OxmeCMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400941; c=relaxed/simple;
	bh=Bzq3/RGv85idXkoWlK7EtgKQNZZxLdTg9B9C3aypFoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7aOt8YINweTSGFUNDXSQV39tC9rqrqVFVjWZ4r6N1NAxIa0OtR3UBnxjeg31B1v54bkB2g6eT9nb/XBBypI50uT8cjiL7sVd1oTBwHuRgfAbl6DgKrFt7RnaU9/xEt0gv4iFTz+X+2dWQ4M92AUOd7ePL9nEcWQf4edO2upZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gNETf/K0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gNETf/K0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987b4a710so13106095ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400939; x=1793005739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+7LPi5HRPOOcdUC/D4c64YzsREdoI+6xRf4WfL2Y6c=;
        b=gNETf/K0giq4BF48k+9/mPUJXjSt6Vs+Pc31WEGHNzdSizrPFd/3J+e/rtvBLCqzsz
         0y0NkGubCpxmFO739N+OUWzdndUcTFZAJkzFyg8Dh1P3/c1SgC+1iog5uVJyyoRmE5FA
         YHuhwb4auXLVbi5/uMtD8Che2yd8D36EVa6OhVZ8YYtfQuOr4KEdCCALUHBVaohlMTOT
         pIy/QFS0wk13+e5mrX+jZtws9a+Cg+Mp+0Vv3YG4e2/nmBUS3mJrpJAgDN7wP3U789TG
         XdJ4aSdxHJAjZ0+51vTV9vOkf3N063HxhFrtfHgnq3AuiSJgmvmt49RElIilpI7wla/+
         Yzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400939; x=1793005739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+7LPi5HRPOOcdUC/D4c64YzsREdoI+6xRf4WfL2Y6c=;
        b=Od6BWw4DUblO0MaBPJ75rolDtzIQXINC7E1Z/GOY9ZWr3eklslxfR8k+xxuF0ODIVI
         7HDxCOSeGN59d/3nBz5JFG7AyYAJWHWNb+xzAjDY34wwk4UOepgrm1z0P4hbExMS5iZo
         5ktIU6aSgCAJ/6QaUPXDE2qyE6oNaCjQ4bWO4/nXcJrMzeqggcQzFRYCuahUTQuf/NoP
         e7vGGJCz91F7QQOUUzCvjByyZBPieno5j7bJkzOGp8FOiiRC5NhiYoNZezirPWJwG7QO
         QAk733AS7c+TsZeyhW8XqqxMlxV+ZK1j4TJbcF6gQPwIRalNdRrCAEz2/0JIp3ATNp9R
         bKGA==
X-Forwarded-Encrypted: i=1; AKwUvBzBOOlSwzj2JScNxv4SIZZs75vzk/wtvkd0u50XHOYipZwHelKyJ541pp6/VFDV0HSdt44BYIML8mpgFKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyCclDwAiFpqWqcL8dOJcz0dvc+0yGnQYa4zJQtNCfXTKALR6Z
	KfkFqT4vvKFdQWlrbd6sNgrugQ7j4hxr0OhQhZeT+TawdEV2VH9hZTChiZzNu7bfmO0=
X-Gm-Gg: AYBFou2IBthTnOWGM67B+znHQqNX/uzlduDpUy929JKLt6UhRb2Ghes4kuadg7BM8wX
	cyZ8Q/s43RlOJsFDd4bn7PvuLrSSSGScL+MrTtfQbr5YxLj3PXPaGYX5/iTqpVMHQUc05UMaKlr
	CaRtiHu7XASFoGZC32LfrzUY74GrCT/LpGMjX2moh0XoCl5ue8IIlID8s/K9VYMFADG0/MY1o/c
	piRU74wXIActFWhY9w3LYWsKq7W+k9WZ/x7jvLb+M5AB348bpCSkXU2nqq99VP4q1VkbZEBYrLJ
	X2h3NgucQhjpUX+qPWF8PeNkmqRhJWxsspYq1IsHIQonRbJsO1nUx+ntlcvCh92spCZUG/IKgc/
	M8GjoOVqNfUcUTiMBzZnCIwCVrDh2MUiRhEoU0eSWavN78S/lXw9Fc+zUWRrji4062l1GAVsyBJ
	taPTjKb18WRpB1a8Aqg6v0r7FcZrXSaJaGgOKIUdIvPJUwalomCxiw3KaWFBtZaRzrCPOBl1wEO
	Mvx1Du6laG+2N3+i+s=
X-Received: by 2002:a17:902:f603:b0:2e8:6540:11b6 with SMTP id d9443c01a7336-2e9a6e3c596mr43244805ad.37.1792400938093;
        Mon, 19 Oct 2026 02:08:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:57 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 3/4] mm/hugetlb_vmemmap: remove vmemmap_wrprotect_hvo()
Date: Mon, 19 Oct 2026 17:08:29 +0800
Message-ID: <20261019090830.1917657-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared vmemmap tail pages are now mapped read-only during initial
population, so already optimized HugeTLB bootmem folios no longer need a
separate write-protection pass.

Remove vmemmap_wrprotect_hvo() and skip these folios during boot-time
optimization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/mm.h   |  2 --
 mm/hugetlb_vmemmap.c | 18 ++++++------------
 mm/sparse-vmemmap.c  | 23 -----------------------
 3 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 35f5fc43861a..6f5affe54946 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5359,8 +5359,6 @@ int vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap);
 int vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap);
-void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int node,
-			  unsigned long headsize);
 void vmemmap_populate_print_last(void);
 #ifdef CONFIG_MEMORY_HOTPLUG
 void vmemmap_free(unsigned long start, unsigned long end,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..3d72346c2ca2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -603,19 +603,13 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
-		unsigned long spfn, epfn;
-
-		if (boot && folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * Already optimized by pre-HVO, just map the
-			 * mirrored tail page structs RO.
-			 */
-			spfn = (unsigned long)&folio->page;
-			epfn = spfn + hugetlb_vmemmap_size(h);
-			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
-					HUGETLB_VMEMMAP_RESERVE_SIZE);
+
+		/*
+		 * Bootmem gigantic folios may already be marked optimized when
+		 * their vmemmap layout was prepared earlier, so skip them here.
+		 */
+		if (boot && folio_test_hugetlb_vmemmap_optimized(folio))
 			continue;
-		}
 
 		nr_to_optimize++;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index ba0496daf4de..0af4b9e791b2 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -386,29 +386,6 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-/*
- * Write protect the mirrored tail page structs for HVO. This will be
- * called from the hugetlb code when gathering and initializing the
- * memblock allocated gigantic pages. The write protect can't be
- * done earlier, since it can't be guaranteed that the reserved
- * page structures will not be written to during initialization,
- * even if CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled.
- *
- * The PTEs are known to exist, and nothing else should be touching
- * these pages. The caller is responsible for any TLB flushing.
- */
-void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
-				    int node, unsigned long headsize)
-{
-	unsigned long maddr;
-	pte_t *pte;
-
-	for (maddr = addr + headsize; maddr < end; maddr += PAGE_SIZE) {
-		pte = virt_to_kpte(maddr);
-		ptep_set_wrprotect(&init_mm, maddr, pte);
-	}
-}
-
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
 {
-- 
2.54.0

