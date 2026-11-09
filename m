Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242218;
	b=LRZl7KP44f+vR86mTos+hp1fqg6H/uxWLgzkNFWhx4HJ0x/lB0Amv4U+qaxD3H5qU5Hl
	 LWXWzgae2QxayV5vsDUn+6FWCn3oA/jZCCnbNAM4iUFbC24/OQPIbHHiKoJDMn+e3AOHn
	 X8StORXQ8kgXbirFUFRN68jgcs8dRKzEZT3hFd+qETN1eIjs7UBnyXvtfTItsNUbibO2G
	 QMB9gaD8xLv7OI83BushnupVv14pXQqo6UKR90RuRvIijWYexasLPtfDitr9s4GV/mVyO
	 IiOzFcRfYlCbiaDRBxG/eOPQ5jEM7F/WYhZ0cgwQHCp3WDNSjTUjYIk+dweNIjntPNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JkuHji0LxV8o1YCavB2wvroDiJ+Z9D9qJuz9cWiV9zA=;
	b=i0YJJfmVgT/lUIUklohb9WM9SUKvujDhKXz85kZ8SdetMtv7yWMXqMqPSllJ36M1hO8O
	 1h4AAFQpVcnHglxuR9kuGi37zLzzvjz3QoBHXeEnFFg5+JxXahbiO+0RFVVozjWZvB7Ka
	 9yCPq+lY0tKmK2njoV8nAs/PR4aZS8TPqT8OQkIz84mSBj6CJvn1f71jCuyVTcjc38gjW
	 eMNufBmgPrw8xviALY2KlXmh+D3i3AN32+jyVwY/wX3iA6KQiKXszzDK9tRv1P+CrU+sJ
	 vXtkNLtpSjC6noDU2PLiIUVbN/+5fRcA22UABMnOqk8BszDTkEtGDwgtDQKQZJo8oLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YNk93/zZ";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF026073669
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF026073669
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNk93/zZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8365535e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242216; x=1794847016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkuHji0LxV8o1YCavB2wvroDiJ+Z9D9qJuz9cWiV9zA=;
        b=YNk93/zZWqug2MBqv13SfAgg2UaDn/0LAwCs+uPx/KZFYJxtqU7WbZs8tZdQ5uCxIb
         tEbYj4t5KbH7CacIcVoyofLsXVPsoq3SDmxvZeen0JCIcPXeKYfQnbZRAOkW+ITIryWf
         liRqHwB3cBZ2dgCcUR37re+0pyNtBjmyc408mjvojkO3qVDRLLVirk0F4Vf7Rj4k51G/
         1KFTuaTMBWsIXR/zeAGt9uRLPbIzVuxMu9XQz8xbRYO6T4K8SodzI/ls1tALpSaGHKOx
         OtF44VccFuOEwJS7H8CWuanrUTVuVh400S2RVzjueErlkRfAppoou1NJXm8nMBMwzE5x
         PLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242216; x=1794847016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkuHji0LxV8o1YCavB2wvroDiJ+Z9D9qJuz9cWiV9zA=;
        b=ssLgHc9v510LZORFUrtge3ovF1clPwGq6UXZDZfpJPPaDh5jHu7LcbuXOFzPzD2kRy
         GkP4VB3XgZv48CzjOmlKSWn7dGXQS+P+skBb17ix2GIgfOBHH3OJkrF4/okGfQzZazr/
         5tS0DvGwPs09LEwHoOUKk34Ep+34TN0Nj4G4p8roRM5HhMxKdOLzVAmTcLVNPhtLNIsF
         CO7tvICsjND3bTzJkVIDsZ+qPAWOzPKzg7n3l5C2hX3UmYJSynSXK7T2EoA7gy7+nIzo
         o/IAW3UqdQSEy9aFjDfbvo/a3cZgy/8tKVj+GlCOlQNhH50Ejh/j5xml2cQ3000iEZdY
         4odA==
X-Forwarded-Encrypted: i=1; AL+hErHvqR/GP+Ej0+L2sAJ7E2Vkt+iwy4k+jj+zU1q9Q4nEn8cs4T9C/tWBNYkMhLn608726Yg1rDihvOoJ5kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kvfgRxCmNyKUkP28003GxHOQQ3jbd+fRUGdoKmdrkrlpRPvYN
	/sFDB1Tn5XNvlQL+fJDCoiB9kmedQjhI3R7Oka22y1gNjAR6K6vZ7cM3
X-Gm-Gg: AYBFou10MHEyaEc05fTxkCZm4wMlJPNiaZav834Arqz8Z69RZNvTv1nXr1OSf2cRSCx
	GYc90UdOicLc4/BQWNslXFz4DiLVkxIr64tNbicbrvDdDq82OlMFSNI0EDKsHneSePnIbf1Yu8n
	LRAxlbZZ4gSfuAe1Hft1NhIFa51WjylM0sBP/qcWbwp8ffLI2vt47Nhr0djjBvGIlYnBKran/Ts
	4TUTzkzq4O4gVs9BIqtyB6MLBHh/XWYIgaSWlgtlaCM87nQGkKdrIl6+Cz4TqtS82EFc6xPRaW/
	AGmmO53AxNNBa15kMz2f4DxPIeLcOffYd0xXfAvRcRHI/0o5ms3HBLYXcgFPSvlx8eZ8Ser1BQt
	yGJgtPly7fXlTWQTdrq3YAGXIl0MXlal+hL57MPhFPBCPbWYLE9gLn6dj+/ErfKXG453eR3jSNn
	GQO/75EGvvdoD348yyFsN8QPulD4yKEC0hdWA1q7nN/wjmXSFK9uXotBwctb8uPk0dRh6Cgu2Iv
	5G2DNoz1yw3vUHyH+bUHPrY7wBYX3kbuJ+cqveU5+vBt5PAo549E7ozLot93KGv2l4jNAOQO/in
	WOj3W3oUz317JUZLz16hE55GO6C8USw41DcrU3Ko+hhssQ8=
X-Received: by 2002:a05:600c:3d96:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4b963c8a047mr84071075e9.34.1794242216364;
        Mon, 09 Nov 2026 08:36:56 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:55 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 21/29] sched/core: Execute enqueued balance callbacks when changing allowed CPUs
Date: Mon,  9 Nov 2026 17:36:07 +0100
Message-ID: <20261109163616.195264-22-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

From: luca abeni <luca.abeni@santannapisa.it>

Execute balancing callbacks when setting the affinity of a task, since
the HCBS scheduler may request balancing of throttled dl_servers to fully
utilize the server's bandwidth.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62039972ded6..aef019cef859 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3019,6 +3019,7 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 	if (cpumask_test_cpu(task_cpu(p), &p->cpus_mask) ||
 	    (task_current_donor(rq, p) && !task_current(rq, p))) {
 		struct task_struct *push_task = NULL;
+		struct balance_callback *head;

 		if ((flags & SCA_MIGRATE_ENABLE) &&
 		    (p->migration_flags & MDF_PUSH) && !rq->push_busy) {
@@ -3037,11 +3038,13 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 		}

 		preempt_disable();
+		head = splice_balance_callbacks(rq);
 		task_rq_unlock(rq, p, rf);
 		if (push_task) {
 			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
 					    p, &rq->push_work);
 		}
+		balance_callbacks(rq, head);
 		preempt_enable();

 		if (complete)
@@ -3096,6 +3099,8 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 	}

 	if (task_on_cpu(rq, p) || READ_ONCE(p->__state) == TASK_WAKING) {
+		struct balance_callback *head;
+
 		/*
 		 * MIGRATE_ENABLE gets here because 'p == current', but for
 		 * anything else we cannot do is_migration_disabled(), punt
@@ -3109,16 +3114,19 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 			p->migration_flags &= ~MDF_PUSH;

 		preempt_disable();
+		head = splice_balance_callbacks(rq);
 		task_rq_unlock(rq, p, rf);
 		if (!stop_pending) {
 			stop_one_cpu_nowait(cpu_of(rq), migration_cpu_stop,
 					    &pending->arg, &pending->stop_work);
 		}
+		balance_callbacks(rq, head);
 		preempt_enable();

 		if (flags & SCA_MIGRATE_ENABLE)
 			return 0;
 	} else {
+		struct balance_callback *head;

 		if (!is_migration_disabled(p)) {
 			if (task_on_rq_queued(p))
@@ -3129,7 +3137,12 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 				complete = true;
 			}
 		}
+
+		preempt_disable();
+		head = splice_balance_callbacks(rq);
 		task_rq_unlock(rq, p, rf);
+		balance_callbacks(rq, head);
+		preempt_enable();

 		if (complete)
 			complete_all(&pending->done);
--
2.56.0

