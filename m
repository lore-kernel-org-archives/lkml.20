Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1B366567
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413234; cv=none; b=S47vat0I3hHWQeos9EaHN/FMSKrlWdKB/bh0sQ8Xk2GIzmyBYS3psRszz5uS5aajSyL8RlgULMgyO1jvhyAqf96TJ1YSBoSWvhCebziEs4aQIjydX+o1orAY3w0dVo1Pdy50z3uihlIErxVXaqd2E9W8ZZVOGdsOJzg8akFDajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413234; c=relaxed/simple;
	bh=HFbpE4fqUlXi4lWKKeC9gxI+RHPwbD/dhV1VGxuPBZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hMun9tBTZx2cYUV7v9nmedrxUDGTXMajFsnRxElsIPJubuCh3ohptBp9mwq+XGpAMDzpiOgxPXj8QbUP5Zyit24XVjiRqIY06xFC/CIFJO9Yl4T0/SLF8q5OJK01ksQI6nD5NcPZEARjUFyQkLe+dTuAnRTdKR7QwZ5D2W9RoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZfK1pXCI; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZfK1pXCI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HFbpE4fqUlXi4lWKKeC9gxI+RHPwbD/dhV1VGxuPBZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789413228; v=1; x=1790018028;
 b=ZfK1pXCIZs1wRYJy1pg5lAu0kUQVZr0N6lbJycbYRCYITxls6GhRsmJvHBMcqNCnb5IdL7Mq
 m1OL94abnhpXSnlL8D3LXDiUPojU8kr6WOrFwVmLeRxxq8w4osQ4uCwGhfJluC6wWMEkJDU4O8B
 zg0FXNJQkrWfwXbP8xDU0EvA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7e179978859c7598;
	Mon, 14 Sep 2026 19:13:48 +0000
X-Mizu-Trace-ID: 7e179978859c7598
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v6 0/4] rv/reactors: fix lockdep warning and add tests
Date: Tue, 15 Sep 2026 03:13:33 +0800
Message-Id: <cover.1789412799.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wen Yang <wen.yang@linux.dev>

We occasionally hit a lockdep "Invalid wait context" warning when
a reactor callback is preempted by a timer interrupt.
On interrupt exit the scheduler takes rq->__lock (LD_WAIT_SPIN) while
rv_react() still holds its wait-type-override map, which declared
LD_WAIT_FREE.  On any kernel where the task context has preemption
enabled (not just CONFIG_PREEMPT_RT) this triggers a spurious lockdep
report:

    [ BUG: Invalid wait context ]
    1 lock held by kunit_try_catch/209:
     #0: (rv_react_map-wait-type-override){+.+.}-{1:1}
    kunit_try_catch/209 is trying to lock:
    ffff8a743ed3e8a0 (&rq->__lock){-...}-{2:2}

This series fixes the wait type (patch 1), makes reactor registration
failures propagate (patch 2), adds support for module-based
reactors (patch 3), and adds KUnit/kselftest coverage (patch 4-5).

Changes in v5:
- Patch 1: Fix typo. Functional code unchanged.
- Patch 2: Unchanged.
- Patch 3: Only exported the registration helpers as v4.
- Patch 4: Fix typo. Functional code unchanged.

v5: https://lore.kernel.org/lkml/cover.1788705281.git.wen.yang@linux.dev/
v4: https://lore.kernel.org/lkml/cover.1787854397.git.wen.yang@linux.dev/
v3: https://lore.kernel.org/lkml/cover.1786294920.git.wen.yang@linux.dev/
v2: https://lore.kernel.org/lkml/cover.1785695669.git.wen.yang@linux.dev/
v1: https://lore.kernel.org/lkml/cover.1781541556.git.wen.yang@linux.dev/

Wen Yang (4):
  rv/reactors: use LD_WAIT_SPIN as the reactor lockdep wait type
  rv/reactors: propagate rv_register_reactor() error from reactor init
  rv/reactors: export rv_register_reactor() and rv_unregister_reactor()
  rv/reactors: add KUnit tests for reactor registration and dispatch

 kernel/trace/rv/Kconfig             |  12 +++
 kernel/trace/rv/Makefile            |   1 +
 kernel/trace/rv/reactor_panic.c     |   3 +-
 kernel/trace/rv/reactor_printk.c    |   3 +-
 kernel/trace/rv/rv_reactors.c       |  12 ++-
 kernel/trace/rv/rv_reactors_kunit.c | 111 ++++++++++++++++++++++++++++
 6 files changed, 137 insertions(+), 5 deletions(-)
 create mode 100644 kernel/trace/rv/rv_reactors_kunit.c

-- 
2.25.1

