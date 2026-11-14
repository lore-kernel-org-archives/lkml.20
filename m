Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686971;
	b=VXjENFamofZSNdVMAO96VwHXfFiEn7mT/gtsMvYCWKul4iyrfzGwZdJZ59UNVXao2ShW
	 5b+vmhTDeILTQAXRFgSrgwK7a3TeskvFx0N325OII18d0WXT7mxskx8lgbJwNaOdGh5Kd
	 Ydm+EYU9PcpRnBxnWqwmSZo9guq6kDpqjSnj7i20hD0ARvEWSZWWdTHrCzS9QcluhoVFf
	 OYz91EgBJ5SrrwUe9/82W1u+8CQdUs5X44wDYEJHg+TPoJsdruru7hD5uhEhBF1fWqTLC
	 8kSS7XQ0mu7MIWvkC1B/oBB2/jM9PRODGc1K1l/Zcj9FnuvfovbGdhORv+e6723ESQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686971;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f+/Pt2UR788IAIB0+4Kh40rQr+T3EHhLM/rEL1xfbmY=;
	b=S4rnGIRMtbwhx6o19f+7G3+eYC8hWkUDkhbxyWPIa+IVcVec7EJ7lGCIeG3t+oVpVcXb
	 YZtRMWMz3JdcvpivyjLqNJx/yTi8uhEfsznTVvqqSsL9/z8MvbH9aTwwuzfGTSs1yKQC7
	 RUK/laP087SJlo2WNoXdIET4dZzCt7b5qHMFIamFxu+4i7wAKZW10Gbl/38/1Tv/VpSfy
	 uuY9927gjSXEyuqg99mrYm2aFikpPjtPmhmzRCR0vIRGCz8Ob/wzEqerahujf3z/g20C9
	 gXIfrp+Wpoq9eiKJq43iRSJ9Bwp6qE828eBGJ24r4ITF35q3lOfbqtTpotFME2oaCBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjcLnewf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C75B606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjcLnewf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14DD1F000C8;
	Sat, 14 Nov 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686970;
	bh=f+/Pt2UR788IAIB0+4Kh40rQr+T3EHhLM/rEL1xfbmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KjcLnewf3E/ReLekwt4jGxQuU/Xj1ndY0CcmsbvL1K4ANPz1lI1J6A/aMfkZoUpfG
	 98zWl2mZwgO1DUFM4YQ4f44IQy5+YJSouJI03L56IvLPIu0UD6u0yY6n+CAHs7B0tx
	 Uhwe0WdXGZJDKw+WaoS6WDmzPriYX/mfiZJ+UajrqgMtjZn7b5Vf/GwWhUtl6QO83a
	 at0N9YigCtLaERy9Jf4vuc9QFWwtb2JF6wbMZT5DMA+tkeCz3e/t8qvJL/0COVDZpR
	 YvPqVS4xIxLGQg0zfgu1b7lAL7y1kAehTms+tsuXzY8/R+SFZopXUrJaqafs79gpsf
	 A1mijUuC2011w==
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
Subject: [PATCH v9 15/16] mm/mglru: Make swappiness=1 file reclaim more aggressive
Date: Sun, 15 Nov 2026 04:08:02 +0800
Message-Id: <20261114200803.23129-16-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
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
index abefd91f5b95..a9b97d23838b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4955,7 +4955,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
-	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
+	if (swappiness == MIN_SWAPPINESS + 1)
+		anon_factor = sc->priority <= AGING_PRIORITY ?
+			      refault_rate[LRU_GEN_FILE] * anon_weight : 0;
+	else
+		anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
 	if (swappiness == MAX_SWAPPINESS)
 		file_factor = sc->priority < AGING_PRIORITY ?
 			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
-- 
2.39.3 (Apple Git-146)

