Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23C3093CF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392246; cv=none; b=dP2zFSu4gZX9yNRxkQAfn0hf5IrNQUQKZqht8xk+Kdj+0nSlO38XE2KFF9qffhR5KjTZFnrgQVDc5kVb7LOKcHLjrvS1jAiS2eWx+j7Ll1zys6wEJv8VHAwCm5bamTu3hbrQnoKe5cAtqa7tWF9Kuekaz0fej0jJkrHdc3wZW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392246; c=relaxed/simple;
	bh=G0Du4BFPQbVTw82fdXa3WVWJk3Z63x/Ilv5OfimAoA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A60/ZneHJN/5aFC8733eGUvElrt3478yUq8Sq9VvvxSQYVkvWE4K96+HN2ZE1zFQ7asIUNR+RkI19PKcLtwUgIQc7teK1ARZaKQ3WvRY4NRXBIzmZgWozu3ib7YcOIHwysDah4NvRQOenY8iLNvDKaQQ19vzVShiGkH2T/STCAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqpbaRuM; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqpbaRuM"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1333521a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392244; x=1789997044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgRiOcxuYT/a5YlmbXURlfn299Pxo8srZQixNKFp+fc=;
        b=GqpbaRuMzhOWylvAk5M//2j2VhuovW+L7upwUua5pQZmFEf+NpB/MglGT78sPf9PEn
         0IuNmdAPMmXXhBXA74vWEpFhepT+fGg1so7EkTLmeiQqvWkEMMps1cctzQmL/sCYu/XM
         odBkZt7fk+RT1O9OeDIbV7tuQxYrM5/LBsL3PJBvRiYF8OUYItJreKcfcGMxhsEmY7cv
         +2I2l5DIC6X292bqfQUywLHQC6tZN1stRj1FPxfbKmr9W/Wey1IZTmRUMXZg7d1SDcss
         meN7EEHU+yskuAJN6H6U9UajzpLj5SQ0zBM/4lOW3nwROOOLrVvNpO2EcKwZzkbMhe5C
         JZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392244; x=1789997044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgRiOcxuYT/a5YlmbXURlfn299Pxo8srZQixNKFp+fc=;
        b=MxVs4rXg/D4plvhfjV9vZRJu3KsU6Qn2KAwUXtOObWlSyLPzlp4jZuQuCG1audX0LJ
         h3qT05rfsn9vuDxWBHZa56+5xXhgflOhL7bn3xjCHh2whI2DCDjqU2PR7GIE8j7PuvE2
         vwW/Lsr2OUP9iqoTooZuiOioETfPLFpRvHUrAUSQ/t/aioBQ2bfi7HT47cWao05VBaPU
         1jZxv5Yn53uyxWlOzxGaz15uHW0IaJnbiQCRZh3ve+fidnl8iIgdxqRdv1t8GOiLt4sp
         vILeMf+FSUGLjPZK1UCwHnRj53wuqheLYs/i0c6xJgzS/aryC9ivnU8pNn6ai3tVATf2
         OIJA==
X-Forwarded-Encrypted: i=1; AKwUvBxawmH1zE9EBvl8Oe3HWu97+tUL+bETha4YrF/RPvmopbBHt8549/iOWf8tdMsVumYmAgbiq3R1ZB1QbR8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyA+eraCyTuRZkRr5w2vWDqsHeVFa4zkh6cMWEAS0nSm/CsL9Y
	64qowCcPNVv6/leLkH6u0Jhm7G7VEzrWBZa96r6DUVrNYUH9s+2aWzC/
X-Gm-Gg: AYBFou2qZOXafxRuv+OJsjwSAv/iH7ObNFrRZl7P46V/AoNOPafddMDJl86bxYWNTRa
	lBSaJpbYOUONAqxccdhgnRXtbK6NGiA2FLd4lE+t1QJZcgX5MgaGATyr3oGRMHDFYg0McQrZtgy
	Uy4BZaQ7OwBEk4HIhpX37XJp8jRdPrgyq4lUycSAPiZPkHIzviCm0UTsZE274iE8OnWbzdZpTX4
	0G6owhQVF0eEy4WTZX4Vvc/o+bJ0ib+BcAgqOyaGe6aId/+t38CklQVr/gfo/wHp8fm49VOmupj
	orRtuLxA0O2xHfXhwOs6CEhRZcAcSIkYbwdNoyCHK6qnxm/7+M8etdLMoXzyApuaLcZjxpEBl8Y
	pu6BRC84dtMlEUNftxN8GuA8hDZMmaYTvMYA2xVEjJliXO1AWWYvV4blZNMWu6NZtQeKDQcdsxc
	WD8x4TgrMq0SD4p/5FZFPS2T3X/l+88SHkxE9PM7y1jUAHYI8yZa7Uo8ZoOO/pTxnaWmaY3X09G
	cdD56muAYDE7Q==
X-Received: by 2002:a05:6a20:7d9d:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3db40452773mr4994899637.10.1789392243791;
        Mon, 14 Sep 2026 06:24:03 -0700 (PDT)
Received: from arang.localdomain ([14.47.12.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6596265sm4938853a12.27.2026.09.14.06.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:24:03 -0700 (PDT)
From: Jaewook You <jaewook376@gmail.com>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johan Hovold <johan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm/hugetlb: preserve mremap address delta when skipping page tables
Date: Mon, 14 Sep 2026 22:23:52 +0900
Message-ID: <20260914132352.472-1-jaewook376@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911182408.75821-1-jaewook376@gmail.com>
References: <20260911182408.75821-1-jaewook376@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_hugetlb_page_tables() optimizes mremap() by advancing to the last
entry in the page table when the source page table does not exist, either
initially or after unsharing a PMD table.  The common loop increment then
steps to the first entry in the next page table.

However, the code advances both the source and destination addresses to
the last entries in their respective page tables, which is wrong.  The
destination address must be advanced only by the same amount as the source
address.

If the source and destination offsets within their page tables differ, the
destination address can be advanced too far, causing follow-up issues.  Fix
this by advancing the destination address by the source advance distance.

With a reproducer, we were able to trigger a kernel panic on x86-64.  With
this fix in place, we can no longer reproduce the issue.

Fixes: e95a9851787b ("hugetlb: skip to end of PT page mapping when pte not present")
Fixes: 4ddb4d91b82f ("hugetlb: do not update address in huge_pmd_unshare")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jaewook You <jaewook376@gmail.com>
---
Changes in v3:
- Clarify that the optimization advances to the last entry in the current
  page table before the common loop increment steps to the next entry.
- Rename remaining_size to offset_to_last_entry as suggested by David.

v2: https://lore.kernel.org/20260911182408.75821-1-jaewook376@gmail.com/

 mm/hugetlb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6c..5749f6270fb1f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5161,18 +5161,21 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	hugetlb_vma_lock_write(vma);
 	i_mmap_lock_write(mapping);
 	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
+		const unsigned long offset_to_last_entry =
+			(old_addr | last_addr_mask) - old_addr;
+
 		src_pte = hugetlb_walk(vma, old_addr, sz);
 		if (!src_pte) {
-			old_addr |= last_addr_mask;
-			new_addr |= last_addr_mask;
+			old_addr += offset_to_last_entry;
+			new_addr += offset_to_last_entry;
 			continue;
 		}
 		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
 			continue;
 
 		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
-			old_addr |= last_addr_mask;
-			new_addr |= last_addr_mask;
+			old_addr += offset_to_last_entry;
+			new_addr += offset_to_last_entry;
 			continue;
 		}
 

base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
-- 
2.43.0

