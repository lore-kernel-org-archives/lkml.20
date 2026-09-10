Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFD3AE1A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=PyIr2Hw+b6ZCXNG+hgi2XktcMDALQ0+1xhpSGzYv2S360T1/R5YtxbGU+O+01d6FFiInwOxzppmkfIpaiKI3aRXcpvi7hAQIOuOowmisHF9m5fbHl8xMqOjN/2c6ZL9HgEUTGg2eGg+ODrarOKFXnALoCuG0HZioHQSQrKZuL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=tXOb2gM5KmdToeaqxMTKhvq6W4aDrf8KUKnU0DE+TKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGpAvDmp33OFphs8cNCuoOtbsQCZDJPV/nhjo6oR4guFeCvmsJb2pBwyiCtgIdrbGFpnQAlBzErsqNLf0mWKNUDTCxJg4vcFCAgaXbmy23iBJqmrkQdnnY0PGy21BpZi3tWFEqkDHhj4i7DGzMvuqXb3VI6JRlS0H163V/LBk4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NZcENpY4; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NZcENpY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Iz
	Q9B9qyBge0iH1jK1v8qnI3vqWt1L1DDgzup5RG3Pw=; b=NZcENpY4x4FwZAPicl
	0DhL5AdUbSxNYhTOi2PAH6qQQWpchmPhlVDGtyHauIi133JQWl+kxoea9hQr+LAC
	QBaqFavNmi5bS/sOha574I9jS6mXco2UCCQ3l+lw4YCu49aCygreF0fAk5QCEXGJ
	5Tmw3hJ4WagVSmXf0d+8pcwnQ=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S10;
	Thu, 10 Sep 2026 12:30:04 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 08/10] sched/fair: Do not check avg_idle to prematurely exit newly idle when LB_PROMOTE
Date: Thu, 10 Sep 2026 12:29:48 +0800
Message-Id: <20260910042950.1619727-9-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4fCw4xJFW8Xry8Xr18Krg_yoW8Xw4fpr
	ZYyan5Cr1qq3Z5Ja4kAF4kWw1agwsrJa43WF1Iy343Jr15J34Fv3WSqa43WFWfCryrCF4a
	vr1jqw12k3W0grJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDDGcUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6Azi7GqiMkyDEQAA3O

When LB_PROMOTE is on, there are high real-time requirements, we should
avoid prematurely exiting in sched_balance_newidle() due to a short
avg_idle. This is because after any newly idle state, if no tasks are
found to run, there may be a long-term lack of new incoming tasks to wake
up on that CPU. Meanwhile, there may be tasks waiting to run on other
cores, leading to unreasonable CPU idleness. The definition of
unreasonable CPU idleness can be found in the commit-log of the previous
patch that introduced the LB_PROMOTE feature.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d2b538abdf3e..8a1d2763a923 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14694,7 +14694,7 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 		goto out;
 
 	if (!get_rd_overloaded(this_rq->rd) ||
-	    this_rq->avg_idle < sd->max_newidle_lb_cost) {
+	    (!sched_feat(LB_PROMOTE) && this_rq->avg_idle < sd->max_newidle_lb_cost)) {
 
 		update_next_balance(sd, &next_balance);
 		goto out;
@@ -14716,7 +14716,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 		update_next_balance(sd, &next_balance);
 
-		if (this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
+		if (!sched_feat(LB_PROMOTE) &&
+		    this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
 			break;
 
 		if (sd->flags & SD_BALANCE_NEWIDLE) {
-- 
2.34.1

