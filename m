Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987153;
	b=b/Ts3MHEGL7KcAuiJad7P39jshS3SnuJSZwVjuU95JTrbENQyzVjll1II5TKxIvvE1A/
	 LND21Pl72rzs5rejTNCvmoHNPHlyHwTfd+R8NMk8cUnW52LmbMlFNMzdPHvXxjHmw8o8o
	 DQZOG+yXTjUaBIEiJeHHESqKQKfR2zSGdz4YRxE1VI+m4E5m1f8w6Mg0S+qA+zhqvlJ8h
	 AtHCYQOm9keixzvgNSokA/I8/PD0xExT8xb9yMLH2KtuO+7K8l4mU3xYy85lm3DGFxnYi
	 ZTbdYWDDuvZypOXi1EV2yVB2tQcPo+GbNXz7fCCTEkhLWhLxpm5T3vSL6bsQAUB5T7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987153;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=IiSLrqvT3z3N8mBQqM552Aaw61FK1wtJzOEgj7mXunw=;
	b=rbVMOcqumLrTfLQCh1CFqX9cd8C3RiOKsjWnzjrR9DUnWNXznLTPqa1wd+D65n/K0PhF
	 f6FVpZoxaMXbZ4QhmJn0ArPhBmsILp0/3VvA9K2dzzTgVG8PKRdoUbrdkqgML5ZzkzMJd
	 XyUf+zmwUO6Na1ZELY/vKGl70dyPjZzMDoOnH98tZOv8J5Ui5VvRhz/Q4hqE1c7jN8oys
	 ih7iqbTatRHootl7IXSLfgFKPlCYxVkSLogA03TCOQISvq9Bx59W7DxmiqeEH2Wb54O8v
	 287Jddzkq1zF6RqOu4lgiQEDWqNEAieynmoIrq745hTu60hpT7LlB8Dkiwk/q/ORkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g/Cpwlnq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35575606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g/Cpwlnq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103FB1F01829;
	Mon, 26 Oct 2026 03:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987153;
	bh=IiSLrqvT3z3N8mBQqM552Aaw61FK1wtJzOEgj7mXunw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=g/CpwlnqmJS9sd4aRP94PeABek1er4eY/5j5npwKDg1QIIS80diGWpjqgw1oLYL6y
	 ffDkcRbRAY6hctRJOcrxfZIfC1Qb4R4+LzwcUFY3QiIwq8UP+6EqvbDhT66pvrtLOL
	 nj9fS6pidWGGR6WBOmRQm4IejqVmEJrSNwK8Ep81J0aZCiKfsaBDLmh9mzCyaIxdUD
	 nt1TZlIP5zCpEvTEvI+U21xBC91jbt1iodqFPwcFWGWMlLKSJAOKn3aEoii1Gj//2h
	 39BN8qsmcvqn9SzuHrynmnay+o9juWU53Q6ZvoEgxw+O4WfidsiKdtqYu3Se3hgu+0
	 vCFFRuvo/jRyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 072AB39EA761;
	Mon, 26 Oct 2026 03:59:13 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <at3ojiqQedHoj3HO@gmail.com>
References: <at3ojiqQedHoj3HO@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at3ojiqQedHoj3HO@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-25
X-PR-Tracked-Commit-Id: 6541fbc942f3b63bb8bd44e34eee6223e0abe719
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed2bc044a7c8c9759bbe1165b8e487d07dd53b73
Message-Id: <179298715175.2448250.12005580613831942087.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:59:11 +0000
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

The pull request you sent on Sun, 25 Oct 2026 12:31:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed2bc044a7c8c9759bbe1165b8e487d07dd53b73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
