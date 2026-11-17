Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925645;
	b=T3UnZVXdeg8pWCUcU9RLCtQWKTEE1JZan4MtHEgvzbj882NUT1KFBX2c/mG9B5JwtBK/
	 6gbQNPCqafzsdaZytthctfEsdyPIcajkx1GAz89E/ySVcrE2r5EGsN1azj5YrM7mMvgF4
	 2z9ZLCJrbZU4OY1JtpP+utpmKkWDpcESQooCcHqex2rblaABdOBdrFnbmFsi2h7K2v0Rx
	 voN5saG3MIehDsqCfRXKv3/ZeIGd4sqT+nzHA5WOSWq5YJ+d8c6vUjA5NgdLnXngQZXob
	 Ib7QyXaezMLGbriLFMQxwboE9fbnYDznx+kY+c3lY4oQPj6sOhx/g56qM7u0CeZrGAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925645;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8r/671llW0htCzDyBc11crdiikLVA5rqmcyv8GKbFuo=;
	b=Mo/K1RSLnQNOo1y+LPtIpSE2PbBP+RMxEdPZU7JxX8pdtX40hrX+yl6dS34tccvgMw0b
	 dTIbVIb1NObcU8hLx8jta80RvY7tWoqcq2xg4zZPyrM5hynGPqdbUyL+b46g3fBrUnRKy
	 +y55+t4aweaquFF2Elr/tv0KdtTAIJCwTou3yauXnRwJ6ZTQJlcVTzaO0ubX7ctbTbKeJ
	 R6vuCRyChvPrqpomjaCiIDRQwvPJoqGrRWCKtfQB8IZ/Z6zLm1nSBZhkUrvuQ27rb71o1
	 0+Xg78x+Sp9S8V9RHCicNN0a+GyPR+R0w19Sl6ZdpD3BIQ+dO3vXDKjhUqHuIKZVdZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=idqFsm9F;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B8606A8AE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2B8606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=idqFsm9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794925644; x=1826461644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8r/671llW0htCzDyBc11crdiikLVA5rqmcyv8GKbFuo=;
  b=idqFsm9F6rBJ3gQiVlAiH22cQlD1nM0UIq5RG07Y4f65NSXCFzEY+5eC
   DaGUOOy/IbQJPsOFCZSJBTnXFQVGswV+XxA2m3qTKXMOo48pGKIDRTId1
   rJOK6pZeJgk7mp1/u+KglhjDFLkACQ8ppVYW2q+TTP4KA1JoESFd/qyN9
   c6Gp9f9iFXZXAlrTIwcF+xT5KDDH/BQM6HZk2mcV5acjpqHuReSeEPepT
   0IcmNlPrQEO5nlX5+X5rmT/i9svlAySYq8Idcd1jIMwfxSo4x4agRq3QS
   8K23UmiqsNZj9fbgRliPDsVMJ7v7k4SEf0UxuHs87yTnW21TdKBJzzkVZ
   g==;
X-CSE-ConnectionGUID: UISAjzhfTxeNo7YlmRpX5g==
X-CSE-MsgGUID: SFPp5xjjQzGAKje588yFgA==
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208";a="34161393"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:27:21 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:5092]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id f970123b-d0fd-4d58-a7ad-3968a407831c; Tue, 17 Nov 2026 14:27:21 +0000 (UTC)
X-Farcaster-Flow-ID: f970123b-d0fd-4d58-a7ad-3968a407831c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 17 Nov 2026 14:27:20 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Tue, 17 Nov 2026
 14:27:18 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: Re: [PATCH 0/2] sched/core: Fix stale core_pick and forced idle after SM_IDLE fast path
Date: Tue, 17 Nov 2026 14:27:04 +0000
Message-ID: <20261117142704.6878-4-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117142704.6878-1-lshahed@amazon.de>
References: <20261117142704.6878-1-lshahed@amazon.de>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Here are the two test programs used for the numbers in the cover letter.

1. init.c runs as PID 1 in a KVM guest with one socket, two cores and
   two threads (CPUs 0 and 1 are one core). A cookied task yields on
   CPU0. Each attempt wakes a SCHED_FIFO task with another cookie, in
   its own cgroup, on CPU1 and migrates it to CPU2 0-50 us later. If
   the yielding task then makes no progress for 20 ms, the core is
   stuck forced idle ("STALE"): the program kills the task, removes its
   cgroup, waits 100 ms without touching CPUs 0 and 1, and wakes a task
   on CPU1. Without the series that reschedule oopses in
   __cgroup_account_cputime_field(). mode=nomigrate is a control that
   never migrates the woken task.

   Build and run:

     gcc -O2 -static -o init init.c
     mkdir -p root/dev root/proc root/sys/fs/cgroup && cp init root/
     (cd root && find . | cpio -o -H newc | gzip) > initramfs.cpio.gz
     qemu-system-x86_64 -enable-kvm -cpu host -m 2G -nographic -no-reboot \
       -smp 4,sockets=1,cores=2,threads=2 \
       -kernel bzImage -initrd initramfs.cpio.gz \
       -append "schedstats=enable idle=halt console=ttyS0 panic=-1 mode=migrate secs=240"

   The kernel needs CONFIG_SCHED_CORE, CONFIG_SCHEDSTATS, CONFIG_SCHED_SMT,
   CONFIG_CGROUP_SCHED and CONFIG_FAIR_GROUP_SCHED.

2. cschurn.c runs the same churn on bare metal on half of the SMT cores,
   using the other half as migration targets, and counts a stall when
   the yielding task makes no progress for 5 ms. It frees each woken
   task and its cgroup shortly after the check (2 ms by default, second
   argument), so it shows the stuck forced idle but not the
   use-after-free.

     gcc -O2 -o cschurn cschurn.c
     ./cschurn 300        # as root, cgroup2 at /sys/fs/cgroup,
                          # kernel booted with schedstats=enable

---8<--- init.c ---8<---
// PID 1 for a 1-socket/2-core/2-thread KVM guest (CPUs 0,1 = one core).
// Reproducer for the core-sched stale rq->core_pick use-after-free:
// U (cookie A, SCHED_OTHER, CPU0) yields in a loop; each attempt wakes a
// SCHED_FIFO victim V (cookie B, own cgroup, CPU1), spins 0..50us, then
// migrates V to CPU2. If U stalls 20ms -> STALE: free V and its cgroup
// without touching CPUs 0/1, wait 100ms, then poke CPU1.
// Kernel cmdline: mode=migrate|nomigrate secs=N
#define _GNU_SOURCE
#include <errno.h>
#include <sched.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/reboot.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>

#ifndef PR_SCHED_CORE
#define PR_SCHED_CORE 62
#endif
#define PR_SCHED_CORE_CREATE 1

static volatile uint64_t *ctr;

static uint64_t now_ns(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return t.tv_sec * 1000000000ull + t.tv_nsec; }
static void pin(pid_t p, int cpu) { cpu_set_t s; CPU_ZERO(&s); CPU_SET(cpu, &s); if (sched_setaffinity(p, sizeof s, &s)) printf("setaffinity(%d,%d): %s\n", p, cpu, strerror(errno)); }
static void cookie(void) { if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, 0 /*PIDTYPE_PID*/, 0)) printf("prctl cookie: %s\n", strerror(errno)); }
static void wr(const char *path, const char *s) { int fd = open(path, O_WRONLY); if (fd < 0 || write(fd, s, strlen(s)) < 0) printf("write %s: %s\n", path, strerror(errno)); if (fd >= 0) close(fd); }
static void die(void) { fflush(stdout); sync(); reboot(RB_POWER_OFF); for (;;) pause(); }

int main(void)
{
	mount("devtmpfs", "/dev", "devtmpfs", 0, 0);
	{ int c = open("/dev/console", O_RDWR); if (c >= 0) { dup2(c, 0); dup2(c, 1); dup2(c, 2); if (c > 2) close(c); } }
	mount("proc", "/proc", "proc", 0, 0);
	mount("sysfs", "/sys", "sysfs", 0, 0);
	mount("cgroup2", "/sys/fs/cgroup", "cgroup2", 0, 0);
	setvbuf(stdout, 0, _IONBF, 0);
	const char *mode = getenv("mode") ? getenv("mode") : "migrate";
	int secs = getenv("secs") ? atoi(getenv("secs")) : 180;
	int migrate = strcmp(mode, "nomigrate") != 0;
	printf("init: %ld CPUs, mode=%s secs=%d\n", sysconf(_SC_NPROCESSORS_ONLN), mode, secs);
	char buf[256]; int fd = open("/sys/devices/system/cpu/cpu0/topology/thread_siblings_list", O_RDONLY);
	if (fd >= 0) { int n = read(fd, buf, 255); buf[n > 0 ? n : 0] = 0; printf("init: cpu0 siblings %s", buf); close(fd); }

	ctr = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	pid_t u = fork();
	if (!u) { pin(0, 0); cookie(); for (;;) { sched_yield(); (*ctr)++; } }
	pin(0, 3);
	srand(time(0) ^ getpid());
	usleep(100000);

	uint64_t end = now_ns() + (uint64_t)secs * 1000000000ull;
	int stale = 0, attempt;
	for (attempt = 0; now_ns() < end; attempt++) {
		char cg[64]; snprintf(cg, sizeof cg, "/sys/fs/cgroup/v%d", attempt);
		if (mkdir(cg, 0755)) { printf("mkdir %s: %s\n", cg, strerror(errno)); break; }
		int p[2], r[2]; pipe(p); pipe(r);
		pid_t v = fork();
		if (!v) {
			char c; close(p[1]); close(r[0]);
			cookie();
			struct sched_param sp = { .sched_priority = 50 };
			if (sched_setscheduler(0, SCHED_FIFO, &sp)) printf("fifo: %s\n", strerror(errno));
			pin(0, 1);
			write(r[1], "r", 1);
			read(p[0], &c, 1);
			/* run briefly, then block for good: a spinning cookie-B FIFO task on
			 * CPU2 would force-idle the parent on its sibling CPU3 */
			struct timespec a, b; clock_gettime(CLOCK_MONOTONIC, &a);
			do clock_gettime(CLOCK_MONOTONIC, &b); while ((b.tv_sec - a.tv_sec) * 1000000000l + b.tv_nsec - a.tv_nsec < 200000);
			for (;;) pause();
		}
		close(p[0]); close(r[1]);
		char procs[96], pidb[16], c; snprintf(procs, sizeof procs, "%s/cgroup.procs", cg);
		snprintf(pidb, sizeof pidb, "%d", v); wr(procs, pidb);
		read(r[0], &c, 1);
		usleep(1000); /* let V block on the pipe */
		write(p[1], "w", 1);
		uint64_t t0 = now_ns(), spin = (rand() % 51) * 1000ull;
		while (now_ns() - t0 < spin) ;
		if (migrate) pin(v, 2);
		/* nomigrate: V legitimately owns the core while it runs on CPU1, so the
		 * control kills V in place (still on CPU1) and then checks U resumes */
		if (!migrate) { kill(v, SIGKILL); waitpid(v, 0, 0); }
		/* oracle: U must make progress within 20 ms */
		uint64_t c0 = *ctr, t1 = now_ns(); int st = 1;
		while (now_ns() - t1 < 20000000ull) if (*ctr != c0) { st = 0; break; }
		if (migrate) { kill(v, SIGKILL); waitpid(v, 0, 0); }
		for (int i = 0; i < 1000 && rmdir(cg); i++) usleep(1000);
		close(p[1]); close(r[0]);
		if (st) {
			stale++;
			printf("STALE attempt=%d spin=%luus\n", attempt, (unsigned long)(spin / 1000));
			usleep(100000); /* RCU frees task_struct and css */
			pid_t k = fork();
			if (!k) { pin(0, 1); _exit(0); }
			waitpid(k, 0, 0);
			uint64_t c1 = *ctr; usleep(20000);
			printf("POKE attempt=%d done, U %s\n", attempt, *ctr != c1 ? "progressing" : "STILL STUCK");
		}
		if (attempt % 1000 == 0) printf("init: attempt %d, stale %d, U ctr %llu\n", attempt, stale, (unsigned long long)*ctr);
	}
	printf("init: DONE attempts=%d stale=%d mode=%s\n", attempt, stale, mode);
	die();
}
---8<--- cschurn.c ---8<---
// Parallel core-scheduling churn for SMT hosts.
//
// For each test core (siblings A, B): a cookied task U on A that yields in a
// loop, and a controller pinned on a CPU of a different "helper" core. Each
// attempt the controller forks a victim V in its own cgroup with a different
// cookie, SCHED_FIFO, pinned to B and blocked on a pipe; it wakes V, spins
// 0-50 us, moves V to the helper CPU, then checks that U makes progress for
// STALL_US. Then V is killed, reaped, its cgroup removed, and a short task
// is woken on B so the core schedules again after the free.
//
// Usage: cschurn <seconds>
#define _GNU_SOURCE
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#ifndef PR_SCHED_CORE
#define PR_SCHED_CORE 62
#define PR_SCHED_CORE_CREATE 1
#endif
#define PIDTYPE_TGID 1
#define STALL_US 5000
#define MAXCORES 512

struct slot {
	volatile uint64_t u_count;
	volatile uint64_t attempts, stalls;
};

static int sib[MAXCORES][2], ncores;

static uint64_t now_ns(void)
{
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

static void pin_pid(pid_t pid, int cpu)
{
	cpu_set_t s;
	CPU_ZERO(&s);
	CPU_SET(cpu, &s);
	sched_setaffinity(pid, sizeof(s), &s);
}


static void wr(const char *path, const char *val)
{
	int fd = open(path, O_WRONLY);
	if (fd >= 0) {
		if (write(fd, val, strlen(val)) < 0)
			;
		close(fd);
	}
}

/* Collect (first, second) SMT siblings per core from sysfs. */
static void topo(void)
{
	char p[256];
	int cpu, seen[4096] = { 0 };
	long n = sysconf(_SC_NPROCESSORS_ONLN);

	for (cpu = 0; cpu < n && ncores < MAXCORES; cpu++) {
		int a, b;
		FILE *f;
		if (seen[cpu])
			continue;
		snprintf(p, sizeof(p),
			 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings_list", cpu);
		f = fopen(p, "r");
		if (!f)
			continue;
		if (fscanf(f, "%d%*[,-]%d", &a, &b) == 2) {
			sib[ncores][0] = a;
			sib[ncores][1] = b;
			seen[a] = seen[b] = 1;
			ncores++;
		}
		fclose(f);
	}
}

static int postfree_us = 2000;

static void controller(int id, int a, int b, int helper, struct slot *sl,
		       uint64_t end)
{
	char cg[128], buf[32];
	unsigned seed = id * 7919 + 1;
	int k = 0;

	pin_pid(0, helper);
	while (now_ns() < end) {
		int p[2];
		pid_t v;
		uint64_t c0, t0, d;

		snprintf(cg, sizeof(cg), "/sys/fs/cgroup/cs/c%d_%d", id, k++);
		mkdir(cg, 0755);
		if (pipe(p))
			break;
		v = fork();
		if (v == 0) {
			struct sched_param sp = { .sched_priority = 10 };
			char procs[160];
			snprintf(procs, sizeof(procs), "%s/cgroup.procs", cg);
			snprintf(buf, sizeof(buf), "%d", getpid());
			wr(procs, buf);
			prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_TGID, 0);
			sched_setscheduler(0, SCHED_FIFO, &sp);
			pin_pid(0, b);
			close(p[1]);
			if (read(p[0], buf, 1) < 0)
				;
			for (;;)
				;
		}
		close(p[0]);
		usleep(500);	/* V blocks on B */

		d = rand_r(&seed) % 50000;
		if (write(p[1], "x", 1) < 0)
			;
		t0 = now_ns();
		while (now_ns() - t0 < d)
			;
		pin_pid(v, helper);	/* migrate V off B */

		c0 = sl->u_count;
		usleep(STALL_US);
		sl->attempts++;
		if (sl->u_count == c0)
			sl->stalls++;

		kill(v, SIGKILL);
		waitpid(v, NULL, 0);
		close(p[1]);
		while (rmdir(cg) && errno == EBUSY)
			usleep(200);
		usleep(postfree_us);	/* let task and cgroup be freed */
		if (fork() == 0) {	/* make B schedule after the free */
			pin_pid(0, b);
			_exit(0);
		}
		wait(NULL);
	}
	_exit(0);
}

int main(int argc, char **argv)
{
	int secs = argc > 1 ? atoi(argv[1]) : 180, i, ntest;

	if (argc > 2)
		postfree_us = atoi(argv[2]);
	struct slot *sl;
	uint64_t end, attempts = 0, stalls = 0;
	pid_t *upid;

	topo();
	if (ncores < 2) {
		fprintf(stderr, "no SMT topology\n");
		return 1;
	}
	ntest = ncores / 2;	/* first half under test, second half helpers */
	sl = mmap(NULL, sizeof(*sl) * ntest, PROT_READ | PROT_WRITE,
		  MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	upid = calloc(ntest, sizeof(*upid));
	mkdir("/sys/fs/cgroup/cs", 0755);
	mkdir("/sys/fs/cgroup/cs/u", 0755);

	for (i = 0; i < ntest; i++) {
		pid_t u = fork();
		if (u == 0) {
			char b[32];
			snprintf(b, sizeof(b), "%d", getpid());
			wr("/sys/fs/cgroup/cs/u/cgroup.procs", b);
			pin_pid(0, sib[i][0]);
			prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_TGID, 0);
			for (;;) {
				sl[i].u_count++;
				sched_yield();
			}
		}
		upid[i] = u;
	}
	usleep(200000);
	end = now_ns() + (uint64_t)secs * 1000000000ull;
	printf("cschurn: %d SMT cores, %d under test, %d s, postfree %d us\n", ncores, ntest, secs, postfree_us);
	fflush(stdout);
	for (i = 0; i < ntest; i++)
		if (fork() == 0)
			controller(i, sib[i][0], sib[i][1], sib[ntest + i][0],
				   &sl[i], end);
	for (i = 0; i < ntest; i++)
		wait(NULL);

	for (i = 0; i < ntest; i++) {
		attempts += sl[i].attempts;
		stalls += sl[i].stalls;
	}
	printf("cschurn: attempts=%llu stalls=%llu (U made no progress for %d us)\n",
	       (unsigned long long)attempts, (unsigned long long)stalls, STALL_US);
	{
		char p[64], line[256];
		FILE *f;
		snprintf(p, sizeof(p), "/proc/%d/sched", upid[0]);
		f = fopen(p, "r");
		while (f && fgets(line, sizeof(line), f))
			if (strstr(line, "forceidle"))
				printf("U[0] %s", line);
		if (f)
			fclose(f);
		f = fopen("/sys/fs/cgroup/cs/cpu.stat", "r");
		while (f && fgets(line, sizeof(line), f))
			if (strstr(line, "force_idle"))
				printf("cgroup cs %s", line);
		if (f)
			fclose(f);
	}
	for (i = 0; i < ntest; i++)
		kill(upid[i], SIGKILL);
	while (wait(NULL) > 0)
		;
	rmdir("/sys/fs/cgroup/cs/u");
	rmdir("/sys/fs/cgroup/cs");
	return 0;
}
