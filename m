Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E573DDB1F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946657; cv=none; b=OX0SZfiOxABT48mAB40BsdQ1/VdiqmGn2sfIeil6C4ewSTL8XA4YbYxQgv2NeG07/X66Zro28zBbHTY6k1+RG9zXIdmG4r2ugquBursIDxfYVwGsFLvAOr6el5uvvv7WjyTXduPmCsW1ytGrLcAyOZVPseBkSLvVIZFfAxtuHoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946657; c=relaxed/simple;
	bh=WLksp9AMzFSbF9YOv+lMvtsp9q5mJAWjegHoMmNmm9g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GtZWGvU3xb4mnqucEyXbZrYV2ReeFVcUUpD9Giicby8mpIzpz/0O3yCZ5TldRvcggRGjmE8HzZzAY25PvCGvnyAruTIGYfpT2ARAOngvjluw508Q45j5XmlBRyzBkQR7595O7U2yIzkaxR77K5blm9Gtsu/a9yuMcVnDE0YBmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJnIG8aO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJnIG8aO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0C91F000E9;
	Fri, 28 Aug 2026 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787946655;
	bh=KrOkvvhJXdH71XnyI6lWrLUd1V39isxrCgjnW5vR5wk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WJnIG8aOP7ZMX4w7JxCw/3z4LTEdKWHtflow849HXixLWaTCMTZZK1NYtO2daGuNi
	 KI3v+snomDgruFQ9It7qI+i3GYGBrdde5Y5DLen0VRiE9LiS+rOcuqezDUoajFPo0m
	 4Tjy71NJqjQUcggHPP44zc/6Z/wswjC23q0/8g20cPk1ENCBPMv5NoE0BWLJ6HWeHE
	 f5jZdzwK+hnFFjE4rPECmTz4ZIV1WbEeO6yfpsAZqyDQRHBm7dHx4y7zG9OAsUTm/4
	 w1xdmTIhSeCLwa2HC7iaqW6jn05GIyEUhb0XmbJcbdbu5e7QDxJhnT9bgll8GFajEV
	 nSqMNyubiY3sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C07380AA69;
	Fri, 28 Aug 2026 19:50:01 +0000 (UTC)
Subject: Re: [GIT PULL] f2fs for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <apGgtMJ4mB-XRBlO@google.com>
References: <apGgtMJ4mB-XRBlO@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <apGgtMJ4mB-XRBlO@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.3-rc1
X-PR-Tracked-Commit-Id: c966d29e01bbf829f8bb4a39a49811c56cdb49c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 115bd364ab20b2dbef22824ec80d15901847dbe2
Message-Id: <178794660048.2763027.3740237878635955646.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 19:50:00 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 14:52:36 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/115bd364ab20b2dbef22824ec80d15901847dbe2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
