Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627324;
	b=ee/cSh6DP+oRx4zPrVken+J0KadRMPPeH/KoUPCStDwBUszl3Vn8v82f/Q6MthfFxCz5
	 KgBlifgb8CZCVrP4c928MeUrmmbVKuUf0y0Qo6FjEEa6kxQo0P3at+99os08JMmumo8P8
	 dy1l3s/xIXgOJBxfbiJBoUyabdH/SPlgtLOb3wQLUXD/eL0VJRnTjnaiHCYnPgL7SJs+6
	 lmDdmNAqTChtlvJLJ0bsgEMduBwlEJrN5DyaTEgkmL9XQRy/xYZB2BV89l5L+jOFcP5JE
	 rqMkjuWQ8xm5wK1mbB3OPefFDZLbEmOpwVMlr+QAdHpfpIQ/Kp8REWEmIcwg8t4yyfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zsxV4kAPPizjL5RMiJKViBywuGzs3ZM/PHJ4ths6Qwc=;
	b=qo1B4krBVzXtUbrLIdq9TNVsl+pGItoBFsejJkGu3bAsmdACC+xfDywI+ElbON5rTNn4
	 plxdyIlGNhiOsySDGSfDWutEbeQ9bxotfDh0brDCEH9Jd+9l4dHlJTt8kfuLliLoAIWWu
	 4yyDg6BlIHsrCw3CTrmLSqX6cuSga9Tp182e3Asioh6axZOnTre3epspiQKKgPlJIsK0n
	 L0ZEv6/Fm1jiUEMgbHnMC3aMPeaF+bYtb9mfOC/CjGcWMPot9P2FeHWFluGSTfjydr8KE
	 QfTxkNsFhrhRqcVrfj9qaRm9OlONfLnKLSp94eqvN11fF1TO2ZvNjiDoMb1xxbLbv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iR1pJEi3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA3606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iR1pJEi3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19274105e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627322; x=1794232122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zsxV4kAPPizjL5RMiJKViBywuGzs3ZM/PHJ4ths6Qwc=;
        b=iR1pJEi3z5bpNZ+H2JLzy+l3xYTNrCBke0ARmxkHkQA9f3D0hu/6qF1nrbfz7OgASS
         5Gle1fjPA0Txot6Sa6GPldAtYV9zCNd/RJeNRXNAwjABKcF4W+0Hm5n/3ITGvwKZD2+t
         WRW7B6nx3kAG24I7c1x6PliZ1b7ObuyvIro67AIjR4oNUzWU4Z1Zko1un/gj/GBA5qRa
         y+yXAjU9IqDA/lbGNxhypdlGof0wv5GcnN2AaUBrx6KPgVY8EHGphh8O+OjdLXCAroh6
         6SGFC6l+YHaXgbRm5/c0BAGxl91oc29wZsa2LtMsUcEImGeqxi472rfTb5RNbNRfo/Zj
         SQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627322; x=1794232122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsxV4kAPPizjL5RMiJKViBywuGzs3ZM/PHJ4ths6Qwc=;
        b=ig3rVgoU7l3fMZTyhxD815DFRWCUJUdFTuDLxGGySNZmrpo/7wU03OPRNREewOWa8x
         cFaihyfgeda4TMap+csS6pde5739L5Rb9qFq/eXO0pL9oiRwbdnjJ/vS2C4Pj7kiZsou
         Coze060uRN6kozVC5JY1A5EjDjCJ1NmG13MGaTy9k6rKJgWoK03aS+9KqSndjZ9/FTdo
         TixzaCA91G4vwXOorHrywscfKRgm6aGCWhhdG6bIwUZf0SniaBr9nIwdSXc098LEEW/9
         HMT5ABQSSguUbp/DfVuRskx9Yv5SxX6PDYBdi+sg3evQqCHPbnOEi55gjAXY5G0dz+XJ
         p5eg==
X-Forwarded-Encrypted: i=1; AKwUvBwhaJBoc1GCh5Q6v3FX/N2H6+TZRSUwIFIfG//S6ZrvNEYkqXAHtDQR1TPbJYQHj8TnsgdHNMzgx5ewUFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrU/mEwnKgYVvpk7jrCMShUjyGoiTW/zNfVOWVTSf9FdLfPRMq
	3h1gkXhiwQxIsd3Di7RbcAmW8SFeSORq/G3B/lsizR5Cuteihhb119/3
X-Gm-Gg: AYBFou0i9T9Zh9k/50tRMJJ5pm9cgpeXpEHSDHIs+XN2A1MoNWi5Y3WAbpwN3y+tJYo
	8drW2lBYllu+J1GgBmrZPGNtkf8fQ3JtZBD8ph7fWW2t9U/QeDfYdtdcyFNr4+HNjHQg3++Fmr+
	5jqWlPE87SEz3PyHStWyv/4V9T14JcmSKrlffIrkZ2nu+ILyIusCoCs4+BGwuDW2mcwVPWAWxkA
	9NNX/cc++Koz8bc59wc6szhCyBYltHyw29BdFI/+axH/DXPtHZ4MafOJvafFrOXv5za2/ppue0/
	6TfEOxWr2sYFIMyqoOARnCfDcWvF+ARw5/tPw5WjwnPaHgRXzV+rWQnzyu9x38ofmWGt6GQ4Mru
	TCZrQxnCSH6uQRTKwqQTCpKgbiF+nk8VZYxnqXmSuYPhbasWBNEKBe3Rs1HbD5mDK/8WhrimN1O
	r5oUeS+zAdgUaRVmXV84nfUieXnR90YTsjwAvs015x+FfA7652z340wAgbtEuJxupzEuC83dqvE
	x/51RsexEKqr4L7Bz/xNyHYYcmU1DRKHbbG4MZRrgKP3juSH3q6kP06u2eQ8ed4Zvr6CVLcI4nJ
	WdMWvWCKljrE22CHi3CeINOA6FUuLaHenC0g1dh21ql0iQpFyXCwVgpOha9Q1raOo2KJQEZHm5A
	=
X-Received: by 2002:a05:600c:1d07:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ac18e5dbaamr228183895e9.33.1793627322278;
        Mon, 02 Nov 2026 05:48:42 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm352216285e9.14.2026.11.02.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:48:41 -0800 (PST)
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
	Yun Hsiang <hsiang023167@gmail.com>,
	Hui Su <sh_def@163.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/uclamp: Reject clamp values above SCHED_CAPACITY_SCALE
Date: Mon,  2 Nov 2026 14:48:30 +0100
Message-ID: <20261102134831.243255-1-parri.andrea@gmail.com>
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

sched_setattr() accepts sched_util_min and sched_util_max values that do
not fit in uclamp_se::value. A single thread can do:

  sched_setattr(max = 800)		returns 0
  sched_setattr(min = 0xfffffffe)	returns 0
  sched_getattr()			min=2046 max=800

which leaves the minimum above both SCHED_CAPACITY_SCALE and the task's own
maximum.

The range check in uclamp_validate() relies on the + 1 wrapping -1, the
reset value, to 0:

	if (util_min + 1 > SCHED_CAPACITY_SCALE + 1)

That only works for an unsigned type. util_min and util_max are int and
SCHED_CAPACITY_SCALE is a long, so every negative value passes the check,
and so does INT_MAX, whose + 1 wraps.

uclamp_se_set() then truncates what got through to the 11 bits of
uclamp_se::value, but computes the bucket from the full value. A minimum
of 0xfffff800 is stored as 0 in the top bucket, where uclamp_rq_max_value()
takes it for the highest active clamp once a higher value leaves the rq.
The rq clamp falls below what the remaining tasks requested, and emptying
their bucket trips the WARN_ON_ONCE() in uclamp_rq_dec_id(), without any
privilege:

  WARNING: kernel/sched/core.c:1862 at dequeue_task+0x2a3/0x2b0, CPU#0: repro/126
  Call Trace:
   __schedule+0x933/0x1320
   schedule+0x36/0x100
   do_nanosleep+0x61/0x190
   hrtimer_nanosleep+0xb5/0x1d0

Make util_min and util_max unsigned int, so that -1 is the only value that
wraps. The pair check below is unaffected, since it skips -1 explicitly and
anything else is at most SCHED_CAPACITY_SCALE by then.

Requests that were only accepted because of this now fail with -EINVAL.

The following program triggers the warning when run by any user outside
a child cpu cgroup. With this applied, its 0xfffff800 request fails with
-EINVAL and the warning no longer appears:

  #define _GNU_SOURCE
  #include <pthread.h>
  #include <sched.h>
  #include <stdint.h>
  #include <sys/syscall.h>
  #include <time.h>
  #include <unistd.h>

  struct attr {
      uint32_t size, policy;
      uint64_t flags;
      int32_t nice;
      uint32_t prio;
      uint64_t runtime, deadline, period;
      uint32_t util_min, util_max;
  };

  static volatile int stop;

  static void set_min(uint32_t v)
  {
      /* KEEP_POLICY | KEEP_PARAMS | UTIL_CLAMP_MIN */
      struct attr a = { .size = sizeof(a), .flags = 0x38, .util_min = v };

      syscall(SYS_sched_setattr, 0, &a, 0);
  }

  static void burn(long us)
  {
      struct timespec s, n;

      clock_gettime(CLOCK_MONOTONIC, &s);
      do
          clock_gettime(CLOCK_MONOTONIC, &n);
      while ((n.tv_sec - s.tv_sec) * 1000000 +
             (n.tv_nsec - s.tv_nsec) / 1000 < us);
  }

  static void *bogus(void *arg)
  {
      set_min(0xfffff800);
      while (!stop)
          burn(1000);
      return arg;
  }

  static void *worker(void *arg)
  {
      long v = (long)arg;

      set_min(v);
      while (!stop) {
          burn(v == 800 ? 300 : 1500);
          usleep(100);
      }
      return arg;
  }

  int main(void)
  {
      pthread_t t[3];
      cpu_set_t c;
      int i;

      CPU_ZERO(&c);
      CPU_SET(0, &c);
      sched_setaffinity(0, sizeof(c), &c);
      pthread_create(&t[0], NULL, bogus, NULL);
      usleep(50000);
      pthread_create(&t[1], NULL, worker, (void *)500L);
      pthread_create(&t[2], NULL, worker, (void *)800L);
      sleep(15);
      stop = 1;
      for (i = 0; i < 3; i++)
          pthread_join(t[i], NULL);
      return 0;
  }

An LLM helped find the warning and write this patch and its tests.

Fixes: 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp constraint value")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Cc: stable@vger.kernel.org
---
This textually conflicts with [1], which rewrites these declarations and
keeps them int. Whichever goes second needs to keep them unsigned.

Tested on x86_64: 0xfffffffe, 0x80000000 and 0x7fffffff now fail with
-EINVAL and -1 still resets. Not run on a 32-bit kernel.

[1] https://lore.kernel.org/20261016062629.2102883-1-sh_def@163.com/

 kernel/sched/syscalls.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a127deeadd9..abe5ea6b3e36d 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -318,8 +318,8 @@ static inline void __setscheduler_dl_pi(int newprio, int policy,
 static int uclamp_validate(struct task_struct *p,
 			   const struct sched_attr *attr)
 {
-	int util_min = p->uclamp_req[UCLAMP_MIN].value;
-	int util_max = p->uclamp_req[UCLAMP_MAX].value;
+	unsigned int util_min = p->uclamp_req[UCLAMP_MIN].value;
+	unsigned int util_max = p->uclamp_req[UCLAMP_MAX].value;
 
 	if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN) {
 		util_min = attr->sched_util_min;
-- 
2.53.0

