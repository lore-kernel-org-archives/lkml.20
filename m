Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3250EBEB;
	Fri,  4 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539500; cv=none; b=G5qyTj4u067WdDocZTQFHICnGQyb+jCArNJXjrYPEOb4MMHao4jPdIqVs6uXvee6s0QkYR/0XuIlvsM9vAcw3ZDFiy+Z5uSH5Fz2rLMxzuTQi9SBUQMXDJl08/mYkAS+7dHmELYXxJf4Ef8QyzA+7z0ucY9H479u5OTIR5bd06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539500; c=relaxed/simple;
	bh=dkvcYxAgooTNHK4lYKlzappxwQqULNwlY6K195/bwVk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FVKWm9q3Xp3c4mBQx2KQKWabQ7NvPWJHdIZb50AUgyCSO4RCPEOD+rxOI1vd9fMVty8eFmTqOtmGIotp/62sIJT7p0gKpJZM3ihiPkHtLAPp0NeMZSyy5cEof+L0PCXsBDo0o1DN0pQ1nhmXEL+lAUc1p21uMJzP57waRFjRdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtviQ3UD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtviQ3UD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AD01F00A3D;
	Fri,  4 Sep 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788539499;
	bh=CFxkNEeStCNXHh+VM0+bVkjOHV9fQJJLvuSSxj++ESI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PtviQ3UDmEYEX9z8hU3VNcI0yfLVt0PIY1DadFMUKi7fS7nh/cN05lG1HG01QWtN4
	 nTcK1QvHL4wYXfRKhrGHRMJzyJ8R5YGozl6ydStIxjF1Gblm7KaBQYeoLvlgh9diI8
	 2FJlZJKjA3ERZpD1QuvoBhr7qC1dBZkmyLOg8c+SH7p9cvWvAUg3FDJ/6Vd9KGx+BG
	 ZsovlmppZXWONWfJgK2VPZceaXIAiv5PrW3Fa/tuGW9BJA5GwPdWqk/y+34JrP18/J
	 b1uj0jt++TbFwhOnPBT8mvuVgW9q82oOQa72ucHTFuUo7iFMUC6kxoOOgD3SMkjiP3
	 khMOGs/v76SBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19C2C3924A4D;
	Fri,  4 Sep 2026 16:30:41 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <875x0l5b42.wl-tiwai@suse.de>
References: <875x0l5b42.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <875x0l5b42.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc2
X-PR-Tracked-Commit-Id: 3b26ceef88c110f4d188387cffa0df78657be904
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36ec09e2637c3430acb8ec8fc3c303d9f1a24837
Message-Id: <178853943961.414657.13010753220192213058.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 16:30:39 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Sep 2026 16:45:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36ec09e2637c3430acb8ec8fc3c303d9f1a24837

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
