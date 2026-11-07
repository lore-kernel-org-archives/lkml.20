Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080071;
	b=mhSxP3TFpRlw3mv1OhrApg9Z7Wsd/Oy4RmI9VFY0zW31tAYQ5DvHS3UC+9zbimn/S2rv
	 gXyE3kxuH1jbufM+8SUNSKtdXeJ51YpEKgRPmwCOS5uNby6aah5TiJpUl3frn26DT+DVM
	 9+k7y+gheFNh+0BmYTGSBFy7zr4sd9/6PRdoTm9f8ZhkK6sKoBhEkvFzh+AIYqceuKo5D
	 EY+5ynvBBWwx9HRJG1v5vkIk6vAoq5Si5yq2AIHJjQjvbOwR7uAB95ZilXnurBem0cJSA
	 DMyPnk9c7pQNUB2dY0Ka2AkzRzAeAY1bInzBurr/X6+bfBYIreqre/V/ef0NQ+/+HbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080071;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=hR0lLIy5I7EOWaXN48xdiPdjHbSikuo7QbvBMv02qEY=;
	b=P4jNh3OqEwQXQGYEDEunyNhKy/Or1UQOdACqbY1kdlXtveZD4MWHjNANQQcvuVYq+dqr
	 wMsL8lGVIh+WFu1ngO8xcd5+ZGFheoG2V7/nY34IOPZ0H9P5XAWyp9VnBEDyZr6YJDS6o
	 q1YquszvY5RfwkyyICwvtEMSGEr+Wamg/14Z+/dA9pjpksjUnRMLFM+JTh2OHHiWTj4Ft
	 YVXdmihPx3ruaVyLJ97odhrNBcxkiucSRuUAdLfol6AU+RQZ3GKDOvEAN7/FCp23aprww
	 9DyPNcI/1fQlKFqfh3gLLO3UNI09eknh4BlIYka6UXaJ0N9+3LvzCNRCoE3Jkl+kwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNzZ7+by;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNzZ7+by
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C701F0089F;
	Sat,  7 Nov 2026 19:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080070;
	bh=hR0lLIy5I7EOWaXN48xdiPdjHbSikuo7QbvBMv02qEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cNzZ7+byA86EetcnISpcN5A6MfW/ag4oPLrQHXvMl39mNNDwjNVN9VpDeHKedz+UF
	 l7mbBT3ObpN0lgvjbPpITn6O2edX2o7rsQDO3UzJC2CMrmJtRY3zizDBKw0DWsAtQf
	 7MXBPAoTTMNUs8i0VChpg2ArzERkcFaPYlURgfuQvq2+BvTyKdawABwGXST90zmm4o
	 DeKEuUBQz9l1uGXEAcheHJgMozCu+XTTbJ/dkraMH0ed4RoGIPKMvra7B7kHhUUBHT
	 5Hg0gVAlMw8x6dYg95ZvYdr1yg45XHSeDe3W2r4CX1dkbDCKGzGFXYaEFDLrsc3Pj1
	 G9A+BGknccy8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B2CD380821F;
	Sat,  7 Nov 2026 19:34:30 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz9wWFUO4Ua84DF3V3GWHSL1k_t2UhShUHS4MkGpXR+Mw@mail.gmail.com>
References: <CAPM=9tz9wWFUO4Ua84DF3V3GWHSL1k_t2UhShUHS4MkGpXR+Mw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz9wWFUO4Ua84DF3V3GWHSL1k_t2UhShUHS4MkGpXR+Mw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-07
X-PR-Tracked-Commit-Id: 19e67d977d3d4d0c54f03906ef578578190db9e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 543b7d2ca09b4b08d518d668ac2fdc361f231785
Message-Id: <179408006914.1301131.1164662599894737407.pr-tracker-bot@kernel.org>
Date: Sat, 07 Nov 2026 19:34:29 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 7 Nov 2026 06:36:45 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/543b7d2ca09b4b08d518d668ac2fdc361f231785

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
