Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149880;
	b=u6vgk/Pg+pJmlKZCXsj/1S0FZHsSvlW/xcU4ydEaOi/9ClQlhnd8Eu7MwfUVCeD1D6Ni
	 Klj2xf3B5syYrKj1ApZDoi/oHM9Jj7Pt284gpFiEpHA7ApLD64AfnfoVEcYm9KFU74OqK
	 Hq1Thpyq7ONISUYWBqJ/ncEd8dHPKYQ4g9OZP1URREiQE6DU9yg/FSHau12hEENNY0fmS
	 NNYSshtVn3FdFigc9arFGZ0nRiQUuNOMLTqelcOVF4Gm9MF5gB9bmxZYM14He3StBe6RL
	 r7U6eeFmjLNdQsyUQi0hjSh8Egrr/dsNtAlL6UpJsLekg4XwIN0y+GPj7BvRxXA+sIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149880;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=EOtsku+LVHgjVDSzts8zB9nHmLHcnjbYrT0Rhv2hfWo=;
	b=a7i5mxIJ+w7wmRKlgiQAMQxauUi5rwEpCHuH2Yt8cPRmmIjYxbJmYYYqZgsOr85rcNHT
	 qtV+ERb7aw7f1ji1rXzT0XQdK6VSpNDuifdc49U75d8QFR0yZLSpfgpKRCgFgy/FMIkW1
	 wWZH7aWr+/Ow8De36aEezKAuB7Odbtxok5PnUrj6F5bnpUr3sH3Jlfq8IanIv9D4xDKMb
	 wnTeDaKbFUQxFiqAUYMAYJfwNkRL3X2bo1YTgagUjhKNThHhLPO2mnxx+CsNeO+YkG6JX
	 IJeMHUNBMCQ6MNThUs1/YJM+iQO0ahuhaIFwTzzSyZiWnhLz55SSuMCafPXgM3FgvcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMtoJROn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMtoJROn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E3E1F031E7;
	Wed, 28 Oct 2026 01:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793149879;
	bh=EOtsku+LVHgjVDSzts8zB9nHmLHcnjbYrT0Rhv2hfWo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IMtoJROnaq1YfxSQTAbZHMe+n/zn8GEGe15xlz2WaXKxMNCYINM0jOcVPVLasNALv
	 01R10RMhYch7YmHNZNXIKljlPejqnF9UhxAjBT6rMJKgGbxHdLGmsG9MEH7u3yG94U
	 Afzz7LgGffcMezJ0IzKzrEA4SgXkE+3SKxrrXU59ctjCWvjvJjJFcyxPClEHFjvnfN
	 N05EaBlxbHtBszeBKCADTijisMdnGChGepmUy1pBTZgwAeH55frBeJpN77q5mBzHz0
	 u/w/hgF4zbezhlt8kVoAx+uJysDC5EO576nEoeEVVG8axFdjt0hlfiosfa8w8wCJXH
	 y2kxcX60d4l+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 814523AA9413;
	Wed, 28 Oct 2026 01:11:19 +0000 (UTC)
Subject: Re: [PULL 0/3] xtensa updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261027225317.1561318-1-jcmvbkbc@gmail.com>
References: <20261027225317.1561318-1-jcmvbkbc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261027225317.1561318-1-jcmvbkbc@gmail.com>
X-PR-Tracked-Remote: https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20261027
X-PR-Tracked-Commit-Id: 28722ed2527aa63ac1454013defe718c56032886
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
Message-Id: <179314987798.422389.9669441406376801972.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 01:11:17 +0000
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 27 Oct 2026 15:53:02 -0700:

> https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20261027

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65ba8f34ec886ec72b2c07ddc8cf3d815c32869d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
