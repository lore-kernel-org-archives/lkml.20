Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481990;
	b=5A9KUzHtMhdTJu4lLhw/iynPA4KJGmCVfj7ZEOPMBq6rbgNHp83EPsdq0f1ntN3W+emq
	 t8/UqZa5TrzQGVHPpBPIJot/H+/3rSVBpCR9USXTJksI8Js6bQ0k5SPmk0Ou/HTxo3Bek
	 qbly2d3QOnFX+9+9g+RbjAoDwA625vGNrhI8qPHPp/BpDNgEgV8TwmjYhDlPPsO4KJOYp
	 uTVL6dRQ1pvBI3hXNDPzNVJ4eAf78WUueSWpZXx7n8kmIIbucBHaWpHEb/00TrybgqiJp
	 2f9GqkpvVqKNt8gwjaGw+bWE8Zx9N1kZ7mv3A0Zd119hroLA56WCoYHd2JSE/N95v3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481990;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O1ylWmglCLFhGDN08Z3QqHQULQGJeVg5Vw4Vd/T+a9I=;
	b=u4eyuA2FSe6Dy1moKfKxvH7MXVOGG4O3yYbT+xP0HJ9IsWMxpwPhvsM1eF23aVxtIjXS
	 PcYD4EwyWGpT6iwqFW2NffICM4ZRYaGZjAXBagROu9DNBfEaQF6majwUsHl+cG1BX7ZpY
	 B/nGHRiHG4un5O66OcjtjnGBBbbSBtwvSQWZzYMnD3kesJkSMXEZwgQQJ1vb9y3BwxPFy
	 hzdVvdUHdThGHxJ0tpkATXQs6oLuSVBVg+zggnYGjt1XR6Guguao6QRi9wlqKgo4ZwIvG
	 YGQZTtwTidVqvJQwh4d7as1qj6hywW9f/LFt/UvOr+cSwlR0mtwApykywlL2ZRDjExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FM7nupIb;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FM7nupIb
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794481980; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=O1ylWmglCLFhGDN08Z3QqHQULQGJeVg5Vw4Vd/T+a9I=;
	b=FM7nupIbxP4U6L7OXvL1srusoEdjIc6zCJBefwyQtZMYCShBW1UWdF/kb+eUTWjF0CbCHQnUEOxKm0mcftHxxV1zkoqInlPJ+zrzxuntMejRcXFuzq+y0c/BIBWeSEI0pR9o3Piyd94Z5IM6FfSrwXqCzuRPhHl8h1k68xZQTCg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEblyLP_1794481979;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEblyLP_1794481979 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 19:12:59 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com
Cc: baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: mglru: use pte_table_clamped_end() helper to calculate the end
Date: Thu, 12 Nov 2026 19:12:39 +0800
Message-ID: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
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

Use pte_table_clamped_end() to clamp the range to the PTE table and VMA
boundaries when batch-checking young flags, making the code more readable.

No functional changes intended.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Based on mm/core.git for-next branch.

Note that this was found while reviewing David's series:
https://lore.kernel.org/all/c31cc8a0-c098-4784-a843-f13f51914094@linux.alibaba.com/
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5495d9be90e8..804d4188e7b4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4470,7 +4470,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
 	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
 
 	start = max(addr & PMD_MASK, vma->vm_start);
-	end = min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
+	end = pte_table_clamped_end(addr, vma->vm_end);
 
 	if (end - start == PAGE_SIZE)
 		return true;
-- 
2.47.3

