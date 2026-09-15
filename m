Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346254A68B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485886; cv=none; b=hpYsGc/t5R9omXP2ZsNMiqJGgm+Tnbyy0EVx5Z09Feln0U7DxxxEnHqTnqJrkhCTHs2rcACnGT2tE0EhQsWn/lFNoRD84TRbfImLWte+5fyfL6dDu6bRoaMjP8km+CtttihWN8GkTTrq3vhW7oxqK0B4fuNxj8Vo+KhwylaeDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485886; c=relaxed/simple;
	bh=2nwH07F3grXyOfmSRVBaFlnDUB7rVWX4HfkKXv81Pz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UV4U2t+ODPWYQoFa3Xs/zsHRbyZTx23sVY2IZ232Abt+wUwviqTGG/4Z6WIb3lRgc2GO40OyfL7chznqlY3U23rxaLWAXDEY4wO2nF3IjG+qF35h3eP7Uu5+DrUuPh6wkW8h+9kw+uZbZeIlh5CihrDb2bJjf0MtjVysveN4N38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LaYhjaMQ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LaYhjaMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2y
	69Y0OdCOmdac9UFhhuRQleCsaQRsPBDc468BBCNVU=; b=LaYhjaMQxahAszyxRP
	IP8O/nHjLSH4Kkt7ok78QfYW9xBijQWBDP6LSytr0vB0X521xX15evJYuEyumkYG
	O56GVusCvyZ0/rbdbwrTm7OMYb/IsjnClD+R7veAP5QVoUbxyCMRUCqMVYNLBVWS
	CNebuEgRLaCFkHg4TyrWg6G3g=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHvVwYY6lqm28iAw--.18968S2;
	Tue, 15 Sep 2026 23:24:08 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] mm/ksm: pass folios to replace_page()
Date: Tue, 15 Sep 2026 23:23:47 +0800
Message-ID: <20260915152351.7955-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHvVwYY6lqm28iAw--.18968S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWDuF4UWFy5Gr1fWw4fGrg_yoW8Aw4UpF
	4kC3ZrJw4UJrWY9Fn7Kw4qyryay3s3ta1jya4fXa1avF15tw4qkFy8K3s8AFW5X34kCa93
	tr4UtF1j9FW3Kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jo7KsUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xnj3GqpYxl4WAAA3I

From: Longlong Xia <xialonglong@kylinos.cn>

Pass the source and target folios directly to replace_page(). Any
large source folio has already been split; KSM and zero-page targets
are order-0.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8884964d5a53..4a4347e9ce39 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1453,18 +1453,18 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 /**
  * replace_page - replace page in vma by new ksm page
  * @vma:      vma that holds the pte pointing to page
- * @page:     the page we are replacing by kpage
- * @kpage:    the ksm page we replace page by
+ * @folio:    the folio we are replacing by kfolio
+ * @kfolio:   the ksm folio we replace folio by
  * @orig_pte: the original value of the pte
  *
  * Returns 0 on success, -EFAULT on failure.
  */
-static int replace_page(struct vm_area_struct *vma, struct page *page,
-			struct page *kpage, pte_t orig_pte)
+static int replace_page(struct vm_area_struct *vma, struct folio *folio,
+			struct folio *kfolio, pte_t orig_pte)
 {
-	struct folio *kfolio = page_folio(kpage);
+	struct page *page = folio_page(folio, 0);
+	struct page *kpage = folio_page(kfolio, 0);
 	struct mm_struct *mm = vma->vm_mm;
-	struct folio *folio = page_folio(page);
 	pmd_t *pmd;
 	pmd_t pmde;
 	pte_t *ptep;
@@ -1613,7 +1613,8 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 			err = 0;
 		} else if (pages_identical(page, kpage))
-			err = replace_page(vma, page, kpage, orig_pte);
+			err = replace_page(vma, folio, page_folio(kpage),
+					   orig_pte);
 	}
 
 out_unlock:
-- 
2.43.0

