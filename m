Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C53EEAF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584656; cv=none; b=efuD6OdjOo5gDxHi5TfOcnUrDRF/JAtraBLyrcIX3d2JuxLQxVWfUV+Rovk652XwWZqDJMiCxTXOaCbLjWWqe60URFUZ3tMst4tvtsKgBcYmbjgQNHiwyTteQmlzwdVUbvcFz6dfnfryQhRa/siMCg0sPtTLckMqhq7RMYgHeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584656; c=relaxed/simple;
	bh=kciwJhXcRKq/0KuyuKxuQdSVGYB7BKh51NHpq1fQmxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2yTii00V+LrUInRlHGEhd89H/bBkoctE6C5i93fYIjymrimpryIKt/mWTyqMZTSzmTEQcfhIYQTU0RpPeuFy29ExmfmGEHCn0lSbRmYD1k9asRYYxkgT4aAcAslIK93/OsNqrvY12wSb/lxUi7c6JsYe7V+hM2+6pNjQtLrV7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFJ0d-003Fo5-B0;
	Fri, 09 Oct 2026 18:24:11 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH] exit: fix lost-update race on the child_subreaper bitfields
Date: Fri,  9 Oct 2026 18:24:04 -0400
Message-ID: <20261009222404.760787-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_child_subreaper, has_child_subreaper and autoreap are 1-bit fields
that share one word of struct signal_struct.  A store to any of them is
a read-modify-write of the whole word, and two of the stores run
without a common lock:

  - PR_SET_CHILD_SUBREAPER writes me->signal->is_child_subreaper with
    no lock held.

  - propagate_has_child_subreaper(), run by walk_process_tree() from
    the same prctl in an ancestor, writes p->signal->has_child_subreaper
    of every descendant p under read_lock(&tasklist_lock), which does
    not exclude the unlocked writer.

When a process calls prctl(PR_SET_CHILD_SUBREAPER, 1) while an
ancestor's PR_SET_CHILD_SUBREAPER walk visits it, the two
read-modify-write sequences interleave and one of the bits is silently
lost:

  - If has_child_subreaper is lost, the process's orphaned descendants
    are reparented straight to init when it exits: find_new_reaper()
    tests father->signal->has_child_subreaper first and never looks for
    the ancestor subreaper.  The service manager that registered as the
    subreaper never gets SIGCHLD for them and cannot wait() on them.

  - If is_child_subreaper is lost, the prctl returned 0 but the process
    is not a subreaper: orphans of its descendants skip it and are
    reparented to the next subreaper up or to init.
    PR_GET_CHILD_SUBREAPER reads back 0.

Documentation/memory-barriers.txt requires all fields of one bitfield
to be protected by one lock for exactly this reason.  No lock is taken
or documented for these flags, and the prctl needs no privilege, so any
process can hit the race against its own ancestors or descendants.

Make the three flags separate bool members.  Each store then has its
own memory location and no read-modify-write of a neighbour.  The
readers and their locking are unchanged.  autoreap is only written to
a not yet published signal_struct in copy_process() and is not racy by
itself, but it shares the word and is converted with the other two.

Fixes: 749860ce2427 ("prctl: propagate has_child_subreaper flag to every descendant")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 include/linux/sched/signal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index d45a5476b..f7266dd2e 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -130,9 +130,9 @@ struct signal_struct {
 	 * process will inherit a flag if they should look for a
 	 * child_subreaper process at exit.
 	 */
-	unsigned int		is_child_subreaper:1;
-	unsigned int		has_child_subreaper:1;
-	unsigned int		autoreap:1;
+	bool			is_child_subreaper;
+	bool			has_child_subreaper;
+	bool			autoreap;
 
 #ifdef CONFIG_POSIX_TIMERS
 

base-commit: fc1c25014ff8e416d75e8a5ba3b9c0ba5eb8e877
-- 
2.56.0

