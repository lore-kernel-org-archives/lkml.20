Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717821;
	b=t4tLY5vyQD5mickE+yspvVt6PwJwao5bKolhYY2PWrFpkpLDQQUICQLM4mgGOIvlRLZG
	 PcAz7V9x50JVWUguPjG1EwGXQXXazLmLigFUOcGCfqnRHy4KmHHfZ3YsrWhKvhwPxGlGB
	 3nDympJUOlzrvJNAYLvGkskUkNVMzfXyMKyicBxed1538csNWZ0Vzn3L27FhSnwpZwfRM
	 37LbC3BkkT/4LNQMMc4+2HlotywpVfe/3/Eh5Al4oUl35v6sptMB/fpd1yBqDmsuyeBWT
	 R79OvMKOypVa2IcnbxOqCW4EX8k8DilFwBdwdqQ00uCeWCKCiN0bYY3mbzBA5kXw3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717821;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=2GIt9w3kFDB7fdPsXrc3yTFNqa829lsRe1VnYA8ALrE=;
	b=iKEfnWZgrIe1W8NcOP5aEFXJmtxsMDlOdCnDD4KtLnVmK+GZLAyGMx9yyNakQhkWSsnq
	 BtMR9T7TRqaBVXJRBkSv6i+HjFj6cqw13jKfPxBJh9Vy9kinNLxYiQPzJCOLPzifV1Nfs
	 4ukcx+PprtkZ60p9wM9DJ4hufzFWIMsTBGM3pSaZhB3JOevweZixTb7UHJ1XGkY/Cc8e9
	 sqOFRjxqzpYH2JPKfvvh9GZoTkHLt7SzVjUOjTH6bVH3AyY1ZV3bgNvE1IrLfPlyn94eZ
	 UvZlw9qnXkM0zGx3LCsJ4nYQgGMcHVt/CjiOQTCfivMT3KeJZKtJzIOz1h6jyBYwnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOaYUikE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOaYUikE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110301F031E1;
	Fri, 23 Oct 2026 01:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792717821;
	bh=2GIt9w3kFDB7fdPsXrc3yTFNqa829lsRe1VnYA8ALrE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bOaYUikE2DRpUMUtdQIiZcDpMkF/88avJJmbZxVYziWkN5IIvDbtlEOZh/egDlKmc
	 uFYLqU1XhP16zxetEIkeUjk6qUTDOgy5gFMIJ9Qr7XfWcaxze671xd/IbD0Go/4NIp
	 mwpIcQvZt9OJLa9rPCyzkayKqkCeq45Rh7hb8ZeH0c8NVKYWtLRWZ6ieyoAa/stFDp
	 A8i46KvYyzW6qc1zuGeutMOeQ+Xatqo7sKWDgz2JOMs1NeRUubgqsOocWEXonez8hq
	 illNwLPM1mIw79FTpAAnNE3kIP9z57xjIp1FZ1P3YKEeqBwe9CCTWD29l11uH3xDBx
	 KUiAWSRRt8B+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 07320380822E;
	Fri, 23 Oct 2026 01:10:21 +0000 (UTC)
Subject: Re: [GIT PULL] execve update for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202610221054.9B1BE08@keescook>
References: <202610221054.9B1BE08@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202610221054.9B1BE08@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v7.4-rc1
X-PR-Tracked-Commit-Id: b36b990c50b1f581b9a7f35ae256f5542415fa69
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b193d6a8973655f19de87a7873ce31dee2d5fe6
Message-Id: <179271781962.280548.14044438581776506255.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 01:10:19 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Sasha Levin <sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:55:13 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b193d6a8973655f19de87a7873ce31dee2d5fe6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
