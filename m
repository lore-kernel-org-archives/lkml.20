Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978396;
	b=0RX1FGMKlbRAVhp/b7BeejeDD7kELOP3h+PjJz6eKNXMVoWkBcmqaWwdi3RQbKMHogw8
	 YQS7lAd7kIxZzHyOIjPkdcGQszT1FE6fE9+uxLuXoBAr7ZcIxNZ/UtAkAotgHbzgShez9
	 STNBbl8X6kbybZQzct8s/K9h9CRU3OYZU/K59n3PeU/kAfYS3Jmr6gicO87zPrJ3saTZp
	 fXaumPyrCgTS0nIF67I/niWidHlpEUh7OPZAVWNCleEv217YQAwHi+eDKyJyWEhANdxCK
	 JDcc+3d79DDSmJDwLMaeOrxCq1fgFHkeC1IvwaiHzsx94dZDwIawNi4s/jsSJhOWVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mqum8wvj/7Uuzw1gTiTBSXxhGiPLwY6qFIUmcHJ68Sg=;
	b=bK1cgT0dj8HxJj3cPcksagJmie4rfFH1ySEFEGt3PVmdCiwXkz97/eYQYq7qkQYdGZxZ
	 OfnWTTgUrxXTJG+Ni7HN65f3LKO54hvs1gCQjFCyQFW532VqIVRIE0dsMrQOM88dMHNAk
	 2zSGqzwFYS0/fc6BhpFXluY3SZC5q41lihJCg7Thc0E3w8jBBukBR8OChFC99zelHFfT3
	 DPtYOHqF30x6qYtVq6onUAbLaAWtXTIa3kAjcDL1PHFCyi2M/W9ddeBezaLk36eouwol/
	 hZRlwFgGjjN8jAZoP3leHRdu/8PsWCI1nB0eBeJhzJivWaKCMT6rr9cy2AxwZRY84MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ySx2WBIF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30770606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30770606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ySx2WBIF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4919a880834so448099f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978395; x=1794583195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqum8wvj/7Uuzw1gTiTBSXxhGiPLwY6qFIUmcHJ68Sg=;
        b=ySx2WBIFXxx9MsZHeDJMKeXXBlzWeWU+9kk1ipjqhVf59IGNRa0hVy9RktXxy8FpJ0
         MFHcgesSVF5Xw+/0uVn5BpFhZpsrSKfWtLfKcEUu9VTtPk0RTKHJCD+vSevIvIPtuEvM
         unV1pIUg5gm8by6K+UvaMZBE63iW3fLDqicpNjNHorNLSqltxSilTnigOZ+ZRNluDIBi
         CUYZfLh4Z55O7ekcAwIyrHjA+kAd9/ueRPVIP7gbmRWQJ0Aqwb7XAj0iErdjylwNyBbU
         sUqkBxm6ITAgWsAGxpynl5vPh3Xdce+btf4O5ZwGfQ5WxwfHqiL1dCmC8akD4xHV3cel
         797w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978395; x=1794583195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mqum8wvj/7Uuzw1gTiTBSXxhGiPLwY6qFIUmcHJ68Sg=;
        b=sEousDT585kjIbeXi6tw6ir1+d7DbCt33ouYlYG2kCfLQeYJ7ttNhNyhXdFRiHe0qt
         eIHuJ+mTPNU6NeZNg+dw326T4Xvh8+voIrImtE6PDm3CcymSmMzrYVgf8bFHKiE1+cm7
         YY/bC/Ia/R4S7tvkshSSYMrtGKTkUuVBJ+e0kJcRIfU0/I7bTXnQbxNaOYQ4qCwGekZl
         CBc0CfDgqQnGx2Bn+wXivUOP1d6b7068nkz4TYp0aDUD3cccAYxL/+xVv0BwaE0gT18J
         EVXrs756ubsdfoMJ+xkyKP9lTRGd11BqaF4IRjhEy61F3xKuJftbS5HY2VkGCvavvoIp
         oolQ==
X-Forwarded-Encrypted: i=1; AL+hErE572+8s/rpyHNP5oMhV6nInA+ji6c4GJd00cy49af5VrQui17ih3fzcIM4RKZ72qelCbfzd6lHMwOK5qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NT4URgQVXmx/HHsQAPXstvXQyeZX1S9chgsX9EazqhKQGZjTF
	gX4apJ9Q1bNl8MQe5gnz2J1QRejqMsjZjAI0c3mXXokLr8BghUBEVNovfrvyXG+F7nU=
X-Gm-Gg: AYBFou2NVewV8VnQgOGXFxnP0xdHyQBvEs+8/DS7ZaszBfkOtVETMP8txcynUZMyEHz
	6pYCw+QLer8jjGNHOaTDQKbUCYmRtx6l2x3A/w1n8RI853pjV5C+vmrQjDlzgstZQJNBfKJeQQ+
	27dtUf++mQ/VIlTNPaqRn3MyWlJOaPxbc29eEoJBp+WzJdp9gu2FWzMYI/ZqMcXXh1W4PvqGk1W
	tGFmr5JO0mxdnxGNaws9zbSnF3YTzDgNaExCoWajKoZWIjQVxjAvLOFKAMzQcYRS4/OzpcKz7oX
	F/a+PvDYyjXTBXINHuW97GyhpfKOS/kSPUlVdgIBvu9qqC7E4bWpGa0YteJ4szBno2bNGWLv+pZ
	OLbpeR/KWphuJiGMMnaCDTQm6FuE+I0D+0jutiQkILm9iuoMSIObwuYVBOSKBqzVa61b6mCu0tB
	25cZzgEBNk1hnTV6Bg/D6mpOggq97gMdrqA42ZMVBIDUUDEtlD5WG4H2o84nzFbXb7heUN7x7Yq
	xcVhOdv3e0K3ouTdX8+gEHQV93IpFf8NOMzcCjlJFhrXgGEMtzOa6FhKojdakwuMZqpo2xYyy+o
	Fi+KPZtkqa+aK29cva1Uj8ztXu88bFkV
X-Received: by 2002:a05:6000:4312:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-49274bc8429mr6643038f8f.14.1793978394356;
        Fri, 06 Nov 2026 07:19:54 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:53 -0800 (PST)
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
Subject: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU has been idle
Date: Fri,  6 Nov 2026 16:19:29 +0100
Message-ID: <20261106151947.3991524-3-vincent.guittot@linaro.org>
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

When prev CPU entered idle while a task was sleeping, we assume that the
latter received enough running time and the lag can be cleared similarly to
what happens for a negative lag.
Track CPU's idle phase and save it when a task goes to sleep. Then check if
the local CPU entered idle while the task was sleeping when enqueuing the
waking task.
This only applies if the task didn't migrate at wakeup.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 14 ++++++++++++--
 kernel/sched/sched.h  |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 0cb03f9acfe3..3d31e9a698c3 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -593,6 +593,7 @@ struct sched_entity {
 	u64				vruntime;
 	/* Approximated virtual lag: */
 	s64				vlag;
+	u32				vlag_seq;
 	/* 'Protected' deadline, to give out minimum quantums: */
 	u64				vprot;
 	u64				slice;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5cd171f830d8..79f53811274e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -893,6 +893,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 			vlag = min(vlag, 0);
 	}
 	se->vlag = vlag;
+	se->vlag_seq = cfs_rq->idle_seq;
 
 	return avruntime - vlag != se->vruntime;
 }
@@ -945,12 +946,18 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
 	if (vlag <= 0)
 		return;
 
-	rq = rq_of(cfs_rq);
-
 	/* No fast access to prev rq task clock */
 	if (flags & ENQUEUE_MIGRATED)
 		return;
 
+	/* CPU has been idle in between so the lag has been removed */
+	if (se->vlag_seq != cfs_rq->idle_seq) {
+		se->vlag = 0;
+		return;
+	}
+
+	rq = rq_of(cfs_rq);
+
 	/* Compute sleep time */
 	delta_exec = rq_clock_task(rq) - se->exec_start;
 	if (unlikely(delta_exec <= 0))
@@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	dequeue_hierarchy(p, flags);
 
+	if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
+		cfs_rq->idle_seq++;
+
 	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
 		se->deadline -= se->vruntime;
 		se->rel_deadline = 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a2..24f9b7bd8f0f 100644
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

