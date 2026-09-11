Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD002373C00
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142586; cv=none; b=r2y3Z7p+FmsHS/jUYT82g0UXm5qpHo/guZxKwcufnp8Z6gUSjzpEw2tcigNImCmw9K5FUI0pITCILBWax8vA/HSBu0OkwWFYgLlBsxBbpBU0uhHAWQic5uD1Cg2HmbZ5cqJgi7qXsMbONqs/n/CWtynqjRl63E3UCB3b/0ejQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142586; c=relaxed/simple;
	bh=gygY9DC5JBfwtE4QV/GX6r0b1p+ykvOCLmqIMFj6Kfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+cGWgZaM4+g2QlwIe5gBvO7zr9ncWovuDL0ss8aSgQrYuU1vqHvJAlwGBEXU0KjOFQjSRfPJht0QVDU6l3O0xM5N/ZPf0SJh1OpxRtFg3H8XKPirpdi6WdklmU/0ZoQrUKhA7w0/zFlXJeXxDKDYTAI0bAxffe2zXJVzWmdisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8fecOp/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8fecOp/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499de29beb7so58855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142583; x=1789747383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4M+ZeF4U0zMvkqJbgzYCvvmJpt5vuj89qbR2+8SZdM8=;
        b=c8fecOp/ORhsZWU7bjjPdFho4fyLlb4jyrKcwdN3pjxUIcB2gzI95CTkWaldlVEWr2
         MRHGs2HQTchciWPDILizX8K/l1WP8iJNNMDAc0VPgTvUredEI/O8nEWuBGTLBhgyK2eg
         4UnlMO2KW9ZjjyO+dWwyW43fc6nNfYZU9xhmMIqbCGEEAsy/6gpk/G3dY1Ympdt538og
         dDKxpAW33XOmpS/aBYtR5zmJvcVkqLVLrWdibzrf48isakJN7ZzY9w5Cap2dDdSwInox
         lljipfJgrLz8wa3YegaLwZ0ThzquH0gJIQlsmo9BWlkO4j/zC/ilyyTp2AgGblCox01h
         GqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142583; x=1789747383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4M+ZeF4U0zMvkqJbgzYCvvmJpt5vuj89qbR2+8SZdM8=;
        b=HqVGXl/necOOfw1f4zBKInFY94ChIV0PcQsCf8gOTlMDpJbT/ejygd4aFBL8jM/nbz
         2zC6r6kgmrCL5YtBSq70Oko60GG9A3UrxwscxWUSCLSTgK2TuqlH4BQXCeSeAXTsluAV
         x/xNsaF3+KQBZZ7Ooiryqxmp0iZ3Sng6/R9yRq/gWBChyQVyspPdC4z5n5A3NFdQmoyp
         MocF6atHItsmFeEaStRPctP6Y1PNRodH5Ct9PGLG9bJXUzg1WWlBvNcqlQbXHrOXBCWE
         oyZSldEX77YJvpFidY70ez6Tdy0szOJmcC0CMFwSAvUCq9gik0PR4MXw8KLYnDmdnNxV
         WbAg==
X-Forwarded-Encrypted: i=1; AKwUvBw01fWKEUzrvfmXln2IgjorvsqYwVaSnWdHygpkn0Gs73gzmhtl4DIlfAdCT6s/TlSvED/d4ubYyn4hb6E=@vger.kernel.org
X-Gm-Message-State: AFuF++kJGKSiOeuA1KoNuU+N+R/OELZbTJE5hhtQdRc0G6rYTTVaw1v4
	8sJWi586F7Mvp6IXz+O+6yAyPVknsgGBcQ0IH4g5yr6E8vpYQUBj3Fl/X3fzSLov
X-Gm-Gg: AYBFou0PfegPGVrzKS9SkOw4kAPmHwwZKfb2irdHL/crBm7rEqcSiAejK78DnL/0pJD
	sluHd5KUMEZeHUAAsmhDAhxzYr5GC+iI9Bl4kM1yLDtLs+MkpXVGISBRVID6fL9YAqNzr/m8CRW
	3hbxIDhCPmG/Y2VoYgN78fH8bXu2SbmATf2GTlZhYOAEM2SeM7DWH0P82nj0W5HnH0GKJqZtPmU
	yQ8F3WYopS6zclEv+BHuJaaIUH3qWIPGhOpd/GVb1xHol8OLbsJgVXAoa/JVCj6dCI8EIIFEDS3
	wmFsSbRJ9LqB2vHPo1r8ec3ZjvukfJujHKc2HcSvsO3etXnVFVHj5B7RqmPIJj1ywHuaO5pq886
	8RhGrmB5CNAfsa7PxdpUfp6ZeLamylzB8jo8olSc4ce1Sucx6sqHQPljSvkiggxZzOxUlxqj5tq
	Gui/O6wv3ydIeCfoj5Fc9wiGXCF5UOuw79Ke+JlqGmygAaSN4iI4QrIMA7foY/hpjkbT3rEvgu4
	eKQDHq3x+mA3wCp21cA1A==
X-Received: by 2002:a05:600c:64c6:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49e619de4b7mr51620105e9.1.1789142582687;
        Fri, 11 Sep 2026 09:03:02 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm7208066f8f.7.2026.09.11.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:03:02 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Date: Fri, 11 Sep 2026 19:02:52 +0300
Message-ID: <20260911160253.1249960-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
References: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
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
Ah.. 

I forgot to add v3. Sorry of the other one.

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

