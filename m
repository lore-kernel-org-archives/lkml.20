Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414429;
	b=WFaOC8NDEer59NOm/3/br7AT2nUoaj4lVHaHqdsxTUwoGqpOVITFFsUlFSUqCug6kHgP
	 0Mdc0Ou8UEP9byqaiTZZggqkW/GqHtc7olO3ae0pQAO/F3WQJc1eqQ+5ofYk1lX4Xa197
	 5RrzFhKo4btZXhs9+OFwU/TMMVv8xue39H4tuzPqTq6yvtY5buOMTQZ6VC8kzLr8bdwck
	 ZYUh6hgJ1w9DkfvEJuq7WO0bSpnyb88dKJQYd+JWT8ydgw74fR6COeB8qfdoXh8xMNxE1
	 RpqThJCT/5eL7u0NtVfWxW2fdoJ7N7uZwHZXVDp05GnJT+X++J1V3Cm5aamkQ74Cl4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kmVh2q2hoDBqiX4Uz/7oHg+C+WnsN1l5lj+X9HPrX/o=;
	b=nu3m7UfkNhK2UkKIpA1CjIoxr61bED8aSXPG3Bzp1vESwr3ACZhIPsnVA1kTspecA5rh
	 OmqBlDvgo85QXDcqUWQG0SdeglBUFHcMVBELYioJhz79LBa+CDYOtuAwxTpRNDYda2kJh
	 Fwl9ZqVyr5ZJ3cA+2AuVvjhmI1kX8VnAjjvDS5E5rI6pkCRB2Mji70hQal5forENivDzi
	 AbFBW31ZicQQymT+f1hv5qfdqMLmZfCHWDeT/YukFrZwPdqzFg/abyP33WrgCYd3spXud
	 g4EanAOi1nVj4rA6+Lenii530e0YWNxrA1ukRJ56wTIdniInWCV0jCqNhBU5LPZtGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTbeqADq;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414ED606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 414ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTbeqADq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490585eddfcso2620552f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414428; x=1795019228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmVh2q2hoDBqiX4Uz/7oHg+C+WnsN1l5lj+X9HPrX/o=;
        b=jTbeqADqi91Gqw+fkOctkx3GVd3Jt1bpvIADJ5uCM27fyE7hAUwven/vSt0nYCCdFr
         IqUZTfWY+l6alw8r50Wl2QRxt3+j4t6J7hita6vQzOedaDuSBbz87axGBYTffrWszbsr
         2RFzJ39hv0MBxTgas0M1UBUYrArmlJks7ReOFU7XOxMc8fiwUcmu/zfz6HpnwmyrJjg0
         WbGcZmfuWJV64dqx0oKnCONfPx0SX1CFx3v5XASJoxiT7Oz24f5JLebR7/R6yV6tS7bh
         lVUKeGMPST2tz8dVrYxq2vd2h4XhH/yEEiQtiKdGqeNAe5BmB3wxFyKSs4ZUjucLPqUp
         FmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414428; x=1795019228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmVh2q2hoDBqiX4Uz/7oHg+C+WnsN1l5lj+X9HPrX/o=;
        b=yi64ZQzEW1fWFL019vfoQnN9fq+bGhIuvpmLCKPCKCbi4pxYH6Yc7DThkhTJ7z72xi
         LY/5Enx1P3ZLklvfiZokwf76KHa1Vb6QEqZZaFr3A495oGSJGR6LeE4u9gZHkgtYOWYg
         0z54Z/EHwJZ28fSoW/YsiCD9bd4dgBsT76WoKzHIbXaJ5AhyzD5UZC9SQPsHlheMU9jF
         dIUPL8OlKSZaw7bUr6JmF9dGJ0BADYyg2d+um20x94bvn8SAs6X+UV51IQJN0YWTP0Rb
         D9CmRKoX+Wws5styLbhB72ySUKiajKOFfFVgVX7zyU1zD5Q9HHyHze1ZFV38ysDs9UqK
         wO9A==
X-Forwarded-Encrypted: i=1; AL+hErH2D0/6i4uZ59c+YK0ec+blHOCPf4UPZ0QNO2yVQRYSxep/Y27FvX1DGqjda0i5TuNJ2LhQMunIKP0mfg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/g7+C8N4k4qeaDwSPzt4u/220qd1l7W1tpkVRn0VQGphn+IWL
	/But4RQNPIPvl0F9s1Uh7WVP41qcEKekLeIonAm5j+74a9a63UQikBs2
X-Gm-Gg: AYBFou0ZWXFqZ4Eeb4wzJiO5vNRqX9mMDWtb4cBxlTWyeqCmM7jk2H4S8hmxC1aW5Mc
	4hTUVEDa8wwRs19TwXPw5m9xz+OI+UXUsh4wPMHaY0Ma3RiGTtEbeGSjJP5JSdj9O04nYrvK13h
	I9nekUfWC7E5vivKLUVUkVzhiZGADcAB2TZGzNJDU2ls5ayHHpKazgH2Oua0ysJP3FCptZJR2jm
	iGYJqAkiRZRZhtFml73X6GNGZobvPMfvNMIUVSeGEwMUjXZEGnJciBLmCQNXqTmMNWORNyxTnjk
	4Q37d8y5mMt0piBc5Igx0vF5hIawXmreCRI+fllCa5catum8iroi8c2lvNOVQ535SZqoc3sfhco
	xGXw7DSjdKZKceq6Ian1wOpGtk03SrC2Dnx+nKFcJ77tEHM3LZH0x0GmGc992VYEyG17wCM7ytj
	qZ1jUR1Eo5wtiyHEAS5nfxg/S1eWcQDVrg5nrAORXuX4M47xWlJtC55TNzVPunPjI4rIlnd5e2m
	QTYMyTyxsMKiDrXYOnAhhbW0Ga0HOOddsu63HQZUPMbWFMML5lI7Y2Nd19rmu+qXVgziVn1kPdp
	U/20y3I6a74kRJzdsP62iGtCl9N40j354g==
X-Received: by 2002:a05:6000:220d:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-499c4815411mr5481170f8f.6.1794414427394;
        Wed, 11 Nov 2026 08:27:07 -0800 (PST)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm11472573f8f.48.2026.11.11.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:27:06 -0800 (PST)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Felix Moessbauer <felix.moessbauer@siemens.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/io-wq: apply the current cpuset to new workers
Date: Wed, 11 Nov 2026 16:27:05 +0000
Message-ID: <20261111162705.1150983-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit 84eacf177faa ("io_uring/io-wq: inherit cpuset of cgroup in
io worker"), io_wq_create() copies the cpuset of the creating task into
wq->cpu_mask, and io_init_new_worker() gives each new worker that copy.
A cpuset change, or a move of the task to another cgroup, updates the
workers that exist but not the copy, so workers started later run on
the CPUs the cgroup had when the io-wq was created, which may since
have been given to other tasks. Workers come and go for the life of the
io-wq, and a worker that cpuset moved is also retired at its next idle
timeout and replaced on the old CPUs.

Keep wq->cpu_mask for the affinity of the io-wq itself, all CPUs or the
mask set with IORING_REGISTER_IOWQ_AFF, and intersect it with the cpuset
of the worker when the worker starts, falling back to the cpuset if the
two do not intersect, as __set_cpus_allowed_ptr() does. Use the same
mask in the idle exit test, and go back to all CPUs when the registered
affinity is removed.

Fixes: 84eacf177faa ("io_uring/io-wq: inherit cpuset of cgroup in io worker")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
---
Tested on x86_64 under QEMU/KVM (8 CPUs, cgroup v2, PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP, CPUMASK_OFFSTACK) on io_uring-7.4 with and without
this patch. A test program blocks requests in io-wq workers around
cpuset changes and checks the affinity of every worker:

  case                                          without   with
  cpuset 2-3 -> 4-5, new workers                FAIL      pass
  idle worker retired after the change          FAIL      pass
  cpuset grows 2-3 -> 2-5                       FAIL      pass
  task moved to a cgroup with 4-5               FAIL      pass
  IORING_REGISTER_IOWQ_AFF 2-3, cpuset 3-6,     FAIL      pass
    then 4-5, then unregister
  CPU offline and online                        pass      pass

No lockdep or sleeping-in-atomic reports. The liburing test suite gives
the same results with and without the patch (iowait fails in some runs
on both kernels: 5 and 7 of 20). A liburing test for this,
test/iowq-cpuset.c, follows separately; it fails without the patch and
passes with it.

The cost is one cpuset_cpus_allowed() per worker start and per idle
timeout of a worker, not per request: 0.3-0.4 us against about 60 us
for create_io_worker(), measured with the function graph tracer.

The patch applies unchanged to for-7.5/io_uring and to 6.18.y, where
the results are the same. The bug was first seen on real hardware with
6.18; the fix was tested only under QEMU. Not tested: architectures
other than x86_64, and cgroup v1 cpusets.

This patch was developed with Claude Code (Anthropic, Claude Opus 5.5).
The problem came up while I worked with it on CPU isolation for VMs in
EVE (LF Edge): asked whether QEMU's io-wq workers can appear after a VM
has started, it found in the code that workers started after a cpuset
change keep the old CPUs, and reproduced that. It then wrote the fix,
the changelog, the test program and the QEMU setup, and ran the tests
above. I have reviewed the patch and the test results.

 io_uring/io-wq.c | 44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 92df54c6f50ca..f2f3c3aad19b5 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -741,6 +741,34 @@ static bool io_worker_retire(struct io_wq_acct *acct, struct io_worker *worker)
 	return false;
 }
 
+/*
+ * The CPUs a worker of @wq runs on: those of the io-wq affinity that the
+ * worker's cpuset allows, or the cpuset if they have none in common, as the
+ * scheduler does with a task's requested affinity when its cpuset changes.
+ * Read the cpuset each time: it can change while the io-wq exists.
+ */
+static void io_wq_worker_cpus(struct io_wq *wq, struct task_struct *tsk,
+			      struct cpumask *cpus)
+{
+	cpuset_cpus_allowed(tsk, cpus);
+	if (cpumask_intersects(cpus, wq->cpu_mask))
+		cpumask_and(cpus, cpus, wq->cpu_mask);
+}
+
+/* Is the current worker on a CPU that a new worker would not get? */
+static bool io_wq_worker_off_cpus(struct io_wq *wq)
+{
+	cpumask_var_t cpus;
+	bool off;
+
+	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
+		return false;
+	io_wq_worker_cpus(wq, current, cpus);
+	off = !cpumask_test_cpu(raw_smp_processor_id(), cpus);
+	free_cpumask_var(cpus);
+	return off;
+}
+
 static int io_wq_worker(void *data)
 {
 	struct io_worker *worker = data;
@@ -819,8 +847,7 @@ static int io_wq_worker(void *data)
 		}
 		if (!ret) {
 			last_timeout = true;
-			exit_mask = !cpumask_test_cpu(raw_smp_processor_id(),
-							wq->cpu_mask);
+			exit_mask = io_wq_worker_off_cpus(wq);
 		}
 	}
 
@@ -870,9 +897,16 @@ void io_wq_worker_sleeping(struct task_struct *tsk)
 static void io_init_new_worker(struct io_wq *wq, struct io_wq_acct *acct, struct io_worker *worker,
 			       struct task_struct *tsk)
 {
+	cpumask_var_t cpus;
+
 	tsk->worker_private = worker;
 	worker->task = tsk;
-	set_cpus_allowed_ptr(tsk, wq->cpu_mask);
+	/* Without a mask, the worker keeps its creator's CPUs. */
+	if (alloc_cpumask_var(&cpus, GFP_KERNEL)) {
+		io_wq_worker_cpus(wq, tsk, cpus);
+		set_cpus_allowed_ptr(tsk, cpus);
+		free_cpumask_var(cpus);
+	}
 
 	raw_spin_lock(&acct->workers_lock);
 	hlist_nulls_add_head_rcu(&worker->nulls_node, &acct->free_list);
@@ -1369,7 +1403,7 @@ struct io_wq *io_wq_create(unsigned bounded, struct io_wq_data *data)
 
 	if (!alloc_cpumask_var(&wq->cpu_mask, GFP_KERNEL))
 		goto err;
-	cpuset_cpus_allowed(data->task, wq->cpu_mask);
+	cpumask_copy(wq->cpu_mask, cpu_possible_mask);
 	wq->acct[IO_WQ_ACCT_BOUND].max_workers = bounded;
 	wq->acct[IO_WQ_ACCT_UNBOUND].max_workers =
 				task_rlimit(current, RLIMIT_NPROC);
@@ -1574,7 +1608,7 @@ int io_wq_cpu_affinity(struct io_uring_task *tctx, cpumask_var_t mask)
 		else
 			ret = -EINVAL;
 	} else {
-		cpumask_copy(tctx->io_wq->cpu_mask, allowed_mask);
+		cpumask_copy(tctx->io_wq->cpu_mask, cpu_possible_mask);
 	}
 	rcu_read_unlock();
 

base-commit: 39c7210e970200f8b17de3767c73efe64173a95f
-- 
2.43.0

