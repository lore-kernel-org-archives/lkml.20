Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532334;
	b=vGVsA6/q3U2+90JYNw6lcjGqcrppCy1lOPBcPXw4BDvqI7aqTggB/Hut/IiyrvFXNTYY
	 /SVLsJtoxAA3vTZCAOy1kGj/RaaeGVhjC+nEiXow0B7GggEPDe3hfBkhv8dhzIfmS+3Lc
	 yTRbNYXYtpZt+aM5vCS1OugKw46mqfxdwGOWm9nMWDPq5CgWMB7EK0V5eg3YZGlyImtcZ
	 5uOyJZK/nILasOLMwp8YTMLXwbYX5TJQzdrJEJY6wwOCqZ2mWuZvTKBghzE0BAbmmApPI
	 eYv+X1gu/tEytTkqDat1JLh3qFZY3DIc4Jm59Js9h7NxTldmpunu2hDL8sSZgSOUXZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532334;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Pot/BtgI7uXOrCfUnzHBreo8UoF73ZujqomwudECcb4=;
	b=2VM9Bly40iWDLZDNGDhXUUoPZ28PaNHQaiw15oVD8HVpdkglEOuloGQiKhwV5AmTAClH
	 vlqbjzAJ90t146bjydMYqN1N4rpuTFTkeZrJztpLwx6CChPfd5i9XHPnmrol0tlv4Ku/N
	 uY7lUgUV+Trnr04Zr33jjBxDbjgUHuNC0ln8qSPW0XaE2JZqtaASyatBg76mJd7+IYzcd
	 pJqN/nlA3DUkQ/HZn/MpXNR9yPpU7GhwHZrfJ694iDeo0iJ6t032bLNCjEaDuIe7WJZaG
	 KeR6GM6vll1SJEVjHmGKJX4NCTxPzffuM+VDDesjaWFbwBSOItbpZfN5nhKj64ZrCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoagZhdR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06D60A260C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoagZhdR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF881F000CF;
	Tue, 20 Oct 2026 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532333;
	bh=Pot/BtgI7uXOrCfUnzHBreo8UoF73ZujqomwudECcb4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aoagZhdR/LhqPIMw41Cji0/QKP648wL22RMNHGsRcSNzuxMvOUwX+JIc3T3sLDxgr
	 8cJg+W6FsAlDcBtfOOCusecOeaPazb5Iwy2JW8+PiN+RxNaqvjr61b6aC6yOWagOnF
	 PgxcuEr4K5Df6U9u4G7F6OSJfquDJYR2gbLa+I76Fmk3vbhX1HDtDlGqAEjHnrpdfJ
	 q6X3vDMleb2rAjdv065dluG8W/VvlhI8gDPDA19LFPy+XdLMDNR+1dLknfjNCD+quN
	 NxULL65HzKL0YrN8WlksW4Zf4cjQpL8zm/cjSjdZ8WdqYASBbr8VmldMrazR+BOxrH
	 Q6DI4G3xGR9Lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44253809A09;
	Tue, 20 Oct 2026 21:38:53 +0000 (UTC)
Subject: Re: [GIT PULL] x86/platform for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020051516.GAatb45LUEvNol_yJ1@fat_crate.local>
References: <20261020051516.GAatb45LUEvNol_yJ1@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020051516.GAatb45LUEvNol_yJ1@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_platform_for_v7.4_rc1
X-PR-Tracked-Commit-Id: edb2b6d8ea88659679787231253e1acefca63f28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84568b9b5dc5b8ba6a83a1cd1d1448410473b43e
Message-Id: <179253233238.225072.13843269131078449487.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:52 +0000
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

The pull request you sent on Mon, 19 Oct 2026 22:15:16 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_platform_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84568b9b5dc5b8ba6a83a1cd1d1448410473b43e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
