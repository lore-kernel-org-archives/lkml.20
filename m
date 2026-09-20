Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6534718C7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924973; cv=none; b=fu5A7J3hCt+1b+KHDBcSJJevosOREW8QQC9EmrB8plWdWRN1db5C9iXoGnk2XaqwVZNQX3dGKpC5hKVubxKz0cT0JZLHprH4xdrPcPA/brViyT0OeGCSeIGrQ0Cuye8m5klaMUh9dhurgbnvUwZClg57gfud2k1hq9ogERIVKQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924973; c=relaxed/simple;
	bh=bYJCjTV1UdIO6US0OSCvjKQx/7dB3yjIJjyH/wXI16g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FID91YwrW+qDpBQEHqu7M/TDdmGa+QNLendflDa4n3wRTch+kAFcqVg2ILii+KKv5sdsT6uUUOpE3xUw9SJRg6AQMn1vR8ANpFon4OXEuxWjOsq8belMmJz6uHuwZijCf2Tx4FcBRj19+3fBDH/lFJ5EpZYr3HtajhOQSlN2JLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXoE956J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXoE956J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FE51F00893;
	Sun, 20 Sep 2026 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924972;
	bh=s0CTcPHEd5WCQb7JQmIuyVAyxkrb/fHW7CQplHYw5iU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TXoE956JOTMJdIexiTAhqCDE+x4yYic2KrEneZs4dWgr9JY/WEvcEoNgX5+EoaJp5
	 6aH9ProUJi+QVqmJ322GiEQIdixLCx15kvsSLtSoNcYW0pPfDmS6Tebyj0swNuUOPE
	 2zvwoEIVTutPsl/owy0dAKDFpUDl39OhpSl4KEK/LfaBMoIcu8fhapIqP+hWJ646d5
	 68mom5JmwbyVVtGyRXUvzwhNchn1bwM9zQuiMOTcvwhin4Act8us5h3pPos53m5cZC
	 71R58ksrXNs4EuUKDdx/iBnt5qscLBAorGKQRUBqpTKzYjktlLEBYZlU69+4UxVg/Q
	 glXcm3OJXAYPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568F839253D8;
	Sun, 20 Sep 2026 17:21:45 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-qe4JS7tAt7Swi@gmail.com>
References: <aq-qe4JS7tAt7Swi@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-qe4JS7tAt7Swi@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-20
X-PR-Tracked-Commit-Id: 88aed0422f39b22406f35f1e758cea25e7bbcfb5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: abb91eed948fcdabc7360d57cc3d3a7fba75db67
Message-Id: <178992490409.1735599.18324718771092619458.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:44 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:42:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/abb91eed948fcdabc7360d57cc3d3a7fba75db67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
