Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626444E323C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955909; cv=none; b=gnI7qnGGUnp2vpeZem/W1PvXywaNEeXx/qQ6ozHFee/mXaH/J+9XplQUcbXF09R6FP1xFcBn7SUUBoKujerN2tjcuACibmqRF5aEDk3BrSVi2qWToVynXXd6Qed4OELZSK0N1zWFGCnYyKcudX4YrCGTMYM/X+1NnU/iOCfl/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955909; c=relaxed/simple;
	bh=CTaQke7SU+dNOxVuINpaFMcJR69qg82aQwGX0Pu+f+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myZzyHS3EMRlCc+Dvy2v+d3juPW+k2Ij0AGdsG+Rn/wbKfbD7XtPQw7zxdTPQNqOcaSj+4Bkqe0QYphghC4zjuWqQzwz7v6Nsi9syiH6kbMTFk/lcDBKMSQWRh2+aM8CGPQCItEO3aV1acrutpFlWS+QHkzVREi+CyUm18Gwoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G73CE+vK; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G73CE+vK"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so14282f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955905; x=1791560705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCbQwEE09RLLlmPAHT5m8hX24lXl899bphgbqp3z/Hk=;
        b=G73CE+vK7/FWCvJKTVTV0SrkcykV75yEWeqz48eElly+lKOibBpI1VQvUG88daAr1z
         WDVGYgP+rSBcjm8dNFlk9Xn4ZnZHRfUP5IeiDXj+uZZTR84iWp50K8KqYp5LaOezOf+E
         pxTDZ+XiKvZeyJsQ9tx3hrBEN+o5Mrrgw5eL6JdUHPFiLwAcNtMa/XVLT9PdMRzYQYVb
         NI1LB0RO8y89/IpEaJTsJ2tb9fnFjIQYYskADge4K/cL/nnxwXvNVqdoWRGvKMS6QaKj
         Sq3S8Blj8v6i66Y0RS6zoZ5g6vQ5ZoepHcOyJeXmJABSdbd5MObezeYArdt9jH3DYEuB
         Jjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955905; x=1791560705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCbQwEE09RLLlmPAHT5m8hX24lXl899bphgbqp3z/Hk=;
        b=P3vtJX8scX0hzKmCto04Ujv0OLtbBh3QiTTGYwNZpOmzQlwf+Au63V0Khxm7QWi0ak
         Mo/DH9Nxvk4OYQ9T3qD9muPAnmBFv5ZfhHbLbL0c1Q9N3I9ncckDw3/hMb7yJM5e3idq
         Teop4w21iUelX2lMHWrRgGVmtYS68krHGt1dLK5AdCSFNza5tQZeScXq4YJXjUvEKMBs
         DgsOAmt2dGNO4I52e2P/He4f/EuBhFM+W2TqURUqzrWAN4GLfi2zaIFsIXSxZMEZwGQr
         CoU8M4P+rYlYAvgCqB5dPU+/0PfiRdP+00JP+9HHXghQs4rxsbDofb6TZH5gIRPOcXMY
         3rOg==
X-Forwarded-Encrypted: i=1; AKwUvByULCAlLp1ah0pzdgqmLastQ5JC8hPhp1GHDm1caWMuHZKyF3mt20eqoS7CGDF2ZG4ORpUBr2I1xwFKQnE=@vger.kernel.org
X-Gm-Message-State: AFuF++k5ZUkderPLLy6nLonW9bZ54AuTYvPC4dih1XKaduzF+UlWvXrw
	CchebvA1lx9No639K+gXKg+A4SzRJBCrrgm4T2L02xnVBQkYtryu4M8y7BWez/iuWO4=
X-Gm-Gg: AYBFou3hG75bkJDgt/tGHXZgUDWFvxAznXF0ugo7K7j1mqUuB2U8NNXC0YgQdU+iHV8
	n+N+HOHHWnabwQUNq19LUVRIgNwK1vNNscJR3LmjWhvCREywJZfY0XwglMlS2eQeso+Kgp2USmR
	NQxhPjD71Sp7ee05vMcK7JyUKpNqVXlczxCjfGDFwm/5QJCrEnaNjdKhaywq80bgZIFM7g6JYIG
	eSA2obgaJ2DeijfBZnZSgzWx2mh1jWnvvqtzpR3TIwHrg6tZlWgqmdOaBynkNN6VvG819LjfJv+
	qS/kPcD7m+ve20XzUOn+w+w1ASa8tnGuCtznrlQWdkxjuiak0B6ibxsxxM/8QPHvJSXxmmfVOnv
	x0mCnACffpLrSzui71uY2klBGUtEYYgMA8kHDaGDIcSLsf2YyaTZfmNfoxCMqjFqAF+XZ9SDGcd
	YQGxf3rUAXDguOY0GDkV7Yn8nUx5Do7ptXTw+k3GAnMYHmUvIlVw5dqoRZx5EJoPkJlTzG0q97A
	8c7nUHtZ8auAAwa
X-Received: by 2002:a05:600c:3b01:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a027573634mr47267725e9.25.1790955905339;
        Fri, 02 Oct 2026 08:45:05 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:04 -0700 (PDT)
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
Subject: [PATCH 02/18] sched/eevdf: Reset lag when waking up on idle cpu
Date: Fri,  2 Oct 2026 17:43:59 +0200
Message-ID: <20261002154415.2270586-3-vincent.guittot@linaro.org>
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

When several tasks wake up simultaneously on an idle CPU, their final vlag
will depend of the ordering as the first one will lose its lag but not
the next ones.
Reset the lag when the enqueue happens while no fair task has already been
picked et set as the running task.

As a typical example:
CPU0 is idle
TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
Depending which grab the lock 1st the behavior will be different:
If TA is enqueued 1st, TB will be enqueued with a positive lag and will
be picked 1st.
But if TB is enqueued 1st, it will loose its positive vlag and both TA and
TB will have 0 vlag when fair will pick a task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 17 +++++++++++++++++
 kernel/sched/sched.h  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d7cc77181ef9..32d7077ef148 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -592,6 +592,7 @@ struct sched_entity {
 	u64				vruntime;
 	/* Approximated virtual lag: */
 	s64				vlag;
+	u32				vlag_seq;
 	/* 'Protected' deadline, to give out minimum quantums: */
 	u64				vprot;
 	u64				slice;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8cda1d39b037..4c8f12fc8869 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -893,6 +893,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 			vlag = min(vlag, 0);
 	}
 	se->vlag = vlag;
+	se->vlag_seq = cfs_rq->idle_seq;
 
 	return avruntime - vlag != se->vruntime;
 }
@@ -914,9 +915,22 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	rq = rq_of(cfs_rq);
 
+	/* You can't claim any lag when waking on idle CPU */
+	if (rq->curr == rq->idle) {
+		se->vlag = 0;
+		return;
+	}
+
+	/* Accessing remote rq task clock is a cost */
 	if (flags & ENQUEUE_MIGRATED)
 		return;
 
+	/* CPU has been idle in between so the lag has been removed */
+	if (se->vlag_seq != cfs_rq->idle_seq) {
+		se->vlag = 0;
+		return;
+	}
+
 	/* Compute sleep time */
 	delta_exec = rq_clock_task(rq) - se->exec_start;
 	if (unlikely(delta_exec <= 0))
@@ -8190,6 +8204,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	dequeue_hierarchy(p, flags);
 
+	if (!cfs_rq->h_nr_queued)
+		cfs_rq->idle_seq++;
+
 	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
 		se->deadline -= se->vruntime;
 		se->rel_deadline = 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b98084e1f5b0..69a2a749e188 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -689,6 +689,7 @@ struct cfs_rq {
 	u64			sum_weight;
 	u64			zero_vruntime;
 	unsigned int		sum_shift;
+	u32			idle_seq;
 
 #ifdef CONFIG_SCHED_CORE
 	unsigned int		forceidle_seq;
-- 
2.53.0

