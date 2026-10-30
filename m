Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401832;
	b=dyHo1wjpzaivAb4ecDsjqzloGkX08rQLE7jaSY4kCIYSFzFukmfsz62PCuuTZTlZmMBM
	 xhIWRxC58XQ4sttsLqOFjQiuZbtDU2Hb+nxUsHLPPc0rrkeKhoN2WtVq9FQXomaMZvnsl
	 T45oTBbCzsakB8QM4QLm8lmq9o3hB/GXLT5KqLtMSdA/SqCniGu35XuIBgZ/L3uzXVqSb
	 Qt7YlyuM4gvI6JJgCFzmvgaYeY9WwZKuNRtDsafe+bTSegcmg3dy909Y/N5qLR4OBIrPH
	 sNYN5TYMIHcECwL8+s6mCPjA0D7EbbAYQ9dbL+RL57Wsnfngtwu9qVJh/ItfuW7X8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401832;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=T/z4ZyG4Jm0IpSKIxE26QgcgJ4ZFld30kq1R279Lk/I=;
	b=qxYvV682yGhKxDMFc+RqawO5G11ZBRUWMAwghUxJ6OO4enExgfp7d4TkKVV84sTfK4fL
	 bfFM/wo06jkuR6eM05E6e2XOCSPQvgzBDwn5Xlj7dk3TGuPkfiqiAItYk5pWvTanpeiVy
	 wvw+3GeP/xhZXTSacESvKh6NFgp8r0MbvZ8ygewGGYV3jESSlsPWaHC11stQxDBUBwW5k
	 XqE0/wktfUjFYa4+hNwz4eudYjF0uAL+UDwlzUXxvY29j2fnRwodcrbB2LlQCNeTY1+Bj
	 nzF1G7pJ1u/1TcJxumF9l0MWD3Cq3Dap0SYzD08xzymqqxxO+eMiEzVFMdTVTRbty8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFPq0KXD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFPq0KXD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57D81F00A18;
	Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793401831;
	bh=T/z4ZyG4Jm0IpSKIxE26QgcgJ4ZFld30kq1R279Lk/I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LFPq0KXDS/E1aIVTwRCDdcNEIJXLTu1iNBjPEnifbQEwbF5GAzSLKT5RI16ow7Trm
	 MhT6LUDFbByTw0VVFmldIPRRvC9a9Pje5b/bVOGmZIK3xf1/+3wpCNFtK89N7FeE/q
	 TfpULuNCitLyCqnVzaVGd7IvbNLBAGvVgwnGYNbe9wMt1JWWNCDdWv1j2ExoYsQKsN
	 LJ5xEX7OQo3aHuDsIhluVAhoObLmNEAmmkkbX2vByLKlGs/GJT1RubyR7mPcF5QO3p
	 xC+vKFSYDYhtU02LcokdX/Cw6Kboy5icp9HUSZ2U0rRZib7TPWYbK97+V0iTJL9IF9
	 mL6nLI/d8d6Ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3843800478;
	Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <auTg9t-da3RFo9nx@arm.com>
References: <auTg9t-da3RFo9nx@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auTg9t-da3RFo9nx@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: f46be4da2cbb17574b5369517a9a1e1b414063b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e07889d8fedf729282ed14ff202e06dbb67444b
Message-Id: <179340183071.1820250.17892758964850630795.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 23:10:30 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 30 Oct 2026 18:24:54 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e07889d8fedf729282ed14ff202e06dbb67444b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
