Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619022;
	b=VNDjBYVr2JHzjzp0jvPL0l1JfbJ7yLhjNRukpa8T610BkcVoGy/mX4tUZbN9YDLM81bz
	 E2Xm2xK9im1pj+vvFOPiHD8ZYaa98jr0XDD5tOpgB13Ab5fvJ2Y7IyJE8n+R2oBGtFpw/
	 UJXX3EsWEchPGaX+7RKwwh4oylevctfdYI53Hw2AwWzWbZULqSWYrcRaK1UiCw5wYQxDZ
	 u16aFpETrALp2CtreICUb+X7QvSzzIpCycLh254R5MgS9N+tESGTkyUxlqSHwIjeuzVC4
	 lUN31NEg8JAmK/Tu/iZwcCm4rplKL2GMGneEAoQnbpfIIBAtrKLD4kbg4XCqJRGmkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619022;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=lPiVl3gapEnB64Mbd2zvzHbhWk8qURa89Wg6ICkr9Y8=;
	b=rqmmbX7ATO6wpVldbTNaLXy0vpSCVWrCiJgc9e3hbfy5D6kICu6H0ASOq/ERKNeQEb0c
	 s9f519zFSdUXeCbMXpMfgZiBwpeoj4zRGghNZaExQD7+J0J/1iOCr74WvufIZ6UTcs2x2
	 0SQ/oW6Fmcpc1aSWNgNpPtDl70R2onbDxRp/cLbyXO17pbgUl6YD4IeFN8YsGywqjNvvz
	 8g0LQRlb7zY7ZeC3G1wT4pcdZKPpdtJYJkzYsVradFKlnxfmGc4bYGxN1yzAAGawY+HyJ
	 OLkoKqw4/VwHbFdv598ryh2nI7TC4lo1t5SynyHtUbzjchCarFgAgJngAIAWnHLy1UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOLxOhoL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D5606A339
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOLxOhoL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427361F000C3;
	Wed, 21 Oct 2026 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619022;
	bh=lPiVl3gapEnB64Mbd2zvzHbhWk8qURa89Wg6ICkr9Y8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cOLxOhoLiQBgWFCWSV+XSPNVhn1dY+7YMTVrtfGwwR1IqSZRr+U7ILPgbXlX/3HEd
	 qxOcoPukplYNb1OlYrM5s6V2iip9ZPFu/2I93+XLV0InIwwvx9NsO544JAqlWnn0ZH
	 qxq/KMvgWZOXeiRiaS4Ty5Kl6OnJHZcioK7jUb88RDh6hX6HfNKXWKZuSVFXHymGZj
	 Lw+drH8lM9Y6wMfyB3vuxmPRpSqYNtALKiiTqQrAv7VPMmOKAqGk5qfN/RxbTWk6SR
	 NsZPVbgdrWmtooTy6RqJtOMUs7CozwpmYVtiqZvnC3ltSbx4SSPcd5KpOgMzMZ3gH1
	 3EpR4AwaJ7b0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A23E380A962;
	Wed, 21 Oct 2026 21:43:42 +0000 (UTC)
Subject: Re: [GIT pull] timers/clocksource for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257622675.804100.14134557707707993781.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13> <179257622675.804100.14134557707707993781.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257622675.804100.14134557707707993781.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2026-10-20
X-PR-Tracked-Commit-Id: 5bbd49a96e049a0469223743a3b13354d2e8f20a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4460f89a274240204038d559e8571f370d14327
Message-Id: <179261902080.1324168.6594867704613047838.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:40 +0000
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

The pull request you sent on Wed, 21 Oct 2026 11:51:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4460f89a274240204038d559e8571f370d14327

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
