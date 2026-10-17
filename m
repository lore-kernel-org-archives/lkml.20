Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2220D4FC;
	Sat, 17 Oct 2026 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201413; cv=none; b=tyxE6ej54amCuXw9fdsGVkK1tl7U3N3t33NUVct1HKMdHk/+Sh6mk6AODk8U6ZEcPGCSKJiMJtMQJiIvXLeKL0EexGxB7cTe5jhvmMM5NpsWBrQ/Afu2hXHX51YRB1rW/6KmXutFz5tVGZeOSE9P+iWSxujA6r0KjJeLey9JLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201413; c=relaxed/simple;
	bh=RMdO4M5oxygyqQUlul7jYNFNTT1n+ypp18gLC40CepM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=K1axMLC3DDjgv20mjZmDQeWTpJYkmqEfbIMv4wTnl/L8x6C696wZzXOr+wry8wC7fk9Xoih4666e9KLcCmWkfZmvXPA1Dh38rq47FwYZxKD21hWK/nfSWQrPzsO2sXjBbbDX1t2QlVFA4RWQJhK0KhPgUbX4L6By8j/Wt0JPILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF6kGJWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF6kGJWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF511F000C4;
	Sat, 17 Oct 2026 01:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792201412;
	bh=pDVw3WaxeMQdsclmNa5AaUSsdzRwHBOZD3oq56JyXZI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IF6kGJWUZktKe0BfNB5vri0F4s2aJEe4q8CG4nlQT99rk/+hi/Q5PM243Ivfg+BX9
	 BdnJpaCHur9xn2IQzIYJ767rz+tPhhr4JlhRZ30IWPtIc40MU4HkXVP+FJWq9b+Jg1
	 6Oy2jugMxfHlNnUxUKikkgxmBhqSwWlWhCgO3bsTXhIQdG4XEMwFQOrmBBumit2vgA
	 5O8ZpyKRGh71FAdMTsNE2lWrw3T4zV77YTUC++mgDbfNbLPrcBRF+iJe+HyxjPebVT
	 VLt+yo0rrIu1GiKPwx762KQVy+bE/KlSHEBtuGsOgUZh7ldZOZH5RYOXA161SreZmF
	 DTF465Br0/KYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F1380CED9;
	Sat, 17 Oct 2026 01:43:32 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0bx1t8x.wl-tiwai@suse.de>
References: <87y0bx1t8x.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0bx1t8x.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3
X-PR-Tracked-Commit-Id: 8e8cd9a4c6dc006e9bd51b8ad0079fb4576b48d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3bb7a0184fbf9fed14aacb9773fe9f6f2097c1b
Message-Id: <179220141117.1053691.2229178068606489864.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2026 01:43:31 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 18:54:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3bb7a0184fbf9fed14aacb9773fe9f6f2097c1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
