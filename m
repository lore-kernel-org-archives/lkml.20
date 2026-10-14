Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679E4E4C45;
	Wed, 14 Oct 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971606; cv=none; b=rMUHaKwJ2QxqnLGsFTeFOvqoOd5KZAeQxpntNVIq6araY6zuDZgy8urzs/2q0pm/BSZotNFHxm17EuuGgexAchxRQrvbgThDS4JZotnu73xGGuKvv+4D31hK3n2O9dBmp4ufdT9s5SVzniZYnC6IzEiDbiefkG34aVu4o+jJTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971606; c=relaxed/simple;
	bh=YPWP1DqJ8x22UjHIkyCmAIQgzVIpuia3ZNAjHQ3wTdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMPoAorTNE89iaav/Z8AlWje8YnR14VXhlY0VmRLSEYDzDi4Lvq1fR41eoNvf2vBEPSPBXBQfjamb5HFb0b3OddfJV/Q6a/DK5JCxNql8Ys+ZrVCeJ5fr7a8WW9QyvMSnAWVn1LkJuKOtIRmLmUKJj3cHEGx0Y6eiRLf5eIPpm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S7MePvHT; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S7MePvHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=F2
	42g82W3O6vWGqoJI+u5Yy93g3q8kIls99pfxxpGhQ=; b=S7MePvHTClKgRgZ8jl
	8xDhCm8KM4tT5l88d3HiGayeIY5XEgvg0EEZtBOOq7FC5knERK/gwbxOLxUn/a0D
	+A7gvppjHq37t23RpXAXYyVUe8WS7jcnQKmakKlknvCIeVsILDXCeTl2QX3N+taS
	M+DeHrv8ehbE0wOCBmz/MVjXQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnr17mUM9qHkpbEQ--.65245S2;
	Wed, 14 Oct 2026 17:52:39 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: elver@google.com,
	dvyukov@google.com
Cc: kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/4] kcsan: add targeted watchpoint sampling
Date: Wed, 14 Oct 2026 18:52:34 +0900
Message-ID: <20261014095238.2132580-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr17mUM9qHkpbEQ--.65245S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF48WrWfJF1rXFWrJw1UWrg_yoWrXr4Dp3
	95KrWrGrWUJrWftrZ3A3WUZFyrW3ykJF4UAF1xJrWDZwn0gFyaqr10qw1jyayUKrn3CF15
	X3W0yry8W3yUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbvtAUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gfbO2rPUOe26gAA3D

Hi,

While investigating a low-frequency scheduler access around `calc_load_idx` in
`kernel/sched/loadavg.c`, I found that KCSAN's per-CPU `kcsan.skip_watch`
interval can make focused reproduction difficult. Unrelated instrumented
accesses on the same CPUs may consume the interval before execution reaches a
known suspicious address. This is a limitation in focused-debugging control;
the proposal leaves the default sampling policy unchanged.

Setting `kcsan.skip_watch=0` removes the interval globally and can make
watchpoint setup much more frequent for all eligible accesses. The existing
debugfs whitelist and blacklist filter which reports are emitted after
watchpoint selection; they do not select which addresses may set up a
watchpoint. There is currently no runtime control to focus setup attempts on
one known address while leaving unrelated accesses out of that selection.

This RFC adds an optional single-address target to the KCSAN debugfs
interface. When enabled, a non-atomic access is eligible to set up a watchpoint
only when its byte range contains the target address. Matching accesses bypass
the normal `kcsan.skip_watch` interval; nonmatching accesses neither set up a
watchpoint nor consume that interval. The target can be specified as an address
or a kallsyms symbol, including `module:symbol`; `target=off` restores normal
sampling. A static key guards the disabled path.

Patch 1 adds single-address target matching and the static-key-guarded runtime
state. Patch 2 exposes address and symbol targets through debugfs, patch 3
tests the matching semantics, and patch 4 documents the interface and its
performance implications. The standalone integration module used for runtime
checks is local and is not included in the series.

Testing:
- x86_64 GCC and Clang `bzImage modules` builds completed, and the candidate's
  built-in KCSAN selftest passed 4/4. Runtime validation recorded setup
  activity for exact-address and `module:symbol` targets, none for a
  nonmatching target, and normal sampling after `target=off`.
- In a separate motivating loadavg run, targeting `calc_load_idx` produced a
  KCSAN report involving `calc_global_load()` and `calc_load_nohz_start()`. A
  separate upstream run with the default `skip_watch=4000` did not report
  those locations during its test window.
- Across 10 rounds of 1,000,000 accesses, medians were `24.549 ns/access`
  upstream, `24.654 ns/access` with targeting disabled, and `26.981 ns/access`
  with an enabled nonmatching target. The disabled-path results were
  indistinguishable at this measurement granularity. A separate 10-round,
  10,000-access hot-match run measured `81.1 us/access`: every matching
  access enters `kcsan_setup_watchpoint()`, so this includes setup slow-path
  work and represents focused debugging rather than normal use.

Questions for discussion:
1. Is address-targeted watchpoint sampling a useful primitive for focused
   KCSAN debugging?
2. Should matching accesses bypass the normal `kcsan.skip_watch` interval, as
   proposed here, or should targeted mode retain its own sampling interval?
3. Is the existing KCSAN debugfs file an appropriate interface for configuring
   a single target?

Hui Su (4):
  kcsan: add targeted watchpoint matching
  kcsan: add debugfs target control
  kcsan: add targeted watchpoint selftest
  docs: kcsan: document targeted watchpoint sampling

 Documentation/dev-tools/kcsan.rst | 17 ++++++++++++++
 kernel/kcsan/core.c               | 37 +++++++++++++++++++++++++++++++
 kernel/kcsan/debugfs.c            | 28 ++++++++++++++++++++++-
 kernel/kcsan/kcsan.h              | 10 +++++++++
 kernel/kcsan/selftest.c           | 29 ++++++++++++++++++++++++
 5 files changed, 120 insertions(+), 1 deletion(-)


base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.55.0

