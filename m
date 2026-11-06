Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981205;
	b=QOJc/fyyxOYgV/Et8nX2yYMqmKRrOIYlZ1Aj7DOVFtX2PUGlYMmPZrQ/JSuJBQ9AhJD8
	 Ii8MBm5L2WL1VcoYK8UN28e94XL9gSmjn3Fx87zEwtptH+qPma4gI2W19KtvLPfwVhCpT
	 +yl3+3LuOlyPciSk7dyPIk24v5A3Ze9epuXRVVwA04RtEIoP7uFN+o8H0foD3b/V409eY
	 G7TGxRJptE0XIcp3L+elb1D4LReAH5pDzXjCx48K2knhLsq/wYMiPQ2jA2M+DAc7DJ4Ez
	 5kP/lJHnGMUwUb6SCwqSVaEQT1YU2JLsiTYaDpggdbIMnumGVBfTLURHL5qDej40ERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CRtNO+DH3xEtRtKKOOPIGCrYJVKz0S6wYGTPWoi3HNo=;
	b=eBqdYbv7iSulxHzO5MN+DQcnXTTeyeFo2qHrdjNS65+QfbR8N9i8PvRNY7BbD7rQMRYd
	 1T0i8E4UyM/GjkCAXL6SOlL8cf5pldJ6gxtOll+EBpJiVpiBcmtYtcYbsDTK3aVJcvU/1
	 7JtdfRHlNyLfDgG/ubrUAi//IWGszHYjHzqLf52zoqeG0PB7SAhwyJIVqbZkTJoNisj7i
	 QPfH9r+m4KfJq92qh1uYzFPbiLubytmbGE5SsCmMQY51b0tCOT4pLplw4iZ3RZAe9sc3t
	 h5Ag6QNDU3ZB7KSwMSaOxjknD79PTgwiEc9LiukOD0a+ZCKt96EpCn37GUNOovsNucA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ubdi89Lu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAE606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ubdi89Lu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7482645e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793981203; x=1794586003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRtNO+DH3xEtRtKKOOPIGCrYJVKz0S6wYGTPWoi3HNo=;
        b=Ubdi89LukvKIZKhqljZab4XBkKfNCpYZOg4oT6w4PpFQq4bTxMLWFxlWKrInS0moy/
         y4AbxT1liag1kLum2vmimJST1/rqJZyegOBYRWd1kYQP+hq3VoTMMY4kuIeD9QLYqyXf
         bZFbK5s5FuP9MIkfDGRC13W6SBVFGxc8+4JXGKVozNLZiLrs5pM1xGpNG6Cct0IAmEC6
         1XwFB6Fah1CYrNEceCrsT2iI9DHID1pmNJ2ia2uUMYbBfQoaU/ywvGA7e2BmGv03Z5vw
         +Lm13APOtMUyaAnsZTLgY6vCmkOUB4/7/+FdmE/UUquNHJno9mYo7goYJPDUBYqrBKE6
         XrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981203; x=1794586003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRtNO+DH3xEtRtKKOOPIGCrYJVKz0S6wYGTPWoi3HNo=;
        b=duGCqFvcZ2iVO/6KLz2G06t5B5NvUOCQHNreGJA/XkSJhEintc32x5nQZRQGnlmvf/
         Jzl3E4JzqjoG69GZeMwr5u6bZQegMAY0ZX4w0qGppkT2LvE9nsuQpYtMFJDMDpOpQ3oR
         r95YFFSog0FAjFQXjVMEGWS6ymoj8QgY3OnovDSASkILCtkxv0CbGH1oAHKxVtkg3h+x
         RkQLuuem2t1cYNaeIcG34mROx4SKt8SiF1jrlS8CzaFb+32ieQ307MJ+8iB9H8LZvuMV
         B253TFxD/UTG8qKz9NqLbITMlqRS/6nxVeGVAfTzMTWYyy08ReF/NOmx9knmvr5c6Ep3
         vUIA==
X-Gm-Message-State: APuU4Z+X89A5/hCxKvTRkAcqIJTwT8EUB/eMfFEcp+RFqR54tWCLdpK7
	IPwuz5I1zQB7GT3QL4x/5K0s1M3fqOCA0ywf2HcvdhtFFraYy1GWqckdMJoAj3zYaHPhMq2G5Gv
	kuN7mW/0=
X-Gm-Gg: AYBFou1SB/L8YV1xfm/EKmQ+HvfMJ94h66dvRK2Ui5Mpa+0e9xpxMQQfuqK42Oo9pM8
	Zb6O1QxK0F5pzGhm7oCk3IrusF0s1wkuKpqr8OUY1POwYWNGLsBXD8uOVqvJ5VozibuPrmefqrx
	crBxu9OsWHnvZHfcKEOs+Gby259Gl+7x/nTlH1zup7yZbd9QJNCqllkRBBEdHuUCMeQwTH+a5r6
	4Do5KrfMp7upViFjj6cXcw1q7WWZ7gr7/BhV6A+W0Vr/muEi7mMUsS6BeVyOkmYxSdxjIiq3Uhu
	7h7shf/91uB2halL40NmyZW/cMIQicfVzwog0XSi+a77MuKeyahLO5uv5q9/T6H92ElKDF5Me4u
	oAW3Z9W5e1QE6UjkFERsaPlYsyNVcVI31RNqUY2euFqe7NAqHBhuLweuRx1PwUWkLSyhHuSM6ib
	jUAl4GdDzCPxTXBd6r1oasFQsfaWnVC94Bv7z9zRmphGIgNVKBtqhTIvb9XQOEi3PMZ02BIRZNO
	PvYe3IP1P3rPcBjL4SFS1lBOC9ONq1e7IsuIA4fMTV8tG6A63Cie9ZdeaoAXhoqy7y8yE9bowED
	c/juRwbI0wlSpg3/MCPAAsP87bi1JHnnwlAKC/auL/jUHF8+QlWp
X-Received: by 2002:a05:600c:45d4:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4b6df5ea34amr51225145e9.18.1793981202637;
        Fri, 06 Nov 2026 08:06:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm172665795e9.15.2026.11.06.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:40 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/3] Stop the idle tick on polling idle on nohz_full CPUs
Date: Fri,  6 Nov 2026 17:06:12 +0100
Message-ID: <20261106160621.347228-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
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

On nohz_full CPUs booted with idle=poll, the tick interrupts the task once
after every wakeup from idle. do_idle() restarts the tick before polling,
and on wakeup tick_nohz_idle_exit() only re-evaluates the tick if it is
stopped, so it keeps running and fires in userspace before
tick_nohz_irq_exit() stops it. Without idle=poll this doesn't happen:
since commit a5183862e76f ("tick/nohz: Conditionally restart tick on idle
exit") a nohz_full CPU leaves idle with the tick still stopped.

Marcelo Tosatti proposed stopping the tick on polling idle entry:
  https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/

Following Frederic's review, this series does it only on nohz_full CPUs,
and handles on the target CPU the cases where stopping the tick in polling
idle would leave a timer unprogrammed.

[ P1 ] tick/nohz: Re-evaluate the tick in polling idle and on user entry

  On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
  In idle, IRQ exit only does accounting and relies on the idle loop
  running again, which cpu_idle_poll() doesn't do: it only returns on
  TIF_NEED_RESCHED. P1 closes three gaps:

  - A nohz_full kick handled in idle, e.g. after a timer is enqueued from
    an interrupt on the polling CPU: nohz_full_kick_func() sets
    TIF_NEED_RESCHED so that the polling loop exits and
    tick_nohz_idle_exit() re-evaluates the tick.

  - The expiry of a stopped tick in idle: a stopped tick is programmed for
    the next timer only, and reprogramming it for the following one is
    left to the idle loop. tick_nohz_handler() sets TIF_NEED_RESCHED so
    that timers already queued are programmed in turn.

  - The return to userspace: if the tick was left running in the kernel,
    e.g. because a tick dependency was cleared (which doesn't kick the
    CPU), stop it from context tracking instead of letting it fire once
    in userspace.

  The first two only matter once P2 stops the tick in polling idle, so P1
  must come first.

[ P2 ] sched/idle: Stop the tick on polling idle on nohz_full CPUs

  With idle=poll, nohz_full CPUs stop the tick on idle entry instead of
  restarting it. Housekeeping CPUs keep restarting it, and the
  tick_check_broadcast_expired() polling case is unchanged.

[ P3 ] Documentation: no_hz: Add tick stop in polling idle

  Document the above in the idle=poll item of "Known Issues".

With big effort on the Claude side, I made a test suite to help testing
the work:

  https://github.com/DispatchCode/nohz-full-polling-idle-tick-test-suite

The following is a short summary of the results.

On x86_64 guest, HZ=1000, nohz_full=2-3 idle=poll), a task alternating
100us sleeps with 10ms of userspace work, 200 times:
  - ticks in userspace:              200/200 -> 0/200
  - ticks while polling:             35 -> 0
  - housekeeping CPUs:               unchanged (tick runs while polling)
  - P2 without the kick change:      15 of 20 timers enqueued from an
                                     interrupt on the polling CPU lost
  - P2 without the stopped tick fix: the second of two queued timers up
                                     to 1.9s late
Tick dependencies (POSIX CPU timers, two tasks on the CPU) and CPU hotplug
were also checked.

Thanks,

Marco Crivellari (3):
  tick/nohz: Re-evaluate the tick on polling idle and on user entry
  sched/idle: Stop the tick on polling idle on nohz_full CPUs
  Documentation: no_hz: Add tick stop in polling idle

 Documentation/timers/no_hz.rst |  3 ++
 include/linux/tick.h           | 10 ++++++
 kernel/context_tracking.c      |  9 ++++++
 kernel/sched/idle.c            |  5 ++-
 kernel/time/tick-sched.c       | 59 +++++++++++++++++++++++++++++++++-
 5 files changed, 84 insertions(+), 2 deletions(-)

-- 
2.56.0

