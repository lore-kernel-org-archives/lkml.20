Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1000B5172C5;
	Fri, 18 Sep 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749735; cv=none; b=AOtTqBIeQtbTNNH757y7B/NIHGg5R7QVafTwHxVyloUsEUEWpD0oYCiM39Z/lQTrJrNYdO+DH7/cXWvN1CPDUsMdulabfQ3XwRz0wHqfp7eeyIWz1ZTKzGgOLttQ89cueCknRmDNFrqXYe3I3Ky8Ewii6XCG8auipVhiwRmGTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749735; c=relaxed/simple;
	bh=d4FMt4nea0gJ4JRVnlE4QpbJQxiMsBwmVEe1fvwcygk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OARz6MQ0VbpkYJZ7bZ37S4ax5rAu+4lmRU/vv7qy8l4VU3My0QmrP+nd0F8IvMnzBCo0z+XdwgAjEgzAidhbP0Pw7ZHOCHT/nVGg7tsk6gG9cAXAPr4hZ09FgI5rpJXlNAJI4IJ8Mm573SQxQmH2Tguu6v9NXLpBRN+CNqzBQ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojOfBmfH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojOfBmfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5BB1F0089C;
	Fri, 18 Sep 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749710;
	bh=v7QxrCynyF4do74mgaq70tIQAL0DRCraRq7S2qg3lT0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ojOfBmfHBuNU1fhGjmtNDZsbD7K4jPiitEXHK64AX9wvHUE2UxqJtGtGBs7RgO1iR
	 kahTWw/pejOJObyGUX/Xaj7m0y+zdc3p/OZkNILnE8eHY5m7VVPcEwuc5pN9WaYZab
	 o7pW7d+g4hNn6IPUh39AlMMy5IK9W/ddZOhIxlx7AQDxRNDCUPuw7TL0E1vQFkp3ZA
	 tX5kUAz7afbmjEQ5lJn+sGhS10V2CkD1kf+CiD6kJayeopTUIuxWcvWhiXOa1tAS07
	 oU9mb/lNTCm7qpnMl9elfD/Yhlua/H6D4hQIqMuzvnQhIdP2x1jEoOS0LlE4041Ob3
	 HSzNhg40VWtfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B26380CFE4;
	Fri, 18 Sep 2026 16:40:44 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
References: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3
X-PR-Tracked-Commit-Id: 4dd1999783d7d12434006289338373e49492dc96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f259f446f5198d98e13756d2cd531812a0ad3064
Message-Id: <178974964311.1040423.2904965268263147242.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 16:40:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 15:40:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f259f446f5198d98e13756d2cd531812a0ad3064

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
