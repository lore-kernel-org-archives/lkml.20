Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491640B11F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347326; cv=none; b=LWFnV8shgavKS1WOKmOf1RV78olINSg2DKg901kXy2/yp5rJ1RIsEGCkulXkd6yRtPRUli9Ekpk/LIf1JaAJaN7Kyu4vivVJawX7bjTGoxQyDdyoNyeduvt0f2nNrW4Xf8qIJXztMwSMJ0GY9VGVfym/4r/8Hnz0rJMWBXwEfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347326; c=relaxed/simple;
	bh=fKaRHHrkI0Xz3m3zD9BUZmjBbWR4ic5t5E8LfxPv2po=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L+gGHz3fR7sUugPMpkgEDHqS9JKJSmsclOifzBYVNaogPhuyVqLPKbS0+EHbVq7NEgnjs8hKv+86QipsLAe97B8ZdpCZ+PFah50PxO3FISrb2i2cRoP1IiJQH4n5EXiXbDjLIc7RtxybHB6tgtSCAyZWfSihTxgF5YV3vjokYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMi4pFaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMi4pFaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085C91F000C4;
	Sun, 18 Oct 2026 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792347325;
	bh=1WMJ8rsPVVyFZXIXusn+8DuvVqIAK/niu3mW/dVFF8w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=DMi4pFaJOGvj2lG2p2W02EMFL9KJmspIrnoF6v1YGRGG4PjiqlA1MlPkfBX/aR/Le
	 pJ/s2Mczi5O20RK/blIBnWUrQkxjC/PqDcu9E9zN8QzW2bZiiitAMER+zpuCXrS7zS
	 SbrWv9LzU+P9TbkQF1iMVLEuJ6ueVtkMyg5evMY70gyKQM91+2hHjwBKKWATvGRBWd
	 TO2traIi9G1iVgiJy1xLLZqDlj1NoLqx1oYYPFx3I30MlA3boyS6mqXlObJEMjT026
	 qxt0HZccHK37c7b9Gl90wY1R//gIYk/ly2X98O2H33IEJT9PiaXV3cE7mNwQSAoW4Q
	 EzzE6Oo8G1uYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F148D381196A;
	Sun, 18 Oct 2026 18:15:24 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSQkrxwvS17naGH@gmail.com>
References: <atSQkrxwvS17naGH@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSQkrxwvS17naGH@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-18
X-PR-Tracked-Commit-Id: 2f93bcb3f9aaf6ceee1aec0a97d4fe386d48e781
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88328f850d956d267d11e2ee225ee1eaa902b8e0
Message-Id: <179234732347.1771961.17707846016194485544.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 18:15:23 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 11:25:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88328f850d956d267d11e2ee225ee1eaa902b8e0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
