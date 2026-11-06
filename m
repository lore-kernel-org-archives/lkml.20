Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978393;
	b=SDdAr0FIj6PVUjrNcluhfTQdXz5xsHCa0eC+YwTPF1i4bz5rhQbAYd7qFVkHHHNjx9Qn
	 O1Flv96O+AnnKF0NnsL+wVGfXyR+RAQ9h5xcQqXz4tucSib3O5QDKAz1K14DXPklT48rM
	 BUoM10QLFvVTp9VyuWBVT28F0Vi6/ZQjt4aavARJwo2YQxxx87drwy5fvq2Xsf2Shi0JT
	 sV8zJJzO7aD0vXTh56KyKJr0+WY9R966L0GgBYSZiXr+1pNi2cbAdAA//C89bHkaVH3sD
	 7PLMRr8CFlYI9MGQq0J2ooM9q34aOHhwbNDA9SFPD3au/bX04vnG4gFtaM/zmkE5z3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gBLDmfOFqzDBEdd0Idmiin6AHrC4gxbENwGxw/e9rM=;
	b=pooaU7QASbu5nWvMikj9fpcINg7TEXrnvYOgf4eCvBUjoLL5m3BvjdUH3XCZ8PtuEN1V
	 5Qpw9p7q6aH+hT+RK74tx9T5E6Z+1AqInKZQepshn2Ec0+v78BpfqifvlCHa9xj/MJMyo
	 +Wr4BGQUQAlDmleRHU6dVMjERkgFgVXFzEJp3HvmlIdZV96Wo0uY3XG45PlGhFVOJ9QUP
	 4O7dyksdDj6mYFPL37gVF1oiiSMgEcutbbJLLrzsodq6FCt3MBwbTBN64FeYqVRCLg1Dt
	 fmDWiPxiBSQwwEH4GMd8fdExvYT2cbeQjZvq5rmJDINmdtVH66e0TDR5MJysXttKQWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeIf3dVe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD5606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFD5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeIf3dVe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e4831c028so773506f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978391; x=1794583191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gBLDmfOFqzDBEdd0Idmiin6AHrC4gxbENwGxw/e9rM=;
        b=qeIf3dVerLw3j/BsyQCO6tua6vtNorh7+KV33OyfdM7dlEa0Ao7piVmtbbkbo1D4nV
         T74IXaIbGpYwR8K6CMycoUuXR+buNYyuLM+VYYJp6uM5O732ks52xD1B1HjvElf6zsbG
         TQ9OMcYa1G9BTyj46shZBtOzKBEj+qudwNdZ0R5+33+9VaELRIwS816/g9bDBjyMbo1J
         zM1B4XgTz4CXfXYQY20bX/Xmpd3rMnXyEqjOaOlijwc/3B6zl9tamIPNgoQwSwEvWqNw
         756yHSRhMDeikkI0+bU7BZDtyhBFviDZhHDHc1iz6zsCZMTz/O3JtNrvGPNIjur0ypR9
         oIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978391; x=1794583191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gBLDmfOFqzDBEdd0Idmiin6AHrC4gxbENwGxw/e9rM=;
        b=U+E0ZIQRyzft/R+QLBy/PUypmxpjzo4+wiymauDnJCCSjwBRDzAdwkyNbhsyrca48v
         eQY1jW2F1/iTdzvVsMinfE0aQqTR65+5fnmxczhGfpdqk5uKknalGX5vVKO2Humb+Qio
         HW0qb99N5MLkww1cC5gN6hWNCwpuy0+idatOEsg9uf5BC5GSSt4Y0FjCBrsbNunAATfu
         cls7Oo1f4B804G0ahQyRPH97q4RpCVQzffnlwK9jAcJ7LKtrtWYa3f0bMZkzmZ3qwMM/
         QDPFbMDtssbJdZdXLzTVeMpAgGvUpsenTV7uL9KsiPyfQe86ibLyUUJ3dvD+MmwcgmQm
         AGRg==
X-Forwarded-Encrypted: i=1; AL+hErF0zImsze7bQnbdARoeoFXOraFsWWsTSvdxIWzBmsSRtx/Cx0Lz5vQwJz7QMG0hv9DgHUGzLnS77qp8b5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eh9scYVACVxr7zq3P1H1Q9blv76dLHld3TRg3k198url+5Z/Q
	q6LwCB47ObK8DxJCuYU21TqfvuALK001aL6WrFVus2aNvmjQlKVhoY+/fI2wuCVAS44=
X-Gm-Gg: AYBFou27z1EwmGVGVYRAtSko3zHxZ5tSekzVrpd7YdQXnorZhGnqkyK4aBDriSf79LY
	zKFgND+v6tli188L3Kk28sf+ZzcHLjrgBmOwcoIWOBo5eKiqMTkP9ql7kgrSJp3JfEzaNQOxu4U
	LYn87ovCvgD+1EZ1sphz9ZOGLH6PSyEzJZaDkTN9s5d4YbNbx04Jui/bwhLKpziNF+RMObNLoWG
	uAjXebrT0vNDZrZDuVhYQUkflvHojFhSaLAuuLKf6qxO5owBmF30iiO/3rcA3Gc2gohURUjg9ed
	gQW4M1uZi7GaQ4N/FOfRu4goGrwhJl1IR0BQZP8ZRt9R5+MoAE5LNOQtkmnuPELoZunKCgVGS4Q
	ho+I6bK8uCd26j1bvzGtKETCzFa4TorHrcwgRAg45B5Y9/cldkaKk20vMutitrgMMF4Bmv79d5c
	hRohDDTW3ougP5wdk7ND7Xd4iBDnQvD9uZ2dQqo2LWt/QqCpY089pT9mXG5IbJw/tRCzVzl4YSs
	sQlYNzjyOENUwKXmTiKV3s1XhZlFrYgqQaivNhw0Lyzb/uFOtHNt4ompiHVzRTYMcKyskXcodjs
	wrGUtJdqJrEA04fHMGKLT6P5qOtwIr7sDDNuAbxyUYFDhhE=
X-Received: by 2002:a05:6000:1861:b0:493:803e:800f with SMTP id ffacd0b85a97d-493803e802cmr2233344f8f.29.1793978390924;
        Fri, 06 Nov 2026 07:19:50 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:50 -0800 (PST)
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
Subject: [PATCH 00/18 v3] Improving latency of short slice tasks
Date: Fri,  6 Nov 2026 16:19:27 +0100
Message-ID: <20261106151947.3991524-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
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

This is another round of scheduling latency improvements which fix
some remaining corner cases and start to fix somes cases when multi
short slice tasks are running simultaneously on the system.

This patchset gathers 5 different parts:
- Patch 1-4 implement decay of positive lag
- Patch 5-6 take into account slice when selecting CPU
- Patch 7-12 add push callback for fair
- Patch 13-15 use push for migrating short slice task that failed
  to run at enqueue
- Patch 16-19 modify feec to take into account slice when selecting CPU
- Patch 20 handles case where several tasks select the same idle CPU

I run my usual set of scheduling latency tests on dragonboard rb5
- cyclictest with a 3777us period and a 8ms slice alone
- cyclictest with a 3777us period and a 8ms slice. 2xNR_CPUS rt-app
  tasks that run (8177us) and sleep (17777us) with a 16ms slice.
- cyclictest with a 3777us period and a 8ms slice. Hackbench with
  1 group using thread and pipe and a 16ms slice.

NB: periods and run duration have been chosen to minimize alignment
with tick or other periodic activities.

Each test is 130 seconds long

scheduling latency (us) for cyclictest
                   tip/sched/core| this patchset
slice                 8ms        |  8ms         
99th Percentile               91 |    92 (- 1 %)
99.9th Percentile            128 |   161 (-26 %)
Maximum                      273 |   223 (+18 %)

scheduling latency (us) for cyclictest and rt-app
                   tip/sched/core| this patchset
slice                 8ms / 16ms |  8ms  / 16 ms
99th Percentile               65 |    68 (- 5 %)
99.9th Percentile            986 |   913 (+ 7 %)
Maximum                     6229 |  5715 (+ 8 %)

scheduling latency (us) for cyclictest and hackbench
                   tip/sched/core| this patchset
slice                 8ms / 16ms |  8ms  / 16 ms
99th Percentile               74 |    90 (-22 %)
99.9th Percentile	     643 |   997 (-55 %)
Maximum			   13501 |  4454 (+67 %)

The 99.9th percentile are a bit worse mainly because of the decay/reset of
positive lag. Eternal positive lag was beneficial for cyclictest which
doesn't do anything while running and slowly decrease its large positive
lag. Now its positive lag elapses while sleeping and cyclictest is
enqueued with a null lag most of the time. On the other side this reduces
cases where long sleeping task with large positive lag can preempt or
prevent short task to run first.

For testing cases w/ multi short slice tasks, I run a new rt-app test that
wakes up simultaneously 4 short slice tasks while 16 normal tasks are
also enqueued. All tasks wants to run 1ms every 7777ms. The 4 short tasks
have an uclamp min of 512 to target the high and mid cores on my system
(1 task per core)
(SIS_UTIL is not disabled unlike for v2)

tip/sched/core
			Task-O		Task-1		Task-2		Task-3		
Average              |	1051		  52		1051		1093
Median (P50)         |	1091		  53		1091		1092
90th Percentile      |	2133		  53		2132		2133
99th Percentile      |	2400		  53		2398		2394
99.9th Percentile    |	2519		 120		2518		2408
Maximum              |	2523		1327		3097		2415

+ The patchset
			Task-O		Task-1		Task-2		Task-3		
Average              |	61		61		60		61
Median (P50)         |	60		60		60		60
90th Percentile      |	62		62		62		62
99th Percentile      |	62		62		62		62
99.9th Percentile    |	1839		2012		63		2175
Maximum              |	2175		2066		2176		2689

On tip/sched/core, the 4 tasks tends to wake up on the same CPU whereas
this patchset pushes the tasks which aren't picked on another CPU.

Beside the results above I noticed significants performance improvements
for hackbench with pipe which were not expected.
"sched/eevdf: Decay positive lag of sleeping entities" is the patch that
provides most of the performance improvements

The test were run with the default 2.8ms slice to check for some
performance regressions

hackbench             tip/sched/core   this patchset
 1 group process pipe 0,862(+/-3.9%)   0,839(+/-1.3%) (+ 3%)
 4 group process pipe 0,725(+/-1.5%)   0,593(+/-1.3%) (+18%)
 8 group process pipe 0,640(+/-4.2%)   0,546(+/-2.2%) (+15%)
16 group process pipe 0,620(+/-3.9%)   0,528(+/-0.8%) (+15%)
 1 group thread  pipe 0,917(+/-2.8%)   0,907(+/-2.2%) (+ 1%)
 4 group thread  pipe 0,838(+/-4.5%)   0,697(+/-3.6%) (+17%)
 8 group thread  pipe 0,774(+/-1.5%)   0,583(+/-2.5%) (+25%)
16 group thread  pipe 0,628(+/-2.9%)   0,548(+/-2.1%) (+13%)

Those tests have been run with perf scheduler (Using schedutil and EAS
provides similar results)

Changes since v2:
- Remove min_slice comparison during wake_affine which didn't provide
  benefit at the end
- Added reset lag when migrating
- Fixing stacking on idle cpu case
- Tried to cover all the comments I received in v2 and more while running
more test and reviewing the changes

Changes since v1:
- Change decay_entity_lag to take into account cfs load but not
  migrated task yet.
- Reset lag if the CPU entered idle while task was sleeping.
- Move lockless min_slice in struct rq and use usigned long
  which is enough for slice which stays in range [100us:100ms]
- Merge min_slice rq selection in select_idle_capacity() and
  select_idle_cpu()
- Add push callback mecanism for cfs
- Push short slice tasks that are not selected at wakeup
- Update feec() to take into accoun slice when selecting a CPU

Vincent Guittot (20):
  sched/eevdf: Decay positive lag of sleeping entities
  sched/eevdf: Reset lag at wakeup when prev CPU has been idle
  sched/eevdf: Reset lag at wakeup when migrating and prev has been idle
  sched/eevdf: Reset lag when waking up on idle cpu
  sched/eevdf: Add per cpu cached min_slice
  sched/eevdf: Add min slice check when selecting CPU
  sched/fair: Prepare select_task_rq_fair() to be called for new cases
  sched/fair: Add push task mechanism for fair
  sched/fair: Optimize push task mechanism for fair
  sched/core: Add rq flag to tick parameters
  sched/fair: Add force push task mechanism for fair
  sched/fair: Support not wakeup case in select_idle_sibling
  sched/eevdf: Try to push short slice task on a better CPU
  sched/eevdf: Push short slice task that are not picked
  sched/fair: Enable push task for preempt short
  energy model: Add a get previous state function
  sched/fair: Rework feec() to use cost instead of spare capacity
  energy model: Remove unused em_cpu_energy()
  sched/fair: Take into account slice in EAS
  sched/fair: Fix tasks stacking on same idle CPU

 include/linux/energy_model.h |  109 +--
 include/linux/sched.h        |    1 +
 kernel/sched/core.c          |    8 +-
 kernel/sched/deadline.c      |    2 +-
 kernel/sched/ext/ext.c       |    2 +-
 kernel/sched/fair.c          | 1244 ++++++++++++++++++++++++----------
 kernel/sched/idle.c          |    2 +-
 kernel/sched/rt.c            |    2 +-
 kernel/sched/sched.h         |    8 +-
 kernel/sched/stop_task.c     |    2 +-
 kernel/sched/topology.c      |    3 +
 11 files changed, 938 insertions(+), 445 deletions(-)

-- 
2.53.0

