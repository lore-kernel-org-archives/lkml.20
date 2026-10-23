Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717819;
	b=LprbqwJWyi5Z4IkFnSDw5Wd1P6FTZqxZotHouwHjkdzWqLhFOUvHOgeozQjI0nEzYyPs
	 CUWzlFLqCJWDQ1WQWiW5q/TzH/t/ITrK3fn9KqEJtOfo8blXZT0qsfae5Rble+KKJ511E
	 05x5owCCGcYIRix7nPsuOfut4N+PojwUqUU/nL682G3RQMGZJfZEWzN3M0DXpy0G4KQZe
	 5D0gzGDuoBP8lRLEUAzWiXKbcfVUF9zqn0trbOyoBeJztbqgRVi7pZ15OL5Zaw+tpubm1
	 RruhEh8VW4dxv0PtleCeNaZLvtxCsBPve2cksqu82sx+oiHGAZiOZDErK1uS+mJ/S9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717819;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=4+v/CRgOp6yfHlbb0YgSd03mzO63ktSnDnS7H3IaIn4=;
	b=MP1Hen8H9n7V4gmeLndVb6wnF+vusoUzLVCFAxrJ68guLdfOuCdjbjnvDO4x2MtiqeLL
	 JEhxN3a30y/3MF8izrCrdS7ASa+04/ujeG1tLcb5W//dyqwDt+4CVzk1Y2wl17QXun3MZ
	 97acK2ytueDd5J5hbR0peJLPVQFZKCw0K/GKzABOsZ5z2rQBagIsb9d2BiLGqsbl2iFt7
	 bJDV9oH2NMigglUJPE2+3qbbmoW1lQN9KsovAvuM4KMy6T3ubIxuceOfRy/Le3CQdjL7Q
	 tPHYpgyU3SPCmBJY5mQC+QeP21I3Tv4Ynxv6EH9atz6v/lpArfYaCgSg1Us/nM2qGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wy9U9q7s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wy9U9q7s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE631F01825;
	Fri, 23 Oct 2026 01:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792717819;
	bh=4+v/CRgOp6yfHlbb0YgSd03mzO63ktSnDnS7H3IaIn4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Wy9U9q7sJYgPqB+uo7OFmrn46dh+1x0qRY+1oi9rQxBPTgYQnZg65pxboWBGZdcYA
	 gt3OGc73CLnFJuQpjoV8r2M08aqDAzH4VO+3H77NCOcm5z7pMObK3VlF2DAUZKnlv3
	 9+iAI/XEIkGNYnEwG3+V3L98n5A7pM/U+Qe7MixupBZoxP8QZs5BryeG5t1qggEurG
	 wXrF3aEQc0J2FntOp5Yy+gLYEU9b1nRiHK10LB8kQ+ST1rdvEx5DMGC64j7uRNe9h7
	 vZQCTvX4lZjmoWYzHaI0Srd3//gXiYlcEqeBujlK8IjYywQdOi8U3VZ/EG4cHK9/G1
	 FfNrcsFIgPhEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4457B380822E;
	Fri, 23 Oct 2026 01:10:19 +0000 (UTC)
Subject: Re: [GIT PULL] seccomp updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202610221051.2E6D9ADDB1@keescook>
References: <202610221051.2E6D9ADDB1@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202610221051.2E6D9ADDB1@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v7.4-rc1
X-PR-Tracked-Commit-Id: e32008340585a12783045c4426fbb963cfa11b7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79132ddf81d78d9b84d9b8f05c7c5c3a3e912537
Message-Id: <179271781788.280548.10810325716658159269.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 01:10:17 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, Cong Wang <cwang@multikernel.io>, Hui Peng <benquike@gmail.com>, Kees Cook <kees@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:53:07 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79132ddf81d78d9b84d9b8f05c7c5c3a3e912537

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
