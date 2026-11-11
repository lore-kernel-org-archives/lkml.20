Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439639;
	b=vAEFFNOf8WolMnZjXm3Zfiv+kfO1pfl01AnFCxASKv/KGmF2mrlvS0IQwra73E65B40R
	 ExEnf1BKejaFKXbysMSeT6kpkOBKjXvgpXptq1crUThiQFK1HsvhQhJgR7WQxGfNWIUDP
	 THt/bZRH56pESaJAZNMDzRa1V/yos46tKxeyONNYTMWOBNMZ3VAmb4OYrOdExbmhQLjak
	 hPdbpC/FXHUJQHOA/yf5n3mHml5qyvbcwswA1aYk7nGzMWrD22wVBgRK52gtfAst4nPet
	 GUxGePm4vpD8XOXYATUE/RrVMHkPnJWqn+i/YOHmqR+R9At1mJpXOa9Ytx/0YQotApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439639;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Sz+akw3wpRLgZUlPI2FoNb4TEGhdSTFiLZleLq7ib24=;
	b=NQUUfQjIJZvMgh8HcXGDT3pCk9ImRtcs2janwOOiKc7xyWy5uku7zzCEvfR/eYqKgHtr
	 ES/uLWeLd1Gov59rriYdQBg0jhfDTsQZ/SgswMrIfiX3d/IHLS7q2jv9fiwR3YXrgchB4
	 jimxENKQMNprnehIqSlakjkxZPlV1Xq92viEGuQDP6YQjYIMuoIQMEK5PdvtFwzrDWY2q
	 5mua25LdIz5BlBeLZlRUOsM6rjJXx3zyAdFzYEtYuw71y3lei0VO/50YUUFgTmRqaxZvc
	 ++gSkKgvEAYPr4IjE6mymXdqlvTPaiT2qSznfo/RsQHne1UCmf1mv3A1sM3tGBziIOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrJBR+If;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D3560A2625
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrJBR+If
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C6C1F00A09;
	Wed, 11 Nov 2026 23:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439638;
	bh=Sz+akw3wpRLgZUlPI2FoNb4TEGhdSTFiLZleLq7ib24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CrJBR+IfaqoyJNKdiShU+ukvgr5AzAPtScOFfDV3LMtgKdH/z91frdPGeNlFOl9CU
	 W1tVXZv9mF8cyKGslV4MuftKxocEVdH6+HpLBhqimecDB5SESeUJ/Eu3FqPYVZlOS/
	 ubrgq+nH9EtIPP5BDkwMvtwWQk9pq2iukmv5Ndd+x2YddhaIJdqNA06uZvkkJHxqtS
	 gBYvdO+kFNGBgujvuacy7FIYZyeExvxaRJgMoTVXxlgf66+3IuA7OqgqMwDPmJ8444
	 fG3xW3uewZ8dBA4IYizJr/3VBTho09J3y24rUh4q+7hG6KlQXI4WfZKNLjWe6ifJRn
	 4w2Aez6EAP7lQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
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
	linux-mm@kvack.org,
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
Subject: [PATCH v7 13/16] mm/mglru: Reduce LRU lock contention by shrinking folio batches in inc_min_seq
Date: Thu, 12 Nov 2026 07:26:00 +0800
Message-Id: <20261111232603.9934-14-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111232603.9934-1-baohua@kernel.org>
References: <20261111232603.9934-1-baohua@kernel.org>
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
index 7a48b82ea4c1..6315edf50376 100644
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

