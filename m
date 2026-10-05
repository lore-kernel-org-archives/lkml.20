Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A047CC79
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201839; cv=none; b=K61jee62dZKWXw5IS21zK+toWNmaLpUhebQW1ioAGTMEdh8Zw0XCozhxq8i9+1iLcHuhE2EyNaNATykw/3b0n7KKA3sK0xfBcQAdheycU4mUTLo9JGQTQclI8GwhUq1p1/1VelImgX8g6/WxoVofyZSdzAm9eF+Af2jIr06pzPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201839; c=relaxed/simple;
	bh=6PPOl2J+PfRi4fRZ+aAnDP+a7gf/QsLFoXJhKIFAyKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsKjRBfkk/LNVMBQ+wjLlKy6Kt9EJIKxvD24+t+h6e5dJfyWWNiZm817Ay5wvAbYjfqeCsv4Q5BECCW4mLyvIjocqqAv4JPdQjFewy61BaBdB+hK6cSHKkYvX7ROLETPg6uUn6OmvvrZ7OLFAjcWQHZcLepzTI7pJRpsVGwh7ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHejKZTU; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHejKZTU"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d2bbcab2so3384825ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791201837; x=1791806637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMrSa+oHpfgNYCnNNsjFGhC1hXr5zwo8QSa54ex/j0M=;
        b=QHejKZTUB4+MJMK8J02elm4nATZtSgQUivyJy61hONtyHZtrRju/xGaz7wlNLIpO9n
         kgyLEIUWLMZzbtOHqeMQdcN2P2uZ33Nji/a2qcPqALkrw+SNe+BbzytHOK8DCqwyTq43
         aZstI0NZhswOC5ZoFlRRSDiht5IUTGYIj7P7bi8TuxHp4keYvvnPGy2goXIYQiVQI+Fu
         EB3txbdv4O+PxmeUwCxQJRZu1MbHSeMmmp9Mi5N2uNfH897LnvTbk7QGXhLAIeaRGzTr
         Qiigabs497N4/tpLSoZfNriN37RmWSD779nw8u3VGAFSqp55aNiV+1KpAIVB0UAZboKK
         BLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201837; x=1791806637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMrSa+oHpfgNYCnNNsjFGhC1hXr5zwo8QSa54ex/j0M=;
        b=lJLo5VXJbr+Xm7g0E4o1j7q2PiZh6Ab2+JdKCbk6KyxClQ5MdkB/tb7xhSLJpbhcZa
         aowSPbXNKprVWPAGhrT/jccCi8nizeW6beLvnfRFLr8KWCClAL2beOPb7CqawzmIuKTX
         vloN4cFp3bE70pGTUVa2ReVmYLwvrvtMk+ICHKZj07dm9ZO/AZn+H8XVJU4QCL5bd80a
         WlrEc2Uq0S5zQ91cfaWJE/3Yqk6r/I9P2nTrxKX/06tua4HBDrMnA1bB86OdsZm/qkfP
         4pIRIq7hy8AQcRskgTsPBf5GgIj/Hqs5gVWVyLru8BdtAGk5Sknoh6Pib6eV8hK3QtlG
         OrqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4U2a9WopPPx7nlxh3oRUKNvqlDLzTqdDheNtzwKWGtkxSYtobmY5MlDP5KmwfwIVegbZpkojMpKgfI+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9f2IzZfJZYkdYz22xxGERfSwzPrJjrBUbM42Io+vMTzsxvERN
	8Vj7DfQ25U5Vysmz+MhdlQZEVmJYZeUQ/2c/DuVM8nG4vyQulwMG31vB
X-Gm-Gg: AYBFou11NSydUE2K/H73o5hDgWheb3Cy+NX779p2L8YpL2o3CSgc7gtnTuTPg3LRWRc
	N2CdiludI2jkpFjafv8cNu8qsPJkUAOGWS9BwQ2GLR9I3e/zp8eO554fiO4wHtqdeqIl7atYcSz
	QCTNtl24/z6qm8d99NRpXJ62C9qjpH7q/pghQL6QprGv/sJvRilQjGIo9+tf4hFtcLtrQLq32HA
	KfAmTMejmx7aG9bhLwiMJyfRiZpO9sYg/r3cVXwzT2SvwESP6QFdslZHEHfWe0Q+FWNeCQOGBmd
	5dC3SrYGvWLl4XZz0HnhVSSQXOn+HWnwLfYljqtN3dyarWZ0NzRq6SdzUkyrA09Fvgf+7XBuQ2k
	cJ8INoykQVH0n/9kgxsZjFJdJVMsP45oqu3cEd6nzXZN+aN5Re30m6xPW49rVozVrLhOD3n7FlA
	InFuojGU+uP08p0UBRE6yVXHPcLIvKoQ4yvbukjyknHh+Q4h1IuCwok7TpwwEy0HfYuJ8jvu5Bt
	XyEMDmZtw0=
X-Received: by 2002:a17:902:e74a:b0:2df:736b:d7df with SMTP id d9443c01a7336-2e49b6a182dmr90598095ad.42.1791201837090;
        Mon, 05 Oct 2026 05:03:57 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm6092355ad.28.2026.10.05.05.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:03:56 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Yuri Andriaccio <yurand2000@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v2] sched/deadline: Compare against the donor in prio_changed_dl()
Date: Mon,  5 Oct 2026 20:03:50 +0800
Message-ID: <20261005120350.2026799-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prio_changed_dl() dispatches on task_current_donor(), so its else branch
asks whether p should preempt the current scheduling context.  Under proxy
execution that is rq->donor; rq->curr is the execution context and may be
a mutex owner running on the donor's parameters.  dl_task() tests
dl_prio(p->prio), so dl_task(rq->curr) says nothing about what the
runqueue is currently scheduling.

commit af0c8b2bf67b ("sched: Split scheduler and execution contexts")
converted the identical else branch of prio_changed_rt() to rq->donor.
Its hunk for deadline.c enters prio_changed_dl() and converts
task_current() to task_current_donor(), but leaves the comparison below
it on rq->curr.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Changes since v1:

 - Dropped the claim that the donor test implies the curr test.  It does
   not: with a non-DL donor and a DL rq->curr the donor test is true while
   the curr test can be false, so the current code can also skip a
   reschedule, not only add one.
 - Dropped the suggestion to convert dl_server_timer() and
   dl_server_start().  Yuri Andriaccio's "sched/deadline: Do not access
   dl_se->rq directly" (RFC v6 03/25) rewrites both of those lines,
   turning dl_se->rq into a local rq while keeping ->curr, so a donor
   conversion there is better done on top of that series than against
   it.  prio_changed_dl() is not touched by it.

Built with CONFIG_SCHED_PROXY_EXEC=y and =n.  With =n the two rq members
are an anonymous union and kernel/sched/build_policy.o is byte-identical
to the unpatched tree.

v1: https://patch.msgid.link/20260924121213.106673-1-zhanxusheng@xiaomi.com

 kernel/sched/deadline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0663c00c41c0..f27aa930420f 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3631,8 +3631,8 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p, u64 old_deadli
 		 *
 		 * Otherwise, if p was given an earlier deadline, reschedule.
 		 */
-		if (!dl_task(rq->curr) ||
-		    dl_time_before(p->dl.deadline, rq->curr->dl.deadline))
+		if (!dl_task(rq->donor) ||
+		    dl_time_before(p->dl.deadline, rq->donor->dl.deadline))
 			resched_curr(rq);
 	}
 }

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

