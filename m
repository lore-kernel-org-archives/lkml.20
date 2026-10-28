Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211048;
	b=h+iBxa+lK8gg3qQyg5Cl03jcFKJHtvhTUTlMrYhlgRO7wm5FVJaQCR61YkWc8ftGK0u8
	 sI5Bk69D6lpqbsRl8SnJxw2tUh2yk6I5gRL+maT3Lyj1JFcQfDu7l4Cnal9GAYhObh5KE
	 W//UXxbfRN3tfQYcmSSdB/H2/qKWOJg1Re5CFjxHADiQx+rFa1BqmvIVnLr4J6IoHURka
	 rAQ+EEbgq2ui1Huzvzl4pGXzLRQhklI4THWR3/UelVmjRXWymaGUgNKKwZZONnZoIOnQb
	 2siZw4uny/PQ9IWTKOkRQsPTL17UFD6EZJRIe0zZpFAVeFS/B1bAz74kIsLleMHSoqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211048;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=2hMebXONE65hwVf5POsUc8rxsmUHxu4j1uHXKsqgH1M=;
	b=MrWSQrBfEkSEER8p259DN1XfXdg/a4t6Gp+7y5L/AnlbGbyl9OclocRCrQ9SzMMYUXxN
	 lkv1ZdfO16wKnU3dwwISHa2/UPm17ul5RVgBLk9xl13SExB8suNWxT46/eSB8bAqzwcz3
	 Y652aeKRZ9j7EK9/Aa1QOj5bYK4Kblyac6q/6L2/qWt/7eUAyVYGeLyp5BWW0N5/qJFM0
	 iqVZJ7QdTcjBmz1/UmVjvv6cCbNvwbZOkgDJ3s7XOBG0ma6L/lqpKNrsBlfbLPFAzJpcU
	 fKJnDBSzZf8JL5mwA/cRJ9Y80QPGHygzNp9F80kf4zzkap/KoK3azXA2SVGqQPQZ3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP9v1XCc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687A60A6F6C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP9v1XCc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFFF1F031E6;
	Wed, 28 Oct 2026 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211048;
	bh=2hMebXONE65hwVf5POsUc8rxsmUHxu4j1uHXKsqgH1M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TP9v1XCcNCAAt/f2692O/Gy2KnPb7Z2A3FLeVt4dDk9wBvo+r4sy2b9wQk1ReXpGE
	 VwufWpUdvqjeuaUiEEieci8yFM9efeiCpAosHnfKe1hKF7mLa/nAqPNCK1zqZozBMC
	 mLls0O3fUz6TvGyQO6/flftVNyFZqihR07aCtAeuK5h4Kt4C2AemVz0eGzJfwdmNQj
	 DznSWsK9nrH/v6sMmgFtV7E47AjSZSHmkUKaVhHM3QyvnE2DZpxncjbW/hlFZFJnbg
	 kTMg3E96hc4zwcZeJsHeBfMH5PWWnJauI9iVuaJZiV/j5q1nNCmrk3CgnaZruAntg5
	 vuVufowDb1OJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4439D3AA9F6C;
	Wed, 28 Oct 2026 18:10:48 +0000 (UTC)
Subject: Re: [GIT PULL]: Dmaengine subsytem updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <auIShJbyRMki5-bY@parshuram>
References: <auIShJbyRMki5-bY@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auIShJbyRMki5-bY@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-7.4-rc1
X-PR-Tracked-Commit-Id: aff5e6a77fc69a7c490246465940d18422d7c631
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae3690eb2a994dd74a43639d6bf800b51f18b48c
Message-Id: <179321104677.1342141.1647545869646135015.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:46 +0000
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

The pull request you sent on Wed, 28 Oct 2026 20:49:32 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae3690eb2a994dd74a43639d6bf800b51f18b48c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
