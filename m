Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619026;
	b=nue7A/hBIAZ8/aCHQRcs1vkhlqkuPkvVA6GXnzVJJlzqRJDDU+trLDZnOZ6QlJ5O+k3V
	 q6DQuSgIPM+E30JtMECauBmvSu6FdIJhDVAnzaj+3bAm78Nub4B7yOhpx/0l7BGx+ZcfU
	 /pBmIm/Ke7m76LRwYuDhE0wCUoMYg5e0sX6hF8FPsLMfN6oidb6fE9myCyPpU8LnOJ4a+
	 3wwA9iG+Grt9bdJdaWHbF/EKLupUpjQwZ+YX0/+IfOoPghL2g80OcODg/RKVBcWmz6+QB
	 OdyJ1F+mefzgYmuFhRoN1UjOWPC5qbCjw2WoNuMCAnOaKfBEqQiXAA59Ny5A15zI+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619026;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=rYsk12QeNO++cvHj3Ea3ONPYBOSUhTGLs9rhdlrjSbI=;
	b=iYdyES7TvNrqlnGbxNN+uPmrfJfVByo03XdSLUriicnu351DLRiBNmW00ore9gYKk1m+
	 hqFo0fa/eodQkSGV05PSA0NhFQ0Pq/O3CQJw7W6wzXU6wgNy+Y+FmuCZH039WeN/qJULi
	 v2H4thsGYr5Ox1/12TCIPMiWqOTFbLxqk3yn/C2yfu0DO1fbcq0YC6En34q2yOGUpeL0u
	 94KrSTSlTv8koWfamr6FWrXwx8Xq7WK98aMcbdysyPjZi/2t+yHa1WVJYwmIPdoz8GNgN
	 V+SQtb4huu5XdjnrJc7VRHDH2SBHcBuui1/IRh8FGkBOtBvQs7XhpycofMbVUnO7xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNHni5hH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D8606A336
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNHni5hH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8781F000C3;
	Wed, 21 Oct 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619025;
	bh=rYsk12QeNO++cvHj3Ea3ONPYBOSUhTGLs9rhdlrjSbI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aNHni5hHzsoY/mDouvDadCfAK7/kfrfsmQJvwXFH0KLoiF/x0snJ/jJi8GjO0LAEC
	 wC4D0NDk8KBJtEcP/2pXKAEtulnrbYxJ4Up58qMhIJd6c4aNolGqb70GzCVqaBxTIp
	 rI0pm283MeCSNOQPF4Vp3lfs/fJGuhoKhLC8AlgZM5NbvzoPi0BbfOv2Ow+WL8zswp
	 IkC2WGXidVkBCQJQ3zDzZRL1qPuXA0MJw3ueU/2fXPkg1lLH+H/3bYbHS1WbqGDuk3
	 ThoEY5LjKMEx7iTCfyH9LElm+7bFftiwluBYLMpHlnz/oB44PyTrGi/j4cu92+Vxg+
	 vrQ2i24HNracQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4435380A962;
	Wed, 21 Oct 2026 21:43:45 +0000 (UTC)
Subject: Re: [GIT pull] timers/nohz for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257622916.804100.17004121923108744629.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13> <179257622916.804100.17004121923108744629.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257622916.804100.17004121923108744629.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-nohz-2026-10-20
X-PR-Tracked-Commit-Id: d305927765cf6025bc11db9d96c06ea663230ddd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ae0ee1ba729a0c55c2eb8593fa708c23b66e1b3
Message-Id: <179261902430.1324168.4923735660564328862.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:44 +0000
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 11:51:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-nohz-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ae0ee1ba729a0c55c2eb8593fa708c23b66e1b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
