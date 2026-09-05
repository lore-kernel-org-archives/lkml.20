Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714F40E8D3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788593258; cv=none; b=dznaqKlWf5fHlazB0XnCwS+rar+aeI852WABb3ryxtsTdm8GiwPO41V/ZnBMV0LqBr7CgKmZvdD4oe4fkGgDlHlpqqzHpjUfcz4EWg9rT/tP4f9VCwKofdSeuKHI/z/mnHHsjT+4b08JStfvgbzf5PSfZEnG1PpSbdndVYMTGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788593258; c=relaxed/simple;
	bh=rLJypAP5fMaZnmD/EDx1B3p7qEyMFoscrHho7TdU5+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oNqd9FIdkyayJ+gqGGLRt8xwVzDrdo1gkTxA6kgbnWgMQNshFJImbjmXOHqsCs3uAr/VG774/Sp+9ELTVU26e+w+g7kDK2CravlnG6vCP5mjKQNSYj7RHuGxarue7pIoARW1BpBHl7M50Ol5XWpEe6NFijPfbhdnkrKIHZ1Dbhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPl2nY5l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPl2nY5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C21B1F00A3D;
	Sat,  5 Sep 2026 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788593256;
	bh=O06zzEhIbbk6DBYFrqErtT0v7PW5HwZKlZExpbJ4EGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GPl2nY5lUm/mmsLN13awTAF3Hx03gbJ4Gdn27eDTOHwLeKdbni6wkRJWen7jUYLJl
	 Rk1sRrG4J8cFNUSOjAuDVvsxKq+Zo6gVdrDCxwgK6PeG68tGCSFn7dlmnTu+pzkWhN
	 McGFDv2NJX/DsVjTzkmgEVXowlDs21UgK9SL9UcbW2fXGJZ3B7vzrzK4a5FFZn8p+F
	 ohYXIqj+AYpd1CVdRxnvPUJZuSs7OYZq6vN3X16cZ0FSylykcYZsbVPC3wman6UlyQ
	 cY3NgdeQN6kBbjfd7xXKprsHJG7X0qSYYx46ctXYKDH8tdII9x8kIq7JJyuQ7/jlzQ
	 PhHtjF9WIhIjA==
From: Thomas Gleixner <tglx@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ye Liu <ye.liu@linux.dev>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Marco Elver <elver@google.com>, Ye Liu
 <liuye@kylinos.cn>, Yi Tao <escape@linux.alibaba.com>, Tejun Heo
 <tj@kernel.org>, Bart Van Assche <bvanassche@acm.org>, Christian Brauner
 <brauner@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
In-Reply-To: <20260904190742.7231d56e@gandalf.local.home>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-2-ye.liu@linux.dev>
 <20260904122536.1079b279@gandalf.local.home> <87ecf87m31.ffs@fw13>
 <20260904190742.7231d56e@gandalf.local.home>
Date: Sat, 05 Sep 2026 09:27:33 +0200
Message-ID: <8733vo6tui.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 19:07, Steven Rostedt wrote:
> On Fri, 04 Sep 2026 23:17:38 +0200
> Thomas Gleixner <tglx@kernel.org> wrote:
>
>> No. Scopes can be left by any valid termination mechanism. 
>> 
>> The only problematic case of leaving a scoped_guard() with goto is when
>> the goto is actually implemented as an ASM goto. See the comment above
>> arch_unsafe_get_user() in linux/uaccess.h.
>
> Oh OK. I was under the impression that goto's could cause undefined
> behavior with guards. Or is that just when a goto jumps over one? Or is
> that OK too?

Jump where ever you want. The keyword is 'scope'.

The normal visibility rules of variables in C scopes apply. So if the
scope for which a variable is defined is left and the variable is
defined with __attribute__((__cleanup__(cleanup_func))) then the compiler
inserts a call to 'cleanup_func()'.

The problem with ASM GOTO is that the 'goto' is not visible to the C
compiler because it is burried in the asm inline. Clang detects it at
some later point and fails the build. GCC simply emits buggy code or at
least used to. Haven't checked whether that's still the case.

So we worked around that by letting the ASM goto jump to a local label
within the scope and use goto 'outofscope' from there. That makes it
observe that the scope is left and the cleanup call is inserted at the
right place. See 3eb6660f26d1 ("uaccess: Provide ASM GOTO safe wrappers
for unsafe_*_user()")

Thanks,

        tglx

