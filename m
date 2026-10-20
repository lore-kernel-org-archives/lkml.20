Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532332;
	b=WzGryTMl8P7gJfDlIRjLKUpy0NmNhupfmk3vsUp2W56hNlBX5l/vHdkvhqFQaJHejsSj
	 dUMqL7hpvAg5q81QvOySml4cN14M04UHytugt4EdigfpqQ9nfDU6XUoN1IMYIiWA6NRnV
	 2Fdr+sBhm4eVPml/4+CCWvp6DR1IafUL+yblTtkIeppOxkq60b7QV6kD2gKsfnWloohz0
	 mq9ZsT8frkHZmu3cWxj6MljzWEiFkvO6UU4ovIQMKdinvg7qHs/l6+Gk7UTKKYd8WHfFW
	 eAYEY6QZgb8PxaYvoBieTHJYTxfGx6YNUIwpFRYFgC7xRMQGNahqfHx7Pvh/McN6+Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532332;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=akorZX5Dv1L25tW/y8TetwPjgZBK8dqtE0RleVN1bV8=;
	b=B2uOAJhLotYsqI5ucQbveXXsz+CfibMZbpF2AO5zMP/XlNArJ6pF7RKqeQCjCbLKsMlj
	 60oYWdd1Xyc+Wft10zwFJayYN+oBJF9Sy/+NE3fVa3Of4sQEOmCta5x/Iu/+yPQ15WZBP
	 DqQiVF0gDGOzUasOuczNuNgkkJf+WitwpgzSbsvkq3AitP8are6iVs/ODClG0Koqbp5xM
	 bEARQSS0Q2EkaBLY79m/wCJdlCaJZQ+R0Fxe1eBiZhvFXcBA5AMhb20gQDbZJvMjgtPVy
	 s7VO443/fDtZ6JSHR3lnnNVfXJQDQS33MWhhAwuH7t2SKVwwnEWAKulg4Pfmqg+r3wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71094606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072701F000CA;
	Tue, 20 Oct 2026 21:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532325;
	bh=akorZX5Dv1L25tW/y8TetwPjgZBK8dqtE0RleVN1bV8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OXQp8ojQt9g7sKgSychWCKFdROS+ISC6KhVUZqfrdzidCUqlOCoar4+0nwNsNYDdd
	 7OOFKPPb7RR02R+HSE1a6dxKOqeZfZa8NVT5JRZAwqfub9e/qgSaTgcNn7f+NeCYNn
	 KnEV7aK5r5Q0T0qW4u07nYEMPtTsivruXKtSvl3YS4pSZkh9MWqw7dw1bJmu+PqFjh
	 uqY4CVN9RnO3zYz+xnNnan8jngsQt13l6wbCezhCZfUXsbNEQjqGx5qp7lFCDmRtnM
	 N5DBTG8912+gqVHcYD/5quRZcfv6DEf4VCG2wPaBTTaY7EnRhV73sQUPsMW8nPKiho
	 Z0QFoJ4Jc0zpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F144F3809A09;
	Tue, 20 Oct 2026 21:38:44 +0000 (UTC)
Subject: Re: [GIT PULL] x86/bugs for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020011222.GAata_9v7y26cjCQfW@fat_crate.local>
References: <20261020011222.GAata_9v7y26cjCQfW@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020011222.GAata_9v7y26cjCQfW@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_bugs_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 1847c80537891baead3975f3ca969233ff7b2a11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06ad059fbda2f78f6488fcec57d3424c00d9b20f
Message-Id: <179253232339.225072.7034093758208008320.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:43 +0000
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

The pull request you sent on Mon, 19 Oct 2026 18:12:22 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_bugs_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06ad059fbda2f78f6488fcec57d3424c00d9b20f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
