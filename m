Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A637C0EC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129879; cv=none; b=IYnzjQD7kut68laPpRwdHUy/+nHrX5P6TTXI052/Fycs/aA1wl57ux4DdwCZkSM+LRg/n4dIU/Opuh2Xfme4qbqMuZwzTgtMrS1JtXNyv0GqXRuG1ExdIpBvpNsp0SbbsNjROTCCipsmBedFGIsO0qvZqYTad/4ECUXEMdNtOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129879; c=relaxed/simple;
	bh=2wuq0QjtHz467EmKwDJg+RtLh75n+Ve6LR+XUg1zito=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VWm6lVTAr+H7rDcgnarpkhYMyk3AfeOQ4uqg1sMUafcJnztNqQIfAKPKcM3s+R17V088bjQS/B19F6YZ411nvn9i8bQ7zwWXA11blRAR6Iwuko6wncnYN6Nz/SR+MLy8zaI8xn8JuC5VifBHaoA/VBzFblO3mlC2xxbcPd9ZsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/WkBLmH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/WkBLmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D4D1F000FF;
	Sun,  4 Oct 2026 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129876;
	bh=IXpss0yBkUkm84fuO5E6NDtcerKjS0v9rr2V/YeSxqk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=V/WkBLmHzPrPxgVEJk/YfFee+lzNV4dkIuDoIz4k/BDm7X5IDC9RnBgzF564kK/ez
	 jWhtPwSvntsuG43VeT6nmLCstHmUIX/gvDDEwoBJwkLnR8jPIRmNVEHM84vX1+Boi6
	 DVf4QCR64+bPqM/gD0euRYKuRrE8L47qL8aOLCBIi2Phdo6a0k89q37rS4hPGKN5NJ
	 k4gK9YhVnFnAtBHSvbzno3dBe7sAstwQumfK1Fxp4T7jzx4rfozxvif1si8wDV+D6D
	 tJUYVd/I6IqDP4CBYvl7F71MccvtLdmSgxjpxlqq4fZDDFbJr0q/AVigXWScnVkiSs
	 lKQEgcWOjNemQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3523924FCB;
	Sun,  4 Oct 2026 16:04:36 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <asIDqVbUHoqIkkfP@gmail.com>
References: <asIDqVbUHoqIkkfP@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asIDqVbUHoqIkkfP@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-04
X-PR-Tracked-Commit-Id: 28fa9af353bed2bb738c46e31f9b7d0347b759d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 942e4a0e46bfd0efd3f87f70bf186c54aaaeb138
Message-Id: <179112987493.456308.4840009667764011300.pr-tracker-bot@kernel.org>
Date: Sun, 04 Oct 2026 16:04:34 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 Oct 2026 09:43:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/942e4a0e46bfd0efd3f87f70bf186c54aaaeb138

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
