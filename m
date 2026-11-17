Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902675;
	b=nVsjBVC9tBQ48T1JJMkNeG79zJj9hxCNUVinSO7OvLAPoG7cSC4+7A4vDJ7FauztkgBp
	 JOU6RAM9n7dlbRGDCOY1+XU6H4t/m5w+fH5cuys5b/pJMiXgnH8V/eE51OWej6TB+KrRM
	 5WqoWzfVJKxpspcvPt9FV9xoXsb886w6dvMys2OeN2YfXBGZIkXYzopWDPuRXV8/tvzcu
	 ImZ4xE5TtLfMr9x5bCW05TE/VhsaQxp4GqwCIHZmy2oxQlaXFhRSJYfCTUMzqOu9xaTSV
	 lrWyGi1Q5V8wGguH38siWJbo6DG7cGtlTUSI3fkDdqQQRGn/1ZmJtIuEh4T/3JLtHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BjhDYtdm4/pQJcy2Nq6/VwI3066PPOd59IcuMnYXHok=;
	b=LMWkdmAvOVwH6awBMWvkFxfEO08SigHp4ZD9y1zkxzC7Xi5Z5z91PeA6B9IayluLI03c
	 tinSJ2mLX9yxoDj6b0UwemyNaDLdnnI6Q8JowI2tKz9x9RMw9wbjI+KbClWevXLFnAhcM
	 PyT5w73pzznRhpdmQBDbf9KpSJh1YgHRlHnB3631J1TiA21NzhQpOsLOdKIIfWb2K5H1F
	 c/PGdOrxSEItcwE1RmPa4wm7uE/LyoUiPSto9dYzutOcQY9n+6qxld9fpe9fNClE9R12M
	 NDSdQ76fotViEpKVP0Pit/lmwPldYk/7dNJlkox3l3JX/3x+6ISM2rYks10ynk+5fyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HAnxMb7g;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF5606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECF5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HAnxMb7g
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tIZd3eeHeKEfMcEKXFH5YHQpdMOXGI0H+yUu5ZTMA9E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794902673; v=1; x=1795507473;
 b=HAnxMb7gG7n9/CDjQ2lgY4jNGhnGQXAorlcDp5JPO6iaUb9qklCz+7BqgpGX+FxkiHXxFqST
 gXjVDMVvWS69YleOfAhqee/ffXnz+wCPpDD88l8t2CSyfcSLFyRms3J+70k8tYrLaWzjyEpmWZ6
 iWBTkicnQMvY2ejUk7QyH+8w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86acde6d42413ff3;
	Tue, 17 Nov 2026 08:04:32 +0000
X-Mizu-Trace-ID: 86acde6d42413ff3
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Down <chris@chrisdown.name>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm: memcg: fix zero throttle delay on 32-bit kernels
Date: Tue, 17 Nov 2026 16:04:20 +0800
Message-ID: <6931674296b98139f5e02821d66ad1855eba36c9.1794902513.git.zhuhui@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794902513.git.zhuhui@kylinos.cn>
References: <cover.1794902513.git.zhuhui@kylinos.cn>
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

From: Hui Zhu <zhuhui@kylinos.cn>

calculate_high_delay() stores max_overage * max_overage * HZ, computed as
u64, into an unsigned long before shifting it right by 34 bits in total.
On 32-bit kernels the store truncates the value first, so the shift always
yields zero. Tasks over memory.high or memory.swap.high are then never
throttled, and the reclaim retry loop in __mem_cgroup_handle_over_high()
is skipped as well.

Keep the intermediate in u64 so the shifts see the full width, and clamp
to MEMCG_MAX_HIGH_DELAY_JIFFIES before narrowing to the unsigned long
return value: a truncated result would escape the caller's own min().
Nothing changes on 64-bit kernels, where clamping each term is equivalent
to clamping their sum, which the caller already does.

Fixes: e26733e0d0ec ("mm, memcg: throttle allocators based on ancestral memory.high")
Cc: stable@vger.kernel.org

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 mm/memcontrol.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..1ba42724ed1e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2576,7 +2576,7 @@ static u64 swap_find_max_overage(struct mem_cgroup *memcg)
 static unsigned long calculate_high_delay(unsigned int nr_pages,
 					  u64 max_overage)
 {
-	unsigned long penalty_jiffies;
+	u64 penalty_jiffies;
 
 	if (!max_overage)
 		return 0;
@@ -2601,7 +2601,13 @@ static unsigned long calculate_high_delay(unsigned int nr_pages,
 	 * MEMCG_CHARGE_BATCH pages is nominal, so work out how much smaller or
 	 * larger the current charge patch is than that.
 	 */
-	return penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH;
+	penalty_jiffies = penalty_jiffies * nr_pages / MEMCG_CHARGE_BATCH;
+
+	/*
+	 * Clamp before narrowing to unsigned long: a truncated return value
+	 * would escape the caller's min() and look like a small delay.
+	 */
+	return min_t(u64, penalty_jiffies, MEMCG_MAX_HIGH_DELAY_JIFFIES);
 }
 
 /*
-- 
2.53.0

