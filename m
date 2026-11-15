Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767801;
	b=G9nqb5M7SENboSQlwd4905PR2xYTX9CsYcnpn96urCu81ySkF7rRGQhUgASMvfn+Wmdr
	 r+3wUPqR3WP7y3r56V7igZ58IxMRaZQTfh17MAxQWDjN26DbNQHNLNEQ3d/t2wCl1Zd6a
	 4xsIAuN+ctbrLiyeEYr2ha/5BTd1vfsKct4h2MXEGcwtSiXv3nmIn03Li8b5GDxoVj7fS
	 YDR+ABjkV9EyfHRG0vTSBgAMGOHVYu0j/cPoQLhYFZ6mEcGHZLTm6tia4aOtmDmdKW2yg
	 OedhrU3Unhli6WUhO/rywck3TajKmK2j2n3Pwyt+Q85yam4Rkcsz/r59Sq4aV3d0cVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767801;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=q6pvGLyeGonqbrAANK6Qe16VVwDtSeWqcBtT7YtLN+g=;
	b=sYVynkIDP0EmRilvH+WulKZrho/guBnXETZxAOo6xjcZH1b7bHq3Ex1n08qoEvTuJeDy
	 QYkEZsimmCbAden6EbVzuPoMNa0YH0c5toYIzJ/5QgOZmLrX5Y1wW7I59KbeHDnkmYxEB
	 Ou2QdNySc3XsDmohcOOzMAiuendB1T1KQwUJ0mmQ5AyHHKOPHJhiHxW8SLJpz241wKviy
	 HLHZJJU0MWR/quPfXvum9mg4C/fFml6qfsZN4ko/HVqvZdNbUBs6TQO0doSZBYPTubkeK
	 2j5wU7+NJ22xHA5frp0zqGjCSKPCeygoaxHHfg3Tr6IXiZb74TAY1lQVR1GM44ebx7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0YMXkOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25E606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0YMXkOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B5B1F000C6;
	Sun, 15 Nov 2026 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767801;
	bh=q6pvGLyeGonqbrAANK6Qe16VVwDtSeWqcBtT7YtLN+g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=N0YMXkOcbMqZXH6dWAq4/fnweAidcWwiTw1YnQLubETWzriFv5NOaOJMFpxxXHLIh
	 P0/gXjyHoglcYsAFK5J2xOhWbwBvYgMslCLnHe6S0OnIxhSbTSeqsC75YBYGCHkB7p
	 Y0lV56giwjupBD92QLeCKQbPw2S/pVHryhkd3SnJBfUqz3QYBboiShG4BRWRb3UDAy
	 F7kSKK9AlaN/Dqe1W/37nLfdtt8L/uFcemmkUuEdhGw5uAcjNH71GlNw4af7kbBu8l
	 Ls6HAj3i1xJjZ/cR1kTNmhsqr9ax+46otcmUE8w3hv+XmRUpXJCPd3kgQ1aNSJY9bv
	 +6B6MgWQBvGIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3443808232;
	Sun, 15 Nov 2026 18:36:41 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avmkpJ0D0IiQEFqP@gmail.com>
References: <avmkpJ0D0IiQEFqP@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avmkpJ0D0IiQEFqP@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-15
X-PR-Tracked-Commit-Id: c1b96ba87e3caaa701d6dba254e58db7cc3c99be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0feaf5349e0a0521de3406343df32954801784d9
Message-Id: <179476779974.2691368.11733913500812106171.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:39 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 13:25:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0feaf5349e0a0521de3406343df32954801784d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
