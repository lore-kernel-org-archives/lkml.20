Received: from outbound.baidu.com (mx20.baidu.com [111.202.115.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5E35DA77
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.115.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947279; cv=none; b=fOVihzW3Bl5SS3eRCFe2Y5izk6n9E+pfpd1rheK/EdhH17qLPBOTfjw6ErcjnipJf2OxgeQPdn4vNYchP4FF7SuMyXE/PC/11YlZVeEnz3Nj8wU5+IWOhRg9t6lnYD/W2qhJN6bxxRO/jiRDaHOcD8ftgDZNikvVcH4NTAeUhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947279; c=relaxed/simple;
	bh=svUrFqcj67W6fzYuu+k3OSkc1LKuirm+YzQx623g+Zo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZBqf9h0jMQ6a/etXq+QGCakCpklzSmBZKBqTRhupeVa3lhFa/OFpwXbyT5/wKr6p3hP6dphnfwozpXYOnJU8XIwQtca5WuvhZPpR+aZuRWFo7rT0Z38xErrIpak4kGQi0ZPAnAjgva1fvW4kCTVY/oHQwRRonRAuJlCuTyoVLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=cf8LBrh1; arc=none smtp.client-ip=111.202.115.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="cf8LBrh1"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] sched/fair: Preserve newidle cost decay across domains
Date: Wed, 9 Sep 2026 17:45:23 +0800
Message-ID: <20260909094523.2314-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc3.internal.baidu.com (172.31.50.47) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1788947135;
	bh=B+UvKx8b+tLiq0qF1NgW2um9S/6PSofoXIq7wC1IDxA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=cf8LBrh1EYyJMIbOoYrtOZI79aW+5+xyJfvFbPSn+62XrPXf9DYRjw6QCXp1ebeXL
	 Js7iAQK0XOhziAVYeboVZ5PhoiVDdUzz0pfelOJ184zyQJB1lT/q6nyoT0cjO1zfCQ
	 BwxT/DOUK4XQky+FqmI5t8Y00qbGJUHRRls014pe3GvkL7pm6uP1p6y4e60+ZkLMht
	 4reTnAx9gXJv30eyVznF7Fze4PEEbSYJwXi5C8bcrnTtNBbTSvrAT/bRFB6TbFn4k/
	 iqMkQpaM3QSgR1mvMDo/V8a+2hrrLjJTsY6LYuM3wi+jO/X8r42Az2tv/FWcEj26HE
	 BELKynL2p4zaQ==

From: Li RongQing <lirongqing@baidu.com>

In sched_balance_domains(), the result of update_newidle_cost() is
currently assigned directly to need_decay for each scheduling domain.
As a result, a decay reported by an earlier domain can be overwritten
by a later domain that does not require decay.

For example, if an earlier domain reports a decay and the last domain
does not, need_decay will be cleared before the loop exits. This causes
the rq-wide max_idle_balance_cost update to be skipped even though one
of the visited domains has decayed its newidle cost.

Accumulate the result of update_newidle_cost() in need_decay so that a
decay reported by any visited domain is preserved.

This restores the aggregate semantics of need_decay and ensures that
rq->max_idle_balance_cost is updated when any visited domain requires
decay.

This restores the aggregate semantics of need_decay that existed
before e60b56e46b38 and ensures that rq->max_idle_balance_cost is
updated when any visited domain requires decay.

Fixes: e60b56e46b38 ("sched/fair: Wait before decaying max_newidle_lb_cost")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1eceb..8c1008a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13982,7 +13982,7 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 		 * Decay the newidle max times here because this is a regular
 		 * visit to all the domains.
 		 */
-		need_decay = update_newidle_cost(sd, 0, 0);
+		need_decay  |= update_newidle_cost(sd, 0, 0);
 		max_cost += sd->max_newidle_lb_cost;
 
 		/*
-- 
2.9.4

