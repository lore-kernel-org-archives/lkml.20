Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50788386561
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718353; cv=none; b=IaF4nYLKK3/nEaiOEVC0ghcpg7qG6afsVxJI/NU06CHXGYyhPVwUsyx1G98SIaqxVFFrOpFCMDoWXy/Ef0nel0Gu14Yh1IudP7tg7oYGWbp4iPwUY7SqeYbTr2o/9rURgzF8vS0RB699numNEBoYVx6agR2ZCXiEf3WgOUu48Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718353; c=relaxed/simple;
	bh=4LzfCjunc3chT8E/Iu2dD74+I4FNMkYJoBLx9q8B2Qc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rABQNE+omTmquKdvaQ9B11Q2kbM6VfpgN/FXKNLqBNaepvGhl3rXtwqb0sbn6JfQ4T3tPzuVmv0pqKgBBV00f+dJAuf3BGhUIJD0WJNj+i9uaD4kbxnEkVoWzu3r5WrI35O/uCkoDOGY3cLipnRBPLgtgA1ye+VyjJ/WFcTvVKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhiaRixo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhiaRixo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED58C1F00A3D;
	Sun,  6 Sep 2026 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718352;
	bh=Pdl5yH2MqHl6x+WEwiUxzfq6dGrnmpFAjxK0oI6mvc8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EhiaRixoj/wb3TK7uUBtsrpaUw0w4aH5eNrP7NaWlm/+CIXgnfYFdnM9cQk9gSxqa
	 /QtWUy4917FuP3gjXI9FpvSN20SHi+nWV9zCRIDamU2fK03JG5FhJSmzpwxKvxVx9v
	 46p9UW5GD9nAzy4FMAC5Mml/04ilprhzWPG49r42IF/ttL61FPlX8STvjxakGmIZL1
	 IL4TD6QKQaXzxkbetcArxCKMcVoqtHe/X1eQqti4SMAEcoPkxpeSjP9rTqn4RPuzyr
	 gdSEMsgrKPzXL0mOzw4TsDXp0ZdUXT6ILUH+NsgjZpIidKsiM7fBTwYl/LNdg/HiDR
	 11sauqjHI4gvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09453926249;
	Sun,  6 Sep 2026 18:11:32 +0000 (UTC)
Subject: Re: [GIT PULL] locking fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap1JGTb994--S4CB@gmail.com>
References: <ap1JGTb994--S4CB@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap1JGTb994--S4CB@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-06
X-PR-Tracked-Commit-Id: a3b8d46fe401cba3a5c46dea610e6eb3dc15370e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8990f3179e5636832fc22e6a262de5d50c797e3
Message-Id: <178871829142.1639575.2534226711278603630.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:31 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 13:06:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8990f3179e5636832fc22e6a262de5d50c797e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
