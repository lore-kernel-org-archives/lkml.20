Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271435;
	b=1vtHhZ53njQMBSpi1hmdqBCVDPAtcJb46iTno+7mg+cBz5IXbNZO+rsNVRmaNdGOhDAE
	 tc1rXJvuOE7KNwKBz4FwTbXPWsdO4bTT1gNZnt3SFOOfn3944zLKOCBHho4Bk7v0hLobt
	 sjX2Zr2gcbiy+eOuZrnSa9JiNCm7hDjAQ2Y6DKDt7WZRQupce1s+2Ia7wBxNtp9JV8/7V
	 sm99M3/HmUe5W939Yundk0fgq7sXN+6bLsV5mEhXnfWRgX6HvvhzT9vx4oD8xYSKZbtOx
	 0aLhTe/GKKTjnCugv4H+nnNtGmlXqdvqIHbMIU3fLK/2olFB/Dqc39huDP0GVGZm9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271435;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=5uI4QashVqFqqxIVhJ9VmPlrZey9F9IXvglEazEwIQo=;
	b=C5YQuUp9SvsuRqr4+t/nJJn0DhwwWsfTl+f+L1nqUP7gArRX8WrAtxqK7WJyhxohtJ19
	 zQfqDChrdcx3Hud+lLReO1gVavqvkmBdBQ/mkoYgCpr3AV/m/2H98NhTcgCG2kU9CcHGU
	 FWtgBDaaUQEuvGrRpIRUdkKj5AdhXEthMnnHAO0vBrlmp+JDNSTAYBcmnUlZfXxt+d8cx
	 /GGeekjwjWx6qlao/UBW/g/x2SKRY7/ssZMqo/z6KoC2w4/qI15mhsr5L2IA4K4ojksBH
	 vZO+AKB930AZWoAZSvIbuj/YcXfap9FxgjKosvoPlT8L+8WpP8J9j9XzviiArxILLaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhOkeEry;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A0860A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhOkeEry
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45891F0089F;
	Tue, 10 Nov 2026 00:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794271434;
	bh=5uI4QashVqFqqxIVhJ9VmPlrZey9F9IXvglEazEwIQo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hhOkeEryNESmYsWdF5lcRVcLLPwv9pfbDYGbMk60aaSFnNOIeHgWPQk9pMJhK+CiE
	 Ty3QXaTaP0rfANr7JOQqM178ZxM2Wo2vip7FRpGtKZUDk4008/aQPmRYqhyygXtNgL
	 56AnBCb8xRsTM9uQrAfndHDN7UfvXY2XMsGRNfwK+PMaKBi0Jpf8Iam9PXR9PiHLxm
	 pPzCb9OPguEYP2Q6ZM2PZ9cN+YJhviQDEEARaHYLuGTkiUEV0SqtIvognhk48OeoKv
	 vwsRTYT5A3Vw9mtLQC4bNRk8mgmrcKCdIoWsafVUyvTZOdrWlnMGHIARtjhuKO+hTQ
	 0nuoYbKEYOpPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B270391AFB2;
	Tue, 10 Nov 2026 00:43:54 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1794219370825486361-2e190190c67cc5a6@undined.local>
References: <undine-1794219370825486361-2e190190c67cc5a6@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1794219370825486361-2e190190c67cc5a6@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc2
X-PR-Tracked-Commit-Id: 1ffd6efb1b58e596ed70f660182803264a4c84d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4fb7e5e8e7e9edc167c3057802e440b77dcb856
Message-Id: <179427143332.3573198.6264187354755333113.pr-tracker-bot@kernel.org>
Date: Tue, 10 Nov 2026 00:43:53 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Carlier <devnexen@gmail.com>, Mani Tofigh <mt4022@columbia.edu>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Yifan Zhang <yfzhang23@stu.pku.edu.cn>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 09 Nov 2026 19:16:10 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4fb7e5e8e7e9edc167c3057802e440b77dcb856

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
