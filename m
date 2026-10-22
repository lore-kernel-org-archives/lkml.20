Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706544;
	b=CcsST/ZA0kMZsvjp2cRiiNdJ0sEmYS/k8AAxtToUb4nSJxiIm+XSxLlHuESFvCFwN2W0
	 4JTPDTh7qFc2XX2NBWQiQofdeze4+LRAHmdGsiyntovHUwlBwv8LtWbd9n+ExXb8sGyTa
	 l3Ka4edBS2/+6mqnuIbWGgAJixTP9Zeu8vPWQTl+yz3OzWyogf3tNhpAUAFyeuXq9cYYc
	 BXOy1Zzv/8WUG4RfpIDsWLWtf7NldXX+Y5dZENuk9BdqI9osWFjk3B370hi1IZxoreSAP
	 Ilf7yTfW0qGOjCo5C8v3Kde/sJ2qlYE534aYCCo0BOHWBjPp20SDz4bB8otRzi2sb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706544;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gMfZkTuxTlSsyjGjWesRKoIv1NGikpPcCvSdfeM0NJ4=;
	b=2zBcGMQUoUN8fDWsCK85IK+gCbkokN6//p+/n2gvonHXORgr6dRqWHKQYfoE5dccCIZW
	 srXgYWmQqVU/bjDOTjrVypw8IBopQExO69trtDIUkmB6cc8xZ1XiVwPPxQpOy128+QPy1
	 pk/J3XH/ua0TRJjqw7ZlPkYFc2Pcw0PixLTyurmr1mc1pNua/ZbVnxkhU0CcOtn/h9Iva
	 zYEizsE5tvyBNQAFA8gvV7Vut04PNsHHt30290dGUhhWgJM84ZGlFOiEo5ChTtqpIIAdM
	 FKxEg6gA+7izKINhQ0HM72LKaP5T7M7xFkPDy3r07GNfXFsBy8KycsFPAFtOcBgSBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QalWKvm9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QalWKvm9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F4E1F01829;
	Thu, 22 Oct 2026 22:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706543;
	bh=gMfZkTuxTlSsyjGjWesRKoIv1NGikpPcCvSdfeM0NJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QalWKvm9yD1uCCEOxwkWey6CoBh/gYh5acwDeOHUfnTQ7/a0vUVmFkvY5YJqvPjXW
	 aAgY1vj5U5/2x3/Skt7zY1VWidrutMaLTlfd1Cma5Fl77gRlmFuKM6A9dkP6CLGkhK
	 bSZPuu2rrY2Y9SgASUkV+/6SBBEWZxTbNVVuw2YLntddNjrDshQ3jmuDTBQMAB9efQ
	 /s6limoyz5jeP0AWECMIvqTnWQ+OCEuMjQPFC3lVkCxqGbCMK7t4RxjJzn61VpVSJW
	 FTQ84P0+/uL8G1/OAqOLx+dmbHf8vaFMGq4S/Te5jPxcweB093N0PDvTok1EZIKPcO
	 2wuqwGj4UOCHg==
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
Subject: [RFC PATCH v5 02/14] mm/mglru: extract lruvec_populated_min_seq() helper
Date: Fri, 23 Oct 2026 06:01:51 +0800
Message-Id: <20261022220203.91911-3-baohua@kernel.org>
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

The search for the oldest populated generation of a type, previously
embedded in try_to_inc_min_seq(), is extracted into the new
lruvec_populated_min_seq() helper. It returns the oldest populated seq
of a given type, bounded by the given max_seq so the search never goes
beyond it.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3be0d6c04a82..500ef23949fd 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4131,30 +4131,45 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
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

