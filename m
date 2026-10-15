Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E0421A07
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081004; cv=none; b=Xgd0FSb1UBSBD+VYx9NqeRgI3bEiNb49BwEGGvRXxYC9iv/0Cndpj3appGJdA2t7kwOjPeSV3AmIBlGydF1IJsypS1fBUiUG3ShljUR6s7j1ON3OMV7pP4sm3HvHR64nhZTXUm/iRNDVig91jD63hS8MahiRNksbg/eMvshKVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081004; c=relaxed/simple;
	bh=y33Oa0d5xyPoRA8yPA8pFGijt5la29UUqU+SWAiagdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euzUr9rQ211cuMzAOqx8FhIqCBJznV97KPkmZmX2Ylq0Rl99G1uv/Ycpa1dc8IE8SlDjvpmaZXueo6s6hCjy8O7YW2dZtVMaBkwDdA/rZgMtihaXPWhFSSKSPCLuy3vxnih3kDvR3ABeAAPelrGS7rxNnRR//hEM7SDBBdKW3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5MEIDck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5MEIDck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116311F000C5;
	Thu, 15 Oct 2026 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080994;
	bh=5ej5ardrA65UZU6KUi4c494PUoSYJOjtrTbp029+Ouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N5MEIDckJQOA5V99fH9dmX0lTZcDqLHJRH5C/CCBUu9IYQJIoRmYudwdXs0pnBVuh
	 RGpRjNqnuqKj6lpAvlu28YKFSuXoLHj/28qkx6/DuJutcU7mmHwUMqOHNTxim+hMgp
	 1KDmm3VwCS7u86ndTjX1KZOjEBqRngnmLT4ii3RwKRNQEg9AANzlXdctmnPsKlcwHk
	 z7+g5NOLk4JqpKnJerViqfVJwM8a8xdBX6bLLqmdjevwT/gim5+SzFzewswTSFcCmF
	 yizK7vH7VCk+IPkpsYt+eIvnpfO/D1QILv5xXRmOQ+0YQ+BvG0sKjTwzA1lVQgAh4N
	 Za1QcIBvyFnUA==
Date: Thu, 15 Oct 2026 09:16:33 -0700
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, tglx@kernel.org,
	peterz@infradead.org, luto@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] entry: Fix seccomp bypass after ptrace with TSYNC
Message-ID: <20261015161550.79fd37-kees@kernel.org>
References: <20260713025712.416366-1-ruanjinjie@huawei.com>
 <as9Jqi5BvSZWfxj8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as9Jqi5BvSZWfxj8@redhat.com>

On Wed, Oct 14, 2026 at 11:21:46AM +0200, Oleg Nesterov wrote:
> I agree with this patch, but SECCOMP_FILTER_FLAG_TSYNC can also happen
> after syscall_trace_enter() re-reads ->syscall_work ?
>
> And this race is possible even without ptrace, SECCOMP_FILTER_FLAG_TSYNC
> from another thread can happen after syscall_enter_from_user_mode_work()
> reads ->syscall_work ?

Right, and that's expected: TSYNC has never covered a syscall a thread
has already entered; the filter applies from the thread's next syscall.

It also only matters for a thread's first filter. Once SYSCALL_WORK_SECCOMP
is set, seccomp_run_filters() loads current->seccomp.filter when it runs,
so a thread that already has a filter sees a newly synced one even with
stale work flags.

> I think we don't really care, but I don't understand the security concerns.
> If debugger controls the process before it installs the seccomp filters, it
> can simply nack sys_seccomp().
>
> In short, does CVE-2026-89603 make real sense?

I don't think it does. For the missed check to matter, the thread had
no filter when it entered the syscall, and the tracer had it stopped
there. That tracer could already make it run any syscall before the
filter existed, or, as you say, refuse the seccomp() call. Nothing gets
past a filter that was in place when the syscall started. I'll ask
the CVE team to reject it.

The patch is still right as a consistency fix: seccomp runs after
ptrace so it checks what the tracer left. arm64 re-tests the flag after
the ptrace stop, as powerpc, riscv, and s390 did before they moved to
generic entry.

I've sent a selftest for the ptrace case, based on Jinjie's reproducer:
https://lore.kernel.org/all/20261015161348.i.779-kees@kernel.org/

-Kees

-- 
Kees Cook
