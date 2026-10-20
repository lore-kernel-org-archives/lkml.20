Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537821;
	b=Vot0xpuy7ji0IGB9BpzLw19uWDv9Sa/Iqp5y0uHNslJhVnzCjjE5rWRf0mVo2o/byKkD
	 wLlW+YVkVsIPbVjW3dkrbBK3DTyCnJn41YYxus8G9wYQLqMfAqDdLoKkwW9rsx8BPWraL
	 Eo+l+apU8H+D4v+PQiWkCSyQKQ7egOodpd9NPlOpOevXtdR7a17n6LCNRJRDil+n+8e+O
	 VZEWkTKZdJRUY1DddIWfKTbQ71/6faYGyLNXvWyMTYZqI6pQtyCpyjeUvKy2re0jP6YxD
	 yrNnwLpenJe1vMcOgvWRPpz7tNMRTtuuXmStrUb3bo8MVsV5BuHateiEZTnzndE1OIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537821;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=r3FC+G2IcW7yrzkrG3DUhFzQoqHvQIAtwWk6bZymcTI=;
	b=Hh5XYaKZWNPjqyAXfr/0zs0SvK5KwzK1s1AaEusb89UsuPXGTPAsfsz+r7JtyIEAMIf7
	 TSG4ps0pF1e52982tOOISWTRkEQHkTf22m4TRr2MQlqMQCWrbYffAJPLp+meNYfNBIWJI
	 SJ0QILRTwmHhV3I7bC2bUPh+FtMkC6FolOBcQEt8R7CCo8D0qNdNZEhiUyd9jubW8+cF7
	 gWTrs33RwXrzftwOXFViSL64Tcjg5ZyDuH5r0xJ5g3pu2w3zL9LtqWZTp97J6JghGBaj1
	 KwyVZE+1E2KiicRWhBRSB7lWLUQClguRXxYCd12wDgrZnmW3jtBuWPuujm5wqDZTSbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KTHjBstk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BF606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KTHjBstk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424AA1F000C9;
	Tue, 20 Oct 2026 23:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792537820;
	bh=r3FC+G2IcW7yrzkrG3DUhFzQoqHvQIAtwWk6bZymcTI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KTHjBstkFwSaootZc4ewjyOi5oXv7Qz85AWxi+3Xsn2IdZl3LRonWern9jLHEOQv0
	 v54LLhKJ97heM3Y0V4HHx3o3h+nqyykmwDFALs6rAhp/q+n7EJNHQJq8eVdFDcWet4
	 6AJKlz2BqOMDPsFggy2GYGpDtrNmN3n7jbWEzqMbeqx29CKdNkZYtr9mUty1BvPWxT
	 Xaa4xx3PbQSUgLQMZYbXkBez7Tz1WrnOlykmvkkVNeLnY7Mlb1syNZ19cpQI56W4JV
	 ekbx8Jaq79KObNzHR8Qb0QsQomaeW9d7oAn1wc13Vcq80Y1i+hziHM63+yYxUuDOxD
	 /dzADXgcov7Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A20B3809A0C;
	Tue, 20 Oct 2026 23:10:20 +0000 (UTC)
Subject: Re: [GIT PULL] objtool updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSXRc5ML06RJY_z@gmail.com>
References: <atSXRc5ML06RJY_z@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSXRc5ML06RJY_z@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2026-10-18
X-PR-Tracked-Commit-Id: 945537271df1e3680be9b32af7041ac20f1184fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b6dca02b3e2254d2fd5706d76d7ab4610a67296
Message-Id: <179253781899.260052.7063353677160302602.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 23:10:18 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Joe Lawrence <joe.lawrence@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 18 Oct 2026 11:54:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b6dca02b3e2254d2fd5706d76d7ab4610a67296

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
