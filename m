Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791420;
	b=5SuYoh8Z/AcJg1u2ixx1hOnzv+rMTBwOoltWHmp0bUg1GXX+HSQQWQyKF7qFHMc/tEA7
	 cqgdKA0aGJ4fhT3+ZIl1kbEWPNTSNcCgnR3Patgp2OKoyrNLs7s7tCKXjKgpcoBjCrOa3
	 akPp1k5+XyQgVlDfzaaBKvWbwk0Vn9OK4hC9ZA5NUHdn3uP+FLQhl8m/+dBrNkFtzzzSi
	 T1+3mri3nCPI36fFf5YVpFjHMBhGJyXTvB1JchjuLrzfbV77mTLltkNJ2mre+zicbw4tN
	 Rc2c2Ixd4TRCi9rChTZyk6A2u4oIc5woaPma19irmQkZPfFVsGNIq4rand2Gydk4t9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791420;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=g879EE5PZ5LH3c4lKb3aZo5bk62IXbtKHzOs43VQIDg=;
	b=kdY2TugQ+qZd3W//JN8Gmtp2HNA66IOh0hWZEMI7toMI7bbi/z3l+PUJVz0ABG3HJGAM
	 HomzbIfSFHoVvOZNzpa0eM7weWSTqOoygbOg4m/D1jwp6ygM9AVpNNiS0Rl37Q1R/z/I1
	 aYirpldSmnQa+2xge7kczVkNYz3hipnZEfNf5Yr8el1e8yIKimaB9ck7App61teFWUFPM
	 qPa+bgTaT1lOkTg1r4FD6Dr1utSOga52lLXcD9mCrteWXZPOTKRInndZ7ien3BT6ru/L8
	 1thX0biC4Ke8J5OoYJNbx8rWYHJcHPupNWeh/28SrzynWejDoaAHvyWLMIPvurRcdpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=FHvDRjiK;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81288606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81288606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=FHvDRjiK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g879EE5PZ5LH3c4lKb3aZo5bk62IXbtKHzOs43VQIDg=; b=FHvDRjiK9uJbFx2LW8XcxFEQVM
	KLhP8yQpk7ikXv4nwSnnGwamIdQV2DY+VbtE2EONO0qwUeWZ3hQUciTIuPzzbMFJoyXpcR3waSplU
	eIPn6ZjJvm0S3SIqLojgG4DfZ4Vn7LTxbtQU5R6rGfXIXyAdAa1gL9QXeY1Hr6qFpxgYw/ioFYS3m
	1LKAQCK6C4nPILeL8OImv4nVnbBLJvuEM4u3RSvT+67e6EyaHIeyQG1yyGNhQ3tJoCndMEfIeAd9g
	2skNW8r4872MyLfv4DuMkU8mI8Z2TkeOP05OzfD/QeX/tdl19Pdcd1UXeJXvQSSso+3YnYNPdaefV
	Hr12SQ3g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOZ5U-007fwh-37;
	Wed, 04 Nov 2026 11:23:29 +0000
Date: Wed, 4 Nov 2026 03:23:23 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	kernel-team@meta.com
Subject: Re: [PATCH] kcsan: Don't flush the consoles while holding report_lock
Message-ID: <ausVjB1FRmcgwFQ-@gmail.com>
References: <20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org>
 <875wycc1jf.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wycc1jf.fsf@jogness.linutronix.de>
X-Debian-User: leitao

Hello John,

On Wed, Nov 04, 2026 at 11:57:32AM +0106, John Ogness wrote:
> On 2026-11-03, Breno Leitao <leitao@debian.org> wrote:
> > Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> > splats"), print_irqtrace_events() runs inside an nbcon emergency
> > section. In an emergency section, every printk() flushes all pending
> > records to the nbcon consoles from the calling context (instead of the
> > printk thread).
> >
> > With CONFIG_KCSAN_VERBOSE, print_report() calls print_irqtrace_events()
> > while holding the raw report_lock with interrupts disabled, so every
> > verbose report writes out the whole console backlog under report_lock,
> > as consoles/UARTs are usually slow, this is not good.
> 
> I am fine with this patch, but am not happy about the motivation. You
> are right that it is "not good", but it is "not good" because the CPU is
> being put into an emergency state when it is not really an
> emergency. Even if the report_lock was not being held, this patch would
> be equally valid.

Agreed. A KCSAN report is not an emergency, so it should not enter an
emergency section in the first place. report_lock only made the problem
visible, by turning the console flush into a hard lockup.

I will reword the commit message around that in v2.

> I would even say this patch fixes 59cd94ef8009 because
> print_irqtrace_events() is not exclusively used for lockdep splats.

Makes sense, I will add:

  Fixes: 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")

Thanks for the review,
--breno


