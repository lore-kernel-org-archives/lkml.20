Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532323;
	b=ZWNxvP6JPgRKw2MRoxhp1DNlPp8tjwnhOLlDlKSdommsI3XeO4UmlUKMa9EU9ghi0ANc
	 pgEblVNDkhpfvFq0l+tNz+igrA6S6Rccrl5GM9kkV89SLCYDZy0TCyb0x4dj8+HFxVhug
	 70QCD/RAz49TsrnTqAa1E965PDLMncFPRyGTpZFLrOWERGjdTZdzLK1KYzcDDK3it44mL
	 RqgfydQyurtY34gc2iBP3qjbIEtb/ySLVfQ4W0YdhWJJxlzZgUfYFAIX1nYRCW9mX7wuI
	 ospI1VVucJsaty0Vfwm8UavoP9UvKxog/Llmm6cgRryu27Z2dWRc/IzzD0IIzOeELGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532323;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=z6KUrIOECw1+n9lk6g6fWrRh+KXznbf6HRmNNtP9Ark=;
	b=TPPeQ6Z+mu8TbmuUobZRkemoHvBmxhZYervEJPlE8vW5PEm1erAc7anTW3ORxz3yLnKC
	 kHZEeL4H0yjp5H2s6NAqAOqQPSpx9aMHGJ8ga24e4ayl+iC5J3X6hUH1G3hj7Rj36intD
	 0nFAZ/YJV/3fFweDhLX0yBod7/gDmrq3IqH4K/0RGGBcWTue11JWFOJk33FIQjznH++mF
	 IcuMxfwWvbKK2RJwi8xpOfY633XidbajCLaSEylmE15ZzX2Opx/PYI+HlrMl+Wrjfc6ck
	 OhQEGdCwE3zsDyoidG035X9OykHW32xysOEZV0gbkqQtp5c/4xY3vpNLb9NqW/ZM0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGUghJI8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGUghJI8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0793C1F000CA;
	Tue, 20 Oct 2026 21:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532323;
	bh=z6KUrIOECw1+n9lk6g6fWrRh+KXznbf6HRmNNtP9Ark=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NGUghJI86aA3mtOi+YXLa3uYdAAcZgZkwdhhAssj22n+8Z6DSakxPX6CcbLU4yGgh
	 vaxx+we2C11Ca+WV3JZiD4Br0wz7X6g43c95ondRXUNukwtx8iQBftRAXMpEGXZSB8
	 gDDJanbLUpw/FABqUtvqK3oP/jjFG2N2wRHExrSLb64PThlXWaX5WVOAbmhJ048Sgd
	 BCeeOVSWUa0286XKmW+oK5cgq7XUZ42yDnhWH6k9ACDyJoXvo8d5y5WKWSy6IkDHeP
	 9Fa8VXfq4/i0UZHXR8MunT8kK1HzL6CjV+0IEXwSj9svF7IaX5/4Auj86hpge3r2Un
	 haOC1kYcr+owA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14013809A09;
	Tue, 20 Oct 2026 21:38:42 +0000 (UTC)
Subject: Re: [GIT PULL] x86/boot for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020002446.GAata0znTHnFvT5ePT@fat_crate.local>
References: <20261020002446.GAata0znTHnFvT5ePT@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020002446.GAata0znTHnFvT5ePT@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_boot_for_v7.4_rc1
X-PR-Tracked-Commit-Id: dc2a1671d983d26b8ea5a4c5de9c5a028707f40b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40082fb4015712084df977bb8e7f0aa681a56a1a
Message-Id: <179253232152.225072.822254902065236052.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:41 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 17:24:46 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_boot_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40082fb4015712084df977bb8e7f0aa681a56a1a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
