Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987151;
	b=hJAl/CAXvH6GOrZlh4bsoXf+GbSwdco+UmVoz0E4BvufrmTMPP7W4zgrCoLzcoWAPZiv
	 uN+PvKmjgfRLDfpUo1vnlF47JsDMJNYVYdrIV+4yQ+h9jRrgAPEhhlcs3zDVhy3Gr0TSU
	 25sSsGnxbnGFeeJzxbVo+ltIoPPtQEO9Z8zTvr3l4SeufPjYbUDFZnKb2+88OpUbU84cj
	 5oh7vAGoYO3ZiOJ5yyEq088gIILLJRbNGwUzkQEVyYh1UquNGqjAsvAAIs0DcW1+shs6w
	 yaRYjU0s2b96vUeBwmdx6sX8X99NWapgWTPT42DJw+2AJazgyUVMLdKqy5TgxYNqM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987151;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=+7wymdGwZVGsFUSIQTTFGgplNcsKX2AWvGX1Ec0yQn4=;
	b=MYWTGfQ+yb7ff2iba0dtcp9wXHo0t229R6/uOiNLU7r5FzcfyPyskoYQlM56SFMp6kAd
	 TsqCQLLeKkajwRwL6nlB+fxSiWnXjSQmTpGSBrO8/gwvhkBdxsUz/2KmqGMpEdKozvufS
	 U+8NVX5RoayrDew+LNlp8X5mzFRkz5ObwP5m/amEPDKzU+Yex1vfxCpHvdD+qRoQs64yy
	 gpl7KRq3vMSTExqj95ZKlZfeGQUl2nGlBAJKa9CDztDNxGGp5aLOijoabfCvNWmi8A/ZI
	 TqDkzEcDp4OgFR7lOuR/hjAkL+G9Ofigiftm8YQuf5nB/ELeEhZdkAmAr1VHfnFI29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+XskiLk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76990606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+XskiLk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F6D1F01829;
	Mon, 26 Oct 2026 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987151;
	bh=+7wymdGwZVGsFUSIQTTFGgplNcsKX2AWvGX1Ec0yQn4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=I+XskiLkvKTJ1/v88sjFPozSnHQAAJRA+93fSXlQSN/3EZg4533vEmlp3rH7L4SlP
	 tRAyAtF+3VpKNXdNVaV43KOLobHx/AprWNoZjjChA8cJfMOkCTcBhfYGiouXoncDdM
	 eNbickvqBQzvmffDuDW6txbAnvCNM4ZYFBcLHrGZcWOCb8s+NynBfd9aL+Ob4CRAg/
	 2Yh2x6hONJQXGJ4RIMOmot3yn1760Jn45eMz/iDinUnd+YfdEDqLYyQLgrj7YuTStK
	 i3ppYPheRCUVbDDjEohnqbFR/PexkZ+MNSOlwt/zxUAsa3uP+H0RMDFYyDGl392NlX
	 O2dAxNlZsAyVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0732C39EA761;
	Mon, 26 Oct 2026 03:59:11 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <at3l-1cmp86nIe9M@gmail.com>
References: <atSQkrxwvS17naGH@gmail.com>
 <179234732347.1771961.17707846016194485544.pr-tracker-bot@kernel.org> <at3l-1cmp86nIe9M@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at3l-1cmp86nIe9M@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-25
X-PR-Tracked-Commit-Id: cac037a85c1971ec75c4d3edf5a28af9ec2a089c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e723c4f9417663c318d898fa113af211f48a6da
Message-Id: <179298714950.2448250.13466230457999003999.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:59:09 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 12:20:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e723c4f9417663c318d898fa113af211f48a6da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
