Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A43B2FD6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129876; cv=none; b=s3cFPXk1IKYTxO/DW6nmZ78Fd1A1RjsXu5OrOmXdP7XULF+I5OzyeXa3VUZ/fpp2jXZrpzK2dfNBG2hm0/Z9F3XIlTHUtGe1t8tHFxA+t9LpMSDlTD0AQoEEmOhYHhWlGnL+avfk+HHXQv4v9VpGsP93MSj2X/w3nzc8VJERprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129876; c=relaxed/simple;
	bh=rXiAEPf95iOpm2ydIRi9qvwg6HxuKnyr8IRFRFh2fiE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OtElsOJIG/1LIfrI6ZmS5mf+q87zjwDGJQmuMDCKCVKSYGCCrGhTProZlpIlsGdrEKmCsZro0i87cqnPoXHN9ZitkcxiAFHoVYNzwUA2QeKTcBHjGCEXGzTJr/P6ivls+pQAlaRQGegm5TFCASe/4tzVIn4igIO2EXjXw+poysQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXrqqW5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXrqqW5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4471F000FF;
	Sun,  4 Oct 2026 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129874;
	bh=kRgZitQPlBBHNntRo4s27yMsVR/DXKF+KkzwraW90MY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gXrqqW5rU75QBjS0JemrjRvETDuyJOMwyg1yF0rmLWJ6mBePYoeKWAxGSa/Khhnjd
	 3O9RkLFVq/WQEEf4ETo28l0gUCvXhSkMzySnxOX+Mi476z/rxEbTjsNFyE9JDi51mX
	 xllbEdjVm+hpSO7VySdDKnYj3esny+EIGidwwuVM8XDwRhfG6EFSHkUTMzGV4+d3ZI
	 8diwLpvjGdeeUrahUsMsGlCAIh/YBkh35fuG0p/k8bgcZH52J7xuGf6NWKG2M+uzkv
	 8Efw4flItWQyC7ShlIDhRmTDdWuEqDWNnbeqe70zt2iFEMlk5YcsnriR1IJJqXX02V
	 VWBFBwufvFp9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B449C3924FCB;
	Sun,  4 Oct 2026 16:04:34 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <asIChrhIDr-KBzYc@gmail.com>
References: <asIChrhIDr-KBzYc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asIChrhIDr-KBzYc@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-04
X-PR-Tracked-Commit-Id: 357e8a77a501d96c9517f01f4a211eed5e9c9184
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a27611f8994c9a4772156432badb533af33fd32d
Message-Id: <179112987318.456308.15562153459381062871.pr-tracker-bot@kernel.org>
Date: Sun, 04 Oct 2026 16:04:33 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 Oct 2026 09:38:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a27611f8994c9a4772156432badb533af33fd32d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
