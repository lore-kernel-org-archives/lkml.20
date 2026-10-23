Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785486;
	b=WHH5bMXtG67LbSNxjPSOKJyEtpWD/DHyQ2LrjYdtnd3/2Q5qGkSN9uHvbjZ3u/XAqBQe
	 yVMY7gy+S1tBVmTZWEXDDWf5dFRbWE+iuJif1LAzYR8KK8182WTaW2pg6V76STXYnCJRx
	 DcMlbphAB8RcxYRF8Inj3xvVLRiqCAiHm05xxafJmyjftxwhOHt1vPhxMMw1SiBTTXwaD
	 /fjhWpbBGHrjT3t9DLw0RhQ9s6A0zXzOgbIQCQU7/rpLeUhZkslvJK/fLOCK50Yeyi9yl
	 SwGpO1uMXY7j9PVPcKFizrFEIO3CIkwwscoH9ZyS5cEblFK3Cd2GBo0JBmu3USmts4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785486;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=NLTqhCklQTL7qYJkIWtUxCUrr3Szn1ZQVftSLqDTCOc=;
	b=QFJvlM3j6nkLoP6XSNjah/hKWcIOyUPG4UTVingIuOL3GkqaQN+SEAo38lqmO6hd7kzN
	 KqW7OU3XkoSErmcyJGYyAU8BqDhMSdm0MpAxvCvxWaBFfDr9pK5B7hF450Rn2/8u46y48
	 cC3nJdT8d/Y3A+4p3Z4a/nvH+7TMfuJGBoge9dZtg7KlQgINviUFqU26hhKIycTNFOTN/
	 yH9BwFSQbfJBZpdQTHv/SOZMbRjwD6YWI5pal4xqexvuu9Wp529zy8UZFcz3NL10VVdhi
	 DXedIALSGLKDGy1e67gJUCkHKzy1JYlHSaQ/JmFj0CJKeKsd74My/vBbpSKZXDt+V/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G+/i7XJ8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76109606B287
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+/i7XJ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531AA1F01825;
	Fri, 23 Oct 2026 19:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785486;
	bh=NLTqhCklQTL7qYJkIWtUxCUrr3Szn1ZQVftSLqDTCOc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=G+/i7XJ8Ayo0XO/6BRwbf2r2B0CEGwnnis/Bahpbd7Wq4kITbUd9at2rVNcD3MteR
	 whDBKO7Ejw3YF+fxf8H7k1fSwr/t3pNuuNQyzXStRhhF4Hd2Y5Nu04v+qGfgpcWWi5
	 vWdm+CBaoGgJ2YN/QC/B4lYKRukOGQ4/COqNb7NxpXzc1WMVQlpMKK+JOkUN5uEULa
	 KXv4pab1YBDVQ697pmJuKHgeHadOnXjsDVIahi15PpKWjGO9sKRWkoVZ9FEJqlW1Rs
	 T/oVpQwll1t3jc2xtpLJAVIGtAKy+KcWWFhi9cKpno1SXbaiH2afsb0Sh90LSMOPj1
	 g3bT22Rruwsbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 489A9391B153;
	Fri, 23 Oct 2026 19:58:06 +0000 (UTC)
Subject: Re: [GIT PULL] printk for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atnxt9PVFpXO5wja@pathway.suse.cz>
References: <atnxt9PVFpXO5wja@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atnxt9PVFpXO5wja@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4
X-PR-Tracked-Commit-Id: 111153e8280b4fa8b5537c941264ee6dc71d71d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b212610d0b8f474f1eef70b9a5aa4b2ecfff788
Message-Id: <179278548478.1241373.17250026512143235352.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 19:58:04 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 13:21:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b212610d0b8f474f1eef70b9a5aa4b2ecfff788

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
