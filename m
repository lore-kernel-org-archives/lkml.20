Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706591;
	b=qcrUCcUbDydYzzW4tJyS1bAxr+wTkGR7YH6Ffnmmp1Me2P1xgJmZv0/z9ZfzaPLa7q4v
	 uNemu+Ct7gpe61ojz2vYeUeV2NLIEsiuX15582twjf6G1nyk1JZER+HoEmks7vNzZR2Rw
	 j6MpgiCfOSnAR2oo4tIBfTnfiCKmV6kcworfi+g6r9QanfuqzHxPuewpdff0NN5Kx1Jht
	 EAdRGSLLc2veM8a0YwX0EJOCVetqTRPM+ZSEmqtzwTEi20YmMcCS7IUzxk0RAIqRg5cGw
	 13VZDXGkB9cQqlYCYnNMZ7phGaCSe+OfPS8gs7CRTWW9CWdaJPvdydeavakQnliou8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706591;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6rnjSAKXETk7IX9Iz0xmxItZgkiiI1JWLFVu97pY++w=;
	b=tlEmPwCsMDaNfZypAyh2i5alFqYlIWeKc52dBWqNhtLh44l0sm7k6GH7u1zh+vhNOqcL
	 0r+EfOpXGe9IaZvF3VV6xlXYtuSMH9nHhiKZHvm0mhq7u4IFvM9BFfdf/V/bQavFf68vs
	 iL42PVnORcIxkgq+zqk5NVoNLQeJW0cvx4iLShuWeH7EKGScqKgmjv/PTs7ceVWy3m2/g
	 q9KrUtram1HXlnepOnbAWdacZ5e07Ziry2MbUxwdUTIVuljALj3dqgOpptPkXSnXE3JBp
	 SzpznhBjjGrOetaIrNTVyBXbu7ZnjwHFqwkiK+9IttCr9mmEjA625KZc0b64sbMLsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j2p2p/pm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BA606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2p2p/pm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC181F01829;
	Thu, 22 Oct 2026 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706590;
	bh=6rnjSAKXETk7IX9Iz0xmxItZgkiiI1JWLFVu97pY++w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j2p2p/pmAqoVZ9r4zJMNX8O3DdOIzV9h7PhopbCDJwq1qoaD4iCS+CfXSKD3vtVTj
	 JceEjLIXTrqQwfGz7D6OV2HQLza5sBt/admhX8WvGgvwRKU5sfwq0TXG/vAr/IDt4W
	 WOwwwb6vKeOL2lM3wnKJOsJg3NKKVA9a8g1n1nhlrcufg/HWcggaQYwJBbVOPimOXT
	 YmwqVVcfqhYAYqFEFRHuQboNPPy+//tTTii//TlKPYnsD6aUlQ6wRqF0b/CmIa2Xc/
	 NlyVIsNLZK/5GrFzcaKzJpGLhPnd88AjqbVdrW81DqoaV+NlP9juzpINfC0V2z2U/Z
	 c7y/W0QErFFQA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 11/14] mm/mglru: Reduce LRU lock contention by shrinking folio batches in inc_min_seq
Date: Fri, 23 Oct 2026 06:02:00 +0800
Message-Id: <20261022220203.91911-12-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
References: <20261022220203.91911-1-baohua@kernel.org>
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
index e8eeeeb76282..555359cc0368 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4051,7 +4051,7 @@ static inline void flush_lru_batch(struct list_head *head, struct list_head **ba
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

