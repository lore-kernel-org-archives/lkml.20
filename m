Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F073630AC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931675; cv=none; b=NScoCpWFhn6kmMpCw2lUy8d7cR8mo6QwOWmNYRpoQ+44fOmyXX31JAKuuawouGAmVSSTDoc6v8sM4lxQ4mCdMyMK0mVwzOCL/V+c0OeLWoK0p+n6jwr8duEcOsh6vDfBN5Ibl1sUOglLB8CdJ+Ik03ZSQVuPQhuIG9qMN+2FBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931675; c=relaxed/simple;
	bh=Yi+FuUeg4dC+rqSQKuW6NucWLB5rgtoxoiOFryufC30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFROo0DWW9M2WICP2FisyKUtynCEK+6p0QMokmnUMT9FtHV7FncLNcQLA6jl9VmjoUa58jO+8wOFM3+bG9Ls8CbZhTj5LBe6x7W61ap3WjZM1bOACsTcpMsL0slKiuSL7BVFqDk3VIvbMRD7xteVVGORbunBkyw7VDsjHwMbDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=aKQLPO4J; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="aKQLPO4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1787931236;
	bh=KfHRrEbTaLO2Q358f1BZRH2Htl7n2RsOI4seUtwfGkg=;
	h=From:To:Cc:Subject:Date:From;
	b=aKQLPO4JmJR0zqCiV74zhqvPpwZsnSXEY/sBNn2GhdamaZ4t3nzQFVwpCUew9NUhp
	 IdvLShYZ1RlD6cAlpWWTMoMTDhX6Sja0bUx/+OUcw+cKKM44gBcg0eiErsga/cOvoM
	 QmdE55VZLmIaMkJ1Evpyxa8HgbA3SQqbz/NAPHc5pFa0NaFL8L6vUiNhWsa4bOr1fz
	 gEOSrlMkYw4OUxAdnPU5QdtCblWyuHloA42uQCfFU/bZXf9uPz8/14/NSyn+DzBhwu
	 7NLBD1i2wQY0N51iYspsoHIS5KxVuac2MXKcWmkfkRogEjfOVbjplQNlrWCN7OfN5F
	 jOdzWNbqbSq2Q==
Received: from laura.localdomain (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hWj905cJ1zTCX;
	Fri, 28 Aug 2026 11:33:56 -0400 (EDT)
From: odion@efficios.com
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	David Matlack <dmatlack@google.com>,
	Marco Elver <elver@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Wei Liu <wei.liu@kernel.org>,
	Florian Weimer <fweimer@redhat.com>,
	Mathias Stearn <mathias@mongodb.com>,
	Chris Kennelly <ckennelly@google.com>,
	Blake Oler <blake.oler@mongodb.com>,
	Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos O'Donell <codonell@redhat.com>,
	Olivier Dion <odion@efficios.com>
Subject: [RFC PATCH 0/5] rseq: add support for RSEQ operations
Date: Fri, 28 Aug 2026 11:33:38 -0400
Message-ID: <20260828153349.8061-1-odion@efficios.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Olivier Dion <odion@efficios.com>

Hi,

This series introduces RSEQ operations: a per-thread list of operations the
kernel applies, on behalf of a ask, when returning to user space.

The main motivation is to help TCMalloc migrate from RSEQ v1 to RSEQ v2 and use
the RSEQ area registered by glibc. TCMalloc currently relies on RSEQ v1
resetting the cpu_id field to invalidate a per-CPU pointer cached in TLS. This
requires applications to disable glibc's implicit RSEQ registration and prevents
sharing the glibc RSEQ area.

RSEQ operations provide an opt-in replacement for that invalidation
mechanism. User space registers operation nodes with prctl; the kernel keeps the
nodes in a per-thread circular list and applies them on return to user
space. Only tasks with registered operations incur the additional RSEQ exit-path
work.

The first patch adds the UAPI. The next three patches add the task state,
operation execution, and prctl registration support. The final patch adds
selftests covering normal operation and malformed-list and invalid-memory cases.

See also <https://lore.kernel.org/lkml/20260428221058.149538293@kernel.org>.

Thanks,
old

Olivier Dion (5):
  rseq: uapi: add rseq operation definitions
  rseq: add per-task rseq operation state
  rseq: apply operations on exit to user space
  rseq: register and unregister operations via prctl
  selftests/rseq: add coverage for rseq operations

 include/linux/rseq.h                    |  10 +-
 include/linux/rseq_entry.h              | 157 ++++++++++++++++-
 include/linux/rseq_types.h              |   9 +
 include/uapi/linux/prctl.h              |  12 ++
 include/uapi/linux/rseq.h               | 104 ++++++++++-
 kernel/rseq.c                           | 220 ++++++++++++++++++++++--
 kernel/sys.c                            |   5 +
 tools/testing/selftests/rseq/.gitignore |   4 +-
 tools/testing/selftests/rseq/Makefile   |   4 +-
 tools/testing/selftests/rseq/rseq-abi.h | 146 +++++++++++++---
 tools/testing/selftests/rseq/rseq.c     |  23 ++-
 tools/testing/selftests/rseq/rseq.h     |  75 ++++++++
 12 files changed, 713 insertions(+), 56 deletions(-)

-- 
2.54.0

