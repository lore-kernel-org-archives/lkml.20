Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965C369D74
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321134; cv=none; b=BqacjbLexXn9XPORTi/qU3wMA3CS3apsjFqtz1w7yGJBNsuNk/xLlPgul9z31J5dPmqSGAEvCDU6lqgPxYHvOYJIZnSSrWlPP97U5FQLJM9xfmfudj/BxFyDQCqf2uu7rK7KExzKl8vmxat+Groum2VDph6ybCyt98+n3jhoEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321134; c=relaxed/simple;
	bh=2tdMU4qn/S1fp8QZos0qSJfMdt6CVLf/GKiaef6fsAw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fm5BhnworrkXwW+bolIjmWlgV3VI2T8dJwTVaoygwk1xyc9LuNz4MYUtOZvcKTeGAFquS2a8peGH9PRyZHmrF7Q0J4MPvDT3ageCqNHDGKr184sZmILMzLpuhoaoWNggigAa0EAHDN0JqmgsD35ZzZ8q1GqnE48KDYgrLXyRpzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkvvUGYr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkvvUGYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58521F00893;
	Sun, 13 Sep 2026 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321132;
	bh=u6nGdCmBAnw64teJmy/nyojzmCKITaTKsKhhhr+ja+8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JkvvUGYrAp1+3BM+VdW8n63N2uYWmNrBVhXexlh/Xl+7DwEloMkdSB5CpKGD838tX
	 Xq5nMlJCQiAGZ2NxcQESw0EAGoSOzyrOC4lpsx+wvxbnnK7E8sRfqhLzVeS1nqsx++
	 UmLmwFKMbmnhCyPnqs3Bn60LDs9zzSkIrXKyYJ4uEUqwgr70z5DeFedLV9UpzbOJxS
	 UnYpdQGT6ck9y72zB11m6OEZ+SyDWQKJaPMVrxfEX0uDN8ECmnMmtncyKLsXIFKziA
	 jml6KWlcyS3P5VmkwiMekDdl+KmFxJAB8wjQvJ3RxBWu+RlmCXedZegKubwQjIXnAK
	 sixSn9QEi8//Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0930380A957;
	Sun, 13 Sep 2026 17:37:49 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZcjrj6NEVj6Vgq@gmail.com>
References: <aqZcjrj6NEVj6Vgq@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZcjrj6NEVj6Vgq@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-13
X-PR-Tracked-Commit-Id: f5741d2b34519d387edf6e9798fc7030c20a35f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2a8a7669e9befcec50fec990e1e1ee96f040cdf
Message-Id: <178932106844.3902938.1977938545599194021.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:48 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 10:19:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2a8a7669e9befcec50fec990e1e1ee96f040cdf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
