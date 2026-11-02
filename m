Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655319;
	b=uSQXEXX2kIROtZpX+NpCGUaS4RX271olHByWrR/kWl0AUDersmV5Dw5/Ur8U149nLLKb
	 FAZ7nnk/tOO7LdvFkpdMpSQ9Umi9asOEO+e5VZwWJPIA4rG2zmJEDmjyJ/liT1w1P8Vxa
	 RIG215SKkE8008HtPj6Z/EDB+21g2PQGQxdV/HJC64UpzgAdU9QN42x7au4HGXfXjVeYW
	 kzINavG9uTkd13JzH4UVg3/PvFAJuHPX5UznZdTE0KBXz1J28NxUe4YHCU75vObUU2G3v
	 JKyykq9Yv11X30QGZyqQ7Qt83MlEMoPttDTXb1Vd2YHnoqSQghzY/VKe0hsgacIH5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rHrg5+anmjIQaSALAgMuEp0GjQCiZytjpkAAaiaAZmE=;
	b=f+kBvmk/Zqj/94UlRZe7t3obZHR9uJM1C4oV7Y1vKSUoGqwJ5er74+qIZ855Vyqax+V0
	 8AMjT16bR7gASguEmBvobmNu784ijgKNTg2b9CcNNkXdRatMVo3H0lyxTj4ZMNb1pujVq
	 54GROOe4rIaae7Sz8wVBaEfe89O9FaYGxtme0LuEV7mpgzWJUF47JKpdqpiBqhesUpIbW
	 iWNlHzagc+7QeBi0PZlqr73JBQOhF21b9LPlijAS6+tGtnAKT5R104oToKlKxnGQ1CYLs
	 XbnecAND9KO17YZ/hBOyEv5Lb4TQzX5Qh56d2CIwJFYF08wOgbiHKDkJk4hZ0+zxhRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=le49I1pv;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954A606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0954A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=le49I1pv
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3N2gMlz1XLktr;
	Mon,  2 Nov 2026 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793655308; x=1796247309; bh=rHrg5+anmjIQaSALAgMuEp0GjQCiZytjpkA
	AaiaAZmE=; b=le49I1pvJZ9f/M2rUkTzki/Gk3MrgUD9t4fKQob9r6nFg5q7c5Z
	3fBR+5GdjcEaK3nl4ekqlZJnv7P/Vzlc+FE/c/qLYzu+Oyd8bfseBxig6ObawLoe
	B8gj50igmF13x4yiLMaWhzxiFZyVoh4VtU2wMHP8LgbHlb4siyt12nFDEjl6M/nU
	63450N+vz0U1LkFtXATSmLE8agJ9T33ZcnzkWkFJBf1IvKcq91jX8YmtsTCg5ULd
	TVm1DeHY+RbcuonlOLOyeIPRYCFugEosIzq72LKeiY9u+12iDI3ZkatvAlAJoRaX
	mlEqsMtmWE4JVzyTJFZpIDAzXLD5/0ysfGw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AykSOwPuxe9a; Mon,  2 Nov 2026 21:35:08 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3H5Mmgz1XLkt9;
	Mon,  2 Nov 2026 21:35:07 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock ownership
Date: Mon,  2 Nov 2026 13:34:30 -0800
Message-ID: <cover.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter and Marco,

Since commit 7c451541743c ("lockdep: Annotate lockdep assertions for
context analysis"), lockdep_assert_held*() and lockdep_assert_in_rcu_*()
not only verify at runtime that a lock is held but also instruct Clang
context analysis to assume that the lock is held. This has the following
disadvantages:
- These assertions silence context analysis warnings in functions that
  lack a __must_hold*() annotation. Hence, the compiler neither reports
  the missing function annotation nor checks at compile time whether
  callers hold the lock.
- lockdep_assert_held() makes context analysis assume exclusive lock
  ownership, even if a reader-writer lock is held in shared mode.
- lockdep_assert_held*() can only be used with lock types that are
  defined with context_lock_struct().

This patch series removes the context assumptions from the lockdep and
RCU assertion macros and introduces separate macros for code that needs
to inform context analysis that a lock is held:
- lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held().
- lockdep_assume_in_rcu_read_lock(), lockdep_assume_in_rcu_read_lock_bh()=
,
  lockdep_assume_in_rcu_read_lock_sched() and
  lockdep_assume_in_rcu_reader().
Unlike the __assume_*() macros, which only inform context analysis, the
new lockdep_assume_*() macros also verify the assumption at runtime.

This patch series is organized as follows:
- Patches 1-4 fix issues in the existing context analysis support:
  __bitlock() operator precedence, false positives for __free() helpers,
  enabling WARN_CONTEXT_ANALYSIS_ALL for allmodconfig and allyesconfig
  builds, and a too strict SRCU reader requirement in
  srcu_dereference_check().
- Patches 5-7 add __must_hold*() annotations to functions that currently
  rely on lockdep_assert_held() for context analysis.
- Patch 8 introduces lockdep_assume_ctx_held() and
  lockdep_assume_shared_ctx_held().
- Patches 9-11 convert code that accesses locks through pointer aliases
  or that uses __assume_ctx_lock() to lockdep_assume_ctx_held().
- Patch 12 removes the context assumptions from lockdep_assert_held*().
- Patches 13-14 do the same for the RCU assertions and introduce the
  lockdep_assume_in_rcu_*() macros.

Please consider this patch series for the next merge window.

Thanks,

Bart.

Bart Van Assche (14):
  bit_spinlock: Fix the __bitlock() definition
  cleanup: Disable context analysis for __free() helpers
  tracing: Disable branch profiling for COMPILE_TEST builds
  srcu: Remove check from srcu_dereference_check()
  futex: Annotate __attach_to_pi_owner() and fixup_pi_*owner()
  locking/rwsem: Annotate rwsem internal functions with __must_hold()
  nvme-fabrics: Annotate nvmf_lookup_transport() with
    __must_hold_shared()
  lockdep: Introduce lockdep_assume_ctx_held()
  kfence: Use lockdep_assume_ctx_held() in kfence_report_error()
  Bluetooth: Add lock context annotations for connection aliases
  futex: Verify exit_mutex ownership in futex_exit_recursive()
  lockdep: Stop lockdep_assert_held*() from assuming lock ownership
  compiler-context-analysis: Split the RCU assertion tests
  rcu: Introduce lockdep_assume_in_rcu_*()

 Documentation/dev-tools/context-analysis.rst | 20 +++--
 drivers/nvme/host/fabrics.c                  |  1 +
 include/linux/bit_spinlock.h                 |  2 +-
 include/linux/cleanup.h                      |  6 +-
 include/linux/lockdep.h                      | 77 ++++++++++++++++--
 include/linux/rcupdate.h                     | 82 +++++++++++++++++---
 include/linux/srcu.h                         | 20 +++--
 kernel/futex/core.c                          |  2 +-
 kernel/futex/futex.h                         |  3 +-
 kernel/futex/pi.c                            |  3 +
 kernel/locking/rtmutex.c                     |  7 +-
 kernel/locking/rwsem.c                       |  3 +
 kernel/trace/Kconfig                         |  3 +-
 lib/test_context-analysis.c                  | 38 +++++++--
 mm/kfence/report.c                           |  2 +-
 net/bluetooth/6lowpan.c                      |  2 +-
 net/bluetooth/iso.c                          |  8 +-
 net/bluetooth/l2cap_core.c                   | 48 ++++++------
 net/bluetooth/mgmt.c                         |  2 +-
 net/bluetooth/smp.c                          |  2 +-
 20 files changed, 256 insertions(+), 75 deletions(-)

