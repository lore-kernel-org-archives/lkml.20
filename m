Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532276;
	b=t43jAwR/2MwVSP/zYBEaiH3b991x0JXPU4rVCG2xbwiv8BF84SNGu5mSSG2beoDZqfrr
	 YtohOOOoPydAfQEdUj2MJEObhFkfG5a6urNM3lkn/PcSn6POlhOOP2Qd0wQJYdT15jz7U
	 WYml/lWQYwYBoF5F8jNnewF0gnp8Ftu0UbBD/eH5ZxuASdrVrwXMwyYXJiHZdTwkJusaj
	 +PS09lnUZEXGvbXutfumbyTNCvQNw/mK7/vGgyRw+027Ljq/rYTMiQ8EFkb23kEhfLBQV
	 /v//LfzH7CE7ZrNXX3qM9X5bOoVAKvrNKO9mgjJw95tThnzoFqG2jNLjUmt2cHZq5xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532276;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=UTHSSIiWTYm/fsYS1Pb2MjTtkwKBTbxNEjNzU3o9JMc=;
	b=C8WAmjIrgKrAy55kzY0eaOGC9YVwD1Sj4uzAZrDAUtajWofW9aK1WGGBJrYY8xHIaWEm
	 IYKAqMpdE4evu2UdGNp15TpH3AOcRSgxnDpeCkUNowkZdfib0jVFHwaQeCvE4pCZ9Cyr2
	 scJ/bOGBFoCl20qc+EVzfQG7uqi8vg1p2neGe22e84rM7jGjYlxTnfhz1MABcNsbDAk4w
	 zhoQ3zSRLrl1JJLjk0agb7J5nG3N887E7hhECAkTj5oozBVAKCpOdm4i6o1ln9VGsTQUV
	 4AbUQvphluTPvGGcAJzqIEH+mJ7+CeI7NXWvSfLmm6FfbYFFS4W0FwbNGU4SmIPyq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boom0RZ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C63606A31A;
	Tue, 20 Oct 2026 21:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boom0RZ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080F51F000C9;
	Tue, 20 Oct 2026 21:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532276;
	bh=UTHSSIiWTYm/fsYS1Pb2MjTtkwKBTbxNEjNzU3o9JMc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=boom0RZ7EX9GXVk2IiDm+5kjSAeB0ClBVZEQWPGw/lE4eDLgT8ShLTn1WvjGV7qc4
	 ZF/mngOjK4CfF0Gbfyy4m0UTo7AZl2k32hFNqH6mLvfFspo2oQO+LwJN3ADR2NimMX
	 m2iHdqxgb72EqVOdvolNz17TwJ541l8c6wVBKwo/WrtUePpXAWFZCUK7D6xonfkEdO
	 7SPVvp8zilKm2ynzSZdcCj23q9wb+JVTvhMalkOfMBcUjtl0tESJfRUZbXNqosVzQP
	 Iv3FjfefpfFc+u6Ep9rNOxFV0AHacdFbBb3reM1aNVPi3T+o7+1Y7MbAgfCVAY7YZ7
	 Ea7hVdRIt7dfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16193809A09;
	Tue, 20 Oct 2026 21:37:55 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019182708.GAatZg_AcjQ76Ubjvt@fat_crate.local>
References: <20261019182708.GAatZg_AcjQ76Ubjvt@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019182708.GAatZg_AcjQ76Ubjvt@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 5dbc181a22ae397b53adb26bc083f206b9631c83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae171014b7988fabf1dbbc7cc4036c416a5b0230
Message-Id: <179253227446.225072.2702571477022100269.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:37:54 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 11:27:08 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae171014b7988fabf1dbbc7cc4036c416a5b0230

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
