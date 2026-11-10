Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342077;
	b=gwhwpmue/hnlYWLU8Aubzua63mgMxkQsgQ57twpe92EmkXJayDFR44nLYbcqf6l3uPYC
	 dDtkSXLLdgQJTmn3Nh2wxjZCKwBai8wUNrPa/WXlRrvE1RCOa68kqXCgQEkJYuGeonMXM
	 B+mvzE44CnIu1GCY3FCxHmyG3uvV71W3bWJI24BZDuIft8nzdZdknSzNr9Vgbc/HU2gH5
	 F0RKRcGJPH76r7MJtNkkuqCKLWhNJp+JCYclhD3kT7uuV+441oWFyBmKXG7psQPItIPWs
	 I/5w/O22rUIR7AcgNmA7JgyNc5jJunNN0waParxBgRfcXKFUujmluU2QT10a6M1FUrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342077;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OH2cxkpB3Ld+M2g+10ggUTvOmk8yrs6YSxeZbA61Jms=;
	b=yVmbTgzTABgHefQShx+zEIrB1mCPTvEOPXhqjSRyB8cwlVrbZbggZcj5YpOgNf9bglQX
	 EpoNd/l5TD4utVTPXGzvfVtFivIWijpFB2T73X0vl9ao8FcVvOhTyz58HAnps+i0FDLbg
	 YyG8yzkmKS0sMIXxfJ8AFiiCIUnn3GOK5boeG3rOONyZSv31TCxpw9FsLcyT8/YwqpnLw
	 7wyOky+Jvy2gxh5REsVkkKgMnxp5FxckwOzjQNVOn0avvUhsbvZfV7R5Uhi+gDioE4uH4
	 tcqOzydUvRhX53dhO9ZPSs2XpLSo1/n1mgNVS48YzjCFg0vMT62/fDXB0yv5Rn29EAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJF4Ilz8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A6E60A2624
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJF4Ilz8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EB81F008A2;
	Tue, 10 Nov 2026 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342076;
	bh=OH2cxkpB3Ld+M2g+10ggUTvOmk8yrs6YSxeZbA61Jms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cJF4Ilz8gOTkzfxWbbrdX1udDZ7ZSAs9PQ22EX05xNTfdVoSWtRTaMQVcLPvGitVr
	 a6F3d5eRG8PQg7xCYhQbTihaMBbQ7cTPMtOpFwJRcxmVmvEAJLQYwG/VGZMant2pbE
	 CPVzT0EACkiJBC7D+FXzV4u7tE414RghPXNa/KjQBPiaqogdn7mz0wLBvDdf+ejenV
	 pJCuOZ+OH7zH10mzJ7+/45Q9bStKccnzi930BXcljEalLWlPEZzPZ08TpcPZQXv6Gp
	 ffSfhs8CURSaiFaLxemRtCrr209Bpqg/QfMna56p5/fRojxDrnZs9d+XZdszkUkd4J
	 fQcochjRvXO8Q==
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
Subject: [PATCH v6 08/15] mm/mglru: lift youngest gen protection for higher priority
Date: Wed, 11 Nov 2026 04:20:18 +0800
Message-Id: <20261110202025.25736-9-baohua@kernel.org>
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
swappiness, which aim to reduce IO cost instead of following hotness
blindly.

So instead, let's lift the protection based on priority. With default
priority, we still fully respect the MIN_NR_GEN protection. But as the
priority raised, allow it to reclaim younger gens step by step.

OOM is gone, and swappiness is fair after this commit.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6b325fe73436..0731059b169d 100644
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

