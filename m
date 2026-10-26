Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042415;
	b=Ks9darhs7+9HCFSIlol7CbrIq8kf94+hyZkuUWu3C35OTkS2QIwndy4CNVgSDEYWPOb+
	 UxVFR1gGBFHyLQz5rVgyJQgiPI3i3bAY495bWMfEkSCmtUkj4nUsfMZFtrK3ES6oncv8G
	 8TQ5vJFUfMJa0dDhfup8+q6g5hhaktop7PkO2aKhVJ2hM5bV3BJ82doCF2F4DCfWsXKo+
	 EkeKoFetN9wp5dmlnV1JEvaGiED+CS+5SAK1r0ZuoYq1vI/WeYq9GTN7dVvysVCQe5y27
	 v0N/dFShDMauV5idCNMRtaTYHPLXZKDLctJ05reqjwu6UQHu8HE0AK9BYceRHpNe0CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042415;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=7v7wGm8NkaZOjgaXDYT78JSl+E4zQb8aYCethZUzV70=;
	b=AOLMp+WdqxYzRiwCK4Tc0yn4fS3krUse5AswAd4cQbs+Nu9l95SQIIdJ0sgw1tT1aNWx
	 7Q6UcDYUL9bWqs9NcFXpATEirtvgw72ralDbgmLd0g7BFByguGUGGmIVMTg1ykjs1RN6y
	 TcSJiXG/+sZw2T1hQ1xgdO2mSTwOS8zUjXTEW+xUJyN4JOG6ethFGfcE1A+HfifZPGLrI
	 a7SncnioIgGSej74ahbW9yJ8jMIpiMoa8Sc37cfv5O8MpEK+q7bbJ8oJzHHYFTJxwqT1n
	 0Q4RWCI1O2saBDf3Ph3fq1AVZBYnSXxa40fOEE7a9rmSIvcEEOnh3oV86EOU4tz8DeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOEin3ke;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351C606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOEin3ke
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAE11F01825;
	Mon, 26 Oct 2026 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042414;
	bh=7v7wGm8NkaZOjgaXDYT78JSl+E4zQb8aYCethZUzV70=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HOEin3keZMtUyi02G/PNFtR2r5G6Qppn5+k/w749+AS9+Y2eQTuYFfNxVbE0+7uZg
	 uFvzKjBD5C3KoZzTZAiORC7/Bn9TYte3Nk5ps0eooNKjTIWS0t4TdDoQbLrlSaWK9j
	 nN8wyrXZ3x01FmDw8ZfMshCyTMgKclsoaLvzHB9y2k6CJVmMCICW1erfo1ndtF808E
	 MHNfaki2dNWnNG0ERVWuu0b5vmXHjveXZ+4occWuNeV5Ir7d0v7cO3HFSqIq6vtXs1
	 wccCkrzp5/I9phQoaocTMA/X0CWt1xC1OQq4M26iAQd4vEqUcl3NyHjePvIw/3aXj0
	 mqhTQSSLeZjwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 814243AA80D8;
	Mon, 26 Oct 2026 19:20:14 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261026152012.GD2195460@google.com>
References: <20261026152012.GD2195460@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261026152012.GD2195460@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-7.4
X-PR-Tracked-Commit-Id: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b93dc1c0c61fd0fe575cb473e9e25f929fda509
Message-Id: <179304241324.3342836.6422481315811186815.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 19:20:13 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 26 Oct 2026 15:20:12 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b93dc1c0c61fd0fe575cb473e9e25f929fda509

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
