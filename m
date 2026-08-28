Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A336F437;
	Fri, 28 Aug 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939385; cv=none; b=Ajfd0kYBsLTATQjEUeUB8nCx4owJkaty86wh+qurZ0u0Zk1FuqxqkseWVvkf/DzhIQZ5XMdHpufPXsVpJnp64X89ONb52a9W548NgQXB2hbH9h7gzGFBJmYo/lntkP0it1PZnfyxcmw26NGfKTM6WQjRE0woccjRU5X9Q/6fvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939385; c=relaxed/simple;
	bh=8FTxf5WyCjSIZpHGSBJjTjH1SMXSgyzPILGl76nlmZY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B6AW0HUCev+aePrEKTQXcATQnPV21FcdZq3xJoCthAgdl8n4Oa3sXNeO/wagKR6NCArNksf4vYBObH40L+6KmZlZCJUNGAdP0N84WNtRldYkM2U3zp7lR6lJHKDG8QnPndFoyxX+ztalXFqE3IzAcnUgbK2lvmVthkSOCq6zvIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9u9FGGb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9u9FGGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6581F000E9;
	Fri, 28 Aug 2026 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939383;
	bh=R11U/BRfWZEVGPa1kj9jCnfDncc98eVp3Gaz7uDuS4Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=g9u9FGGb69FgqUBmdQxPws6ofpOVPHVuSNXaR/FrHGaLZCjtjWbIWQ5lQ1QTN3w9F
	 LOE9or+w7JVH1QtT7j9T6lVklmd1qhx3taHFkqvSzGPY13B26hxeWkyYo/B8OvEZYs
	 0pHBKmYJsDPLEaicNoeryg28r+aIl9MEj0PySFZGDqkJlK9Y48zLUAoYrynVXFO/+Z
	 f6Sj3uQCx8+eJx7jW7+Gx5rqojMYZ6n4WeIbuc3K7ywtk9kyYGSawpaK9Tm0ZPSMVw
	 rdb9tsqc903B8NI+DK13FFBHTyBZI9V3zPp1ACktoyBNP/FURLcjMV3MDR0KLgZzsW
	 xiUcfqVcDPE8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BCA380AA67;
	Fri, 28 Aug 2026 17:48:49 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0dq4p0q.wl-tiwai@suse.de>
References: <87y0dq4p0q.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0dq4p0q.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.3-rc1
X-PR-Tracked-Commit-Id: c4a0927f535f779700d5ccda8182c2db01e9d551
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c20313e98b04ce543936431b6122dd639d3a8346
Message-Id: <178793932812.2708560.15340074306790356641.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 17:48:48 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 10:39:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c20313e98b04ce543936431b6122dd639d3a8346

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
