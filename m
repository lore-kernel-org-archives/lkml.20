Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55212E7393
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538078; cv=none; b=cQ14vLJpLkiCMZwwZAvFRonjXRh2XvReKnHfS+U9T1bpN7tSmQ8J6atOSt+HzliwehMtH2nir/MzdFowwYpKr5xIEsO1rtRyv5ECv9Vp+JvMGfPUSAnJYImraOcVu1ZhVNeaTv97AOQZB5bV8z7y/xNwdhhPz1DroMjWiSWFa7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538078; c=relaxed/simple;
	bh=cgrxemdbFLrv3U76zxpLCYyy9RF7SDA8yNgZEvEdO2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AiLgigj6o3ZNmek14plr3AACeFdO9skrxXpYQESlnPpH0dljFWtfU6lo5JZzDF6T1esu28nFZ8SFSZt2dw0cNE5t2ycGopjw5dYkWMB8o5Rct2YISMqnxqUzWXM69kMRNDK+tvly8IofEDtV8Akr9T8ccs9LF9Lv9eafgzuH8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=vgA5TNJu; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="vgA5TNJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788538058;
	bh=8IFEeV8PcQPSD1vEIqV53mGLAZ2GqdJfZuwCTddGWLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vgA5TNJuOiu4SR7r/Ew5GtX8A1DjTiJ+9CRRFg5I6F7yfgPrKYeVkEt4hd7jQZQ6s
	 /TbTB5jASyMU3xtcMwmTy125/7ZCnzoCAqJcbk0ngMpc5uASkDi6mgR/JB0tABv1wV
	 ecmwMuwBqYlkWjaG5bBGkMp/Jf3Yx8lfShZx0Dt8lTvM0/tiaQHa9gv/5rjz/tcQUu
	 DebWTS6Tm4pASPpsSXo1710s2y6Ux82xQcruJqxPhEJKfglB7Zv1EHpnkuotf16PDD
	 iNj2gFHkczwSA9Zix6OVbQw2mADcJKEHWauaT0hMnzHMtaQ/CKJFVOFsKllY6+4MtL
	 v5Y5cHUegc+iA==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hc1Zf64N1zWWZ;
	Fri, 04 Sep 2026 12:07:38 -0400 (EDT)
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
Subject: [PATCH v22 10/10] lib/tests/hpcc: Fix hotplug, module unload, and error handling
Date: Fri,  4 Sep 2026 12:07:22 -0400
Message-ID: <20260904160734.23445-11-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904160734.23445-1-mathieu.desnoyers@efficios.com>
References: <20260904160734.23445-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Answer a report from Sashiko at:
https://sashiko.dev/#/patchset/20260901182857.26690-1-mathieu.desnoyers@efficios.com

Those were good catches. Following them up surfaced more than the report
contained: ERR_PTR handling, a td leak, hotplug locking, allocation
sizing, the cpu & ~1 skip, and a lost-worker bug where kthread_stop()
could preempt the threadfn before it ran, plus a task_struct reaping
race that only shows up at 1000 workers.

Plainly following Sashiko's advice to move to kthread_stop() did not
work: the thread running the worker needed a task struct reference, a
completion to ensure the work was actually done, in addition to the
kthread_stop. The kthread_stop only ensure that the thread is really
done before module unload, without guaranteeing that the kthread has
actually done its work.

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
 lib/tests/percpu_counter_tree_kunit.c | 280 +++++++++++++++++++++-----
 1 file changed, 232 insertions(+), 48 deletions(-)

diff --git a/lib/tests/percpu_counter_tree_kunit.c b/lib/tests/percpu_counter_tree_kunit.c
index a79176655c4b..8af8d2659b57 100644
--- a/lib/tests/percpu_counter_tree_kunit.c
+++ b/lib/tests/percpu_counter_tree_kunit.c
@@ -6,10 +6,13 @@
 #include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/random.h>
+#include <linux/cpuhplock.h>
+#include <linux/slab.h>
+#include <linux/sched/task.h>
 
 struct multi_thread_test_data {
 	long increment;
-	int nr_inc;
+	unsigned int nr_inc;
 	int counter_index;
 };
 
@@ -31,6 +34,9 @@ static void complete_work(void)
 		wake_up(&kernel_threads_wq);
 }
 
+/* Random tasks test. */
+#define NR_RAND_TASKS	1000
+
 static void hpcc_print_info(struct kunit *test)
 {
 	kunit_info(test, "Running test with %d CPUs\n", num_online_cpus());
@@ -67,18 +73,19 @@ static void check_counters(struct kunit *test)
 		/* Accuracy limits checks. */
 		percpu_counter_tree_approximate_accuracy_range(&counter[counter_index], &under_accuracy, &over_accuracy);
 
+		/*
+		 * under_accuracy and over_accuracy are unsigned long, so the
+		 * inner expression promotes to unsigned. Compute the difference
+		 * in unsigned and cast to signed for the comparison against 0.
+		 */
 		KUNIT_EXPECT_GE(test, (long)(approx_sum - (v - under_accuracy)), 0);
 		KUNIT_EXPECT_LE(test, (long)(approx_sum - (v + over_accuracy)), 0);
-		KUNIT_EXPECT_GT(test, (long)(approx_sum - (v - under_accuracy - 1)), 0);
-		KUNIT_EXPECT_LT(test, (long)(approx_sum - (v + over_accuracy + 1)), 0);
 
 		/* Precise min/max range check. */
 		percpu_counter_tree_approximate_min_max_range(approx_sum, under_accuracy, over_accuracy, &precise_min, &precise_max);
 
 		KUNIT_EXPECT_GE(test, v - precise_min, 0);
 		KUNIT_EXPECT_LE(test, v - precise_max, 0);
-		KUNIT_EXPECT_GT(test, v - (precise_min - 1), 0);
-		KUNIT_EXPECT_LT(test, v - (precise_max + 1), 0);
 	}
 	/* Compare each counter with the second counter. */
 	KUNIT_EXPECT_EQ(test, percpu_counter_tree_precise_sum(&counter[0]), percpu_counter_tree_precise_sum(&counter[1]));
@@ -96,18 +103,26 @@ static int multi_thread_worker_fn(void *data)
 	return 0;
 }
 
-static void test_run_on_specific_cpu(struct kunit *test, int target_cpu, int counter_index, unsigned int nr_inc, long increment)
+static struct task_struct *test_run_on_specific_cpu(int target_cpu, int counter_index, unsigned int nr_inc, long increment)
 {
-	struct task_struct *task;
 	struct multi_thread_test_data *td = kzalloc(sizeof(struct multi_thread_test_data), GFP_KERNEL);
+	struct task_struct *task;
 
-	KUNIT_EXPECT_PTR_NE(test, td, NULL);
+	if (!td)
+		return NULL;
 	td->increment = increment;
 	td->nr_inc = nr_inc;
 	td->counter_index = counter_index;
 	atomic_inc(&kernel_threads_to_run);
-	task = kthread_run_on_cpu(multi_thread_worker_fn, td, target_cpu, "kunit_multi_thread_worker");
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, task);
+	task = kthread_create_on_cpu(multi_thread_worker_fn, td, target_cpu, "kunit_multi_thread_worker");
+	if (IS_ERR_OR_NULL(task)) {
+		complete_work();
+		kfree(td);
+		return task;
+	}
+	get_task_struct(task);
+	wake_up_process(task);
+	return task;
 }
 
 static void init_kthreads(void)
@@ -115,6 +130,9 @@ static void init_kthreads(void)
 	atomic_set(&kernel_threads_to_run, 1);
 }
 
+/*
+ * The caller needs to wait for work completion _before_ stopping kthreads.
+ */
 static void fini_kthreads(void)
 {
 	/* Release our own reference. */
@@ -129,23 +147,27 @@ static void test_sync_kthreads(void)
 	init_kthreads();
 }
 
-static void init_counters(struct kunit *test, unsigned long batch_size)
+static int init_counters(unsigned long batch_size)
 {
 	int i, ret;
 
-	items = kzalloc(percpu_counter_tree_items_size() * NR_COUNTERS, GFP_KERNEL);
-	KUNIT_EXPECT_PTR_NE(test, items, NULL);
+	items = kvcalloc(NR_COUNTERS, percpu_counter_tree_items_size(), GFP_KERNEL);
+	if (!items)
+		return -ENOMEM;
 	ret = percpu_counter_tree_init_many(counter, items, NR_COUNTERS, batch_size, GFP_KERNEL);
-	KUNIT_EXPECT_EQ(test, ret, 0);
-
+	if (ret) {
+		kvfree(items);
+		return ret;
+	}
 	for (i = 0; i < NR_COUNTERS; i++)
 		atomic_long_set(&global_counter[i], 0);
+	return 0;
 }
 
 static void fini_counters(void)
 {
 	percpu_counter_tree_destroy_many(counter, NR_COUNTERS);
-	kfree(items);
+	kvfree(items);
 }
 
 enum up_test_inc_type {
@@ -164,11 +186,16 @@ static void do_hpcc_test_single_thread(struct kunit *test, int _cpu0, int _cpu1,
 	unsigned long batch_size_order = 5;
 	int cpu0 = _cpu0;
 	int cpu1 = _cpu1;
-	int i;
+	int ret, i;
 
-	init_counters(test, 1UL << batch_size_order);
+	ret = init_counters(1UL << batch_size_order);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return;
 	init_kthreads();
+	cpus_read_lock();
 	for (i = 0; i < 10000; i++) {
+		struct task_struct *task;
 		long increment;
 
 		switch (type) {
@@ -181,18 +208,34 @@ static void do_hpcc_test_single_thread(struct kunit *test, int _cpu0, int _cpu1,
 		case INC_RANDOM:
 			increment = (long) get_random_long() % 50000;
 			break;
+		default:
+			WARN_ON_ONCE(1);
+			increment = 0;
 		}
 		if (_cpu0 < 0)
 			cpu0 = cpumask_any_distribute(cpu_online_mask);
 		if (_cpu1 < 0)
 			cpu1 = cpumask_any_distribute(cpu_online_mask);
-		test_run_on_specific_cpu(test, cpu0, 0, 1, increment);
+		task = test_run_on_specific_cpu(cpu0, 0, 1, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task);
+		if (IS_ERR_OR_NULL(task)) {
+			fini_kthreads();
+			goto end;
+		}
 		test_sync_kthreads();
-		test_run_on_specific_cpu(test, cpu1, 1, 1, increment);
+		kthread_stop_put(task);
+		task = test_run_on_specific_cpu(cpu1, 1, 1, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task);
+		if (IS_ERR_OR_NULL(task)) {
+			fini_kthreads();
+			goto end;
+		}
 		test_sync_kthreads();
+		kthread_stop_put(task);
 		check_counters(test);
 	}
-	fini_kthreads();
+end:
+	cpus_read_unlock();
 	fini_counters();
 }
 
@@ -225,62 +268,168 @@ static void hpcc_test_single_thread_random(struct kunit *test)
 
 static void do_hpcc_multi_thread_increment_each_cpu(struct kunit *test, unsigned long batch_size, unsigned int nr_inc, long increment)
 {
-	int cpu;
-
-	init_counters(test, batch_size);
+	struct task_struct *(*task)[NR_COUNTERS];
+	int ret, cpu;
+
+	task = kvcalloc(nr_cpu_ids, sizeof(*task), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, task);
+	if (!task)
+		return;
+	ret = init_counters(batch_size);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 	init_kthreads();
+	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		test_run_on_specific_cpu(test, cpu, 0, nr_inc, increment);
-		test_run_on_specific_cpu(test, cpu, 1, nr_inc, increment);
+		task[cpu][0] = test_run_on_specific_cpu(cpu, 0, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][0]);
+		if (IS_ERR_OR_NULL(task[cpu][0]))
+			break;
+		task[cpu][1] = test_run_on_specific_cpu(cpu, 1, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][1]);
+		if (IS_ERR_OR_NULL(task[cpu][1]))
+			break;
 	}
 	fini_kthreads();
+	for_each_online_cpu(cpu) {
+		if (!IS_ERR_OR_NULL(task[cpu][0]))
+			kthread_stop_put(task[cpu][0]);
+		if (!IS_ERR_OR_NULL(task[cpu][1]))
+			kthread_stop_put(task[cpu][1]);
+	}
+	cpus_read_unlock();
 	check_counters(test);
 	fini_counters();
+end:
+	kvfree(task);
 }
 
 static void do_hpcc_multi_thread_increment_even_cpus(struct kunit *test, unsigned long batch_size, unsigned int nr_inc, long increment)
 {
-	int cpu;
-
-	init_counters(test, batch_size);
+	struct task_struct *(*task)[NR_COUNTERS];
+	int ret, cpu;
+
+	task = kvcalloc(nr_cpu_ids, sizeof(*task), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, task);
+	if (!task)
+		return;
+	ret = init_counters(batch_size);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 	init_kthreads();
+	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		test_run_on_specific_cpu(test, cpu, 0, nr_inc, increment);
-		test_run_on_specific_cpu(test, cpu & ~1, 1, nr_inc, increment); /* even cpus. */
+		/*
+		 * Funnel pairs of CPU indexes to their associated even index.
+		 *
+		 *   Map 0 and 1 -> index 0
+		 *   Map 2 and 3 -> index 2 and so on.
+		 */
+		int even_cpu = cpu & ~1;
+
+		if (!cpumask_test_cpu(even_cpu, cpu_online_mask))
+			continue;
+		task[cpu][0] = test_run_on_specific_cpu(cpu, 0, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][0]);
+		if (IS_ERR_OR_NULL(task[cpu][0]))
+			break;
+		task[cpu][1] = test_run_on_specific_cpu(even_cpu, 1, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][1]);
+		if (IS_ERR_OR_NULL(task[cpu][1]))
+			break;
 	}
 	fini_kthreads();
+	for_each_online_cpu(cpu) {
+		if (!IS_ERR_OR_NULL(task[cpu][0]))
+			kthread_stop_put(task[cpu][0]);
+		if (!IS_ERR_OR_NULL(task[cpu][1]))
+			kthread_stop_put(task[cpu][1]);
+	}
+	cpus_read_unlock();
 	check_counters(test);
 	fini_counters();
+end:
+	kvfree(task);
 }
 
 static void do_hpcc_multi_thread_increment_single_cpu(struct kunit *test, unsigned long batch_size, unsigned int nr_inc, long increment)
 {
-	int cpu;
-
-	init_counters(test, batch_size);
+	struct task_struct *(*task)[NR_COUNTERS];
+	int ret, cpu;
+
+	task = kvcalloc(nr_cpu_ids, sizeof(*task), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, task);
+	if (!task)
+		return;
+	ret = init_counters(batch_size);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 	init_kthreads();
+	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		test_run_on_specific_cpu(test, cpu, 0, nr_inc, increment);
-		test_run_on_specific_cpu(test, cpumask_first(cpu_online_mask), 1, nr_inc, increment);
+		task[cpu][0] = test_run_on_specific_cpu(cpu, 0, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][0]);
+		if (IS_ERR_OR_NULL(task[cpu][0]))
+			break;
+		task[cpu][1] = test_run_on_specific_cpu(cpumask_first(cpu_online_mask), 1, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][1]);
+		if (IS_ERR_OR_NULL(task[cpu][1]))
+			break;
 	}
 	fini_kthreads();
+	for_each_online_cpu(cpu) {
+		if (!IS_ERR_OR_NULL(task[cpu][0]))
+			kthread_stop_put(task[cpu][0]);
+		if (!IS_ERR_OR_NULL(task[cpu][1]))
+			kthread_stop_put(task[cpu][1]);
+	}
+	cpus_read_unlock();
 	check_counters(test);
 	fini_counters();
+end:
+	kvfree(task);
 }
 
 static void do_hpcc_multi_thread_increment_random_cpu(struct kunit *test, unsigned long batch_size, unsigned int nr_inc, long increment)
 {
-	int cpu;
-
-	init_counters(test, batch_size);
+	struct task_struct *(*task)[NR_COUNTERS];
+	int ret, cpu;
+
+	task = kvcalloc(nr_cpu_ids, sizeof(*task), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, task);
+	if (!task)
+		return;
+	ret = init_counters(batch_size);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 	init_kthreads();
+	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		test_run_on_specific_cpu(test, cpu, 0, nr_inc, increment);
-		test_run_on_specific_cpu(test, cpumask_any_distribute(cpu_online_mask), 1, nr_inc, increment);
+		task[cpu][0] = test_run_on_specific_cpu(cpu, 0, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][0]);
+		if (IS_ERR_OR_NULL(task[cpu][0]))
+			break;
+		task[cpu][1] = test_run_on_specific_cpu(cpumask_any_distribute(cpu_online_mask), 1, nr_inc, increment);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[cpu][1]);
+		if (IS_ERR_OR_NULL(task[cpu][1]))
+			break;
 	}
 	fini_kthreads();
+	for_each_online_cpu(cpu) {
+		if (!IS_ERR_OR_NULL(task[cpu][0]))
+			kthread_stop_put(task[cpu][0]);
+		if (!IS_ERR_OR_NULL(task[cpu][1]))
+			kthread_stop_put(task[cpu][1]);
+	}
+	cpus_read_unlock();
 	check_counters(test);
 	fini_counters();
+end:
+	kvfree(task);
 }
 
 static void hpcc_test_multi_thread_batch_increment(struct kunit *test)
@@ -305,25 +454,50 @@ static void hpcc_test_multi_thread_batch_increment(struct kunit *test)
 
 static void hpcc_test_multi_thread_random_walk(struct kunit *test)
 {
+	struct task_struct *(*task)[NR_COUNTERS];
 	unsigned long batch_size_order = 5;
 	int loop;
 
+	task = kvcalloc(NR_RAND_TASKS, sizeof(*task), GFP_KERNEL);
+	KUNIT_EXPECT_NOT_NULL(test, task);
+	if (!task)
+		return;
 	for (loop = 0; loop < 100; loop++) {
-		int i;
+		int ret, i;
 
-		init_counters(test, 1UL << batch_size_order);
+		memset(task, 0, NR_RAND_TASKS * sizeof(*task));
+		ret = init_counters(1UL << batch_size_order);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			goto end;
 		init_kthreads();
-		for (i = 0; i < 1000; i++) {
+		cpus_read_lock();
+		for (i = 0; i < NR_RAND_TASKS; i++) {
 			long increment = (long) get_random_long() % 512;
 			unsigned int nr_inc = ((unsigned long) get_random_long()) % 1024;
 
-			test_run_on_specific_cpu(test, cpumask_any_distribute(cpu_online_mask), 0, nr_inc, increment);
-			test_run_on_specific_cpu(test, cpumask_any_distribute(cpu_online_mask), 1, nr_inc, increment);
+			task[i][0] = test_run_on_specific_cpu(cpumask_any_distribute(cpu_online_mask), 0, nr_inc, increment);
+			KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[i][0]);
+			if (IS_ERR_OR_NULL(task[i][0]))
+				break;
+			task[i][1] = test_run_on_specific_cpu(cpumask_any_distribute(cpu_online_mask), 1, nr_inc, increment);
+			KUNIT_EXPECT_NOT_ERR_OR_NULL(test, task[i][1]);
+			if (IS_ERR_OR_NULL(task[i][1]))
+				break;
 		}
 		fini_kthreads();
+		for (i = 0; i < NR_RAND_TASKS; i++) {
+			if (!IS_ERR_OR_NULL(task[i][0]))
+				kthread_stop_put(task[i][0]);
+			if (!IS_ERR_OR_NULL(task[i][1]))
+				kthread_stop_put(task[i][1]);
+		}
+		cpus_read_unlock();
 		check_counters(test);
 		fini_counters();
 	}
+end:
+	kvfree(task);
 }
 
 static void hpcc_test_init_one(struct kunit *test)
@@ -333,11 +507,16 @@ static void hpcc_test_init_one(struct kunit *test)
 	int ret;
 
 	counter_items = kzalloc(percpu_counter_tree_items_size(), GFP_KERNEL);
-	KUNIT_EXPECT_PTR_NE(test, counter_items, NULL);
+	KUNIT_EXPECT_NOT_NULL(test, counter_items);
+	if (!counter_items)
+		return;
 	ret = percpu_counter_tree_init(&pct, counter_items, 32, GFP_KERNEL);
 	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 
 	percpu_counter_tree_destroy(&pct);
+end:
 	kfree(counter_items);
 }
 
@@ -352,9 +531,13 @@ static void hpcc_test_set(struct kunit *test)
 	int i, ret;
 
 	counter_items = kzalloc(percpu_counter_tree_items_size(), GFP_KERNEL);
-	KUNIT_EXPECT_PTR_NE(test, counter_items, NULL);
+	KUNIT_EXPECT_NOT_NULL(test, counter_items);
+	if (!counter_items)
+		return;
 	ret = percpu_counter_tree_init(&pct, counter_items, 32, GFP_KERNEL);
 	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		goto end;
 
 	for (i = 0; i < ARRAY_SIZE(values); i++) {
 		long v = values[i];
@@ -373,6 +556,7 @@ static void hpcc_test_set(struct kunit *test)
 	}
 
 	percpu_counter_tree_destroy(&pct);
+end:
 	kfree(counter_items);
 }
 
-- 
2.43.0

