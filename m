Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532317;
	b=XqE3mdLE65aDgOTbNpzmx7tn/+qNh4/rUrFMfJulnq2305an9je7JNd5Wt9d6/PZDJzN
	 HFEuCE5Q0TTwMCXLivBBYVGhWxKZv4RJt+6pU2/2K0CGaxdET/JhTAKS+NCxzvRqi9Hiz
	 XkX9YoM3AaH0Xso7cZiZaNK88tnSdYg/7NfXH+T8pePfjNydZyT+MwB9N4bkohq+yE3rI
	 nAF2yIN8WB7WToW+8EaFnT8y9yDk71mx9upiTQ5xiLOUeoHU1Lf9cmuuxqmGMPUzprPfl
	 TcFM20qv3uTLlW+duKEkpObwlmgU3nK+Bi6CSz25SGsAbY4IYNyp4dGV06Ker04Rc1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532317;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=3O7ZycST9bH3/W8rONAwVu+nkUZVZT84pX7YzKH3170=;
	b=b1WWabHAtwD4jgGXvTRrPwnnCk055B6voLx23Mn57KGFnnqMTwlceqlMFQ/Vk7XnmhJU
	 1jLXa5tWjWkCQNdU/sqlH/Wv9pQZZTFm33tLz+lxw96WKuCeM+DWGkhPTjow+yBIXfOAL
	 Ym4y0q1z2EOFxe0KqPBb45zE/P7dFJ3ChlKUkOLddRgnegQgvvAz/q0NbObWfyxQFKZlo
	 OgJ4jsQI3A++wfy3iLtmAWXBRx83G8vsk/LXGtE8dJGR1rEIpgh5YDKkQ9fMMd+LlxmOM
	 LKHEESzws2Pl7yjj7KqeXgRBZJQgrVxu9ci+qp6U1bWeIYC5lKGoBM0OaraVuW2i6Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iben+ze9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iben+ze9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095941F000C9;
	Tue, 20 Oct 2026 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532317;
	bh=3O7ZycST9bH3/W8rONAwVu+nkUZVZT84pX7YzKH3170=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Iben+ze9TqKwVYOBcJ086lYIcW4L7+4zj/xDuvk27YI0RI5bhhfG5IfPhh/ns0DXp
	 QesjTF44Jb8ODvgr6uZaxPnUkq53zt2/PJQT9tg6UKFTm9PCKb1Nc63kLPtECWWqse
	 4DAUJvda5QdmVa+EOGzeUCztrKVDQMj3aCLd3oCP5/PRDmbM1oCQzuOHpnlTWEHceG
	 3Ku9HKolR5BLVuQ++ogs1TxpYeqoTX1gjOo0tRVXy5kEumr79GX4c6dneFYThaLYZp
	 kw4qDkMO3/+N1a6Tc/9pBLxibJ1wUe03NXo4GTdxTriwwW/NpnCFfZm2CCvk/9DffR
	 BH5aUiMqhCrUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15013809A09;
	Tue, 20 Oct 2026 21:38:36 +0000 (UTC)
Subject: Re: [GIT PULL] arch/microblaze patches for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHTX3dKCkUGo7Xmn55QEhJkiKtAyfNBj8pS8yK3QYpJsm-MW1A@mail.gmail.com>
References: <CAHTX3dKCkUGo7Xmn55QEhJkiKtAyfNBj8pS8yK3QYpJsm-MW1A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHTX3dKCkUGo7Xmn55QEhJkiKtAyfNBj8pS8yK3QYpJsm-MW1A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v7.4
X-PR-Tracked-Commit-Id: d037d22b216b52cc7c45c4b7ec06f3929d5a03f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3134590a8c51b34ce66fa471ffa4b4fe38daa1f
Message-Id: <179253231557.225072.14627630213500119165.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:35 +0000
To: Michal Simek <monstr@monstr.eu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, David Gow <david@davidgow.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 12:22:06 +0200:

> git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3134590a8c51b34ce66fa471ffa4b4fe38daa1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
