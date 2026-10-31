Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793484154;
	b=V362g/aW+yfvMNRJ3BF9hgnonA9QqmCMkl7y1BUIrBc6/8P7G1tSvL25ARQpOhOAZsi1
	 OkBauB0qwX4SpmC/59tWWHF2bTxvO3zSU6hJCdP3gKOjgrFfMPWKm5buLCrodSKP4KEof
	 QyXNqjwMx1FMXSMtr9k4AKgmEqW4cWVwZZ4gWeqkpDxXSXCuZLXzIFNGlm5VHRDYDMGd1
	 0Pwobc0WFf6X29nRtvQms2VerdwxsqB/mJuo2Y44SRPHV+H9HEuhW7rAj8Ft0AvcOAA0g
	 JArZKWkoZVbHqwWXeQ4pslWOyS5hOcVsDeWdXo4o1XRR08U89uUSZcLV3spQd2W9elg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793484154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding;
	bh=xP3JhAlM4HkjhdRWUONmrG4VfoPh9WqKeVh1nVQHz2Q=;
	b=H1fuJi+aC01Eu+M/+lUmte6TtmZUZ02ijPItfnDZuNsKkC21wCDwCN5oloaXUGDEyQxM
	 jEWplEySJF0GUwZocxpeMZPoPic1Ww0G9OdAwD/sxmIZDjlBQYQaUYQqKsqF6ZmMDD721
	 ERqP70oLBkrOLMqruQTIZg0mMh4To0P+lAWyNZTzb6MXVIY+OUzmRoHvHys5pX510F+VC
	 fJnfR0FD7FMnxoahTtvO00e3zbZShEife9pD2B1aTn9/lIj7fKrujAhDfN8hP2MHtOIlv
	 XIDbeNHnD9E7MYh0/WsDMoNJzGT37iKAvYry89MY5trS/Y+uIVZcdvK8TDQncnkoukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlACVC0A;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C4606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlACVC0A
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67989a98f8bso1142807d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793484153; x=1794088953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xP3JhAlM4HkjhdRWUONmrG4VfoPh9WqKeVh1nVQHz2Q=;
        b=HlACVC0AW1GN0y/p/SAvoTKBjY2jiQgWl7cpgvOgw8Hq8XekJBpPp/AAk/rOygnOkH
         K12ppcqX3Qh4yJVFWP7c0+17ihokyVXYkq7uArL069+QDbtm1GbAygSkYdn9sholxwPy
         Dvr4M8hZo1RpkSs+z1zbTsT8fqD9F6ZWQaQoIHtpZNFxZ6qfPkvprph+Gua0EFqPSC0K
         opJTz/shPBYv+0/n0dWAhhHuScc4zxSMXd9DNNoGV5SS2GaVZBdrk3O5tYG8VnV6mYtG
         cdv9grNIJxPsikVQiroCmr0lIKnri90jiPwdTYDK3cDj+OCxox8nZgVAKtz3CHNNaUfJ
         idFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793484153; x=1794088953;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xP3JhAlM4HkjhdRWUONmrG4VfoPh9WqKeVh1nVQHz2Q=;
        b=h+s8NHjHPtcvoAIvNCoul71CgVDnmpZaBQ7lCas9XuJ5bNBLjRagPShrocAllUnhWM
         HTL9N5TmawzyEv+0UXkquyfofBtO3BLt8p5niH9BcGFlHaKYihBtCszwHdLrmTfhFnTz
         KjNXBcgYZkRGZMAHGO333Dob3KpcrdbDmRibikFzqL1VEQ4AlU3RsMwY9ZX1SmdIrCo3
         GmcUpZxXqesUzNmiZtWtMEO8OPlIHhT7fMiTAzPuqtNB9pr2Gl2P7ObHL/4sEB+J/5fg
         een46Q62N83LVA29oskHkipkCHS3pgM9/ECeGDgD5cnCwtLBBKfNyl0Cqx8VcVBqtiDv
         YRSw==
X-Forwarded-Encrypted: i=1; AKwUvBxE1nWYQdiBub8y3S7ash4jRQO+Lyynpe68A8WAelmTmfPC6jYgB6qdhW6hak8ZeOCbLCDwqtE5K/OEeAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DD1KQj4H2We2xR+J/zmCLftzVolI0t6PB7UY14voplwBz66Jl
	8QTFf48mhkYS0yICITTjfYQJRuKCuwCCiOQW6fBpGYCmt6jEU+1czC/tOmB9z2YujKXK+Q==
X-Gm-Gg: AYBFou3q7798nkW4nmuGZeOQk9EsH7aRDctMhRDxb98tCza3Dtjc5ykhqhJspgOiDI+
	IjtlsFunM6cAb1AcLG0xQh5e5izXiUxafHltHdHf3xFrWvliNX9mQaC2nYMy8BfivRvjO8S9Ctm
	Vgg5BhcqNgvgYnx6SxK0YK1wbg4P2z3003k0gw5VQNG5ExsZ1uQa68Iz1gw1iI5ND7WXrh0c0rA
	iljCsO5dPelrONriUK/QhhyK7T8AV7rfS5ZQ2bRDXsQwQ/5DRcZLxvzmg8NGOMSwMSV9gyv79U9
	dya6koAoCV3In+oPXp7HE2wti1JDr6Tbbx9B9NKv43bIq9TH/UpiegIaNQuqFARYqBi4H588CDb
	ZBj34l/dnyvzzVK45gYBoljjni1xicm1ZGZoZuPQZ7LTTl9plD0pGUtL0DS2FhxnZM/Gd3t+dNW
	A7mRGEAgiSyJCsAIa0YEwaML2At/Xnb99yMUkuej5gdz9tKbfJV4qm3I4LPEZAJMcYx8Ak6wQsf
	MvV+6Eh8H2wl69LnOfl3VSBb7czaSv/xeIVX2AlXmQYJuHSWLn4z2RsWlrM+T7lXk0rycB2EyO1
	sORBVHxNvE9NRr17F1p50O35g8Pysjce9aZ8BUyNHHGR6ehLVvr4VcJuYV7cHhA+N90Os3nUbKw
	6QhzPDnXPUap3IcBowbHFVPXSXSHHktDmbGeuFLpkxw==
X-Received: by 2002:a05:690e:1c1b:b0:679:a252:70e7 with SMTP id 956f58d0204a3-67ba4e955c9mr4891251d50.22.1793484153344;
        Sat, 31 Oct 2026 15:02:33 -0700 (PDT)
Received: from [100.70.73.136] (host-219-69.tnnaknt.nashville.tn.us.clients.pavlovmedia.net. [96.63.219.69])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm2006784d50.13.2026.10.31.15.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:02:33 -0700 (PDT)
Message-ID: <3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmail.com>
Date: Sat, 31 Oct 2026 17:02:31 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
From: Weiheng Qiu <weihengqiuu@gmail.com>
Subject: sched/deadline: total_bw leak when SCHED_DEADLINE is set on a dead
 task
Autocrypt: addr=weihengqiuu@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

sched_setattr(SCHED_DEADLINE) on a task that has exited but has not
been reaped returns 0 and charges the root domain's dl_bw->total_bw.
The task never runs again, so nothing releases it, not even reaping.

__sched_setscheduler() does not look at p->exit_state, so
sched_dl_overflow() charges the task. A DL task's bandwidth is
normally released at its last dequeue, which a task that has already
done its final __schedule() never reaches again.

Repeating it fills total_bw to the admission cap: a later
sched_setattr(SCHED_DEADLINE) and CPU offline then fail with -EBUSY
with no DL task left; only a root-domain rebuild recomputes it. A
thread-group leader that exits while its other threads run stays
unreaped and keeps the TGID, so a pid is enough. Needs CAP_SYS_NICE,
as any DL admission does.

Reproducer below; needs root and debugfs, assumes x86-64. On mainline
c339f4010dea (0.25 CPU == 262144):

  task 63 state Z
  total_bw at start: 0.100 CPU (104856)
  SCHED_DEADLINE on the zombie: rc 0, policy 6, total_bw 0.350 CPU (367000)
  zombie reaped: total_bw 0.350 CPU (367000), +0.250 CPU (262144)
  6 more zombies admitted, then: Device or resource busy
  total_bw 1.850 CPU (1939864)
  DL tasks left: 0; new 0.250-CPU request: Device or resource busy
  after a root-domain rebuild (recomputed): total_bw 0.100 CPU (104856)

Thanks,
Weiheng Qiu
Vanderbilt University

/* sched_setattr(SCHED_DEADLINE) on a zombie succeeds and charges total_bw;
 * the task never runs again, so nothing releases the reservation, not even
 * reaping the zombie (only a full root-domain rebuild recomputes total_bw).
 *
 * Build: gcc -O2 -Wall -o zombie_admit_leak zombie_admit_leak.c
 * Run as root. Needs CONFIG_DEBUG_FS; total_bw is read from
 * /sys/kernel/debug/sched/debug.
 */
#define _GNU_SOURCE
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mount.h>
#include <sys/syscall.h>
#include <sys/wait.h>

#define SCHED_OTHER_		0
#define SCHED_DEADLINE_		6
#define BW_UNIT			(1LL << 20)	/* BW_SHIFT: 1 CPU == 1 << 20 */

struct sched_attr_ {
	uint32_t size;
	uint32_t sched_policy;
	uint64_t sched_flags;
	int32_t  sched_nice;
	uint32_t sched_priority;
	uint64_t sched_runtime;
	uint64_t sched_deadline;
	uint64_t sched_period;
};

static inline int setattr(pid_t pid, uint32_t policy, uint64_t flags,
		   uint64_t runtime_ns, uint64_t deadline_ns, uint64_t period_ns)
{
	struct sched_attr_ a = {
		.size = sizeof(a), .sched_policy = policy, .sched_flags = flags,
		.sched_runtime = runtime_ns, .sched_deadline = deadline_ns,
		.sched_period = period_ns,
	};
	return syscall(SYS_sched_setattr, pid, &a, 0) ? -errno : 0;
}

static inline int getattr(pid_t pid, struct sched_attr_ *a)
{
	memset(a, 0, sizeof(*a));
	return syscall(SYS_sched_getattr, pid, a, sizeof(*a), 0) ? -errno : 0;
}

static inline void need_debugfs(void)
{
	if (access("/sys/kernel/debug/sched/debug", R_OK))
		mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
	if (access("/sys/kernel/debug/sched/debug", R_OK)) {
		perror("/sys/kernel/debug/sched/debug");
		exit(2);
	}
}

/* dl_bw->total_bw of the root domain @cpu belongs to. */
static inline long long total_bw(int cpu)
{
	FILE *f = fopen("/sys/kernel/debug/sched/debug", "r");
	char line[256], *p;
	long long v = 0;
	int cur = -1, c;

	if (!f) {
		perror("open sched/debug");
		exit(2);
	}
	while (fgets(line, sizeof(line), f)) {
		if (sscanf(line, "dl_rq[%d]:", &c) == 1)
			cur = c;
		else if (cur == cpu && (p = strstr(line, "dl_bw->total_bw")) &&
			 (p = strchr(p, ':'))) {
			v = atoll(p + 1);
			break;
		}
	}
	fclose(f);
	return v;
}

static inline char task_state(pid_t pid)
{
	char path[64], buf[512], *p;
	FILE *f;

	snprintf(path, sizeof(path), "/proc/%d/stat", pid);
	f = fopen(path, "r");
	if (!f)
		return '?';
	if (!fgets(buf, sizeof(buf), f))
		buf[0] = 0;
	fclose(f);
	p = strrchr(buf, ')');
	return p && p[1] && p[2] ? p[2] : '?';
}

/* Wait until @pid is asleep (S) in the kernel. */
static inline void wait_sleeping(pid_t pid)
{
	for (int i = 0; i < 1000 && task_state(pid) != 'S'; i++)
		usleep(1000);
}

/* A child that blocks in read() and never wakes up by itself. */
static inline pid_t spawn_sleeper(void)
{
	int fd[2];
	pid_t pid;
	char ch;

	if (pipe(fd))
		exit(2);
	pid = fork();
	if (pid == 0) {
		close(fd[1]);
		if (read(fd[0], &ch, 1) < 0)
			_exit(1);
		_exit(0);
	}
	close(fd[0]);
	wait_sleeping(pid);
	return pid;
}

static inline void reap(pid_t pid)
{
	kill(pid, SIGKILL);
	waitpid(pid, NULL, 0);
	usleep(200 * 1000);	/* well past any 0-lag time */
}

static inline const char *bw_str(long long bw)
{
	static char buf[4][48];
	static int i;
	char *b = buf[i++ & 3];

	snprintf(b, 48, "%.3f CPU (%lld)", (double)bw / BW_UNIT, bw);
	return b;
}

/* Number of threads whose policy is SCHED_DEADLINE (field 41 of stat). */
static inline int count_dl_tasks(void)
{
	char path[600], buf[1024], *s;
	struct dirent *p, *t;
	DIR *pd, *td;
	FILE *f;
	int n = 0, i;

	pd = opendir("/proc");
	while (pd && (p = readdir(pd))) {
		if (p->d_name[0] < '0' || p->d_name[0] > '9')
			continue;
		snprintf(path, sizeof(path), "/proc/%s/task", p->d_name);
		td = opendir(path);
		while (td && (t = readdir(td))) {
			if (t->d_name[0] == '.')
				continue;
			snprintf(path, sizeof(path), "/proc/%s/task/%s/stat",
				 p->d_name, t->d_name);
			f = fopen(path, "r");
			if (!f)
				continue;
			s = fgets(buf, sizeof(buf), f) ? strrchr(buf, ')') : NULL;
			fclose(f);
			for (i = 0; s && i < 39; i++)
				s = strchr(s + 1, ' ');
			if (s && atoi(s + 1) == SCHED_DEADLINE_)
				n++;
		}
		if (td)
			closedir(td);
	}
	if (pd)
		closedir(pd);
	return n;
}

/* After a leak, ask for a reservation of the same size for a new task. */
static inline void try_fresh_admission(uint64_t runtime_ns,
				       uint64_t period_ns)
{
	int dl = count_dl_tasks();
	pid_t pid = spawn_sleeper();
	int rc = setattr(pid, SCHED_DEADLINE_, 0, runtime_ns, period_ns,
			 period_ns);

	printf("DL tasks left: %d; new %.3f-CPU request: %s\n", dl,
	       (double)runtime_ns / period_ns,
	       rc ? strerror(-rc) : "accepted");
	reap(pid);
}

/* Reading this sysctl makes sched_rt_handler() call rebuild_sched_domains(),
 * whose dl_rebuild_rd_accounting() recomputes total_bw from the servers and
 * the SCHED_DEADLINE tasks that actually exist. */
static inline long long recomputed_total_bw(int cpu)
{
	char buf[32];
	int fd = open("/proc/sys/kernel/sched_rt_runtime_us", O_RDONLY);

	if (fd >= 0) {
		if (read(fd, buf, sizeof(buf)) < 0)
			perror("sched_rt_runtime_us");
		close(fd);
	}
	return total_bw(cpu);
}

#define RUNTIME	(5 * 1000 * 1000ULL)	/* 5ms / 20ms = 0.25 CPU */
#define PERIOD	(20 * 1000 * 1000ULL)

static pid_t spawn_zombie(void)
{
	siginfo_t si;
	pid_t pid = fork();

	if (pid == 0)
		_exit(0);
	/* Wait for the exit but leave it unreaped. exit_state is set in
	 * exit_notify(), before the child's final schedule; give it time to
	 * get off the runqueue, after which nothing would release a charge. */
	waitid(P_PID, pid, &si, WEXITED | WNOWAIT);
	usleep(20 * 1000);
	return pid;
}

int main(void)
{
	long long base, b1, b2;
	struct sched_attr_ a;
	pid_t pid;
	int i, rc;

	need_debugfs();
	base = total_bw(0);
	pid = spawn_zombie();
	printf("task %d state %c\ntotal_bw at start: %s\n", pid,
	       task_state(pid), bw_str(base));
	rc = setattr(pid, SCHED_DEADLINE_, 0, RUNTIME, PERIOD, PERIOD);
	getattr(pid, &a);
	b1 = total_bw(0);
	printf("SCHED_DEADLINE on the zombie: rc %d, policy %u, total_bw %s\n",
	       rc, a.sched_policy, bw_str(b1));
	waitpid(pid, NULL, 0);
	usleep(200 * 1000);
	b2 = total_bw(0);
	printf("zombie reaped: total_bw %s, +%s\n", bw_str(b2),
	       bw_str(b2 - base));

	for (i = 0; i < 1000; i++) {
		pid = spawn_zombie();
		rc = setattr(pid, SCHED_DEADLINE_, 0, RUNTIME, PERIOD, PERIOD);
		waitpid(pid, NULL, 0);
		if (rc)
			break;
	}
	printf("%d more zombies admitted, then: %s\n", i,
	       rc ? strerror(-rc) : "-");
	printf("total_bw %s\n", bw_str(total_bw(0)));
	try_fresh_admission(RUNTIME, PERIOD);
	printf("after a root-domain rebuild (recomputed): total_bw %s\n",
	       bw_str(recomputed_total_bw(0)));
	return b2 != base;
}
