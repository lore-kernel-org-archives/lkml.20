Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E923E63AE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510632; cv=none; b=Mamn/U84HN+IeV6KSdr2mVmxtCqfe8uvnwzBWTOShbmbfI6m1sh0neMPnkDlTRubN/8lhp7l6YeD0UC3KOhbHcJa4zYtbzunb50Mr4MypZOEd1SLnJf7DSSEWm2XfuO0y1lZbDYERzmkgUz3+FripmYZ+2gEKoZ3107mJ8hrmr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510632; c=relaxed/simple;
	bh=qh7LUsSuMVmwYbJF65vaNykbi68YvF+qls9xkMQqeQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gtDdjjfAHfvJLko9clmvLvxl+i0HCAQnF3sg3yHYf9qO0Y8OFzkDMFKAU0tl7AJquIlj7nTnEKyu7zJlqDQtVd/MUphNvNUSYVXjfqtm54LTI3rZFKVopPXFPdSjuQxYLxAOCX3Gsi0IQDoHMtIHOv4x0QxirPwE2varkC1mdSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fFOcSK9I; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fFOcSK9I"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qh7LUsSuMVmwYbJF65vaNykbi68YvF+qls9xkMQqeQ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510628; v=1; x=1789115428;
 b=fFOcSK9IgJTKi5PH4ZN93MBVPk4yV6ovCTElfsnzA217YaXfPHMZ1/AMFCkd8vCLdGfl7PYT
 QcPnZXJ+SZ4Lw4ID1QRzaBfMH2AbFs6voh5ks9Ix/yk0CVNV3By3GPbdRr3V3XJGMQDQOX2QW/r
 lommJup/zsB/Lh6jWCQsDCMU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3226e6f833ae81c9;
	Fri, 04 Sep 2026 08:30:28 +0000
X-Mizu-Trace-ID: 3226e6f833ae81c9
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Ye Liu <liuye@kylinos.cn>,
	Yi Tao <escape@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] mm: introduce for_each_process_rcu and for_each_thread_rcu
Date: Fri,  4 Sep 2026 16:29:53 +0800
Message-Id: <20260904083001.553587-2-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904083001.553587-1-ye.liu@linux.dev>
References: <20260904083001.553587-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

Introduce for_each_process_rcu(), for_each_thread_rcu() and
for_each_process_thread_rcu() macros that acquire the RCU read lock
before the iteration starts and release it when the loop is left, so
that the RCU read-side critical section is scoped to the loop body
instead of an externally managed rcu_read_lock()/rcu_read_unlock()
pair.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 include/linux/sched/signal.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index 584ae88b435e..fe0c41dc99a1 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_SCHED_SIGNAL_H
 #define _LINUX_SCHED_SIGNAL_H
 
+#include <linux/cleanup.h>
 #include <linux/rculist.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
@@ -663,6 +664,24 @@ extern bool current_is_single_threaded(void);
 #define for_each_process_thread(p, t)	\
 	for_each_process(p) for_each_thread(p, t)
 
+/*
+ * RCU-internal variants: automatically acquire and release the RCU read
+ * lock around the iteration.  Equivalent to scoped_guard(rcu) combined
+ * with the respective non-_rcu variant.
+ */
+#define for_each_process_rcu(p) \
+	scoped_guard(rcu) \
+	for (p = &init_task ; (p = next_task(p)) != &init_task ; )
+
+#define for_each_thread_rcu(p, t) \
+	scoped_guard(rcu) \
+	__for_each_thread((p)->signal, t)
+
+/* Careful: this is a double loop, 'break' won't work as expected. */
+#define for_each_process_thread_rcu(p, t) \
+	scoped_guard(rcu) \
+	for_each_process(p) for_each_thread(p, t)
+
 typedef int (*proc_visitor)(struct task_struct *p, void *data);
 void walk_process_tree(struct task_struct *top, proc_visitor, void *);
 
-- 
2.25.1

