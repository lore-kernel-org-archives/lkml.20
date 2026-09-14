Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8EE4483AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409321; cv=none; b=PUCuprqX4gDbEzyw5PTzks2B9Djg64ga1wFMBaJJLlYjInR6vHFeP4kyQ1uhFAo93Y0ZfBkOTD6WwSni4pwj/ZDkMt22RIurwnXHITKTxFTgdj5C2etMYol3nG3/RrMmO5oxIhrdaeguIJQeDOEJAfusAC9AK4hhNNWKE8Lmuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409321; c=relaxed/simple;
	bh=OSAK1hNVa5X5rIoLzr5xcMNiT4leUhlTcE95GpUhczo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Eo4rDWzaDIAJ8U3bmTIPwhtKinAFNbrcLs7PEOnslqR+pxKIrxCmocWcANW1b9S3iu9V7YrcMGa0LoiEoo/s+2sE3qAZVhSDcuR52ADdOCsDy1mkAwnOrlqbCqOdVMzA8EwN/vjRrnmPITmwhN0ftHWZldxF5PrfqFqNWSYV2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xakp5jX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xakp5jX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA761F00898;
	Mon, 14 Sep 2026 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789409309;
	bh=5daMscwDaX2JwFil5lTXQITuvGSdrd4toNTeASvATRQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Xakp5jX7jwvusY84gD63JmsDjXhhUehahgSy3T+yLAarj7F1FTY1QGD+zf1aLGP2z
	 gBBmG2fDX2fChAynKn6/vXj8tjqluX+nHVamvQUCDMGcXHus2qBDGlErHvpNpSE6Pc
	 hs59QlvuzqEgmJnfdqE9Xwltnjz9Lqw5oTEoOpLRlBLZlerRfhbRE42zen6vjKD+mG
	 HG5ED0/4Xm4w1hItcbxOD7EkDR0kqO+xB0tpBou7UO+ccqFfX5fxhOXxgbVOJqkJXV
	 qnXyvpR3+Hi9FoFwLJZwAAQBBmobLKBRyIGN6wcW9Ot9gl6YucJJ2CzVxKOdqll8LQ
	 gudQDaE1dvSaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A613924FD1;
	Mon, 14 Sep 2026 18:07:25 +0000 (UTC)
Subject: Re: [GIT PULL] memblock: fix for regions display in debugfs and MAINTAINERS update
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260914051534.4085114-1-rppt@kernel.org>
References: <20260914051534.4085114-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20260914051534.4085114-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock tags/fixes-2026-09-14
X-PR-Tracked-Commit-Id: 6e33dc90df108c76899dc544a42d17adcba61668
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebb58ec7f8539450804741d974acbb985da0f071
Message-Id: <178940924446.1155813.14492190716772354611.pr-tracker-bot@kernel.org>
Date: Mon, 14 Sep 2026 18:07:24 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 14 Sep 2026 08:15:32 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock tags/fixes-2026-09-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebb58ec7f8539450804741d974acbb985da0f071

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
