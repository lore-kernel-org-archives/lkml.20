Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978409;
	b=PcT0JqTLF/fYFMlLLOXQlo9rgvqbXlluXDw5zZX/+JQ47cM2V6zIWa2Gg2nvc3Qa7Ybe
	 fwS0591ohd79CvnaeThkljkUs2KmvcjeUGIhTyNkWG5KEQJZ3EClgY2TRFgQGzVaoIBEA
	 VYWvFcR7rFiXiCuxp+hzxTeOFeaQhlBxkZiU4zUgWjhuArTbd5g/7+IDl4o0PhluBcW+w
	 qO8i5fbFKW04bAq7zfzLQLLOR/N1YOzDZwCzchVYq2WWcL20TvwIxOdP5pvKGAbVV1mX8
	 e+gDKTgLaaQ7Do6sMDsOzxzkWI4btFwVYQra4XwVOn5te/fIy7mvRWm/3tA2IA++h+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hgP1RfWkzsd+DjtzV4UbJ47EPKUkaZ358Ml7CyDptEY=;
	b=ERSMd3kQYaRXlr0Z8BLlXewBkclO/86UhH/hrlOqT98A1I4S0iK0Xqz5aFm81BtM/fV/
	 Q4SkrE3CzXn70RBDThojl2g/M+c78yLhVS6CDLNbH04XWxnIQq6mtenYcFY0MHEd2xWFR
	 J5gTTMjc3xFVVsKNRda+Q0nBTsBtKvbUOkECExeOIc9w5OPZ51aC81jqDycQrkT2PfMAt
	 kKtrxEE4sSQVgezTU3mMLOICzAZNbmuk0BuUMA97eCVzw8DyX4XEABd/Oht14rwvmyUZm
	 JMd47GjeVyDI6NJNlPQyn+yfF70VFqTmol77zJsvAj+/f5Sck+w/TOfehx2ei5WTFEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bXGz7mRT;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8741606D80E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8741606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bXGz7mRT
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso552320f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978407; x=1794583207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgP1RfWkzsd+DjtzV4UbJ47EPKUkaZ358Ml7CyDptEY=;
        b=bXGz7mRTZWmNRo0YCRJ374sGZEkQpwGUN4qyeBlm0muKQGAAg63Ji19QaTScqucXaE
         shckfsS8wRNlwrxIXO5o3wInb0oJEKo9JPYU4ea/D+NI/F2pBsrDcs5GRPf2l4tQvecP
         /DDuvIbiRoiE2V3jAMKtsIIDOBFpZgoERH/aboEMsGdXUT5kUKTr0MRCQSAwpHz/gQNd
         ogknyxZpcLtp0E2kx+AUtp285q5jN9+20HBBXh7KEWM7NURNJ7hKE/j18ENA+0ucx1Eg
         1h7Rkw8Hgwz+QPA2hNlYwVRI/IUCrmyZEb0/6kwHt0sSAj0DXerMOmXp5dZaFYGrbWna
         jA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978407; x=1794583207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgP1RfWkzsd+DjtzV4UbJ47EPKUkaZ358Ml7CyDptEY=;
        b=2jcD6/jNgldPkJpP7G6kNjpxP4E5Ex7zTQ/8LL7TmrCGL9s0XOXn/3ez3Y+C0fArQI
         WtGbhQF/BLA+Nvbr9bsUqrZS+X1nYhtm9moF77MgluF3Ti4sVfNS4oHkKA3YvQ610DXF
         CIUJfeHtbbrPbJuomFm+ipC6g/Yoa6sA2B7Z009fa+OlF1H5fZv5nTIgZjUoAD2RGG2U
         1cBrlYsyyo1OXTPL2DZLChgK5O/tQpWCbK60TRmdo1PwxuZZynosdZFsBxLAsX7ZofZo
         jq/1ztCJy+bJHW1iBFSNGoCRWg9gfwJwGmZGtrZMObYy5+GSARDxoes2wJNk18k9fjN/
         +2MQ==
X-Forwarded-Encrypted: i=1; AL+hErEnBQr3MX1pIUPVlJy3217UekWrsqU0U1AwTz20a36HXE3XV6hV6cQN87xNm3D/cDDJpXP9jcI2jFHbM0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I4iG5X56uiqm2XPAcuPI2cbCzPlX760vTqtAjYi7uOnBUKV95
	MdUqW76Zf12EFS+lXlFPeKP06rdeB3TQQWbRwBL0Q0FuP1dQZYR3FjEHOWfsyL2XOXI=
X-Gm-Gg: AYBFou1u+5y3dzOpcOzXwy5Ds8PbvnWLg9/qAJro+1mDmMoCAgr0vzAxLAwA3r0nPnT
	veZvyaHGa+O1TGiF17XtodFu4S0QnfeqHRHruzhqrwV5j99E8Wao78wKymn+pPd7o5MVfMmMPGU
	ZYWdTMirsNAsl5tAYt3R8BGD6AHieUiRJpSk4wQ40T+3KH5XxZ8/h+pF7rQpqQ0Ug8w8QzzfCTX
	iigAn35/eCQNnowL39up8H8UfJg0rHXutAKdEaMqyF6oD0WDasRdxAREcE3L8eIoJD5I6oc6usX
	H7EjVOtIRGJhbj8OOkM3c0m4BSdNpk2xc2J954/dDx9mfTVYB7icvpDkic3nCxGIxZvxGeD/Jzn
	qOoz6kvEVDYLV0TqWEaUx85qWpQk0Nxs5sqTCLPy9V2VSY3PpFFjtw3h9eB9L5/Vp8mkTQMy1tE
	X5dh3nkC+nuMmG83ButNaaDiEY/wSdGdy32jkHNbkNVYwegvgnl86KXRPq/r1SFmxWDz9399zuc
	ylrRzf3wMgQIy0lxEqlV6yOomTDZbFSXMITdq+nOJvkomiJFot6d5+Jev2q7pdqv2S3ocrSMqWQ
	3siGwF4iW9+2yUAFD59DyNj0UGgXkH4yCLHAnSkBzkaI3brkptwRc+fClrvLyysrOJZ5
X-Received: by 2002:a05:6000:990:b0:48d:f160:efad with SMTP id ffacd0b85a97d-4911ad38a5emr11827296f8f.30.1793978407281;
        Fri, 06 Nov 2026 07:20:07 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:06 -0800 (PST)
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
	kayracizmeci@gmail.com,
	tim.c.chen@linux.intel.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 09/20 v3] sched/fair: Optimize push task mechanism for fair
Date: Fri,  6 Nov 2026 16:19:36 +0100
Message-ID: <20261106151947.3991524-10-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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

Instead of always unlocking local rq in order to lock both task and rq
in a safe order, just try to lock the task. If the task is already locked
by something else its state is probably changing and the conditions used
to add it in the pushable list are probably not true anymore so skipping
the push sequence seems like a good choice.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c  |  4 ++--
 kernel/sched/fair.c  | 44 +++++++++++++++++++++++---------------------
 kernel/sched/sched.h |  3 ---
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1096ea9cbc4c..d71da9069218 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2589,8 +2589,8 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  *
  * Returns (locked) new rq. Old rq's lock is released.
  */
-struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
-			    struct task_struct *p, int new_cpu)
+static struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
+				   struct task_struct *p, int new_cpu)
 	__must_hold(__rq_lockp(rq))
 {
 	lockdep_assert_rq_held(rq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e37f8b55a293..e2999d3f88e4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10148,8 +10148,7 @@ static bool fair_push_task(struct rq *rq)
 {
 	struct task_struct *next_task;
 	int prev_cpu, new_cpu;
-	struct rq_flags rf;
-	struct rq *cur_rq;
+	struct rq *new_rq;
 
 	next_task = pick_next_pushable_fair_task(rq);
 	if (!next_task)
@@ -10158,38 +10157,41 @@ static bool fair_push_task(struct rq *rq)
 	if (is_migration_disabled(next_task))
 		return true;
 
-	/* We might release rq lock */
-	get_task_struct(next_task);
-
 	prev_cpu = rq->cpu;
 
 	/*
-	 * We need to release rq lock and take both task and rq w/o
-	 * triggering a deadlock.
+	 * The safe lock ordering for task and rq is task 1st then rq but we
+	 * already get the rq so just try to get task too. If task is already
+	 * locked, it is waiting for the rq's lock and it is about to change
+	 * task state so skipping the push sequence in order to speed up the
+	 * release of the lock is the best choice.
 	 */
-	raw_spin_rq_unlock(rq);
-
-	cur_rq = task_rq_lock(next_task, &rf);
-
-	/* Task already migrated */
-	if (cur_rq->cpu != prev_cpu)
-		goto skip_push;
+	if (!raw_spin_trylock(&next_task->pi_lock))
+		return true;
 
 	new_cpu = select_task_rq_fair(next_task, prev_cpu, 0);
 
 	/* Task doesn't need to migrate */
 	if (new_cpu == prev_cpu)
-		goto skip_push;
+		goto no_push;
+
+	new_rq = cpu_rq(new_cpu);
 
-	update_rq_clock(cur_rq);
-	cur_rq = move_queued_task(cur_rq, &rf, next_task, new_cpu);
+	deactivate_task(rq, next_task, 0);
+	set_task_cpu(next_task, new_cpu);
+	raw_spin_rq_unlock(rq);
 
-skip_push:
-	task_rq_unlock(cur_rq, next_task, &rf);
+	raw_spin_rq_lock(new_rq);
+	WARN_ON_ONCE(task_cpu(next_task) != new_cpu);
+	activate_task(new_rq, next_task, 0);
+	wakeup_preempt(new_rq, next_task, 0);
+	raw_spin_rq_unlock(new_rq);
 
-	/* Restore rq state */
+	/* Restore rq lock state */
 	raw_spin_rq_lock(rq);
-	put_task_struct(next_task);
+
+no_push:
+	raw_spin_unlock(&next_task->pi_lock);
 
 	return true;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 74e68d458509..b88857dd3941 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4223,9 +4223,6 @@ void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_s
 	wakeup_preempt(dst_rq, task, 0);
 }
 
-struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
-			    struct task_struct *p, int new_cpu);
-
 static inline
 bool task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
 {
-- 
2.53.0

