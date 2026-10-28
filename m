Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211046;
	b=KLB6o2jRZtc0c+T5Zwe5Yk9GVNgcWNktZDObRXUVBaORKRRpZ/fpsJt5ttGLBV7LPjM9
	 kfBXFw7g3KnuUFmpffgxS0vuq8S730Kk3CBhKMwxBaoY7rH7mZ26WOCUER0qudx7CEqvL
	 9vO7o7s3a/FECz222Grt8/ajeJMrJOs0neLy4GrwAL5B21i4MYFuECkZLNCqD3tUjYGs7
	 XkenOdpsOjeyVas5KIa/8U2Cy5m22hX1oU7+E1dz7M8vqmU6XoyfvG9E9c0sfcXX6OySW
	 25Jon5wjKr8oY96sneUaAj4D1fB9du044Jr7qqpWmAu8Al6E0VINV+OfPXnpvtbJFLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211046;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=PVnwBt9xsj7RL4DLPsng/5KKma/6Q31wIRYf9zCB6OE=;
	b=GcQQQCsgJsuVRN6IfT82EeTdnB6hmbGYrfuab1D9CAmpct49omBKMM3Ma+1EjZv+Ez0+
	 f1IBBKpuNM39G9mL9vJbp2WV6spdLRfWoyk5Gkh4OXMphRsaA2allMPvmpCm7JesEIGvg
	 ah1aUzz9nqiRulLpCBYE6ENWdDT4wXBj28qphDXXnYMJh28Ms/bDzffEeSzWcTjsAuHG6
	 505sQHUNgvWYJtc6HyaAmRoh0UXS2QwwSqpK+dqvUXiqQG53/l9Ubz67ia0BP6a6uv64/
	 cJq91c3tS7j8J5j9oWg8b6AVmHL4ZbK01x5tA2siS8Ky1kS6pID0mwzshlSciRN9xhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Psr4mW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3633860A5BE5
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Psr4mW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138EF1F01829;
	Wed, 28 Oct 2026 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211046;
	bh=PVnwBt9xsj7RL4DLPsng/5KKma/6Q31wIRYf9zCB6OE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m5Psr4mWwr/MmEuCbr9nZLtVD4nHavG2o4cfBb1leKE09Bqua7DgAIBvjW54wNLcm
	 pdBJl1JjJ+na6vHA0go6m3Re98T7QW3fN2OjN7U57hBew7a7iwwgGqcNwlycLGCZAL
	 DEW0vGIay+CCJs4bnWSqaieKpAw7mHq4dLDCUNCWEAAEHUn7jF2vFhPDAGxVGv1+C1
	 oz86uA05Y+0KlmRkCLumxtoYPT9The2Cfmp5ofjZ+VtEfRpM+CP60T6JtWlDRyKAda
	 zbceBX20fQR52cy1MD7E5hO8S33hhH0YqFhVz2bfRBWvxR4oFAtG5MlkipLabk3axy
	 5p97Kpe9rAPKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 073863AA9F6C;
	Wed, 28 Oct 2026 18:10:46 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy subsystem updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <auIR2sNcKC0VsaRS@parshuram>
References: <auIR2sNcKC0VsaRS@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auIR2sNcKC0VsaRS@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-7.4
X-PR-Tracked-Commit-Id: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e191b05f321b064a973399b7cdc003c0de89e5b9
Message-Id: <179321104451.1342141.11036010002283778888.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:44 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 20:46:42 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e191b05f321b064a973399b7cdc003c0de89e5b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
