Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544848;
	b=3XtqXqfpGtc3MMODe+ahd1Shxx63VAEt7I4jAwCWf5hhJlOfPMKtIZ6I3oiJp7j5oP7s
	 c4+F6cvfA1ZD8nnTSr8Iv2tpiA5F9JtzsETFToQJ9JZaKuIiH79ggHgqMZvYBoyE/Oqfx
	 zfKfQenDvQv8YSnBdDM2vJPkvzPaf025NbYGGdyTXG+qifpWY0btbMi1XGNzjASdc3DlH
	 FhB9K9HfW9Xxpikmzu7c8MIeB33JajXW09zKGLxEpvaDedJXWevLEjB6VAwWngQL9QVCg
	 w604V+YuomR/Bqyy6f4eYqLjq/hhz6mDxXjAitb6tcULY4/qribg6oXVRPdKHpmSViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544848;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=V6m3/WsasuvJ6oilVkIro4Yg7VSyz0LpQEufM4tNpoE=;
	b=MqJyutqZQ/lzskJzFikgxJ27Fi6/MVRCQ/cNRiMXAG2Vd7f2kOsxRIKIigebtmCH1EQD
	 mxXjQNUVmePKNJ+ZK+RP6B5sO0MA0rCrxagOe2MwcwSv1cvlX2sheNRIRi//dmA7mixNH
	 eHxcIAB/ey2uQlhIqrUIbtsJnwe/NQ7P1Q6YL9n48TjS2g5xG0xfciyCNt+KMd4+7ni38
	 VMOHVufuqOFK4yivUc6XS/6xqVO4vBkAeQUXA5Jbi5cMel5jPGtkKgl8RrBR7Kzoo4FLR
	 ROVs4bFlXY/eAWTcKaZbTzepAj5wzGNh1piHCajImd1isspLyOMPHNlASz5b2ss2iyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSKVntjO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA16A606A319;
	Wed, 21 Oct 2026 01:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSKVntjO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445931F000C9;
	Wed, 21 Oct 2026 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544847;
	bh=V6m3/WsasuvJ6oilVkIro4Yg7VSyz0LpQEufM4tNpoE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eSKVntjOzA8jhw/rmzGbLf7Zwd28PnJ3IY5wUf4LEmnf6owoXK/E+eZwbA45rD/8R
	 BLjJkzsgpv9N2X3HgvL7DMkNyW/017AxPyQQi8laqqj/LSKVmR+p/S/mLdCamm0Onq
	 5eM3lLBjub6DFHGG/lekqkSjGnKBT0M+1EjPGisAV0ozR0Xc/5NnmM/yVvm+qhtWNJ
	 Gt0FzbNk+rOWBNH+FJbiVOspRG363yTTlL6H18otUXTs3ThQh4LuoXpFTM4WU+pkwJ
	 yzxAKCdwnYMIU7kttoJ2LgDLtncF+gY9UOnHH3W54zOGrzeObqx8hxwV/W+eHzzajH
	 I5T1cmkWJi0Vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4943809A0C;
	Wed, 21 Oct 2026 01:07:27 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atVqC0emrgzIQfAL@google.com>
References: <atVqC0emrgzIQfAL@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <atVqC0emrgzIQfAL@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.4
X-PR-Tracked-Commit-Id: 2d3ee0bdb321ad84d9cf18d4bfd2b839293a695d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5d379e9c3148aaef37909ce6d4c3ca18fad0312
Message-Id: <179254484587.303828.8695858092581861840.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 01:07:25 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 00:53:31 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5d379e9c3148aaef37909ce6d4c3ca18fad0312

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
