Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543379;
	b=RXMhwtEKDMfZvpm7hKpKiionsc9nU6v6+7TeDFsrbMPfmxLGI1/U4lRE7OW3AbkIGV6Z
	 oVOtbv4XGLEPOettWPqtR2pfcsK9R1s+Gj/7ChvQ5FEzOdPCoRQqxT0bsz4z0DK0X4oI6
	 A3/Ve8fbrrVRucWLy2D7+Ucw0ad//Eyc3vok6DoegFB8bISs4r/lHHCEmUOLITtaOKZAQ
	 hVzWxTJJfxxK2QvdxAItcyEF8nIwHMRVBS799nZrqqk876jSJF+RHtOQPcbAynfJrUACl
	 7BsR/ABO7Uh1NjQ7fG6/mV6pUBTANLCT93FldiLfDTPoZ6dvDyO/6pP5gt6FjrDhYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543379;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=vM7vMoG9AIjeH9fAdrwKWExYHYdl0SO+7FZRNoge5hk=;
	b=PfYYCRKStb/uoCtTP1MdZfh2Hd8lI0khEDvboMOqwaNpTOr0D1uPVBw0oNKgiaU3ouXh
	 1sJSzWU1n1DjUG6Df1T7/A8y0NkEtaNy8jnFJq3PngJvbox36n5FWRroZZHLJ6Hdsji3p
	 SLhnNYq23AMg21P2Mxg7uYezoLevtzhXDP+FXToq/k0Eq5021VG1+bkemAXd5EcAMMWXi
	 qdmvBKorNhP3mupf4C0fKhj3pMpPHZrnzyYodNU3/j3gJwdzWwd5yuNLs1JJOhi140AvL
	 5VCDLRzWpndYY7uGak++DpT3ZeDay7xOYBFYTjOZOKdSMYYrrGUgIYIbFiA33l7B6kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQcrDwQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651E606A325;
	Wed, 21 Oct 2026 00:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQcrDwQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CA91F000C9;
	Wed, 21 Oct 2026 00:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543379;
	bh=vM7vMoG9AIjeH9fAdrwKWExYHYdl0SO+7FZRNoge5hk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZQcrDwQsC/HIgpXKtiKrZlsKJGyGIdTj3DqrWn60t075CEyhH0Ak3aq4OnrBGEFz3
	 CtTCZm1A6WCu+fC0iqP9rkrNbQC+PXtGDhMJPDCxIfiUzoQfuyJwRXYkBCnGPngq5F
	 BrHR0NUZW6ptGGUE6V5Dtxxdv9S9Aa9K98IaXncPNEWiroKu6mWHiv+RbI72TA+xsv
	 VqdSmEKSN0F888j5MvU+pyRsoshC9xyG8S1TufBe0HMn0s7dWl3279KxTgvGkaDfqI
	 wy7QfigJnoEqhhG4MDoGS/Pnuh6bTNvigU7D7uBJ0ZtbtyFdzThPBLy5+3K0hS5FkC
	 7ynn2p/yPBeKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15013809A0C;
	Wed, 21 Oct 2026 00:42:58 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87qzhk76xa.fsf@trenco.lwn.net>
References: <87qzhk76xa.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87qzhk76xa.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4
X-PR-Tracked-Commit-Id: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14c897740388216acd59477a382de327d5e27ba4
Message-Id: <179254337757.294156.2284201776044529370.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:42:57 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 09:01:05 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14c897740388216acd59477a382de327d5e27ba4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
