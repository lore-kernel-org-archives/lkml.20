Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986447;
	b=S7IBw3IGHQMB02orLwtqDkyC3ZoGZ3IlFX+FagC8ypKByXjozi75+fHL6jVdJG4tknLB
	 WSiQwzpIZtRxx9xZKG1p7ne/Nk+JaSCr5RKD+Aat+Mt42TxwqIMWrMzZqUkRGREneDrHU
	 zlghD2Aq6DeT5PnLGtQjPfmUVScfHijFuUoECXZPkmdUV7KqhbOSBHCukUARFDggiXox4
	 G7VsUcDoYgczPf8zsyqPinsNLfnVW+KQwbixVBUshy0FH651ZkKZhk/rb+wVrIYOR+6ZE
	 UVcE6sVSwpHTX+1vXzMFJYfDdCQcFty7HcpiRrnmefKYKje+1HfBoKeeb5fURdMgDQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986447;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=CCYuejVUIALst/S5gU64ycEPiY+AtDXMAMmJCZRifsY=;
	b=n2+a9gmjP39W9nrN0xUtxXV9l3U3aBpyKAxwW4TamhLPYbrTy/PJtFaIxyLqdPwawFz7
	 3tRK2ASDcuaxvALpCbUC49y+JMxiwAtUhwN/bUmfhS3sJ74kRU1MBZYwtPaRwwt1CB0ue
	 /kyzoVyQpVRg41N09NI+JWoHwF8cp05fWHj+ps/4LT7EO2kPG6Hbp9UsASgaya2Txly+e
	 4g4ZMTuqSzkmBBPfqXdMV0qN3/4i881Prik81rn/B0FrjNGELoAGQIpBMmUu8tjvjhGca
	 BnTGjEixiacpjRZGxieCzI9ecJk5H8bASLEI2P3AWTtuz+F2vm3qMLT6teFhlM0auig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4ES+d2e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF107606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4ES+d2e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508B01F01825;
	Mon, 26 Oct 2026 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792986446;
	bh=CCYuejVUIALst/S5gU64ycEPiY+AtDXMAMmJCZRifsY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=P4ES+d2e/n32tJu0yNxQayVAkboLWrPCuuL/3JtQ23sQPlUlH3QOzGpauLRebrjJf
	 7x8kQvV1o7fuBTKoywyMX1UlSMunuAC8gu5BQb/1mTpr6jyTXZmW6gADYONx31hUVc
	 hCdfipO9MQRi5kdHQDZPdBfYq6ZcYjjfqWyD/zYNBfKhGFM6m+nY3OSj6q46ISmADA
	 yf/KtTyRQxvxd3/6dK5WMNJ2i5uljom+28qRnsIsqzbRsj3Z9AZ+D5hDCz7P8Nf4gB
	 dnV9pgDGe52Kk826S1x3tZTplJGQ4mUKa90JM+k4cLGAltugJfKNvukOjighzPcn1g
	 M7jaeBYWWc6vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4446039EA761;
	Mon, 26 Oct 2026 03:47:26 +0000 (UTC)
Subject: Re: [GIT PULL] memblock: updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261024112131.3384572-1-rppt@kernel.org>
References: <20261024112131.3384572-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261024112131.3384572-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/memblock-v7.4-rc1
X-PR-Tracked-Commit-Id: 7933ad3f669670ca5f5f13de2b5cb0f92b91abf5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 394023fbe34fccec5d4db2576169d21e14c8d3d4
Message-Id: <179298644480.2442679.9705025768273724945.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:47:24 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 14:21:29 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/memblock-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/394023fbe34fccec5d4db2576169d21e14c8d3d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
