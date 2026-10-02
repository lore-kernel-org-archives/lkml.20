Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331364189DE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946698; cv=none; b=LGE+83BqQS69V7jEFw54LFL3PnuiX7zHLbaKO9Y7RfiYwYGfyWvoPCmzSaan26bJWw6Jzvr1PWS7JkOi8zYWF3KEbJ3Bz7uLp8ndjBuStn5q7Tadplx/91UYzEhRmuyc1srYX4yHI4+oTN85WqNC+EU7vNmQrH651zd71Wo7OTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946698; c=relaxed/simple;
	bh=9LKpz3kS0U/O+ogCzpthVS7zLgh0K4YTIMJPzUCU0Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXblxcFaBRYzf5j9yHRoF7oSQhH4I8McEVvDLjTj4BI99Nirxh3KbU9/RFsBd7Mh3yiacUEemCFXUI7WT6tMc9jqWmwDP+/n/RVDUjtz5eMFFb5XISEDfhnH07yZlugYsECmQzk7EoEKBxXsQZ7whx2kBWdJ9pGAuvq9J3IqHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0qrgyUM; arc=none smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0qrgyUM"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea0b83f8fso989145eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946691; x=1791551491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXW18KF21LCiFNVNAVkygqJCkvk1Ia+QDkwORzpp+Bk=;
        b=F0qrgyUMn/DtHRvDp1I6VmWz2lgKRF1LdP1Q65wTl5qJxotATi3jFXgZZ5268knBCy
         XtbwNg6fIRuNUr0PbpGFE5mkHHftEAxGmV1gnkcv/sub2VqC1yGLSIlrzpVM1qz409Un
         Wt8V6JEbo0QNXvKGDMeP7onepELRSotQ5sHGpLfwUXMElOUKVZxH5J+UnuYL8RTuv9lx
         F7tvP8O1QkMeoIoA0BwAfsnz1G2nRjbu97PwFYrHY9tMz71ueZNKrYodReNqAApuC6ur
         4BLdanOPS27O9yhYToZTJJCgc4lclkFS+iKvrKsjp+udb9j4oLdo6OQAIJlX0L3bzTDe
         oNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946691; x=1791551491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXW18KF21LCiFNVNAVkygqJCkvk1Ia+QDkwORzpp+Bk=;
        b=h9knUhVT3NnUew4MJZfzYVqWRKHWyiKdZ6W+6nJNGKFDPHbfA0NUrVURWarQCiyrQT
         AMbRtt0ZL2CDlYjmUiqpnou6GFK2/Y6ieJ1F2Tn0nkpL9RJfqjg4HG+cYNawJJLRQ7iL
         kzA7zoRaf1GjpDVoGS2v1hOlykCGObALnP8tQJSAL3VsimEnZgFUvhB+avdSzjuVF1Sa
         qnFH3A/gEO2qYS6pL1KSPvGxwU7dJdASztoj0lUSllh0/2MXdJCKBm31/3y8cGOMMVZ+
         9qjXzaM2PozY5y95BiD7lrIt6II57/Rdu1ko2CcuZheL6cTM0hdx2oheQTKbSEUuM40+
         y8RQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8MYddSCT+v3oRLA9wnASxDbwn/DkoQK0sV2uT6g5eYLcFtKbsDq0FEhbQxs5nxHqchvPF4DSlBb4cnGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4XUT2IuAdlxvm+VVoUg5NgGTX6PbPqaF1LmC8TnuxiD0VZZ3K
	3rKPbRTdF+4whRZf3grmvOojzoET83lkuCJ0rBpzpjTHaLoHJYR0a9RT
X-Gm-Gg: AYBFou2tBiHpFbcyPhcTUvlfffCYr0WPfVPlx3x4aSB6Wka/F/6zqnmsWs38OWd/Q9k
	HiXPjjY6prQZMnPe20tbGqAQn5QCSSHHb4CB1mkuZAaKL741gGTRPML3TcRX53j29adkiWsk5c8
	VKR2wjHO+X9XCX1MC7MxaDl38cLQ8ZMb64jZXumHahkQpQlvYgSK5iL88DPTkxfAzHPItH+mG3A
	dUSJmChxNTYbYFJumHmtS2fzCQBMIzgxQUeG1V+Nzqrlk45zKPNO52mOv1cN/yFNmaCFT1X+CJh
	OzyvnI4wUzl3DwSgcOO1f1tb4l+/gb1by93jy3txJy6TO+4xtJaFKm0/GUMrVbF3bHn2dMeChIG
	nlXePAu1LcNbvKVZH6PYa36UTPdjQm8XmHFixPTX4/XVvQAiD1DAu6GTDKMXAdt6X90EbsBQo/i
	PhmviFPNq5rYLls/UxlWWetn2SJ3tW5bsgflNKx+s3s+a6d5Tt4H//mtSClnCeOU4kAML3VspJ8
	Dql
X-Received: by 2002:a05:7300:b905:b0:343:6622:ee15 with SMTP id 5a478bee46e88-34f150a014bmr4182712eec.11.1790946690523;
        Fri, 02 Oct 2026 06:11:30 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm7309347eec.3.2026.10.02.06.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:11:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 21:10:27 +0800
Subject: [PATCH v5 07/12] watchdog: Sync watchdog_cpumask with
 HK_TYPE_KERNEL_NOISE on isolation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-wujing-dhm-v5-7-78a6996d87ad@gmail.com>
References: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
In-Reply-To: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The watchdog is initialized at boot to run on all housekeeping CPUs
(HK_TYPE_KERNEL_NOISE). When a cpuset isolated partition removes CPUs
from that mask at runtime, watchdog continues running on those CPUs
because nothing updates watchdog_cpumask.

Save the boot-time watchdog_cpumask as watchdog_cpumask_boot, which
captures the user's intended coverage (possibly narrowed via kernel
parameter or sysctl) before any runtime isolation. Introduce
lockup_detector_hk_update() which intersects this boot snapshot with
the current HK_TYPE_KERNEL_NOISE mask and reconfigures the detector.
This ensures that isolated CPUs are excluded while honoring any
manual narrowing the admin applied at or after boot.

lockup_detector_hk_update() snapshots the RCU-protected housekeeping
mask under rcu_read_lock(), then updates watchdog_cpumask and calls
__lockup_detector_reconfigure() under watchdog_mutex, matching the
same locking discipline used by proc_watchdog_cpumask().

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/nmi.h |  2 ++
 kernel/watchdog.c   | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index af69712df5f48..409af7884d939 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -37,6 +37,7 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
 static inline void lockup_detector_init(void) { }
 static inline void lockup_detector_retry_init(void) { }
 static inline void lockup_detector_soft_poweroff(void) { }
+static inline void lockup_detector_hk_update(void) { }
 #endif /* !CONFIG_LOCKUP_DETECTOR */
 
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
@@ -120,6 +121,7 @@ void watchdog_hardlockup_enable(unsigned int cpu);
 void watchdog_hardlockup_disable(unsigned int cpu);
 
 void lockup_detector_reconfigure(void);
+void lockup_detector_hk_update(void);
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
 void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index e567fbb0d4692..d4eccb8e337f1 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -53,6 +53,8 @@ static int __read_mostly watchdog_hardlockup_available;
 
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
+/* Boot snapshot: user's intended watchdog mask before any runtime isolation. */
+static struct cpumask watchdog_cpumask_boot __ro_after_init;
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR
 
@@ -1348,6 +1350,27 @@ static void __init lockup_detector_delay_init(struct work_struct *work)
 	lockup_detector_setup();
 }
 
+void lockup_detector_hk_update(void)
+{
+	cpumask_var_t new_mask;
+
+	if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
+		return;
+
+	rcu_read_lock();
+	cpumask_and(new_mask, &watchdog_cpumask_boot,
+		    housekeeping_cpumask_rcu(HK_TYPE_KERNEL_NOISE));
+	rcu_read_unlock();
+
+	mutex_lock(&watchdog_mutex);
+	cpumask_copy(&watchdog_cpumask, new_mask);
+	__lockup_detector_reconfigure(false);
+	mutex_unlock(&watchdog_mutex);
+
+	free_cpumask_var(new_mask);
+}
+EXPORT_SYMBOL_GPL(lockup_detector_hk_update);
+
 /*
  * lockup_detector_retry_init - retry init lockup detector if possible.
  *
@@ -1390,6 +1413,7 @@ void __init lockup_detector_init(void)
 
 	cpumask_copy(&watchdog_cpumask,
 		     housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
+	cpumask_copy(&watchdog_cpumask_boot, &watchdog_cpumask);
 
 	if (!watchdog_hardlockup_probe())
 		watchdog_hardlockup_available = true;

-- 
2.43.0

