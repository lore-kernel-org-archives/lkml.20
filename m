Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532332;
	b=aqifEmWFkfZGdEaNQARYmwMOlTa2EBy6MeLJcX+uqHi1+us29h36nW5litMjy4gpt7/Y
	 hSb6PbWH0qvr84l8adMZ1yYm/vYSbB95BPsc/cT0L73ZgUVbAkqStNT+/xlWyaa3qikRT
	 FHppkz96CUtQocno/bWSOAbdmNx5sEbUaMf5U8/uSQDCkxYQucI7SDPugckvWwTdMnw4U
	 N8iPdIOnB7CBH77jxFpr1y5w2aD9zlFJ+s4tj+AbjgIpsqvLvlql+GMWzefSAwGT0jHGA
	 dWXcMDM9qABVUnupRRB42WmvNyPxZJXgemhcXn4U3e+uJn/Pyl73hDoDMZ678ITXY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532332;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=KVUlxVesPj8grdk9WXbYGgLJCeFMBWukZGRImTmToiY=;
	b=2h9PrKRLTg/PhA/k/nMiYQAij2uM/wVpTi+sLOaayHJJEXVlNpa1bU2HuNK+gHp/ssUC
	 jA3nKosXni7oU+39hycZ4iSgK0ohkq2Yghd4I5yC/YpPzkW7tNNewdYILbSGL8lkF4Itt
	 98aM7S095QcBv+3JonCs93rjdocQ8EKyEJ5WGf9E2FjTufG+ot6zh6fAFjGpO+aygII27
	 iE6zLIdBYknkWQ82gjZ/5r68BO3Y6+ao35IbuaBWLyQFEJufiQDsyCwN9w8V6pZzzUNYI
	 5oX+GYQ4timgOy1Cy/gzjpnAqFoNsjKW79xodEpwetO2WylFlw+ZZ1ROcnGzNksCJTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8kHyL0k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29430606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8kHyL0k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FF71F000D0;
	Tue, 20 Oct 2026 21:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532332;
	bh=KVUlxVesPj8grdk9WXbYGgLJCeFMBWukZGRImTmToiY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=S8kHyL0kzF036w1aigQ54cccRxbJmkheXRVN9YwMUhxrmMgHz9yZ/la0GXsDcG3+f
	 8yX1nZj+5T0voEI7hpJn1CHCwO4DQ2JR0Tkvo4x01Bmna6bB4SPglgw33RgS0s+Z/2
	 ibW6iBUxazVva0lJEECvpyOlEEbCFWYsXY4g/jQbwuy6IiVsZ4awAzSIH7zvNDv5Yd
	 5DNOr4lmHOY6aqkRt0H1mdhq75sixAS8lopbVF+0G7zUNK/mGSOOMF+geBY94rhRay
	 Vf2G3KXbKknU60kQr55+pEPqq7VtO2Warta9icPKZdAzcpFSK5zjEz5gm3C/UPx8ZT
	 Vfw0uSv8PX46A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15233809A09;
	Tue, 20 Oct 2026 21:38:51 +0000 (UTC)
Subject: Re: [GIT PULL] x86/fpu for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020044415.GAatbxnwqKePxD-0FC@fat_crate.local>
References: <20261020044415.GAatbxnwqKePxD-0FC@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020044415.GAatbxnwqKePxD-0FC@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_fpu_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 7606d01b963fc3e4e19dd53ca6c5fdd97f7bc1d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd8845db6d05e81532110c271d5f1cef3975916a
Message-Id: <179253233051.225072.10753099046218276348.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:50 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 21:44:15 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_fpu_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd8845db6d05e81532110c271d5f1cef3975916a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
