Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFED49505D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287360; cv=none; b=e4dQlmnoAApev0uKlWcmWfwE/UtXGMWJYI0bsPl0R/pcT2FLQlMVgFQwGvmnJtGXJfrSTQ56C4HQhLtb0A2dPkyjfqmYQsVOstxUX8mKZjPRDxVebYC0U/h6AmDP++JAmsZfU3XpqMD34rBd+ymm3SJSaoJKfpi7KeHUrPNz1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287360; c=relaxed/simple;
	bh=BLYdv1aKZgwy8HwkhERdN1xQJIw1l3+i5Tc85W4CScM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahlv7TmigBtrL0eTu5F3f+4hP2Sixl9NyuWm//Yy/KYFrjh6sxwk3gqfdDQG1n9LeXWfa5ug4A81jhTMeMVhSBciH/lthOEflvD1K1QQyCKNl1KMeGWzCqcoOL3Aw4A1yrc5tsm9pqNkVe8N6RucGYk9lT7y868JSrgfPf33sro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=QajWR+kJ; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="QajWR+kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788287350;
	bh=FOcNzTawBpX5g45f7ywapH98j8rGtWxKx3lq/TqFmkY=;
	h=From:To:Cc:Subject:Date:From;
	b=QajWR+kJdHwkjna4g3bEa6+p6wAOZ4Ed8kxzCLylLQOnUsbr/HSrzL2jEK8qcHmvu
	 jag9LUbVt5w+5foekmrQRUJ6kfOcAOQ6FIYStpSQDAv/mg6B5XYj48vKpRVIC0qZmT
	 Ba//F3JqNoQlsKvj64FvObhl6E5a5gvmTAYZETRqY5RvYFhqURhvWXbCSQ0yCw5t7I
	 b+C1GqKGOfYp9JpGwrGAMYw6e9OzSYDEm63yH9u5ofB71csJyO48xdW/eAdYEgLKvM
	 z4BLi+LydGEiueTObZrIU9yOsAJW9WlimU6BbOPHTxI0r8phOdnZCpx5xcpyPIKxSk
	 rp61voO3nkqdw==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hZDsL0JtGzWHJ;
	Tue, 01 Sep 2026 14:29:10 -0400 (EDT)
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
Subject: [PATCH v21 0/6] Hierarchical Percpu Counters for RSS
Date: Tue,  1 Sep 2026 14:28:45 -0400
Message-ID: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
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
rebased on top of v7.3-rc1. It includes small bootup fixes which were
needed to fix bootup sequence on specific architectures, and a rename of
the test config option to include "KUNIT_".

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

Mathieu Desnoyers (6):
  lib: introduce hierarchical per-cpu counters
  lib: test hierarchical per-cpu counters
  mm: improve RSS counter approximation accuracy for proc interfaces
  mm: reorder mm_struct flexible array to place mm_cpumask first
  init: move percpu_counter_tree_subsystem_init() earlier in boot
  lib: inline percpu_counter_tree_items_size with boot-safety sentinel

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

 .../core-api/percpu-counter-tree.rst          |  75 ++
 include/linux/mm.h                            |  20 +-
 include/linux/mm_types.h                      |  65 +-
 include/linux/percpu_counter_tree.h           | 387 ++++++++++
 include/trace/events/kmem.h                   |   2 +-
 init/main.c                                   |   2 +
 kernel/fork.c                                 |  24 +-
 lib/Kconfig                                   |  12 +
 lib/Makefile                                  |   1 +
 lib/percpu_counter_tree.c                     | 694 ++++++++++++++++++
 lib/tests/Makefile                            |   2 +
 lib/tests/percpu_counter_tree_kunit.c         | 399 ++++++++++
 12 files changed, 1651 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/core-api/percpu-counter-tree.rst
 create mode 100644 include/linux/percpu_counter_tree.h
 create mode 100644 lib/percpu_counter_tree.c
 create mode 100644 lib/tests/percpu_counter_tree_kunit.c

-- 
2.43.0

