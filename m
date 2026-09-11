Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD6423EAE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142118; cv=none; b=LVLhUoGccxxtu4BE4hkgP2IuXhn8L7bU/jBUS/rDEk29xUKQmf6JgroVGQ1V+kXvtDc0YZeuw9+nyJop2A/PyUalpQjLxVOjTitsWarjGCw7B4jbX0ci5BloXPBApVnnkvSUgaYuqQj/NbglwVgEMhaJK8a5yq0uI07YmuuvaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142118; c=relaxed/simple;
	bh=grkEIWkrYwr93bNbtIkgFN8aezqY3LPouLt4mIOwZic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUoKipYPz0xltvEA3nx1Nf8y8Cph+vljiYcqmmF9lNjQoxX/yi234WYbMmttjd2gn/XUzm2mfqS2ZHQ//1fVrlMBwj8/ie7fIAXZqtoN7UZy4obauoIQ1t0BdP7OqpkZ2eTNQR+D7TzcStQXgGTN5RsQbYtbgiWlXLlKq7Gi70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bimbnIIQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bimbnIIQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd82be878so56705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142115; x=1789746915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDMhYh34IjoMccK7nculbt09zuX0V0q8M7HVDKmq9FU=;
        b=bimbnIIQd2eJPUoUu3yHZj0YhLuUk+8EMFtRFws9oh4V4zq0l33YLj1nIG1gQWR9Uc
         1grQGM0M1qCNXN9WaSvXmY9uRhzIlH2LUNACHOrn01C+i54BDacJEtapk1QLo68H/Exf
         c4upaB10ilTIH54Aro//zf6Ixh587Nl6TNGmRV+v7S/kmJi33mPlQXJIkHDiUCBO2M2E
         /eOZ7gLI93R+QHHF9eSAbheZYoaLKBIUkpvWMJQWyZIDqELf+xvGI0t9+qhWeWuR42HD
         srhk+yQkP3prXVl4+XgLKUNEgqgh7WC9AbxbWW4VyZWXPuyppgF6ZQIlKosSbVpe6lva
         4L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142115; x=1789746915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDMhYh34IjoMccK7nculbt09zuX0V0q8M7HVDKmq9FU=;
        b=XXOSu85f1ILpze0eUeRCgDNl0H9oy+w9QNylBww+YOJBC7EhRAkTzlZp2Mn80HJ/Aw
         yIxOfickWGL1o/EAQW85QWvN6kxfzxBEvqPNSTU2Fwf0ui82xq3gxM0VIQbNWdXUcchf
         wCoJ90mZ3axVN6GNBLSHtRHLwI1BYG76wbPpo4DVR4yFlIoC0Wwsq+f/s9rx77ZuY7AW
         f+en0rv9X8L4IutWcujYmA+I3cTOpIJD63l5femeTa/AXbQafQHPpbm5W+ctUB6z9dtA
         W/X6yT/dfP9JnO2EPUfHJidajCVSmlqos3iBjbFuyLoUMPpohitYpB+BM37t4Zf2t97x
         a7nA==
X-Forwarded-Encrypted: i=1; AKwUvBxd7JuGlgxa8G7Ukb6l5QZDgbuQWafJQutyk1W9GBPwoJF6zju3OBKYLV2nTSgFx1dk32hKhRBOm3qmyII=@vger.kernel.org
X-Gm-Message-State: AFuF++kILy5huHuGT4tdI//9SULIRQeMxqELjBrz9SIWhLr4mC6KmAmn
	6BEMkF+9Po6ccRNqv3n6XgBqnynLt2+JKS1Lse33NxhQuEn372poBXZr
X-Gm-Gg: AYBFou1tfaTwV9Uq6Q/UONSIxBiMX1CtUyWG7utp/XvZonVNP0mqrggFdks8frVnEOd
	3Gb2HY8XQxrHJS7VO4OYM5YgZRs1qZI5SRGBuRQrz2WFjpCugpPo3+YzsKtunhVUXbbwM5hjOrt
	MNn80ziK1qjCZtG2hf8JsuP+OFaj8pqoEY7TsuBzbkPkdRpmjQB4sCpVA2d0ISEYC2WpY3J0/si
	4qKgcfGITW56D1VpdUgVF0dcSDw3NJogFDU81rUFfiwHHYDTikNbZKGautujQAJpikRd/UzLtmA
	YnU0BpGF1UOAiUK9LYCSnAztdKmAo/OdGFA51HVS2MKBaYbGdLALyean0IhdsffoN/aiaPEcRhT
	EW+9LcX1sYPu5r4CJamkyHX0xWAASILv3Z0R6I0LRPM+LdHXjVC+BCd/wzj/DAg/02Uk9rCAQ5F
	FlznBfFcJjlZoE8siqGAEyttVAmBKuPPFKDoRmVoijMicndRKAqFqFIrsIAtPAFSD0M4kSbq774
	P3I0/X+/Ccw3LFzP5Wo5w==
X-Received: by 2002:a05:600c:4712:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e61643939mr47918835e9.0.1789142114438;
        Fri, 11 Sep 2026 08:55:14 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm148768425e9.10.2026.09.11.08.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:55:13 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/fair: remove dead code on enqueue_task_fair()
Date: Fri, 11 Sep 2026 18:54:48 +0300
Message-ID: <20260911155449.1249726-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cfs_rq->curr == se path on enqueue_task_fair() seems to be unachievable.

Remove the code that depends on this cfs_rq->curr == se case on
enqueue_task_fair() and bool curr too since there are two possibilities
and one has been removed, we can proceed directly with the other.

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 kernel/sched/fair.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1eceb39b8..440e4fdebe2f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7985,7 +7985,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight;
-	bool curr;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8014,23 +8013,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
 
-	/*
-	 * XXX comment on the curr thing
-	 */
-	curr = (cfs_rq->curr == se);
-	if (curr)
-		place_entity(cfs_rq, se, flags);
 
 	if (se->on_rq && se->sched_delayed)
 		requeue_delayed_entity(cfs_rq, se);
 
 	weight = enqueue_hierarchy(p, flags);
-
-	if (!curr) {
-		reweight_eevdf(cfs_rq, se, weight, false);
-		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
-		__enqueue_entity(cfs_rq, se);
-	}
+	reweight_eevdf(cfs_rq, se, weight, false);
+	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+	__enqueue_entity(cfs_rq, se);
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
-- 
2.53.0

