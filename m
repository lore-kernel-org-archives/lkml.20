Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686960;
	b=3VWtWWWKaOeF8LOMJc7VlVyPeJ3EOwJyxr74unGrIf/ncMZEixtsEAC+vICURKei4y+z
	 InWR5Do+5OErTeDPNWnouH+HpuFXOlWBTpba7yJZa2H0ieiZqU9HupPFCd9ZBukfiXyn4
	 mUzwgfz9FbCzSgYdT0ZL81t/inFRFKwVcbAAXn7hwmWQdODg1ez9rkPYVe81Z244fFv6z
	 FY8unTrROhXDg3+1ZBCMdQTOfXsh6bUBkas7KiwmaGxxMh3GEHa0hVE3IsdqG0FprP6SO
	 E06J1FUA6WFrsQmKEPb9RR324wL/bXZGeNnlHBOE8AIvRnW1pVsOCQTpUfDhcrS8zew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686960;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ve/Ocmsy8HuxP+6kQzWQhSszhJgvBNDX8jcaj0nMCc4=;
	b=UYsJ63Cow3jYBxyW8tSLr8PhA9LkNuzo4zca3PuPEL9veImW1FGdBHEz7523hFo6Y4KR
	 ErJOk00f41ColkURA5a1Jg3JtgCPe5CnvJPG8D5R/opO9SIZI3YULXoCq3o1xMXKKCLUN
	 0NVewW02fPlt5ZS/2Z/Y3bjWKifGHU+VvagY6P+9e2znBt3q7mlfpDKybWOmSC8IRM4XQ
	 qH3zX10tlg1KpOkPwRg00R1hvY00iDsR6y0BOMUg6OVjj0vzJTe0qCFDAv6OQMHZEV0hP
	 Pq/kUElCNOcOv6ncRATxZez8UZ4Dp3Rf67jvlJxXT0hkYh6/JQsnuOCKNrJg7n1jeIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifNf0Ij9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683D606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifNf0Ij9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9701C1F000C8;
	Sat, 14 Nov 2026 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686960;
	bh=Ve/Ocmsy8HuxP+6kQzWQhSszhJgvBNDX8jcaj0nMCc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifNf0Ij9G0rdZ+eBepTpikC57OTdhoCg+3Pusbrg+dSA9yQXwPrto3i4ecV1bGtcd
	 ajqaOLFVukYhSlWLHmzOHNPwhdBjw+jx6I/yDQnHKXPt4hiJaZ3HRSLa99o/8wXup0
	 VdwuDDS0ZBz/nsLBID9XO5xAAcP/ZSzJ0giNFI10+1IgMdHLhVBk6gEhGKB9dkWlc5
	 XX+6jSPQirXonGLOrtej8ej8oYlksxj2E8DOei3UMD/DG2quZcTjzD1AaHLMYiB0nW
	 UWTdu9YJ7XLwB7phFNla16cFRGoHl415ZFQk4WZqsTFTelj2SrgAVR7z6Tou72m1mx
	 uxiPvm1EfljPA==
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
Subject: [PATCH v9 13/16] mm/mglru: Reduce LRU lock contention by shrinking folio batches in inc_min_seq
Date: Sun, 15 Nov 2026 04:08:00 +0800
Message-Id: <20261114200803.23129-14-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
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
index c9e22a5cbb51..6cb905162cba 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3914,7 +3914,7 @@ static inline void flush_lru_batch(struct list_head *head, struct list_head **ba
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

