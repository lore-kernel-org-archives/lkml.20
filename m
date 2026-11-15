Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767743;
	b=ua/SFKDAg+5epowi0Ndzt0p+NR62ZEtaR8LoCnjD8IyOUFlZ0ToXVzKvFRkEuYn7oBFr
	 58j7p1sLtqEiQfxVb1u/jWRlbSKnjNqGONNtzBSm0hZgNEzEJPLxuExCmKuQYs1N1Jyl9
	 PNLjbgLOSCb5xfOVHWMR34KET5BVEuuUPcPo03ke/uW+IOfmEbX3TeUgxrlvAruVZCLge
	 Z4MX/fx/Apv7UTKxnwG8xY9SCol67o7EimXfbDVtsw8bba4sLcjYBYOS6Cn8Q44xMWphs
	 OiHt7GqT5Kgig/R36WVSO1eTTNztXC3IksPulYec5hM4/ZGYe1ICYn6h7vWCsyZmHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767743;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=BQvSITIRJIq/LrCuYDWL3zvl98iDwr6EHjhrxtx22pw=;
	b=VpeGvLGmmPxV6sdFV7abZGPQWX3BIoL6Ld1AuZaK2XCiX64ykHQTArWIiZhokM3EXMZ8
	 Y76oW8xA4QLgxcUAxv4NDWqGjGt7b+qogdA9CZha0Z577Wmdm5+8Bu7I9dnNQHZ5lz36D
	 HTuzNmisChXqojLQIZgnda78Nd5mrWlWA7W6ancsEOiDwO5sw6OcsNgQhrf3agFSskfLP
	 51ulKoQ+2mfIv0SUikCAoBZwjHkQvBEfQ2U29mK5HkZm820cPFGVV55/YR9+HDFA1Ry3E
	 YVNhwQysN6kvJzwTaw8ahLZjqXWqv6zt4l5h0OiYs4KIDBYfTFQrxiMUfwwkjSvJp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ua++PlLt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69863606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ua++PlLt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452A71F000C4;
	Sun, 15 Nov 2026 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767743;
	bh=BQvSITIRJIq/LrCuYDWL3zvl98iDwr6EHjhrxtx22pw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ua++PlLtLWLZp1cN9wx76saG2RJjl0oPwiOJJj65PqGTgHhAYxz1lfxb4fLbzCxwC
	 ZNk6HTvSU60a8fxZp/F/4BxgrNhNiLCT9HUpVGQXL98h/g86twvKIE/t8z4823WWwE
	 M5y5cJg7cZngWUUunoolUKaatPUBelwpRgOdgKfucyR6s58DnFkZgxYYOw5xWwd+sX
	 VWlvcYigvzcPS6jI9re1Ar1xtDV/jq/qk8y/VIBtI76jSYiwd+4dej6h17e9VvA/5t
	 CazCqm0UD9/+zFBsZ2H1MCn2G7n7w3pIITYfkGdsy7Tda8e4x/K5Xntipbz7a2Fc8a
	 Gsg2F0NPK+ruA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A225380822F;
	Sun, 15 Nov 2026 18:35:43 +0000 (UTC)
Subject: Re: [GIT PULL] liveupdate: fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261115050300.1847760-1-rppt@kernel.org>
References: <20261115050300.1847760-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20261115050300.1847760-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/fixes-2026-11-15
X-PR-Tracked-Commit-Id: 58c5852ca96c58cdfdb9646870b217fc54d06a97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04da1a14b9eae1dbc2ccc007b54f46771f9cb529
Message-Id: <179476774173.2691368.12556780418749677537.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:35:41 +0000
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

The pull request you sent on Sun, 15 Nov 2026 07:02:58 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/fixes-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04da1a14b9eae1dbc2ccc007b54f46771f9cb529

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
