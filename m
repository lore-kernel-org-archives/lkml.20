Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907405;
	b=XFA3LG/0rEMA61dOy0K5S320EeqaskvfkRvMm+KozVWR5zl4aL7ndK7rYL+vqMUmP5Iw
	 b2NXTO+5RKsFlqqFv9uD+YMoCQSS1L3N08lZzaB+H0V2aKWGn5t+EpOPKLWaafiXmX5A3
	 ax1VfMpNw/QqPnGZJxEayy7lD6xSouWdRYNUNU6OO6M+X/CSqNRP64Gc3eMxRZdQaBkXf
	 I3q6gXdSafB2j6DySN020ck086m7/2blGyrZlnpBERsSpCMGepngW1SEDNWXrhjFwYo1n
	 Y5RP3JQt/G1tMBJs8YctusQfiUy9q04ez+gWGNyGNYfNGlUemit+sNFr6GXHUIuiEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907405;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=av5z+ZLNlwResEVXMS9SAle9QPiFYI93UwdQml9h5cg=;
	b=YzRqCs6H0ig5dTjSMSYlYD4NvMez0L7UroT+H1UAk7m2s0A2n7Nmj0kstG27ToLVRzWj
	 +xlLULk+4L+NKd4rLViM4au8ytoJmtT646iEE5/J+TEzqz4MMDtW5XBKm7bv83HgWWF1f
	 wYVsyiW0epOirkfGLOvk+TJsxnL8MJq7JJaBcXDk3IRxgqvXyeig25Mt3Qy+7OgdlReo6
	 9DCffH6SMlnSqQTgb1Li71y6aPP02xOXvf4qe09iIBJEWIC80w/vMAhY+Gr82Kzwsc7dY
	 HybKB7BvYRNXy3YXmc6WzB9fiLC0/Bp9wkXws8vyJyPtGQV1vqeuwnDrENZgITdpd8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9k9g+9z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EF606A329;
	Sun, 25 Oct 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9k9g+9z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D5A1F01829;
	Sun, 25 Oct 2026 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792907404;
	bh=av5z+ZLNlwResEVXMS9SAle9QPiFYI93UwdQml9h5cg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=L9k9g+9zUtqBev769z4UUq0EzANK6ILtGBRs+PbnCH6BY0LEBV9AV9w1uF9l5v3id
	 lb+SGmGNOl/n5vY6roLJABAJ2Jeh3b/SXiIa7hyUB52FKrHFHXRZitLJmVBK9P6w9H
	 ex2L5TJYskYpipZEOUsxMkr3Nz9FMicrEzPCnzfsP82SyRk6Ch7s99aQWv70usOFQt
	 rQl6UL4qjSCy/3W2wNFuOkozFsiBARh2lrnLzKkmXCpu8uL0/rorSy+S5Vd2+Ow3xc
	 87aYdfzbEp/nagaC9boDsR2W0jiYSAQAV1jyGj/RcfjfwIsU0aDK0Cx8tH+1R2aRE0
	 usr9SNcqjemTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 87624392ED67;
	Sun, 25 Oct 2026 05:50:04 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ecdgc246.wl-tiwai@suse.de>
References: <87ecdgc246.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ecdgc246.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc1
X-PR-Tracked-Commit-Id: ed7995e4ec3789a90e37eb826bfccf43cc85d2fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75c1cb8178fe84403fd95236ddf21754f0a4156c
Message-Id: <179290740342.1990210.7532002874604900562.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 05:50:03 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 23 Oct 2026 09:22:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75c1cb8178fe84403fd95236ddf21754f0a4156c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
