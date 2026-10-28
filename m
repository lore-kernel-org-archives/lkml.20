Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211044;
	b=oIZgE74x/+Fb4Yv5XokHy5W0XHfCI4FtyXtKydbCTN70tPRe1W80TzFJlyNsUkhWe7SK
	 WxUdpcBr+KxzapHkFNdc7D5+B9OkKkbhO8NMszCnf171LBrxPmFnRacnwPYmvyvuTpDcM
	 nFLb8xxI7+gZuQ8EEf39xTlTYYg3AA24tSM6IYiCLexM7ZGlmLYdq0GHC9jE+QT4LX0ZW
	 mxnO16KyJcuG89puzwLUyWpT9OhWmP/QmcsBNsXhzGLJWryM+Dy9Fwzl9Py2ihyK3BKoL
	 ILFX7oUcqBfd/cWTDPFHvParnhDWOx/jzHIMwoAVpRWBtiYdGjs3RMDPZXPylQOiMxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211044;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=dcugw3FeaEH+l6IOMCAKq+jbx4gkaO661Hj6kSK4QIE=;
	b=kQKwH3bVvNn4OkkK1pum22tW4ejZnDorFwfJcskmkKg7o6eS6cX4JMCpSOt+KrlwQMRU
	 fNjOyd032lcoAEahl2EKptoyF9iDej64y5Lfv4FA4H/B2+tVC/fQPi543EZKvL4p9u4Ce
	 gwzWgamaTadlLBF4nLWg0vGqUlLte8VPcu9wzrXmgxbvJwvTcYYD3apGZa8QXKkUNepeX
	 ywnoPLGPSF7WH6SK7DWz4TsKhBj8NbQ5DYzzY29b12oPyMgrorbPXoQi2dEvCRo+W49LR
	 VRebp/HruBTQ2QvzD8xw1Zb0EQc1rbVZ4EIda+WDgDjohRuo34YMNp6uIbnNsITqYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqgmoTvp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB2606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqgmoTvp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75D71F01825;
	Wed, 28 Oct 2026 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211043;
	bh=dcugw3FeaEH+l6IOMCAKq+jbx4gkaO661Hj6kSK4QIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JqgmoTvp0jtIGBNxJD2JIwkwJ+NFysxxK1k1S0sVJd7b78783Erqu/g6r3nfyAKrf
	 gJ+s85PBvFCoyaSyQVd39cCHLZ/w42qO6aMte+vSvbcNcgTG3CNZ5+02oXGsBDhzuM
	 zUBv65vDB2I87CLC83FqIF/5/KPVviLuDZxjcbCjC6uSdpAbNTml7P/7jNf7Xa2xLu
	 zuYLMBgBo8CABXrqjpR6sa9xhJ+ctahbmA4ECf6SJWM4JCh7avx2ZXqmQTL6UmwxXc
	 5fTZowied2/OnyugErrV6cx5ibFv8+1fATBbh28y13yiuw4GzgaA6AiW8a2H3XJ9wF
	 yvctJQ+GghPhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE5993AA9F6C;
	Wed, 28 Oct 2026 18:10:43 +0000 (UTC)
Subject: Re: [GIT PULL]: soundwire subsystem updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <auIRcPJQY81j6U81@parshuram>
References: <auIRcPJQY81j6U81@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auIRcPJQY81j6U81@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.4-rc1
X-PR-Tracked-Commit-Id: 2e9eff8847a46530ab937696f340b9d5bea2e4ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1cb6cfab0916d18f88d44e4a23806b6c4cb355f8
Message-Id: <179321104251.1342141.17083215017573040437.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:42 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 20:44:56 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1cb6cfab0916d18f88d44e4a23806b6c4cb355f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
