Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74193347C6;
	Thu,  8 Oct 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434824; cv=none; b=fEAH9ywJC3mJY6GVAqjuctxUTKigIw2sJM8ES32v9Wu0hzCWqpyESdrSL7W7EjhU2qxLWE0hb0Sdp1JgCLmzowU0dl3TH9ot8m5N7nlHn46qLHibCVgYRkPR81coaQu1VnYYt7+dNpR3HCv7ZhJCRLXJXaYFZ28M6bS7GY20VnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434824; c=relaxed/simple;
	bh=hAZW2kOGfKAT71oanO+JR6HRDkwYhlO3PLBARJpvs8g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=t/7p8hk807gvaEHKxLeKvcJZOPUQsbPIbE4zx5mS6w6UUv92R+WFhvhskJNnaergV5CpMMCl/ej+db7J3nLu930iRH/LoTCkxdYh6j8TYdyk11kWpDUuWs1hyEE8xAbQrVDX0lb3EJO7kyAa6EjZHvdnKNAxgPGG3dspQCFuynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqxMtOxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqxMtOxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFEA1F000FF;
	Thu,  8 Oct 2026 04:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791434823;
	bh=kCYHt+vvTmXq+1boPaMYqJogBHH191aJ/eicoHTrLuY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UqxMtOxnOyycNyNiYOKMEJjL6sIyoo6oZl/4ShZX+fS3VqhMazK46eZ2AAAhNBhV3
	 MJi+nGxNqsy2Akn7GpXm5ybHeBniO+sqowOR5dMhtBwm2c071ng0y/7zxAzaU4XL1v
	 PtkSkzy20118Ovto0YAam8iXV2ZnXJunspWnbUlyj/QDMpE+n3hcEfPD8BOCHBWui/
	 CgEio6lb0SbE0FASdkdp2QZAKn75N5Jzfl9e8QQJ+n/QB8W/shyA0ZKdsnKtM8sCwX
	 C+S8GnerI1j3jlRVPI8wyTJAsj+Yet/vR1qely+tMS8rHL0v5Ll8odd77vciBVgE6L
	 jv7vqvLxe9m+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16353809A13;
	Thu,  8 Oct 2026 04:47:02 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
References: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2
X-PR-Tracked-Commit-Id: 1fc2d80928b706147e371602dabd0ba927dfe4a3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08
Message-Id: <179143482151.3815904.12103311342600646936.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2026 04:47:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 07 Oct 2026 23:35:07 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c2669a9f4a1d607e7591ae50ccf3c432a0aff08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
