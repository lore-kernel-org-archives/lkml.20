Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9572C4CCDC1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267307; cv=none; b=ay6Ue1+XOxmBVByCN8x0tThl6sekow6VoiEhq9SJsXEhfdrdo9M2cwjlLHPux8z7EBfqgDWKTv3bmGI/sNJuaDVMDQADzchp8+2QZck+ca35cskjvanVJRQGKzNa/fUJFzUPn33V9F9PkAzNsQAq5h9HZ+GK0Euy6h2fQJAZAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267307; c=relaxed/simple;
	bh=3UkBrl8eEH+ekvn7kxaY6vHpSu3PodAyji8TK5ym4f8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WxfMHg4Fq5npDRopEvFTNxRBFqvNSb1mW5c+7FQa00p0Eq1XzrfVmQEFFOUHie5NC3sseMyOJ/cASs+UxVjPVaLFE2gHwOtkTsCz4kiT6DTVcukR8uHBTUKWOXpdyJE5/yPo9Ka2tdiIBOtAaDFIuiGWEdEY37W1t3bfuHy3qZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEyqZ4O4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEyqZ4O4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ECD1F000E9;
	Tue,  1 Sep 2026 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267306;
	bh=C9XttuEfN88sa2Gj0np+QWUFhthbMe+QpJjAL9Tj7I8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SEyqZ4O47iTXRklq3WctwcvAqJpwbvGvXjIKXSRv2wUlfMAB0IeyKYtHo6f2N4z57
	 tSpdwO69IZSV04Yp0jLrFqqw3Al4EqYhFLrpJo0Gi4fuOAfnAeWbdWzwWRaaNZlavG
	 iYopOiYRSLkLqtVUhiI2h6JHzjPG1Ia8O3cvF8WgbbvUZe+WjMzSh4Yvz3Ddr3pyBr
	 /oT3KSwFA0R6W6he5M5BRE+ahRR7EeZ67AtYMZ/p8fl3Y2znKVb+XsysC8Tuc3xbSI
	 Z/Skg5wYNQTLuip4qK5EV8LwMi+sUP+W4Un+Bee3FEIGKbTXPtTsnvgsx+N7xxARQi
	 7CO1uk7Zw3YTw==
From: Thomas Gleixner <tglx@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Oleg Nesterov
 <oleg@redhat.com>, Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
 peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
In-Reply-To: <apV5A6IGNIe2Uh4f@localhost.localdomain>
References: <87zey8g05g.ffs@fw13> <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13> <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13> <87h5kad0mx.ffs@fw13>
 <apV5A6IGNIe2Uh4f@localhost.localdomain>
Date: Tue, 01 Sep 2026 14:55:02 +0200
Message-ID: <87zey1b07t.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31 2026 at 14:52, Frederic Weisbecker wrote:
> Le Mon, Aug 31, 2026 at 12:50:46PM +0200, Thomas Gleixner a =C3=A9crit :
>
> Is the following situation possible?
>
> CPU 0                                CPU 1                   CPU 2
> -----                                -----                   -----
>
> exit_signals()
>    spin_lock(sighand)
>    tsk->flags |=3D PF_EXITING;
>    spin_unlock(sighand)
>
>    flush_pending_unlocked(tsk);
>
>   ...
>   do_task_dead()
>                                      de_thread()
>                                         // acquired tsk->flags
>                                         // and signal flushed
>                                         // through tasklist_lock
>                                         transfer_pid()
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
>                                                            posix_timer_fn=
()
>                                                               posixtimer_=
send_sigqueue()
>                                                                  // happe=
n to see new leader
>                                                                  t =3D po=
sixtimer_get_target(tmr)
>                                                                  lock_tas=
k_sighand()
>                                                                  // passe=
s !PF_EXITING cond
>                                                                  // but w=
hat makes sure that flush_pending_unlocked()
>                                                                  // is ob=
served here? So that signal list isn't messed up
>                                                                  // pid_t=
ask() doesn't have acquire semantics


On some far fetched completely out of order CPU that might be possible,
but it's moot as it's already established that we can't do that lockless
at this point.

