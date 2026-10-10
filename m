Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646C3DB339
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615322; cv=none; b=PPpGESG/it6Hp7BSb+Z+AqCfUdiFhSQBAdhmMYysl6DFI2GRy6cE/C5iQi3MKDMeghXSHBCcPty4uMZeLjWfHiGeEq0cfBRDFA6eNDF6ZtFX6J4QYxzTV9YwEEIfNliTu69g2IKQ2zciYlaIxupyyTXdw10lTjvw5swcsa8D73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615322; c=relaxed/simple;
	bh=N/moG7D9OviUmWFrdyyxRnoldPlo6k5RA0k/Zye2yns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AiVYzCnRy4RHMEiQdWg8vV1g6dU2HQF7dow9J6iO9IrQ4CR0pCa+fmNxJhq/vY2WzJaaVCAnKk/F96Ai3x+qe8B9Y95JhC+9th2G7f4pND/7JYwpc1TOb76wU44yKUG2t+qnGcV12BRHG1FzQmZ8h4AWzClDjIRQ4ZOSEhaeBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMTQugoH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMTQugoH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so203008f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615319; x=1792220119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AVqi9fExl9fa9tq7hzL0SK6VcTdqG2rmyMeegGqrkE=;
        b=JMTQugoH42iFDFtzOiNQh593RYvAo6GLbJG+9u26QP38lto04uRrjNRiYt32Mea6G6
         fBLQEVKxtjZREPsXDNfopmJ2vzXO2K2gBwJOi6P2wdIJlQ/Y23XR4XnP9DM8xwncmzKT
         MsWEzw52R63hMgGPAYUVvr1Rl3h+SW/M1htzSxIHaNop0LMNItWuRiETucRS9Rz2eUdz
         dne0FqTO8tSnTV9vLk1hnJdug3qTvUlwm+BGGZ6GDK4I29ZIpOVYPM9vPhirKGXr/5kD
         /xSLNyQtguRzSdYxuYaPJhDxzm7nZL/bLfreB4l/11+p+pNpqV/Os0+lVgCWCgmkzxIC
         54LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615319; x=1792220119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AVqi9fExl9fa9tq7hzL0SK6VcTdqG2rmyMeegGqrkE=;
        b=KuF9zNtF1DmpJH6YqJJd0nh5GyrUbcQvbrB/FziVheBLOBE9UxaAGpeC2Pxo1or0o5
         hqpUyUozKFMEVd7N2Apdo/aHj66JQXvQa2IaO8A65r5wpiZYoGOPF7hND8p892A9/QyI
         yfFgLSUkAd55/V7y4bDYUkL4jQkd0SeKfsii7+0epq0+IHsrj7JdgAvH6k6Iu+VhrjRF
         LSb2btAmxXrivi22LuaXwL1VRqmL9qAPQidrYJuilUTXB4qo1YkhySpjh3ooi8tIkURf
         YfF5gwnsZ5dHsZawL2JEelYksdy9Q4KPOLE0JwPngjhnx+JGYE36JAivephBNrsO+9G6
         ePgg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/yu36K+ZWDAAazV/+9mBqtLtigTUlK+xY1tSRHYCxEIN0XjwdHdbRDkOzHSmooupv1uLzojYyYqJisk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdLLOh1D24m1W47FNbp0YhPHxQXXx4mYBe0ecuCMATrY5vknZc
	kAr5mAY7qtfEKgnLIWM4zYZel70C3htH3Rc1A2MyCK+dlzuQnHGun9W5/Y/eEel7
X-Gm-Gg: AYBFou0NNGWPAVHvUrh3sZm9fODirHL7VVKIOGn0s4qD17AjI6ob9y0fX1W7jwleGUQ
	vuJPbdtWFt83cvbje3A0hBB/O6uSapbIZptAzI9ev24CHbgTl9dNzbROrPHfbipadKg95xg0wOB
	wulfuLw+DwjzTEuMjTntnFreSz4ZJbJuZEiAZzK02tdJ2y5/84fEN4pTNvrQKkkBJ9pCvgXLL/L
	3TToYjs5mOjbmgXQLbzB3d4aqJq2vg+an4lfGU04bpr8IfuMh72y2qbvRYSg9eyfyQRgiCtwOLY
	I/UfmGhFOy+7kCEUI/jcsuzrmkL2wxOfWry29GP9qqZSPJp8A7Ie4LyZ2cbpRDaunnbuzQNMy6u
	AGfKb8u3vVH70OUz+rkAlrRozgNJ7I1vURWRr7Q25+WPwTmYBFM0LAstxSems5dUQJ2o39iEZFX
	rQGdG7V1UWyA7XJj90ME3hYEbg1KpOW1Dz1nA72ecJlIjQj1HFR+3uagL5/bL1TL2IPZglevJx1
	4K1i5rcy3qKK+LWLVpu0+07GqHJVMmDv+s/tz9j/kgaLzdS3JpXlLfjKUfjgcVN516c7O1p6S7J
	/no2oDem8wUuu55R1mCGiamx82jeW6SP2BzX2gcIeJSltCw4p/XnS19LySxFSI0GTE1sTGGRBFE
	=
X-Received: by 2002:a05:6000:40dd:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-48dbace8754mr8021343f8f.39.1791615319107;
        Fri, 09 Oct 2026 23:55:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db946323bsm8691754f8f.2.2026.10.09.23.55.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 23:55:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Daniel J Blueman <daniel@quora.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
Date: Sat, 10 Oct 2026 08:55:09 +0200
Message-Id: <20261010065509.72916-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the watchdog rewrite in v7.1, the TSC can be marked unstable
after a delayed watchdog run under QEMU TCG. Without injected stalls,
this happened on 5 of 12 boots on a loaded host and 0 of 6 on an idle
host.

The delayed run re-arms the timer with an expiry already in the past.
The watchdog then runs again almost immediately and rejects the TSC
based on a roughly 75 us measurement interval.

#regzbot introduced: 763aacf86f1b

v7.3-rc5, 4 vCPUs, after vCPU 0 was stopped for 0.8 s:

  clocksource: Marking clocksource tsc unstable due to frequency skew
  clocksource: Watchdog                    hpet interval:            74940ns
  clocksource: Clocksource                  tsc interval:            74251ns
  clocksource: Switched to clocksource hpet

The intervals are 75 us, not the 500 ms watchdog period. A function
trace of clocksource_watchdog() from the same boot:

  busybox-79 [000] ..s1. 15.168486: clocksource_watchdog <-call_timer_fn
  busybox-79 [000] .Ns.. 16.269726: clocksource_watchdog <-call_timer_fn
  busybox-79 [000] .Ns.. 16.269820: clocksource_watchdog <-call_timer_fn

The second call came 1.10 s after the first, the third 94 us after the
second. Re-arming with expires += WATCHDOG_INTERVAL leaves the next
expiry in the past when a run is more than one interval late.

For a 75 us interval, the 500 ppm allowance is only about 37 ns, plus
the readout time. The measured difference was 689 ns.

Before 763aacf86f1b an interval above WATCHDOG_INTERVAL_MAX_NS was
skipped with "Long readout interval, skipping watchdog check" and the
timer re-armed from jiffies, so there was no immediate second run, and
the skew was compared against a fixed margin of at least
2 * WATCHDOG_MAX_SKEW. The rewrite dropped both.

Reproducer: a v7.3-rc5 guest with allnoconfig plus the fragment below,
4 vCPUs, qemu-system-x86_64 -accel tcg, the HPET as watchdog.
PTRACE_ATTACH on the "CPU 0/TCG" thread for 0.8 s, detach, six times
12 s apart. The TSC was marked unstable on the first stall in 2 of 2
runs. Stopping the whole QEMU process did not reproduce it. The guest
clocks stopped with it.

The same stall against other kernels, same config:

                                        TSC marked unstable
  v7.3-rc5                                   2 of 2 runs
  v7.3-rc5 + the check below                 0 of 2
  763aacf86f1b (the rewrite)                 3 of 4
  763aacf86f1b^                              0 of 2
  v7.0                                       0 of 2

763aacf86f1b^ and v7.0 print the "Long readout interval" line for the
same stalls and keep the TSC. 763aacf86f1b marked it unstable on a
170 us window, hpet 169720 ns against tsc 168974 ns.

The added check in watchdog_check_freq() skips the frequency check and
resets the watchdog when the measured interval is shorter than a quarter
of the period:

	if (max_delta < WATCHDOG_INTERVAL * TICK_NSEC / 4)
		goto reset;

Re-arming from jiffies instead of from the previous expiry would avoid
the second run altogether.

An LLM agent helped me with the test setup and the trace analysis. I ran
the tests and checked the results.

The relevant part of the config fragment on top of allnoconfig:
  CONFIG_64BIT=y
  CONFIG_EXPERT=y
  CONFIG_SMP=y
  CONFIG_NR_CPUS=4
  CONFIG_PREEMPT=y
  CONFIG_HIGH_RES_TIMERS=y
  CONFIG_NO_HZ_FULL=y
  CONFIG_HZ_250=y
  CONFIG_ACPI=y
  CONFIG_PCI=y
  CONFIG_VIRTIO_PCI=y
  CONFIG_VIRTIO_CONSOLE=y
  CONFIG_BLK_DEV_INITRD=y
  CONFIG_SERIAL_8250=y
  CONFIG_SERIAL_8250_CONSOLE=y
  CONFIG_FTRACE=y
  CONFIG_FUNCTION_TRACER=y
  CONFIG_IRQ_TIME_ACCOUNTING=y
  CONFIG_PROVE_LOCKING=y
  CONFIG_DEBUG_PREEMPT=y

Thanks,
Karl
