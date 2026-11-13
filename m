Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596190;
	b=IwFIWRga5TKGpJzFQQrb3CUn5u6gi30HHQkvaeRj9WztDsiOQfFkT0shZvi44TeHRpM3
	 0wKa1LFKkh4N+j7qxq8dROhGpr1PYK08OnoZxXymcKk+Tk4JMH4wjpvomBt/eP6oh3b/J
	 3fmw5LxgS4NwI1vbD3P8ZcP9w4zILASSFB/55dQQxxNhnCCqfA2jEuhbeGRxOtCIh2k4r
	 Ct0ix0eyvtzX8WYLhkkSyipTsqe3B9Lhl+UOB5XlRPIjSk1qeQhDejF7QTvaFPwonguT0
	 jLYUIwfMfXC1dle1oW6EkQxfH+Xi3BYmUZKfPqvT+8GZ3DtN3k2JFSCLZPY/rNwH5rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=g6Eh7AV/JKMXLoOZYMqKzMkw/bKKMbo74UOatYbLA9E=;
	b=hlQ6CLu8UG693T07Z6qRUh5tJzVz+JxVD2yCEvFWzotBtcMyQtzPfZd91BFESy6598m0
	 lPfEDo73MidzeHVBwrbtSE1PM6uBVlQaot1f4f9bEMrNwFmWzvMjR3UC4uJ5xtZhKorfi
	 zLmF2HaoeWixJe8ADsLDQlAaImndFnuSYEUEVR+E4VX6nGGGZHcIJmAc6H3gpkpCuYYdu
	 lHDteOzRnpuVQ+BX8u22aD60KWIHA9FXIXZ/7+SOfxKrNK/lxZ1341ciDgJL7oCFpxQZi
	 ogeUtb2re0zel/kRuyg/70WjHeA8z5xX8x29ttTBXFEmikeud8QElUzOV7Uj9iH/Rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1kRu6x5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526E6071076
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1kRu6x5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B291F000C5;
	Fri, 13 Nov 2026 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596189;
	bh=g6Eh7AV/JKMXLoOZYMqKzMkw/bKKMbo74UOatYbLA9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I1kRu6x5DS/oaFLvEsjQ8qb2eKA/xxW+Vm0JNZ0pKFc2IH3MVbojchyxDot6deHTO
	 wuUZNe0AbVzdLWbMscW9i+zzuJavWjcTOFdV1NBlCwtK9ACxXdyNhfFFc0ombsa7cy
	 ZMAfs2tc7AHwBoluCxpvhCHylkW7MHBzfIA2E5jiv5kYqj3dMg6+GrinpuGm+0wjaD
	 WllZFJ9QWePC05p7TDGtOmO7yzAoNanzKWoKMczLP7qIwl3tFESKF93VV4YxFPofGL
	 QiqISvU5U8poztYgdptbrlykgjWI3pz2rNBcDhs8rRf0W23jAH/6DtN4/raa9ZXnF8
	 ynQX6qly5SscA==
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
	Barry Song <baohua@kernel.org>
Subject: [PATCH v8 08/16] mm/mglru: lift youngest gen protection for higher priority
Date: Sat, 14 Nov 2026 02:55:33 +0800
Message-Id: <20261113185541.70203-9-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

The forced protection of younger generations contradicts the
goal of minimizing the I/O cost of reclaim. Under high memory
pressure, MGLRU can repeatedly trigger premature OOMs, while
the classic LRU does not.
The problem is that aging may fail to keep up with reclaim.
When this happens, reclaimers may all abort prematurely
because they see only empty generations or just two
generations remaining.
Proactive aging does not solve this problem either. The
number of threads performing proactive aging is limited,
while the number of concurrent reclaimers can be much
larger. This is a fundamental limitation of MGLRU. One
possible solution is to use an aging lock. However, the
aging lock introduces significant jitter under heavy memory
pressure and has been reported to cause noticeable lags
on Android.
Furthermore, the generation-based reclaim model can
conflict with the goal of swappiness, which is to minimize
I/O cost rather than blindly follow folio hotness.
The previous commit allowed reclaimers running at
non-default priorities to reclaim up to `lrugen->max_seq`,
while reclaimers at the default priority could reclaim only
up to `lrugen->min_seq`.
This patch further refines generation protection based on
reclaim priority. At the default priority, reclaimers can
reclaim generations down to `lrugen->max_seq - MIN_NR_GENS`.
As reclaim priority increases, reclaimers are progressively
allowed to reclaim younger generations.
With this graduated protection, premature OOMs are no
longer observed, while swappiness is also respected.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 8a74e01c2390..8e0972db35da 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4772,12 +4772,14 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	VM_WARN_ON_ONCE(!list_empty(list));
 
 	/*
-	 * Respect the gen hotness distribution at low priority to avoid
-	 * aging and scan cost, but prefer to satisfy the reclaimers request
-	 * when under pressure to respect swappiness more and reduce IO cost.
+	 * Respect hotness at default priority, and only reach into the
+	 * newest generation when under severe pressure, so hot folios are
+	 * not evicted as soon as priority is raised.
 	 */
 	if (sc->priority == DEF_PRIORITY)
-		seq = lrugen->min_seq[type];
+		seq = lrugen->max_seq - MIN_NR_GENS;
+	else if (sc->priority > DEF_PRIORITY / 2)
+		seq = lrugen->max_seq - 1;
 	else
 		seq = lrugen->max_seq;
 
-- 
2.39.3 (Apple Git-146)

