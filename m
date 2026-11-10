Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333622;
	b=1aYQTrEUuwEH3uIr7PIVcBhoWaKS3cjwbpDyqXEB0XA4qDngwwDto1rGwAZ4TUlxQMHm
	 XOgvfpXGGNsSKMZWwvGF6d8Hl5tJDX1C0UrAzbX9AiCnh6HWE2lt0GcRZ6sQfw6kxs1Ms
	 q4KTZUf3hoqNtYfLeHfVhKfX1zZ+Tmtqb+ljWvO1CGV0fThxsvKpNXQoQSeVlG7OjdDzc
	 o2Z+yUn0k4w/vBkPXf9IHqRBeA5UlCQTJx9Y4nV1l68wQELciC3SmFU49qrsZY8jfAHh5
	 NCY6bRbe3G/LFWMStGzWplKF0M7kE8zScgmfVdtzdAF9bztXMZu/pSS/TzSpYarzmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fVpFL1WODwRfenr4aX6VwfzwxpQDJQNEZFl93DOugG4=;
	b=QC+rVQ4UDN340WgsmQ4q+gA65k3kGVrXICblYfz0Mu2WprlyevmiB70yr/C6dKz41gsX
	 g7cEr4TAhre6VQflmj4zVBsylF5WFyX743xqSDNvgFR8gXLlPW9RcaW7+fo+qwuSfLW9/
	 U9DX5nE0V1dMGUBAPOzIoPNkszrXiLbFCa2zlpkaAJlAFDEaBmtkVuEzst3Mv4X61tBdu
	 rgxtUyKrLMKZorpmcOQgHcvN5xAHWMHZME1gcoF8nzJyX6tAdk17DhDBqdr7z8A681RCm
	 YV2CyXPfW15I0VocVtvAmHzaGt/qs8lzeNUJm382G9Uqi2N4T+pa3S+SpYfuRyK5ORg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gd/s0/IZ";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7C606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D7C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gd/s0/IZ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so3078988c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333621; x=1794938421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVpFL1WODwRfenr4aX6VwfzwxpQDJQNEZFl93DOugG4=;
        b=Gd/s0/IZdWuTZ/liGv6c0g6dGottQVz24r39gba1ERYa6wrKHhbsZKwW3AW7Q73miw
         qgcS/G5F/XCuKLgJM+WZQRj67Yvp6tf7NDJRaOT+la0cOih3JnSk47z/30QwhpCVbT7G
         9juqGsMnE4EpkyGi7LqrFxYHIzShEHAArj8r3vbeM03r9uMoaJzZtQ5pyYGSYlFzol9K
         Ss1tjMJ/YAPmAY9l8X9JlElQfkaeizQ9waumNuHt7Rt1Ango9HUezOwgKGbdjG/UUKrt
         EAtcuii8NwUOzHkITPKZ2GmxWzk9ghapzgSpKckIr9B4/IN8JivMWATiQprRQFPjgImz
         tb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333621; x=1794938421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVpFL1WODwRfenr4aX6VwfzwxpQDJQNEZFl93DOugG4=;
        b=aqCd6T1LkFStJWnr1gHyVM9Gf+WN0kay4pvxYRgrnJNX47MRNNNVGIVD9hkuNrpXFE
         EPNN93S3y+bUlLqCAXb5q2ymI/ZYjNGET2cH+PszpInyK5UoXv/pWDNXTxR3UHRiw5mc
         P2l49nfXyJCPr0U9P/cAHrvPPy9NCqc7UyV/5+maLZ+lhPI/VVINWsOSoH8foGTGEDcK
         jG4rpmkYpshfj0EFxkOk/OUxW9dNEdySovf3DM2+ud901Ekb0SyxJ437dgHFN+GD22cP
         VRuZ+2VbX1MmnArYsgpCf2JBAAubDtjdFf41k+wVzwY0W9hjNGj6ora4CEudx9IKgThp
         2KcQ==
X-Forwarded-Encrypted: i=1; AL+hErFJFeONfbwetGDsxdQ8NF9v1p0ylBMxGUF17waXposzHIIkGnZR1OvTgx2KI+kS19i5MPbcYtJYpxbNMjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l/EMRa+9meWWczJN4uCzMquxLJHzEbDJEEf19kg/xQ6atoxMB
	6FfZZJbKY7J17tvyp9qyuJVWPfllv3Ur/VTEEgpE5FpTh5hv5uO/WfN9
X-Gm-Gg: AYBFou2px7T9PbeiWYNZdkF4oovsJvlD0Gxicuvw0d3U9gYC0BfbWBRDkvLdeAlKsOb
	TxE/+g984wnVOeQFNAbhno9LJMyJfJPWF/0MziT+03GMWDIpMJD3Qtjjn83ytEhD4fBENIxlpsl
	l69osdDmCLriSDxoa9YnP9XwJdYqnqox3vUamGJPhzf3+21OYaoqUm+I20Us39g3puY9E3Iq7eI
	TF5ea+9A1Rm7AvNDbGu+f+9u+o9wxzixr2S24Nu8/kAdAzHfim9xABtsbTQR/IqW977bfJA2PN3
	b2WNesXqBuFWGg17YyWEeJpJs62lVDHcjNaY5JNg2m51Fl8p73BrgVknVUEVj6buLi7+g5HDZvK
	TDHmchKFRbtBaIeMAHL53LgUHIZWlS7AcVhD24e1dlST4ZIpJRURUi8rbHtrE4jk4tFpcJ0B1uW
	N8yczAQSdy0vS2O0uB6N+eCeHg+lUFfDPRXBDaPNsHt2G+Wb0Dkx22KMfT5l5LGh2314euZfil+
	d7JK92QGSMljwww7192Sp+5c9MK6iPCPHPxSnWX8p+hdtER7OCz5DqkFOH3XrxD4BjsSt3PgSsn
	HKQXSa1QNfGLmGya/o2GU6Ng2LqbnWJ2mErTWKyhI3VwOozwBBk1PN5jicY=
X-Received: by 2002:a05:7022:170a:b0:1b2:533f:622f with SMTP id a92af1059eb24-1b3b605af2cmr4401995c88.12.1794333620939;
        Tue, 10 Nov 2026 10:00:20 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:00:20 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 3/9] mm/huge_memory: add and use unmap_huge_pmd_entry()
Date: Wed, 11 Nov 2026 01:59:18 +0800
Message-Id: <20261110175924.2945538-4-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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
index dbcacc7b1374..85813114fde1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3193,6 +3193,52 @@ static bool huge_zero_pmd_can_split(struct vm_area_struct *vma, pmd_t pmdval)
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
@@ -3232,34 +3278,16 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 
 	if (!vma_is_anonymous(vma)) {
-		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
-		/*
-		 * We are going to unmap this huge page. So
-		 * just go ahead and zap it
-		 */
-		if (arch_needs_pgtable_deposit())
-			zap_deposited_table(mm, pmd);
-		if (!vma_is_mm_managed(vma))
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
+		if (!vma_is_mm_managed(vma) || is_huge_zero_pmd(old_pmd))
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

