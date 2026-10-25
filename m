Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933507;
	b=DpH5U8x1x0vMxs+1qVRlueNOMJ/6Wf1u3cYvDPngzPABOSxi01XQdX0301fOaKQ6Si1N
	 JXMuijMIAWkla8bTwlAL18ngC0Kz3kDqtJyy7m2sgQfdf61Xzgp79DG18xpKloNmfWB80
	 xbuY9dZ2Fb8RHT+zjOBOzZz02O3QMWmPKccZ0tqUtgN5JoZSUevmBSfS41PA32g6tUCS9
	 3rU19NrkZmsQUvzP2mDVRyHag0pBfcNqtX+UiZsuJDVyBXWd8EcCt+Y06LeeN1sf67lOt
	 KiAaZ7uTiGd5S9IFixc8JpBkfpsP5k5txia6d8UHR+pO5LcCE7J3UF8YecucATtQENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933507;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1GZcgRgP2aLMwV+8XWREHe7sK17bfr1A6G7UuwSeNxg=;
	b=lil7LIdAkE06VmUXVQ/ye0arF9p1UG90erwF8UL/fJh+vm9osUslS4Kq1tJC0EhE3Ons
	 4XBJx4bF4pOvLaZgVCyXcyD8zqLoajo40yEPRSvjfgpqroa/i6+l4Jv0LcoypBd3rZgOW
	 1TC0LZ4JdswSwA8DKV2hKFcF6d9KbC57tj3csztE8boKJZr1ObiELr8Lgawllm4KOutwR
	 4S/n+tGW2Ek2fsHwwvV3l0m2uy+d3CHfTBYZv0OnATZwJxn0Z1mJR8jC/n9HvBRgdz4yS
	 LC4zCldqVgTrlTMi1rH7vAXgIONhTA1wdzqYlDeg0NkAEG3+xx7dhg9nodqkjwXKHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HY+z12fY;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E59606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HY+z12fY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1G
	ZcgRgP2aLMwV+8XWREHe7sK17bfr1A6G7UuwSeNxg=; b=HY+z12fYZKjxFKeZD+
	74CBWf3rpR6vwGBghY1H5eyYpMTsysF6zluqD8G1YI2QKF4eST03GKCkZj3rK2IE
	YL1xIqEug7214/3Pz7UVhOap870j3Pi/dCbF7e5OsRzlyD8gPXAYTF9UaU7MPo8m
	uHAVAoNBCo9oLBdppIeAXPl+U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3fw0i_t1qxjmHCw--.18783S2;
	Sun, 25 Oct 2026 21:03:31 +0800 (CST)
From: albin_yang@163.com
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	chen.yu@linux.dev,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: Re: [PATCH v4] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sun, 25 Oct 2026 21:03:29 +0800
Message-ID: <20261025130329.3322194-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261024042753.2276779-1-albin_yang@163.com>
References: <20261024042753.2276779-1-albin_yang@163.com>
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
X-CM-TRANSID:_____wD3fw0i_t1qxjmHCw--.18783S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF18Xw1xWFWrGrWUKF4kWFg_yoW5Jr4kpa
	93Gr13K3WkKrW5X3ZrJr4xWw45uws8XayDZr18tryrZ3s8AryIyrn2vr1ruFZ5CrWS9Fs0
	qF18WasrCF1DAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUoBT8UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC8ATafWrd-iRWbwAA3H

Hi Peter,

Following up on the proxy exec discussion from the v3 thread
(https://lore.kernel.org/all/20260922082432.2987855-1-albin_yang@163.com/):
I have now reproduced the proxy case.

A userspace mutex is futex based and never sets blocked_on, so I used a small
test module exposing a kernel mutex, with the owner pinned to a known CPU.
While the donor is blocked, the module reports:

  donor: blocked-in-module
    pid=10364 cpu_before=0 cpu_now=1 on_rq=1 state=2
    is_blocked=1 blocked_on=1

i.e. the donor stayed on the runqueue (on_rq=1) as a real proxy donor
(is_blocked=1, blocked_on=1) and was moved to the owner's CPU while blocked
(cpu_before=0, cpu_now=1).

Measured on a 2 CPU VM, 5 iterations each, hold 200 ms (run_delay is field 2
of /proc/<tid>/schedstat):

  config                           block      run_delay delta   migrated
  ------------------------------   -------    ---------------   --------
  cross-cpu, unfixed               169.9 ms   167.1 ms          5/5
  cross-cpu, v4 (!sched_delayed)   169.9 ms   167.1 ms          5/5
  cross-cpu, + !task_is_blocked()  169.8 ms     0.01 ms         5/5
  same-cpu (control)               167.3 ms     0.00 ms         0/5

So the same ~170 ms wait is charged ~167 ms or ~0 depending only on where the
owner happens to run, and v4 alone does not change it -- the two are
independent bugs.

The gate does not disable normal accounting either: with the donor runnable
and contending for the CPU, run_delay still grows by ~39 ms over an 80 ms
window (5/5 iterations, in both the cross-cpu and the same-cpu runs). So it
suppresses only the fake enqueue, not real waits.

On your original question: t->is_blocked still cannot be the gate. In
ttwu_runnable() the real wakeup enqueue sits inside the if (p->is_blocked)
branch, while is_blocked is cleared afterwards in ttwu_do_wakeup(), so
!is_blocked would suppress the very re-arm this patch relies on.

task_is_blocked() does work, but only as an additional condition: with
!sched_delayed && !task_is_blocked() the proxy case drops from 167.1 ms to
0.01 ms, while the delayed dequeue fix is unaffected, since a delayed sleeper
has no blocked_on.

Given the proxy migration only landed in v7.1 while the delayed dequeue bug
exists from v6.12, coupling them would either fail to build
(v6.12.y..v6.16.y, no proxy exec at all) or add a dependency on code that
cannot trigger (v6.17.y..v7.0.y, proxy exec present but no blocked-waiter
migration), so I'll send the proxy one as a separate patch on top of v4.

Thanks,
Wei Yang

