Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C353E51D4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927137; cv=none; b=jK8/VZUHh5kPw6Lp0vCUmnohFAIRLFdOD0wwXVxqREzX2F2v0WqTbbQpJDngqC8RxRIWAi7lxt13n5kA00hcdUW/v7G2hu7so5E5w3YY1ImqFl1W/DG3pOZ6P4EoijOcIyDra6WpQpl8rp6DtMNZg80MH1MQQgNKHLzo9q2EF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927137; c=relaxed/simple;
	bh=N9jmPoywmZ0sdOETws3vOm8xl9NRHzir4HGgnWaqzm8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qNuJ7znJo1DVvPBYM5PXW1hgVc5flnVyVmm4lQvTZjYQYf1u19wAFhs3wEdRDT2zOGB+0mQ42PYeqqVmzdbrEhemQAB8d19RgKA7NaTnXFxonlftzRHp2PvivPeAPywM6qMMWRreeXP15Wkh+dQakiGKoBiqM8QNnpbV5wCQRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/D0wfur; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/D0wfur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D361F000FF;
	Sun, 20 Sep 2026 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789927136;
	bh=mjULcNmvcUWrBlyGxKFcALZlMIbzv+GlSZQZKvacHBY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=N/D0wfurZacW96+gBA0YKbbTwuYwOOhg1fygsHNR3Hex+F35Uh1jgieycjjlLHEQa
	 BHOi//FYZWvizzgL1XzGZGIvp1KmEBtmHE19slyOfHva5WAwmOrNUTbleIvOaR64Kc
	 Zm0MNGJggXvFe3tpME1FWAmEgmf57R16SxroNU/LxNS1uFx8QDaeVGnvPktMIum+RS
	 92YmIvqxDrtXqzgOEFgXpN7LGpNwwQ7yUkiof8qCT1Ufvn+ClAHpk8UWJbxJNGwyOz
	 dwYkX22isP+IvarkPMEI5lG8YdBzGxmCzopKVJkNWP9CyVi/9/4k48adIXqQi74KPZ
	 GgaD4jg+LBqvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B3539253DA;
	Sun, 20 Sep 2026 17:57:49 +0000 (UTC)
Subject: Re: [GIT PULL]: soundwire fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <arATWGT1OwkvzZ1i@parshuram>
References: <arATWGT1OwkvzZ1i@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arATWGT1OwkvzZ1i@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.3-fixes
X-PR-Tracked-Commit-Id: aba7b41faeecb7692458095ce6fafc341fe0b80e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a885f68d0e90dcef77e575b09104df7263e2aca
Message-Id: <178992706798.1742959.17546349277852793130.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:57:47 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 22:39:44 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a885f68d0e90dcef77e575b09104df7263e2aca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
