Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925641;
	b=4rUvCzDsvniSMz31QQA3GGTGAnZhl0bfJWJqXEznFpnPyycicpGyIxHjaX+49a3T/8iD
	 66N9BV6oqwrnicQWVFLVSTBqGl2ulJ5EDTJ5fvE+oe50WtvfPEbXUTSLm5k4WNDMRM4dw
	 pMtukaRZyd22TlCf1dRvMP6MxYen9uTWmkjYOahqhAS4ZOE9NEPRBa6F+UX2yUR2HOKGC
	 nvtkt1+1c/TMHFADDzxnrxGYEk0WzUzzYgTDhk/Xe702eevlD6k5RaLbVrIWZV850QxKd
	 Fr/+17r3np3jyPEkoJLVrk6TvaDUfEefXEqj3IUIOzUY5f1IWjaZNt6nNrkcRns9XOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9UIar4van7cMudoX+Hle6lFJTodg37TG9APMzGlrhM0=;
	b=vNhmQ66Iu0hHkVGyL+mW/BmLjcN0My81+vp3Efe0IiCnkdjm/tswNTwehN5HwT+IlJgQ
	 +tcPGwDKOz85J+oa9tMft2baAXgp4j3No6AiNWrJXNx7kfF8Wyjm3K8je+AGs08jUJkuQ
	 s3MIrpARbYsPwgU/DVQ+WmDbeEqxBsNBlFcZ7H1Y84OeOQ60io3gDL9826ZBZ5vNDpMvH
	 pdpTPmL9xosjyOEIyPjvZ3ewX2g9Mb9innZetENmVZEjXDEi1zNciX6ojdthlXSQGttV5
	 IMwN7du1PJXiDm9YTRbU56r5YQcfCQMwGU1BUpfnTCuRpQ8eSZSFYrNNYqgYAPARDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=qcxMH53i;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=qcxMH53i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794925641; x=1826461641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9UIar4van7cMudoX+Hle6lFJTodg37TG9APMzGlrhM0=;
  b=qcxMH53iTqIHDKgvUJb+qiS+5lF2F66jc8wPlRZiNjBNCtJdBns7Ee4a
   pBmgChk2tffEEOS39zl63t4I7fD43RZzcTXnBorrb80wx9ZPoq/mVW71z
   VV2xhuCdgZ91OyCPfaIc6/gPnYCc03lRJ0JuHny/gJmHzSj9pMHiUw4qt
   nQZ5plUpPsPlyEF8ucL/vpypnvaFChl4fT+NnoH+7APWIUze15fifTV3M
   /RVD5R5NXOkpE/oBEchtfnG1RkqbG7nABogstdHJId+F0DidtirwrhmaE
   ExjoOLe148xiU2V5BLbxvKPS3SWk5LUFUZnvt0Eu5ICFIJBFPEOS0+TTj
   w==;
X-CSE-ConnectionGUID: TxWM3hWdTTacLC+FIRVMGQ==
X-CSE-MsgGUID: xAXv7BEMTXuxPmeCVc/6Ng==
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208";a="34310566"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:27:16 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:23345]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id d2234bc6-80f7-42b5-8d65-2f1812484cf8; Tue, 17 Nov 2026 14:27:16 +0000 (UTC)
X-Farcaster-Flow-ID: d2234bc6-80f7-42b5-8d65-2f1812484cf8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 17 Nov 2026 14:27:16 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Tue, 17 Nov 2026
 14:27:13 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: [PATCH 1/2] sched/core: Clear a stale rq->core_pick after dequeue
Date: Tue, 17 Nov 2026 14:27:02 +0000
Message-ID: <20261117142704.6878-2-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117142704.6878-1-lshahed@amazon.de>
References: <20261117142704.6878-1-lshahed@amazon.de>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

A core-wide selection leaves the task chosen for each sibling in that
sibling's rq->core_pick until pick_next_task() on the sibling consumes
it. If the task is dequeued before the sibling consumes it, for example
migrated away, the pointer stays until the sibling's next
pick_next_task() overwrites it. Until then
__sched_core_account_forceidle() keeps charging forced idle time to a
task that no longer runs there and, with schedstats enabled, to its
cgroup, even after the task has exited.

Clear rq->core_pick and rq->core_dl_server in sched_core_dequeue() once
the pending pick is dequeued, and don't wait for pick_next_task() to
overwrite them.

Fixes: 4feee7d12603 ("sched/core: Forced idle accounting")
Cc: stable@vger.kernel.org
Co-developed-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
---
 kernel/sched/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea..b1718ba5a4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -328,6 +328,15 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
 		RB_CLEAR_NODE(&p->core_node);
 	}
 
+	/*
+	 * @p left this rq, so it can no longer be the pick a sibling made.
+	 * This also avoids forced idle accounting charging it once it is gone.
+	 */
+	if (rq->core_pick == p) {
+		rq->core_pick = NULL;
+		rq->core_dl_server = NULL;
+	}
+
 	/*
 	 * Migrating the last task off the cpu, with the cpu in forced idle
 	 * state. Reschedule to create an accounting edge for forced idle,
-- 
2.47.3

