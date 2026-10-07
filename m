Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9650629D26E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791333936; cv=none; b=j39ZEnUS2Tx3Q8S1Fia13oj0VvLy4TyGNCmgEG4399FkUlwJKoEO2Znusg1FQdt8Rf70bo/8Sipk9LOL/ILNWGC2z2q0KW1K6IikaarfDoZyoFMVWAmM1XLSyaXMXNla8wYxJmOffEjWW0x6dkleigxYuyYUFPjN8yosh5iNKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791333936; c=relaxed/simple;
	bh=S7UWZx5yPA/hH46P4OFv65cwpwHoF18gR0UMiLCcdDE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kEC1bQLL2ReQNgY+AIDNWvkDwY6UdeLZ0cws3qCPIcF60zrnuCdCPDZuNUXxnWpiO/E5yCBONghd5Z1XRGulvLIqZ3yjc+IyjtDCXd06amdB0TuebCmSRt/pOEBEHSS8LXQto4bYXMf9QKSkmnmcUniIhW9UqCCTfIEtUFi71DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad26ZBgN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad26ZBgN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435181F0089B;
	Wed,  7 Oct 2026 00:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791333922;
	bh=bc0CYM9sCAoD32QXH9KQHFOOQr8iNO4MSgh2AzZ82ZA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ad26ZBgNHIuhnwVk4cu7gN1R8qoGcd2g9Bgwew6hE4uGcHMYCQ2wKR7X/yiEQxRpC
	 ZDdDnZ29DSPsEsvgAWqqoP/B7EmsQYRLO5538jDRSw/5CBZiDX9n0yR4+TQjJuiEJi
	 UW+Oe+eX1EGjohGPGUhuTQnLAOCsL/YosNyTbsSY+EKDvQ9i7NMpyP2SsyygRr+nUt
	 w3ibduBwALzfGrQyL5mKRqllVmGWmm4nJHkGGPGACiuc+ydGbBiOZJ9etjfausZL9F
	 vFNcmrix9r4ajpUZfXMQIM+Cfr2tnfFyCKw+Q8yS1OsBkoiFCKcEFz/zUF9RwLlixl
	 N8Ep/uH2SM5tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2F33806541;
	Wed,  7 Oct 2026 00:45:22 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <8b5da0d81963439650838cacae437645@kernel.org>
References: <8b5da0d81963439650838cacae437645@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8b5da0d81963439650838cacae437645@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc6-fixes
X-PR-Tracked-Commit-Id: 980db94e3eeefdd8a1c46f86412c33a7f7806f51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
Message-Id: <179133392071.2846339.16717993162921447983.pr-tracker-bot@kernel.org>
Date: Wed, 07 Oct 2026 00:45:20 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 06 Oct 2026 07:35:59 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc6-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/602042bf29f6efde39cfb5fdd9289bf4854bc0c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
