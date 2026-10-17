Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C901F2B8D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792280923; cv=none; b=b1rbiNunBkNjkHD8nN7A7Zc+NXDvJLmkbv8etv1BtXtWHt82bvwqgSAcWUIlXvHAb6TuoqsklUmwpuZW5PIhS1y6LwWhVZ0MED7krbThAEJqADXSLS09Xn0Pqrom3BUMQp3WG1Axuuep+oHmfDmnQFV5P20BZHZi1lHkhqqz0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792280923; c=relaxed/simple;
	bh=u8T4u6gGZi75MTzoTY4V6IDCsSHa0n66NfiID6Un2G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dU/ng90bM7Z1vqjK6sZigpLOCKhHY2Dm6dnpAXKQQ2kP15CZIY/633itxj6DPjY8XQW/vkNnFVedaYsQPtHFo1rNNQPwIfmV/OyL0s8jqpBzBSNaGoFJtWA6D/r1j2/wkQIG2yOfKbWx50BZm5dRHvODVoVPxkpRut9gOElpa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIE8g-003rIH-Sh;
	Sat, 17 Oct 2026 19:48:34 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Alexey Gladkov <legion@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Serge Hallyn <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] ucount: take the rlimit reference before checking the limit
Date: Sat, 17 Oct 2026 19:48:34 -0400
Message-ID: <20261017234834.797456-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a kernel with user namespaces enabled (CONFIG_USER_NS=y, the default on
most distributions) an unprivileged user can free a live struct ucounts,
and the user_namespace it pins, while they are still in use, giving a use-
after-free on the next signal-accounting access or an rcuref "imbalanced
put()" warning. It needs no privilege beyond creating a user namespace: in
a namespace whose RLIMIT_SIGPENDING is 0, race a thread queueing real-time
signals (which obey the limit and fail at that namespace's ucounts level)
against one taking a synchronous fault such as SIGSEGV (delivered with
override_rlimit set, crossing the same level without the limit check);
both charge the same per-namespace SIGPENDING counter. The defect has been
present since inc_rlimit_get_ucounts() was introduced in v5.15.

inc_rlimit_get_ucounts() walks the ucounts chain and, for each level,
increments iter->rlimit[type] and then grabs one extra reference on the
ucounts when the counter goes from 0 to 1 -- the reference that pins the
ucounts for as long as the rlimit count stays non-zero, released by
dec_rlimit_put_ucounts() when the counter returns to 0. The reference is
taken only by the thread that observes new == 1, and only after the limit
check: a level that fails "new > max" jumps to dec_unwind, which decrements
iter->rlimit[type] again but takes no reference.

That ordering is unsafe under concurrency. The thread that performs the
0 -> 1 transition is not guaranteed to keep its increment:

  CPU0 (fails the limit)              CPU1 (overrides it)
  new = add_return(1) -> 1
                                      new = add_return(1) -> 2
                                      new != 1, no get_ucounts()
  new > max -> dec_unwind
  sub_return(1) -> 1   (no put)

The count is left at 1 with no reference held: CPU0 took the increment to 1
but backed out without taking the reference, while CPU1's surviving
increment never took one. When CPU1 later frees its charge,
dec_rlimit_put_ucounts() drops the count 1 -> 0 and calls put_ucounts() for
a reference nobody ever took. struct ucounts is freed with kfree_rcu() when
its last reference goes away, so this stray put drops a live ucounts and
frees it while it is still charged and still on the ucounts hash, giving a
use-after-free of the ucounts (and of the user_namespace it pinned). The
symmetric interleaving instead leaks a reference (CPU0 succeeds and takes
the reference, CPU1 fails and unwinds the level to 0 with no put), pinning
the ucounts and its user_namespace forever.

The invariant the code wants is "rlimit[type] > 0 implies exactly one
ucounts reference held for that level".

Take the reference on the 0 -> 1 transition before the limit is decided, so
the thread that raises the count from zero owns that level's reference even
when its own request is rejected; the rejecting path then unwinds iter
through do_dec_rlimit_put_ucounts(), which releases that reference when the
counter returns to 0. The get_ucounts() failure path is unchanged: no
reference was taken, so iter is decremented without a put.

Fixes: 15bc01effefe ("ucounts: Fix signal ucount refcounting")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    A reproducer, available on request, wins the race within seconds
    under KASAN or rcuref debugging.

 kernel/ucount.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/kernel/ucount.c b/kernel/ucount.c
index ec8b1445e287..44a78ae80579 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -308,23 +308,30 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
 		long new = atomic_long_add_return(1, &iter->rlimit[type]);
-		if (new < 0 || new > max)
+		/*
+		 * Grab the extra reference when this walk observes the 0 -> 1
+		 * transition, before the limit is checked: the thread that
+		 * raises the count from zero owns this level's reference, even
+		 * when the limit check below rejects the request. Otherwise a
+		 * concurrent walk that raised the count past 1 is left holding
+		 * the surviving increment with no reference, and its later
+		 * dec_rlimit_put_ucounts() drops a reference nobody took.
+		 */
+		if (new == 1 && !get_ucounts(iter))
 			goto dec_unwind;
+		if (new < 0 || new > max) {
+			/* undo iter too, releasing the reference taken above */
+			do_dec_rlimit_put_ucounts(ucounts, iter->ns->ucounts, type);
+			return 0;
+		}
 		if (iter == ucounts)
 			ret = new;
 		if (!override_rlimit)
 			max = get_userns_rlimit_max(iter->ns, type);
-		/*
-		 * Grab an extra ucount reference for the caller when
-		 * the rlimit count was previously 0.
-		 */
-		if (new != 1)
-			continue;
-		if (!get_ucounts(iter))
-			goto dec_unwind;
 	}
 	return ret;
 dec_unwind:
+	/* get_ucounts() failed for iter: undo iter without a put */
 	dec = atomic_long_sub_return(1, &iter->rlimit[type]);
 	WARN_ON_ONCE(dec < 0);
 	do_dec_rlimit_put_ucounts(ucounts, iter, type);

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

