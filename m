Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242197;
	b=wmojZphVC4Dhsvu4Wxv8DOGMMev5sfNtg+X6tqzZYdGzb97MUxUVjw1GBcXUmzjkj+o5
	 JdW2pMNlyYsXZYCbICI4alSADObyyb0/3/14AoJfF0HYxIbjsEtX51UPJkh0GUK04nA9h
	 0Xt8q4PPypCVs8m9FpCOBV0RJNj7+l5U98WiZ8ewk67Z+eFEnI+quFMEgCo/CMmJ1Ib4d
	 g8n3cT0IpSLhBgPT/iQbV0PxCzhEi75qc87c6hYl8H96d6XkDCnGOHteOaEZBXEHzHG4V
	 mO692Hz8bVHJXVT255bxTTM+6zIsLEWkI9NUTREf4Lj5/UjolsQzIi2fL2AEyzmHJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cI5Cebh5oS/EqfjMVNcMrn1FmEFpFd0EuPuQKgER/do=;
	b=miRFvdA17/jN9MWQfcxpG0bvCJjptKsO+84O0/hdU7oKYHDMpx0SYLBqZBQ2HAeYQWyS
	 XiVLxlGZ0pF0myHrZBsvUTRWrScwxojYtfJlyJjpftHUUaOLcdVrjUhxkYRe15f22t7bA
	 fRcJCC1bP6kWwPWAV+kO/4M8VuporkeITydq2cbBRayQVd/Azlqh9u6kXv1xf/27+LcOO
	 4xOYF2s170muD9hWA7OKJsnhPXC6ekLgO+8viyt03l5zqt9n4OojzlTNaXaVKGdondv9M
	 zgrWrhYtftI3yWn56ljd+6KDdJxMu6NvX4icTkLWXgNoNnn8NuUnX4Q/C5EGp/TK0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyRxhjdn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DB60A261C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67DB60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyRxhjdn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10374545e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242195; x=1794846995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI5Cebh5oS/EqfjMVNcMrn1FmEFpFd0EuPuQKgER/do=;
        b=wyRxhjdnbyespPtkP2PMT7C+Eh13h5Z+oENdhEoNC9WtR5vQHQG5DwXJdzlMnyCYUe
         yKOJRgXaGd2UQhjcvZlmxrQO1In20TcbppD6/a1dV5YB7QeGSuM7KTLwhEYtVQUqh1Jf
         YdlZ5AF4X4oNdQAY8UXKCvnFXmaW3P9sQcM/DhJkdpJ7kaRSNhd8XpF7MrVf3tZ3fRif
         e6pkiriR0l0w9Zro1CurzOmReT55eWMe5M7fNtiTRrpuNfjp7GkGy3nvFBtujamt0a2G
         UnjFYPAdtW5MqZwYvwmb9JbNKqMxuk0ayJiUgxZ1OVStLfIXp53FeOYXWRv44Uue0iKC
         imYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242195; x=1794846995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI5Cebh5oS/EqfjMVNcMrn1FmEFpFd0EuPuQKgER/do=;
        b=04wo8/mA7K3e7OaIafFA20GUjKZ8Vt7CEelk6nCSxxF241exkgqqpa3xvQFEUvwGL4
         SZmpd06GtDzGudycwGECX5lOYqcWgWL9gPYNW9LlfRg5z13k4LYcaHnByJTdt+K/j/UD
         Ac5DZhcPbS09v6XJmfgIAzs1pwB8s6FcZNA7vndygvFX0LhO2lAc5g9a0ZJLWIlXC+RV
         RPOP6e0K+so0/1/+5lWVU+33pAdFpPMtr3yh4MuK8T7+oM75wFMt7zzNNWjPLjARN1dR
         /dNN5V0AiNgHM33zPTkZlBXaH6ODXOTQq1tc/hKSpT7JXiHq9sE9ylI+CtOZknlayfHb
         W3XA==
X-Forwarded-Encrypted: i=1; AL+hErEWPNe6LbvCFZUSECl7WB2t6fsEl0/PhWcrnR9CNCJOwp86ixYmMqbmDpe3JstFs9NGt5mWRuysC9xCNIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZZ3NSjGZ0BylMCQAzkTg1NsdE/m6cOYaU19yZAZQfujQFjF2w
	35bTQzFhGwdvUK4Ki4r+JA1xXg0z7Nbpj+xAmOG3966nJxRGVDqVc0tN
X-Gm-Gg: AYBFou2NRS4lTqSd31jo3+vx/p4IVIvslIRhnLNgdKJgfjZJqEGj4HxPRXmB57L3PN+
	RAllxz70aYUoe3mPZWlTTp+nVpfHsPiMRcfGP9vQ48HW3nHbWxZUPgh1ftX2IqLXVuuuDQ+y9xG
	AtoIgBNfsqDGKGeTlQU26baz4l2NAMM+nL2qxvRVlNN4MkfWkjuBNLnkXKqPEMDhvy2X1FtUTq5
	ob4lcwlMpiiYFkumyLYrwaY4M5wxdg9KlGwZQmUVrLZD52Q8F31R+uydGrKhr5RfEyXL2/vrgx0
	fgQKhEUrTPJe+6jnb47F4X0nFTzld8F6E/iI1Kk0+XnZp/geJf4u1dq8xHQJXuFTrn4lFn2lOyX
	0cCX/jI9yimY1VNjnvqolRmOeUa3HcJfLzazSp7l9Dz22ucjNZwQnVpYR73qRduhikEMZQg5WC7
	aW0SH9PfQcq/ybJYTyvHhmjQcxCQh17N8WvYPbIWwIte/zgwl5Cb3yyJasVk1WmVRBsHHdrvAdF
	zlyabZklIjJ1mH5Kj76Zp3zEPOkdvHWvEmjQyAryRGMx3HYeCNxzoik1JMAuUWZYgHNcBYiT7fm
	KhIKvfkMZ46fo3xMiHaC810o2Q==
X-Received: by 2002:a05:600c:310e:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4b943f77102mr84311995e9.0.1794242195171;
        Mon, 09 Nov 2026 08:36:35 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:34 -0800 (PST)
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
Subject: [RFC PATCH v7 08/29] sched/rt: Introduce HCBS specific structs in task_group
Date: Mon,  9 Nov 2026 17:35:54 +0100
Message-ID: <20261109163616.195264-9-yurand2000@gmail.com>
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

Add an array of sched_dl_entity objects in task_group.

Create the dl_bandwidth struct and add a field for it in task_group.

Add a rq pointer field in struct rt_rq.

---

For each CPU on the host system, the task_group manages a sched_dl_entity and
a rt_rq object, which in turn keeps a pointer to its locally managed runqueue.
The sched_dl_entity object manages the deadline server which will be scheduled
for execution on the CPU, while the rt_rq object is instead used to reference
the local runqueue's specific data and entities and it is used when an actual
task must be scheduled when the CPU is given to the dl_server.

The dl_bandwidth object keeps track of the currently allocated bandwidth for
the cgroup and the currently active context. RT-cgroups can either run tasks
themselves or can delegate the scheduling of their tasks to their parent, the
active_context field keeps track of which cgroup is serving the tasks.

Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/sched.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 27cb594cdfe9..94c530d1ce0c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -322,6 +322,15 @@ struct rt_bandwidth {
 	unsigned int		rt_period_active;
 };

+struct dl_bandwidth {
+	raw_spinlock_t		dl_runtime_lock;
+	u64			dl_runtime;
+	u64			dl_internal_runtime;
+	u64			dl_period;
+	struct task_group	*active_context;
+};
+
+
 static inline int dl_bandwidth_enabled(void)
 {
 	return sysctl_sched_rt_runtime >= 0;
@@ -499,10 +508,17 @@ struct task_group {
 #endif /* CONFIG_FAIR_GROUP_SCHED */

 #ifdef CONFIG_RT_GROUP_SCHED
+	/*
+	 * Each task group manages a different scheduling entity per CPU, i.e. a
+	 * different deadline server, and a runqueue per CPU. All the dl-servers
+	 * share the same dl_bandwidth object.
+	 */
 	struct sched_rt_entity	**rt_se;
+	struct sched_dl_entity	**dl_se;
 	struct rt_rq		**rt_rq;

 	struct rt_bandwidth	rt_bandwidth;
+	struct dl_bandwidth	dl_bandwidth;
 #endif

 	struct scx_task_group	scx;
@@ -906,6 +922,12 @@ struct rt_rq {
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
 #endif
+
+	/*
+	 * The cgroup's served runqueue if the rt_rq entity belongs to a cgroup,
+	 * otherwise the top-level global runqueue.
+	 */
+	struct rq		*rq;
 };

 static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
--
2.56.0

