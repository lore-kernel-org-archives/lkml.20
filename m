Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF53220687;
	Tue,  1 Sep 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263766; cv=none; b=MywYIErYaFpnGK8fEbLryB5H2NledqDvlsdekrhW4qB/NIY8TMQRrUSUrpEOjRG4aRu8eOb8ACvr4PSF5to6cboZ7XDmlYGdjfktAvMIALn9BG6/79jLYInf0VhW70Wh7JNUsOmSTdYXGeWQdRbz5xLMRbbDlO2J4dSkVnze2mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263766; c=relaxed/simple;
	bh=teH8A+bBnEF4sQeZAeIT9bias55KiKQJ84FqLPMuZs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqGp+j21I1bvroh50ga5xj6ohy1xSyk3GoANdBq3yej23An6+m8UOCXH1wLcvuxHz5UR5WEzovMh7YEhLsecjTAx+uZktKfWwCO7XGwUWklKIv/syImgdgFGXLLK9bhl0pUmfvMk+aKuyo067UNaZIKJ3vCuwLhKK0E7IS7ZJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=3puqK9nR; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="3puqK9nR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1788263387;
	bh=rBjyiusYlHC8sriGlE2givbV5vglKvP1HjQwOtmJkQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=3puqK9nRF/kD1Lr4BXRoYcalo2efKW79DisCn81azoN45h37Sh/tMi9d9BlpS1uNg
	 3ptSdiqNQ6qxUDv2d6doWH6xvTley7Ah+ejvGv4reQ1n1NwGULwvo7NjsQp4DuS4W9
	 fjL0HDTrZN4VoOgdjPDs7ADgHVm4pWwC75femYl8=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 139ACEBA71;
	Tue, 01 Sep 2026 11:49:47 +0000 (UTC)
Date: Tue, 1 Sep 2026 11:49:43 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wake
Message-ID: <apa71yN7lYR3FKeI@shell.ilvokhin.com>
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>

On Mon, Aug 31, 2026 at 12:57:26PM +0000, Alice Ryhl wrote:
> When a task is granted an rseq scheduler time slice extension, it is
> expected to finish its critical section and relinquish the CPU via
> rseq_slice_yield(2). If the task issues any other system call while a
> grant is active, rseq_syscall_enter_work() forces an immediate
> reschedule on syscall entry via cond_resched(). This may cause
> significant latency penalty for userspace lock implementations that use
> rseq time slice extensions when unlocking the futex.
> 
> In a userspace mutex unlock sequence:
> 1. The lock is released in userspace.
> 2. If there are waiters, the unlocking thread calls sys_futex_wake()
>    to wake a sleeping waiter.

Just out of curiosity, is there any publicly available implementation of
a mutex that combines rseq time-slice extensions and futexes?

I'm interested in learning more about how these two mechanisms interact
with each other.
