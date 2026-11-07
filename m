Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083131;
	b=oI74DWGtRvjKCb2g48A1wJom4FGIqt23s5DGWjtRNxtwYJEMclun/ReO0TXTuxocdShy
	 NwgorlqR7w2C9V9dVBb9Fb0ZaFCEwd1haDLa99avqT3L5PT2AtXjazQfcCsrw9/O/Z5sq
	 qXWoE2HkvXFLhpWNSrpMINqBxYZPN2z75Hle6+O6kGztkfPp6WG7CReOBngEaX4z0dY6m
	 QxwSwprYpcSE1Cix4Ts4GzlxR7Shb80JLR9htWDHxmx6ZJ9tpkPzao5wDWdu6gc+hMMXp
	 63wZfRUs7r4zyC5ZY1Y3XjXnYHo/J95vfkeLUE7W4RYf/IPo4j1hW20x76jj/wlWA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083131;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=0RdGEPR4ysXj5Hzf3hNP7ihItauQY9UpHxBx5f+unWE=;
	b=nbRVfgTJMwKDU/dttVPuFanJjsZq/Wa/aa0E2u5VuzbBCBjLepihGiXM32Gt7snqMplN
	 j3t21TY83jxxFd26SFY7avrOqTANOqoWUnGgCDzIKABrDQN2wO8O1InbhZUuduF8NTpIF
	 hQLPGnedemhmddxa1rUpkXnLAQrGWGNNt92XRWFUf0fC+bPjnlGLmuc1s1RTkxjDFXFz2
	 IYlBW7q4RO4r8+i+yxuv9rANrfPp1yFTPr/DTsia1JDTkOigG78A99sI0WyHDMKb3IvQb
	 Mx9t8k3Cc9pwPi7p0MaM2jMx2GzJpSP2JVgcmpYPjLAzwCDPaSQ6s0mgCbP9BXptNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZu+dzvb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F41606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZu+dzvb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30171F0089F;
	Sat,  7 Nov 2026 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083130;
	bh=0RdGEPR4ysXj5Hzf3hNP7ihItauQY9UpHxBx5f+unWE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eZu+dzvbErzk0oJ7uKPIOA1Vx42nV+sL7Y9wqA3s+9w03U+5VeOPYQEAoWbRbSlx/
	 Fbh9sEcFvKptkHuQeHErJVgekHvs43i6W7oYXXlkzpuxZi2iwNGJ2uqayIdgcRicTb
	 MHF3aoVOoN7mEXoHFoKhBMVv6OyMjcChyzVjhumGQ9sPdG+Y/9htIW1U44OsYIr5Sl
	 yadNfNzVocXuWA4S8oMOgTv9J2IDcfxvt5E91sffzK2Dqr+nsXawDo8yvd1tACVGiT
	 OPymaYcemV5U7TSWZY+a2jtUovOy2GK4qDLL8lCNwNxX1NgVVvsxxFDrsez8zxJhvl
	 G32cPOzzrj1yQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D83D3380821F;
	Sat,  7 Nov 2026 20:25:30 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261107113312.F27D128F32FB@traversing.sirena.org.uk>
References: <20261107113312.F27D128F32FB@traversing.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261107113312.F27D128F32FB@traversing.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc1
X-PR-Tracked-Commit-Id: 7904338c38426d72c5f7cd9402cb9a20232a7af5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91fd3a15265f095a9632d8f9d9732b37363ed121
Message-Id: <179408312941.1325067.8631358243457224218.pr-tracker-bot@kernel.org>
Date: Sat, 07 Nov 2026 20:25:29 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 07 Nov 2026 11:32:40 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91fd3a15265f095a9632d8f9d9732b37363ed121

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
