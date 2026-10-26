Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986381;
	b=zugXYjLqtjBSDZiXESHNJbKFTsaJZFw1+Rnz8fbwO5yMINgBxeqenh6LHPb+4GoJR157
	 pBfOkVAY/hoGWsUY/wudPuAlL4s1+7dcmTdnBKMZCVVcKoj29rU5Z0qsckexPQ7cDtKh9
	 gjTs9P39ah4WjCCfIZiiNCJZoMmirm33fV/QVOdJt9YQl5ByqQuauZlMZKntzu9M0EiGv
	 zAtEUW/qTc6IP4823lRyI7zZYdLd7z0NbvzQXElPdrZZeaTPGz2IuREqvxV/ihSxyX8js
	 f7cIf6vz5Y4f5t0VXbVxacDyaO7JWKQIAH3D3d3kgfAqRtkJEiAvtIt0aikfEJN8NdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986381;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=8PA9GkfQf2cFoS0ayw2916W2lJqjiT1U9quZNhALY7M=;
	b=BuXa4WFZyX02F+IaBm9zEGA1Zay0dtCxhYHpa8zmvJWuU35JSMnHAYsKbcQ6SjRqi8qA
	 M223/j2IVZdQohMYgEbClxkS41h4lkcYt/RoULvnrXZrBpqBY6q5Ul9bqXUZB3cIddeRe
	 ovxtByW+sxtacszT2v1M1khzUNwtLLsAgWOtvWdKSQA2MGERKHspq3JYIAqI2dt97DzgO
	 cPGtZr5M9vyDidnh8haTjYRvq8WFl3A9raJEHoclEGEPhuJXADKKlrA8Sc/AIwJwN1C31
	 EgOt+GCDUR9bIuE2C/xAVO5VaRyqAe9C46jRWXeZTuMaaYxFbhfNHziizVByI0nEcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1cg3drI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72859606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1cg3drI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D72A1F01825;
	Mon, 26 Oct 2026 03:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792986381;
	bh=8PA9GkfQf2cFoS0ayw2916W2lJqjiT1U9quZNhALY7M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m1cg3drIxo1khfwcePEIMT5l54AnUfXw6BRWhRgw1NG5ndhvC/r5UpDepyry8rOta
	 R+pUN+PZhVp2p2JnPF6Yqa2LQi0EppKeoOAdk36FWrUHiYD7qgwfFxy4dMzRwTe30x
	 QDO5Y+oqDMuQAL6JKCHkOL/TSxQ7MIRq2uxSQ/PXXMz+xSpDegkYvlBcdZ8VD7MoW8
	 ErRwqUfdp6LUuSktyi2VzqBIH/ipDlNLYxhrdeMqecBImbdqeUCwrY9g2s171zVsCF
	 xUR4XAZmJ/vD6duPwS96tL67qTrhGB8FPGiUGxixrzQH8ozdC5yw9/0vrd2zKMP00J
	 p9P/duBXu+KXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4463439EA761;
	Mon, 26 Oct 2026 03:46:21 +0000 (UTC)
Subject: Re: [GIT PULL] kexec: updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261024112155.3384616-1-rppt@kernel.org>
References: <20261024112155.3384616-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <kexec.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261024112155.3384616-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-v7.4-rc1
X-PR-Tracked-Commit-Id: 833d2b79ed9520e77c5d83eb11644e5239b2c5bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3593aba315322d875f295eef8b1a19e24658ba6
Message-Id: <179298637979.2442679.15289838186801073122.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:46:19 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 14:21:54 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3593aba315322d875f295eef8b1a19e24658ba6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
