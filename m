Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342046;
	b=cGLPvfFB1r7GufDQm/t1w3jRmipBk62gnk41GikOBueHgaNgLOECHH1ffSAPokfmdCyl
	 Ezh3T47K1rpbPjkWXAKRR3LaBOg7602almB9w/ka226cHjaChNyOD6+LFrYYSczQdEKLv
	 43f1di4hAN0Ot/PbcH9W//g9AWZ9/vZtuM7qpdfVFikBmD8yc9AD/OFHkmyvF1HIkTHEY
	 0P6s3xlxaLbzKFCA8s40ouPljhu3t3L6+SLjvaKmGM/E1c5D20vHk0paOddzG1XvXkwJn
	 KEhhAdSQK5FFV2+XfKkO9+avresXyBHqRyL/KN856yjgOkPOKqJXzFJWaHK88EKrdvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342046;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=swxfRysumHKmdMmk09THVTvxU/XqkcT5rR3pmvabELc=;
	b=tXi9BAt2BKS+WZDPYI2NM3KGwimZ0L0+CGdvC7DkSXwWRmi1x+BXc+qCfCiXEXd2adet
	 xvedgg3XXjqq8ipB/RHPibImy1OFHkwk6kIYOGvB5jYDw+QAu8VoaRXE01m0d0IbFkvtu
	 ycCB2dQCT4Z8xI0NnmmylKOtUBSwptAQGBM55f9uvIKZRbTLZFKuLSvK1889MGHmhkCRd
	 4ToUcW6ZAynuc6+kPxJ0lVTjDZQ81zQSZnHR0ZVYdwcWGExH1US5KUoeshNHY4PqS0c6H
	 IgIBNR5leE6iSpZ4SMffN4r3L46fGbpeZFZJYVFsi5Qp8CVbpSgLOG1ljjDucNZfa7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzJ5L0xf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E781606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzJ5L0xf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2771F00902;
	Tue, 10 Nov 2026 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342045;
	bh=swxfRysumHKmdMmk09THVTvxU/XqkcT5rR3pmvabELc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lzJ5L0xf3Xola7GZGpU9ZPgjlw/jA9OU75CboafEf0+1r8BIgz1X83g5gWkzhb336
	 rFtcYxYzIO0D/cZkSNookZ1Vg93wEGs5+Vnub7RzSpPZASRKeqR164NakAGZ0AxXAg
	 qV/r/Pal45z89NHrrGFm5UrkD5gORPkjIdPaXVbk9OY78qizzVBU8vW8C/reqOa54w
	 liR5fLibokHg9WzNjprd11XfezWAI0izO7OetM+G8Kp6o4eBTDDVVBNtLQKy8jN5mk
	 jEA6Bp2niQYfuRKdqEA7UqXCBzJdNGARWM80kO1r+oFkY1VwclTQRjxFD9kRITqWV7
	 xUj/BoeYmhrEA==
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
Subject: [PATCH v6 02/15] mm/mglru: extract lruvec_populated_min_seq() helper
Date: Wed, 11 Nov 2026 04:20:12 +0800
Message-Id: <20261110202025.25736-3-baohua@kernel.org>
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

The search for the oldest populated generation of a type, previously
embedded in try_to_inc_min_seq(), is extracted into the new
lruvec_populated_min_seq() helper. It returns the oldest populated seq
of a given type, bounded by the given max_seq so the search never goes
beyond it.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index acc4efccda2f..4ac80968e634 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3991,30 +3991,45 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	return true;
 }
 
+/* Similar to lruvec_evictable_size, return the oldest populated seq of the type */
+static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int type,
+					      unsigned long max_seq)
+{
+	int gen, zone;
+	unsigned long min_seq;
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+
+	lockdep_assert_held(&lruvec->lru_lock);
+
+	min_seq = READ_ONCE(lrugen->min_seq[type]);
+	while (min_seq <= max_seq) {
+		gen = lru_gen_from_seq(min_seq);
+		for (zone = 0; zone < MAX_NR_ZONES; zone++) {
+			if (!list_empty(&lrugen->folios[gen][type][zone]))
+				return min_seq;
+		}
+		min_seq++;
+	}
+
+	return max_seq;
+}
+
 static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 {
-	int gen, type, zone;
+	int type;
 	bool seq_inc_flag = false;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MIN_SEQ(lruvec);
+	unsigned long seq;
 
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
 
-	/* find the oldest populated generation */
+	/* Requires at least MIN_NR_GENS gens for basic functionality */
+	seq = lrugen->max_seq - MIN_NR_GENS;
 	for_each_evictable_type(type, swappiness) {
-		while (min_seq[type] + MIN_NR_GENS <= lrugen->max_seq) {
-			gen = lru_gen_from_seq(min_seq[type]);
-
-			for (zone = 0; zone < MAX_NR_ZONES; zone++) {
-				if (!list_empty(&lrugen->folios[gen][type][zone]))
-					goto next;
-			}
-
-			min_seq[type]++;
+		min_seq[type] = lruvec_populated_min_seq(lruvec, type, seq + 1);
+		if (min_seq[type] > lrugen->min_seq[type])
 			seq_inc_flag = true;
-		}
-next:
-		;
 	}
 
 	/*
-- 
2.34.1

