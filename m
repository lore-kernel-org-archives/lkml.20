Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B34CDDC5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846834; cv=none; b=m19wk1QlrqXcBxxb1Q64h3DvneRGwWuWQJx6hByP6K/F4QXffuDMlBaXe8RTJJsTWDHJdBzz1uCVZ52jqiJx+lhYWtcY9N9qVCa8CBoQEqCaOtUY+Bn2NRJXcoCYgiB54aD315eW/SuR5rAvZc/k1mTU5O6Ce16hgXKbIjRedA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846834; c=relaxed/simple;
	bh=WFLgXtMlI9Urs6/emSt8fVdotgeH/7tztd/CHHVBZE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msocGEDf5feZQNnlT5IsL91eTV+tjl/iLNbpl5Dy9MZWQe1pgT9vRIR0nwWjf7NhjFTVzjSdJDG0eNpCCAF0FwpLdtBm8miLF1qR2kalhxAXYIRv/YjJ7mqa9bExgv4nn1gxJx3S4m4jkKiaUxCjrz+IJV/JQ/F5G30zT23aUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id ABD445837F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:57:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BD693EC12;
	Thu,  1 Oct 2026 08:57:32 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Christoph Hellwig <hch@lst.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] mm/swap: submit the last readahead batch before unplugging
Date: Thu,  1 Oct 2026 10:57:12 +0200
Message-ID: <20261001085730.2029773-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-Score: -100
X-GND-Cause: dmFkZTF1ZYRqrGBHftE47xIW2kWpWI6gPPZrBB0Fm2rHvUXkYYWGSu9bNQ4d4HVyhDy/NIybAnjmiF6pBYixger2QutfBbU4qbhWgGqzRtaP73q9SQvz845UU72nXpi2UucOwghImYR8IYwaxIE5XH8XU/uXkuVbcQdBHyRcTjmdcGMygMcxvXMBtUX/Cg1pSgZ/wdXfFSVnOvGAji3SOIoQ1ozVEoAUSRjGrg+FkZhEQmBDIdu86mBkTKSZMz/5l2OLju48pks3Mzo4LlIalkOe+F+/vvhT9lN7Jk6nolKAiNDPrC7oiqNr1sfRzpu1z8vMb1S3hwqE22s5+3cMlgLwn/ZgQNRdDN6XnTTIkeVd2IBSOhGN9XEwPa5zd16NTnqn/F4vQfm2E4s1hI0HbcT/OgNGCgEEu4DekqyUUC+afl/R5E5zSJ+hzpg5PZYOjYcAskn7JGUYT/ADplASg1NaL08u36yxzNaaspa6sGziiFeYiEoEVte4zhuCjbspW8zF6t8ndEc91NrxJblqFzHiHTthf8wCtraXcn4Ixws7xfMqu1OIhDUsGRdoFB7tUOLfRgB+BwXg2WZEH9D1YeTMReQNYmhFIdRQQhSquGcuL97ZKtNQQ7IgZhO3/XJEm4yGF8NSn6sTxXNPt7xHZLX+MBPbVpt4K5rxTGudeYQYRAfNdA
X-GND-State: clean

Since block swap I/O is batched in struct swap_iocb, swap_add_folio()
only appends a folio to the pending batch when its slot directly follows
the previous one, and submits the pending batch otherwise. Batches
submitted inside the readahead loop go through the plug, where the block
layer can still merge them, but the final batch is submitted after
blk_finish_plug() and always becomes a separate request.

So submit the final batch before finishing the plug.

Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 mm/swap_state.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index 2475ba29126d..ebef568cd62e 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -906,8 +906,8 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 			continue;
 		folio_put(folio);
 	}
-	blk_finish_plug(&plug);
 	swap_read_submit(&ctx);
+	blk_finish_plug(&plug);
 skip:
 	return swap_cache_read_folio_sync(entry, gfp_mask, mpol, ilx);
 }
@@ -1019,8 +1019,8 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 	}
 	if (pte)
 		pte_unmap(pte);
-	blk_finish_plug(&plug);
 	swap_read_submit(&ctx);
+	blk_finish_plug(&plug);
 skip:
 	/* The folio was likely read above, so no need for plugging here */
 	return swap_cache_read_folio_sync(targ_entry, gfp_mask, mpol, targ_ilx);
-- 
2.53.0-Meta

