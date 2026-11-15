Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767795;
	b=RaJYYFkSb2fFHhTR83HAHbOOhTaE3q3nW/x64Wnn3opwQjCbvRd97fxKddcQ6RjHXrVX
	 AS0JkHUFQWci8v4sCcOFEmE45STqBjwmdzSloA1YH1Ch3OT45pnHsxZ6pY7E6YVmpYogN
	 SGSrObAp/a5AY426DECMPHejisYzljP0qbQoBT/BwqszC3TTdQc2WZ9GoTZd8yfqHE79X
	 Y3DxDz0mWuZ0egt6I6u3A1oX/1Ve1kIMsGuF8kHI8ptyfxSgFyYT1Se+wNBTGH1wjM5Vv
	 Tqifpx956NYDfs9jBXA99h1UX+i1DE3FxjPcrvX9l0Arzluyzo4Dn5mi7/RoIT0+0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767795;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=AO8kf2WUcQrljshoByY36FLuUxYn7FM+VRzzM23/a3s=;
	b=nYumKTexW23Tyqqz7j+olN8dUqn0siIz1edRmB0IL8FG5yd5nrG+PVEPCtrNKUiCz1nB
	 b/N8RaDg8UH403F857Kzryxgad0kCh3lLcfN50ETll3aCpYBcjpKZYSqyCj5mZUbj7UJz
	 v8AQEDtw2aXAZOrt56LMJpGYnifP1I4DQT9ECYY4xa6Qdewz10Nwt1G0rpPtlQY+dkCia
	 J3gJNqXcTNSrIm8Owu2DO/PS2aM8IKXzAlktbJgkQ/gjZR3MqJMInpiLcJiFOyaJfvP4i
	 MYybPP59WeQ6AALFzT668rCjn5k6YNA7wcVnrFu0tGa09In7kvrYO2DZFBd91lzyEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0G25VFq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0697606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0G25VFq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB0D1F000CE;
	Sun, 15 Nov 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767794;
	bh=AO8kf2WUcQrljshoByY36FLuUxYn7FM+VRzzM23/a3s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=l0G25VFqUtkyDjvWb4Xcxb4Q+k+dPAhizz62qbxOJhCQn+q/UBxPQiLZdc5mA+Yzt
	 wCceQPAAP87bOdmvuoCE4ZXS+tGssT39xd8UHx3mESj7ONlKlTFDbNjvxgp7W47u9W
	 sStKValVtK/SLoFzqFyhWCCDATFpobj7VFfJt/cP0HMskJDWojUCKwYvIN1LyYFPLB
	 Z6NmzuAm0nHMqnDey63dIvuIw/vdBGMbEigrJtRDSUxnpgsVlxSKGQdsTeJFxM7cjp
	 7jUp6AQw7oQR+2UjeiHu7vuWdaiz1Eik7K3Tj3kcPdTmC6tTgFo1qmMVi/kXSyUyoN
	 8MZyHKTYMw6TQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B449A3808232;
	Sun, 15 Nov 2026 18:36:34 +0000 (UTC)
Subject: Re: [GIT PULL] core/urgent fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avmfa9udOnu4gFmp@gmail.com>
References: <avmfa9udOnu4gFmp@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avmfa9udOnu4gFmp@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-11-15
X-PR-Tracked-Commit-Id: efe191f1605a149b06eb0fe1ff975e7d3137c9bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d56cd25dc0dc3fdb79e1f1df8dc366dabff8ec54
Message-Id: <179476779328.2691368.5265038919453297253.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:33 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 13:02:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d56cd25dc0dc3fdb79e1f1df8dc366dabff8ec54

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
