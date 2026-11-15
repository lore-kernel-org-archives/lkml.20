Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767792;
	b=H6TBFwjc4vcb6sSIzgI6lYOP3aYIG3J4zfS2hhMejd9YkKpZXbcX9RBDPitq++ZbJp3s
	 X3i6ekDJeOw594mgky+x5M5hZJaWDmuova1iV9REiCLUqoLdKbK3QKRS9MYLiYX98aRjj
	 u/5/UP361c4a9oapsDIwvD20YXv8a6r5t2/04IaVDmnQm4cjvAV0h6BjbSpIDNV0sts0s
	 FKTpXRUO0EAtuyul67NhCMzuRoQL7f/NFTpws/T3MO56ojMS45ONrW2ChbsbXZ5slhlVm
	 3AOS7T4UfuM0dyRKqKpsB8aWb9m5EiW40NGbIr0LqfeNiIhhKxo3HpqeXEWqyndDJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767792;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=7OYD/6myGf8z1Bg67WUA4fcRspqJHhj33gaKG2yLm2M=;
	b=I4fuhKN1vWSX44aGxugOdlhPlKoFEiXoIXMhwnBcrnnXlRzWFV5b94CRmJ3g8EomS0sg
	 B/gHi2oxpJzZ1qwfGUl0z++fLDZHbEoyLvEPiLS2QVA649CwXzIb7zNlZYtBB46ssnJgB
	 OczYwHwksFzaccWyJ8RUBpKJBdq+byWzf0f/+kSWuC0JW1VfD15MVbYd4ITuelP0l5+Ab
	 bKHkR2iNqrZRPpN56bepBARJUsExthwQ2kH9Bg4oCMmFgQzKBBfnj0x41/zVc7U5MCr/v
	 GadvkYQrTtDCln+TkvMzI+Pflh9A308fabLoxEtUdGOZcbIBaWLkf0DLdFaSfJhyVFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZACTPC+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A3606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZACTPC+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7441F000C8;
	Sun, 15 Nov 2026 18:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767791;
	bh=7OYD/6myGf8z1Bg67WUA4fcRspqJHhj33gaKG2yLm2M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YZACTPC+0lkjee6WBbSIO+//as7TWRQgKQPDpUYzzjth0JVoadtCKauUwP9S79RM+
	 JO5kLvq9xjZnTkz176zpUg+MVSbu/+U0l9x5ufodu2ak9Rl/Pz0PuQ3mhOQd6oBOif
	 3/UidcKfBRmVt269KpKHGqt+JSI2ZIhhyv/FlDHFul3f7RcWd9FNhiTdT8JcUhdoGO
	 UhMj3MerHSQwJsXi91WmaOTFn2iwJsW7Ozd9rLTHeJXdJ7+80jbXKB0BPc2oLFVuxV
	 NU4Ie46D+SyVcIMiqIDqwh2+2vMGSUj5TL4EUEJn374O+uo1jOXJvdxci/k7nTTz5D
	 HU8WGC1HK4Lgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43EF3808232;
	Sun, 15 Nov 2026 18:36:31 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1794657588291434559-96c5b78098cb703a@undined.local>
References: <undine-1794657588291434559-96c5b78098cb703a@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1794657588291434559-96c5b78098cb703a@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc3
X-PR-Tracked-Commit-Id: c15120853eebbda98f3fe1f1e59370439c6c4447
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97f4f3805fd22bfc9cbdede5a2cfb0c48ee7df1e
Message-Id: <179476779046.2691368.13649458896266756137.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:30 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Manuel Ebner <manuelebnerli@mailbox.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Wenwen Fu <wenwfu@qti.qualcomm.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 14 Nov 2026 20:59:48 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97f4f3805fd22bfc9cbdede5a2cfb0c48ee7df1e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
