Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342107;
	b=QIIL7AiCylntKKldagQJrJdJPakdXwbDXsiPjmnIyuHWDJFp97n4+gxgPYe6dV7CfTRy
	 I7k/CZcxfoW+UMffic4ks7OcXrbj0vGvO9hG1qlnM/qT1xBZMM1in0o2ANwWbCFq+thKK
	 VUrCXjh9k6uYAq/cwC2li5IigjbEewDRvzyw0qcYrSmd4h4do9rYrswkjh0tD76FKokKg
	 0iJOu6ngxaFyoH7MK4q/dvXulHNvYmC/JgiS6jPbp+eXVk+827iuUmjaFOaZbk4x1GwGI
	 xo+LPx510Cv8A71wDQ+R4IMM8pWNziexyKYHBU9jKDOjT3RGqK9lrytWafqwvcXWw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342107;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=URh14fMZaM8Bg63O4PhG+H34HuBb6CdZm+GF2CGxa1g=;
	b=P1tF+cG6dCHjMVUdPXts4WKpRYJ8uE3odv0wtHDMQMR9BVkiLv7ntjfnPLKsAF6EjHFW
	 aPHR09YqzTPRxzKuWg2IqolV1dYuKfISuLtnl/FWcuLL7tnbDZIaKxAIdlX6zDUaqTevr
	 MRU0MBNK8VVsn+WFMxFtyc5V22LVkMtVUhwp85k68Z1+wEa/C/56kitlyurPKTC4XUaPN
	 ckf4tHRvEzPcpNOQZwJwhDMzCulEnl5w8BMw/2UpK8DC8BubjThxGBQ7vNh2brduwa9rL
	 280wmwBUGX4EIqc5KNyS2edOPSAqWJBsXkhZ/2yxZ5eDVWZngNrjTbVeeh7aAcftLuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPBryI9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D0A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPBryI9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9B91F008A1;
	Tue, 10 Nov 2026 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342107;
	bh=URh14fMZaM8Bg63O4PhG+H34HuBb6CdZm+GF2CGxa1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cPBryI9ekENwM1kavqgmk64R2aWcmSAgZBqDKOiz9zDIYHpfaJx4NnvfWdHb7jjgQ
	 xUpXTX8f9XFCqKh/nn0gLhsHHWkI0Gdaf2PyzJJwptPP7zoaYBUWv4NG/F3sLR8M+J
	 kprkEegxIxrzUQsHyAaWbzuqII/BvqGfaWt7xn38YaspEvfHBM8Fn2GITYj3C4Sbkr
	 4R2VFX1s2Oh67zSYnT+mK5UxlE4Lh214UjFjEYF4Tg7j6Zb8JJG4BBPQw9b69XT9tp
	 n55fE6bjLQ/SZB8h4BJ3RtaDgfHYCE1V57KA6qN/wEdRr+IU55WUKt01hfExk1+PnA
	 x5w2Mes3vc19A==
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
Subject: [PATCH v6 14/15] mm/mglru: Make swappiness=1 file reclaim more aggressive
Date: Wed, 11 Nov 2026 04:20:24 +0800
Message-Id: <20261110202025.25736-15-baohua@kernel.org>
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

In MGLRU, swappiness=200 favors anon reclaim, while swappiness=1
favors file reclaim. Swappiness=0 allows only file reclaim, while
swappiness=201 allows only anon reclaim. Thus, swappiness=1 and
swappiness=200 are counterparts for file and anon reclaim,
respectively.

Before this patchset, get_type_to_scan() always returned
LRU_GEN_ANON for swappiness=200 and LRU_GEN_FILE for swappiness=1.

For swappiness=200, file_factor is set to 0 at higher reclaim
priorities. Similarly, anon_factor is set to 0 for swappiness=1
at higher reclaim priorities, making the two settings behave
similarly, although the thresholds are slightly different.

This allows file pages to be reclaimed more aggressively and
benefits workloads that prioritize file reclaim by using
swappiness=1.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5d6fc5d4d761..379339220878 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4945,7 +4945,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
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
2.34.1

