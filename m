Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8457440A19
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538561; cv=none; b=oOe+CvikZQAY4GMP6VyQxGvjWHcVegetoGai2CrYh8fBQncy++NQMPY6cjN46gsCxJbuByMxifAEY2mbkZIoOztyomTjwxjPgPLUzgupt+fi5T+Y4hzbzNok4kaoOuc5evt5dU6vKe1PeV6aHu0N5nhrNgChaHtll+sEJuNhxKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538561; c=relaxed/simple;
	bh=ycrCbgHuZ1mwpBopsQJ0GX7w3OsMQUB4rI1Sjk486TU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KRJWoF9b5BxjQmWDSIZzvW2CCvryNn2cykAFlRWjr+AzRGOB6CfhVI8R3Wu8naF0bsevkKf5X9I0wtWTgcgD+BHgLJpRtFbsZeHJiqR3gQUmI2F9yJkbjLmfe5CY4x7pWXRyOqaAAT0mbG4KJDOCcuMRiWtjkbJb8s5I0nSADek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0ZGFz6P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0ZGFz6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851DA1F000FF;
	Sun, 27 Sep 2026 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538560;
	bh=GD6w8vr4zhFXgm2xGCE7EfjdIeG/5DaKo27NefV3LlM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=U0ZGFz6PNpWwkTiJbV+Ye2LeacJ3Fb5SFZ5UX3gY3GtWfMPE1jM9ocHD27G1j7e4H
	 iduiIX9LNEn4AZIa11zo/S151r8kr5Af7hvrewcduJgESoyGQlhOxyN/P55FVW7Hxr
	 JpeP61jhF89oWlfvapMAcUbTqbqmQjR8hIps3ox58ghGexyLF4ZF3VzuO0MPHWJmNC
	 ZcT29b00qeehuQaHvoYHsar+0gsi5KJ5mWXX6oOOcahZRWZBaw99Q2mabEwtByqgSp
	 2ZFRD2a/qPoZeXsPkBOFYUe9tsdvWXDYLC5VUKXchDNldmazr1SUztfWuuxaTbuNL1
	 TpME07VoGsdaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6627B380AA5F;
	Sun, 27 Sep 2026 19:48:07 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <arjMxNosOxpWmNNh@gmail.com>
References: <arjMxNosOxpWmNNh@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arjMxNosOxpWmNNh@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-27
X-PR-Tracked-Commit-Id: 24b620729e53d978b3e425f55bc66efd3bab1f59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ccda18d1ba2ecf436102a211baf1fbd5d81703f
Message-Id: <179053848603.2777566.8853953528039487705.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:48:06 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 27 Sep 2026 09:59:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ccda18d1ba2ecf436102a211baf1fbd5d81703f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
