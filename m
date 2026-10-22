Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706575;
	b=OSiAFNLL4xtIRZiALgxrxcaLbahWKsbxVp/dO2wFNXJHsM0QGeh9QKe/M5xGWbFRWmf2
	 ibXZM7HM8vrQhM1C/oQ4iC8UXgcbwtK8yGaejx4fV9G1Wt14TF2PyQt2DzCpO6HabpT81
	 chTEvKruMXcqgrwlLAWELfEO+5SnXFV4YqmgpgeCPvGnm5XA8PSFMvHuOGYFWwZ2T7L+n
	 G0TP2ciB7GSltFDhU7moMmaYlDkUZg+S0hleya6K1Wf4Uc2lQVmtzTVwKeUOhwp7KJYE+
	 a4uEg+HvG7WATMC1OStUEqblnMkZ/vsUppMd8o/CNrvWrNvke2/ujxRgdpoFV6iqx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706575;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Xtd1xmqUkU6Igt+6PgHWcxy4mu3ymMXyv97LOgthK8w=;
	b=oKL68snLS6Bu1ul2bxfIBbv8vgz0jdeYFTXLhFgN7i91WZoeg/JxDqc18Cu3MspgDsmu
	 g/vbUziwnSgDiJ3pBhY+yf7ClW6d3GioNEWvRi/m30BiHa9Kuf8JK6hby58zQXqQEFeBZ
	 wxtQURFDYsIgIysOJWY4udr+QwD6m6AB6wd0JlLyUbUsVPyNniNg4HRR+mWTxdfKqApG0
	 QWf9ko81j6d98cGhtN5POJngs1EomMCCbSR2SdnEt1IHkEo9yKN/enNyhA5SjeVlYDVp4
	 tr8YiDgqv7c06CUWvbJdEkHukJWYWYQ7ZgtcqVVftGMgFI4jRe+bywMWz1w76I23j+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AV7bX8G8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19566606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AV7bX8G8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E071F01828;
	Thu, 22 Oct 2026 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706574;
	bh=Xtd1xmqUkU6Igt+6PgHWcxy4mu3ymMXyv97LOgthK8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AV7bX8G8qO+jPFJMCJchpU5Oxq6KakoU5XMJmOIykVfOWwcLLi0QMTeaYuHmBbCfJ
	 28RmdlIdWlJstd8VwovBPzlODL5xzctWu2Z1WRtB9BIFLUCQLvd0wN2ufTIB6Arffc
	 CQeEoi4tttYpx8E0H0h7nHppoBtl2cUW66ffz1f5OqR3eoabvlzt1x6duhwaJc+Df7
	 g9gY9heqnLREMii6/LLfM6xT75pYLYhcUK+hDSk2kblYOTtFFC/y8tGnuJ5FooVC4q
	 MOmmcE9iEkNcMRVDA0whmeFHNTdX4/VBQp6s/UPaefwadSV8aIokbObs4dWYPZO987
	 00HiS1ZDVOv3w==
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
Subject: [RFC PATCH v5 08/14] mm/mglru: lift youngest gen protection for higher priority
Date: Fri, 23 Oct 2026 06:01:57 +0800
Message-Id: <20261022220203.91911-9-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

The forced protection of younger gens is in contradict of the goal of
minimizing the IO cost for reclaim. And under high pressure, MGLRU runs
into premature OOM constantly, where classical LRU never goes OOM.

The problem is when aging can't catch up with reclaimer, reclaimers will
all abort early seeing there is only empty gens, or only two gens left.
Proactive aging won't help eigher because there will be limited threads
doing aging, but there could be unlimited threads doing reclaim, which
is a fundommental limitation of MGLRU. One way to avoid this is to use a
aging lock, like in commit .... However, aging lock caused several
jitter when under huge pressure, and was reported to be causing
obserable lags already on Android.

What's more, the gen model somehow contradicts with the goal of
swappiness, which aim to reduce IO cost intead of following hotness
blindly.

So instead, let's lift the protection based on priority. With default
priority, we still fully respect the MIN_NR_GEN protection. But as the
priority raised, allow it to reclaim younger gens step by step.

OOM is gone, and swappiness is fair after this commit.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0e37f5c8f355..12aca97be56b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4929,12 +4929,14 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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

