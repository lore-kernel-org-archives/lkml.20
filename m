Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1614438036
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823315; cv=none; b=LQ3MO01eWrnjmaGx9GfH9LlNxEtXp6vdAZ7frz+dP2gedMvmmDOR6aAa0hzC9tCmVgf4Otbn7Fb8mzyJKd3jH2xCp94EuFpIFIYStUJ01w2ETEGEVja5Wj1l1vaMdKTAWp1A0epWI20KfqjDc8C67kjccVxqkLvWi/AIENApJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823315; c=relaxed/simple;
	bh=NMp2Eqmhe1sjZXQlaSwMnuWTIPwsaYKASkpfQQS3mbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mWF/BkPggL5svjcU4pAZCGqkGNuUoS8drATnqRVBCRSV+7cV4EC/Diqnu76NAacAPJnYACsrLux0Li0Ai27GEExvaXKBN3N92oNaj5VzUMuD4rJ4CuQGvfcFXOwo37HS4miNEWu1H/Gh6O1/dpTmIX6fnMeKRH8sIg5JrT19ezE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPkyLRK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPkyLRK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7652E1F000E9;
	Thu, 27 Aug 2026 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787823312;
	bh=rYiSEsej9QS/mI2CHB8mXyeFmXDZ4KjDOa2Px4Yi/6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RPkyLRK/y8vOKbl5FDSLyW8Zqhh+o1Ugpsd5cHDQAhu5bBR+D9fMJML1kNd3lBldZ
	 Pk8YSgNQew0tafEAyJHk2A3bCAwSbey4wNMj4GLEMnbfkBU0lx8hGf7IPhV36F0mqY
	 dWX9FKRgDbjtIJBFYRSFdXVXJNuLVl8oEN4idO9FCVaZ9kaU5V42hz0twm2qi8Trkt
	 8dRaTUlMsrbySWZe280WsppXQmLbMQCEYQ36wViV8DrqkzOZ9oLEYGF2ffVl7l7TSq
	 htITJb0bcm/dUQVskw35onQZM0T1Ea7Xtm/6VBpjWQXLbsOkD4KgcYFOfsR5+iNwf1
	 YHxTcZEZmTMFg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Oleg Nesterov
 <oleg@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Hyunwoo Kim
 <imv4bel@gmail.com>, brauner@kernel.org, peterz@infradead.org,
 anna-maria@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
Date: Thu, 27 Aug 2026 11:35:09 +0200
Message-ID: <87se3zgb3m.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 26 2026 at 22:29, Eric W. Biederman wrote:
> Could the posix timers cleanup be moved from __exit_signal in
> release_task (which is really for cleanup for zombies but has
> been historically abused because it was the only place that
> knew when the whole group was dead), into somewhere in do_exit?
>
> Say near where hrtimers_cancel and exit_itimers are called.

That's only for the group_dead case in do_exit().

But a single task existing from a process needs to clean up
task::pending, i.e. signals which are targeted at the exiting task.

The safe and obvious place is to do that is _after_ setting
task::sighand to NULL because that ensures that no new signal can be
queued and nothing can touch task::pending anymore.

> Then perhaps move the posix timer disabling before de_thread?

That does not work because between that and de_thread() any thread of
the thread group can create a new posix timer unless we prevent that
somehow in timer_create().

So in any case we need some mechanism in posixtimer related code to
handle this situation gracefully.

Thanks,

        tglx
