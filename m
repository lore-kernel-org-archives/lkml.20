Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987147;
	b=dwGFr2j/E5zWsLOj7K2hbBWi3rqS0EVB8uF6j11wSsGp7mRDs0qoIuX1aIxW+GBTbbxO
	 pcsbpUb3qfkxF70xYTdbwuhXy35x/TOUpRkt0q7SeZAxc1P6UEkrPdbvlPTg0+pSZHim/
	 0xujJ2jVaAtXHpVuZR+QoCH2KU9SPTGFA+SInj8Tc/PBqg26seFCyoxKsLCmKOSNYSNF5
	 ivIovYSm+ryJzwyTE7Z0Xj3OOArckiiQMwT8RgVd6YgJQb38DOZWUpfAHAl6ilz3LXZbY
	 BCqS98MjOCZrlsN9K6IJE8x1WpsLUK13f23rjTO/b6WSTeQPf9CeA0r4BsP+AdSvRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987147;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=eG7e9jLmXL7BKMCsnHoW1eqVnbroxNJTxqoTHBPqVxU=;
	b=Z4sR2vvxOUza7AXpP0a8zvKYq8IGOFovSHDkLF1kFdSxb8MjNhC0+Eytgpp+pRcmmpFH
	 5e9s8BBP4oA8DmLcK/AsqELmZ6vDqntP4A9THIg+glNXEwKZ8pxvh4/LdqyfY1xLQZF9/
	 iLgFd88oGsxtDjpwCkg1BiG9f395KH2bIgPan/GqiAjUX8iFASqnBunieDPERa0zi8cIC
	 Rg3CVyH+84CuzpR+AW/nFUwjZDkC5wuxbnlOitv0bcfkGgJBHOBcCvLGRLePRe0xRgdXl
	 vxS0D7jfW+HeXGdzfzJWzX5/dc3QLpI/heCt2jrjL0EgbVXbcJq1kEtlq6IiD4ErbYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lfAJCuV/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfAJCuV/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7091F01825;
	Mon, 26 Oct 2026 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987146;
	bh=eG7e9jLmXL7BKMCsnHoW1eqVnbroxNJTxqoTHBPqVxU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lfAJCuV/6KZ/b2GTrdsIZ/cE5avxKx143nWtGYHETzDSzmsoDsk0VAb2PkpagGOqu
	 Dzh/vTK8/sxhojorX9CjilwhSb89CT8HRQ90RYxBSEU9myyeF1qbuStqaIBSTDX8uh
	 cuzxgVgA5V18tDRp8drmmDxcHybVJHyBBixcBzK7RtkVJJ/eiM17XGw94j1dh6pW07
	 jVjVogFjubZ/EZzKfiAdwTFgM2EHcdghL/U97Nj/MxEkE3haWCO67/eJka/TfnVFAa
	 7vrYHtf2YO6HyA9+Fe79LQOl7LJKiijZZm/Yz3gYm7y3UfzEQQ1fa/g/wykTQLU0ac
	 6eJ2zimq3JETA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE80E39EA761;
	Mon, 26 Oct 2026 03:59:06 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <at3g4uWEWnlXotjx@gmail.com>
References: <at3g4uWEWnlXotjx@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at3g4uWEWnlXotjx@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-10-25
X-PR-Tracked-Commit-Id: 717862eac6eff0eea8ac30a0c0de0bed84922aab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b19759b46aee85627b58f3722846424201f24a7
Message-Id: <179298714542.2448250.12134384087115817472.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:59:05 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 11:58:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b19759b46aee85627b58f3722846424201f24a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
