Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627173;
	b=W4RBoVwj5KFEo3L8g/V3eeEz1+w8f1EceuZAvbbNKr2PQ/NH6WX7excEa8RtXxD9I25B
	 TQUSW3/CKCMcdie1mmowwgSBSqaMKWLU7XGONt9kWWM2/3UgWmjqh2st46cAnfZP+Jvpn
	 dOJV13+m3fPtygKGdzSIYiGBnUfrvAdmfiGUEsMfhtaCBseSuGaU3hA3ptsTnzzsnJXAO
	 wdTnrR/t2q7el6dK91sjBZG7u8BtLRjh0eMU1bCsJoxO+2NH+U6e4HKhPLj0qBL90Lrey
	 r8EHPcc2GmEP0n7SlNVBxWU/YlSyYsyAC5Ghw3+LqlYz6qxcyo1t5Q21gvj305qiung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iIKunQE+SicAhyjZQ/MMzEjIQWaAEW2rMinTZr7v7uI=;
	b=XtA9f9XzDeAomlClNgUOyY8CQ5WL4qbr0O9ecqQkSYi2edmeKNuMpa0HdRjUNhLbpzeS
	 MglXEYEtDJKnUkIw5cwrarYNvXJxTW2SP1aUxXKdykSNBODnfs8Qa1PUumdBCnkTXZAzG
	 B9gRrswIb/gOqxHclUc7m7FxfPuwjywTChQy4/LhqrwX+Q7ajgG43shKMZ3y6SOGEKJ31
	 rkINVBLbL73fR56BAv5OZNo97+h5r9qPh4GUKosmKDmcUIS0K/srO9SfMmg5c5WHRLZFh
	 oYWEipiQjImmSEdaBkqVfJ8RFkH2ASFELSHgCxJN1IlQ5bHIV84t2bRS8n7KuuHIk/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ig/cS74W";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F0C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ig/cS74W
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25103895e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627171; x=1794231971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIKunQE+SicAhyjZQ/MMzEjIQWaAEW2rMinTZr7v7uI=;
        b=Ig/cS74WWPu7wsi/HezXSAVQStbEU1/zAMzTbE3yqgzVT4XCYIn9XOo6bDDiTKdx9b
         tz4NFfW9RluJO4ohWHFOVaTQJBnHxJyahYZj+6j0YvkAfhpJMFHnCakyiduLFcs4o78q
         25iIJLVIHQ+XTNK9E/VzV3mGJ2rM0S7PG2ONVo0vXFlqgEDVeGKVZbiMsKIU2fpEemlw
         VBcIXPscW/SxT5Yptc7yhnon9lyZNkYebvoNYs72mn7c+uURW6g20pLLeWOnch9ZCDyQ
         uATafSX5+RQb1EV/OkfpRzwiM8cKaFiGd4EoCt6dISKjKOvK5LWECtOnioxpqyBNKuI5
         EiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627171; x=1794231971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIKunQE+SicAhyjZQ/MMzEjIQWaAEW2rMinTZr7v7uI=;
        b=baW6q4A0Bf2tKiM3q33C/lomrzNLeKYNNM1pODfOfMuPgBM6ka4VkK75glLN0G0iln
         0qC+bISacQQzeSQmG14sD8UA1easYprvjxq5IAI7nRHTqERb/b2b99kzIDjCl10GEwJv
         4gwpsB8ViSbgwbnmYHgDuTPtARXXRNi0SiY5VlOPtWCTFramWX/yPzTDsiUC8izvH4V6
         0xJU/ZNf/iSMX5Zslk8++8AQqlwk6lJ11msJALlzu3BZ6XAdCZSX/1i9ma72cFm8SVhF
         7tX14u/DqJiR9dvJ8f3UrLwpXZjPVHUgHkcsd3rCPgQsx/CiFooc5s0BTVxQvFRDoAVX
         NAdg==
X-Forwarded-Encrypted: i=1; AKwUvBxp7hY+aY6t1G2YZhs2AxaE1G3TOjcohG/a4s3ttlpxpv/LpkOCA1obYgYJS7kKg6oKIA2JsJh/fjCTljo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbdZj0D+rastiVsI6By40C8kO77dSztXyHNaH3LhqlpPHebyha
	xKOnEVCZlXG+XLGSeMdtgNjFNC8reg7MP/u0OdFLjzrevXaaW6fRdzXA
X-Gm-Gg: AYBFou0rIs3IMInZ0vdKwc5yitziYP5EMGljLrTl8NiKK8WlaEupvivC1SzIBTXktBP
	BhVzo1PzSHmozx5oBIZaGJ04SxiwqxmlkAAv7DuJIYPRfzmCsz14kfgjeaKWi6EGhSmVuIa3j22
	1tZWi2KYvQDFZrCkjPSNDXjuFooXGAxCK+EzvspZ1unOt6LybPX6LdseDKVL73cNSWVxmyjiZSd
	1H6PugPxc4KRKmM94CAfXdJqOeNrVNNMtq203qJiGmjs49dntNjGROjlBjhdm/Zr1IoNsUYbrLo
	/yrbPs+mHjaiN9YeFymffcPbOE2A70KMIGgnoi9SrEHTCD5UHZ0MZXNatHvbO1ePIRm+GKpAm4x
	/cqgjqrf1qTazwIPyXPZWpA2fxVt4paqVxprStNgwUoupaZRxiNiONSBLylRA9QVQj95k8ZGgW6
	mSuFRfp3LbXGuxtWNNuDkMQnkfG1Opyq/OwykG47k6LxychxLYpIxuUjwDcNySJ8ormwOgWAg2f
	WGTjbdgVLhxX3U/n+sivvMKOsyI3kuGCsQC7yAcAToUHGQAih4N8UPLRFlwM7BRIDEGfWkqyati
	lnln4NEN2iR6yBzwa5Xb2Fy84bLlmo8mtQ+2TYlngQOWZc0MEmvMffbuool/WskGIDT/1sCr8G0
	95+pEQ0iB4p+RXuY/WwpM
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr245581665e9.6.1793627170881;
        Mon, 02 Nov 2026 05:46:10 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm120156185e9.3.2026.11.02.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:46:10 -0800 (PST)
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
	Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Hui Su <sh_def@163.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched: Fix cpuset_mutex double unlock in __sched_setscheduler()
Date: Mon,  2 Nov 2026 14:46:05 +0100
Message-ID: <20261102134606.242743-1-parri.andrea@gmail.com>
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

A sched_setattr() with SCHED_FLAG_KEEP_POLICY on a SCHED_DEADLINE task
unlocks cpuset_mutex twice if the task's policy changes concurrently:

  WARNING: bad unlock balance detected!
  7.4.0-rc1 #1 Not tainted
  -------------------------------------
  repro/126 is trying to release lock (cpuset_mutex) at:
  [<ffffffff9a17cacc>] __sched_setscheduler+0x9cc/0xc40
  but there are no more locks to release!
  ...
  Call Trace:
   print_unlock_imbalance_bug.part.0+0xfb/0x110
   lock_release+0x286/0x2e0
   __mutex_unlock_slowpath+0x1a/0x400
   __sched_setscheduler+0x9cc/0xc40
   __x64_sys_sched_setattr+0xa3/0x1b0
   do_syscall_64+0x106/0x5f0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

__sched_setscheduler() samples p->policy before taking any lock, and
restarts from the recheck label if p->policy differs under the rq lock.
The restart drops cpuset_mutex but leaves cpuset_locked set, so a pass
that no longer needs the mutex still unlocks it on its way out:

  CPU 1                                CPU 2
  __sched_setscheduler(KEEP_POLICY)
    policy = p->policy /* DEADLINE */
                                       __sched_setscheduler(SCHED_OTHER)
                                         p->policy = SCHED_OTHER
    cpuset_locked = true
    cpuset_lock()
    rq = task_rq_lock(p)
    oldpolicy != p->policy
      cpuset_unlock()
      goto recheck
    /* no cpuset_lock() this time */
    ...
    if (cpuset_locked)
      cpuset_unlock()

Without CONFIG_DEBUG_MUTEXES, or CONFIG_DEBUG_RT_MUTEXES on PREEMPT_RT,
nothing warns. The second unlock still clears the owner field regardless
of who holds the mutex, so another task can lose cpuset_mutex inside its
critical section. Entering SCHED_DEADLINE needs CAP_SYS_NICE, but a
racing caller that owns the task does not need it if it samples a policy
other than SCHED_DEADLINE.

Clear cpuset_locked when dropping the mutex for the restart. This should be
safe because the flag is only tested on the paths leaving the next pass,
after that pass has set it again if it took the mutex.

The following program, run as root, reproduces the splat, which no longer
appears with this applied. On PREEMPT_RT it crashes the kernel within
seconds, which this also fixes:

  #define _GNU_SOURCE
  #include <pthread.h>
  #include <stdint.h>
  #include <sys/syscall.h>
  #include <unistd.h>

  struct attr {
      uint32_t size, policy;
      uint64_t flags;
      int32_t nice;
      uint32_t prio;
      uint64_t runtime, deadline, period;
  };

  static volatile int stop;
  static volatile pid_t target;

  static void set(struct attr a)
  {
      a.size = sizeof(a);
      syscall(SYS_sched_setattr, target, &a, 0);
  }

  static void *sleeper(void *arg)
  {
      target = syscall(SYS_gettid);
      while (!stop)
          usleep(1000);
      return arg;
  }

  static void *switcher(void *arg)
  {
      while (!stop) {
          /* SCHED_DEADLINE, 2us every 1s */
          set((struct attr){ .policy = 6, .runtime = 2000,
                             .deadline = 1000000000,
                             .period = 1000000000 });
          set((struct attr){ .policy = 0 }); /* SCHED_OTHER */
      }
      return arg;
  }

  static void *racer(void *arg)
  {
      /* KEEP_POLICY | KEEP_PARAMS */
      while (!stop)
          set((struct attr){ .flags = 0x18 });
      return arg;
  }

  int main(void)
  {
      pthread_t t[5];
      int i;

      pthread_create(&t[0], NULL, sleeper, NULL);
      while (!target)
          usleep(100);
      pthread_create(&t[1], NULL, switcher, NULL);
      for (i = 2; i < 5; i++)
          pthread_create(&t[i], NULL, racer, NULL);
      sleep(30);
      stop = 1;
      for (i = 0; i < 5; i++)
          pthread_join(t[i], NULL);
      return 0;
  }

An LLM helped find the PREEMPT_RT crash and write this patch and its test.

Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Cc: stable@vger.kernel.org
---
Sashiko reported this while reviewing [1], which adds another exit from
the second pass. The bug does not depend on that patch.

Tested on x86_64 with lockdep and DEBUG_MUTEXES: the splat fires without
this patch and not with it.

Also tested on PREEMPT_RT with lockdep, with DEBUG_RT_MUTEXES only and with
neither: each kernel oopses within seconds without this patch, and runs
clean for 30 seconds with it.

The 2us reservation only keeps the test running: tasks leaving
SCHED_DEADLINE while asleep leak total_bw [2], so a 1ms/10ms reservation
stops being admitted after 38 switches on 4 CPUs, and 2us after about 2
million.

[1] https://lore.kernel.org/20261016062629.2102883-1-sh_def@163.com/
[2] https://lore.kernel.org/2b5fb3f22bca6aa383be8f4781923392@kernel.org/

 kernel/sched/syscalls.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a127deeadd9..2af550f92ac65 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -640,8 +640,10 @@ int __sched_setscheduler(struct task_struct *p,
 	if (unlikely(oldpolicy != -1 && oldpolicy != p->policy)) {
 		policy = oldpolicy = -1;
 		task_rq_unlock(rq, p, &rf);
-		if (cpuset_locked)
+		if (cpuset_locked) {
 			cpuset_unlock();
+			cpuset_locked = false;
+		}
 		goto recheck;
 	}
 
-- 
2.53.0

