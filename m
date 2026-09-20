Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D72DF6E6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910266; cv=none; b=qZlwTHREKiLc4wKUeLONGiWLLH/3UQihvzhRjh3kQ7VlDoZiJzIkmXWSogO4BvdFB287Pn4mSnxi82RcgdskxUO3fA0y63iRj8/9sPg4vq7RP7gz075o3h2Ki/tEWl7Kw3DjgbJyAoh82lqDNhZ4oTTXZtofXmJQHl9dYz+5Bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910266; c=relaxed/simple;
	bh=vq5hwZUUTnC7KyaNKmShRfh1po6yHBI4+zsG8WYRs0c=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=WPMpFD58qk74XXmKK3WFC05fDVaTj6In3ArO6lrgMgWQ86qAxv8/JHs98+SfYve+63ZLFUyyJ3xv3Ne0kmm3awVVv3UZpAxWI08rw2gKdtGLb+l0YsB2YDGxduhQmNGzIyM/gCqPvM7RnNpIqggyMKNExcmG6LU7GO+lw9/P+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b8VOSubV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MJlYsr8O; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b8VOSubV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MJlYsr8O"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789910259; bh=YPud8n9YX/Q5qXazlKtMh5b
	k3mlVh9e6T35H/XxH5TQ=; b=b8VOSubVaevhFvOpXydc59h/GBL90fqlt9q8bakBzRQiP9Kqft
	OakbLLN2xTqBA3rM5LlcnM0EEZP2k9IpW3gQE2h+cDe2SyqW/1yQ3aZPG8lTeTNnY+T1GD6SiUl
	tmXP1QsOJoeWevSbw/hQZxbu2fXZykh8WALsvPDqfEM0ybk0ztF9EQBUwo+/ngVyL11gVoYTk69
	ihEKbABWXVhVm1n2/BTwsZrB4KIR5gXvPSLz0bBbDADufdE4iCpMMUqNKoApSNfwvQLwpTiBlRb
	KMA1XSn8XteC+4jldX8pOR+TDZSxOlSKsqiVZxG0utjeXzd4L0zw3PFHaJoWP1uzqcg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789910259; bh=YPud8n9YX/Q5qXazlKtMh5b
	k3mlVh9e6T35H/XxH5TQ=; b=MJlYsr8Obh4GMXRGyOZPSK2mrtGlpoNAwt68oKgUx1gZAOAx9G
	jTlPTS+Vq61wK5xiUD0WGpgcRy2OAlYJN7CQ==;
Date: Sun, 20 Sep 2026 14:17:39 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kunwu.chan@gmail.com
CC: brauner@kernel.org, frederic@kernel.org, juri.lelli@redhat.com,
 kees+treewide@kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 paulmck@kernel.org, peterz@infradead.org
Subject: Re: [PATCH] kthread: Annotate lockless to_kthread() flags access
In-Reply-To: <20260920070750.2871923-1-kunwu.chan@gmail.com>
Message-ID: <8DAE04DE-4304-4C5F-8A99-CF905A627A36@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 September 2026 08:07:50 BST, Kunwu Chan <kunwu.chan@gmail.com> wrote:
>do_exit() calls synchronize_group_exit(), which modifies task->flags
>under sighand->siglock:
>
>	tsk->flags |= PF_POSTCOREDUMP;
>
>The sanity check in to_kthread() reads the same flags word without
>holding that lock:
>
>	WARN_ON(!(k->flags & PF_KTHREAD));
>
>PF_KTHREAD is set once when the task becomes a kthread and is never
>cleared for the lifetime of the task.  Since PF_KTHREAD is immutable,
>the check does not depend on synchronization with updates to other
>bits in task->flags.
>
>Use READ_ONCE() to annotate the intentional lockless access.
>
>Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>---
> kernel/kthread.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/kthread.c b/kernel/kthread.c
>index a3f95c90456b..cc8cb5d3eab7 100644
>--- a/kernel/kthread.c
>+++ b/kernel/kthread.c
>@@ -81,7 +81,7 @@ enum KTHREAD_BITS {
> 
> static inline struct kthread *to_kthread(struct task_struct *k)
> {
>-	WARN_ON(!(k->flags & PF_KTHREAD));
>+	WARN_ON(!(READ_ONCE(k->flags) & PF_KTHREAD));


Nice! Thanks for the fix!

Reviewed-by: Bradley Morgan <brads@mainlining.org>

> 	return k->worker_private;
> }
> 
>


--- Thanks!
"I'm not a very positive person" - Linus torvalds
