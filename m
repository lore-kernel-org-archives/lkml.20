Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849471;
	b=opg2lz6SRyD+Qnsn/X5K4lxaayBlC4pCEiXzoBeayR/akbq2CLyRsrBT0VIFIGzLdvll
	 RbFTgQlm3n8+32014PHIjizMBnKEvhuvUl4RhvNztPu+ElJunI81rLH4JCR/5E961vtEy
	 GH4F9EHF8gPuz36CKf5fZSoYvVpJb2iVIyyAxVfNJ2t+pxVKC0EYJm1JS6xmdbS8JTLq0
	 2KPueO0JW1BagtUqmNiKMOiuOp1z4QT8C9eLIYy3Af510Uc/1gksIlRo9+ruMcJphRjJa
	 NkMSeNxtOCrB6lLrTR8Rghk4Yt68mIIlahjyG+iGXvTHaiI41ArCQ21UgBnvhKoKF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849471;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=TYt//InRrtqf7j0oh6BbZVxoCy/aH0E2EtDi/6/wLfQ=;
	b=G//9HaROV2Npz2P7yLNyhtod2LVz/bjszmyie0nNdrEEzvrK1tiA8DvlD+tIIW+qKN/G
	 Fh30H5oTZT4OMr+kaORNTqJT7W/HMceSgzwBDbYoYuwqJ5LsEsYNi7PwVS2QglzBjw00I
	 gdQLAIzWnIpNh5LcD8EsaPAVWJNqNzgBRsyVXXZkN5R+4LyB3FyluANgDErqQx1Ks8gRg
	 LonRYcuaT858rQpdM0VgfvJJvqNjNCRT+l4aSjsbrap/ZDQLv4Dw0NYWXNouRNaJh1Fnf
	 E6BYRieWD8zxtCEGXHbH6iFe078ebxBCbhxuQFmJ4ua0JlgyRaFt/joNZxJ6NLRoGKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo971KVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29366606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo971KVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0679D1F000C4;
	Mon, 16 Nov 2026 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849471;
	bh=TYt//InRrtqf7j0oh6BbZVxoCy/aH0E2EtDi/6/wLfQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Xo971KVv/zsL/9tU7CMfrRZjGXVMWAYCvvGL663ekd5Wbvs0Y/iiYrOdxM1Ghjsay
	 fpQa07Kea++/P5o01zTFSQhOZ0s2ASVgFFlaPWoRoiL2eutYohKHzpqknSYDHghmVh
	 tDc1T//O293JRlKVb6GBFmNHvI5xEJyukqNg5/pRfIfoJYjX4Ga3pZrmZ1/t+DwUUp
	 7rG4FQ+AX46G2O/DUGeDsCPki73knrBe0cRNXsIirl6VtN6GNRsrS0pJH3tW8xjoYJ
	 GfHvurnxzuWYqdatllG2GKhO7SIvg7NR0MU8A5TDvvDOiZgNHMDSwiQX02gM9pR41+
	 uHK+mCKYDIsyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14B0391AFAE;
	Mon, 16 Nov 2026 17:17:50 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <avrgvJDaBJit5pfa@kroah.com>
References: <avrgvJDaBJit5pfa@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avrgvJDaBJit5pfa@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc4
X-PR-Tracked-Commit-Id: 4dbe5ea929ac5a5b8dc21787d0e79fc55a0ea9ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 141b164bbe186423e295b139e40e8e2d11cf1341
Message-Id: <179484946958.3777341.6286992683587134060.pr-tracker-bot@kernel.org>
Date: Mon, 16 Nov 2026 17:17:49 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 16 Nov 2026 11:53:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/141b164bbe186423e295b139e40e8e2d11cf1341

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
