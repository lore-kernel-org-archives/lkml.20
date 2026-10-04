Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47B1EBFE0;
	Sun,  4 Oct 2026 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791087618; cv=none; b=cPaeJ7vSRHXiDtSGhlRnDSkpasqX2jTbWAXMH8ZP9XmgImVJxwWFRVSA0Bzcz+sgqAe9hKNXUtslR0daT+LE9pMMDZ3uCzKGuvRAXj2mdNhNO0a4c4K618K6ZLsTUtl/yD05HPCybPTYLFPfJESbp8S3SBPeNVAZMikxQ5Hb7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791087618; c=relaxed/simple;
	bh=PZXLIxbJ+m2FvkF55PiRjiTXa+7fqz0avrfZFtha1cA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=guYKm7gEWS7OmUBi2YFmkSYZ6ER8Z/4Q0iflmPfoz1ByOc6IL8ToYfcRGIPcRrgWqRHVG6PrY0YEyuDnm+5Jj62lryUFuYrtZ5AkDAvZ0h7wwYvZKiUnVTgpH0yOTgGmh+hQ2rcVMl15dqPT/X6PwboZivqaiFFD4jwcdbg2Lbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbCQg/0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbCQg/0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285721F000FF;
	Sun,  4 Oct 2026 04:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791087617;
	bh=7OC8BSXlct8JJow/aDStig6avjuGv/hNiVDRU5GnUhw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EbCQg/0i4xHt0Zxbn9QhQilVqOygvqdbNrWPUDeX25+ZrEEhetb18TUWKNEtfHya2
	 Vny3nFFsACnyTzOmrG5agTaVeDxrSjsNSoBYK9mOMEK5Aj4xj/n4AbymGSIf00UExD
	 JxRoY0W73B8E1H5rKZPO5vsx+mKB0yLJz4CWYf5fBHzdv4b3PST7fYqg0gFGT0Vx8G
	 kma8H3a5chkAa68kYRgCzQqZjdv2CmBhKf05Y6nOt80wF8RSyGpmkBoZpa1q9ehE4b
	 kHKcY7wu0RkzrrV4tcUSpXPgitpV9XT5HN4g4j8P+zdXSCLbQ6XKr8MMyet9gExfje
	 1nAwNqzVyD5Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3D773924443;
	Sun,  4 Oct 2026 04:20:16 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC urgent for v7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261004035929.GAasHPIYlVqxw08xmc@fat_crate.local>
References: <20261004035929.GAasHPIYlVqxw08xmc@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261004035929.GAasHPIYlVqxw08xmc@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc6
X-PR-Tracked-Commit-Id: 5f43a2d35d5e748c09a50a98fc766dc95bb3a6bd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6addb4f385570ebc11c4eb499a4f1c149f313e84
Message-Id: <179108761667.298529.2071270317753273162.pr-tracker-bot@kernel.org>
Date: Sun, 04 Oct 2026 04:20:16 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 20:59:29 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6addb4f385570ebc11c4eb499a4f1c149f313e84

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
