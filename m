Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E540B6F4
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347327; cv=none; b=ZuutErk5tYd4/wKPo9BH5J2xMOQI5rB0USFiZ+ebGqanihTLvm2fIZ503Ic2VYnbe0scHJtZq10LE6GhBo6u3GqWlnRTC2baFbAOxxYP7DEQjN8iAnx4W2WiMeIRAzVMmKvrgux5bW2uqfeevrrbo4Z5vofpyqxEehAXNlYbVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347327; c=relaxed/simple;
	bh=yr1GKTovUHNUrTEfBWiZ2FhoSACC6KQMpkRmaCN8rEw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AWqRs77i7gcq8NCbWJPezmkJlvA1W40VfL6O6KTN8TvRedrbvZ+vPhTdvUgz4QmefJzTLqpgL1S5qtTxz/IB8PjZWiQEPft8a/7TeLIu9WKPA1Cxxv+JDBzHSkGVBqtCrRd/Sb27OiFe2xil2J5lWfmbWnxunAzHQOGb3CjiOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQnMrRKo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQnMrRKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2101F000C4;
	Sun, 18 Oct 2026 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792347326;
	bh=8vNujLxKKFCbLTedRWcRxbQyqw/4hkZ0x7zHOJRtsbU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gQnMrRKo0hYlCCf11ftyJXgazWa6jgqxaVxKkb2dNGxNVWmJ+o/knB2rHLb1YUUPT
	 n6jlzTpBdt8SEaIJ+PDB/76K8TjIv6UUaZdVJjXyAKqW8cntbOxDIt/gd/wZOj16l7
	 Di7LOudn6yehuvsPcc+GNQ6TycoCkOopNW1aqnpjE0e3bbylX1MgxkyYY+A1mZQBpj
	 oO1oM6KAsKkDWFIty9xnfJn+brzsBNRx0qhkPR2hRtOeejXfmiJ4OOp9tdEIcuBo9r
	 bufVrvMuCDTDId5BKi7m2aDyP03ZgPPmFzrMkR7FEo/70g0mq2+IDXqbDre4ruXJcG
	 tuzdkTh5BhUWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43D2381196A;
	Sun, 18 Oct 2026 18:15:26 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSRjVcnu7ltxwdZ@gmail.com>
References: <atSRjVcnu7ltxwdZ@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSRjVcnu7ltxwdZ@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-18
X-PR-Tracked-Commit-Id: 4505a262deae7df06e33617dfc104d5541eec91d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23a38e7bb2f9ad99c317a9f4e4c349054de9dfff
Message-Id: <179234732521.1771961.2622663424185277339.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 18:15:25 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 11:29:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23a38e7bb2f9ad99c317a9f4e4c349054de9dfff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
