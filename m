Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596225;
	b=482NXuPco+IkSu1B7AvTg6jK23T4KI5afXFpzhwvHt8xpHNVduSRFem10MBEJbrom7xq
	 +pPUd6mKhIl0x0oZNN/Giug2euwdfL0dZOkVPfSNuRk8ZBMq8WCmgOFL5hGvA7iepEibI
	 oFzAhBptr4b8Xy7PzuVCIy0ed9K8dDHTGJGT5nY4kAYVWaD8ioibW2fH9X4GKOxEFI9Xb
	 RGficrFAOubwc6QQrVim3KOB8ij1FyokoP9/iD31Hg6tECyxATmlY5LhzcfearCM2iAb3
	 3m2Ju4MVnAIslwY8HWW3AR6zAUT09iZPQVVEvs+mTPIOfEkm1xwFEygsELgyvkrGo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596225;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=O5wdJ/qn6omLpc5B3id98U2KGeiHvUPuFJZq033njYo=;
	b=k8jUArmT5hr+X4cnPktyP4x++XyLAmQMtMO3WOmqzohIQKrwSie+GcKGzv0jWMz+yya1
	 eJzZ/403yQh7Ic9E+x1j0oYmZQCw+NIh6jh0LKzxld2GvThbOakuxKhuf4K5mVQpitUHQ
	 Iq6K+Dcrk3kSAGFbtyblCSYp2iS4FdhWbulyD4hKFQLbdM8u6jOs6Q6dysjTlQPrbfkto
	 sjVPK7jvhT9qpLzoio3vUNBLCYqtvtkVaVtxOhGaczyc7sML7dnIRtFhAzFqvoepYCv4U
	 hmsazGmH6zjsU/za/5fwb8zANJ+pK3oXx06cunbZDCoy/WqXo/TnSn8rs5GnnHOzBog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mlaIq1/E";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F0606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlaIq1/E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607D81F000C4;
	Fri, 13 Nov 2026 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596225;
	bh=O5wdJ/qn6omLpc5B3id98U2KGeiHvUPuFJZq033njYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlaIq1/ECiKhX1sgaJ79ZxG5rLmhWuUpdWnsIxSEPVAHzgIu4nlqCQt0YesH9VzSZ
	 T+XTRqak96Tb0ScKXzxRBJ6/ZXH6a1/OpQjyoHi1Cmpm77zKkAH5z0Rb0FNGIrABtz
	 f+5Gcaxd1Pl+QrdKE0MpaWZVUlpQQjB0+7ZlhfMhq5smacySYZfwt+FcpeV47GTFPt
	 oeZYePf1DDgU1v+4/ZfMpzAYnHCPveh7lSpNEb/Y+sf/aXfSmhGsrMFaWIO2PG7bFj
	 gm2Lo/jAf+txBPK0vXDqKCxSKNbr3HTK3kl9kIY3PxdDypWRRwOHiNaYVGjDg3iSTi
	 bhIWXzS3GkTLQ==
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
Subject: [PATCH v8 15/16] mm/mglru: Make swappiness=1 file reclaim more aggressive
Date: Sat, 14 Nov 2026 02:55:40 +0800
Message-Id: <20261113185541.70203-16-baohua@kernel.org>
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

In MGLRU, swappiness=200 favors anon reclaim, while swappiness=1
favors file reclaim. Swappiness=0 allows only file reclaim, while
swappiness=201 allows only anon reclaim. Thus, swappiness=1 and
swappiness=200 are counterparts for file and anon reclaim,
respectively.

Before this patchset, get_type_to_scan() always returned
LRU_GEN_ANON for swappiness=200 and LRU_GEN_FILE for swappiness=1.

For swappiness=200, file_factor is set to 0 at higher reclaim
priorities. Similarly, for swappiness=1, anon_factor is set to 0
at higher reclaim priorities. This makes the two settings behave
similarly, although the thresholds differ slightly based on
testing.

This allows file pages to be reclaimed more aggressively and
benefits workloads that prioritize file reclaim by using
swappiness=1.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b1a36dae6da6..9ebfa3e4eeb0 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4956,7 +4956,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
-	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
+	if (swappiness == MIN_SWAPPINESS + 1)
+		anon_factor = sc->priority <= DEF_PRIORITY / 2 ?
+			      refault_rate[LRU_GEN_FILE] * anon_weight : 0;
+	else
+		anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
 	if (swappiness == MAX_SWAPPINESS)
 		file_factor = sc->priority < DEF_PRIORITY / 2 ?
 			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
-- 
2.39.3 (Apple Git-146)

