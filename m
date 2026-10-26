Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986383;
	b=juybl+QDzq93lLx9lEEgEre9hoLnCICII/gQq5FL9NHTqEGrdxrqHpr88mC83xjJi3zq
	 CF8W3pAAM8Hih5ODPddoHDDG0y2z3XqZSK4aEMd0SsgvMXY375PBoDWNwMja06SyFufIP
	 qVpmfp/xUBU/LSMMH28KsUAybPlf+0f9H+FXfQXDedYfSzz163rX/315NTzeCChlUivg5
	 zH4exPFl5k/rVYvI/YOnddZuTCdFZlOmXnwfojhCVmygH/8wezAtjrkRsKoqUxZCULDsd
	 O4ZzLMeZkHEUZ/0yXJeAv9/O5mCL+5/AC8CeDPiGJWfScK6DiPmWbO+QKhO46lOAd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986383;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=SsagISxi0qI49SXgbaqHMJnTeQEJUrT8R+ZKkwxfnp0=;
	b=xyA6epwGPgNXZOHBsI4PmJkk+gCCChCb1JNWXEKVCo7iCCUt8TT9qVPs43chstPLlUFl
	 2ejqoRNxT3dasunjbWuyw5zyy1SOOPP5EdoKnJ23FzJmwJtq/qkJjLRiPGYpxdbjjnhTt
	 qO9Y3U1+DwHK7B90CXbVvRXK1EjkSg1v6phB6AK1XqEz6CXN4eIdwT/10Yzt/0D2tEIB8
	 x1pvrfyHxupRKEKKcdQW0T8EdEc/6vdbcQuEpJ7eyyoNxcLb+nfpKO53skHy/5YLTvad9
	 eK1eSexXNqNRmHTbzj5VxSovHC3wEETtPrTw2nXeH1hiPPc302D9vb0a0W6EChmJN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iud6+Tsz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iud6+Tsz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1551F01825;
	Mon, 26 Oct 2026 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792986383;
	bh=SsagISxi0qI49SXgbaqHMJnTeQEJUrT8R+ZKkwxfnp0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iud6+TszJtUxwQspZzhQJExY2oUs0SRKiAVJRuYeyMY888SK4n1J/cPhayyEBa49Z
	 GzGvBSTRFNulBVdbYyW7iqx8xD3/CKxIollZV2+drt2bI0jJZon1z2RwNfE4vLfn5F
	 ruGwELzQTvN6dtpXXuDHIobBILCWZZBP9p81GptuiJtyLZKNWc9PLvj5Kk6LqKiA0v
	 MBZm+CtpiVK9102vqVPyc0Aslg6kzisyiKr13+QVNCB3FuopZOi95G3C3El+qD/++b
	 sdk7OwJ7f10ylC9KapC810uIq3HwTdv2vcsrC2Y9U8SjTb0xRwadD4p/lAo294umHC
	 bEpC0mYkM8YYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 447C939EA761;
	Mon, 26 Oct 2026 03:46:23 +0000 (UTC)
Subject: Re: [GIT PULL] liveupdate: updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261024112228.3384682-1-rppt@kernel.org>
References: <20261024112228.3384682-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <kexec.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261024112228.3384682-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git liveupdate-v7.4-rc1
X-PR-Tracked-Commit-Id: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 126ad898a6e97fcb4c3fbe6d979829f72b8c348c
Message-Id: <179298638199.2442679.15503618075883442316.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:46:21 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 14:22:27 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git liveupdate-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/126ad898a6e97fcb4c3fbe6d979829f72b8c348c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
