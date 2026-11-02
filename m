Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627667;
	b=n/qQqu6JmH9EeZStm7X3vb6KhvhT6EQWxyYtGx6++rYU5ZY96IzWJ1w/fweZXP+DP1c9
	 GzzV+4kVr8Afius6Xe2NSKh5jsqdqClZEpRFRNKv1ApfcYEIndNVdx7+4h5eCx8rmHTkr
	 ytHuCfA3y1zzIyfU1jjCCDUwxz1eu0kiwUsuTmjNiCzFImzxPkbPts9/qIGVaVxdLU2C+
	 dHQGZ7u80avg2U4UvgjafoixLSo1Hln6LS0s7nEy4X/FWz/hbZeq27+BNjLFbGJs70ttD
	 chM03d4KtyFwlF7RZm6QQEFaytwxETqZuTh5ZrX91ivJV/WykdpDMRC9rCI1oeBgIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lIefd9a9G0gKsYsn6Cn42nkLbuWYrCDoWkU3bV3hULo=;
	b=lEP2+4rK9XVbQ4aw7nuKwtmRHMxnDj0g+PuCgBuS2X4gAWFA0/RORQCgfpuFpLS7VhGc
	 KC6jQ/dBN+KDWOhmJiFbD6dObxiSec0UE6bGTHioEf/lNLXtgtChj8pMasCh4CIdsXOx+
	 Sgbov7BrcE+sBVMKKzwUViPQqpdEf+wP/O859QdNEM1uQqMoswstPVc6uzSqvXkqVdwUY
	 64DU5CAT6KWBDP2apgdiPIHu2sLzvaGhdEqpKyqwOGlMaKy0FyjhctKwzclF3YWd4oeSA
	 1bBAI4AVM/oitgeNl57ApZgzbIUPBg+P7fnBsL2ynrH5PxaQ0lcs/iTaiGJ2EZQYE1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxVVuyLD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF860A261E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AF860A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxVVuyLD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1511153f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627665; x=1794232465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIefd9a9G0gKsYsn6Cn42nkLbuWYrCDoWkU3bV3hULo=;
        b=IxVVuyLDwJy5Wrj76wqiNvBj8/4fEvDv+Awvl1VwIeuSi2LxkenRQj7WPT61ekFo/z
         bYotLADZOxsSqezF2nsDnA6QcO+v24hlgnYO6Nlt1wKbXVaCdVuqXiK4OsjqCic6FuFi
         mDKWocLiENjRp3CxBBkMFxExp+Xdho1fD2egQowLiE+mIRGr9XBYDQpDioRrIXTYHRN5
         lRH7F6H2pg/LCHNcYqYdtfISVzrNwXEOHeHe5AhdFCG7wjNeU5aE/CXc7kyTkLNo8HCx
         1Wik5E1GAX7p0JGNtpIJHD0ICBvdOKm20nLrTvBciwudkss8zvPpPIAkXYFivRGmDGJl
         7u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627665; x=1794232465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIefd9a9G0gKsYsn6Cn42nkLbuWYrCDoWkU3bV3hULo=;
        b=xLL5SOaQKbk3DTWyYVakuc1LqbLzoAg51eGdN934fqWb+niinEa7PpU5fxCvTSYz9t
         QATMZrlIiDkVog60JKvlH/nVlAa66rNjwMVmsmaYmmjuiAW8Bp8ogM0auHnMBd6gLoKG
         7M0jg+yc6skigFymCn6P45hU4PgKw0zEzvD4bVk5Jcn/fuhXzAqpLIFl9E8Pqr9UoYC/
         C6z9stbbQdYwTUYz5Bt8Tjv7p9iq3PrG9Sy2O2vAxZutZhCVyElJuGq6qRrTiGNEhLyg
         kkiWDi4k86NGJC1xOkIdWZR18vnjpJGOQ6O3VWF119sfZtkpghQy9UEjQ7mdy3DD+fj5
         CLMA==
X-Forwarded-Encrypted: i=1; AKwUvBwRGXjxmi0VH5016vjAvxOUAVee0T285xX44OlnEhX2D8CAMdszkvdHNadX89mUPXY7DKnSvstfuwWiK64=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lCE2k8q4a9JA7cUSdsq+aA8SfbeWavredjeUwHH8T66YgbENm
	q1BXk9X/PPEhbSdnwTLzk81gc1XCXl5rtU5DgXwo6mJ4GjS93XnK2ygd
X-Gm-Gg: AYBFou1VbRqZGEJvte7VN/4Dr+60P3ui1VsumqcEozBT4cLiPetrJEqp1lW6ddcLtRR
	CtRYDZeTIEiq6VAwN/UATbN1uOFufy+hfBz09pwGaojjop+5tX6Ehj6q3qs1rFRFak3VDgosj8z
	QQemsBYQZqKzsSuFMD1HbhtKfGQa8X0AydsGihe1jKmyIiwM3mvG+DtGVzquGG9eDXuT9JaSI8/
	h8VJAtMgdm8e6f7vsAvK5eXAc27RHcdWJASlFsd+7m8eMNSAZ9lGskPHDmNIUSmkPlQkrM0X5nn
	53E2tXPorSqKrl0NivIJuBF8d1S4oV9x5PNQZuV+N2IlbAL7vqzWTKwmjSs7Xa3N8gw1IlIK4v5
	ABVHN7n8kP70DNF3vc3xuEteac0TPe2dFMNwd5/5bDteF2DciTE/bioq3zSNbPzWuyK59QK8mu6
	EcpuNYIfEq/e1B3njLmNr2xAZUQhvPJREbsiBAqXcivnPLhLuXg9Kcl/bDi9hG66ZU3OFDxTlf5
	D6V9VAMToduCg1xnm96ZpxeNVOA3z5MTWYvBbGt3JZZAGj+gZRgjAQiAsXih8wXk3LcmpBHB5fh
	jhVVB2rysROwWqZaXLknUYHwLBSNcoIPGpEwDCQW2ztj/P8dG9gPgWfCp3EhufbR9RrqSxVSPsY
	=
X-Received: by 2002:a5d:6f0d:0:b0:48e:19c7:6e23 with SMTP id ffacd0b85a97d-48e73e1be0emr19149710f8f.37.1793627664934;
        Mon, 02 Nov 2026 05:54:24 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b77f06sm20138662f8f.21.2026.11.02.05.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:54:24 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/deadline: Fix spurious -EPERM for migration-disabled tasks
Date: Mon,  2 Nov 2026 14:54:19 +0100
Message-ID: <20261102135420.244745-1-parri.andrea@gmail.com>
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

sched_setattr() can refuse to make a task SCHED_DEADLINE with -EPERM,
even though the task's affinity covers the whole root domain. A retry
can succeed, but the error blames an affinity the task does not have.

__sched_setscheduler() tests p->cpus_ptr, which is not always the task's
affinity. When a task is scheduled out inside a migrate_disable() section,
migrate_disable_switch() points p->cpus_ptr at the current CPU until
migrate_enable(). On PREEMPT_RT every spinlock_t holder is in such a
section, so ordinary kernel work opens the window. Elsewhere, seccomp
filters run in one.

Test p->cpus_mask instead, which keeps the task's affinity and is what
sched_getaffinity() reports. This should be safe because an admitted
task's cpus_mask covers the root domain, so set_cpus_allowed_dl() moves
no bandwidth when migrate_enable() restores p->cpus_ptr.

The following program, run as root, had 553679, 453720 and 424623 of its
1000000 requests refused on three boots of a 4-CPU PREEMPT_RT guest, and
236182, 217174 and 237183 without PREEMPT_RT. With this applied the count
is 0, also with lockdep, and a task pinned to one CPU is still refused:

  #define _GNU_SOURCE
  #include <errno.h>
  #include <linux/filter.h>
  #include <linux/seccomp.h>
  #include <pthread.h>
  #include <stddef.h>
  #include <stdint.h>
  #include <stdio.h>
  #include <sys/syscall.h>
  #include <unistd.h>

  #define REQUESTS 1000000
  #define INSNS 300

  struct attr {
      uint32_t size, policy;
      uint64_t flags;
      int32_t nice;
      uint32_t prio;
      uint64_t runtime, deadline, period;
  };

  static volatile int stop;
  static volatile pid_t target;

  static long set(struct attr a)
  {
      a.size = sizeof(a);
      return syscall(SYS_sched_setattr, target, &a, 0);
  }

  static void *worker(void *arg)
  {
      struct sock_filter f[INSNS + 1];
      struct sock_fprog prog = { .len = INSNS + 1, .filter = f };
      int i;

      /* Reading the arguments keeps seccomp from caching the result */
      for (i = 0; i < INSNS; i++)
          f[i] = (struct sock_filter)
              BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
                       offsetof(struct seccomp_data, args));
      f[INSNS] = (struct sock_filter)
          BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW);
      syscall(SYS_seccomp, SECCOMP_SET_MODE_FILTER, 0, &prog);

      target = syscall(SYS_gettid);
      while (!stop)
          syscall(SYS_getppid);
      return arg;
  }

  static void *hog(void *arg)
  {
      while (!stop)
          ;
      return arg;
  }

  int main(void)
  {
      pthread_t t[9];
      long refused = 0;
      int i;

      pthread_create(&t[0], NULL, worker, NULL);
      while (!target)
          usleep(100);
      for (i = 1; i < 9; i++)
          pthread_create(&t[i], NULL, hog, NULL);
      for (i = 0; i < REQUESTS; i++) {
          /* SCHED_DEADLINE, 2us every 1s */
          if (set((struct attr){ .policy = 6, .runtime = 2000,
                                 .deadline = 1000000000,
                                 .period = 1000000000 }) && errno == EPERM)
              refused++;
          set((struct attr){ .policy = 0 }); /* SCHED_OTHER */
      }
      stop = 1;
      for (i = 0; i < 9; i++)
          pthread_join(t[i], NULL);
      printf("%ld of %d requests refused\n", refused, REQUESTS);
      return 0;
  }

An LLM helped find this bug and write this patch and its test.

Fixes: af449901b84c ("sched: Add migrate_disable()")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Cc: stable@vger.kernel.org
---
This textually conflicts with [1], which rewrites this line and keeps
p->cpus_ptr. Whichever goes second needs to keep &p->cpus_mask.

Also tested on PREEMPT_RT with lockdep by holding a 1ms/10ms reservation
for 3ms at a time, so that tasks admitted while migration-disabled reach
migrate_enable() as SCHED_DEADLINE: no warnings, total_bw unchanged, and
none of 6788 requests refused. Without this patch, 826 of 6645 are refused.

Other !PREEMPT_RT migrate_disable() users were not tested.

[1] https://lore.kernel.org/20261030151307.768523-2-atomlin@atomlin.com/

 kernel/sched/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a127deeadd9..fb8f332074b88 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -628,7 +628,7 @@ int __sched_setscheduler(struct task_struct *p,
 			 * the entire root_domain to become SCHED_DEADLINE. We
 			 * will also fail if there's no bandwidth available.
 			 */
-			if (!cpumask_subset(span, p->cpus_ptr) ||
+			if (!cpumask_subset(span, &p->cpus_mask) ||
 			    rq->rd->dl_bw.bw == 0) {
 				retval = -EPERM;
 				goto unlock;
-- 
2.53.0

