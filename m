Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3E4F4CFC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955936; cv=none; b=unDIs5qCubkUiOga3lhrZg83vsRkP1Piz+sAA/Z2hihHQrLw6Jo4TKaoDM1sjyTxcnKAjkUVFayVnXC7L3Hi8mKkT8+YTVdW39reOLT7OfhWJr6EA5AsAlCu3vrWb67xV6epNnRu/9hvWNyT78yfHbaNNitp7zEcnC30YM7TqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955936; c=relaxed/simple;
	bh=ggoTRpIipo8tqYS4OC5rdC9P6GonVqjlFQkkxo9kZmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmPin6hkDs3btXWi1HiB+I8AoQMyIznS0tPwE2Zm1YmEo2rSZXt7d4kAdhTHWGR/GgImWhsZdrk6mbyLvWG9bsDWfT4TEv7doiluoJwrDN5ikJzn8rabsicIXTLbHWm8b2QKTMyptKNPDvU5NuClQA7Mhuu23vbRksCh0bpxHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhHLfqS6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhHLfqS6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso340575e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955930; x=1791560730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+9o8MqrHYpJJITgMWl7mhC4JEDEuTdaJ3vXHPZaTZo=;
        b=zhHLfqS65QYZtpgjTDwgvC5wEtkTS5jmuA6hyQs44qa5zPlp4nfvbjgthN5TbUKxTk
         jDCzokOIoX9H5q7sy8BxS2mD35SOmMySWlFdMcUpjAVjISL65jjb17VO7A5KfE6b1+DL
         EIec452lQGpiltfIPVTg2pe8j6p1L2mngJKoTsGejueE9jXSLILHbuiBa2QYhr2bzdON
         wiwoLqdH4vk75SOISmD/rkX9RWuzuFR9TAfdZg5xXdf8SkVKcBcRUGaF4vxjbzHyJ3zn
         WajYkJy9SfB9FH/Z9rYs1+SarC+BjHiP3S/lm7p88uH4qoSGYWHdC/bwTY+EAbsMfOgg
         A1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955930; x=1791560730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+9o8MqrHYpJJITgMWl7mhC4JEDEuTdaJ3vXHPZaTZo=;
        b=FhStnombmObQB8NQhzBdXfLNcbvSJV2nchu3hyMNnNeXq1rPHrRYQ7fGl23Fexbkto
         prRmwcozvP5rOBF1a0NKBGd9J76oHJOoFFPAkQy65VfpPtFkPVwrqW+rxQ4BX6Eh8S44
         ID+6aogwecWtP7je8HpC1tFslVoDm99HSUW4+Sr23HhIsWefbaXimwEpPUBiKrOYS431
         yQgv9Stmpck19+MqV2D9SNbcSIbd0gSa475ywBoy+QXbkwm/KoY6rOh1tAzLNo2JXpEl
         Tnqjv2+cwoAnmM/k12hYyVQXgvZrA2Sb5w9XOYJnGOmu0MqEqMQhxuG0OkVfHwATrKNv
         dcmw==
X-Forwarded-Encrypted: i=1; AKwUvBw2L5TC6mck7cvGODk6GGtAXGQgWtz+MlIw8wz+sBbXbkUx31N9CwFNS7FK69AjStrThuNTHzljYKpmuLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mLjtIlHMTgcyQZhYzcYkK370gxtK8CiYtqSsla8vdWJAthXEGM
	TrPlw0zAArbN0rjJyBYlQL2Kf1Mr/uqHPsOUpaLHh2Q4JZrZBBxrawP847lxH/cvC/o=
X-Gm-Gg: AYBFou3uxBKnoh56X3POyThiMi8r4//4lWbEkj6RqO7Ax+prEvO2AVVHfwSxydfwQOE
	eKcSGMqfD7S3E4l3Z4ZnbXhkjNG4Df5uxL1W1AmtlDTbVdUoBWff3BpACcGfW1mgXAhIIedn016
	euQtHZoCM0cgYdRRnU1lJ3xVHSlBzGY+lIOPiQgCn2owT2x9vX3EQ69NR7hELqsxHqprD9r2RBw
	6JhpRf/EHHjSIgnEXkZ2wS00Jtg11418Rp8IehC08RcIH54muijfst/0FbxBcDs8zWWcXVwxPZw
	GGp3eq2sYYRE7NRRdRjRZzgYCV9IvsCpOPsd+dgKbi7EA2K+FnW4yfBotfI9cwEQNrpeHviCWnj
	NabWYBiGTUi18DCxeaSMiiJ23c7UbvBr4p+OL7gTh2j/zfco59PhRp9Bju4+Q8bY5FJZnE8iw/k
	ugTL/75I7cpTjgrmqm3f6bUzeNY7ocSvX+Q5a6tJJgOqMKN+/kXdThj09cDT2IB1LhxpYucgxyE
	VMPKHMX0+8oDtu6
X-Received: by 2002:a05:600c:46ca:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a0274f96a8mr58318145e9.1.1790955930554;
        Fri, 02 Oct 2026 08:45:30 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:29 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 18/18 v2] sched/fair: Take into account slice in EAS
Date: Fri,  2 Oct 2026 17:44:15 +0200
Message-ID: <20261002154415.2270586-19-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the cost is the same, take into account the slice of a task to try to
select a CPU where is will run first.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 94554f165f42..d60bb6db4ce9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9598,8 +9598,17 @@ static int check_cpu_with_task(struct task_struct *p, int cpu)
  */
 static bool update_best_cpu(struct energy_cpu_stat *target,
 			    struct energy_cpu_stat *min,
-			    int prev, struct sched_domain *sd)
+			    int prev, struct sched_domain *sd,
+			    struct task_struct *p)
 {
+	unsigned long task_slice = p->se.slice;
+
+	/*  Select the one where you can run first */
+	if (task_slice < get_rq_min_slice(cpu_rq(target->cpu)) &&
+	    task_slice >= get_rq_min_slice(cpu_rq(min->cpu)))
+		return true;
+
+	/* Favor previous CPU */
 	if (target->cpu == prev)
 		return true;
 	if (min->cpu == prev)
@@ -9762,7 +9771,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 			 */
 			if (target_perf < min_stat.min_perf)
 				find_pd_cost(pd->em_pd, target_perf, &target_stat);
-			else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd))
+			else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd, p))
 				continue;
 
 			/* Save the new most efficient CPU of the PD */
-- 
2.53.0

