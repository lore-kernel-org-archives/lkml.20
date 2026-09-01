Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028949B217
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287368; cv=none; b=o9lXhdJ2JpBsr1v2nci0nQ9CT9mBNXuiVBowZhu5L31M4H31ZEgrdA/KqG24EYx8kIO9+027NVGOEAwRBZr4u8TqB4JQkq6ZBRwaWdVXCtTd6YBZp8+DYAU0Rnt+gt2rhMBfmC8+xDscU1jwTnQTPB1lHt6SQybzGLpeK95RJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287368; c=relaxed/simple;
	bh=d0rPPJLR58Grj5g6WrWaYlhVdbvhMvShcBm1vU+F4qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shxcGiDQYW1i4CTJHrD5KB9yL9O/+dr9bkN8vN9iMkFo2QD+N1GkWo7JiadODBFE+kxhU1rcY+hnAUYd0nFX/u0Df+E6x2YY0txtjtrqifTAZSYZyjXeMLygNg+Iq66MD1sSQfOGhMB0GRU7LUe+AZ1G+9ttUWZ5YcKHq8attMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=FNSSxZHa; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="FNSSxZHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788287350;
	bh=MVIkjcqq74IZZNU1n5Q5hTuCbDzAa7ExJXxmdI4hdXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FNSSxZHa5FtuOKibtrS9mmnbzAdIGiGFwDVNJJu4Gy1huXHzsDX+deS22Nh88XhmW
	 zIx7o38HaJgbKJWIeUrU8U1JFgBsq8rh92gT/IkrUWKQPrrkTjfjIksnxwAiky0atk
	 GMoQTkYHJh6yqZCZNytGeyGOmoSAxRrBq/3jYe+qdW/ib8GuKj69hZkzFRU4oLFn8/
	 DJ061TyjoawwTY2GAjq6TxrjQeV+S0VVOKGiuzGwj6Tm6kupgbYleOKpljDtTIE/VZ
	 OwZw8BCTpwAVwjnCzsYwDjjqBMrSPUoGeQWP89Ykz2Sox6M8aWz2JV8csPyp9oAGmn
	 8Ic3jJsgihd/Q==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hZDsL625lzWP7;
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
Subject: [PATCH v21 5/6] init: move percpu_counter_tree_subsystem_init() earlier in boot
Date: Tue,  1 Sep 2026 14:28:50 -0400
Message-ID: <20260901182857.26690-6-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
References: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move percpu_counter_tree_subsystem_init() from after trap_init() to
immediately after setup_nr_cpu_ids() in start_kernel().

The function's only dependency is nr_cpu_ids: it calls
get_count_order(nr_cpu_ids), indexes into a const configuration table,
and performs arithmetic to derive accuracy parameters. It requires no
memory allocator, percpu areas, or other infrastructure.

Initialize the subsystem as soon as its dependency is available rather
than deferring until later in the boot sequence. This ensures
percpu_counter_tree_items_size() returns the correct value well before
its first use in mm_cache_init().

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
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
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index eda2170bb21f..845cb57e9096 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1011,6 +1011,7 @@ void start_kernel(void)
 	setup_boot_config();
 	setup_command_line(command_line);
 	setup_nr_cpu_ids();
+	percpu_counter_tree_subsystem_init();
 	setup_per_cpu_areas();
 	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
 	early_numa_node_init();
@@ -1042,7 +1043,6 @@ void start_kernel(void)
 	vfs_caches_init_early();
 	sort_main_extable();
 	trap_init();
-	percpu_counter_tree_subsystem_init();
 	mm_core_init();
 	maple_tree_init();
 	poking_init();
-- 
2.43.0

