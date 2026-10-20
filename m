Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537823;
	b=vUCdfZa6b2q0nTWwAdZVGa+EE9+i1hZVSeWE0RS95uZzT7BP+ymYFuuoQwybJtSWIAQe
	 5+RD30LJpJBqXwrezqdcF13gJTOo+Qy7y7C5KrdPCJxu9ZHq2dgU5rjaD22bpGZVjuebL
	 mPisLbz3i7euXQsFtgwvPgRYfjv44KHTt+KfFBNCcn8hi7LBU6YWVWUzwLAv0qIiyKzlN
	 Uc62MCHu6O6ew6CM0n0cPNN+of1wl4vljMkHK5t5FWhOxR4pxFjmSXQqM5lKnDUyPKCwZ
	 sDmZzG1NmvkXTOoQIFARMwO+GLpB3B6APkqbv33Fawlv5xtBTFXrSnFQsSDPav1AP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537823;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ILIjVekA2mxc3kC400l5Y6ZjGHvPTtBxvcxvJ6ZO/xc=;
	b=Gl/q+aRw0t6Zf0L72l0OVeK509zoYM5UY/z598IWdAYN+l3yBCAyYatchnll+fxPYi30
	 ID8PpKbEHM7jaz+EUw8WCx2v2kHKhq6WdSURRb2NALXoRdDEPXYC5kx11DEQF+2Q/LXtY
	 VsIwAp3OIEpdipt6rRC/fooq4ogPVHG0A9SXrDUREWqNGuxazih3QDGYQnLcrfEnHBHNr
	 tnyoaFi4r7JWV0JwTer0ZMPrsOm9EE+xIS1mXnAz8k8McFElfhZAufWBP96lcVBdQCkKV
	 9NB5YdRFyYp6Ff3Sy+0Kcg/IRezX4/t1JDo8u5a2IiN73RFQ/EUVCaxjFLdru3raMVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ly+b/XLw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF0606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly+b/XLw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403571F000CF;
	Tue, 20 Oct 2026 23:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792537823;
	bh=ILIjVekA2mxc3kC400l5Y6ZjGHvPTtBxvcxvJ6ZO/xc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ly+b/XLwM6kIrPy59Ew4bDngnQoQrhphhBk7OvrK8kxgDUK3nHZe0Alj+60e1vfFc
	 LgSZqzxRclPxHzEDGbl8SJJGQnLyAVxjfGi7c1MoP4GINaBgr+3nsqX8C3+q5NCHWP
	 HRYTNXVc24z1f/DAzV4v2RWtaRBGRq9k9IXD5FRyeu15L34Xrk0DdwzW2sB2oiP6mX
	 sXAcOuZJaakDBx6tdy1RDyC1PPsg7fFYLPGjYhhQEr8WWFX+9JNTo+f5rqKY6yTqpA
	 ali1KpPMps9p1AXG/LCVMu2TNBs/aBkFpKJYkNEr8N1qH7cvbkzNxUFwDEzVScRf1Z
	 oFKl6diTxivBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 36DBF3809A0D;
	Tue, 20 Oct 2026 23:10:23 +0000 (UTC)
Subject: Re: [GIT PULL] Scheduler updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSiuBt4n03_iQNW@gmail.com>
References: <atSiuBt4n03_iQNW@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSiuBt4n03_iQNW@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18
X-PR-Tracked-Commit-Id: b99b7f60c5b473d374c68b53753153b4aa9e0702
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb95904b470d2d347012d5e360303cf478ca5362
Message-Id: <179253782199.260052.5366596841657852673.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 23:10:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Andrea Righi <arighi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Stultz <jstultz@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 18 Oct 2026 12:43:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb95904b470d2d347012d5e360303cf478ca5362

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
