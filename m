Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD302D0629
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113091; cv=none; b=MgQCedZUwEAYMf4vFBw3t4OCWSzU/BRsg6+X57zkWjccCPfIF3bk09TJzngkf2tgPa0UM5epOry6h7TSQztB7ZQcSTy63UMulR+Ju4x2TEbdd08l5vnFiTY7HieEMwfpY0rR7UX9R40XVTSTXT7NgZ2BgEkMAa9aJViTj4HAeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113091; c=relaxed/simple;
	bh=ANonsRn+OFhRzS+87dmE7gHvQBvhUQHgRcqlYAJvu9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4y/Nb2y79RqsSKLZ0aoGtG+I0/xK3dHthbI+OgCaZCHm1nPSNSdBetweyMsk3g+GpF7O1u6a4mmobxLbN485LJvVOHWE1ci1L0GRZY07nf3PzqX1iUgs4EzlqRspg/3mi4ZMlTupinK/clPFSHhyc3yjKvmhaG4ybKx6wMcfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qMhiDfL8; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qMhiDfL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=H8
	z5/RcK5U5m6cpx5oEG/gpGfJSt6ndSqFlWz4NepEM=; b=qMhiDfL88TzvryBCkx
	UUw7jc34HJH6Tw0qVeHl3X7AyH8M8jCjtFQ3rqbNzl3qKJxrk4AQScVQpaMcNytf
	y0drVNfxWkbMLIAXRnqxgrHwGf360baM+wvEJjqoXM7o7hUOR/L11M0hByalYbU+
	u69WEudIiu/x16d+5NfiykC6g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9FYedFqkQ1+AQ--.24484S2;
	Fri, 16 Oct 2026 09:09:45 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	rafael.j.wysocki@intel.com,
	jacob.jun.pan@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 0/2] hrtimer: Add cleanup class for on-stack timers
Date: Fri, 16 Oct 2026 10:09:42 +0900
Message-ID: <cover.1792083743.git.sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H9FYedFqkQ1+AQ--.24484S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryDKw45Wr1fKr1DCr1UAwb_yoW8WryUp3
	9rXFWaqr4UJas2yFsxCa1kua45ZFs3G3y3Gr43trWYvFyUGF1UtFW2gF1avF4xtrW8uwsr
	Ka4vyF95GrnY937anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi7GYPUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hqD4mrReVq5UgAA3i

Add an opt-in cleanup class that pairs hrtimer_setup_on_stack() with
destroy_hrtimer_on_stack(), and convert play_idle_precise() to use it.

The class provides debug-object teardown, not timer cancellation. The
converted caller limits the cleanup object's lifetime to the block covering
timer start and the idle wait, which ends only after the pinned hard hrtimer
callback has completed.

Testing:
- x86_64 QEMU with CONFIG_DEBUG_OBJECTS_TIMERS=y: baseline setup=301,
  play_idle_precise return=301, free=0; the patched kernel recorded
  setup=301, play_idle_precise return=301, free=301 for the same timer
  address, with no ODEBUG warning.
- x86_64 GCC 15.2.0: the series built bzImage/modules, and
  kernel/sched/idle.o also built with CONFIG_DEBUG_OBJECTS_TIMERS=n.

Changes in v2:
- Add an hrtimer_on_stack cleanup class following Peter's suggestion to use
  __cleanup() for the setup/destroy pairing.
- Document the hrtimer_setup_on_stack() lifetime requirements.
- Convert play_idle_precise() using CLASS() in an explicit block and explain
  the callback ordering.

v1: https://lore.kernel.org/lkml/20261015025029.3356060-1-sh_def@163.com/

Hui Su (2):
  hrtimer: Add cleanup class for on-stack timers
  sched/idle: Use hrtimer cleanup class in play_idle_precise()

 include/linux/hrtimer.h | 24 ++++++++++++++++++++++++
 kernel/sched/idle.c     | 16 ++++++++++------
 kernel/time/hrtimer.c   |  8 ++++++--
 3 files changed, 40 insertions(+), 8 deletions(-)


base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.55.0

