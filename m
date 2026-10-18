Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2733905EF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323539; cv=none; b=UNx0F7MvesBq2glCH9hXvaBJuxAjgoZf8D+ssoRk4QTU4Mk/OWHS6TLo0OjY8QNdD6jimIPOkPPMiaeze1Z/6afleiA+jbhEW4rRuymekT2bOPk/SV5liNsHeLnWOS0+xr7jrjNxw46+ix+IKB717nHQHvt8/zG22RqSDJxud/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323539; c=relaxed/simple;
	bh=x/4cO8BajHgHo3OxnVAmyvcRGDSK7vRvXHZz23Zm+3U=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=BMaH97ajxsrMSYMG3IlSk/xuaVZ8NONfkuSmZXxFC+rNmWsuhewZvOhP4SHCXmMWIcQkTjjQ4GiEz3WfNbuPEB5APG8lo3TvIc5mRgZe6Ff2WE2ts/GFjdNR3RjYJCfBFrgptKWcUzJLha5AH5kPT7EtzNjqdf5BDdBGQcf+xiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fOPoWCzX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HKWvwSB/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fOPoWCzX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HKWvwSB/"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792323486; bh=Gj8HLxYZ/FHdh5pwMX0Duni
	hYej5jmKqc49xXpdeTzE=; b=fOPoWCzXxOLX9wC3oBZ/5Z0TQdmIlXuwa7lxczrHIKwX+/2xze
	EZ6qKsb8maTH5egre+4cAXesU1bLk1OZHcKnOgLqRefnlceyMwGmm1tF1haPivuMdFayc0ME57M
	6a19hY+MXqGBmGAR1ZpYRSVxljh+9TvaJIVscN1i5+3d7mShOCCRUSLXBWpGRZABiEhl4hig64j
	AVKFsfABnsJrzKsswfs0SiuaUkJUYuv0FYuo1Sfr6nC9SHFoDWcQ2u7Jmcmuqlis6nh/v3D3MfG
	iZ85nhN8GhZn2h7teIC9YRIej4gTlN0XO28UufaqOQUI5UvTqWgFSLpScISwzaKq+uw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792323486; bh=Gj8HLxYZ/FHdh5pwMX0Duni
	hYej5jmKqc49xXpdeTzE=; b=HKWvwSB/GEwyeHv8mxQ6hwjPSnpxZBVCYv9EwsscQSQ2LG2iFW
	5t9B7KjvHGp9SL5j9A8P/YWD0bXuFtsyWHBQ==;
Date: Sun, 18 Oct 2026 12:38:07 +0100
From: Bradley Morgan <brads@mainlining.org>
To: nickolai@csail.mit.edu
CC: akpm@linux-foundation.org, brauner@kernel.org, ebiederm@xmission.com,
 kees@kernel.org, legion@kernel.org, linux-kernel@vger.kernel.org,
 serge@hallyn.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_ucount=3A_take_the_rlimi?=
 =?US-ASCII?Q?t_reference_before_checking_the_limit?=
In-Reply-To: <20261017234834.797456-1-nickolai@csail.mit.edu>
Message-ID: <75EF8C47-9D44-433F-BD4A-CBC12BBF27B0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 18 October 2026 00:48:34 BST, Nickolai Zeldovich
<nickolai@csail.mit.edu> wrote:
>On a kernel with user namespaces enabled (CONFIG_USER_NS=y, the default on
>most distributions) an unprivileged user can free a live struct ucounts,
>and the user_namespace it pins, while they are still in use, giving a use-
>after-free on the next signal-accounting access or an rcuref "imbalanced
>put()" warning. It needs no privilege beyond creating a user namespace: in
>a namespace whose RLIMIT_SIGPENDING is 0, race a thread queueing real-time
>signals (which obey the limit and fail at that namespace's ucounts level)
>against one taking a synchronous fault such as SIGSEGV (delivered with
>override_rlimit set, crossing the same level without the limit check);
>both charge the same per-namespace SIGPENDING counter. The defect has been
>present since inc_rlimit_get_ucounts() was introduced in v5.15.
>
>inc_rlimit_get_ucounts() walks the ucounts chain and, for each level,
>increments iter->rlimit[type] and then grabs one extra reference on the
>ucounts when the counter goes from 0 to 1 -- the reference that pins the
>ucounts for as long as the rlimit count stays non-zero, released by
>dec_rlimit_put_ucounts() when the counter returns to 0. The reference is
>taken only by the thread that observes new == 1, and only after the limit
>check: a level that fails "new > max" jumps to dec_unwind, which decrements
>iter->rlimit[type] again but takes no reference.
>
>That ordering is unsafe under concurrency. The thread that performs the
>0 -> 1 transition is not guaranteed to keep its increment:
>
>  CPU0 (fails the limit)              CPU1 (overrides it)
>  new = add_return(1) -> 1
>                                      new = add_return(1) -> 2
>                                      new != 1, no get_ucounts()
>  new > max -> dec_unwind
>  sub_return(1) -> 1   (no put)
>
>The count is left at 1 with no reference held: CPU0 took the increment to
>1
>but backed out without taking the reference, while CPU1's surviving
>increment never took one. When CPU1 later frees its charge,
>dec_rlimit_put_ucounts() drops the count 1 -> 0 and calls put_ucounts()
>for
>a reference nobody ever took. struct ucounts is freed with kfree_rcu()
>when
>its last reference goes away, so this stray put drops a live ucounts and
>frees it while it is still charged and still on the ucounts hash, giving a
>use-after-free of the ucounts (and of the user_namespace it pinned). The
>symmetric interleaving instead leaks a reference (CPU0 succeeds and takes
>the reference, CPU1 fails and unwinds the level to 0 with no put), pinning
>the ucounts and its user_namespace forever.
>
>The invariant the code wants is "rlimit[type] > 0 implies exactly one
>ucounts reference held for that level".
>
>Take the reference on the 0 -> 1 transition before the limit is decided,
>so
>the thread that raises the count from zero owns that level's reference
>even
>when its own request is rejected; the rejecting path then unwinds iter
>through do_dec_rlimit_put_ucounts(), which releases that reference when
>the
>counter returns to 0. The get_ucounts() failure path is unchanged: no
>reference was taken, so iter is decremented without a put.
>
>Fixes: 15bc01effefe ("ucounts: Fix signal ucount refcounting")
>Assisted-by: LLM
>Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>---
>
>Notes:
>    A reproducer, available on request, wins the race within seconds
>    under KASAN or rcuref debugging.
>
> kernel/ucount.c | 25 ++++++++++++++++---------
> 1 file changed, 16 insertions(+), 9 deletions(-)
>
>diff --git a/kernel/ucount.c b/kernel/ucount.c
>index ec8b1445e287..44a78ae80579 100644
>--- a/kernel/ucount.c
>+++ b/kernel/ucount.c
>@@ -308,23 +308,30 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
> 
> 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
> 		long new = atomic_long_add_return(1, &iter->rlimit[type]);
>-		if (new < 0 || new > max)
>+		/*
>+		 * Grab the extra reference when this walk observes the 0 -> 1
>+		 * transition, before the limit is checked: the thread that
>+		 * raises the count from zero owns this level's reference, even
>+		 * when the limit check below rejects the request. Otherwise a
>+		 * concurrent walk that raised the count past 1 is left holding
>+		 * the surviving increment with no reference, and its later
>+		 * dec_rlimit_put_ucounts() drops a reference nobody took.
>+		 */

I think this is way too long.

/* Hold extra ref on 0->1 transition so failure doesn't leave unheld ref
for concurrent dec */ ?

Feel free to bikeshed, as usual, because sometimes my comments are
^W^Wadmittantly crap^W^W


>+		if (new == 1 && !get_ucounts(iter))
> 			goto dec_unwind;
>+		if (new < 0 || new > max) {
>+			/* undo iter too, releasing the reference taken above */
>+			do_dec_rlimit_put_ucounts(ucounts, iter->ns->ucounts, type);
>+			return 0;
>+		}
> 		if (iter == ucounts)
> 			ret = new;
> 		if (!override_rlimit)
> 			max = get_userns_rlimit_max(iter->ns, type);
>-		/*
>-		 * Grab an extra ucount reference for the caller when
>-		 * the rlimit count was previously 0.
>-		 */
>-		if (new != 1)
>-			continue;
>-		if (!get_ucounts(iter))
>-			goto dec_unwind;
> 	}
> 	return ret;
> dec_unwind:
>+	/* get_ucounts() failed for iter: undo iter without a put */
> 	dec = atomic_long_sub_return(1, &iter->rlimit[type]);
> 	WARN_ON_ONCE(dec < 0);
> 	do_dec_rlimit_put_ucounts(ucounts, iter, type);

Yeah, the rest makes sense. Just change that.

>
>base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
