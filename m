Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FA33BBB9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538070; cv=none; b=gePuaAW0g9BK5r9lYyQJDZsIarxjA8ESnYyFfR5oWCSm4sfhBazHDB9chmsFzK6xGOhKyO+gY8yC7GqWKz9Bt3M6FrR4Js3tYsFihVNEDPWrGcI50yJmtryzRRRHCwRx2UcS/pNKzqeoQ07b+1nBon8ElXV61iVype77gXc0jk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538070; c=relaxed/simple;
	bh=eGus+f2/UGXkaobm7zQlXxY0houb/tlPRMmcuXplSJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfmE8WqaYODOjzVcYblvAblvKbNrVM1gI4gpxyaltVv1OlOu1+4yFgP8W41SSPij0RRmc6iwjldzTqc3r8l7Mg17cmFbT5JsRuo48I3KWZkAkdL+k/oKGu2qdW5RtAZRaETiHxunctfZDy57m4XKvobp6UP9hlEhsBBENNnpI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=rpdrEs39; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="rpdrEs39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788538057;
	bh=19kdMNiQwxNu9bc7s+IHFuS9MHPIUiSFua29/KmdJZg=;
	h=From:To:Cc:Subject:Date:From;
	b=rpdrEs39APtxZ6+3S5p+33a/iyA8sRLllVXkbtA+JmzTwH6mV1kw08UFj3xYwgvmd
	 bwXQEkGIVdjWnmjJZ+JC0pJkg2SX+pQmQF8J4VAYNG7f+kvdQIFqemYWAOwtTDWxaR
	 EyAPcGzv9EosvkaaKlfEOyDu9Uds6cc5Y4qc24ULbc0iq8Rym+26lo0up5voR2ls7u
	 aYYxMEZEu7a2kT/s9/r4Ua+tB4yQTXCCWkyo4P3JUy3+WWe+x612vbQPx2CYCsKzZY
	 mg/fZtIN6Ex3AhbGFb1Xb8uq8EKKr3mMnmPmfu1u6TfNNujBNg+RJX9jag9vGAwJA3
	 5YNF0gPYLBayg==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hc1Zd19WhzWWW;
	Fri, 04 Sep 2026 12:07:37 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Martin Liu <liumartin@google.com>,
	David Rientjes <rientjes@google.com>,
	christian.koenig@amd.com,
	Shakeel Butt <shakeel.butt@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Zhao <yuzhao@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	David Carlier <devnexen@gmail.com>,
	Josh Law <objecting@objecting.org>,
	linux-mm@kvack.org
Subject: [PATCH v22 00/10] Hierarchical Percpu Counters for RSS
Date: Fri,  4 Sep 2026 12:07:12 -0400
Message-ID: <20260904160734.23445-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Here is the hierarchical percpu counters for RSS accounting series
rebased on top of v7.3-rc1. It includes a series of documentation and
test code fixes done to answer a review from Sashiko at:
https://sashiko.dev/#/patchset/20260901182857.26690-1-mathieu.desnoyers@efficios.com

This aims at replacing the prior version of the series you had
in mm.

As a reminder, the goal here is to provide more precise RSS counters
through /proc. A future step would be to also use these counters to
speed up the OOM killer task selection when OOM is triggered by
memcg. In whole-machine OOM situations, latency introduced by the
OOM killer task selection may not be too much of an issue, but for
memcg, where cgroups may routinely depend on the OOM killer, the
acceptable latency tradeoff is quite different.

Thanks,

Mathieu

Mathieu Desnoyers (10):
  lib: introduce hierarchical per-cpu counters
  lib: test hierarchical per-cpu counters
  mm: improve RSS counter approximation accuracy for proc interfaces
  mm: reorder mm_struct flexible array to place mm_cpumask first
  init: move percpu_counter_tree_subsystem_init() earlier in boot
  lib: inline percpu_counter_tree_items_size with boot-safety sentinel
  lib/hpcc: Document that accuracy is a property of settled counters
  lib/hpcc: Clarify accuracy range documentation
  lib/hpcc: Introduce wrapped delta helper
  lib/tests/hpcc: Fix hotplug, module unload, and error handling

Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Martin Liu <liumartin@google.com>
Cc: David Rientjes <rientjes@google.com>
Cc: christian.koenig@amd.com
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: SeongJae Park <sj@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: David Carlier <devnexen@gmail.com>
Cc: Josh Law <objecting@objecting.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org

 .../core-api/percpu-counter-tree.rst          |  82 ++
 include/linux/mm.h                            |  20 +-
 include/linux/mm_types.h                      |  65 +-
 include/linux/percpu_counter_tree.h           | 391 +++++++++
 include/trace/events/kmem.h                   |   2 +-
 init/main.c                                   |   2 +
 kernel/fork.c                                 |  24 +-
 lib/Kconfig                                   |  12 +
 lib/Makefile                                  |   1 +
 lib/percpu_counter_tree.c                     | 747 ++++++++++++++++++
 lib/tests/Makefile                            |   2 +
 lib/tests/percpu_counter_tree_kunit.c         | 583 ++++++++++++++
 12 files changed, 1899 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/core-api/percpu-counter-tree.rst
 create mode 100644 include/linux/percpu_counter_tree.h
 create mode 100644 lib/percpu_counter_tree.c
 create mode 100644 lib/tests/percpu_counter_tree_kunit.c

-- 
2.43.0

