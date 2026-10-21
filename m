Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619019;
	b=y5O6U3oZ2zI9RFJXNK17O1dmop+z5lwo3eGLcMNtnQM5gy7BdpoOCuVw4Xflt0QKdhTn
	 /348DfeJMP6uaL1BMNxaJYjg0p/lKfnOju2qGN7aZ5ltwMWPEjhzB3sM8p6znDWcsMFns
	 /MOPxUONejvYqNlqp0VGcUyKd0ZARM8KZA1JachWFMxMctCUfDpcP5VKJ5cPYqyNElmwM
	 ZP1CHNVN4QZitzPc2+UCKu26dyirH0ULFb33l85/3xREi1xOXKOhZtlNS0Iu1j0yZP/yx
	 qQKl4kUhZQRRN+4iioVloIm7ef9Elc7qpcpR1vxfNw+F/ie0fYEHj5z9VtQQqDAICvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619019;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=iI5W+WIxinj6IddUbcBIAVyK5Zr6PCeKSt42Cz5hbRk=;
	b=zsjgPUpCz19VP9G7giODWx32AZlaulvg5pVpGjLlshN4sqBFReuRHTBvloo2Y+bdxsz8
	 dNyaytnYMpvoy7M7m8guvRDe/FV6t8h1zjFP/6GfODz8jZub00xaHub+h/mBSJtYOcdTu
	 jTlw5q1OrsYZFEAkOwECWmwZ5RU/DUNrZ4Jnkfr8I/UWK5z+EBjxlHIzrd3xn12PqiRuF
	 2z1aQagLx9uVO7H/bVElYih1wUUManenWQWnGlBxFTFaPu2Gc3LosCX2fkVBFuW75eoYt
	 nD8imymoHZUt2df91lySRO9iw92ktpbfXmWQcAqFlC6PuHG0shln3op1L72KZx1dIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHuOpUte;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C1606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHuOpUte
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC041F000C1;
	Wed, 21 Oct 2026 21:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619018;
	bh=iI5W+WIxinj6IddUbcBIAVyK5Zr6PCeKSt42Cz5hbRk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CHuOpUtesRarrcFfTtUBvsVdGCiIMuRd0qXZj1dDPNf7X+W6fl8hXWPJHeTq3s9a3
	 MpkShx+7VyUzXZhbOLCIES4Feh7tFjmQXtC4xKrmT3LV91SxaCDX2EymvxlDRmXCKP
	 6ufNIK1kUvOUZKXwFWWuZ8PLlvLBf8AsgftvZB4y+crZY/n7K9KvGCdYxeKnKf1euY
	 shdP0iFOs7njQBh6gCEkGOhc0Boz7gKkhJOZ8CekMhpa7ze//uo7siSm7OB2L+NjMz
	 oR5iFwO+PVKIOiTL1SNWanbX7aMC6hSwpe0FpesEKRGLvwQBGhf7s9GIhrzsosw0et
	 NeZuLDuPy268g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44B5380A962;
	Wed, 21 Oct 2026 21:43:38 +0000 (UTC)
Subject: Re: [GIT pull] irq/core for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257622431.804100.15107946105101279363.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257622431.804100.15107946105101279363.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2026-10-20
X-PR-Tracked-Commit-Id: e74798f2f8e1562f2bbd2fed8d81929eeef39ffc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fbe92c39e72f6baf1ebda5a21c54442865d9622
Message-Id: <179261901726.1324168.10324522329434007987.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:37 +0000
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 11:50:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fbe92c39e72f6baf1ebda5a21c54442865d9622

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
