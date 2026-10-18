Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770C41BA69
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347324; cv=none; b=fv/u5VSR92vV51K/Ix/7Y8NQS7WGeMVMwHMSNK/cJR+3hpKZpgLA6z7WnMHwQa7s0/TAO3qDjsVcsomyCHMYDMjOAZ1YfegWPM8ywXVXkimEdK/bPKjPAW0FeIP9YyZ/VjTXvyypV5K6awUwcc+H5630LVQto2PvA4OolWTQzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347324; c=relaxed/simple;
	bh=wZqExt9HbXpGSb26qKBxg1uJhKo6QLzMlQYpjVv+tcc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Chk6BFOuAVd2ju4pXrrJHBFPABgPbgIouNtFt+xDpk2wwgyz84qjewalJuH3tvFBeJULGVeoWRK8OwVJVETzfnlcRnkj5YZw+iz7hgR3tjC8RQhI0SQjREyDhnE5unAT2rDeo6mmC7HSiMyOE6arSdg1oU6usIY1EUcR/Ck6vG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNBGYj2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNBGYj2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4233D1F000C4;
	Sun, 18 Oct 2026 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792347323;
	bh=oyk9xjgxNWzZVjSaC94TvTCuW01naIlJzFf18HVxIK8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XNBGYj2/nTXzXbH+k5rgjncoswueOmH6RCiXo2eP8QGwLdfOTBzcqBvK5aJkKS1iE
	 0oeVCniBpStl9tx0OWjODmJGQt63veubVtWuhkYNvgqFpy/q2hRPmN7qHANQeRACgx
	 ufoZyZTi0lvJKZjdPu0LBLqYLopovY1yTXXDrym7IrkROkPy+YkbMgGra4WWkwpAsb
	 YIgfDIj4HmNiNSTh225gLwyma7Ky5wVy+wFIxrrAGfo1AR1covFri2YRMUsZ1lFGWu
	 UdWwX3oSOcp8+PHfdlvEobMs0HCABHZfu2uR7ixjEdQrLSLshasbp+zMDSO5kskZvv
	 XH81PHq5uCMuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A34E381196A;
	Sun, 18 Oct 2026 18:15:23 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSPbnItoEdxnXs6@gmail.com>
References: <atSPbnItoEdxnXs6@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSPbnItoEdxnXs6@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-18
X-PR-Tracked-Commit-Id: e4c7c401c6b9174c0c893084fdaa6a84bd2520d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8573787061f1a59fd73fc683c3c5cfd6bd07ea9f
Message-Id: <179234732171.1771961.12299014060672081314.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 18:15:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 11:20:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8573787061f1a59fd73fc683c3c5cfd6bd07ea9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
