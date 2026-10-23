Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785482;
	b=e5ntYLgZ/NC4HGUJ2XsDdju5/dTomICSr3lJLCcSuIEPtFIls6fFU2LEx9Y6h4W4mefi
	 Pbknt8t+ca+c1AUx7fTIbpQ98c3ErvrBDuVHlJhqI3jvjQbK8iIKbOfRh28cMdvBYhVuZ
	 0WweuRQ2NU+Rp+iWbHP3mXP9Ht2LquhCLAKkE8FFLCS6KJx2X6yQoFO/WnjRI/IhN8xpa
	 dGAZlKlcPTEy43tXwNjsJ/1UdtAHMQrSMg9zgNsdaLWdTYsT8jl3cV39LwSK5zQDBqNyl
	 N1QBsKRXbP7dTI3a6dC1bn6dpURA54V/wKSBjuWzVLJs7N6aw8LPCfgpj9SbC5XFcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785482;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=WPk0WbLpNo4JUkEk4l6nhF/QrrtzDqowESbOs+sqW4Q=;
	b=FEOpm3z5c83biac8RCpUEDFpfSF1MzNAElzd8GZt27ESkbhgwUGtnk8YDksHfMJt/suf
	 wsV2t8ljqKTMtY47rxZa15hf9S8qB7c5V1qAz8EhVS/ci8g9jPqG56eT7fFE3gZ6E7IEe
	 y2b/W83/nmINNTeFuH+xbebGroP9MCXlDJcgL8Fg14iMFDnzy92ZPmcM3dtujEAoS6Oy3
	 hCd5sAwyftoiDZoB7Cc7UmlC9YDzeNkuVgJsjv4/XcIcjmXJ0HxZ/hqb8Djck4NxrL6X/
	 k/n+26CSHm0SHUd9xY8tTCzFDY2zXGyCppV4z8+ttbl7+Iuaz3LZE1POmknzy89EShg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k/jofvxs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A4606A336
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k/jofvxs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAB11F01828;
	Fri, 23 Oct 2026 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785481;
	bh=WPk0WbLpNo4JUkEk4l6nhF/QrrtzDqowESbOs+sqW4Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=k/jofvxsmRI8ynu0gnLkhRjxHowPIM0EBLbNpnw8qGHz6KtEymhmTasBDJPzmOtS4
	 BLg3mYgbiOpfocyb/jhZQxQKQdDF6QLW4n06COA9es4mKEHgJUY4IY6G4QAeDG3lRq
	 MGZxbiX/d3ZrLcR2X/LMklEz86NPUlzet4qnlnfMvBLOQP864k6YFHK3bBsrTyjYKS
	 rWtPfBkTrW0pfy6d14Jz55gvdHCXo2ui8iCJmSpyGDVM+QyhUdvNQJIZc/a0iOtP4q
	 wnsxPMmViymVNKHQoEZIMUoVMzOHC6GvPW661bYSauBdVVmlWRJDJTi7FDgpH/tOrJ
	 2U80dqxyQMn3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE719391B153;
	Fri, 23 Oct 2026 19:58:01 +0000 (UTC)
Subject: Re: [GIT PULL] KCSAN updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atdyYfVApEJj4Y79@elver.google.com>
References: <atdyYfVApEJj4Y79@elver.google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atdyYfVApEJj4Y79@elver.google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git tags/kcsan-20261020-v7.4-rc1
X-PR-Tracked-Commit-Id: bd3cc16d1d7d584911f856adc458f242b1c7e85f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88442d9f0d6084cb986cd9d635efc7744199e3fe
Message-Id: <179278548026.1241373.6747017878588265619.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 19:58:00 +0000
To: Marco Elver <elver@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Paul E. McKenney" <paulmck@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 13:53:37 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git tags/kcsan-20261020-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88442d9f0d6084cb986cd9d635efc7744199e3fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
