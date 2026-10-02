Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF902343897
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922840; cv=none; b=IhwG/qjUkggNYTc3t2lQTxGhOVrEr7mvJUWivwAFCuehg3582+N6+Md1uY7Fowk2cMxpkDc5EESWqTtiRUJot0fO53nNt//0asPc9nF0wsKzFwGLkjHMAbq5JFOxZc9DLbMn+xBaWHXAvQ98wyYK3qqc8ceQFQvJEpkqw7HivQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922840; c=relaxed/simple;
	bh=n+vhcNYcK3pLzBPDgSN4V5syjS7qp3HfP8LbMIW21pc=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=CO6FF0pOGR6GlerRdxHjmiBbGiGNznk+6lSTfnfrbUSSZ5lvbyO72CvPUWrRkMSYE2/L01dcn63AM62yp6iKUkCRWs8JKroIvR2xs2s2+jPZmdoXAFRrdPzHqukKtzlfkR7SV5gQhHyBOiQQ6LQu+3m7GEc4ZHKGZWXOTS7GIOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ak7xiozJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kFzI4Zv0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ak7xiozJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kFzI4Zv0"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790922832; bh=KCJ/X8tI4qft4dfUuItHZf0
	breCYWmSsRIEsfTBtN6o=; b=ak7xiozJ7R12xydXe2sW2podQvGl+ox4HVXOIjlS2TqcaIB/4j
	GXSuPKUwWjxgnnIEpVdMmIY37a2Gg4rxnc96a2T6Vqfwr/yuIRHLG4y70AlGdVjW/NuZjuQsoW/
	I7/RA8GDYzYD8N2QSDdCg0mVGPwzsb9VBqAGCw9PxnO/dsXJm57QOLZadLL2dyFOBWAiN7usOL4
	R+oqIyY3oyjiEQJBpMBiOkkvPG8RzkbeoEDnX3+MGHRM+p2W/ZevhjZJK2VzVlwo3bAoe/dX6I7
	hL0L0hDDrZXCbGUmn3vLwveIo9SVQzhQq4jOjy+LrwpNCmWYl+YYNUNJyJWEUy21GPw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790922832; bh=KCJ/X8tI4qft4dfUuItHZf0
	breCYWmSsRIEsfTBtN6o=; b=kFzI4Zv08sN8/SgD4VejJtNr3JiTwJ/0k+EYhTiN2FoYFK7xcN
	PbJKjSJ3KZQQp93NAGGdPfZIvKzYobVnpcDQ==;
Date: Fri, 02 Oct 2026 07:33:52 +0100
From: Bradley Morgan <brads@mainlining.org>
To: bbnpreetsingh@gmail.com
CC: akpm@linux-foundation.org, brauner@kernel.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com, ptikhomirov@virtuozzo.com,
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
In-Reply-To: <20261002012141.7-1-bbnpreetsingh@gmail.com>
Message-ID: <9FE0894A-D550-435A-954C-9D5CF7061499@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 October 2026 02:21:41 BST, Babanpreet Singh <bbnpreetsingh@gmail.com>
wrote:
>KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
>under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
>WRITE_ONCE() are enough.
>
>Reported-by: syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=c382ee653fd70f5cf1bb
>Assisted-by: Claude:claude-opus-5-5

Coolio

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
>---
>Compile tested only (gcc W=1 and the KCSAN instrumentation diff); I
>could not reproduce the race in QEMU.
>
> include/linux/pid.h | 2 +-
> kernel/pid.c        | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/pid.h b/include/linux/pid.h
>index ddaef0bbc8ba3..05a0084dc9537 100644
>--- a/include/linux/pid.h
>+++ b/include/linux/pid.h
>@@ -264,7 +264,7 @@ static inline pid_t task_tgid_nr(struct task_struct *tsk)
>  */
> static inline int pid_alive(const struct task_struct *p)
> {
>-	return p->thread_pid != NULL;
>+	return READ_ONCE(p->thread_pid) != NULL;
> }
> 
> static inline pid_t task_pgrp_nr_ns(struct task_struct *tsk, struct
> pid_namespace *ns)
>diff --git a/kernel/pid.c b/kernel/pid.c
>index 95b8ccfa82690..adf7216067684 100644
>--- a/kernel/pid.c
>+++ b/kernel/pid.c
>@@ -411,7 +411,7 @@ static void __change_pid(struct pid **pids, struct task_struct *task,
> 	pid = *pid_ptr;
> 
> 	hlist_del_rcu(&task->pid_links[type]);
>-	*pid_ptr = new;
>+	WRITE_ONCE(*pid_ptr, new);
> 
> 	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
> 		if (pid_has_task(pid, tmp))
>
>base-commit: ed14a591175bb5f56c2936b082cffb9e4b935e6d
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
