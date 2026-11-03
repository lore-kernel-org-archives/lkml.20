Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687211;
	b=DLLRdqWg80v/+VYVdVlf67r6WyG+oB4ho+pQBU7UAeqxk11MLkUdy7AGz2sebG/YezKb
	 2LB8sIZtctIymd7q6HhGdlx57ABWFmIUN4AIHDL4g7I6dsGPatd1kkziFxkvDt/0Jw/OV
	 1l/czVMN8LSFmoJgMF042+auBBxAvuJxesiv/gnhqIwXeisfoZ6a0cMIAZt0kgtQyWJDh
	 c4hJKjauwLYc0aHH7oLsAt2XvWQtUNibxFuH2vtzdKW0sP3DInmfnHr6tSrM8zRDS6TLG
	 S4Tg84qk9T+geDJyutyYHRfOIRvBlY5kC6jXgbpORwAwuuH49ytaatjKn0QUBAU9Gpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+tSHMjmVyAzBAemayOp3xoXjEVFUOVEvi2+TcKKL6s=;
	b=m8YOZP0xXyk9EmWP6Yac77qkfr/ud5ylbmyidl0v8/k5St3JUQKVCubIpp80loErB41k
	 ks0+9BNtw5OISqX0bMY6/N4i7SDn5OknPb32uMVOLhjEUy8T1DExNR1PXE7aQY09m265i
	 /HFxbRldJ/yh0ehgrGn//hbWYNFz1pEFPuWMjrI+K2Hi7ju0gFSOAW7cUT8OzhK7vGFsN
	 zNxbqhU186w058S0QAsUovTdix82IQGwU3uA0BWFmEGcGP9mWssCP4kr4vmilRQbIoFCx
	 q5m3KyFBv4M6WZ/NveVseZD53gviIa3y3pDMzwQgXFfF7KDV6ImVp42gQsRCbGWaCDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sujit.dev;
	spf=pass smtp.mailfrom=sujit.dev;
	dkim=pass header.d=sujit.dev header.i=@sujit.dev header.a=rsa-sha256 header.s=google header.b=dNoJNUtX;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1905606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1905606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sujit.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sujit.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sujit.dev header.i=@sujit.dev header.a=rsa-sha256 header.s=google header.b=dNoJNUtX
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3509518eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sujit.dev; s=google; t=1793687210; x=1794292010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+tSHMjmVyAzBAemayOp3xoXjEVFUOVEvi2+TcKKL6s=;
        b=dNoJNUtXDBx1w4rngPxjft1NWAOHPmgj039v2iToc4/tNREGoWk05E1VNk5oIKcNrd
         kps/E1Jiom5JsLzGakfOh/IjD9UqVk9gJDVsz3sKm40VVnJSx0JOY60EDYsmmh+0hp83
         OO+8p4N7EWpumGPmftglC8NpCb9bDi0cFGtbetUXPbhp2kOdNWeT+TPJwUen37RGe8L6
         lGixfm8Ot8IxSgycvwt9SpuAvzWHMsoL2feC4YWbRBbjkVoIaSMho6rl+H1Tnj02c2yC
         N8bG/7XQ7RHFtb7OpUm2RCkBom+sZ7PN1Oc9L7vEML7ZGL1nKyTAy88cPLXYkLRIApS1
         7F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687210; x=1794292010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+tSHMjmVyAzBAemayOp3xoXjEVFUOVEvi2+TcKKL6s=;
        b=C28GGuYiD3WR4cxO9Q3Ta+jT5mHCY2ZL07rOGXvH20K/sWjRPWMld+0KYuwWgy254y
         cUP+VYmMHK0lA1wBho56Fal5oCeEX0f+p3aU8wBjdSEnk2ubvz/xy0JDPmzZOz84jQ6E
         Y43YKM151G1iEF7hIkJhofbTVoqYIuxM42ggyPdb7QjmcsoX0u7RaMD4e+fSgBi7OY66
         nJsIO7uYDOIlubPz/8N6EGHwNlJXmu6u7PnT6W0fRGodrRx38JLtF988o9nq4EhuxGmo
         38zabKarmQvRM4ngPPNRhC0VNBXnh1BsAUM7yQqI201BHUZsV3eOxbK2qzBTJacFBdLV
         ROWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSCjXHINcbSDtmDGDbqzV//K0HttuABGXjaRrqwrmfWrapiiQntNkQd6v9MIvOmJ8VUuhVbUfIXbFIuE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WWwLLbkvzRSHYe2wzZwM6fmr5p4xNjsegilYsQjBj1MqWS4KD
	wFlsq1DEUlXSw8fSwkIb5D3vJ+1nYq2lhlDL+aMzTfZs9MaLQl2juOZM8L4/FWcI2zprSY33at3
	w6TIPL6M=
X-Gm-Gg: AYBFou2VTKfvub7y3NRXDLiM91tsF2Y2UtFgk3pKrqYMgWDf3PA+ZNz9wGvj+sl7OUi
	jqyn21akUoR9csuevCabFirghoA1MFGYmOWEDadCcLt2VySbGewIgVjhYWqYGsii5VQuWl/f1zY
	CkDdcIUJOWgRHlKrZfBx3gQEnnbXd+tLNsE/+wiy7c9NeDAigLgzWofkxN92qjmdrqjh/1h4YaD
	98BpJjnR7hbYUraJ+ZrfV9LQzeyN5strOV5c8wLvaIW+GixAbPv0mt1NwZVhaKBNy9Dhqh/2V51
	DWxMZx+HsDsdZGtmrrZTGezjkfjzE4QLpI9FpSJKlyOBzlLwOf61EZhOrT5qNgc7oOrQLCx7Kgt
	HZi7BhQWO4KAuW8Y3WBdlV7wAJn0d9LwDeqiwLvuCSfOlBVJPS8a/uLd6uDpzP6KQHslfpHBl+K
	EeMOXRhm11Yi1g730+7sT/cJvyxZ/NWmDGbdjU5b7wmzEStsqEbsZDVibqMwKentMJOW639d95O
	Bus90EiEtp8GXjyQwh80cXjFImUA4pdoiqXOMDntNaJ/AY3A4gGNOPyRZYoCfxt1ZyNE7lD8Uok
	B39ypnJDahrc1Mz7TCkHwvdMhVFL7A==
X-Received: by 2002:a05:7022:1507:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1ac5d4b1972mr19012157c88.27.1793687209440;
        Mon, 02 Nov 2026 22:26:49 -0800 (PST)
Received: from Mac ([157.131.129.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm42309805c88.22.2026.11.02.22.26.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 22:26:49 -0800 (PST)
From: Sujit Konapur <hello@sujit.dev>
To: yun.zhou@windriver.com
Cc: mchehab@kernel.org,
	kees@kernel.org,
	linma@zju.edu.cn,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sujit Konapur <hello@sujit.dev>
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in dvb_frontend_open()
Date: Mon,  2 Nov 2026 22:26:06 -0800
Message-ID: <20261103062606.30322-1-hello@sujit.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610083055.3976083-1-yun.zhou@windriver.com>
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
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

On Wed, Jun 10, 2026 at 04:30:55PM +0800, Yun Zhou wrote:
> dvb_frontend_open() calls dvb_generic_release() in its error path after
> dvb_generic_open() succeeds. dvb_generic_release() drops the device
> reference via dvb_device_put(), and then dvb_device_open() drops it again
> in its error handling, causing a use-after-free and refcount underflow.
[...]
> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
> 	mutex_unlock(&fe->dvb->mdev_lock);
> err2:
> #endif
> +	dvb_device_get(dvbdev);
> 	dvb_generic_release(inode, file);
> err1:
> 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)

I wrote a standalone C reproducer for this syzbot report (below) and
used it to test v3.

Each failed open past dvb_generic_open() is net -1 on the dvb_device
refcount (get in dvb_device_open(), put in dvb_generic_release(), put
again in dvb_device_open()'s error path). The free only happens inside
open() if another holder closes while the opener sleeps in
kthread_create(). The reproducer forces that deterministically: it holds
an O_RDONLY fd, does three O_RDWR opens from a higher-priority SCHED_FIFO
child that gets SIGKILLed while blocked on kthreadd (so
dvb_frontend_start() fails with -EINTR), and closes the holder fd just
before the last kill. Everything is pinned to CPU 0.

Tested on 3d6d817622b0 (the syzbot commit), syzbot's .config, gcc 14.2,
QEMU with vidtv as the frontend:

without the patch: KASAN slab-use-after-free Read in
dvb_frontend_open+0x1344/0x16d0, freed by dvb_generic_release(),
on both -smp 1 and -smp 2 (same as the syzbot report)
with the patch: the same three "dvb_frontend_start: failed to start
kthread (-4)" failures occur, but no KASAN report and no refcount
warning (panic_on_warn=1); 4 runs on -smp 1, 1 run on -smp 2

Tested-by: Sujit Konapur <hello@sujit.dev>

Reproducer:

// Reproducer: KASAN slab-use-after-free Read in dvb_frontend_open
// syzbot: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
//
// When dvb_frontend_open() fails after dvb_generic_open() succeeded (here
// dvb_frontend_start() -> kthread_run() returns -EINTR because the opener got
// SIGKILL), its error path calls dvb_generic_release(), which drops a
// dvb_device reference, and dvb_device_open() then drops the reference it took
// for the open again. Every such failed open is net -1 on the refcount.
//
// Refcount walk (dvb_device of /dev/dvb/adapter0/frontend0, vidtv):
// 2 after registration (kref_init + dvb_minors[])
// 3 holder A opens O_RDONLY and keeps the fd (O_RDONLY does not start the
// frontend thread)
// 2 failed O_RDWR open #1
// 1 failed O_RDWR open #2
// failed O_RDWR open #3: B takes a ref (2) and sleeps in kthread_create();
// A closes its fd (1) and SIGKILLs B; B's dvb_generic_release() drops the
// last ref and frees the dvb_device, then dvb_frontend_open() reads
// dvbdev->users at err1 -> UAF.
//
// Deterministic: A is SCHED_FIFO 5, B is SCHED_FIFO 10, and A, B and kthreadd
// are pinned to CPU 0, so A runs only while B waits for kthreadd to create the
// frontend thread. Needs root (RT scheduling, kthreadd affinity) and a DVB
// frontend (CONFIG_DVB_VIDTV=y is enough). Build: cc -static -O1 repro.c
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/syscall.h>
#include <unistd.h>

static const char *path = "/dev/dvb/adapter0/frontend0";

static void set_fifo(pid_t pid, int prio)
{
	struct sched_param sp = { .sched_priority = prio };
	if (syscall(SYS_sched_setscheduler, pid, SCHED_FIFO, &sp))
		perror("sched_setscheduler");
}

// One O_RDWR open by a higher-priority child, killed as soon as it blocks.
// If close_holder, the holder fd is closed in that window first.
static void failed_open(int holder, int close_holder)
{
	pid_t pid = fork();
	if (pid == 0) {
		// Drop the inherited copy so the parent's close() is the final
		// fput of the holder file.
		close(holder);
		int fd = open(path, O_RDWR);
		// Only reached if we were not killed in time.
		fprintf(stderr, "child: open returned %d (%s)\n", fd,
			fd < 0 ? strerror(errno) : "ok");
		_exit(0);
	}
	// Child preempts us here and runs until it sleeps inside open().
	set_fifo(pid, 10);
	if (close_holder)
		close(holder);
	kill(pid, SIGKILL);
	waitpid(pid, NULL, 0);
}

int main(int argc, char **argv)
{
	if (argc > 1)
		path = argv[1];
	// Keep everything on one CPU so the priority ordering below holds even
	// if the VM has more than one.
	cpu_set_t cpus;
	CPU_ZERO(&cpus);
	CPU_SET(0, &cpus);
	syscall(SYS_sched_setaffinity, 0, sizeof(cpus), &cpus);
	// kthreadd too, so it can't create the frontend thread on another CPU
	// before we get to send the SIGKILL.
	syscall(SYS_sched_setaffinity, 2, sizeof(cpus), &cpus);
	set_fifo(0, 5);

	int holder = open(path, O_RDONLY);
	if (holder < 0) {
		perror("open holder");
		return 1;
	}
	failed_open(holder, 0);
	failed_open(holder, 0);
	failed_open(holder, 1);

	// Nothing should get here on a vulnerable kernel with oops=panic.
	sleep(2);
	printf("no crash\n");
	return 0;
}
