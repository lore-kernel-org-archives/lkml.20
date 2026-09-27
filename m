Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB743FD06
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538569; cv=none; b=Wpw8WCRXUA81mPZVC+8AIRM/dsDZQuuWzNsjDxR10Jlpl2u7Ro10a41PjDg2EW5ptqpYB+lvn84tdlbBHs+SV9HXWivyPsHKUFlMZLMW8h2I2bbXVsTphYkqtKDJLsLOPQTVqitYUTpVXl5xQsA0WOQOksHfXV/tom550FMKYDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538569; c=relaxed/simple;
	bh=SwQXcyDbK5EjRS+UT1y7C4IZABfDh80U/5yXb0mZP64=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mH9p8LZNGCXhWAW1vb+A4uc4yoWTPyd7TFfMh9JN0K1UWVzzivLB961W2ssbjFwmJpFm3t6amQUTCdWRr6DoU0UrcU3ytka/iPoTQZMm4HYhypXWk7Q6zEIbySbnrXwInblksDXci9DKM6xupSBOagCLADXpuEJvucYxlKTFDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ge6hRSdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ge6hRSdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730EF1F000FF;
	Sun, 27 Sep 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538563;
	bh=7N+SgkBy4uEaPxi7y1vIc35B2BOTBTFODpFF65R0iJ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ge6hRSdIc0cCPD3hU8xmgNglUHHPQ2Tz/4xGRoM6jVrj2LkFjo5CqXj2XxcuIt7k6
	 wYj7fNrC0s/GGJK9AzKvewc194+Z7Xw8fnIExyfIDim4AnppKWmB72muMKUZohuWdf
	 DK3SElO/2pMZLeztQpcW8yE+gN4QYVBousnT8R+tAR4HMHLmWwVfaPIhYSLhJdemyq
	 2/sSEdnRISwm/TJX+tg9oczpNTTtbFIjZF5XeR6uk7+pheri1ETN24fH3VqPEso54h
	 B72TZKw7pGC60rFhWaoIhv+XLQH8A+fv0WI7zaU0gmwXA/21eLc5whM121xaRboVFo
	 DivljoI54aYAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569DF380AA5F;
	Sun, 27 Sep 2026 19:48:10 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <arjPJsw8xyBRB0Tj@gmail.com>
References: <arjPJsw8xyBRB0Tj@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arjPJsw8xyBRB0Tj@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-27
X-PR-Tracked-Commit-Id: b8d1d5b63a8ef532038eebd9d97d406860385668
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: efb44d93a620c294c049db37c810c8ab7ee1122d
Message-Id: <179053848904.2777566.7294818202817097711.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:48:09 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 27 Sep 2026 10:09:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/efb44d93a620c294c049db37c810c8ab7ee1122d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
