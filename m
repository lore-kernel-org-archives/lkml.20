Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439613;
	b=VHww3b6IxuO6Qf9BqaLtQaFZgxPybUS8go+vm0sp95zXDfBfsjtXf1ACdRvce+sM5w65
	 kU2QiGMFwFwg25k2av3KzMn/p11Tw0OBBm9nH4tGHfJBL+sR4xwJT7nWsJqKJTrSfgR9n
	 OkNoEjN649qo3s3veKSJv43zHylrKcjatSuT4gDGOqMMch88K6uRw8l4PeVWYBq67tpsL
	 n1RtPFRmpb4YK+GHxXcv9KVRO4+j0ZaLVlUNc/WkFcX0dWiwKSp9Ylz/n2rAxrxRp3LJU
	 eem9f+5HThojKJkmQDz62E3b9faFbLVw7AT4NAYdVvK8jVcXlViiwfMYsr0kRKvTB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439613;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Yga9lSt0N2iYoO/IWogbhsbus+a8FaK6RxnbOTa6a14=;
	b=GRcEsMe/4qcxy9vwyBVkdIi5QFJ/ROWdNpSH10/Rw+JoGEKeALM/wbnRWb2OxKUEX9dv
	 bse7QvvxWDJUNaOzmT8LSbIZM1bXwN0Feg8I5p/d2QmlOqN6Hxsd92Up+K8aRBp4/Xn9A
	 2uvMbafEHBosPZUC2EgFUS6u4XIQn8uX3byE4EW0NHHFrb4K+Noy5oXqCtkDDU2cZaNSa
	 +tbPuFDEbWlGs3Jk67A3Tc0btXyumK6mRnBRtRq40y6nGACY2vrRZcbqO7T5tjCEl+z95
	 PMr/pgrtPLz1hjUTK+JjdPJDZoUJXX9x5nv0TYJaAb0BlukMzxA4xsVvAwbZa0OcpDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2DbxFm8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE40606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2DbxFm8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBE71F00A09;
	Wed, 11 Nov 2026 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439613;
	bh=Yga9lSt0N2iYoO/IWogbhsbus+a8FaK6RxnbOTa6a14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T2DbxFm8B/38ftFE4KHgA1cFkAKwzxgym8BqNSIQ2M4ZXR7b764u55gABF8o8ZkiW
	 T1gRnA4sFmp447XAzRTPW+vPJq6JGgkA32DHVRKzftK4n1ZjK8YoWvEFVMbCUF6pcn
	 GU3BUMJ/izTQ/O6d/JJtt30qeSlbvjaw91U1DoszdK3VGrkeB5T3MRKPF47wMmxVsk
	 aSH3bpesiEjjqTaLCwqTLsv5db0SRLgnlXrA1Ytd9zbWAJV/DjlE83YVotthQqmdGQ
	 B+FA1O2T2u6D85nzMCzVtehdkBt3EcaTkRBB7CaBZAfBpKkpIQNLg7ANrK0Zo2Dupz
	 5d+5fN/M0l0Og==
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
	Barry Song <baohua@kernel.org>
Subject: [PATCH v7 08/16] mm/mglru: lift youngest gen protection for higher priority
Date: Thu, 12 Nov 2026 07:25:55 +0800
Message-Id: <20261111232603.9934-9-baohua@kernel.org>
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
reclaim generations down to `lrugen->min_seq - MIN_NR_GENS`.
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
index 88567002b7ef..fff7ee17eb0d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4767,12 +4767,14 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
2.34.1

