Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD13B6366
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170044; cv=none; b=Q9e4ABVQDVEu5loSlv/fzCoNos/hegObOKvKHfY1W2gx7zGL4iVQ3pt+tUzvP1aPvpKK3+OcEqIBMGuYz1TFJ3sKswcuPOegWYbE/z1oYDZYTe1akqVvfZA/1sJj7XSV5/e3I2ZhPMCZFQgTrG/0ylSmut5L9fLYAWtfNjtAeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170044; c=relaxed/simple;
	bh=rCDRvdP9RM+HnoUk7St80TTE4H1tSy2Q2/m0HwpwLmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lwfbo7m+Fq02HUmUWYnq/4ESbO8GWlnxpkKz5llHCSF5v6/y2hXie0kCY/bCv6QWwSgfdwC8PDgo39CQ/EwMlCM8PGdLwetO1aOh7RpvCrC1vMRJfkGzM9YJtXUTjvlSIWqxkfqdAGTMK5XZHgg9RZ8AJ6rkkEeEqlkbqzy6V/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A08mQN/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A08mQN/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB8F1F000E9;
	Mon, 31 Aug 2026 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788170042;
	bh=UtTVr2Xwd+6TFnxI3l135P9+yLFy1l7Vkp9CyWOxHeU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=A08mQN/fW6nn9T52sDtt9zhc3P4BfPos6dZB66S4XQ6vj6x6JZ8axD2AfHvDUBbsh
	 3BpgiXdKZpY0lyMXcAjYbmVPzCWXMdbinJiNFul8fgs3S0rL047Jga09NyhFqsFGmG
	 jJAhjGuo0wTMS6K2Ungv7781B5qy2Dg+8nXH3/ONKAxwvIqCKN/NSxj5aM7TE0PwJb
	 q6504+N4PEuMB8kVMmfzyddi/AD4jOC/KwMZcFIozCeKMXTe8BMFW2kjT2uZkpRedK
	 IssApPF1Pf2Hunr3VUObW6f0PRx1sgZr+qI+rbVGXp/E0ZJ5HBcCFbgja4SVe1aKZs
	 X1Uca3iOENigg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <87zey3fep2.fsf@email.froward.int.ebiederm.org>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13> <87zey3fep2.fsf@email.froward.int.ebiederm.org>
Date: Mon, 31 Aug 2026 11:53:58 +0200
Message-ID: <87pkyyd39l.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 30 2026 at 17:04, Eric W. Biederman wrote:
> Thomas Gleixner <tglx@kernel.org> writes:
>> Something like the below?
>
> Yes.
>
> It all comes after
>    ptrace_event(PTRACE_EVENT_EXIT, code) and
>    coredump_task_exit(tsk, core_state)
> so should be completely invisible to userspace.
>
> I don't see any problems with your proposed patch.

Let me write a change log then.

> I am pondering what it would take to move
> "flush_sigqueue(&p->signal->shared_pending);"
> into do_exit in the group_dead case.
>
> Perhaps exit_signals could perform the decrement of signal->live
> and return group_dead.  If so all of the work could be performed
> in exit_signals().  As a follow-on change of cource.

I thought about that too, but that was looked too scary to me :)
