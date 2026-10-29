Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241212;
	b=RH9Vqz6ttSKA4stiuPfdsU9YKLuzbOpeJ/rqHGz5GJ6VA9Y3nDVDBa+nLmHHBY5Faqsn
	 sgaB6ncTi8Opk48iBo/BBIfr5KJSX6Zuif2TXzMeOt7Oq2h+7cSH47fKOpk3LeWNLRQU7
	 9bu9u2CtrAAwqCMQkfcN9PDJeshx3lL3bWcuuudQ3NebThxa2iMpkDTxiXTr7Hdf2aVY6
	 LsMLYsdk0XJ+V7HH4a5Mh55LW1vtTJq3+q8YHF+9S/Q4bR1fOzJ7PDG1I/qELKyT5EQrd
	 sKfuMmkeGpDOnqgoqam4PX+kOe5ELqfwZFZdIHuJ8wgDaWs0Wv3e1ioeomnirAeuy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241212;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CYdYh5WBrRXXCSf7pnLISM0Ny80SHTHVoHp4gT5qeTM=;
	b=Vnaw0p+Ue+h7C3dEtkbofyGcjyWqK4gGJZ9PwsJBcNl8NTlfTG2oZZFgzG6wJPTFeZLo
	 vN3/6tlCwQ39zlAKCh4Oki30CEWj1IX9xZtfE/CAOlP3bb44bZo86uroYC8xG9mJyp5ny
	 oFXfY+EzSHshQDY0LcWhOxJJGHF5DLhRbSN/LgF4g4md9iMByinzAdjcYdKZ5Ew5UK8AS
	 JHr2+ECEkU8MSavBBiEPk5KX6plBgDHHbSU5Sj+2JSZOxAXsjce3QJmBmJEoCA5KFFI3c
	 WJf68tczuR1rZ+r3OL270FM9l0KzzyBq1FHzOaygv5rw3fRl5cCuSrZXC2w5X5J57lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F03606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSvn08j0z171YW;
	Thu, 29 Oct 2026 10:33:25 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSvm0NWVz171YW;
	Thu, 29 Oct 2026 10:33:24 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id AE93A314AC01;
	Thu, 29 Oct 2026 10:32:59 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:33:21 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, <ljs@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>
Subject: [RFC PATCH v3 11/17] sched/cache: Drop prefer_sibling restriction for llc_balance
Date: Thu, 29 Oct 2026 10:20:29 +0800
Message-ID: <20261029022036.4002331-12-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029022036.4002331-1-wujianyong@hygon.cn>
References: <20261029022036.4002331-1-wujianyong@hygon.cn>
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
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

group_llc_balance performs balancing across LLC and NUMA domains.
sched_balance_find_src_group() forces balancing for it only when the
busiest group's child domain prefers siblings. However, sd_init() clears
SD_PREFER_SIBLING on NUMA domains. On systems with multiple NUMA levels,
prefer_sibling is therefore false at the upper NUMA levels, whose groups
are NUMA domains themselves, and cache-aware aggregation cannot force
tasks across those groups, e.g. between sockets.

Force balancing for group_llc_balance whenever the local group has spare
capacity, regardless of prefer_sibling. Keep the prefer_sibling
requirement for the sibling_imbalance() path.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e9a803433b16..03bb5c85a8b7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13334,9 +13334,9 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	 * Try to move all excess tasks to a sibling domain of the busiest
 	 * group's child domain.
 	 */
-	if (sds.prefer_sibling && local->group_type == group_has_spare &&
-	    (busiest->group_type == group_llc_balance ||
-	    sibling_imbalance(env, &sds, busiest, local) > 1))
+	if (local->group_type == group_has_spare &&
+	    ((busiest->group_type == group_llc_balance) || (sds.prefer_sibling &&
+	    sibling_imbalance(env, &sds, busiest, local) > 1)))
 		goto force_balance;
 
 	if (busiest->group_type != group_overloaded) {
-- 
2.34.1


