Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647843;
	b=J8GKMTlWphenGn2tQ/kjm3sX6kqbmSs/8a4QPopM4d8OqYKUZ2SDiaW2xTgShom5PfkG
	 2Axy0vzQsM/m/Z2cdEaYuS37ZB8my9KZMajrHu63cOH+/qfVmwQMuUfXPtqCm//SFnkV/
	 jUnbjbd6J9zpyZ8tTj+oRknMicfOTN4H8KwtjHeehKS6rmnYE2x12kHb3UWT25xRrqPzS
	 cCQhH36LvQDo461yHZEmGek2ut/2pDkDidqY9HblxwhMup36J1vdeP6GFCuYakUnWjUfG
	 o57mYWqlMVvTOH7mVYitDNwrjozeKrUmiFWY+Dd33L4IOohDcESmPyXRJf7qG3xX1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647843;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GNNApX8IrT5tO5AUvYvK0uTgCkV0Iwt/YzGIuYnFDaE=;
	b=3fJEwV+1cVsKO3jumStmSgmXOOlBM8Bc5yGvtI+YRlDZSWv1Ely59YUKLPmrnc/zZnel
	 hPIUXf2NMRszAuADmniWFu4J5aBH0xPkai/SshUsD62eoLTFhtuGcVs/ROcxck7VBIuXg
	 ZZLWIoyCm5yHJrwTaO6Hlbu8EfYXxOmYeIzKzPp1XAvsWZa3XnlsC5ZJzT0QfUrmU82Rq
	 9GIE4GdAFAvX2Dn5RElDodRrsFuQ180Z37XbVj36gbjo4FT9A9PmZ3VkI5q7zoIZF0W3a
	 3x9M6gUryqz3N6CtfmdEFbm3E5nb5mqepUsyFktBSnT4EesXe99YyPZMf4IrwTIqlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=mz8eAbE6;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5372606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5372606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=mz8eAbE6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=GNNApX8IrT5tO5AUvYvK0uTgCkV0Iwt/YzGIuYnFDaE=; b=mz8eAb
	E6z69j+3hRzeVNju5xno9eDETUBbCUM5G8aSlPOgjGYIZHYsbhpl7wEohhsRHPximhFAzOYV4Ionq
	MZS4x7Yhk4q/fqODNmLvckcvrF10HzH1AwSiPpInrBN1u68v6DopdKKdOBCdKkj7gjEyUIk+VhB3z
	5/zLqFi7GqEuG0nA79EQUJW3j/TBRzhkcWuWIstcYZiUKiDK0ndSxniZqw5p3mTS982b7ATvpzAsg
	5y4uEvaMAZtHOyRqaB7qJE5mbiEHPlUq0WxWmV6imX4QNe8VIljVVA81GrrhR0ANhZG7xB1yGDfnq
	PkVv+TY3jPidhQn12EUY+qsGeXkw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-09WO;
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
Subject: [PATCH 1/8] mm/gup: break out gup_fill_pages() helper
Date: Mon,  2 Nov 2026 14:30:19 -0500
Message-ID: <20261102193026.3860700-2-riel@surriel.com>
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

__get_user_pages() fills pages[] and flushes each page's caches in an
open-coded loop.

Move it into a gup_fill_pages() helper, which the follow_page_mask()
call chain can then use to fill its own pages[] slots.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 7d43ce717b246..cdbe2ed3e6442 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -633,6 +633,23 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+static void gup_fill_pages(struct vm_area_struct *vma, unsigned long address,
+		struct page *page, unsigned long nr, struct page **pages)
+{
+	unsigned long i;
+
+	if (!pages)
+		return;
+
+	for (i = 0; i < nr; i++) {
+		struct page *subpage = page + i;
+
+		pages[i] = subpage;
+		flush_anon_page(vma, subpage, address + i * PAGE_SIZE);
+		flush_dcache_page(subpage);
+	}
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -1461,9 +1478,6 @@ static long __get_user_pages(struct mm_struct *mm,
 			page_increm = nr_pages;
 
 		if (pages) {
-			struct page *subpage;
-			unsigned int j;
-
 			/*
 			 * This must be a large folio (and doesn't need to
 			 * be the whole folio; it can be part of it), do
@@ -1493,12 +1507,7 @@ static long __get_user_pages(struct mm_struct *mm,
 				}
 			}
 
-			for (j = 0; j < page_increm; j++) {
-				subpage = page + j;
-				pages[i + j] = subpage;
-				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
-				flush_dcache_page(subpage);
-			}
+			gup_fill_pages(vma, start, page, page_increm, pages + i);
 		}
 
 		i += page_increm;
-- 
2.53.0-Meta

