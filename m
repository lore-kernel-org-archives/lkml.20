Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342097;
	b=RgjF9k0U5tonoTnkWzGGZGXTVuygdvxv/S0TR+uCc53uQEs0QCV/fnoYoVnSBwv1OwMK
	 HwKDp5hP+igAvZyaz97gEGjJcI9d0xO29CKZ11sgl/CbtWG+nMGGfN9PBH+MhFhvN25se
	 ssUBzYGP+qugNh2HwCCBjjzVl2dsAo7Jk9dFymevukd6ZIiq9eNprvOIi2fguw4m/5VES
	 J3r3bHfySB7jX8zALxPVQF2rsN/itRUU8jex6+2tYwFVy4sRSxrs4Ul1s8HAH0GA6XRuh
	 izxGaYeiOuChDkXGMBToL5BtAvecCdU+I5VQtS2dN5p+8aLsr0C5OwS8g6eBZPK3/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342097;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vpSsC6eHA17zXSkm9xogF1qAqxxkKO+eDjMPRSKEUa8=;
	b=pdyI1A2NFaqkG6DpC7B10AhbdLn7a3wXoq03nwLbtopEdUIFTieXO2Ij2m4mlHYYDqw2
	 wmMwX2SzTqf6IctP/FuwK6QnueKi7iQZQxQBpqQZQx3qdKcKrbZ01NStOTBP3ZxH5GxM0
	 UomppdY/a9QTY5dDjKAhOv8OJfu9PzNfTBtyoXRSbr7Qi6zvPJsEXI/mnPSa0TFmrogXf
	 aPQF7rmGldVmlycwRW5mpXFL+jTSgpGDc8CrZPSZbyN6NWxIxyewx88r07ayOs1+Fyv6A
	 7bmJ2J9JreRDKB31Jov7NfhUWzuFla1va+Jvvm4F2kG2TNHtAmWXQKNytE6F16OSbPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1olGJcW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D07B60A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1olGJcW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740101F008A1;
	Tue, 10 Nov 2026 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342097;
	bh=vpSsC6eHA17zXSkm9xogF1qAqxxkKO+eDjMPRSKEUa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W1olGJcWb+1DuQiRIqlvQtmiFzXY8mMkYsK+/jgjpcG8q6M+7TH8tH6eOsb8r5reg
	 rZY80I2i3xENqep5AjQtcGiUB8SkMAR6xTvZRI1clyWM8QnkXCKe2v1AUuWLdWhrCK
	 hUhymLkVLquKL1tTW11hEim8Rgeh/AmAxSzMjGMv+2IjO9Lx6AVXMljKCxqr8Qh97D
	 ujXZsfzWsQ8oD8270gCI5aWFfXLKMy8OSsr5cPUv41l5eN50RKaLNK4oWlOPMnVTpa
	 yixl7sdn5p50BC/bgEnyp0OMwD2v/fNk2B2YSX38yfcAAIJ1uugSnCdPfgpE//uvOO
	 nk8QH7W6wyEZQ==
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
Subject: [PATCH v6 12/15] mm/mglru: Reduce LRU lock contention by shrinking folio batches in inc_min_seq
Date: Wed, 11 Nov 2026 04:20:22 +0800
Message-Id: <20261110202025.25736-13-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261110202025.25736-1-baohua@kernel.org>
References: <20261110202025.25736-1-baohua@kernel.org>
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
index bfc9789a999a..34faabe617ae 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3911,7 +3911,7 @@ static inline void flush_lru_batch(struct list_head *head, struct list_head **ba
 static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 {
 	int zone;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = MIN_LRU_BATCH;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
-- 
2.34.1

