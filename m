Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D55476E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155455; cv=none; b=IGRXOq0IPO2ae2PttVmJTuxC27G+OvT0LKA2ZLR/HuQZ3r8SM13q5bJYcCreUsCqrFMHlqPQ23IvC+YMeKDzB8Wv8PIqj2TDB94/rgtuRxyBNxXBpOQJMkcX2x+Mw0ISMfzOIXBcPPUvLuLAiAUrDwyMbhZVDv1ZHcXVJprAALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155455; c=relaxed/simple;
	bh=OXOQ5k9Ax6s9ylP45UjiSfsKVY5PeCpwcmhrfB1vT2E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YdXaq3IGcBmbXyzWBha3Tq2jFC1IP2F1n0nCKO25CW9s0JelDmP1VqcNyXVmzJXAQ46vsYWthye4aeC1fDyTKttlmlaHFeU9tviMWTtZcseVXOTxLP9JDd15QEz6cg0pfUT/Y3fExX+BvD6ZVI5jxFT5ez9BYOnl2+k6sAQEpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxdkFqdb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxdkFqdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976F31F00893;
	Fri, 11 Sep 2026 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789155412;
	bh=rUzayyEKdftEqkjkSuOsigPLJwLj5dara/VKd9lXolw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KxdkFqdbmda+ujap2v3/OSUAqgBB4rscmKY/uAFty9G4mlTuPSsay+/DG3ATHC4UP
	 fKGVJr2SXckYxZrQ28Luj+ES1cPuC93PRnN2cy2dypeFCID/7gEqm3+rS8V8wLjsBA
	 /qn1CfTr2595iLc/JO3U3lxDquu7u8U53ZF2Z68mM0qNizC8ypA0zC9VhwnqVOgHVI
	 N7yZ6mLcebFXEKcq/gesyxxr0rfq9wKjpHNI9frauSmC0wFkRuGxulil6v9IMq3jjv
	 B88ARone+BiIP/+Euz35TXV6k2BKFVXN2zF888BGr9VIL6jSvAhYPTgBWsUzZ58DfY
	 ffZHjza5u+VWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939D63924451;
	Fri, 11 Sep 2026 19:35:50 +0000 (UTC)
Subject: Re: [GIT PULL] slab fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <880edb7b-a803-4847-99d9-a0b80b3088a8@kernel.org>
References: <880edb7b-a803-4847-99d9-a0b80b3088a8@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <880edb7b-a803-4847-99d9-a0b80b3088a8@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.3-rc2
X-PR-Tracked-Commit-Id: 4a724bcf5d703e18957397914d79156fa2cf1174
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3026c6e4f223bdded6448fefe53ff85d9cbe51bd
Message-Id: <178915534921.3075396.10785790053310931124.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 19:35:49 +0000
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@gentwo.org>, Roman Gushchin <roman.gushchin@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 10:29:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3026c6e4f223bdded6448fefe53ff85d9cbe51bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
