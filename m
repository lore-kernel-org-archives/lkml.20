Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BC432BD3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924974; cv=none; b=GE1bdWKqskm+gGCNaWAesz5vleVIEbQWIqdu70yZIBAo0ZvyOl/b+95L6bkQ+89PibCfz3OPiLysihmauqZyRZvF3J6tf28DA/eCVHbzJBjnZu903gNRyVJrbWalMLUOarZ5oIRSBAS6Wo9IxuN5WWTkou9I65AdwIUuhaZ1q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924974; c=relaxed/simple;
	bh=HwGTqkRxrL0D8hy8xp0kbQDKXUqsbyhCGoBCPShwUZI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k19insqkCBjdZOuIAW/TspEy5ccwpDE802AadWjkEwtYGP07jBrSDdyLPaPoJCWQxKx//c9tJZTLN2/wmp3RhTUJkyRO6VXdudphTQuSL2qI0cHbPGS9TIci7SD3sK2WuM5PpaCDPNBuvDAg67U2bdRxrLNf4/hO1qRUxIfcqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfvv7Hpq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfvv7Hpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC2A1F000FF;
	Sun, 20 Sep 2026 17:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924973;
	bh=Ewdmw+jBtXaiJiXUtjwSSh6aJBvKVyfGiN1xu/zOSNo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Gfvv7HpqAPP0XceI0giCx3+idOQYUlQPy1evFUGVN4favBc7FGyM5op7CphO6KjNi
	 Sqn1hRsDVncm4ucw3ocp1RdM4Sc/HEmxK10uLUuFIJYSeOPMsAKKn/yYpcbMo4hBDz
	 va5jP44VfmhXolNYFb1FrRNxfohf/7RaLKAcE4Q9Nbm2DHNYuSHYZe7nE9axuuqJvc
	 Vr+ECMOrkVulGOTgSaCTloqK+mfBzCzoKAjWrOH/qhJSKHx1tJ52gJrms/xoZPFy0O
	 Z875FyLry04gtbYr+k6To9KMK14sQPFOvaMgaAdiHxt3rZbyECpFOzt8MSkPXr6evu
	 ltSJw3dv4w7tQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 92B7F39253D8;
	Sun, 20 Sep 2026 17:21:46 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-rDdJ7JlxW7gMZ@gmail.com>
References: <aq-rDdJ7JlxW7gMZ@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-rDdJ7JlxW7gMZ@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-20
X-PR-Tracked-Commit-Id: fe3c73d7bc769e7afc252f867a3421fe168b898d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fecbe78ac0e7bb5cdae232444e649a3103d9a917
Message-Id: <178992490547.1735599.12651821744993119724.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:45 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:44:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fecbe78ac0e7bb5cdae232444e649a3103d9a917

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
