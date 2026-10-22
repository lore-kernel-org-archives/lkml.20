Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646236;
	b=vKhwuITCKTUfuGtd5z/uj8/07GAzRDfCWbX51F/wOjF68v3Wr8GY8lrgNQlQ7u/Lfhpl
	 wSLeYpSkqh2Zg10BGVNC7v7Oz7bwQtok29/TEOqMYCNZZ/wtgvu3wPWIplCtEaNMsoDqJ
	 FKixNUxovI14+vRX34yE6QgNRbFAYMXgdiT/3SMsuDf8/K8WCkL0xoJ4v5LKsYXLRtY8Z
	 oaX292JNL4KV7/l8Kdz3ZamiWHKq+BZtOcZbvux5PdfHZRrxJxGQsa7sb7DX4hvxnFJeE
	 kjwAeOoBcNLpMUILAzCSP5tVFyr5jRPF9mNck4LMJihz026rsbdbkVN6HpXkTrURToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
	b=rBv5E7vkuV4tn5mkSl7Pr9pce5jtSgDRsBxjfMECn68NwxkDWLPRVoySG2vdSvgjH1SV
	 qXwe52P9YDhhli6ssFc4C8DlOf3SofXJqww63Fv4rYZx49NcnZ2bjf35h5F+toDZX9fQp
	 6oKcWeEll1Hx+h/rOYORerue0z6xEpnKyUIm5yjvJcUlc9Ho+t8sV/rzSP5EGAkS75QN7
	 RXmhC7yWYJFnynJdugu9ROwf6Ma664jDdb5jc9Mv2OJcC0OhmyGRGgFwcmOWStDuaCKlV
	 ApQdlwf8B9Vpl9QdTDQxfAloVTshbR9Ngki36DeLZ+u1B5ET+wW6RWqmDWHYBzaT6Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwoDzxWk;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB772606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB772606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwoDzxWk
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso15951805e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646234; x=1793251034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=PwoDzxWkA70Wmef14Vvpr9c4fHpU4ChmSg7Dc5eGutsiHbtTrYWNl05zc02Gtlv72r
         4Zq5Cp5q/leY/52RfvlkHWYrZVWtP80pZpjpJU07hEV0rT/E53N3KO4IWShg7/l5ZzfB
         poj2nHlLy8FnxKAmRNLKQsThjETb6zYQCRZnWh+D2hQsraNpceIfbDQoN1EdtuazyWtG
         Xz239Xqggu0HrKDQNYqGFznDgrbku+UIu/jVnKeOMCTNYn8ak5Bg9ETNi333RYgws0vD
         8vT7cU2/CuH54hAwzM/b+N0RwJToGTeuGLcM3zg4fHgXkQRw2e7ZuoNShYA6nVFSLNH8
         xmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646234; x=1793251034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=aDGdpOjPcvr85O64UGstrFwchO57rGu1rAtD4DSa57AZNdjH6gXq0peUF+TxSojX7U
         3u3aQ7Nk2vcqaPUho/g1kLTH7FVAHOLi/kMr65Q5rjlFRdCITQTKa3FfeowZkmYiB0vW
         SlsDApkXUJrtPaAcaaxtobuvnwcrKreJNcg3IforqmhQA0P4X3Q7URXZgYNkXhzU769i
         2js/EQvu1cwyAOCOJJyLMylNE+bbz/4SLH39hXAV9b7BTzsDon/l9CSNCVlV20u856jA
         K8Iwz3lyZtyfCLSoBY+lVtKeh7jPPmJWg4KjlsI9ZDUxOLFYEEaip2tAzkA5bIaZ943E
         1UXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkqGuR8C2qhurwVBUxbmmBGJxfTYvK4V/flN+qQNAKsN4b01fkPGymrOblNKvcWEvlxm4S2cn5oqwJnek=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu0Df8ZrXa6ysygLo0YuIwMqNR+yPiv74Hr6LJsb8NIuCTzMki
	37oECB0xfGrLLKic2Yysk5H4Zx1U+Ag3I4h3I0gRXrmtTjGYktzroAn5
X-Gm-Gg: AYBFou1KriJJqBGt+MNO+NDG+hf1nD9AMKqEx7RzU653kZ+rscTL70/4vhtRZfWK/lq
	FZb5wRHkmXQKI2rGOtC7PKlB/J3PDXuMOW0jA9N/Ooo6xiQM6WvRbuIjXaQMQ2BPGqGnrpSH+3L
	lt05XDYL5mnle6WrG8+ZuAcHMpzR27hzzS2A2PzscHcnwqYug/8/+SdDOQJsKp48j3jmUgpEGn5
	Vm+dx8AVU88FNjsJLYRQsxbBUw+UqH+hSv/4rTnIUvGi/nTEeWnb8MN7Fmb9V+P7dCD3864hS92
	n2OO/xJzVtiOfCNXx6vjG5ZMNLlJTfoRcoJGrwKJkX+N83HYRi0DZsH3zsrNIRw6ItA+rU/acYN
	WzEEkDYZy3BO9+rEl/EDwzuTmpAfWTSzVbxvRXe7SW5pEXjljly6J6bzCnpby7QG6ULUlAh3lSw
	dtDxRnOssFeBRjlzLoX4frYtSdvUU/j8UjB4UPADou0BVzmDNZAjm6wxwYa2zcxYcoOkr4eKj/1
	1PoS+FOgbIWJ+JGsK7IavNZRdRxizGoAWlYAaYMgzm4Oq7jTPZPua8ZjwcrvogThaLhKO+m1QKV
	I2HRg1TuewGWRATxBeVPSrHeAh+CPOHuA5tshTNTtvq3NRhFFUrtqAL41fuHZP7dpUAzbwlxvcW
	mjr7ntEAxX4TqUuymAcIMlV+4njwkisuWGnqqKO6/S5nZXvhETRH+e6dmaIU=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id 5b1f17b1804b1-4a1fdd1e97emr87433205e9.31.1792646233938;
        Wed, 21 Oct 2026 22:17:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/12] entry, tracing: Classify early hardirq entry and return tails
Date: Thu, 22 Oct 2026 07:16:42 +0200
Message-Id: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Tracing's transition recursion slot exists because a callback can run after
architectural hardirq entry but before generic entry increments
preempt_count(). Steve asked whether the count could be updated soon enough
to remove that slot. This RFC establishes that entry contract on arm64 and
closes a separate recursion window exposed by the same tests.

This is a design RFC, not a merge-ready proposal. I am looking for
feedback on the entry contract before extending it to other architectures
or removing TRACE_CTX_TRANSITION.

Clang can outline raw preempt-count updates and
__kern_my_cpu_offset() from noinstr entry code. This series applies to a
tree with the following two patches added:

  - Hongyan Xia, "arm64: Always inline raw preempt count updates"
    https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
  - Will Deacon, "arm64: percpu: Annotate __kern_my_cpu_offset() as
    '__always_inline'"
    https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org

Those patches are external prerequisites and are not included in this
RFC.

Patches 1 through 11 split raw preempt-count updates from generic IRQ
bookkeeping. On arm64, ordinary interrupts add HARDIRQ_OFFSET after the
pseudo-NMI decision but before instrumentable generic entry work. The
remaining accounting still happens in irq_enter_rcu().

The exit side has a similar gap. Function-graph and MTE callbacks can run
after the real hardirq state has been removed, and kernel return may
schedule before them. The series records ordinary-hardirq provenance and
restores a synthetic hardirq classification after the preemption decision.
That tail changes only preempt-count and lockdep state. It does not repeat
interrupt accounting, RCU, or tick entry.

Patch 12 keeps tracing's recursion state inside one preemption-disabled
interval. It closes the transition collision reproduced at the IRQ-exit
reschedule boundary. TRACE_CTX_TRANSITION remains unchanged because
unconverted architecture entry intervals can still run before
preempt_count() reflects hardirq context. An x86-64 no-transition control
still recorded recursion at system-vector entry and exit and in the
deferred hrtimer return tail.

The base includes "entry: Account the deferred hrtimer rearm as hardirq
context for lockdep" and "softirq: Preserve interrupt context on return
from interrupt".

The main questions are:

  - Should generic entry expose separate raw-update and bookkeeping phases?
  - Are preempt count and lockdep state sufficient for the return tail?
  - Is arm64 a suitable first user of this contract?
  - Should the recursion-lifetime fix travel with the entry conversion?

Karl Mehltretter (12):
  sched: Split preempt-count bookkeeping from raw updates
  lockdep: Use raw access for pinned hardirq state
  entry: Add the pre-counted ordinary-hardirq entry/exit contract
  entry: Skip inactive IRQ-return reschedule calls
  context_tracking: Split IRQ-exit preparation from the EQS transition
  lockdep: Prepare IRQ-on state from a hardirq return tail
  entry: Carry ordinary-hardirq provenance through kernel return
  entry: Classify ordinary hardirq return-tail work as hardirq context
  arm64: Use the pre-counted hardirq lifecycle
  docs: entry: Describe the pre-counted hardirq lifecycle
  locking/selftest: Exercise hardirq return-tail preparation
  tracing: Pin recursion state for its complete lifetime

 Documentation/core-api/entry.rst     |  75 ++++++++++--
 arch/arm64/include/asm/preempt.h     |   2 +-
 arch/arm64/kernel/entry-common.c     |  25 ++--
 include/linux/context_tracking_irq.h |  32 +++++-
 include/linux/hardirq.h              |  29 +++++
 include/linux/interrupt.h            |   2 +-
 include/linux/irq-entry-common.h     |  96 ++++++++++++++--
 include/linux/irqflags.h             |  14 ++-
 include/linux/preempt.h              |   9 ++
 include/linux/trace_recursion.h      |  14 ++-
 kernel/context_tracking.c            |  78 ++++++++++---
 kernel/entry/common.c                |  38 +++++-
 kernel/locking/lockdep.c             |  48 +++++---
 kernel/sched/core.c                  |  68 +++++++++--
 kernel/softirq.c                     | 166 +++++++++++++++++++++++----
 lib/locking-selftest.c               |  53 +++++++++
 16 files changed, 648 insertions(+), 101 deletions(-)


base-commit: 779ab5d73a22c798d1273b4aaf50cf5b8d750be9
prerequisite-patch-id: 9c009809614854fbff979d65aad6732757d006d5
prerequisite-patch-id: 764fd197db36a3889548bbc41890dd5b3d902f99
-- 
2.39.5 (Apple Git-154)

