Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907AF3B95E7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718354; cv=none; b=A/vQ7z22g8rcu3U0r8wdq1FCWIEwMwuAAsl6nYGnHxi0xeIbQI4h5vw+y/fZtSSRWUnYTOnNbaHn4Lr4Vti/sQ5X7PVkwasMciqdt8sbtrWDCIehvki7DZAXzVWPkV1qEI+tzLZM80qWuQ2S8sBCQoNZIcwPzdRNKd5ME3OXA78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718354; c=relaxed/simple;
	bh=EXyQbWeQqPZ3oHmq9MAV4OrQDtM0oKrR+L0LGjCTfEo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Y2JKkDFY1ZvAvUKtEQZhX6xyNizUaNOXLbZ8VmANaV9sX0KWxt1u/72ekZtLOecFTsuCZ2yavZ/p+H0Pvx+TwzrvRpPIW52CuMW9AsTAT6n5FJZYEfxgBK4OGWL9up9z09+l/g3ferC4JEK98uFhuGgEPC/1YIzM51lEUIgvXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAY0do9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAY0do9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743111F00A3D;
	Sun,  6 Sep 2026 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718353;
	bh=DfiY98gPlwNAetvof4UsdvyY5SQQhlIirwPHTPkuSaI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hAY0do9fFtlBFjxft9c0EXvay+YD7XOB7BA9ZMIIyDRFlP28s6GTyjrfCj0TArPZq
	 WgW11AvPcPcTzi9qRhVkyrv5aEuZGIkFH0e5NK58ZC8GXx1peCW0I5EVR6K/Cukeqd
	 UfPDbAt8tPsmuUm8CM4MEgl+x9iwCOr5a8rTJVAwxbD9/Nz1+fszXTk0GWv1ObtVQU
	 /o48aOfK+3UZXowmluF8RIkrkBZIHlO4Z+w1ihnMbAt6P5H+r6yNFMeSFhAMuD6/0f
	 UbvA+YAa53y2EGn72WUuYZucVaxtR0Ocqt0kiXgZuXYNjmb844nWT3iBUlanApsQvW
	 LmOltQPtcJwOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5686B3926249;
	Sun,  6 Sep 2026 18:11:34 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap1K4AyMCwR2Tr75@gmail.com>
References: <ap1K4AyMCwR2Tr75@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap1K4AyMCwR2Tr75@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-06
X-PR-Tracked-Commit-Id: 58a8108bc73de0740d5b88150465d6690ea5f85f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c4a3928e7d0c08f2946ec3cf2814ba7738a08347
Message-Id: <178871829290.1639575.13319617930570586768.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:32 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 13:13:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c4a3928e7d0c08f2946ec3cf2814ba7738a08347

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
