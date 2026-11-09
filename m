Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251632;
	b=WJPi5vmQzk1xJrJQv5qplTdme6mxl/aG9RUYf4TgAX4mP20X0Xb4tsTuFAn3N7oyGent
	 HbRl0H8SosxjjdGfjNwzdMES3qEjL3pZ7WPX5dBzICru6o2XlXSvDU1WMLZRQlM5TP4d9
	 GvA8HW4PXWOLpIzbLJTb4ciaj8ADYP6rH7DK3hvQgO0BVLUI9zZhnTROjVjUrUo+uD28b
	 cac878SnfEhDxWjubPMNK+Q050eunrInz0vNi2lyM6DNPQXwCOmS8fE4vWcofD1M6Pe3W
	 LyDKrERca4H2uma0hfG9CpO6abQSxdXvmRdZ50bJdU6clMtNdcc5AR9FKOR8azPWKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cdkni7bBOF7vlyawXIABp/ZX1WW/TwHgwgO32lIZhnA=;
	b=XvQtvWD42b3sIpCXXeYHPpEMXA9VtQdr+mh5BgJ+dUk7sToYGYs53UJOVbMBpSb9Mv9R
	 doKuVFFhJRn7whOIhTL5RFM/UgcSNIN6/6kKCUey/hs/M//8EhYEZPh8f8i4DkcirB/G4
	 GGPPAeTqLWIjGKD36Pqk7z/GC6QvIvtsjuO6bLFe5WPrbKaIaRQ1PXS55A4ls1G8eIBXS
	 Ms2L0T9susiTdoxQ9FzblSb2JwOF5aXpvoHsifeEbP+1fBkoXncSLldWfZUBg2nXMmtaT
	 h59s6hY8M5LFSLkpC6ksVr9MvsXJh2mvV2RflPfnD+MF/KZxMwaqaf7JCaTv1tB4L0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=h1OaLtr2;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE38606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=h1OaLtr2
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfb26Dz8z1XM30h;
	Mon,  9 Nov 2026 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1794251625; x=1796843626; bh=Cdkni7bBOF7vlyawXIABp/ZX1WW/TwHgwgO
	32lIZhnA=; b=h1OaLtr2yZT425K3vFLso7vZ0NtST55GLBeg35kjEpIbJwK2NV9
	Afp7L6aLkDEKuqVVGlP94+uQYvxlVuDAXKtWDBLpEJU4lWVIe/0l9bDPKRZnw3Vy
	vSdDmDdp2YP/Y3EiC7LX235wcMgFaCGv1g+gQ1OUA95TU0aNIU0Ze6iloiiMP0xa
	n9MNoEyUMCsbgN+RFTbJLaEGIwNJkilYEqmZ5yNF3dOAZuxApVYn03S7wkQv53lD
	dnNBFWG47/4J/TWOcir34sUzQyRWKQXZbQ54I1UpQ99bNumokPTQWZhTAH0ioNdi
	TArLFge0UUvThQJP0buIPUeTUUVxRThdPFQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xdXNHPvhfoN5; Mon,  9 Nov 2026 19:13:45 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfZw6M5xz1XM4Tn;
	Mon,  9 Nov 2026 19:13:44 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2 00/14] Stop lockdep_assert_held*() from assuming lock ownership
Date: Mon,  9 Nov 2026 11:13:08 -0800
Message-ID: <cover.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
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

Changes compared to v1:
 - In the commit message of patch 8/14 it is now explained why the new
   macros are introduced.
 - lockdep_assume_shared_ctx_held() now calls lockdep_assert_held_read()
   instead of lockdep_assert_held().

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
 include/linux/lockdep.h                      | 72 +++++++++++++++--
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
 20 files changed, 251 insertions(+), 75 deletions(-)

