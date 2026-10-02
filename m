Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A594EDCA2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955931; cv=none; b=lsj9h76DfVAUoAdq/e0S3s6FrKnzMNq8gGyKOUt1jC4SnXajnbVvxxHdb1wnni6fa+3adsi6eedunwr/hYLgPpEUowLttQVHeq848CBZHggOZOHB+oVjUWNrh5IlUkapQY4WOhzjhUn6/dJHRD2bDmsadXmLUvAfmqqEDSNUcws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955931; c=relaxed/simple;
	bh=CeTHB4ypLnb5H3d23FrgyQcrpY2y8roNeeEMV+cxjyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hb33yWFqc/b5ypU+1q7+OvbVngPDoLnppxoBdn76r9pSFkSR9+2wTgOYFcAEwQ+ETVbW2JfQ0isk/q79P+jAk+rmnQ37kaxF616J++RcTxht3hhaPpsNuNK30OtzmUcOchbk6NZBsStDABYNiNPAEGb45iGLWc0qk650Zx5aZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HB446zzV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HB446zzV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso189945e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955922; x=1791560722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZjs7e//iaMUq0DbBBAkyBGkWfGjYDHq+81y/lPHXV0=;
        b=HB446zzVAK31YlA23DKZGSW+unxN2agRncqN8pZ8aqyMcPLjQLhwDr4uxuEKyUh2V/
         vLK8Sma5TkDvAd3JQfWR2dm5QYpfL9hUOwJa+QGEf9UmF5AMFWli87nljpDrlSIgCb0O
         2ZZv6jpz21wxBPPgIgSjHkxlHkwEq6VkfB5rheVbz8/8tJHVfjg2WTxZlSopesI0DBhG
         T0e2rMipBeyXcjplUKxlDGsmLqBM96Ds07z8TIqDDUhOe3YcFg0FRppYcMAYUStTSbPO
         QaX0npVGIdf/Vtt3GPh5V5lTkjo5QR4qmV08V3v98UzZ8vD/hi6HPja1W5Rgwi+NEtaS
         uoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955922; x=1791560722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZjs7e//iaMUq0DbBBAkyBGkWfGjYDHq+81y/lPHXV0=;
        b=TWjcx0SIs7W5QKQb+o3eRhAeSzIV2EDwvsZk3+/YBUGG4z8t8UTLCt5dHW7kXbgGs3
         lCHB16r4mw/C3lIF3KFBt2uhGVs3DyjMd0kOMzSS5gfZrR0z4Hko6c7LdrTLMZ/kCcih
         tFBEEEtoZdPeLLU12MdNiTmdfZNhxbDGfCCBxAaMYf8iM6zYfIAY/oead4yWeiAlph86
         3DJzphMO20KwroCCf16A9df1qoSzYWasVvLlEPaElUk63UTP8SnCHCc3dkvLfI4t47s6
         l8QwBOmqvjNXJh1bqmUEIDfUpCF+gkrOXyCWSEp2CzY7JP8OrudaA1pEZYNtG0yW9BO+
         x0xA==
X-Forwarded-Encrypted: i=1; AKwUvBzGm5+3z6r6+x9JMRfI/7cJGjw7DpnIKBILBFSFsPU7o84UlcTouv5tQw6xDfjRVBR0i78k6rlp/RbcI3c=@vger.kernel.org
X-Gm-Message-State: AFuF++nDfSkUd9fB5Oj27kLIfdNKKw8362vT4phESsms8Me03B4U6KGe
	06zzj6FRDr48vidaJfW8mm2gna47ZY5H+bcohOnnY0mYjyqRj0F0+1vh4I0q/IxZfh0=
X-Gm-Gg: AYBFou1+4lBvCmbnBjkNnj286M6/PKDKdYHheOtokdtK0XCPAxt7Yhai4LPAoTxIvOc
	xlf6b0SeWGjfTJB26Nj3+tFR5cYsmej3wf+UGH9bYZtP6t/SKOLviQAwlCdK9/tiHuUPU2puGLk
	Ry/uu+Slavfq3cAI+NNcsp6ff2pxKHwdzLQMyA5WzF2pkY0r/qAuwYg0upcqRGQphKPy1KeFKpm
	3bPvFWmQziAOD1/PFH9u6lk5DDa/F/1cwNU/ldd36HWoLJzSRmu8ETe9i08SAzcHieRPfWfivgv
	Rkz4JRBNXl0Mdz23oigfCSnIwmTO51dIGra8+YCMi+l9qmK27d+SnJS9wNtIvuJPC+ztwa5Kuc/
	bL33YCJr4KOdgJkqHbQviHM7qINDHtHKNVSFWHmAmKFHzKWi8IT1sy9+WEs38DHiS1r4Y5QtHHI
	004LKxNqnYuBaFucJBmQ9BLHKR/+quqNQcDyrdaLPeXzNHktNNnvoCx32XijGooztYixJ8RVRL+
	Yo3fOGzMIexAES9
X-Received: by 2002:a05:600c:230b:b0:4a0:2533:c8b7 with SMTP id 5b1f17b1804b1-4a0276c6176mr42183355e9.35.1790955921951;
        Fri, 02 Oct 2026 08:45:21 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:20 -0700 (PDT)
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
Subject: [PATCH 13/18 v2] sched/eevdf: Push short slice task that are not picked
Date: Fri,  2 Oct 2026 17:44:10 +0200
Message-ID: <20261002154415.2270586-14-vincent.guittot@linaro.org>
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

Even when set as next buddy, a number of event can prevent short slice
task to not be picked. Add the task in the pushable list in case it is not
picked so it get a chance to be pushed on a better CPU.

This can typically happen when several short slice tasks are pushed on the
same CPU at wake up.

If the task is picked, it will be removed from the pushable list before we
queue the callback.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 186f10173eed..cccdc40b8a24 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9981,6 +9981,12 @@ static void fair_add_pushable_prev(struct rq *rq, struct task_struct *prev, stru
 		__fair_add_pushable_task(rq, prev);
 }
 
+static void fair_add_pushable_short(struct rq *rq, struct task_struct *p)
+{
+	if (sched_push_task_enabled() && __check_pushable_fair_task(rq, p))
+		__fair_add_pushable_task(rq, p);
+}
+
 static int active_load_balance_cpu_stop(void *data);
 
 /*
@@ -10419,8 +10425,10 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 preempt:
 	cancel_protect_slice(se);
 
-	if (preempt_action == PREEMPT_WAKEUP_SHORT)
+	if (preempt_action == PREEMPT_WAKEUP_SHORT) {
 		set_short_buddy(cfs_rq, pse);
+		fair_add_pushable_short(rq, p);
+	}
 
 	resched_curr_lazy(rq);
 }
-- 
2.53.0

