Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001671;
	b=kEVllRLzqCY0EJ/TWB8vM94Q6jZjpcWkNEG8ZnoW1b571diIzXgVENAedz3iRjnBM/9E
	 sNUID2vTwJm8ffLFsuz69pTrCcVMRpXneFh9EPUUlFK5vLjVB/N+f74tcEsBLaXabdZ7z
	 f1lGmA3puGw8jc7pdwwEZPEgbNEl8tPR/kHMA63ST2aekXmtT8t1Y39cOST3ZNZsiFzJn
	 X8kgOgOf4TZSwg/qYJpjh5Tm9jDGZDTQNifiQQtt/i30vUq7rMC6RauYrx0mLAjZ5IjCc
	 LVmqvr0DrCYgyPkHbSYXehpKmjCGoRWTmVm0amVm2BKSF2RXnGXgdY5WNUXULQjCXLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001671;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=rc+O1mmDbRXdEcnVDNxHKphHB4yijI6X/3l/03/5Ex0=;
	b=V5fMELNK4XvH1AfGum5XPSoGxNheC3sOHPKXtWZFXTo86mudy27yygTTvp00WvwZRPtg
	 ZBFDX83chKoJeA0t/FaRrtb74Zcl3Kgyi3TBekh1WaCl3prwXvgoUXrn86UNfzPNAEwdT
	 vjAtl8LpqQqNuEfCWvzXmebMd0Rh0YEHhUq4BByWbZ61m31wh12/8z+g651i8IF+OdaXU
	 U+JIhKtVU/hv7ONFgrmkLp+NrEWZ72LUahVhdbwTA3OkALNs1shwM9S5Z75Bg8Ji8/Z5Y
	 c+hXnlfOqCOtJbBt1Zo+muNkSkx0i8zP9o0xzV4TfK2z4CasH/iAu/t6HxmQb4XrfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9zkdYdN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C7606A326;
	Fri,  6 Nov 2026 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9zkdYdN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A641F0089F;
	Fri,  6 Nov 2026 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001670;
	bh=rc+O1mmDbRXdEcnVDNxHKphHB4yijI6X/3l/03/5Ex0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=P9zkdYdNJS8U7gkvetvxioKi3sSZUrWpdLXxQ47x6vNfBKX5+1TwuH27brW7fsdE0
	 rEbZKB8dE+3JXWjB6gSnDt24CCZWoxgOZOT11Fn/7Brh6uXNrhG4ayHZRnp45AZ28p
	 pbL+Gzyi3cxLmNLPUX+702q9HG60RFjpmpFwb0gs3kbPRl8ToyXpADbJtNxhFjzQ4b
	 FdcPqdhi5QfMGXKPFmw0MO9Y+vSHSkeAbYLhPx/ASfJcWTjncfKPwO+3Luzah4fEdL
	 k6LNMU38rzBcM18eNQEQ8l4fjXV7xYnLGeetx23CuKo4hLPSTIsXocZ3IkwQa8J4nM
	 dyhvILYUhMHrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B3BA3A549B8;
	Fri,  6 Nov 2026 21:47:50 +0000 (UTC)
Subject: Re: [GIT PULL] Few printk fixups for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <au2wcOTpkirvACU6@pathway.suse.cz>
References: <au2wcOTpkirvACU6@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <au2wcOTpkirvACU6@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4-fixups
X-PR-Tracked-Commit-Id: 8a7f26aa072a4e63bc3b1adfe649546709db722e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdeb84ed24e543930487f03f5243bbf83aebaf31
Message-Id: <179400166915.891032.9538037156695591653.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 21:47:49 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 6 Nov 2026 11:48:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4-fixups

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdeb84ed24e543930487f03f5243bbf83aebaf31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
