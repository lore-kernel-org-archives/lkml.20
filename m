Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167181;
	b=1qOdRZlB96Au/OaA439AlaeqXLYOb948mvTP8RrLRAJslK6MkK++KBpA76yhcO0V/DOu
	 gqQmZQ4x4cIxv7pPEfkussNj06pit17JvDbMtP+UrkuNa6CQhIt1zX5mIt4Nsu9xavWQ2
	 IRm81bOX+a3oRqUris+bTdlpfgdrpDM8bHE03OdUgpBtgXvgSAhGMq6I07Xr0sxvbOnRI
	 UoGZZHgZb2hWdMDgHcjn3T3xqGamN+7tp4EDGI2Hbz0YfQ46cFk4DZvFDqomKehbBEDKw
	 eNwvDN1gdcs1mf9gspR7m8VBA45jRBneXZZA6MrfLfdjATHZ/dzZMUyWjqJVTgVbLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167181;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Gk7oumf+HicsMhwT45NE9Wt3n8bGr4FhJw7LLMGOuj4=;
	b=SDWmD5QqmheCIIiLs+GppJwOdWZ4NbOPc9Qs0u15eldyGxx9gxt/CxlRvpN+VQGljB5m
	 m+xaqZ8SE1DaDclAOQKVN1BfJfqXS9eQrLPWzTeYOgVzvxa9MVi4ec1Q5IQMz/mOLtkkY
	 8RtTPiXip25DSEyAx2YRYDw7e79968nlzTqEAMC1XRxYX1uBRBMAPV+KCC7iDpQNhSXvi
	 QtNHkNsPQIhv4Hy7xjbvl6p24uOBqt/PKbkjJtkzRyycy8Fy6jPwDScozo6KVY6Yip3mM
	 nvmVM/EWQfYoaKMY/ie1f72Ff1Xp1h8EdtbwUwC2b6qyBDewPsX4Cc9uQLZ9G2pGZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiOKXem9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359B606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiOKXem9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8511F008A1;
	Sun,  8 Nov 2026 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167181;
	bh=Gk7oumf+HicsMhwT45NE9Wt3n8bGr4FhJw7LLMGOuj4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IiOKXem9wFLkJJm4JuVyLbKvsxi/DmHgqPJOv8YhB8z8KwOOxLFsDP/cPS/y2BSmZ
	 WjOfxPe9Mh+TYuPEdMN3IdLmbZf973szd3PR4oR4b6LGGAHATtX88lE7w96+faxMfK
	 h3GnEQmos8A5+CWkoRcHg7L7DxslcziKopC4vgKCZRG8zfACT/Tq7DFnSyIFsIny9j
	 ilRJ+Ou++woP7iX9dBcnOUZ0hXPbF4sqSwKJ6HOXlEclgv8MOUYo0dGZXfqUdHCWp6
	 9EgdFzLeqpCK1noD2BBUMCU+NqYbHnFMbjhbSn01Px4iNexyKSODqhUzQ3bubL4o9m
	 TmcsY+HYFxhhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 20FB9380821F;
	Sun,  8 Nov 2026 19:46:21 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avA8O8tiG0pLpMKn@gmail.com>
References: <avA8O8tiG0pLpMKn@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avA8O8tiG0pLpMKn@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-08
X-PR-Tracked-Commit-Id: 6f083fbccd5f06889bc08e1182bd02c0383b9121
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40f3717a64edff0b91686e22208312114f7e2061
Message-Id: <179416717962.1685596.17034884405793730341.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:19 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 8 Nov 2026 10:09:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40f3717a64edff0b91686e22208312114f7e2061

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
