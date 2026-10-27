Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129413;
	b=bI0DZbNiiA2ZfbB7VuOS3QxMLfYRNQ/p2N50P621rulR0EUQshoo+y+aqTShoeEWW4HN
	 0tn8Ul7UE+Ckb+cSP1b9VfHL+fCfIfV3HcZWIAwWCpWjTVSviIuY9J1wsmZusHJiuXH4S
	 0KJ01yfIp4BiMP4Z7z/Qpu/gq1uIeC7Ao3D1SwhQ9nHIch6cQ0wOgckNa8YKN2qhK18sg
	 7awseduSBjXT6Ak4gnzJFbCjr/62M4qOLKhf8hc55rnY96UDsKYVoggCZ98ArVrROzwJL
	 yg3IG8PDVHdGhmU6QYUJoFb69aye0qXKpcMX7akgedLvHqX0nTEnI3XSVveOYGXxtJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129413;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=zgxuY/x7o/J02YLOsOGYz7LiBbyRuniXRECMpP37/Hk=;
	b=wiGjMTQwdP9QjRu0YNdtWOTIfjKoD0Pdfc6BGdDj3EL0SYu+jM7f1CIQP53PWZy2uYAi
	 bwNpd+oWOem3P24LcygfpRQM9sPsHG8wJ722ZSnbjGPtown4cnh0QRDQbcNqn3R4IDyUT
	 pGuinKxMMbzgbownpzrcx1MxZDjKJpdv+PuD6uM9O7lDgoqbppeBqkVHU1vXa249vXbEB
	 S7LR3mOJgpKohRQHfuB6JWgfexaA3nSt/X0Y7uCUvkJJUe3f5ATpw5Gftznmtfdsd90OG
	 tkgipv2jCrg74IIPCBTGvfdjQckcB3rwb4h+4kU5Dj+VACiOGtI3vSf7EmXNSm1cYxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2LhkGi8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BA606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2LhkGi8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100441F01825;
	Tue, 27 Oct 2026 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793129413;
	bh=zgxuY/x7o/J02YLOsOGYz7LiBbyRuniXRECMpP37/Hk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h2LhkGi8+byOuo4N1tW/y1qvFj408VN3FxScKjH1EmlaHJFqwqpopeogQgwyaDBDH
	 ZZzxT+NqfOvq+JW/Y6eN93RzxsR8JiWehDQw9uLwFx7hzfRjspn87xR03dSIS31ugD
	 y3Ii5acBgleq4di0/06rsHqKatWEdGoe1qeDeZGrgkg4UZQVz8bUaFD3Tp6hDzYYoX
	 1cegU6xpNhpAStw5w76e/9l37oXH0ZtI4bzAaA11ThWa7KVMm9wywJUSePzrq5pq/9
	 pfX6UylKWnubhZ10wOwHDw7WNMNRCkKVLzuoNQ2iedr6QM3qVS6gUAC6PIS+DqroNy
	 THzcwcJHpvOhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 074E63AA9F47;
	Tue, 27 Oct 2026 19:30:13 +0000 (UTC)
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <at-pjQ691G9O8-2i@google.com>
References: <at-pjQ691G9O8-2i@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <at-pjQ691G9O8-2i@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.4-rc1
X-PR-Tracked-Commit-Id: ee17c0cd763b622012bc725253015b6a721b48f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92fcf151766d7406a36f2ba363dc811024146212
Message-Id: <179312941156.284542.13723438000383742281.pr-tracker-bot@kernel.org>
Date: Tue, 27 Oct 2026 19:30:11 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 26 Oct 2026 19:27:09 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92fcf151766d7406a36f2ba363dc811024146212

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
