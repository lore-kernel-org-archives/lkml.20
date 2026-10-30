Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385354;
	b=nN79FGv17/Uxk8sZ70qWrAJMCZz9qbjhP37ExtmBkgGVSyNKiJ4v33Sgg8C18ivwU4iO
	 yvdEl9P1ANi8AHhCm0NB2VCIJtPrCmNbE6DErT4ntfpOyBHSgCiIM138eq4+TPhqUyOWC
	 jSHD1qcgyNlCZqYrsUkXwRVQRTAMJ3VT2HG4Ghrgbc6dEonkx19aT7Kvlgs2clEhmRIwL
	 YGzMFXSkg8LLmN+UsLq/crYVw3+ym5/LsYsEdmm2WlPr0tAI/Dj2YfUhRVM9ctFALYDbY
	 2+INcAt6qCs0dl1ZhwIxSadfNLBENGDADzz+Wb2w1n58fR+6g1qOjsLNMJakNkZ3KeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385354;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=D7WQQk/Fojf0Vk3Igm6ADMx9mgZTxKtBJC0XO1FETQA=;
	b=D3SczHWrkPCWrJu3BVDYdwB2MOt37TBi5wa62rHgmynPjz80/Hn1A3FP9TkgiQquumTH
	 eByxFvufoCWR3WzO8k3LNfjgCY5HKLzFWxHFXrdHNPDslEVE7BCAKXPz2yxvmqH7IgmHY
	 jwhpHZ+ScAZ40e91Ji9yhcNZ/sA9Kt48sZ1IWabj9Yz9LoPTYZo6TDyV3vjYki+rgRmqY
	 lCN76RDe1C/3ZSaKtOcqSbBtCMZQivIGI+w2jNJikw8gnFhUp46VjiI3USOf8LjHRRx5F
	 U15sSp+SvdFo8spWWewvWxAAwLKR72TjXci8eHgTYxIWA/qn876ZVmYFEX8449LwZQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2swjFZd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA3606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2swjFZd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27C31F00A17;
	Fri, 30 Oct 2026 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793385353;
	bh=D7WQQk/Fojf0Vk3Igm6ADMx9mgZTxKtBJC0XO1FETQA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=b2swjFZdUa2qQIAPjwGW0dXUnb9mIFvEnqzt/NMxzErgyvEcgR+Vts5fl8sunNa8J
	 7SXAGSd/T3qcvCCweYDwliDcEtsR80GiT44IaPzdnayKebVDI4oLWY4n7H/vxl1vwQ
	 Hw2lnYneyICQsc01iLu0eOXkbhYwABC+C3Rf9mAs2NL38BESDY6ywlpgJFMsayzOgA
	 0wFI94vaP1yp6GA1A0kq2BoSHKiUWr/3cMOHvBu1p4acMHRa689lOuoyD/8yjbR1PU
	 8Okry7bYXtC9artjIpceQMXj3UGoCaoal3px/eJ1mklDh5NC8TYu7EU7YInANLO+bl
	 H9sR6KMDdPcDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1F03800473;
	Fri, 30 Oct 2026 18:35:53 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.4-merge-window
From: pr-tracker-bot@kernel.org
In-Reply-To: <ce8f48c8b130b27c6baaf6757dee28e5@kernel.org>
References: <ce8f48c8b130b27c6baaf6757dee28e5@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ce8f48c8b130b27c6baaf6757dee28e5@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-merge-window
X-PR-Tracked-Commit-Id: 8a6d73e316f95e398a1de1d1f58314b6d3e7f641
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2228d64da8a66b319a847c1fe0e66527b643e2c1
Message-Id: <179338535247.1709878.9081778332020741270.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 18:35:52 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 30 Oct 2026 17:09:57 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-merge-window

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2228d64da8a66b319a847c1fe0e66527b643e2c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
