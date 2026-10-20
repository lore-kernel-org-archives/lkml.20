Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532327;
	b=n+4eW1n1MUwPc4I1ckQgRidZjuaBZxWJaRf1fnmeX15LLPJe0LLZcElQ9ZsgV6+QTBVz
	 IXQteBve7+q++uaZq9gBYC1rsdnzPXOZXYsCNlTyND3eyvFCU8hsEGXgLlROijrFmRsFU
	 hzhV/WCuzrDyhcbP9x8jLY5APkIAhCn+K8cMojk3/vcFdOY3srhxYxZrpMKknOAttd+Ux
	 +uF9ZBshVfjlz6YIwoN+kg3WOBTMctf1iZWbUhkDXds3VMkm/QY1x1Jg1N1Z3JHT88qj3
	 XiTXMxujGN/r/ei7iIs9BajEetUeUv8L25H1vZcwXeyN8w4B+vLg9equeNGLJlk5XeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532327;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1CXjYvEGMbbSLkn9bo3vqNo1WLUG/deBe9HsbpSYz9E=;
	b=gIwnTPRXr+0VwghOKbPiycw1ybtgFFi2qz9vXLeP5bcVebAsTdcyN2P1aQgsMcHtIGfl
	 KJoyEnWAseSwn2zEyvARJizkTCn8SsL56M6B6DgNBiS1/n6VqGrV28sxLGi0b/41DKN3s
	 GxTAfnMybiyWenRmfVr1080yKEDbUtx3ebDRYPxmxxKf31mCVaN7cuSZSrqANBQ05nDbH
	 I+2W2cjjv7T9xKMogckxv6NCKu1ugPk5DlUpxD0Sgfv75SOonWAwGeOWgd5h/M6SmNry0
	 7UzzffCL5RIB7QGAnDwqPNipHDL/2iVyKzcw+aFe+Q/yUj5S6qFfsfhk1WGmwKEogAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSx2EFb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB48606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSx2EFb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE46E1F000C9;
	Tue, 20 Oct 2026 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532326;
	bh=1CXjYvEGMbbSLkn9bo3vqNo1WLUG/deBe9HsbpSYz9E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cSx2EFb7AfLmbJlH4xM5nA72AkPUuC+zrMJXtiy/5Pz6SZCptUZWyPxtWC4PNe7mT
	 h8eCZa8bQ8RmXW+krA8vDeqhi/UX9zG8tqc4wuC4gkAccv7PRa1cQZd61QOT/NOkSQ
	 oZLDesTKqSgEWWlI+TQS5p+l4lwQxPSVpToHOKfm0FlNQcN2vULxeFyT/GVJkI8Dg5
	 nKRL6EiBwNafG7d3zz8LLjpS+Q9NWLYpsOH2jg7JVFMDboSPtirRaTBYhaDjA0BYwj
	 hRz825VN1ZrAkgln53jZGpGq7nWIlQHZ65F1pFc5fw6amMtrodx9OUrrjSnzSsJbRH
	 KqElQhpgOaecw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43933809A09;
	Tue, 20 Oct 2026 21:38:46 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cache for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020014020.GAatbGhNglC2npwc2r@fat_crate.local>
References: <20261020014020.GAatbGhNglC2npwc2r@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020014020.GAatbGhNglC2npwc2r@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cache_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 2c10b3fa5bdf61e344bc522e6c2e00d870ce7ab8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f3b035ba59944ca48a2d5efce40a0c43e52fa97c
Message-Id: <179253232525.225072.4196017320815195297.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:45 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 18:40:20 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cache_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f3b035ba59944ca48a2d5efce40a0c43e52fa97c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
