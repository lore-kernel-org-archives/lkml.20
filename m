Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693863;
	b=W0C3qOQ9qXauDE2r7ee1Kyk/vCTszITh6F8LduTKq1oOfhcWLnZWp1hHkuoisJ6jzOXi
	 eGJ7odj+CQwlpVuOBwyyba0CIjTRFrRbsACP7F85xsu2N8JEyH4DYPw7yG5yQqJ3VMu5t
	 tkxpizx7OB40IFnYS8K8iFgbkcUNgpjyPu3VHvX+rbrKqrRxrCYxeHkVgmtqONhK7sd6X
	 dCbsd1263vGzhffVwBmKwizc+mCZdZUINBjMNewYTZ27IcOcwDwygQtshKGFp6lrmcuHi
	 zc2JcnFLq8OkQLH+s9vMj+mZBU4AU5Sv2yQmTY2EizYDI+2mH1trP4m9kIWuUsxhq2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693863;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=bmCDsyneSFB1Q1Y+EnwxKUfQ2U+xJgsnpcG8682RRn4=;
	b=WuT7r9Q45asCsmhy8ZrbWuj7pExS0Jr0sdGRUY2e3dmxvoVJhoxWYtoIrgHI6HKYqj36
	 6CxUx9BqU2APQcZhuIgDSrsACh/hfJBQXWI03MZCOtGXmnYo32m4qNj54m42wJ6RoHotp
	 MAjO+JWkh6meWDeCxoEORQ9L0ADMmtCm3BrBOTP/CMXvGvuKXbMCRpnitBW3xw2D63Hg0
	 I5GuPyFVs9sbpPwYPyTDlx2y7FfB6QnTIc3UAoWVH23UBASPAmfmKsxBFnJ9421YxC6CH
	 j0uEGkxeXWXnW5oBVZEIhgxoP5o7N+jZkXCL4szKbsimDIyFUsbSnhvJww+dOGzXwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7svluBK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C7606A332;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7svluBK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448691F031E2;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693863;
	bh=bmCDsyneSFB1Q1Y+EnwxKUfQ2U+xJgsnpcG8682RRn4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Z7svluBKFVbdvUc+15UIfe5doLBefPJczEQ1mEk2CWeDUj3CINkfqnztU2x2O/Wjt
	 gtUgzl1xs1eKO2LjppVzcu4TpeM2fVlNQjHe/9KcnC3qOtZCuq1pEM/tLxi5jjlqny
	 VMre8HbedR1IbdJoBAk2HI1y/bYkHwmsuz3eXImKxhcH7xHQeoMfOqxZIBxNaU1HYa
	 B3mzlnESA+02UgLm3MkwclmiNQgijyw2ouSyOTGb2R9WsdU1KXlKhxqBIXuzIfpfTL
	 p1AULBbtFCfRWPKWgdxuAXsmLCIyXEwJZfoMuL1UcLbsj6ND1sGH+ZHz8asRKGbmzE
	 hgj+NBrGfV0yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A493380822E;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4
X-PR-Tracked-Commit-Id: 6db3ea21a541d34e45f3727b71575424495df44c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e092c2be4320f06dde1206652746ce0d83540b7
Message-Id: <179269386188.87271.15608062536872321174.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:52:11 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e092c2be4320f06dde1206652746ce0d83540b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
