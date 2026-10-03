Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8683B19D4
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028029; cv=none; b=XsXweXvSP024PMb2dBRLWtwI5KiY511GQrm+qmcUIfDa6PypeG9PGUem2w86tgLeQpEO7UbW2nQQ9vev8mpWrFqkvARlmMLA/gSZcJ/hRcLBBKTXt3a63vWFnJiy/AVAjYK2QXLeAhFmIF0pkFY3Jx3U3kJz8i1CTctJFw1dOUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028029; c=relaxed/simple;
	bh=b/A2+Z7kKalsD8zFgLn0jOzSXiiYGoE8qO2d8MxTI90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suazT4I/1cvJM2LyIxrzIxd2w/SsJhV7Xl935riX3etRFBd79sbyTdg/lwPsYpfCX2qKP+5aRx26la3ojecDX8gURRKggIQztgRrCkdCi19euvCAxUyWj7La83crelIckolywuWJoHE88nXgVjL4rxMqAMyfNnDlvJa5J/ZhR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvuPtuMJ; arc=none smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvuPtuMJ"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-48af51f6182so48213f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028026; x=1791632826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTgvw0EaxxQN9qE5ue6nFwoTMAeY3s1xZlnYCr6KaMw=;
        b=LvuPtuMJovTZ7zjpGbfLjya5xyYVf5iVrDJJ/ergtInaYcaIpFNplTDro/WOE0n82K
         2g/ID5M2DCQHxSZKNR7b8YVBdmQQMUu+pDd6IkEzOT2R4fhWjuiTcHjqj7/il8+mz1wU
         YIPaWCqmRVkuqyA9Q5o0AZdDvdQ5GzYuFNq8XoU1Wq/hSvoD4IAoTWVEjwPkCjI5RZUW
         2Rmk4lqs+W4860APE0ZQjCWLPnp4A3vsRR2V7eqxo3yBnjl7QP8dYWL05E+Pa6a90VUc
         J2TXv+OFboah1BpyXLqta30BedWxiaqB8MQEV7EGM/DJt60i+5vcfSzSK5+5Sr+C5Grm
         ERbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028026; x=1791632826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTgvw0EaxxQN9qE5ue6nFwoTMAeY3s1xZlnYCr6KaMw=;
        b=WBhsjKjBq+pg4itGDmvpdN+eDbZW21vpV6QEv7GDC6plYQ06h1GvylBpldGAa7FrrZ
         vYv2iJh2iAqCWb69Ui2KYSBMh1O3GKRTjdWEi0caN/+12lrJnL49oVqPE77Ka/BC0etT
         h01X7ySnMGuuq5Qh/HEln9S2L60Zg1fQpz3uK9/p/C7YqNZKo2ejpiQbtpL84DPqjTyp
         pxHleeNJoKQ7MEKs3eeNJrpbCnSaAcsJdw6TrV0l7omlQ+7Qg3ZQp0FBCCNJj8eNnzpS
         adxLpd9WxQ4eVRKbmY0E/ebrMJxnkdb3SaUn9hqH1XTGHMVnIN6a5ap3HVl/Fk5nS95n
         AtbA==
X-Forwarded-Encrypted: i=1; AKwUvByb4e/S01PPPNsRXFRZMUYovXf98V5mP4PjP97oLwbOZvyOerBcpnPSkniES4fH3rgI6NFCMFHavMEuPS8=@vger.kernel.org
X-Gm-Message-State: AFuF++k79XZLW5LTIKYSHuADWAXusencqA8uIGCopQW5QCv60byrwas2
	EMEj0aJK1dJiMGYfAQHFiSdmUwTT6s40E+OupbF9TRH7ZB89BlopJNP0
X-Gm-Gg: AYBFou3OSfCIkzAOYDpvxl+iuu7lZ9Ka6nDh3W5at/bcYhQbY1QPGRErLhUoCvcCMog
	d4rFL+7WvI8MB3ifwQ8OgG8vC6omUCRfxY7HtZc/nLNE+qlPI9dUt+uz1IZJoGigrdSOykfrIAg
	sTGdSyklZoQqZlOv03HcjYK8CmtZZmJjzKpTFeJ3e6klekE+yDHJJyGZayTsMlhnbTDvniRVgl9
	RBBmnwLhC08ILyrtQLIhdOp/WddvzoGYQNoN846p1crSNTroOMc+hSDqaEjY/4OP/1HCnYoTIku
	qxnERMt8I0KG3bFxSlG/AqJm2EsIENV5MsxU46xGskcJfU7mhyF/WzpXCbRRNwdI7LgbYcd+80J
	0/6wjzhx1484Doq42Bj+fHkm/veH0cjrLjo8XIrFLKPi5htC1lK94cqIpJvQmb7F7l8FI9LpGv2
	uSJ7Kl1puXNtFgV4XjhsN0QMyMF1J6O5eXOgTUOw35n00d9wFIvK/u5JU6D5aYh2TCy8XcIcpN5
	/YdbdSTmIPuVAV+9AQu
X-Received: by 2002:a05:600c:6217:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a027452677mr91941105e9.0.1791028025595;
        Sat, 03 Oct 2026 04:47:05 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280ceaf0sm180880925e9.12.2026.10.03.04.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:47:05 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: kayracizmeci@gmail.com,
	christian.loehle@arm.com,
	elif.topuz@arm.com,
	linux-kernel@vger.kernel.org,
	sh@gentwo.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH] sched/eevdf: Fix vprot across reweighting
Date: Sat,  3 Oct 2026 14:46:55 +0300
Message-ID: <20261003114656.105721-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in reweighting, while a tasks vruntime changes dead protection
could go alive, or alive protection could decrease, increase and go dead.

To fix this, implement rel_vprot similar to rel_deadline. Only
major difference is that rel_vprot is not dependent on
PLACE_REL_DEADLINE, because there are no mechanisms (unlike deadline)
that recalculate vprot. So it gets carried.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
Link: https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
Link: https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/
Co-developed-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Hi all,

Base is commit 4a3b51aab6e25244d97936aa65e6d5425adf98e1
on tip/sched/core.

NOTE: Christian, this version is really different from yours.
I still added the tags, hope that's not a problem.
If it is tho, please let me know.

I've thought a lot about this. I was at first thinking about
a simpler approach, but to be similar and consistent with the
current approaches to the similar problem on rel_deadline,
I thought this would be better. 


I also ran some tests, from a VM that was inside a VM that
was working on MacOS on my Mac. (This is like a war crime...)


MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST 

We first pin 2 tasks to the same CPU, (let's say TA and TB)
Then we change TA's nice value 3000 times between 0 and 10 (like, 0,10,0,10...)
We save weight and rem = (s64)(se->vprot - se->vruntime) on both
__dequeue_task() and enqueue_task_fair().

Then, we multiply weight and rem for both savings and
divide them. If they are between 0.95-1.05 we accept the
results as correct, if not well... Wrong.

I'm also terrible at math and a bit less terrible on coding
so these results should be 100% correct.

MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST RESULTS:

NRTP = NO_RUN_TO_PARITY

       Live Protection Wrong Counts
  +--------+-------------+--------------+
  |        |     BASE    | BASE + PATCH |
  +--------+-------------+--------------+
  | Normal |  6002/6002  |    0/6003    |
  +--------+-------------+--------------+
  |  NRTP  |    53/53    |     0/55     |
  +--------+-------------+--------------+

On Base Normal, maximum amount of increase was 4.49x,
while the maximum amount of decrease was 0.17x and the average was
1.64x.

While on Base NRTP, maximum amount of increase was 2.27x,
maximum amount of decrease was 0.31x and the average was
1.08x.

Well that's all. You may or may not ask where are the revived ones are.
This test does not really covers that part. 

Or as I like to say it, my computer ate that part.

That's really really all. Aside from the code :-).


 include/linux/sched.h |  1 +
 kernel/sched/core.c   |  1 +
 kernel/sched/fair.c   | 34 ++++++++++++++++++++++++----------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 7b91cae4a59c..bd9e2d119910 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -584,6 +584,7 @@ struct sched_entity {
 	unsigned char			on_rq;
 	unsigned char			sched_delayed;
 	unsigned char			rel_deadline;
+	unsigned char			rel_vprot;
 	unsigned char			custom_slice;
 					/* hole */
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 71d3c948e14a..f1241f572cdc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4638,6 +4638,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
 	p->se.vruntime			= 0;
 	p->se.vlag			= 0;
 	p->se.rel_deadline		= 0;
+	p->se.rel_vprot			= 0;
 	INIT_LIST_HEAD(&p->se.group_node);
 
 	/* A delayed task cannot be in clone(). */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b42a0ca2a69e..0bcd3a77aba4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4614,7 +4614,7 @@ dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 }
 
 static void
-rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
+rescale_entity(struct sched_entity *se, unsigned long weight)
 {
 	long old_weight = se->h_load.weight;
 
@@ -4712,7 +4712,7 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
 	if (se->rel_deadline)
 		se->deadline = div64_long(se->deadline * old_weight, weight);
 
-	if (rel_vprot)
+	if (se->rel_vprot)
 		se->vprot = div64_long(se->vprot * old_weight, weight);
 }
 
@@ -4720,7 +4720,6 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 			   unsigned long weight, bool on_rq)
 {
 	bool curr = cfs_rq->curr == se;
-	bool rel_vprot = false;
 	u64 avruntime = 0;
 
 	if (se->h_load.weight == weight)
@@ -4733,7 +4732,7 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->rel_deadline = 1;
 		if (curr && protect_slice(se)) {
 			se->vprot -= avruntime;
-			rel_vprot = true;
+			se->rel_vprot = 1;
 		}
 
 		cfs_rq->h_nr_queued--;
@@ -4741,17 +4740,23 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 			__dequeue_entity(cfs_rq, se);
 	}
 
-	rescale_entity(se, weight, rel_vprot);
+	rescale_entity(se, weight);
 
 	update_load_set(&se->h_load, weight);
 
 	if (on_rq) {
-		if (rel_vprot)
-			se->vprot += avruntime;
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
 
+		if (se->rel_vprot) {
+			se->vprot += avruntime;
+			se->rel_vprot = 0;
+		} else if (curr) {
+			/* Reweighting must not revive expired slice protection. */
+			cancel_protect_slice(se);
+		}
+
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
 		cfs_rq->h_nr_queued++;
@@ -6297,6 +6302,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	se->vruntime = vruntime - lag;
 
+	if (se->rel_vprot) {
+		se->vprot += se->vruntime;
+		se->rel_vprot = 0;
+	}
+
 	if (update_zero)
 		update_zero_vruntime(cfs_rq, -lag);
 
@@ -8143,9 +8153,13 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	dequeue_hierarchy(p, flags);
 
-	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
-		se->deadline -= se->vruntime;
-		se->rel_deadline = 1;
+	if (!task_sleep) {
+		se->vprot = protect_slice(se) ? se->vprot - se->vruntime : 0;
+		se->rel_vprot = 1;
+		if (sched_feat(PLACE_REL_DEADLINE)) {
+			se->deadline -= se->vruntime;
+			se->rel_deadline = 1;
+		}
 	}
 	if (se != cfs_rq->curr)
 		__dequeue_entity(cfs_rq, se);
-- 
2.53.0

