Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801896;
	b=CXZqmHVpjFAHC0h9Zg9djbgnaDCZz1eGlHa9EmeFhkh5Rx7ic+p8ibczy2FiQ42AlQqg
	 R9n0pstMRBY24VSguHknJ50NkJFIu7x0qKCtCQFRMY//uO46gEbGWplaayCV2f4RrHgB6
	 7HlvTR7w+VS/20Th/HYkQbbq1kFwTJfLXo7AJPpBSUhfrP1VSWko66BpjNkBdMki1E3mA
	 6EOcxW9T8IenBNiqZHQlVlwmYwarVkQ5qVQDlpGvAeYnJ+oz2eML6MAlPNyqByChtQWBR
	 cUqJQY0g0OCiCaFQqnXjgrzzRvQS9nXgsc9WP4UEZPEwWJLI7lfBjHjSqZ6fcVXYqYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801896;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=Heu5ugd+NF0d+Fg6h0LqroScBdG/hqP0uH0kgS5XAn8=;
	b=cGAR6xeUTYo0M6GsxuA5oQZQrxiIU1QvsHhbukwQyLHuzfi3MAKvW4QuOlohSwd/nP0q
	 bnMnqjnyy9qGzJOz4Tc4FKyDy247KTSkosSO0TLA7Yu0wIaL+V+8dh+hg+ZHGFWF4Obrq
	 KwDTRUDt3ALl734c4znaEJCnaD9k4cXYbRDobipmPWMweXyIWN9FssEMuiyds761icJcR
	 kvV6Uv1d4M0T5BkUYWKlpErr/q5H/lMt0Pb5IunPrQ3bb00I4J6HKEok4h0uVb4omajat
	 T9X3aBB3TpowAgDljH+B4PRlm/lY3tInn97/Rn5eAWga8v/DLkqjhFvhKI7/7/HONjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764DF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764DF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKSFn6l56zwVJQ;
	Wed,  4 Nov 2026 22:17:49 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKSFl3tlczwVJQ;
	Wed,  4 Nov 2026 22:17:47 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id A7C6B301C0DA;
	Wed,  4 Nov 2026 22:17:12 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 4 Nov
 2026 22:17:45 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <yu.c.chen@intel.com>,
	<tim.c.chen@linux.intel.com>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <wujianyong@hygon.cn>,
	<jianyong.wu@outlook.com>, <liuyibin@hygon.cn>, <zhongyuan@hygon.cn>
Subject: [PATCH] sched/cache: Fix group_llc_balance being unreachable above the first NUMA level
Date: Wed, 4 Nov 2026 22:13:13 +0800
Message-ID: <20261104141313.185433-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
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
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

sched_balance_find_src_group() only considers group_llc_balance when
sds.prefer_sibling is set:

	if (sds.prefer_sibling && local->group_type == group_has_spare &&
	    (busiest->group_type == group_llc_balance ||
	     sibling_imbalance(env, &sds, busiest, local) > 1))
		goto force_balance;

sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's child
sched domain, and sd_init() clears that flag on every SD_NUMA domain.
So on any domain whose child is itself a NUMA domain, i.e. on systems
with more than one NUMA level such as multiple nodes per socket, groups
tagged with group_llc_balance by llc_balance() can never take the
force_balance path, and the group_llc_balance test there is dead code.

Such a group falls into the !group_overloaded branch below and in the
common case ends up in out_balanced, so a task that was placed beyond
the first NUMA level is never pulled into its preferred LLC.

On a 2-socket Hygon system (8 nodes, 32 LLCs, 4 cores per LLC), with
"spin 3"/"spin 4" (3/4 busy threads of one process), all threads were
in one LLC in only 41/140 and 0/142 samples; every failing case had a
straggler on the other socket. With this patch: 195/196 and 180/196.

Only require sds.prefer_sibling for the sibling_imbalance() case, which
is what it was originally introduced for.

Fixes: f38cc2f0d8a3 ("sched/cache: Prioritize tasks preferring destination LLC during balancing")
Reported-by: Yibin Liu <liuyibin@hygon.cn>
Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..205a0891b0a0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13294,9 +13294,10 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	 * Try to move all excess tasks to a sibling domain of the busiest
 	 * group's child domain.
 	 */
-	if (sds.prefer_sibling && local->group_type == group_has_spare &&
+	if (local->group_type == group_has_spare &&
 	    (busiest->group_type == group_llc_balance ||
-	    sibling_imbalance(env, &sds, busiest, local) > 1))
+	     (sds.prefer_sibling &&
+	      sibling_imbalance(env, &sds, busiest, local) > 1)))
 		goto force_balance;
 
 	if (busiest->group_type != group_overloaded) {
-- 
2.43.0


