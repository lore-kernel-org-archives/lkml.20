Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72B3E5A0E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791722093; cv=none; b=F8BFoI4Jsh0CmF3/W/KtMRa1fN39ioqx5csgnSYyWxd6ugyRiWfiLOqfufwhB3UGdQUrlCeWUjshl3u2WYlKvB7ina4jXWiOQeN5HJTiWiHea27UDiyfBktHQYJdlPtL8elzlo3rXXjpnwbny1M1m7QGEqZ+0LYaSDqfHgAl/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791722093; c=relaxed/simple;
	bh=r7xmvUgbULUKWloNTRMRe90TObNszbwY+sbmuKveLBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpxtgLXW/tjbc+IeSstl0DKzH3xqtLmpf1ujMGBknBTj4EvbOSwZc/2OeDcFcvvVgVHoljxFsRz6pgqVC6CXG95R2YWm1EEd0pYk65QOKt1FBuKNbhykCVXE+OXSBWUykgaLKnrG2vStY05iuJuO2R8s0Oazt83uw0WBT/QR7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFslE-00ACEu-AE;
	Sun, 11 Oct 2026 08:34:40 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] exit: fix lost-update race on the child_subreaper bitfields
Date: Sun, 11 Oct 2026 08:34:39 -0400
Message-ID: <20261011123440.768054-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ast8bJdwDYBnGRT7@redhat.com>
References: <ast8bJdwDYBnGRT7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_child_subreaper, has_child_subreaper, autoreap and, with
CONFIG_POSIX_TIMERS=y, timer_create_restore_ids are 1-bit fields that
share one memory location in struct signal_struct.  A store to any of
them is a read-modify-write of the whole word, and three of the stores
run without a common lock:

  - PR_SET_CHILD_SUBREAPER writes me->signal->is_child_subreaper with
    no lock held.

  - propagate_has_child_subreaper(), run by walk_process_tree() from
    the same prctl in an ancestor, writes p->signal->has_child_subreaper
    of every descendant p under read_lock(&tasklist_lock), which does
    not exclude the other writers.

  - PR_TIMER_CREATE_RESTORE_IDS writes
    current->signal->timer_create_restore_ids with no lock held.

When a process calls prctl(PR_SET_CHILD_SUBREAPER, 1) while an
ancestor's PR_SET_CHILD_SUBREAPER walk visits it, or while another
thread of the same process calls prctl(PR_TIMER_CREATE_RESTORE_IDS),
the read-modify-write sequences interleave and one of the bits is
silently lost:

  - If has_child_subreaper is lost, the process's orphaned descendants
    are reparented straight to init when it exits: find_new_reaper()
    tests father->signal->has_child_subreaper first and never looks for
    the ancestor subreaper.  The service manager that registered as the
    subreaper never gets SIGCHLD for them and cannot wait() on them.

  - If is_child_subreaper is lost, the prctl returned 0 but the process
    is not a subreaper: orphans of its descendants skip it and are
    reparented to the next subreaper up or to init.
    PR_GET_CHILD_SUBREAPER reads back 0.

  - If timer_create_restore_ids is lost, the prctl returned 0 but
    timer_create() does not restore the requested timer ids (or keeps
    restoring them after _OFF), and _GET reads back the old value.

Documentation/memory-barriers.txt requires all fields of one bitfield
to be protected by one lock for exactly this reason.  No lock is taken
or documented for these flags, and the prctls need no privilege, so any
process can hit the race against its own ancestors or descendants, or
between two of its own threads.

Make is_child_subreaper and has_child_subreaper separate bool members.
Each store then has its own memory location and no read-modify-write
of a neighbour.  The readers and their locking are unchanged.

autoreap stays a bit-field and so shares a memory location only with
timer_create_restore_ids.  That pair is race-free: autoreap is stored
exactly once, in copy_process() before the new signal_struct is
reachable by any other task, and timer_create_restore_ids is only
stored to the signal_struct of an already running process.

Fixes: 749860ce2427 ("prctl: propagate has_child_subreaper flag to every descendant")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
Changes in v2:
  - keep autoreap as a bit-field (Oleg); it is only stored before the
    signal_struct is published, so sharing a memory location with
    timer_create_restore_ids is fine.
  - mention timer_create_restore_ids, which shares the memory location
    with the subreaper bits today and is a third unlocked writer.
v1: https://lore.kernel.org/lkml/20261009222404.760787-1-nickolai@csail.mit.edu/

 include/linux/sched/signal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index d45a5476b97de..efa1e2d6c7a6b 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -130,8 +130,8 @@ struct signal_struct {
 	 * process will inherit a flag if they should look for a
 	 * child_subreaper process at exit.
 	 */
-	unsigned int		is_child_subreaper:1;
-	unsigned int		has_child_subreaper:1;
+	bool			is_child_subreaper;
+	bool			has_child_subreaper;
 	unsigned int		autoreap:1;
 
 #ifdef CONFIG_POSIX_TIMERS

base-commit: fc1c25014ff8e416d75e8a5ba3b9c0ba5eb8e877
-- 
2.55.0

