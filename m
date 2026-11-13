Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596215;
	b=Xe+FCUkGxGwn5M67izYYumH4bJ180IzF/+Q3+XXr3SXuNwkfeM2S5BQhG/OnOUqdb609
	 buGuNUxeCIOOpPRpY5ccmAEpuK+3uxUUBa28a3mmrJHNG85RHkKMQEpNpkqHgEI4C47pj
	 cSt8pw4PAjudtXPauKOHLOVL2jhGA9LG4fSb9QthBDGO///hS+7fLZcLyeWDqtx4yC+L0
	 66HV1dd+wosnkWP70hNTw4K8Op9siRHynhpWJoGqWw+I1XJMiU9ALzhXOnXzk3szeamJ2
	 +UhFdsCqyyiKVsMihslsPGnq3lYd+AlUz3nIUnRiuuSqmhhY8K8tOilCP92lkWF3u2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596215;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mosG6dXpKs4MiSvsDopZl5qPTYSrZ6sq9UtFKALWaM8=;
	b=P0WLN5zWrgT+1Go+EKrfDYmDlIHqdxTojwBEmbKfjAx/gMSvXIdbeCek+6C7W9ux3rTX
	 GoY6hp/ReyQbERKJHJh/khfogo0rN6378GeRIrwUwsISSCccIjuCTI+B8EouyOumWKB5U
	 f2zVcbs4oua9DVwFczJlqlT4f9YMbtGRYtouwadqRzvFticqQ5EfD92UNps5fggRYa8ho
	 C0dbjqGCpwpNI+atwxf7hm6H+meF3ODuEe5+hIXBM/qObQpUiBBC79WZ2n6IZa12rHtuA
	 bt8TJsdCjOAPV0neUJ6GwYOR2gS7rg45eyA9k7reMnnDAogEWh5mltSb8UN/aFhFVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yfw0uYdH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE39606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yfw0uYdH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AC61F000C8;
	Fri, 13 Nov 2026 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596215;
	bh=mosG6dXpKs4MiSvsDopZl5qPTYSrZ6sq9UtFKALWaM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yfw0uYdHB28H6CZ6a1Qjriabq78wA7ne5Juecy/t5L8jf1M8DmFkK0I0tzYrCgl0r
	 FZ8/NU2UKcvC8wRvEH4Tt4Bna6yVLzBwnM6cK+Rk0twV6YRyYhBBeJmoZUQ2yeHSWQ
	 1wKiw5xDYvscmMfC7RKfzl6IT3v/mLX1a+WUN8B/AZ/F75khkZJYZvmkYw40Qu+3wX
	 MiOzmjsfCP9FSw9lDY5ftO3FJ3MgOyCKXqGu2vqaVjmuUnb5WYOoBqVngODp48k4mD
	 vBuUWOTiep+CuYSPoqwOaiCZLgOpcA4Mv1bybyKLABcVWGagJ7VHe7WZTdcmfUOHNu
	 aXqqj2OEyockw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v8 13/16] mm/mglru: Reduce LRU lock contention by shrinking folio batches in inc_min_seq
Date: Sat, 14 Nov 2026 02:55:38 +0800
Message-Id: <20261113185541.70203-14-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261113185541.70203-1-baohua@kernel.org>
References: <20261113185541.70203-1-baohua@kernel.org>
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

Reduce the number of folios moved from the oldest generation to the
second-oldest generation in each batch. This shortens the time the
lruvec lock is held, allowing concurrent LRU operations to make
progress and significantly reducing LRU lock contention.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6ed47089a330..2595f3fbe1b6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3912,7 +3912,7 @@ static inline void flush_lru_batch(struct list_head *head, struct list_head **ba
 static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 {
 	int zone;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = MIN_LRU_BATCH;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
-- 
2.39.3 (Apple Git-146)

