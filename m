Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647844;
	b=fj19snbf0BIqMOzlfI0i2XviZaxRzWc/kT8c8SDULmeE5O78YFc5RAwGtfuWHnjYJFAD
	 BdX46q2tfsDkk3O7f3W5op8p+Jk03YJ7h0iJwqvpWggeaIfnbAZ4fI4DRUTZDCYc8qJ3h
	 LtL0jxrfprU7lx2U+PAJhd+QhdvL4KVwviCv9chjQUlt2pgh2vXeHFzDy9NTcnmsCk+qH
	 h+gQm+OAowpG8573qtSJhNqFu3qJZahTn63FFilNHdQsBabxKVmuhYH9KaFTf7Opm+Kf7
	 Inq5lNX0SQZMc825vc6dJj7SiJa1mJvaMVaYOXP1GLHFPn1SF/6UVVxawD9fYgck7XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647844;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQz4ufqd2Q4pBt2NMjn+Pfl+axlhgiEHVkl4wqUSAM8=;
	b=Qe6GwPLzpBGZ8cjwpcsxKzs+b0DGCGOduXJb8ZCF00/SiMknLpErIRP1PmlWWc9IVpcU
	 fWPFmQZv8XR6xYll3O3KZQgzz5GB2hu7ZKSFSnIJTjOj8cwp+ij8lHKVSUCttDG0dWPZq
	 7j9hrNFIOkMGXa7zWjvc1ODybVIaDjoIN3LlhqjPPxkyhEptqpq8ViGCmWFzIQX4h3nzA
	 SrO5k4JbXTOSAwwvk3UlEjxXpyWrfB4nFjzJmGwPgLyq70iH3AT3PBfKjXRCtijIUGvHf
	 qswVX4myyIXkNoYDT96fS5enzLcG1xtDdBPWYEROsrw9NHzn5v/CCpt2yFgCQzZlEmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="iL+qx9/J";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B7606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=iL+qx9/J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=xQz4ufqd2Q4pBt2NMjn+Pfl+axlhgiEHVkl4wqUSAM8=; b=iL+qx9
	/JBkO86cVuNMAZvBxfplTv6ssEsvlUud/J24WEiSke+ox1ksfdHctY2tCsgnMsI/D6PXtHQg48IHQ
	LoQEMwjm04/NT4lcvkNBvpA17v8wJx5IRpwYp+jSV0fpyjwcLA1/bdOYtCvdWAkpHFbzZI37xXVgG
	wwYMryms2NjxURsevcBkgpaVJGw+mKGUeuVX+B9C6OWrbbzORuZKHSdOfCV1AsS1sWWhA5ZzVgtnz
	LLKik2pnPrJA1JcG3Xur5hH1Wsojbzdb6igJxU2/8XYocEPcZ451sd35mMq57FPiqIBTgluXAuFpz
	jXtIWuoBlsMUK5I42SVJsDTlctqQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-0hAn;
	Mon, 02 Nov 2026 19:30:32 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 5/8] mm/gup: fill the pages array outside the pud/pmd lock
Date: Mon,  2 Nov 2026 14:30:23 -0500
Message-ID: <20261102193026.3860700-6-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102193026.3860700-1-riel@surriel.com>
References: <20261102193026.3860700-1-riel@surriel.com>
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

follow_huge_pud() and follow_huge_pmd() fill pages[] and flush the page's
caches while still holding the pud or pmd lock. Neither flush_anon_page()
nor flush_dcache_page() needs that lock.

Have the huge paths store the page and let follow_pud_mask() and
follow_pmd_mask() do the fill after they unlock, so the flushes happen
outside the critical section.

This should be safe because try_grab_folio() has already taken a folio
reference before the unlock, so nothing can free the page while the fill
runs, and the fill itself touches neither the page tables nor the pud or
pmd entry it was reached through.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index c2a4f5b987ced..2edffc424f272 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -714,7 +714,8 @@ static long follow_huge_pud(struct vm_area_struct *vma,
 
 	*page_mask = HPAGE_PUD_NR - 1;
 
-	gup_fill_pages(vma, addr, page, 1, pages);
+	if (pages)
+		pages[0] = page;
 
 	return 1;
 }
@@ -779,7 +780,8 @@ static long follow_huge_pmd(struct vm_area_struct *vma,
 	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
 	*page_mask = HPAGE_PMD_NR - 1;
 
-	gup_fill_pages(vma, addr, page, 1, pages);
+	if (pages)
+		pages[0] = page;
 
 	return 1;
 }
@@ -1016,6 +1018,14 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	ret = follow_huge_pmd(vma, address, pmd, flags, page_mask, pages);
 	spin_unlock(ptl);
+
+	/*
+	 * The ref is already held, so the page cannot go away: fill the
+	 * array and flush caches without the pmd lock.
+	 */
+	if (ret > 0 && pages)
+		gup_fill_pages(vma, address, pages[0], ret, pages);
+
 	return ret;
 }
 
@@ -1037,6 +1047,12 @@ static long follow_pud_mask(struct vm_area_struct *vma,
 		ptl = pud_lock(mm, pudp);
 		ret = follow_huge_pud(vma, address, pudp, flags, page_mask, pages);
 		spin_unlock(ptl);
+		/*
+		 * The ref is already held, so the page cannot go away: fill
+		 * the array and flush caches without the lock.
+		 */
+		if (ret > 0 && pages)
+			gup_fill_pages(vma, address, pages[0], ret, pages);
 		if (ret)
 			return ret;
 		return no_page_table(vma, flags, address);
-- 
2.53.0-Meta

