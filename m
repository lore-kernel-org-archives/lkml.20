Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532302;
	b=TK1OsMSzcJfAW63ZL7N+uZWHIPttmGu2pNtZekaGIpzo6RoC1AJFT/jR5v6zjs4whPlD
	 YtwUP4zpxdhGxcfOcXGQ+Rw3NvBMhFKxa0ox1hlp2Dbxsk4dXn8typjrbxUICWLrLk/hx
	 YQm74+0ydqzmMpkWD6Xqp9PrQCc2JOR6vqaCDBOT+WO4zXQYJY6ddE/IevJ1p9bArWAuq
	 7Ef0nqE6ODzTQKv8+jZ4D5ZIK46cveoTaQ9GP6azuj9hRso9O1UufDznH6mxcAEKAybZt
	 7tem/8oZa/75xyCd5E2ycJUZlsHmQsNudrMMOhIZvo77a79+Y8cEZ4kihd5nofAlrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532302;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=cBE2dw1g3Eh9EqgFtNRVCB1b68R/t5j3Hg9J4T+07Jo=;
	b=qA5/90/q2b4z1+3x14H8owirM5hToMibF/3FekmDE+kPhCbI1rDj1VziTwukV5HINXaN
	 tD9sq29fI6cb8p1tOuH69Ed/UCBm+2x2PlXqe44Hc4OQe4NCxoNQ9sk62nXUglMFsUOJ+
	 qLi3VJbE5x9TlJiLl5YrFdVmzEw67f5iXd1I+UiQr0AwxXoFpzTFaMfPRQoOLOE6e+KfM
	 7rnPzbYEzXoLh5YGFzxAkPMynNsIk87xEc9c+/Hn38co782wDwHRnGCFMutYxU+4UyGUe
	 82nBxhNMIse01r4s3DnYCOys72nQij552YvEOcrp1Nn7eX8bIW7ud9CDI9PRwgRv0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVS6CcEP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVS6CcEP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086C21F000C9;
	Tue, 20 Oct 2026 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532302;
	bh=cBE2dw1g3Eh9EqgFtNRVCB1b68R/t5j3Hg9J4T+07Jo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WVS6CcEPNYTpDVdKv39RJJJ1EIRG8Wwa5HeMqxgLTg0zVUlNjX06yRwiqzn5mE98Y
	 RFHTpWvuIYCfN1nQfzeu289r5v1abLlxPzR00/qv/oc0zLjlujzv4fF/h/oB02+2lH
	 loLw3R4LPfmTBSTZfCuxYzs1tI4TGC16VEvpqA110LPKac/RTx16L448dPmqib+cDA
	 Jw49x/2lmsSsGRYPK6jTMeQJc2wLqO7GBEdU6FCkN0azPwTld7SImcCofQTN2+I6RN
	 hoxKzNbUmE+u/IEc9nsDMrJRrsvmtB7NXcG/jAWeEYaaTSso5waIQMd/pM3h4Td/DU
	 K8OLtEMAo/HyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F37473809A09;
	Tue, 20 Oct 2026 21:38:21 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261016144012.547221-1-catalin.marinas@arm.com>
References: <20261016144012.547221-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261016144012.547221-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: d0de3a73194a250a2e5ffbf1dc604c0bcbb16e8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 303bff3637d13f0ecbb280c7cb403470c440a2a6
Message-Id: <179253230073.225072.10707551340990264293.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:20 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 16 Oct 2026 15:40:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/303bff3637d13f0ecbb280c7cb403470c440a2a6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
