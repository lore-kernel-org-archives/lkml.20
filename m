Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694505;
	b=zAtDN8gKMW1rzjth4eYPcJbwoBtN3ufU7uCHkrS1pfIeKe09BDXdg+mDUBDEKhcHMnaW
	 QASfl1/87VuWiOrQZ4W6/RYbnMJibeXspnrw6a5kTxUMVJGWR0zFU0Y45tJXz223AsZOV
	 vUdYbRqrIuWFJ8BCF+hUR91Y+C8x7R6oN8kuICW2396Sd3dVoY3/zh46p5Q25biRnBPj3
	 WvQ2tsLa4bZuFqpEVjtIIcp1Qe82FHgAh2bP2YIdssUY0R+hCZAVlTfK/eZVjPL2JqPpO
	 LFszvNjDZMek7ZzHmD5rz2+pQf2Hd/XFks2yWPGyFBvzTzqI1TvvAq0oyiXtqGSCJoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694505;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=ccaBHmNOBylABzTNvO6o57PE08cHTPQ4Sprujz7kZ4E=;
	b=5X1jSfbKWjgB/gjsqYjnI+4013CLXM4qyMMPelpCeEUrTMnsvY0IdIorUFaGAE8+7lxp
	 KJwtObZcKin0Un2dNtY66x1Z6C4FKrc8wUTkIQ579qc6QVJwLEJm46cTSj/9ye21VzkVO
	 kjmtwZkoM6G+FBR50mrLAG/9nw5Snb1X511TocZXiVq63GQptGNyzuN5U1RdCCMAYPzwv
	 L2ZSnBhxTrSrQ7MoHaAWTB/gi+wIPYXuVpHG81L8b8u3NYtOOd/WuWBeIsY8DYMb0akiY
	 iP9IQRfYFCl52juk0Igc9H99ZhGp1hOLOAAmm/HEYpEhh7SOJJmHTtBlMnK4PJ0VXWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=B+BYYSiS;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F50606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F50606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=B+BYYSiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793694493; bh=ccaBHmNOBylABzTNvO6o57PE08cHTPQ4Sprujz7kZ4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B+BYYSiSH8n5ZXEpEJ4I9UrUPB+la2WRlTqHsJU5TQQ/Jdsoa9lQAhtTJtd8Jx/r1
	 UOIKiTxe2pm8BeT7fRXSjy5kq/l5VzkMHxKdCF1drsGej1yCav61QBulFdYolAtqzw
	 3f/9zaEBoVQhZLv8bJBxbx3jp7rz/gVPJ1DMZ544=
Received: from [127.0.0.1] ([113.208.112.234])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 708B0834; Tue, 03 Nov 2026 16:28:08 +0800
X-QQ-mid: xmsmtpt1793694488ti4vuixks
Message-ID: <tencent_9E9A8D222CA35E50E674E9FF795FD9BB8108@qq.com>
X-QQ-XMAILINFO: Od8VqZhFMB3N8AuApW7GrMug056ld6ShSmPZ/kHxoW5NhlI3NTUI31a17l/1sD
	 Tm6fU/JBYIwFtTtjmEJe0HHBraWDBrT0hQceYDc8jGLSDfPAFL0FYGMNphWgeNS9VJ3+YXcMqqN2
	 d4sawoqSdtFPtsUFVSLvuzme58DY70RAm8wAVJhCx29Zxjda9Rpglf30qnv4qkQqWXNnubeLFpfF
	 HhigE3yE0+vvkfksApnIHrJGyrLIV4/e6ubGOGjoe6yTFgk8aQ+Q64aj8YeQTco3hVhl0jCkbhMv
	 JVvmNMefK4Xl+JkpFEIxmfwFjO/uCmKVFqvFFs58t1MgBvOUfq7N1Mesy1vWwgXiNyJGwpffDRZa
	 qS9BGv7vu6y4x5J+sAB4S1OajTFn+LleF6LPEuq4r0F+/zfa7rkuJkVp2crjrD3pTU9BTtIuomYD
	 vow+7i6P3Sm6ZNP59OsZn7XANUINIGCOPWYWGKysfwECZX6OpW48+INnrntMOcIb23n9bbH6Ktcr
	 9ymcCUb2yl+AKx0zp7BXdX2Fu6exvD0jIzvb5hMt6Edwg2jhqC/JPI6g2zsuuv9w8Szlt8vJpm4e
	 7EM5e0XlQgdFDTzyJnkgd7pemlG9kCvXJNCGragLP6gf7nAXvmsRqJgAy1vlVKpQrBm99l8krVDZ
	 GRgpAK3ULhBhoZDwu2qgI67Mcs64MreoGbn+gZXgSrAxo3KqusXomcVKnoQWdT3sfezs0RD7SUFF
	 OndsAgSLK3UR3cdvqS0EDnsJZEGbTJuTiGO6RbqFDRpSy0WM76BODiDKkDbjS4YWBiiG8kfKy6YI
	 2R6oYK4lEGd1BxY5P3OGwxWRY4kNb+cgMG/l5NsixHEgFkwDSs/aOPNJAbzSqBDfA72leJXasoEM
	 VUduH8EU6LhPYHtRdCIB3SB0QHp096EFRB/x3AklPbZa5//VUIp7UqrCPGCn9tcD9UQUG6AtEAAb
	 Ngv9/9MAomS5d/tp8qilcHmlAIZJh8oZKT8DqVBwSt1qKKTkbPsUTdT1G0LFXWKyq88TR4RUIJQA
	 lnDrsSw0J3JWnyksPCTMKyzz6o+pKX0caIDhJD3eblcSMilCfhbNLap7Rpd1LHb0Y9BirxNwAo6G
	 YWX03F
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Jie Du <806144828@qq.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Balbir Singh <bsingharora@gmail.com>, Yang Yang <yang.yang29@zte.com.cn>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] delayacct: Record blkio start on the correct task
Date: Tue, 03 Nov 2026 16:28:08 +0800
X-OQ-MSGID: <179369448878.1064782.155011004967499826@qq.com>
In-Reply-To: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
References: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

__block_task() calls delayacct_blkio_start(), which stamps
current->delays->blkio_start. That is only correct when the task being
blocked is current, as it is when __schedule() blocks prev.

With DELAY_DEQUEUE, a task that blocks while not eligible stays on the
runqueue as sched_delayed. If it gets picked before it is woken,
pick_next_entity() dequeues it and __block_task() runs on behalf of
whatever task is scheduling on that CPU. Proxy execution can also block a
task that is not current. In these cases blkio_start is written to
current, and p keeps whatever blkio_start it had before: the start of an
older sleep, or 0 for a thread that never blocked on I/O. When the I/O
completes, ttwu() calls delayacct_blkio_end(p), which charges p with
local_clock() - blkio_start. For a new thread that is the whole time
since boot. current's own blkio_start, if it is sleeping on I/O itself,
is moved forward at the same time.

This shows up as freshly created threads reporting days of block I/O
delay through taskstats and field 42 (delayacct_blkio_ticks) of
/proc/<pid>/stat, in steps of exactly the system uptime. Anything summing
those numbers per cgroup or per host reports nonsense.

Pass the task down to delayacct_blkio_start(), like commit c96f5471ce7d
("delayacct: Account blkio completion on the correct task") did for the
completion side. __block_task() still sets blkio_start before it clears
p->on_rq, so a concurrent ttwu() cannot reach delayacct_blkio_end(p)
before the start is recorded.

Tested with a small reproducer that keeps one CPU busy with two spinning
threads and keeps creating short-lived threads that spin for 2ms and then
do O_DIRECT reads; a thread is counted as bad when its
delayacct_blkio_ticks is larger than its age. Under QEMU (TCG, 2 vCPUs),
4 rounds of 60s each, bad threads:

                      v7.4-rc1           v7.4-rc1 + this patch
  DELAY_DEQUEUE       20 of 14718        0 of 19383
  NO_DELAY_DEQUEUE     0 of 15766        0 of 20020

Each of the 20 was charged roughly the uptime at that point.

On a 6.6-based distribution kernel that carries the EEVDF backport the
same reproducer gives about 690 bad threads out of 2000 in 20s with
DELAY_DEQUEUE and none with NO_DELAY_DEQUEUE.

The problem was investigated, and this patch and its reproducer were
written, with help from an AI coding assistant (Claude). I have tested
it as described above.

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Closes: https://lore.kernel.org/all/tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com/
Cc: stable@vger.kernel.org
Signed-off-by: Jie Du <806144828@qq.com>
---
Reproducer used above (gcc -O2 -pthread; run as
./blkio-repro <file or block device of at least 64MB> [seconds]):

// gcc -O2 -pthread -o blkio-repro blkio-repro.c
// ./blkio-repro <file or block device, >= 64MB> [seconds]
#define _GNU_SOURCE
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

static int fd;
static volatile int stop;
static unsigned long nr, bad;

static double now(void)
{
	struct timespec ts;

	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts.tv_sec + ts.tv_nsec / 1e9;
}

/* delayacct_blkio_ticks, field 42 of /proc/thread-self/stat */
static unsigned long long blkio_ticks(void)
{
	char buf[1024], *p;
	FILE *f = fopen("/proc/thread-self/stat", "r");
	int i;

	if (!f || !fgets(buf, sizeof(buf), f))
		exit(1);
	fclose(f);
	p = strrchr(buf, ')') + 2;
	for (i = 3; i < 42; i++)
		p = strchr(p, ' ') + 1;
	return strtoull(p, NULL, 10);
}

static void *hog(void *arg)
{
	while (!stop)
		;
	return NULL;
}

/* burn 2ms so we are not eligible, then block on synchronous reads */
static void *worker(void *arg)
{
	unsigned int seed = (unsigned long)arg;
	double born = now();
	void *buf;
	int i;

	if (posix_memalign(&buf, 4096, 4096))
		exit(1);
	while (now() - born < 0.002)
		;
	for (i = 0; i < 8; i++)
		if (pread(fd, buf, 4096, (rand_r(&seed) % 16384) * 4096L) != 4096)
			exit(1);
	if (blkio_ticks() > (now() - born) * sysconf(_SC_CLK_TCK) + 1)
		bad++;
	nr++;
	free(buf);
	return NULL;
}

int main(int argc, char **argv)
{
	double end = now() + (argc > 2 ? atoi(argv[2]) : 30);
	pthread_t h[2], t;
	unsigned long n = 0;
	cpu_set_t set;

	fd = open(argv[1], O_RDONLY | O_DIRECT);
	if (fd < 0)
		return 1;
	/* everything on one CPU */
	CPU_ZERO(&set);
	CPU_SET(0, &set);
	sched_setaffinity(0, sizeof(set), &set);
	pthread_create(&h[0], NULL, hog, NULL);
	pthread_create(&h[1], NULL, hog, NULL);
	while (now() < end) {
		pthread_create(&t, NULL, worker, (void *)++n);
		pthread_join(t, NULL);
	}
	stop = 1;
	printf("threads %lu, blkio delay longer than thread age: %lu\n", nr, bad);
	return 0;
}

 include/linux/delayacct.h | 10 +++++-----
 kernel/delayacct.c        |  8 ++++++--
 kernel/sched/sched.h      |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/delayacct.h b/include/linux/delayacct.h
index ecb06f16d2..4bb01a1f86 100644
--- a/include/linux/delayacct.h
+++ b/include/linux/delayacct.h
@@ -92,7 +92,7 @@ extern void delayacct_init(void);
 
 extern void __delayacct_tsk_init(struct task_struct *);
 extern void __delayacct_tsk_exit(struct task_struct *);
-extern void __delayacct_blkio_start(void);
+void __delayacct_blkio_start(struct task_struct *p);
 extern void __delayacct_blkio_end(struct task_struct *);
 extern int delayacct_add_tsk(struct taskstats *, struct task_struct *);
 extern __u64 __delayacct_blkio_ticks(struct task_struct *);
@@ -126,13 +126,13 @@ static inline void delayacct_tsk_free(struct task_struct *tsk)
 	tsk->delays = NULL;
 }
 
-static inline void delayacct_blkio_start(void)
+static inline void delayacct_blkio_start(struct task_struct *p)
 {
 	if (!static_branch_unlikely(&delayacct_key))
 		return;
 
-	if (current->delays)
-		__delayacct_blkio_start();
+	if (p->delays)
+		__delayacct_blkio_start(p);
 }
 
 static inline void delayacct_blkio_end(struct task_struct *p)
@@ -257,7 +257,7 @@ static inline void delayacct_tsk_init(struct task_struct *tsk)
 {}
 static inline void delayacct_tsk_free(struct task_struct *tsk)
 {}
-static inline void delayacct_blkio_start(void)
+static inline void delayacct_blkio_start(struct task_struct *p)
 {}
 static inline void delayacct_blkio_end(struct task_struct *p)
 {}
diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index 479e860aff..1d735d58e1 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -126,9 +126,13 @@ static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *cou
 	}
 }
 
-void __delayacct_blkio_start(void)
+/*
+ * @p is not necessarily current: a sched_delayed task can be blocked by
+ * another task picking it, see __block_task().
+ */
+void __delayacct_blkio_start(struct task_struct *p)
 {
-	current->delays->blkio_start = local_clock();
+	p->delays->blkio_start = local_clock();
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c563352..4ca7eac523 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3126,7 +3126,7 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
 
 	if (p->in_iowait) {
 		atomic_inc(&rq->nr_iowait);
-		delayacct_blkio_start();
+		delayacct_blkio_start(p);
 	}
 
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

