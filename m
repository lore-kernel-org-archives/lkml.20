Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119140;
	b=t6IPRIdKh+hMJmieMFKd97ZFbwNmwgNwJueAlvreALKzLY9n6L5RMZ8Zo/sBs+YwE5HZ
	 rTIFkfaFgy6i4i/RPDEQx5cLQhzm+H0nwE+d1B19KufRjIz6/vWv0MaJAxHpNTOtHW51s
	 cqxC1ZtPnQlTR0a+h7c4bE1ohgcJhOib0Jl0ojf4kZolkwqW/SLfDlkGWNjWzirHFqPF1
	 0J7WLar0hd5ka++4qYrCu2Gfsg7pBZ3qYzcjrR9JA2jzLzAcYILR4BvYNMXP9l3ubj7DZ
	 S3HnbdxsDYKqsigctR4UxjPTdK/sGCwy672OvzCkU0XNM/38zg3enBH8pL52T/6YlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
	b=MzbtarEkcDZ2psdjK/lIC+AyLq1D9w6wO29OfICB54aYBculL2YEWe+jzMOqV9RuZuRB
	 GvbhtQw3kJUUs5PqdtTg8na/p4GJqwDdipnPYwzUgF+tLRx67ybQAPTrJMMutJIMBkXuh
	 G9etp5aCXBzI9xPHzHXeedIgdeIuPYM9iROiLCk1ou5m3j9hysd5s+yAKu/bxsx4P/slQ
	 LZEyAfZ+Anwd3X4ssceZANnkKt2+ouRpRL3l4d3LZNyFZtQOGNUKxCAQBNEBoWqMORyJ1
	 W5Wq2BLHH9audwn5RHhxVWkeVXQgjv5aZK0uEq5t02yrS6HrAj0gLDhZVAcUoDFEcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jx7qFqdq;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB9F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jx7qFqdq
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so17315f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119138; x=1793723938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
        b=jx7qFqdqhYPNuoIM8KV8iZ9x5aEH1s3uAWqqw7VV8uWGH1JtC5Xuk4sN5w30PlYvie
         xT+kALMnLakupfcPQYg97ISDZ5mBOPq9morEzGHWHa5V2SfQvPSomp/jBtFGV6lGifWe
         GgqDu4FxoWbhomR86cYNudVZh/ssA17OhiDP/tjIodlk1k2kKI/vj9TNFRAJKGHDAhkT
         4dM4QkSNR0vnhXnl/e4awY322lvD57qlyCkpoSdcghnYFQkHkBT1GrWkMKlUKmFJu/3Z
         dkzT2R72u/XBsiV6ICsaxBAM0U5icw8xYxOUJMiiTQZb2mL1mSr7qGF8cB/mCFsaGPKC
         PjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119138; x=1793723938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
        b=rRMhKHnzlTwTHtXIOjMyto4n/TYK0d2XQUfzVCp/qMSZFk7CkcCCvq4p3wFEpu6fKv
         pB3ZWS8gC6m1epkt7+q5PONFK+Y1iTVtQPkUuM4Vfy0IXlCN2aj5bdIMlz8RRDP1RFR/
         tEymRSqYuD5LkkpK+sySnYEgk4GidLM/fVaRborM9bCzYWXlnlXLhIz0ExgLF5asqzQS
         44hWtj/s5faMWxM20Tn9PRL4bT62gpIr74lHT1gniBvyhtBWWy6HKbAxTPu01IHwUwAr
         5NIbmRmHX4yNNLIjr/wvqmbmhD7ZGPM+8ITkz6Cvi//uRJtFM3MrVkIvLhMBrR0YpVcG
         KcLA==
X-Forwarded-Encrypted: i=1; AKwUvBzFaeGI0aju7k3CrAVFGrkrs9Pu6Deb99sHBHlMNso0L87SyqKVRsxzq/s8a3DTKsW1ggyI2vw7ibnZ6qM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYh/xXGhbES0Q8LavoFvb5pN1+w5vY5ZFmIjk5wUnG6Y+oaIc1
	KlB3SG3S4i1Ub0Azvtnuliv9Eb295VZ/JZWSUuwL+6er7SM0e3RURNUu
X-Gm-Gg: AYBFou2nJ1rGKBZuMCFVdYdPEFes81ipLSwnCiB5scd1rhIf70ppYmtsmXv//kbHpOI
	nngQo8oJ8MNo0Eg10Hh/zB6swdUXKPbhBHx0JM7r/tikTe+tapzB8fsTc+U1VcIwOFxMbjuRYEt
	HRz5EyvEnPxd8/2PnikSQll6XDSUb1pa3k1RLKwUe1YLheSOyga9JQANlQpUJAgR9E9/MeArAvQ
	GZRwxFvNsZUIIX9caBXB92t73Z7xZ0NSLikMasDnXQtUIwAQBSqztRx08dnTmytehvi7kZ1JeYx
	WICJYKpSEZj+balDvSmJHVJ+zRI2fDqYJGMyWn5Q+KGuVCQGRO2Q6XKKp+WOGEuRgKIAQX9VeRI
	wk0Mpno00rPPzlD3g1borSIwGNXulTb50cWk/W4iRkOheGva1fPX/Txj2eO6jUCtl7CEfwROoO2
	OYePbL3x+K/bAi2fjYlgA862jaQcjj0qu9gZGlSWvvK/rZtAuL8vCK7PYX+MR0ZGla9AQbPUDOX
	Q7XkvLa91FwKH338B5XDiU9q3zdcTGwlsHnjT/kxcppc41623BP2nzTAs1izp2RYEApuDzzH8bX
	94llPM8edpvNYqfaAWVAMUbgG2XCyn7CjEaKwGazvhu7cTk=
X-Received: by 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr139023805e9.22.1793119137915;
        Tue, 27 Oct 2026 09:38:57 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:57 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 4/4] hazptrtorture: Nest a second hazard pointer in readers
Date: Tue, 27 Oct 2026 17:38:06 +0100
Message-ID: <20261027163811.2470569-5-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
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

hazptrtorture rarely exercises the race fixed by "hazptr: Record per-CPU
slot owner after claiming the slot": an interrupt handler acquiring a
hazard pointer after the interrupted task chooses a slot in
__hazptr_acquire() and before it claims it.  Readers get there only when
their pointer is NULL or changes under them.

This commit therefore adds the nest_acquire module parameter, which
makes a reader acquire and release a second hazard pointer while holding
the first, once per the specified number of acquisitions on average
(default two, zero disables).  While the outer hazard pointer is in
slot 0 of the reader's CPU, the nested acquisition finds that slot in
use and goes to __hazptr_acquire(), where hazptr_torture_acquire()
handlers from other readers can interrupt it.

Without that fix, and with the checks added by "hazptr: Check per-CPU
slot owner with CONFIG_HAZPTR_DEBUG", the PREEMPT and NOPREEMPT
scenarios at default parameters report the race 6.3 and 6.0 seconds
after boot, and NOPREEMPT oopses 1.3 seconds later.  With
nest_acquire=0, both run 10 minutes without a report.

With the fix, 30-minute runs of both scenarios pass, as does a 10-minute
PREEMPT run with irq_acquire=100 and nest_acquire=1.

The nesting costs about a third of the outer reader iterations, as seen
in the IPI acquisitions, which readers send once per irq_acquire
iterations.  PREEMPT counts acqirq: 270645 in 10 minutes without nesting
and acqirq: 544976 in 30 minutes with it.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 kernel/rcu/hazptrtorture.c                    | 27 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e3c5a6b68fc34..63bb7719457dd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1992,6 +1992,12 @@ Kernel parameters
 			is equal to zero, in which case it instead
 			defaults to zero (disabled).
 
+	hazptrtorture.nest_acquire= [KNL]
+			Acquire a second, nested hazard pointer on
+			average one out of the specified number of
+			reader acquisitions.  Zero disables.  Defaults
+			to two.
+
 	hazptrtorture.nreaders= [KNL]
 			Number of hazard-pointer reader kthreads, each
 			of which repeatedly acquires and releases hazard
diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index c46083a8af093..4373bc5fe11e5 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -37,6 +37,8 @@ torture_param(int, irq_release, -1,
 	      "Release hazard pointers from irq handlers once per specified #, zero to disable");
 torture_param(int, kthread_do_pending_ms, -1,
 	      "Delay between cleanups for deferred hazard pointers (ms), zero to disable");
+torture_param(int, nest_acquire, 2,
+	      "Nest a second hazard pointer once per specified # of reader acquires, zero to disable");
 torture_param(int, nreaders, -1, "Number of hazard-pointer reader threads");
 torture_param(bool, nwriters, 1, "Number of hazard-pointer writer threads, 0 or 1");
 torture_param(int, onoff_holdoff, 0, "Time after boot before CPU hotplugs (s)");
@@ -449,6 +451,22 @@ static void hazptr_torture_defer(struct hazptr_pending *hppp, struct torture_ran
 	atomic_long_inc(per_cpu_ptr(&hazptr_torture_releases_defer, raw_smp_processor_id()));
 }
 
+/*
+ * Acquire and release a second hazard pointer while the caller holds one.
+ * If the caller's hazard pointer is in this CPU's slot 0, this acquisition
+ * takes the slow path, which first tries another per-CPU slot and can race
+ * there with hazptr_torture_acquire() handlers.
+ */
+static void hazptr_torture_nested_reader(struct torture_random_state *trsp)
+{
+	struct hazptr_pending hpp;
+
+	hpp.hpp_htp = cur_ops->readlock(&hpp.hpp_hc);
+	atomic_long_inc(per_cpu_ptr(&hazptr_torture_acquires, raw_smp_processor_id()));
+	if (hpp.hpp_htp)
+		hazptr_torture_reader_tail(&hpp, trsp);
+}
+
 /*
  * Hazard-pointer torture reader kthread.  Repeatedly dereferences
  * hazptr_torture_current, incrementing the corresponding element of the
@@ -497,6 +515,8 @@ static int hazptr_torture_reader(void *arg)
 			schedule_timeout_interruptible(HZ / 10);
 			continue;
 		}
+		if (nest_acquire && !(torture_random(&rand) % nest_acquire))
+			hazptr_torture_nested_reader(&rand);
 		if (time_after(jiffies, lastsleep) && !torture_must_stop()) {
 			torture_hrtimeout_us(500, 1000, &rand);
 			lastsleep = jiffies + 10;
@@ -721,6 +741,7 @@ hazptr_torture_print_module_parms(struct hazptr_torture_ops *cur_ops, const char
 	pr_alert("%s" TORTURE_FLAG
 		 "--- %s: nreaders=%d nwriters=%d "
 		 "defer_modulus=%d irq_acquire=%d irq_release=%d kthread_do_pending_ms=%d "
+		 "nest_acquire=%d "
 		 "onoff_interval=%d onoff_holdoff=%d "
 		 "preempt_duration=%d preempt_interval=%d "
 		 "reader_sleep_us=%d "
@@ -728,6 +749,7 @@ hazptr_torture_print_module_parms(struct hazptr_torture_ops *cur_ops, const char
 		 "verbose=%d\n",
 		 torture_type, tag, nrealreaders, nwriters,
 		 defer_modulus, irq_acquire, irq_release, kthread_do_pending_ms,
+		 nest_acquire,
 		 onoff_interval, onoff_holdoff,
 		 preempt_duration, preempt_interval,
 		 reader_sleep_us,
@@ -891,6 +913,11 @@ static int __init hazptr_torture_init(void)
 		WARN_ON(IS_BUILTIN(CONFIG_HAZPTR_TORTURE_TEST));
 		irq_release = 0;
 	}
+	if (nest_acquire < 0) {
+		pr_alert("Cannot have negative nest_acquire (%d), disabling.\n", nest_acquire);
+		WARN_ON(IS_BUILTIN(CONFIG_HAZPTR_TORTURE_TEST));
+		nest_acquire = 0;
+	}
 	reader_tasks = kzalloc_objs(reader_tasks[0], nrealreaders);
 	for (i = 0; i < nrealreaders; i++) {
 		firsterr = torture_create_kthread(hazptr_torture_reader, (void *)i,
-- 
2.53.0

