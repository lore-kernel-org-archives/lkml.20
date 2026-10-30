Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318716;
	b=dKyjq06/69D7mXtsU91dvMvN/5u1bvnrxG5JSRCcB9W04c0n4U86GRBqS9kjkkxOC5vP
	 raJwL/ed/XrzdjM/ZJb/cGGPkIOIZ5vdy2WxWwbtmbNfqN3R2mQrK7IOJT2uH8WezDbgn
	 wjq25DFZIiYM84gBfVFX9m7jyTbl1cwmetba6nbSgoUmBR4ypB5dViXrcTALlp3OnZ7z7
	 CtzC8DTGmhcyS4z9+f/pYa+1Y9c7WYjnPbHhuv+8JqfxhkpTKuRNdjV3ZUB9VOnyTmrAH
	 ldTXeSY+jJ5ZltMLNB21sjCUV+F9DJdlCarcZO3XP2Ly+oVzdDjvYMWmzs4D6nqS0Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318716;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=R5aw78RVLHv5ZBiYirC6cGQQoKSuhF6JlUJDzh7yGEk=;
	b=HvlziAEYKSvL2l8DBUedCqnFuvAxQ8vih06ACHzKxZgloP2XeWJ039pneMDHb+IFHecj
	 j8XtiXRO07Zvz0xZyS6AL92RJdQkkx4aHRlERzd1UifkDihig/pNnooGq8stbN6p3rLvr
	 Q1i88hfj7H52z/6z9M+ixzRBOae2StBWxAlcIN1TXw7DfTEaFciF2r5dX/f+c55L24CkV
	 RWGIxsAcrwCud+lAbq9P15yUpEzVVRtofFjsFQ+LiKiUz8Y/H+PGpBkGKy2nmEymRWhWV
	 xpV4X8XnYjf9qdHQ/boRv5nwp+Y/+2FejvLwE/N4oKGcZJQIcBtWZIrjNk6V4j/K3Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVL5kgxn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVL5kgxn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59571F000C1;
	Fri, 30 Oct 2026 00:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793318715;
	bh=R5aw78RVLHv5ZBiYirC6cGQQoKSuhF6JlUJDzh7yGEk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GVL5kgxnGF3dRf+zWmmBoeOxeNQ5KJ+eO1mcIB+5PFKa4Ceh0pzaa46PpPMf5eMaf
	 81TnGxgKEaGDF0c5g+xX1isD/Juwa5sAFs9La8EuvOFGUexu9TrIb6VritqP6DgMeI
	 6iidHqdfcaQRjUrieidx+UAHf7U1LW0P5WqBQK3lJlyVSnRbRIt7oSWfeH3lsKyPQN
	 QOTLSfcFXkLibVrVG+flT7MVReXvxc9jKotpzwSB9YtopC5szh/kdQtOTsoXg8MANY
	 fP2q1uXvSNyOref6JBHL29AzqbDE10kv9GlBy74/JMlIbXd/+JAhL0Wf0RiADsnyat
	 xwhxLwZqNIZhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D2F438007D3;
	Fri, 30 Oct 2026 00:05:15 +0000 (UTC)
Subject: Re: [GIT PULL] kgdb changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <auIsQQ1rwNReWa1r@aspen.lan>
References: <auIsQQ1rwNReWa1r@aspen.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auIsQQ1rwNReWa1r@aspen.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-7.4-rc1
X-PR-Tracked-Commit-Id: 9ca9e8c857b55a081d5a1f8039b27cbb4d646b49
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fade975d5632280855d03699edd22c0689e3a3f
Message-Id: <179331871419.761441.5676698934781884332.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 00:05:14 +0000
To: Daniel Thompson <danielt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Fang Xieyan <fangxy@xiaopeng.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 17:09:21 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fade975d5632280855d03699edd22c0689e3a3f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
