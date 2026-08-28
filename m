Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDEA32D0E3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942243; cv=none; b=VyVCYL2U0exRCt/9fenYopkAVRJ6sbCi2sFYjim/78+jaNewe44nfRd83QXUpHkVB5u1yZqjcVjb5lmxzfJkpHaVK5ZC9mTsVmzkUGlLX9ZOFQSMSJtcjCgWDcSp0PTqSgIin74DxjDBivCoYpqueIt6bow1LJIzQechiz5dOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942243; c=relaxed/simple;
	bh=lVioQX+VsW1vNtJcHZ2TqlH0YfV3EGIpr3cLnID2MDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qpruy8KQiDFta7tuhN78Gz2TGrsuxhn++CtZQO+pvdI8yZ3NTnUlTDG15b0taUwMpF1PPD5t7wLAbFPMCPYImVsSiV38410Ydq5YuPw6IezhnnRyajpmivK6Flk60amsg7USZYKxL9hug9IsiLhoPcnS+wfxjb63XhljNQdDBpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8zSqy1d; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8zSqy1d"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-854f8068301so901792b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942242; x=1788547042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfcyzCAqaQXbJL0WVp7G3Q9umeDsMlNHg+F0EE9N96I=;
        b=I8zSqy1dmLHUWhSbHK8aXWYatE0x/O8B2zOpgzMGTYBBkJV6gHbkyEXgxA3JSHfzCN
         9+NGDZlLASN684eZgcpB6yZiqQBRw7l5Wb/iZRc9t230DIAkO2/Vj2fHih59OFt2L7R7
         9R4n085SCLCZR4J4LbFJ7H8FES0gHs/f/6mN/DSeACLJrVIEmJSlK0+nKN4C3+q4pw0s
         NRj5r4HZhTJp0wypBGqCtxUNKRr4eD0oAASYy74WmefBhNZspmX3p78jBasdf1otuyEK
         PLhJnN/mXNttE6VsZuL8jfLrnxdBVW3t5TPIxcRRX8vAhH6XBsDG7d8QIP1lE7qaAqGv
         PHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942242; x=1788547042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfcyzCAqaQXbJL0WVp7G3Q9umeDsMlNHg+F0EE9N96I=;
        b=rn5QkcR3xC/bWWzMtvpSUY495SudZkGl3gBzSguz/zXVkc0uvuQ1jyraMgq/E73kZ+
         ftPvsd0tkRkBHfrAXCEVvTSFqQ9FqF2z+++nmju1xB21/Q52mGH/FtTiEaIKbKDKgRMM
         FQaUx5Jp3qKCkpqdt8Yli6RrxsZusRO6mkJarz+cQeBAYdtm9UScgBkTIvC0VTOsYnYz
         sKsWBpS/L4Rh1IDQnB4sBzOw3TXPmSB9nHc159lEeR7oKbpp1CAc8zsmCDAFcUuSKrK3
         tn3WT1d1Ov8xZycj+aK2PlVQqL25WpMA12KNAPVbxtrB8XWAt+/lbvya3fNS5xmV1m+7
         Q7WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFvVZ2uj0Zqy6wIhEpi35Z37G9PiHOaE7h77lZ04WaEAIbe7+C8EX923Yle5iy9+t17/5jXebts9C+kBc=@vger.kernel.org
X-Gm-Message-State: AFuF++kVdxhEfHmDkY8vBo9lSEd/7j7CQPYkYNQ38U/S0ttloNQjx5II
	1wlbGLr4Uy81/vcaQkGJ7geuQF8cvEvXKDchVIIj2Kz7Av4hsiKcfbCq
X-Gm-Gg: AR+sD11oJf37eOB0z03zm0Qfp3xP8LVP541FkdoQlcmecBARYX0G1X6ciZWmRM+Ijco
	ecEm1QTJ47PdhXVrxmCRj7ZO90BPVM9v6ky5lZimgsXdPlr3bU4MToEKxjbON3poieWbgy09/wq
	QRtqA8GWuOyrkvLCezDAGEYE1sfINwnEAZSJumwAVpCKnr5t8C84lbE+V5wogdi4dOpm90uy/xe
	3KF5/TC0l3RZDaWfs+CsfnDYJ1bFkKBMnu8+B3+uvEyqhHLiC+tmZy16TVO9MkFT+PbQD0cZaUe
	hZLqpyPwpnIecs1BSOjfBg6ouBCzbyKFIvRpuepzclhHOzH6rblu9/FhmWG+AxpezAjXsvaAVaY
	TF++ym8wEqoPJDxf/qfavQoVav0czkNRxEEJ0+vPUz6DHs0v++Mw4EFbBBYpS+Vv6q8fAGuNONB
	MY6r8gdDeTGBn02ZdXF0zDYpe0Ba5lXF+UT65ysOHaCBw+NQYgxLBpiC2r9GslYEyE32Gg8LCHO
	aRxbyKHFnCm5NY+EPE=
X-Received: by 2002:a05:6a00:9459:b0:857:727c:a1f8 with SMTP id d2e1a72fcca58-857727ca426mr2412271b3a.26.1787942241652;
        Fri, 28 Aug 2026 11:37:21 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:21 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 3/9] mm/huge_memory: add and use unmap_huge_pmd_entry()
Date: Sat, 29 Aug 2026 02:33:13 +0800
Message-Id: <c64ff489b0c59086fcafbe74614d47df66010ca4.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only a huge PMD entry mapping an anonymous folio is split. Everything else
is unmapped and comes back on the next fault. Put that in
unmap_huge_pmd_entry().

Old and new differ only for a device private entry in a non-anonymous VMA,
which nothing in the tree can produce.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 84 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 28 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 90d84f761619..aefd62827139 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3148,6 +3148,52 @@ static bool huge_zero_pmd_can_split(struct vm_area_struct *vma, pmd_t pmdval)
 	return is_huge_zero_pmd(pmdval) && vma_is_anonymous(vma);
 }
 
+/**
+ * unmap_huge_pmd_entry() - Unmap a huge PMD entry rather than splitting it.
+ * @vma: The VMA @pmd belongs to.
+ * @haddr: The PMD-aligned address @pmd maps.
+ * @pmd: Pointer to the huge PMD entry.
+ * @folio: The folio @pmd describes, or NULL if it describes none.
+ * @is_present: Is @pmd a present entry rather than a softleaf entry?
+ *
+ * Only anonymous folios are rebuilt at PTE level when a huge PMD entry is
+ * split. Everything else is unmapped here and faulted back in on the next
+ * access.
+ */
+static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
+		unsigned long haddr, pmd_t *pmd, struct folio *folio,
+		bool is_present)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t old_pmd;
+
+	old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+	/*
+	 * We are going to unmap this huge page. So
+	 * just go ahead and zap it
+	 */
+	if (arch_needs_pgtable_deposit())
+		zap_deposited_table(mm, pmd);
+
+	if (!folio)
+		return;
+
+	if (is_present) {
+		struct page *page = pmd_page(old_pmd);
+
+		if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
+			folio_mark_dirty(folio);
+		if (!folio_test_referenced(folio) && pmd_young(old_pmd))
+			folio_set_referenced(folio);
+		folio_remove_rmap_pmd(folio, page, vma);
+	}
+
+	add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
+
+	if (is_present)
+		folio_put(folio);
+}
+
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
@@ -3187,34 +3233,16 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 
 	if (!vma_is_anonymous(vma)) {
-		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
-		/*
-		 * We are going to unmap this huge page. So
-		 * just go ahead and zap it
-		 */
-		if (arch_needs_pgtable_deposit())
-			zap_deposited_table(mm, pmd);
-		if (vma_is_special_huge(vma))
-			return;
-		if (unlikely(pmd_is_migration_entry(old_pmd))) {
-			const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
-
-			folio = softleaf_to_folio(old_entry);
-		} else if (is_huge_zero_pmd(old_pmd)) {
-			return;
-		} else {
-			page = pmd_page(old_pmd);
-			folio = page_folio(page);
-			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
-				folio_mark_dirty(folio);
-			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
-				folio_set_referenced(folio);
-			folio_remove_rmap_pmd(folio, page, vma);
-			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
-			folio_put(folio);
-			return;
-		}
-		add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
+		const bool is_present = pmd_present(old_pmd);
+
+		if (vma_is_special_huge(vma) || is_huge_zero_pmd(old_pmd))
+			folio = NULL;
+		else if (is_present)
+			folio = page_folio(pmd_page(old_pmd));
+		else
+			folio = softleaf_to_folio(softleaf_from_pmd(old_pmd));
+
+		unmap_huge_pmd_entry(vma, haddr, pmd, folio, is_present);
 		return;
 	}
 
-- 
2.34.1

