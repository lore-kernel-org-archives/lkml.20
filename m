Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693865;
	b=Ue5RMmrp5EiB3rKziMAGhbml0qd8iADSpfN8G2WYGpVl13RK/HEj/i+vuqhMHlre73yw
	 NklodYt0N4xR58liEgsHxSClNuBVSjpD4fVNkGST+xtmm72k+Cz5JClYFfQsKDVmJY77s
	 kzq3oqf+xW+Eu51wZIlVlw5UE9HG6nKOxPPiQkEy6xImO0f0EHGljL2OteQX64FqsrPR6
	 9Ft7sLnnuZ0uorsQ8mHqy+P2N20OIPFZkXTw0vXRniyFKyTpQrwQ/d++u7exPCVR0oVME
	 G/Sp4NqEXVsLsGrmrV8O21LeeTszU8Ixk+31cL+mLd4jy1RYkB0ngJnZx5zzdR7z1fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693865;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=EHFCa0ldhEsycNZ0Rgr5ixDYvOQCY4C+G0NWVzg4/rk=;
	b=UHxzap4rL1xneVxlW41IDPtf0XgoWLUsTDVofRLKaUUDkqETbWThmaVhoh/NmelsPE+u
	 KraoOvUAx+qZc8l5rmrYNFTI4zL6lUMsusxwlW3mjNqDCS09xT6lEG5E507aERQ8zdft4
	 qn58+RbLsn/+P4hZ4OLGgMcqWmAuQM7E4bY09Kxv8u/x4ZpmND3KHNOl77RGDhsEfbBUW
	 nEaRPnHOgu9tiWBPKOY5Wk8qkco4Ll50NHwadMC0G9ZWLcvMzLT/OzBOcRxlMo/rCv9ar
	 thF1yP5iLpNwaEvkmo5lZKjgLaTgrVO9aw+zjDQEsh7laHL001PWT2hjLEekRI71y8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOvnTlYY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDD606A31B;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOvnTlYY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84221F031E2;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693864;
	bh=EHFCa0ldhEsycNZ0Rgr5ixDYvOQCY4C+G0NWVzg4/rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fOvnTlYYn55hll1L9Gr7KZg61MsC9JmYisaoXP51fv/cvCkskqixPR6X66LTZbbp0
	 WTFKDdI6EwfiJLotFyIN3L9YR8Ud1uYR8JbOE36tCNsLhEyfvuGweQiwMlqPVCSM+m
	 3HvD1pkxUIYDZqfp6H7zlNK1+/dbOeBFGIARP9S4HI3venKfNDk7tXex+5hBYtklhH
	 3k4xsDrkG0LL8haBe3TkUMMSe49bgREDTrcKScWX7mopUtuGkacDowYdlr0t2LMzeo
	 PyIzMriYyz30LofHI12sjM8o4aJl/2IpjX8f63QouKQo4B1TRhSDHLhPkQ9nwREUlt
	 otjA3FB3daSZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE6163808222;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm board file changes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.4
X-PR-Tracked-Commit-Id: cfe69169c03e71e2a22870317ef4cffb51f6f06d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aad73b807cd1a5bff9c5277e8a42e75bbdc8adab
Message-Id: <179269386359.87271.16249924434915066293.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:03 +0000
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

The pull request you sent on Thu, 22 Oct 2026 10:52:57 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aad73b807cd1a5bff9c5277e8a42e75bbdc8adab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
