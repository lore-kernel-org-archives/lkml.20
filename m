Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242220;
	b=DZCVRXq2MWPtssf3+EIoOyrKcx0t12UJBsGsX9tSx/4u5koeDOIAgX1vFR/DIkdusuaR
	 wyP5EzOpLkX+XQjx1AHYqnO3o4hKFbTgFyBmH3Bj7WVvkjIIDn3GpT3EGj/Ek1LufZjo5
	 vCZxzYNwsEM1wztq15doVQW5h/rlz3mNljCTv2QVgQmqBkk4u+F5qgK8K215LJmfju7BA
	 mj/0O09+yQc820Wk8JPZw4tfgYUyS1cUlVFDr7ppyfw53/76tjbpg8w1vFcd06tTD5qfs
	 tyB1E/OZ5FsHwZqIPketLpTSMpiOPbLe3H8wILySkBtGBgCA9E9eaCPtUjiwVRyU6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U11DOD9x1cNusT7QAmX0bThmlm5Nlcj6algrIF2IlmQ=;
	b=aMNB8Br6DWdk2skow96E9rl/clSKgr3mQAjW1c2ojBf2/yKvRNe/dGjhPfO7/5E1mp3W
	 f56xvTIHXNTCUgDRud9RDpsi1nAV3ZjJD2y3tGhk7hNcs2V8JHs0TQylqgMI8CP7bgZOe
	 ejWIM43k3wQjZmQPrJsUlTqj3BEjYSjLCzElcakR3I6Et/OHojXC7C45Y/NemI7xuyTWX
	 SBLq2nE2GQk/XnJMbZf3g/N94Dc2CP2+oIGoHo9iL9TnN2gr8g++IJsHwNLrOWN1dCaTX
	 HKTZ9zSzJhcf7+s7Kvf6pXrwkGY4Mm5iZLooPDO4AJkMRS3ojMvzejPMHsiNmdUU0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2sWGvP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E85606A85B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E85606A85B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2sWGvP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso8475875e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242219; x=1794847019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U11DOD9x1cNusT7QAmX0bThmlm5Nlcj6algrIF2IlmQ=;
        b=GL2sWGvP5KOADZItlVVWu6JpHTutKbXU3SM3b3Frh6CccB/iCZQ6gcZkL23htQwXp2
         4507352zKlmOIdYaE69s5bv1M7Ibrafq3RaJ3U5eArcQKYSMOK0OeLnR3m0+k01lCHkA
         E/yWiFbLrCm/p9i+wzgpoVuoY2QFENzu59UEd/yU6ZHzdxqxDJfSZTaWwskFQ0gy+KIa
         vzZhZUVOuRD6SLXLBROv3EhSqc5HrvcnaVp25cWJT7iflvW7cbR1QDraXFeVO/o6y0RP
         bO3gjj21+3PvORsPnRwnllF9CPzGwAGXXV+rhaiBFN4xdaL4SrhajsXOdwh6vlNP7p+b
         uvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242219; x=1794847019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U11DOD9x1cNusT7QAmX0bThmlm5Nlcj6algrIF2IlmQ=;
        b=0ivZqbVBqCeHNgjpWxWbt4Ba9xvq6hKxVyNdJMD0cqAOM2gEfDNSRWdOYK5+/MIWT7
         BAkPdWrY4itEXyq2ulLxLsemfaRja3M6fswdOG9Oez0URp5GibKjXxKavEj9PdJQRQVd
         idjfO1zOZDsP+x7tCIew8SOS7EPmSP3HxDH9Zz+4gVEjvPFz1u86digUpRU1agv41q3U
         BSoDSQArxqlNh5ZByjlk58hL5l+9XkWwjv3q5/tnQOEcqLq2tk57A9KT9z90tWCzxIf2
         b9vdNULRiCdWy9ikUB6HNhHOz6DHexG9eZjgpepXkD4llDCdM1lsO9lMa98gBQdCRDSo
         3LiQ==
X-Forwarded-Encrypted: i=1; AL+hErExY9CAbs7jzL0ZKP/dL67hGRlmTwKguSZACZg4ZCiI5XxQmv2H0DhzUy9GbFgj9gcqlEYKypctHbKnA8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cWpCSslBc1BJaXVlrolsqKo8T04gRcO4Sfhwh1O2Ze3/WSh79
	y+oValS+JOIyvqeJwvFaldbXON2ribC0cCudHN3kkuHnoPIxV10UEeX14DccBA==
X-Gm-Gg: AYBFou2QqhqNi0F4ZI0PPSBE/wQYrqFjAdQ+HfvUdsg2nS2cX7XRT+KGTxPrx2EBY6j
	FRdqxnIkMuggF1WkT9vX3Wib43ogO77BZ0r6ml5UFQXx2gVGIRGzbeippUCGTIpEiNhQF0sLRBp
	yhdjuXxNQ40dFj4ZNzb6mE63bGLEErLscRkFDuMRzSLGkvqJAbPdLGvsSrzBeuj50AWlgOrSrxj
	THVY8DO6+FXbPyWqBoUgJm3jpJA6RBSiYx/BH7OQAPNDG1egvwd6ju7F8UY3Pzt3oEfW+OUhAyl
	ZN8cRltoKW9UHfujBrAaFmyx+WLKcDVoF79NFg/blHxqlFiw3bjiiTY2mh3RDBcmd8T3G8sE7+z
	Aj1wg+QEIqij2PHaQqYiegh6jdisvvLFu2PLUYZR6x9lNbR00djqj6Wge/weI1b9QiS+EIzwRt4
	gZZVerpRBKvnVv32xE8QpDz1gU/A0tcgcED0WDvhyViCxkqUUy3WX33u1zFu/gQmtTkSXxIUUFF
	Glovv/iZOPdFYOGA1liB24BQzhCiqCf89beIOixULe0IAZBmDDt60vSyZWHw0nC1dHlRY4E23D1
	bmctoMh1tIuNh72IAbu3ii/gkA==
X-Received: by 2002:a05:600c:83c8:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4b963c6bc6amr78431705e9.20.1794242218834;
        Mon, 09 Nov 2026 08:36:58 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:58 -0800 (PST)
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
Subject: [RFC PATCH v7 23/29] sched/core: Execute enqueued balance callbacks after migrate_disable_switch
Date: Mon,  9 Nov 2026 17:36:09 +0100
Message-ID: <20261109163616.195264-24-yurand2000@gmail.com>
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

Execute balance callbacks after migrate_disable_switch.
  Balancing may be requested on the __schedule path, in migrate_disable_switch,
  when the running task is throttled and then pushed away from its runqueue.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aef019cef859..e4e50202896d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2470,6 +2470,9 @@ do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx);

 static void migrate_disable_switch(struct rq *rq, struct task_struct *p)
 {
+	struct rq_flags rf;
+	struct balance_callback *head;
+
 	struct affinity_context ac = {
 		.new_mask  = cpumask_of(rq->cpu),
 		.flags     = SCA_MIGRATE_DISABLE,
@@ -2481,8 +2484,13 @@ static void migrate_disable_switch(struct rq *rq, struct task_struct *p)
 	if (p->cpus_ptr != &p->cpus_mask)
 		return;

-	scoped_guard (task_rq_lock, p)
-		do_set_cpus_allowed(p, &ac);
+	rq = task_rq_lock(p, &rf);
+
+	do_set_cpus_allowed(p, &ac);
+
+	head = splice_balance_callbacks(rq);
+	task_rq_unlock(rq, p, &rf);
+	balance_callbacks(rq, head);
 }

 void ___migrate_enable(void)
--
2.56.0

