Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555890;
	b=nAs55o0Amnz2lZwCmmV+DqzB0CMaILkjmgqfKeQdGL3D3hswLFs4zmjVCZ9iuj5mKs4m
	 V9BgQ9VstIYAiN8bPgHr6Id9F0grklu0DwLSoqto+9MSM6i61zqmDnXLO2OaxYBJv08OH
	 l/rKoHES8nbqjPYsvxc3Hf0JPBkXY4LeSVumUd179xxX4JOYuWsJKfjMBD+0T9Wu2bArk
	 3L9cpRJ+SyRg8ZDMlpXoLSM5+ZYYvPrbzifH8WLzxOX4qbkE70+MYTRntoaloSRkU+qBw
	 DG/sKt62uARoEPOdWswOfc3cQmH0BZi2uss5QvnKB6USkBMUkhuaFXUlKTJxemi6zqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555890;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=USZqptZyZF9qRXxujp5/Y7iFIKw+OeYy9OeP8gBtg3A=;
	b=5tSzYIU8dp4oPi/kAcQidpqDqOGj70GRGc5cKqz41JPHKFwSFhmfM7SRJaWfPCUsgtp5
	 8+L/qP65u63EJN6ZpikpvLKhpM4FhwDR9wjLfOmhlb00nGdvfeqld/h5XCpVq83ejm7RV
	 +h6tA8q0a3eWLJsZq+cva3r4sEwSStnqtIxQNKKCahjmObNHhyOqW+5KK7xZyplW3WC1J
	 soUB7Rml2iNa6+yC9qOO5OP8fUF+vHQE5AnK/m39rHwoeXBZAmV2WZKZXrDb2lxxVhtz1
	 rlBEAwg5rR1ucbJRw/oyy7V6CDojxmsqXVdI6TPIUSyCuTLhKhxh86gfsAWpeyK4wLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cMj6qV4b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6793606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cMj6qV4b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27A61F00A17;
	Sun,  1 Nov 2026 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555889;
	bh=USZqptZyZF9qRXxujp5/Y7iFIKw+OeYy9OeP8gBtg3A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cMj6qV4bbN03ZNB1HCnewVsmDNbU2bJ3ASndtwFI/9U0BY04IX8qGVjf5T/oXdHrc
	 Pg51dgNvRzOO6lfcAQv70WqYsVTFpMuz5/g20YQx39bHmhqIX8RdT3Oip669DW7+El
	 7EghWuTlIpPnIUrXenb2xHCcX+Wv4m2rVsZ1JqTloaSTbFep2FL+QZwgEceAQmkBfn
	 dODEf6Ag1KSB4mcimX0QT/osqV169tQymt4ccML7tuqiaOeJmVq0Qz4wy1iQK0xZDs
	 UcyBcur8xAwDNNsogzrrtJvSXiA2LJI885s6YUHqwRg2I2fVM+p8DXYzBdBSGlyXg3
	 CkLgu9xZYyRww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA26B38003F7;
	Sun,  1 Nov 2026 17:58:09 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aublQi32yfcCKZ98@gmail.com>
References: <aublQi32yfcCKZ98@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aublQi32yfcCKZ98@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-01
X-PR-Tracked-Commit-Id: b327e63683a2b894b500027375342c25222b58ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46fec1c3029b552ec63b2d01af9d43a386f043ea
Message-Id: <179355588839.2549645.1340566584581928621.pr-tracker-bot@kernel.org>
Date: Sun, 01 Nov 2026 17:58:08 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 1 Nov 2026 08:07:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46fec1c3029b552ec63b2d01af9d43a386f043ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
