Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242192;
	b=C2Dek0dLZggxWIHScA/8v08nSiooECl/kIwEJj3VtisJsfWjhrkydd4/+HbdPHiqWyxe
	 dh5pvJ3eF0nW5YX9Rpb7TNA2+bq+s2a3a/JL6MVTkdtmKTwdm0bvPNSR+wyRiPhOdW/cW
	 GC8ng27iuwJt3762Y7oKqCeLSKrWdlo7JpQvWzD4F7PnAJo9gCbb4Mgv/Py3pI9KBUiuy
	 LQOUGYTgD2hoa1qHx6Xlh9vyfHxuGLwrCZ3woe2B26UYL1ym9P5n8HM3/ARFihZYdlxVg
	 x7PrLKiOriU5B1wmKlvcFJmoGj24Vzt5SvS87P++SLTd4xc394nUQTeG7XrQGgFPt+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HEJ+QQBd0iC35enWpK8vBgPoOeYQfDGSCF+rovxxelY=;
	b=TB4kusXHhKuK4bOYgbUG6WIY+a2Szw4JexoeM60bkhk6lVvP078pEHn4itvwAGkWNM6Y
	 9tIEfjKQkKLzlfQMh/1obcckcdD+FKnFZQCbbERUHUxc5wirqzIJGHj9usXsH9VzRtgr7
	 x9ML47HoCr57hkUTj7HNRpXyo424guk9JgTEVSjRPWWDlXau7tW2uZscFg4sTDqToa6C3
	 gHwi4m+hLsyVToIOo7RGlG1SPnJDTvXDoA7RCHYxOXIrzWAx1WMrV4QaG20VO4EcA486b
	 cC9V0kH2c/XyybZL9j+z0GSW7vhtpVdid/dG3UrxTEzzW/9dqIJHoTUG2/QfO7MUWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce4dzgt4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD7606EEB9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DD7606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce4dzgt4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9074535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242191; x=1794846991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ+QQBd0iC35enWpK8vBgPoOeYQfDGSCF+rovxxelY=;
        b=ce4dzgt47bGoaG62rHmRirIRztmdq3J5c2phQMU8RqoYCy5Dxwn/y+0E0aaHCZXJDe
         B4szupjUZK+qd1H8dwkHk1CiGAUgmnwiLkgNeIQwtENslHs3gTKzOFGdY4puqJmu7k4U
         fQqJhvnx+r6lr+gNNCVL3yVL+xudCZDxmsNqHRMQUfT2yOEYd6v9vB0qWDA2M6sRAKcJ
         VYCwaLA4KMlTC8UQlQ8wWxx0v2tMVIRC8BTIo45gLvJcvszelyhUybRwxiO5nzFhFOyv
         MYbtlh8vEpluKfiX0hHVssS7h8fF0NS5diwe65fZgoUqSfqyANNZc6wdnLT0d58j55OA
         JWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242191; x=1794846991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HEJ+QQBd0iC35enWpK8vBgPoOeYQfDGSCF+rovxxelY=;
        b=vcpW49VU8DHH9YYz4pDK5wLA3qUC6Dp/UgddJEVTuvAZqojlCdetycaifSKPU9N60Q
         0xp3rBUZQ9WK72xcUZQPn0yYTGN8mRhehgoVKsSZGQh6ToryNXcaMzdVJkSIx0taQBan
         U/0kIZHoRbPZ0cMV9V52TUnV0uYikThFOulYC84tDSUD/Sg8CG3DSuorVVdDtfiUc40Y
         Oq4CSXCO5Uk1U1YCPE379b6dnRW2mgYLC27Q6o4N2U/1oQrAHpgaRjoFnzAc7/ID9215
         Ti4joEFdSo8BpjzLSKfHM7P0dNYi4zPNlQyWUbbQ8PzQiUaCNSzM3rGycZZR5RXSvD8+
         RCYA==
X-Forwarded-Encrypted: i=1; AL+hErEmxru+JWASMBxjSSWBZY8GHpFn+EE2vdVsJm4OKXdsykjDZtgESxVeLGFrYUV/04OrYnYHab4YNQj/TsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+drej9xd49vZxivR81griaAhiNAvQl/y9ysT+s+U325RACJYuf
	qCxXrEFOtZJ8aUqnOv1Twh8j7eOCWpQ1ty5TWWlSKMkrTz6w9BBQbWQ7mYDVpA==
X-Gm-Gg: AYBFou0xNN6xTixuJsCPS0WB4NkcvWy4LYBzRQ7s7EBRMKCG4ibqJLRXoLjhWO6vD9p
	ZqjLHkGjYtSsEactZPTSHoILWc+9eOFQEtSOE1gu7lBp1UUINdnrdPEw32fF06NYX2EcRlayCE5
	sBbQOMAWnfs1nsGRf8tp/ETs0lt3nF1VRFL5ceEd5m1ofOo3O6ZH8XvL6bUIN0KuLHniCOMpn/T
	x3Lol0SSqeTr3HI+JlAv9j+pnITFdW0fA3/joPY2YBpCyxnuxZfKhm1TC04Kz4kpTgaRmkwjGHW
	FQjGw8VfOBrkGmk2I5ueHwRcEZTjSW/lpo3a/l4TpdY71zK/2wNek9PupFAJXagrGu1+whYYnGv
	KcSc1KvtdaskM32nplajbBg+K0FrCI8w/JQXaNh+sfSqT9wUhJH1eEaT6bSGiuqLkWRnRy9iTv4
	m+F6bgu4NLY+4PXC+DV7T2ds1yBKOQ9+4kg94nb8LXuWZ3PY+NUpbUZFgFwftYkhzzVqo+xXSeK
	3IA7ONec0YKN6J0XZnXYcRxv1Omi6lyCbRpHPE3bt1+tm3FHL26MhmrhaD3OqN3CgY+84pjiZh3
	rEfl/n75R3Km/rQ5+IDN5feYMYQ=
X-Received: by 2002:a05:600c:46cf:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4b963c6a9d4mr87006605e9.12.1794242190658;
        Mon, 09 Nov 2026 08:36:30 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:28 -0800 (PST)
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
Subject: [RFC PATCH v7 05/29] sched/rt: Move functions from rt.c to sched.h
Date: Mon,  9 Nov 2026 17:35:51 +0100
Message-ID: <20261109163616.195264-6-yurand2000@gmail.com>
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

Make the following functions/macros be non-static and move them in
sched.h, so that they can be also used in other source files:

- rt_entity_is_task()
- rt_task_of()
- rq_of_rt_rq()
- rt_rq_of_se()
- rq_of_rt_se()

There are no functional changes, apart from the use of container_of_const()
instead of container_of() where applicable. This is needed by future patches.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/rt.c    | 56 ------------------------------------------
 kernel/sched/sched.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 2b1c3ab5d6a4..0862ee8b088d 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -166,36 +166,6 @@ static void destroy_rt_bandwidth(struct rt_bandwidth *rt_b)
 	hrtimer_cancel(&rt_b->rt_period_timer);
 }
 
-#define rt_entity_is_task(rt_se) (!(rt_se)->my_q)
-
-static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
-{
-	WARN_ON_ONCE(!rt_entity_is_task(rt_se));
-
-	return container_of(rt_se, struct task_struct, rt);
-}
-
-static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
-{
-	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
-	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
-	return rt_rq->rq;
-}
-
-static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
-{
-	WARN_ON(!rt_group_sched_enabled() && rt_se->rt_rq->tg != &root_task_group);
-	return rt_se->rt_rq;
-}
-
-static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
-{
-	struct rt_rq *rt_rq = rt_se->rt_rq;
-
-	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
-	return rt_rq->rq;
-}
-
 void unregister_rt_sched_group(struct task_group *tg)
 {
 	if (!rt_group_sched_enabled())
@@ -294,32 +264,6 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 
 #else /* !CONFIG_RT_GROUP_SCHED: */
 
-#define rt_entity_is_task(rt_se) (1)
-
-static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
-{
-	return container_of(rt_se, struct task_struct, rt);
-}
-
-static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
-{
-	return container_of(rt_rq, struct rq, rt);
-}
-
-static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
-{
-	struct task_struct *p = rt_task_of(rt_se);
-
-	return task_rq(p);
-}
-
-static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
-{
-	struct rq *rq = rq_of_rt_se(rt_se);
-
-	return &rq->rt;
-}
-
 void unregister_rt_sched_group(struct task_group *tg) { }
 
 void free_rt_sched_group(struct task_group *tg) { }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1b04b4c40ae9..e7e4da78340c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3495,6 +3495,64 @@ extern void set_rq_offline(struct rq *rq);
 
 extern bool sched_smp_initialized;
 
+#ifdef CONFIG_RT_GROUP_SCHED
+#define rt_entity_is_task(rt_se) (!(rt_se)->my_q)
+
+static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
+{
+	WARN_ON_ONCE(!rt_entity_is_task(rt_se));
+
+	return container_of(rt_se, struct task_struct, rt);
+}
+
+static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
+	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
+	return rt_rq->rq;
+}
+
+static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
+{
+	WARN_ON(!rt_group_sched_enabled() && rt_se->rt_rq->tg != &root_task_group);
+	return rt_se->rt_rq;
+}
+
+static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
+{
+	struct rt_rq *rt_rq = rt_se->rt_rq;
+
+	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
+	return rt_rq->rq;
+}
+#else
+#define rt_entity_is_task(rt_se) (1)
+
+static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
+{
+	return container_of(rt_se, struct task_struct, rt);
+}
+
+static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	return container_of(rt_rq, struct rq, rt);
+}
+
+static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
+{
+	struct task_struct *p = rt_task_of(rt_se);
+
+	return task_rq(p);
+}
+
+static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
+{
+	struct rq *rq = rq_of_rt_se(rt_se);
+
+	return &rq->rt;
+}
+#endif
+
 DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
 		    double_rq_lock(_T->lock, _T->lock2),
 		    double_rq_unlock(_T->lock, _T->lock2))
-- 
2.56.0

