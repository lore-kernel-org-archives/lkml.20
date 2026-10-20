Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532321;
	b=n8EP6G8noHkyFavVN5EcrfDpaZzGqNixiP3CRPlrUypKom0v1kFtrr9F2T5gWVfkVxxV
	 a9jcV+qyG21wc8fhsHWMusked8NTA3tmXGnMoGRujDRA7lTZwHxP1MVKkWCZc4RTaUrpJ
	 oGknLxv+zDrcyZevcNle2VaDVMvXMqgW1D0JPM6jPlpmey4dQkpSb2I4oY22NLqBBLO9g
	 68pGdTjPa8Fcazvs4QA9cO/QVS4fKLWg2OhFzuFxuu/WSkGgd7we4nyC71dIQ/Mch/CdO
	 9Hwaxl/tZjGbHqSOTW6cZxcu4svEylVgwf1bwvqLmavi3AXjYxjXfYXgbQfVTnmt/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532321;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=5rAz8EdqE+sYyH8K+SXi9skrCR5HrZwgTKH2kAsV4HQ=;
	b=kAPabmEBIHCSgJxc2OORv6NyWYY5PG1nAsrdYhbPMuPTRiUZGkQhvMyb17gPNffbkXqV
	 bc+EtK0bNyf8oWRtZWFk8T3b6R+PVIsJkm8v/u8y5g/A+ZRJDPkV9H3ronNvT/krIh+dg
	 lclwjkcRMtJUbNNxKiCIXFRbYh2FgRQHSAkSeX/70zaF0q0K58UKOuBJHyL5gNGicQ5z6
	 ATkUKYTyn3U7HpHg69yW5XcjTK0mgfl2hVrKcuGNxcI2OBPKd1EjmEcv3KoYPgafp1Jmc
	 +qhHOyL0K2iwYvAis4E/0jdJtUj4FzvG3uPMQKiZAmViEhnIuzX4va9z7Vl3lGuV5Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEbuxrX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D67606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEbuxrX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440381F000CC;
	Tue, 20 Oct 2026 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532321;
	bh=5rAz8EdqE+sYyH8K+SXi9skrCR5HrZwgTKH2kAsV4HQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GEbuxrX0j+Hs7xKmML7njsb5vVOBf2k8qXLX/HZfOQTt3IsokPIW7m0Fvq5WUHyyO
	 07fR8slhA2uSf1zhFgEf5ImC8o3zDqisax+MHHbDPGuPdU9mUxIs1vcuP+QfWhj4w/
	 rNcjnTPePE1F+tmMOgP95P2w/NDjGzIjLEIZCYFufaCpPNUR0SD/z6wBjP5aVixEiB
	 vvEU4yKpsDgGJ71fF4M6SdYtmxTBms55kAJ3bLCT3AUONPTIOanZf2a+Q5kqTFartN
	 7LxAix46YbKsbm/AzCdepfds7UCw/5eCKVmnXBICCw5v32k6M79Be8k+zn4dt+bG58
	 B0DVYPsww9VVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3FE3809A09;
	Tue, 20 Oct 2026 21:38:41 +0000 (UTC)
Subject: Re: [GIT PULL] x86/asm for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019234110.GAataqlu-wKqPxwsaU@fat_crate.local>
References: <20261019234110.GAataqlu-wKqPxwsaU@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019234110.GAataqlu-wKqPxwsaU@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_asm_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 966bbfa5f24f601593a0890154e3fb5fddc51e6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95731ee1311a91f20c24a303bbf5c0c2f71101c0
Message-Id: <179253231978.225072.13608640736930948779.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:39 +0000
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

The pull request you sent on Mon, 19 Oct 2026 16:41:10 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_asm_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95731ee1311a91f20c24a303bbf5c0c2f71101c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
