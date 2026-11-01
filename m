Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555888;
	b=Qm0Y5NGCdbkaf/7jE0lshLslDWxbnVhHwznd9Kw1nch0Bc3wPTRuicIFG9ctEL+koswP
	 oE4pj96EmNK+6PrnUuM7t0xjI8ylZpaIIzw7zDOMq8To89M+q21D8b7/DlfSDCYUXEPA7
	 /PStKFUsWS8UcXsmfO9gePZtSizh+C5/q8Jy5wMraM151Rwm/kIjiL/eSbkvmBwf2BnvL
	 lOE8uTjmcSxoxgBc+hyBoSDi5NTuYHbayVsRejfXZ9gpvq+sB/ib0DzDpV4nrbqGB3JFI
	 omI4iKP2zhvlrNs10xsbz/Sa81WG82+E30LCWkKivAm0CIH7ggOamKU0QjQ2Ze/z/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555888;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=gzh7sTDVCUcJ0oqJZAXiX/TMhBda3P8RqKWPb5syMCE=;
	b=R7af1L7OKFjIk/YBw49J4GK64X+BG+r20RMwm6wNaDN+jq3fVMVD4TLeBXImRqbjTkOb
	 rgjzyXokaAcrQK9c+KeHghofQYKt+hlbN8LGuoi3RGIT82KxnHfSC3xnqbT1s9GXGEQKL
	 aRzf85rG+frUXvHvmXz53dkc4VYsVO7/jY00D0Pz4TPVMseBfDYmYmUQ5Wxj6p/Er+vhx
	 lox1m5xFkgl62Z4bIYSNhhWpaCndDAp52jSKQ9GxbcpVxHtRfhNPGDyDYUBkGyDFPbaFs
	 qdyXOJ1ys1LcmPRfM7KkXdm8Ndz3Q+9Z8O8ACP84nlxeLA4yLHLb2Lp0j+/pQzhPr/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ey5G1ON8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CED606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ey5G1ON8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C632E1F00A18;
	Sun,  1 Nov 2026 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555887;
	bh=gzh7sTDVCUcJ0oqJZAXiX/TMhBda3P8RqKWPb5syMCE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ey5G1ON8Q6pr7vt8tV6NSkmtaIcGN6lPUXyc8bkVWjWOtop3FbgHhpwmnwgxLfs29
	 kYK2C7iyzmWtIyLSfdX5i3crLDWKcpy30ikOct0VoJwT4teDeGBvgTaVDHRNXFXOC5
	 eGYdfZlCn+2pahK8CXxhK3mG0yFlD34DWYyAIZ+gVAp3bzfWpAsfoN3FhJAVz6QYxp
	 zUHLn9pDr3jV/e5wvFmT12voiXU7vm4MUzbERuSdTr7c0IvElp2/b4XsD+YAdRFOuh
	 h8QEDUDE0z6esH4ARCQTQ8xESJ7haAXEkC2R/3b2yGnUHiKwU4HxDeJ70egxXOUbvT
	 9K+dKEYgodSWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA25B38003F7;
	Sun,  1 Nov 2026 17:58:07 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aubkJIGfvTyJYAAY@gmail.com>
References: <aubkJIGfvTyJYAAY@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aubkJIGfvTyJYAAY@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-01
X-PR-Tracked-Commit-Id: f322d7f7ae56bce728ba03a387e35380bc4ad939
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a3d2740d1b1b5ed8d22e1e5430de3b5046cf6a9
Message-Id: <179355588632.2549645.11503450465686236614.pr-tracker-bot@kernel.org>
Date: Sun, 01 Nov 2026 17:58:06 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 1 Nov 2026 08:03:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a3d2740d1b1b5ed8d22e1e5430de3b5046cf6a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
