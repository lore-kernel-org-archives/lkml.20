Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242227;
	b=G8CRxcukhu5Cto1fpgb0u0c5ZLFc7BJeH+g1EgbYNH4DVi4GCdzoovfGG77bmxLcbbrf
	 WNwS3t0t6vFzq2EBvetxwdEYHCB7EFGvwp/NeEFnGtoNy8FXhc8mhfBf3T3oxwISaGpjW
	 +CCNvGbnoTMsHnFwbnobrtqE1bbILDnGVmfbxQOONQjbRGfWWKjfUHQzHUrBu66+PeTg4
	 D0/lbxgn4S7GJtUfIzkxo2B4+vFujDu6kXhTi9dWWFt7XBgty9trbzJRs6UertmfhHLA8
	 rYXXpAwaLad7CtxXKrZ8RQn/MJdu3LReaiyYnBSF+pxAZ1W4LsHGa+nJ70tAPgCrq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SVT/DX3Qx5QX3fT0D0XLtiWgc2jruHl1ZHUq3Xr2ZxI=;
	b=wz2T9PKb9S2kym0vhjl2IMwG73p0NoUyMoW26RZlr0JMQMwFb4IPolsE7LqsWojhq3+I
	 RQ8NK/yPb3eSDIQl5kaYSkKNx1SfVOxs3G+MZB9uaTh9S6ck9ImJt5keXzvSjHa5NuV/G
	 TtdbtgmfDMuI3KjE5B6i5fkOtDdokYxWZVk1g/GOEFois+CaWr/M1fofBpaUNsRDOHDpG
	 zDc61Xetx/BfxXfYPmWlI7JbrAwgAr4DGlkuvER1kV/QopSKpN65xCYwPF1YygH2X12vN
	 58qoCiTTsBaXx45OoufD7EHZOVmGRc1DRYUol3zXONytcWxuXkGkZRfZmDctdADeLjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xxOrue/X";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F958606AAE5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F958606AAE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxOrue/X
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so12061245e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242226; x=1794847026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVT/DX3Qx5QX3fT0D0XLtiWgc2jruHl1ZHUq3Xr2ZxI=;
        b=xxOrue/XIP1cGeO805QDUjvWXOZZWysl0pKv3DN4oINbshIQXMxXwBSSepbZjUGwrA
         Zs+jJkR2Ra8aTWBSjvSQFA55gJoZEFCmT0Z/IR6VWYhUF+gNenibQdk8HChejRXdbiiG
         tXRL+PCiAYFG9v7P/TYP8ubqCofLSe3Q5A22TieJuBUvDdx6nbBiegCfwSmztI+6irzR
         CVJiQlBAIw+LHUsNHfwgQPjPj0DTUz34bC1NC2e+rxS4IkVAzSVJD9WbmQEBhprsEm2/
         C+EnIaQ8Id1Z7xThhIl5T+vfjtYGmBH3U1GSVXgzXlGX0RkBT48dLxY9AvNmF12pbTqR
         SPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242226; x=1794847026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVT/DX3Qx5QX3fT0D0XLtiWgc2jruHl1ZHUq3Xr2ZxI=;
        b=rEePdxvXqfIew9e06y8o4a/l7vh0rxjEhY8fiJYkkMbRWXHuxT/JxaiO/RszV6wO1K
         HgI7Z99S3dXp28Zp0H9O+EDBmk0Byv39Pa3NSKwZ+dkOQk69/G6WQZhASxDI4KFXDsEt
         v4e+R6jw2moIsp+6DxI00LjDpwFdzLoIQDiKl/tOZaYOnB0g+G6EsQIpa8j2vQJQ12CA
         EfOoeCfKcdNzxpkrINIYPES7oL9GXYhDcRtV5nRkCoIkhEVOJNOZ+cW6boWcHM1tpzAV
         iQ8wHJpayWhxadAy9HaRmY2Vt4ddbKYol4CzF4eZpRfMPJnXLrfd2IZ8nPUTYEQW9qA9
         A40Q==
X-Forwarded-Encrypted: i=1; AL+hErHvLrFj4AIMc5JX2yKSO5sDXwoktugjXLwFU6zh3aS3kA8gOgtDimKATAw7i3FygCEOZqL43MssmH54Y/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z90xioPsIiKOed4WyDruC+FZZFO4VawBalonbMRXuh2eCGSQmW6
	tnpbVQBYuQ0h5B8brawD/uu6VvAkelv73+1zEafYEmhNGfDBaW5xALXc
X-Gm-Gg: AYBFou1f0Kg6VK65ywnsjMz2Sd2OB/Fq9HXuP0xPIeZcZPFmSFAbthhZg8BdUjD1wT6
	p4sCfc632So092pheRjKlXG/0UMJgxPPKNCbsrtWV9yF3+Ey43TE78CwAfZAyViw6/fz0cdNyZy
	7gAX32diOrriogZvqn09II2ohaeEGPMt/eAoaUBKScFtfX8sVqwWDyC/UbeM76zrZcLpyPgThEJ
	eqaGloOUya2lIANwr2oE9LUYgU5HMSXyGA+XtdcuNBbRg54fm8JFKLWreuW4SDslp6aAabIw3+6
	5cNercnsE6Yp2fRkHhGuJzLviHxcjUxk01dSkn0vTK+9ACSwehgiZxO/cCHxDDLr2Q4YiqiLdxL
	OOTwmCbz0a9wypym8CYIqAd/sJ1cRAia8FcgZ1gy61jGnt3p+nTN3uitUo/jsj8wSy/JDzuwHAT
	nvi86uXh6uEgVleCbW9UlAtXxYNYV1Jh4RQrI/YFT9yT6t9iCtfL9zphfihWERFcrsDr86c8n3s
	eAg6/WwF57cKhRY7TKWF8C1Wq9v/iCU0YvA6DPmn42yyyVLI1EiP5gPeUUs+cweLMEXWZS59PBT
	qhNwJbKlSvXjqn9iD+U4Hb7G3fA=
X-Received: by 2002:a05:600c:8509:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b963c8da55mr78790525e9.30.1794242225594;
        Mon, 09 Nov 2026 08:37:05 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:37:04 -0800 (PST)
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
Subject: [RFC PATCH v7 28/29] sched/rt: Prevent CPU offline operation on active rt-cgroups.
Date: Mon,  9 Nov 2026 17:36:14 +0100
Message-ID: <20261109163616.195264-29-yurand2000@gmail.com>
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

Introduce tg_can_offline_cpu and prevent CPU offlining if any rt-cgroup has
requested bandwidth on the offlining core.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/core.c  |  3 +++
 kernel/sched/rt.c    | 27 +++++++++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 3 files changed, 31 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 59bd9599c509..4321be11c6c7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8717,6 +8717,9 @@ int sched_cpu_deactivate(unsigned int cpu)
 	struct rq *rq = cpu_rq(cpu);
 	int ret;

+	if (!tg_can_offline_cpu(cpu))
+		return -EBUSY;
+
 	ret = dl_bw_deactivate(cpu);

 	if (ret)
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 37e4b24183ab..e5f05aeabd5c 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2853,6 +2853,33 @@ int cpuset_can_change(struct cgroup *cgroup) {
 	return 1;
 }

+static int __tg_can_offline_cpu(struct task_group *tg, void *data) {
+	const struct dl_bandwidth *dl_b;
+	int *d = data;
+	int cpu = *d;
+
+	if (tg == &root_task_group)
+		return 0;
+
+	guard(raw_spinlock_irq)(dl_bw_lock_of_tg(tg));
+	dl_b = dl_bandwidth_read(tg);
+	if (dl_b->dl_runtime == RUNTIME_INF)
+		return 0;
+
+	return cpumask_test_cpu(cpu, dl_b->active_mask);
+}
+
+int tg_can_offline_cpu(int cpu) {
+	if (!rt_group_sched_enabled())
+		return 1;
+
+	guard(rcu)();
+	if (walk_tg_tree(__tg_can_offline_cpu, tg_nop, &cpu))
+		return 0;
+
+	return 1;
+}
+
 int sched_rt_can_attach(struct task_group *tg)
 {
 	struct task_group *ctx;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 9410d1909729..a6aae4375a31 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -590,6 +590,7 @@ extern int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 				    u64 *rt_period_us, u64 *rt_runtime_us);
 extern int tg_set_rt_bandwidth(struct task_group *tg,
 			       u64 rt_period_us, u64 rt_runtime_us);
+extern int tg_can_offline_cpu(int cpu);
 extern int sched_rt_can_attach(struct task_group *tg);

 extern struct task_group *sched_create_group(struct task_group *parent);
--
2.56.0

