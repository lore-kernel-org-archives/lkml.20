Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436376;
	b=QWtWeBonnXt4mmqN6Y30LMOhIIvjGg55cEJ1uyicSikX/TkVtMnOWLeHu6lF4PfXdE03
	 nmiU1RDj3oeygjfQyw5xbGISj/wHdTXtENPGokncHe05LFF1oZetoz8rKuZ06ieargRu2
	 Ig9quu1mZ4dxCRuHE7HFc4GLoMPDCwd0qFW0IiRTJBPE5Ygaq4pzvJONUhBHb5l8TBq+N
	 K2unTp7mWjGYbMi6YMSxvaWNCnmQVUtahSz8tq1RzyMFTxMN8854TfnVILs5Eri22cFnB
	 BENjllKDI2MDRdtysCpbxIcD+s37SKKLLUPEiwj09fVUnd8yk8ACHVDRInFPr29HeAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436376;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zoyh8PAgPweCx8C3cpUvmV8evCTbiZYAS+eT3cUFbpg=;
	b=zdFVTkr21DKymN3WsvCZ7VjPoweJ7YrsBHtjpavN6ZkhnEHF6ib7h+XpQRMrS6bM54SQ
	 m2dxNzkCDm4LLyYytHVY7ZyQLxYirjcbkPej9ub7LzAacniJpPagFK+VRRuuPqAVSjF3j
	 kahDfn48T+PdzWpmeQpkvIl4lyDYJR8isY61Cp/EJ7/ezpXP2hiKfrNqiTZYDm8QYcUvV
	 As53cxZg4G0puTK4xH2yu5U5KjFKMqVRqkjqPolsAzoikaX6nOWNreKlk+PhBoGPOx6zA
	 SrAUQcjfvZpiCD6NIO/v6VDIYg0opo4a/5n8JEW9DIeuDhIcr3aGPHP4XSCXMCFgwlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B65C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIsZm-00ByBD-2I;
	Mon, 19 Oct 2026 14:59:14 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Alexey Gladkov <legion@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Serge Hallyn <serge@hallyn.com>,
	Bradley Morgan <bradley@mainlining.org>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] ucount: take the rlimit reference before checking the limit
Date: Mon, 19 Oct 2026 14:59:13 -0400
Message-ID: <20261019185913.805378-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inc_rlimit_get_ucounts() takes the reference that pins a ucounts level
while its rlimit count is non-zero only in the walk whose increment is
the 0 -> 1 transition, and only after that walk passed the limit check.
A walk that raises the count from zero and then fails the limit backs
out without the reference, while a concurrent walk that raised it past
one keeps its increment and never takes one either:

  CPU0 (obeys the limit)              CPU1 (overrides it)
  new = add_return(1) -> 1
                                      new = add_return(1) -> 2
                                      new != 1, no get_ucounts()
  new > max -> dec_unwind
  sub_return(1) -> 1   (no put)

The count is 1 with no reference held. When CPU1 drops its charge,
dec_rlimit_put_ucounts() takes the count to 0 and puts a reference
nobody took, which frees the live struct ucounts, and the user_namespace
it pins, with kfree_rcu(). The mirror interleaving leaks the reference
instead.

An unprivileged user reaches this on a kernel with CONFIG_USER_NS=y: in
a user namespace with RLIMIT_SIGPENDING 0, one process taking
synchronous SIGSEGVs (forced, so override_rlimit is set) races a second
process in the same namespace and uid that queues real-time signals,
which obey the limit. The two hold different sighand->siglock but charge
the same per-namespace SIGPENDING ucounts. Unpatched, with rcuref
debugging:

  rcuref - imbalanced put()
  WARNING: lib/rcuref.c:266 at rcuref_put_slowpath+0xf4/0x120
   put_ucounts+0x5a/0x180
   do_dec_rlimit_put_ucounts+0x70/0x90
   __sigqueue_free+0x33/0xc0
   get_signal+0x56f/0xd20
   arch_do_signal_or_restart+0x87/0x380
   irqentry_exit+0x243/0x650
   asm_exc_page_fault+0x26/0x30

Take the reference on the 0 -> 1 transition before the limit is checked,
so the walk that raises the count from zero owns that level's reference
even when its request is rejected, and unwind a rejected level through
do_dec_rlimit_put_ucounts(), which releases the reference when the count
returns to 0. The get_ucounts() failure path is unchanged. With the
patch the same interleaving, forced some 80000 times in a KASAN build,
produces no warning and no KASAN report.

Fixes: 15bc01effefe ("ucounts: Fix signal ucount refcounting")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Acked-by: Alexey Gladkov <legion@kernel.org>
---

Notes:
    Changes in v2:
      - Cc: stable (Andrew Morton)
      - changelog: the racing walks run in two processes under different
        sighand->siglock that charge one ucounts; rcuref output added
        (Andrew Morton); shortened
      - shorter comment in inc_rlimit_get_ucounts() (Bradley Morgan)
      - Acked-by: Alexey Gladkov
    v1: https://lore.kernel.org/all/20261017234834.797456-1-nickolai@csail.mit.edu/
    
    The window is narrow, so the before/after runs forced the interleaving
    with a test-only delay applied identically to both trees: an obeying walk
    that observes new == 1 at the nested SIGPENDING level parks until an
    override walk arrives. x86_64 under QEMU, CONFIG_USER_NS=y, CONFIG_KASAN=y,
    rcuref debug: unpatched, the imbalanced put() within ~0.1 s (the
    interleaving occurred ~80000 times in 15 s); patched, ~82000 times, no
    warning and no KASAN report.
    
    A userspace reproducer exists and is available on request; it is not
    posted.

 kernel/ucount.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/kernel/ucount.c b/kernel/ucount.c
index ec8b1445e287..c3de5b94d25f 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -308,23 +308,26 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
 		long new = atomic_long_add_return(1, &iter->rlimit[type]);
-		if (new < 0 || new > max)
+		/*
+		 * Take the extra reference on the 0 -> 1 transition before the
+		 * limit check: a rejected walk must not leave a concurrent one
+		 * holding the surviving increment with no reference.
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

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.53.0

