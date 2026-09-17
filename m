Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992683C109A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619665; cv=none; b=YSkbVKooqTjqkM3IjkRW9ZejtjZdy9Fy9wk+tZ0jLzqRgk3ehEY1wSuyHhFav8UA8TuwUuwDgEaPpkcfDoEE2LvumYIo6pVe88IPMv0VM4yCkIE/qUwK9ztV3sFt1+NwqfGr2+P29AF7P6xEFprq6DsVv6ceKCFfzfiFWPhut5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619665; c=relaxed/simple;
	bh=eehDtZ7OlP60D9pMffxyT/ekD05+h9cg0eM+4fu18fw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QwXiTCLvbunPe7Ekp4QR2nOSSlfc+r+zKMM549ey+EFVxOSNVu9mr4EfyrUHl7h+4Q5bm9xdPVMwe/zwn+PArDDNBINwdfgAEfCnWFrAvdkaTGiowHhoicr8++O18Qiu6/z4pc/+ZiiXafgRmfL2BfEQMAD6wVcDMW/DVSTMMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRyir6W3; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRyir6W3"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-87088f3b83dso651998b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619654; x=1790224454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PUi0w321u1M0bPfHbTN2MqImPn3RRghNR/0evAaIXTo=;
        b=vRyir6W3HrN7FMZSKhZe0dn+JEXtS0dVk7TCkntPnBBNh2aF+okc62+PFJopiPYbE0
         dNZzT2jexieJSY6/aoeWy79UlR8uVNuPGmOs8LsAwGXeM6vN82rZwFy5vX19BUWqIRHo
         ScWwhHob1xjTH5DBui6ep49YGpYbEJa7fUFQ43IuaFEOAPsYhBbnx2I+UpAdnoZ9p/dj
         pZqhEEuejp+bp2TF8QBvE0Y1BQrig2yimWo0sCvn1ToqxpsAnRCO+54vBevgZl955nX7
         xWb8e2NasFGFZFmITIBJS1h5d36OMvZ8OkhbIWauuxLPu/4PhQ/l7rg15dj7xVdSuzW5
         KjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619654; x=1790224454;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUi0w321u1M0bPfHbTN2MqImPn3RRghNR/0evAaIXTo=;
        b=tqWqZKnbA7GcF1DOYiSNxFn6bNQqEuS3xY9ZUqiNbNd5g/Af2xL/z2vDAkgDpfrMtd
         Bh/u+E57JSDLM5dN1WQLyChWWhDW3pdKCs62YXcrIwN6P0o+ZrAFvxljg8ws1ng1TVjR
         KHyIHaKNcQuXq+ZoT3O8+QCpqEyQKCeuPaGyR3X2acrSDTf3oMgij+4u3FBz5iufKJbY
         Qd6RBxvhy9TPbJUQpJ62lABsgb0wQVomUpEuMRBF0Eak/9TtT1tP+5mY9G/mQ9wiwWn1
         h0sTxB5dyWzv4moIrLbqzT4TFxThZTCEZfkC62gLtdzA6f1GbdbNFV1lCJ3LQNg+uHtZ
         z/1w==
X-Gm-Message-State: AFuF++lsoJA1xbQS4KyqCgUFHsseKyoXruLI4mYjkTlpHgYS6dD3ND2I
	gw6kg604T1OMjKvKLIoEL/UZs2jb0RkLec2EilBqGwufZ+bXLVBwYwCUQvviavqJpvJehhBjLm+
	N3LWSlYS/5f9Gvl1bwvkeGWDUvW/zdbgeIWZyvP484GZINIp3UPabkM/WGeLlAf0x1Vkedh80CN
	hMs+uIL7/kzmHkT1Ui8eQ4FLpNVbL7K0FVcVwK1kbNqLX+NlgzCddRS6Y=
X-Received: from pfnp14.prod.google.com ([2002:aa7:860e:0:b0:873:3b26:abee])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a02:b0:86c:a9a8:844f with SMTP id d2e1a72fcca58-872363f6650mr10686252b3a.1.1789619650038;
 Wed, 16 Sep 2026 21:34:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:36 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-13-suleiman@google.com>
Subject: [RFC PATCH 12/12] tools/testing/futex: Add ping_bench, a tool for
 benchmarking futexes.
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It can generate metrics across a number of configurations, measuring
how long locking takes.

It prints out lock call durations for the foreground thread to
stdout (unless -q is passed), for analysis with other tools such as
ministat or turning into histograms.

Some parameters:
    -a:  Print out durations for all threads instead of only for the
         foreground thread.
    -q:  Don't print out locking durations.
    -f:  Type of futex ("f" FUTEX_WAIT, "p" FUTEX_LOCK_PI,
         "n" FUTEX_LOCK_PING, "N" FUTEX_LOCK_PING with userspace stealing,
         "m" pthread_mutex_t).
    -t:  Number of threads acquiring/releasing the lock.
    -n:  Number of iterations the threads will take the lock.
    -s:  How frequently a thread tries to take the lock.
    -S:  Duration in usec to sleep instead of spinning after unlocking
         (use instead of -s).
    -w:  Lock hold time.
    -b:  Number of =E2=80=9Cbusy=E2=80=9D cpu spinner threads.
    -r:  Number of threads using RT prio.
    -p:  Use nice() biasing (foreground thread gets more cpu time,
         background threads get less - allows for priority inversions).

Co-developed-by: John Stultz <jstultz@google.com>
Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 tools/testing/futex/Makefile     |  13 +
 tools/testing/futex/ping_bench.c | 428 +++++++++++++++++++++++++++++++
 2 files changed, 441 insertions(+)
 create mode 100644 tools/testing/futex/Makefile
 create mode 100644 tools/testing/futex/ping_bench.c

diff --git a/tools/testing/futex/Makefile b/tools/testing/futex/Makefile
new file mode 100644
index 000000000000..cbb2deb30923
--- /dev/null
+++ b/tools/testing/futex/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+.PHONY: clean
+
+TARGETS =3D ping_bench
+CFLAGS =3D -O -Wall -g
+OFILES =3D ping_bench.o
+TARGETS =3D ping_bench
+
+ping_bench: $(OFILES)
+
+clean:
+	$(RM) $(TARGETS) $(OFILES)
diff --git a/tools/testing/futex/ping_bench.c b/tools/testing/futex/ping_be=
nch.c
new file mode 100644
index 000000000000..418e147174d0
--- /dev/null
+++ b/tools/testing/futex/ping_bench.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdatomic.h>
+#include <string.h>
+#include <stdbool.h>
+#include <err.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <string.h>
+#include <time.h>
+#include <stdatomic.h>
+#include <stdarg.h>
+#include <pthread.h>
+#include <limits.h>
+#include <linux/futex.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>
+#include <sys/time.h>
+
+#define	MAX_THR 512
+
+#define	FUTEX_LOCK_PING		14
+#define	FUTEX_UNLOCK_PING	15
+
+#define	READ_ONCE(x) (*(volatile typeof(x) *)&(x))
+
+struct thread {
+	pthread_t pthr;
+	uint64_t *dur;
+	int id;
+};
+
+static struct thread bthr[MAX_THR];
+static struct thread thr[MAX_THR];
+static pthread_barrier_t bar;
+
+uint32_t _lock;
+pthread_mutex_t mtx =3D PTHREAD_MUTEX_INITIALIZER;
+void *lock =3D &_lock;
+
+static long counter;
+static int num_thr;
+static int num_rt;
+static int busy_thr;
+static uint64_t num_iter =3D 10000;
+static  __thread pid_t tid;
+static int work_times =3D 100000;
+static uint64_t sleep_dur =3D 1000;
+static bool do_sleep;
+static bool print_all;
+static bool quiet;
+static bool bias;
+
+enum futex_type {
+	FUTEX,
+	FUTEX_PI,
+	FUTEX_PING,
+	FUTEX_PING_USTEAL,
+	MUTEX,
+};
+static enum futex_type futex_type =3D FUTEX_PING;
+
+extern char *optarg;
+extern int optind;
+
+int trace_marker_fd;
+
+static void
+init_trace_marker(void)
+{
+	trace_marker_fd =3D open("/sys/kernel/tracing/trace_marker", O_WRONLY);
+	if (trace_marker_fd < 0)
+		perror("Failed to open trace_marker");
+}
+
+static int
+write_trace_marker(const char *format, ...)
+{
+	char buffer[256];
+	va_list args;
+	int len;
+
+	if (trace_marker_fd <=3D 0)
+		return -1;
+
+	va_start(args, format);
+	len =3D vsnprintf(buffer, sizeof(buffer), format, args);
+	va_end(args);
+
+	if (len > 0)
+		write(trace_marker_fd, buffer, len);
+
+	return (0);
+}
+
+static inline uint64_t
+now_ns(void)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_MONOTONIC, &ts) !=3D 0)
+		err(1, "clock_gettime");
+
+	return (ts.tv_sec * 1000000000UL + ts.tv_nsec);
+}
+
+static int
+futex(uint32_t *uaddr, int op, uint32_t val, struct timespec *to)
+{
+	return (syscall(SYS_futex, uaddr, op, val, to));
+}
+
+static void
+futex_lock(void *lock)
+{
+	pthread_mutex_t *mu;
+	uint32_t *fu, old;
+	int ret;
+
+	fu =3D lock;
+	mu =3D lock;
+	switch (futex_type) {
+	case FUTEX:
+		while (1) {
+			old =3D 0;
+			if (atomic_compare_exchange_strong(fu, &old, 1))
+				return;
+			if (futex(fu, FUTEX_WAIT, 1, NULL) !=3D 0 && errno !=3D
+			    EAGAIN)
+				err(1, "FUTEX_WAIT");
+		}
+		break;
+	case FUTEX_PI:
+		old =3D 0;
+		if (atomic_compare_exchange_strong(fu, &old, tid))
+			return;
+		if ((ret =3D futex(fu, FUTEX_LOCK_PI, 0, NULL)) !=3D 0)
+			errx(1, "FUTEX_LOCK_PI %s", strerror(ret));
+		break;
+	case FUTEX_PING:
+	case FUTEX_PING_USTEAL:
+		old =3D 0;
+		if (atomic_compare_exchange_strong(fu, &old, tid))
+			return;
+		old =3D FUTEX_WAITERS;
+		if (futex_type =3D=3D FUTEX_PING_USTEAL &&
+		    atomic_compare_exchange_strong(fu, &old, tid |
+		    FUTEX_WAITERS))
+			return;
+		if ((ret =3D futex(fu, FUTEX_LOCK_PING, 0, NULL)) !=3D 0)
+			err(1, "FUTEX_LOCK_PING");
+		break;
+	case MUTEX:
+		if (pthread_mutex_lock(mu) < 0)
+			err(1, "pthread_mutex_lock");
+		break;
+	}
+}
+
+static void
+futex_unlock(void *lock)
+{
+	pthread_mutex_t *mu;
+	uint32_t *fu, old;
+
+	fu =3D lock;
+	mu =3D lock;
+	switch (futex_type) {
+	case FUTEX:
+		old =3D 1;
+		if (atomic_compare_exchange_strong(fu, &old, 0))
+			if (futex(fu, FUTEX_WAKE, 1, NULL) < 0)
+				err(1, "FUTEX_WAKE");
+		break;
+	case FUTEX_PI:
+		old =3D tid;
+		if (atomic_compare_exchange_strong(fu, &old, 0))
+			return;
+		if (futex(fu, FUTEX_UNLOCK_PI, 0, NULL) !=3D 0)
+			err(1, "FUTEX_UNLOCK_PI t %x old %x", tid,
+			    READ_ONCE(*fu));
+		break;
+	case FUTEX_PING:
+	case FUTEX_PING_USTEAL:
+		old =3D tid;
+		if (atomic_compare_exchange_strong(fu, &old, 0))
+			return;
+		if (futex(fu, FUTEX_UNLOCK_PING, 0, NULL) !=3D 0)
+			err(1, "FUTEX_UNLOCK_PING t %x old %x", tid,
+			    READ_ONCE(*fu));
+		break;
+	case MUTEX:
+		if (pthread_mutex_unlock(mu) < 0)
+			err(1, "pthread_mutex_unlock");
+		break;
+	}
+}
+
+atomic_int stop_spinners =3D 0;
+
+static void *
+func(void *p)
+{
+	struct thread *thr;
+	uint64_t end, start;
+	uint64_t i, j, _num_iter;
+	uint64_t my_sleep_dur =3D sleep_dur;
+	uint64_t my_work_times =3D work_times;
+	struct timespec ts;
+
+	tid =3D gettid();
+
+	thr =3D p;
+	thr->dur =3D malloc(num_iter * sizeof(uint64_t));
+	_num_iter =3D num_iter;
+
+	if (thr->id =3D=3D 0) {
+		prctl(PR_SET_NAME, "foreground", 0, 0, 0);
+		if (bias) {
+			nice(-5);
+			my_sleep_dur *=3D 10;
+			if (my_work_times)
+				my_work_times /=3D 10;
+		}
+	} else {
+		prctl(PR_SET_NAME, "background", 0, 0, 0);
+		if (bias) {
+			if (my_sleep_dur)
+				my_sleep_dur /=3D 10;
+			my_work_times *=3D 10;
+			nice(19);
+		}
+	}
+
+	ts.tv_sec  =3D my_sleep_dur / 1000000;
+	ts.tv_nsec =3D (my_sleep_dur % 1000000) * 1000;
+
+
+	if (thr->id < num_rt) {
+		struct sched_param param =3D { .sched_priority =3D 10 };
+
+		if (sched_setscheduler(0, SCHED_FIFO, &param) !=3D 0)
+			err(1, "sched_setscheduler");
+	}
+
+	pthread_barrier_wait(&bar);
+
+	for (i =3D 0; i < _num_iter; i++) {
+		if (thr->id =3D=3D 0)
+			write_trace_marker("B|%lu|Locking", (unsigned long)tid);
+
+		start =3D now_ns();
+		futex_lock(lock);
+		end =3D now_ns();
+
+		if (thr->id =3D=3D 0)
+			write_trace_marker("E|%lu|Locking", (unsigned long)tid);
+		thr->dur[i] =3D end - start;
+
+		for (j =3D 0; j < my_work_times; j++)
+			__asm __volatile("" ::: "memory");
+
+		counter++;
+		futex_unlock(lock);
+
+		if (atomic_load(&stop_spinners))
+			break;
+
+		if (sleep_dur) {
+			if (do_sleep)
+				clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, 0);
+			else
+				for (j =3D 0; j < my_sleep_dur; j++)
+					__asm __volatile("" ::: "memory");
+		}
+	}
+
+	if (thr->id =3D=3D 0)
+		atomic_store(&stop_spinners, 1);
+	return (NULL);
+}
+
+static void *
+busy(void *p)
+{
+	prctl(PR_SET_NAME, "spinner", 0, 0, 0);
+	if (0 &&  num_rt) {
+		struct sched_param param =3D { .sched_priority =3D 1 };
+
+		if (sched_setscheduler(0, SCHED_FIFO, &param) !=3D 0)
+			err(1, "sched_setscheduler");
+	}
+
+	pthread_barrier_wait(&bar);
+
+	while (!atomic_load(&stop_spinners))
+		__asm __volatile("" ::: "memory");
+
+	return (NULL);
+}
+
+
+static void
+usage(char *a)
+{
+	fprintf(stderr, "Usage: %s [-a] [-b n] [-c] [-f f/m/n/N/p] [-n n] [-q]"
+	    " [-r n] [-s n] [-S n] [-t n] [-w n]\n", a);
+	exit(1);
+}
+
+int
+main(int argc, char **argv)
+{
+	int c, i, j, ret;
+
+	while ((c =3D getopt(argc, argv, "ab:f:n:pqr:S:s:t:w:")) !=3D -1) {
+		switch (c) {
+		case 'a':
+			print_all =3D 1;
+			break;
+		case 'f':
+			switch (*optarg) {
+			case 'f':
+				futex_type =3D FUTEX;
+				break;
+			case 'm':
+				futex_type =3D MUTEX;
+				lock =3D &mtx;
+				break;
+			case 'n':
+				futex_type =3D FUTEX_PING;
+				break;
+			case 'N':
+				futex_type =3D FUTEX_PING_USTEAL;
+				break;
+			case 'p':
+				futex_type =3D FUTEX_PI;
+				break;
+			default:
+				usage(argv[0]);
+			}
+			break;
+		case 'n':
+			num_iter =3D atoi(optarg);
+			break;
+		case 'q':
+			quiet =3D 1;
+			break;
+		case 'p':
+			bias =3D 1;
+			break;
+		case 'r':
+			num_rt =3D atoi(optarg);
+			break;
+		case 'S':
+			do_sleep =3D 1;
+			/* Fallthrough */
+		case 's':
+			sleep_dur =3D atoi(optarg);
+			break;
+		case 't':
+			num_thr =3D atoi(optarg);
+			break;
+		case 'b':
+			busy_thr =3D atoi(optarg);
+			break;
+		case 'w':
+			work_times =3D atoi(optarg);
+			break;
+		default:
+			usage(argv[0]);
+		}
+	}
+
+	init_trace_marker();
+
+	if (num_thr < num_rt)
+		num_thr =3D num_rt;
+
+	num_thr -=3D num_rt;
+	if (num_thr > MAX_THR)
+		num_thr =3D MAX_THR;
+
+	tid =3D gettid();
+
+	ret =3D pthread_barrier_init(&bar, NULL, num_thr + num_rt + busy_thr);
+	if (ret !=3D 0)
+		errx(1, "pthread_barrier_init %s", strerror(ret));
+
+	for (i =3D 0; i < num_thr + num_rt; i++) {
+		thr[i].id =3D i;
+		if ((ret =3D pthread_create(&thr[i].pthr, NULL, func, &thr[i]))
+		    !=3D 0)
+			errx(1, "pthread_create %d: %s", i, strerror(ret));
+	}
+=09
+	for (i =3D 0; i < busy_thr; i++) {
+		if ((ret =3D pthread_create(&bthr[i].pthr, NULL, busy, &bthr[i]))
+		    !=3D 0)
+			errx(1, "pthread_create %d: %s", i, strerror(ret));
+	}
+
+	for (i =3D 0; i < busy_thr; i++)
+		if ((ret =3D pthread_join(bthr[i].pthr, NULL)) !=3D 0)
+			errx(1, "pthread_join: %s\n", strerror(ret));
+
+	for (i =3D 0; i < num_thr + num_rt; i++)
+		if ((ret =3D pthread_join(thr[i].pthr, NULL)) !=3D 0)
+			errx(1, "pthread_join: %s\n", strerror(ret));
+
+	if (!quiet) {
+		/* skip the first run */
+		if (print_all)
+			for (i =3D 0; i < num_thr; i++)
+				for (j =3D 1; j < num_iter; j++)
+					printf("%lu\n", thr[0].dur[j]);
+		else
+			for (j =3D 1; j < num_iter; j++)
+				printf("%lu\n", thr[0].dur[j]);
+	}
+
+	return (0);
+}
--=20
2.55.0.1082.g2b9226bbc0-goog

