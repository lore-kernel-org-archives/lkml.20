Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803165;
	b=HvkvSXx40jxmnhd87rDst6sgAI+vf9oaUAOrVoA7U2bC/+p6a+OJ9uuGpzhYh0UaZjYB
	 xKjjhSheG7N2Qi2ZYwxiXaci84aXLYHgd2+PmTRGPMG/Annfk0xaFcn0+EiO6oRswLRVc
	 QKLEIY/nRLFrbXc5l3sSHzpbLlyKwoBSFB7TKc9ghE9Fs5E9CPF3ZywYt52Jm0VVNZUMr
	 6rpYM8CuJeHQg/vLTzBhFugRi+lVRmtGrj3kWkg3p6J8TZCdPUthw2ki5HuIiTBqKU/pA
	 1Q7wX177VDPbZRksxRm25kQpzA+OzMZ7WXFqR+Vj9oWLsENIemk/YgyahWU/FOJDaxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803165;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/LkyRBu/5B33gc+px/Ls1cEcSKMTU4Ac1+7qctKCFxg=;
	b=YY9xEXZqZfySss7nGQYPANQQSc6ALR+adXEq/2gnAdQ2VY7YYV4scEImgTfp+W78SnJ7
	 nw98nkzMixm+CAuBT06R+xd5fZQw0uCKm8mIQ4LEBEhVGeZChwHSPogwHhQ8NUXTr7Eyx
	 dfwCBglhO0mkn+l/KRp2wBei0VVtzHgJZ05C9Z/dYC5F06Uu/LtlrGtEPt5UVwN0JUewa
	 TCchoHiZqmUFWqAEtjqamDz6Va8cdoS3Bhi8s8iuNRxgYVzs++akzue48MyMPZo+5wGz+
	 Y3L8imYBBG4hK5/4+F43fZ4+a9eJDIWDtXozhU7lac+MC1didW1gJOK2GbAeRWTlcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/1x+Z8S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C748606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/1x+Z8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E431F000C4;
	Mon, 16 Nov 2026 04:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794803165;
	bh=/LkyRBu/5B33gc+px/Ls1cEcSKMTU4Ac1+7qctKCFxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P/1x+Z8SBTzvYebmgDsdMGRRD7fx6+3XftHMitJYDWsBlYqWfRxM6cF8I3PnAoj4c
	 nQEnQWNkCipsScimqgjX9baO6PjZqnM4GCGFYkizDvtrUThXVPXVOpayXLqDW4MEI8
	 /7fC142hGrzkcvcuw59vsOkSHj1mMhmrspDmvmD3xIv2LT7JgXq5B2G4TzK+N5nCFA
	 JTQbkgTArK9TRwD14Uc7sIbnBpUT0tv7/jTEBStmjPhoAjURAQV5IzvcHM61R2CGvo
	 KwAq9P8suIO1Yxk/Cfe5C7fSdSOV0U9vM3+N5C6S1OsRYL5CjJWCzh4x+Ow49LwDkI
	 PZ+1ccBQEu20w==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: ryncsn@gmail.com
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
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
	shakeel.butt@linux.dev,
	sidchintamaneni@gmail.com,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn
Subject: Re: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Mon, 16 Nov 2026 12:25:56 +0800
Message-Id: <20261116042556.42111-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
References: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 11:55 PM Kairui Song <ryncsn@gmail.com> wrote:
[...]
>
> A little nit: with the rounding above, I think we don't need youngest
> / old as an array, just an accumulative value seems enough now? But
> feel free to ignore this so we can avoid more update noise in this
> series.

Makes sense to me!

I guess Andrew could help squash the cleanup below into the patch?

From 972664cf8d40449899b54ee3c7abe6d1a9f72271 Mon Sep 17 00:00:00 2001
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
Date: Mon, 16 Nov 2026 11:48:44 +0800
Subject: [PATCH] 
 cleanup-mm-mglru-Run-aging-when-pages-are-rare-outside-the-youngest-gen

As suggested by Kairui[1], we don't need youngest and old as
array. just an accumulative value should be enough.

No functional change.

[1] https://lore.kernel.org/linux-mm/CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com/

Suggested-by: Kairui Song <ryncsn@gmail.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7acc9acad985..b97dc3103b25 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5086,8 +5086,8 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 		int swappiness)
 {
-	unsigned long youngest[ANON_AND_FILE] = {0}, old[ANON_AND_FILE] = {0};
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	unsigned long youngest = 0, old = 0;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 	int type;
@@ -5107,14 +5107,13 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
+		youngest += lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
+			old += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
-	return youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
-	       (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS;
+	return youngest > old * MAX_NR_GENS;
 }
 
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
-- 
2.39.3 (Apple Git-146)

> > +       return youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
> > +              (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS;

>
> Reviewed-by: Kairui Song <kasong@tencent.com>

Thanks!
