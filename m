Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8E3859FC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321132; cv=none; b=QV4ZeVQoayEoXo46OgTADr8FG61fG25HujjfQwRoAxUrKvWQ5LWuGXIDr6+7Ip8KSojOmTpDy15+grGwBsuhwWJyiLc/ryHUgHqb9Wy3G5/EOk3OrMBIKDVPB3MLECss1EjuXaLL6zY/Oj8vL0wJRxzgV4UrejV3CJtz78lBzfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321132; c=relaxed/simple;
	bh=q41FybTaUDoVU7vyzxq0GtJlLPdo7mTELsqsrfleP8k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SV0L2qlphxjuFJyO0LNacrDY8ZHVXU2QOwFDQUGXiXRRz0CwtXtj0cY8nnNQLKIP5ctRHtxB7cILadaVva9Xr14qhfW7fVYhKquUaPx6/V/XzlVbT9j0MlBJbfTn76jDpTO1eTl8DJ1vnmKc0zjKhqY5jLIYPv2ChWqwNTPfl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJOT8wc5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJOT8wc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C01C1F000FF;
	Sun, 13 Sep 2026 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321131;
	bh=M5nVpdg0tmqd+OGZAFfY6WaCa+X6G8ie4ghU3T8WWKo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CJOT8wc51w+azHtEZbiG9QqJlPHX9Tq3tK15yKejpUykC9Gj1DaNm/PxcQG+UvRfU
	 uZ2aCZ0YTaUOeSNsTCmGsM5FLGbqBbGHQeDqhF3qKNiTZPZvlOIpiCu4yE2TY5oR87
	 l9MuByzERnUnXGCvZMnFdDs2b55J8E80PvjuXfDf707pQUXz5FSmHIgu88ELWiyJmD
	 gBFsbf5Pz2G3h33Fb7uwQGrO3MGymf+GTBp6bVVZiQHbe89KQQDDw+2ySuucO4xHn6
	 VJ0p3afsWxepX0j49Oc2oWzfwB4ObILPCYcqdCl3F7HqOVFajrQdbdkFsZOvIvo9ff
	 FhuCvG+5CXvBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569A4380A957;
	Sun, 13 Sep 2026 17:37:48 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZa2mwcibFd9w1A@gmail.com>
References: <aqZa2mwcibFd9w1A@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZa2mwcibFd9w1A@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-13
X-PR-Tracked-Commit-Id: a56c03a397e2cd0c4cf8da96dcd6214f7d0e7d8c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85855f85de484c464adb39076ebcb090c7eeb3b5
Message-Id: <178932106693.3902938.9261969298052454355.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:46 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 10:12:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85855f85de484c464adb39076ebcb090c7eeb3b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
