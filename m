Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898725;
	b=ypASNq+XRPr19rQXxY5uZds3ZAytB1VHC7FZBn+3l2dm2xD/mhfcH8GaHmk9BIJPk68Z
	 wyHqjccFZ5gK7OaKXOSqYaSrxyzF0SzJhULTf4dYoQaxyZMs73dk8wb2spvlhxCsKY+nL
	 5m4gR4XHk4IEyH0qhfFgkXfBZnRPZClV+R3yDoWCHZjNI0pqcszeNnzLcpR5pnrJUfxWN
	 JGzQtiqFqQuunfShwAsuUlovJ/cgL4dnREvp4uhaqNeeOxcWDv/VxEDW6608RqKkRBxC3
	 XWEeAMFS/Pgl3E2eh6FsgnkL12RHI4675Z8/5pR5HGFVj3/SpVVm0x7cQLzvmBv7mkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898725;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=bc75SLbBPFFYuGhhX9KZv2ESTyQB6bsXRqPiY2SjiyM=;
	b=JJH2gjM4n/fohuE16JEOqfEdGRoMS8Uh1PksmmYioWwYYYeUZqu5LW/p7+jLfXbjrtrX
	 0A6n0X1/tFV5XOv0jk11NEJDC48vZDCeV6cCUccVu6IOKUJcPYf30uVco05hRujIAbTJ+
	 kQFscl+28f4LLT4LXrN4VAsFgUXoy91kncz/SEDSbB0FJmlmaE2v9HyA8wK4FpjD0On1g
	 xDS30SlCf7RuWT0tbQ2zYMivsgd7KAUDYXLhO9BwYffcA9E5ze3S0I3dEZDUSYPDL2OTx
	 YC4sM++/LLcSn7jH7iNm3byO0Ng1df4wJ62noTjp7z8CiDUK02Hg/EpanM2Vh2VjeuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=shrJD8LM;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D73606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=shrJD8LM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=bc75SLbBPFFYuGhhX9KZv2ESTyQB6bsXRqPiY2SjiyM=; b=shrJD8LM3L8+F1PUJn70d84HrT
	Jb6ZR/qpJ9W1Eahbv1j8tBGMcAF8Ay507gHpuh4/u4UogmWsFdK9pFMpKBxbj0R+IYgNGdqb6v3Fz
	2fsWWCFBFtHalF9xROGbQllqhfwEV4SY31ajcRxjO7yXpNaIvWok0wQIFiy7WKeOeFCFJzOA9i5ut
	qc0Btq53MX0snbt3zxvLQzveovh+9gEGl63uKCAr2uUzKKcDWa0n+oYJXIPWon7/PiKDdEJU4j5wf
	K+WZFkCgKU4j6h8WcPwrBZjC1PQSucZzZbKNIRvoJh5MSo+xKIaL3QgD4mX4oGn0EKa/TAz6p0qU+
	OCfM/edg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP10H-00000009yGt-29fU;
	Thu, 05 Nov 2026 17:11:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 734303002D9; Thu, 05 Nov 2026 18:11:56 +0100 (CET)
Message-ID: <20261105170157.453569788@infradead.org>
User-Agent: quilt/0.68
Date: Thu, 05 Nov 2026 17:55:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 joshdon@google.com,
 tj@kernel.org,
 jakub@okonski.org
Subject: [PATCH 1/3] sched/fair: Use guard in sched_group_set_idle()
References: <20261105165525.011876858@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Cleanup the code by using guards; prepares for further changes in this function.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15790,12 +15790,9 @@ int sched_group_set_idle(struct task_gro
 	if (idle < 0 || idle > 1)
 		return -EINVAL;
 
-	mutex_lock(&shares_mutex);
-
-	if (tg->idle == idle) {
-		mutex_unlock(&shares_mutex);
+	guard(mutex)(&shares_mutex);
+	if (tg->idle == idle)
 		return 0;
-	}
 
 	tg->idle = idle;
 
@@ -15805,13 +15802,12 @@ int sched_group_set_idle(struct task_gro
 		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
-		struct rq_flags rf;
 
-		rq_lock_irqsave(rq, &rf);
+		guard(rq_lock_irqsave)(rq);
 
 		grp_cfs_rq->idle = idle;
 		if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
-			goto next_cpu;
+			continue;
 
 		idle_task_delta = grp_cfs_rq->h_nr_queued -
 				  grp_cfs_rq->h_nr_idle;
@@ -15830,9 +15826,6 @@ int sched_group_set_idle(struct task_gro
 			if (cfs_rq_is_idle(cfs_rq))
 				break;
 		}
-
-next_cpu:
-		rq_unlock_irqrestore(rq, &rf);
 	}
 
 	/* Idle groups have minimum weight. */
@@ -15841,7 +15834,6 @@ int sched_group_set_idle(struct task_gro
 	else
 		__sched_group_set_shares(tg, NICE_0_LOAD);
 
-	mutex_unlock(&shares_mutex);
 	return 0;
 }
 


