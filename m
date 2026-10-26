Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987156;
	b=iJFCg6oL8YUPvZqk16hrm3aQ2k54/Ev+jvuCuQ8fZ28uB+rG12bXaNSwzJ8TLQNATBGG
	 zFqmkIZcw02xMHmyRA+H5dK21UjvPtXDZUEmhx83Mlk2TRS8k75IzD0E0khrH8zxWUvcU
	 xm/UU6DF6+aYREl/XUtmnXjcMdQ23XFLL01yQoiAMjYozv+0xatJk46YVa5CVtbTwnKoC
	 cXb76LfBZ/+8hciIsZh75fHHqQ2kcn4pUIWP2pxFVj4yCuV1mi5FlPlsgH7i7F+n2+LHO
	 tUr2pYb/q/bgXPYBy0aREscMBFaasDBDoKUGg7N8C6HeR3wXg/LB2GR+xFEfI+klA/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987156;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=G8LaysPm+HW2HPRzSYK4X/0GEQq2VmUzm9gEdG4VVpU=;
	b=mk34YBVx2yK2PuFS+Cy9BnUPBiRfhIp07Eo919D5/o/NtJeN58HbYd6vaKGR+NQWjfLk
	 XGXux3FR3cNU1154QoNnOwjURI4IPTdt//0TxFwZUHZiXfDglwQU6UpVVWmMzh29PjD0d
	 kWwDCd7HI/J6mMvBv18jQpuCb3vwWiVxOo2OIy9SfiEz7rrzXQu1uP2wYjyex0DGq6CUt
	 o6HYzWMqyDPt5MU1HMtCtr+O1R17HP4CzHy4dxDUbdWPbnXyLGki64FRKAlbIrkU3AN4T
	 krG14Qz0sM8Z7HEfYnywCsD/JOwOFo6J/4gS/RCgwiGgcezrz0m7he3/AVVdHMRxMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HogkXXn7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HogkXXn7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D47D1F031E0;
	Mon, 26 Oct 2026 03:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987155;
	bh=G8LaysPm+HW2HPRzSYK4X/0GEQq2VmUzm9gEdG4VVpU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HogkXXn7G2/RquRotO0/5mSFSZwkh/wkdi3DIb8nW3f/5Na1OeXs8nYM3qSp6akwH
	 wNArmb0oFkXVcyBt+cvS8jrzp6dtDHSQpWQ0U4dpuIySnv4xg7BxNWPTWKMRo2wNcY
	 gF8omxXLhrVraZbvvu3wBy0OFgnrpqFi1SWlUrUZiPH9k42Cxk07ris02+OaFxY9t8
	 cegh3hajq3Wy5Mxf8v1M3JHJYp7Gi7eQTbj+0QssmLCmekhH/FPBIZbhOvgTE0pFja
	 m42KRzhquobP5YB/JbAaqbRxOq0qcvkxA/FbMzB5jKC+jg7N1k8QrDULr5c99+EPQz
	 hvQEc9EyHBN3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4431C39EA761;
	Mon, 26 Oct 2026 03:59:15 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <at3qMRdAdHcJt7Rv@gmail.com>
References: <at3qMRdAdHcJt7Rv@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at3qMRdAdHcJt7Rv@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-25
X-PR-Tracked-Commit-Id: 108775fa28fe04a16f19a828a779689f3d0ea9f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d37252fc49a939d005a7495b81d1bb337c29e45
Message-Id: <179298715374.2448250.17546515074628633139.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:59:13 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 12:38:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d37252fc49a939d005a7495b81d1bb337c29e45

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
