Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717823;
	b=tJkl08KCdn/HQugqyQjSqo3Mz1iZC42HG7OtwuPUVrmsr/WcgOe1LXVtX59qYDoOt1fr
	 /btUJPskcfYcEkwuKYRrVxGFgDB2i+MZmgyXNiLoTLwWQQBxhi2yzBL5/8l/iWBgq/SMn
	 HqlEAVckmQZPh1kotgeoZA6aWQ4mO2DHUWBwEIxAH/0kRSmc1F98kRHFI50hdfIvwu6WK
	 15F0abATCvY4qhv/cwL1qkkvbpPa2Mdkfw/hXmugFktUvMrTwq03CpT3iK2D6wNenZ0J1
	 maiixjxkFXjavwTSRIq4hXZ8JgEHBgtFHqR2rA8SKbZ6ujYQRLYwiQGxlzePnv2obug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717823;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=dtPAptuW9h6N8FjsVYDurs7NfUZHV2p17VVZcrnoeRs=;
	b=iJbYghtGJHT7QWQsYafdKc+tBcJNHcyj1am/8EgOTmAo9wWFg0rRcX3bWcKWX57yP/d2
	 1weKdlF4kn89vs1FheI8WyEJxBY3jzZsm+VOHiRi/fUEKGUueCIhQ+uYQKiMi2jlikpwG
	 cRIyKpws6ATNSZVGXjM7jlrc8v0vdVMPa2ZBoMY4R0Ys2pTYcXS1mcfmHeDJtKKWHEd6C
	 Hn8/hZTjH8ksr+gCLwZ9WLZw5B75Pg28BJqS9qucTBL9dvx9PPL+ArClIPMg3jQJx9Xtw
	 Sd7EOU0hsDM5UqcyLqOOrSPDJ/1VE3kCt+nUb8+uvvevFxJ6wn7OMiujNO0C8gtVkMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqS9fbkC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C8F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqS9fbkC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CCC1F031E0;
	Fri, 23 Oct 2026 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792717822;
	bh=dtPAptuW9h6N8FjsVYDurs7NfUZHV2p17VVZcrnoeRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=mqS9fbkC7GFYYoI2XeTxNeCgqHnWg2Srd0mgdgcBpVAVp93EnOx10FdDwFKwp2iyj
	 yTm5U9ZS/cpcI7Mp51EycbmxfTfkaZoT7h9s1u1Jw/2KSfYAiLiyYM7cTfckRtnnbm
	 NfhCqCmK/+jDL9a2W+FtjR5LF72tknRZkxvsnR93JF1gQBDUxBzjE/YAutSfrSMdFr
	 X4fihji7V29WpfkS/p59hz5kQXE+ge44s8nCX4X7Ed7Lz83InFfX4KypW//ygxcK9b
	 bVlyV2OIa65Py1P8fe3Fa6wj93FRSUMJCTSvWJVrlquSr+BNUYBk2CRtS/uYzKSN7y
	 u6EqpTgXLk/Dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE5E6380822E;
	Fri, 23 Oct 2026 01:10:22 +0000 (UTC)
Subject: Re: [GIT PULL] hardening updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202610221123.F2DE370AB5@keescook>
References: <202610221123.F2DE370AB5@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202610221123.F2DE370AB5@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.4-rc1
X-PR-Tracked-Commit-Id: 2f70a9b7e9c74b92a85a2584090f0f5c4cbaa4be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 864c07de0c7dcbca58b61625dfa2e461ae63b242
Message-Id: <179271782138.280548.3211071545125979326.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 01:10:21 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Alex Hung <alex.hung@amd.com>, Alison Schofield <alison.schofield@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@infradead.org>, Dave Jiang <dave.jiang@intel.com>, Dennis Chen <dechen@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>, Kusaram Devineni <kusaram@devineni.in>, Leo Yan <leo.yan@arm.com>, Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, Mariia Nikitash <nikitash.mariiaw@gmail.com>, Mike Leach <mike.leach@arm.com>, Mike Rapoport <rppt@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Oleg Nesterov <oleg@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, stable@kernel.org, syzbot+0a4c468069412
 97fecb9@syzkaller.appspotmail.com, Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 11:25:02 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/864c07de0c7dcbca58b61625dfa2e461ae63b242

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
