Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F32AD00
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677033; cv=none; b=oFdlxScKZCpsAlKSjMEha4aM2GHX29ogQe8IGJ/6xuqhQAfKWItwa66SZn8/rHy2dNz7gWcsoBlPijCwHw+ODZuWARrNicFmI9bIiwlROyDdogQhy7xonWvgiw13kO2KlftwrzaNxISe/ja7AjaKFRVRWBXQ2OvcqYGl0EAUxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677033; c=relaxed/simple;
	bh=LVQVGWOx1Yln6NZstKFaMmlqXTpPfkc7FC9tZK8Mnh0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J+xRh9H1+sBz2xHWJMlZinBEtu+hii3GJK08Uml7tQh84t1dE2cUjf5zJtAQGcVZ+nNDpkXLE9E13Hafj9/V0xkywRXsyeXmSvbQb5lWjodoqn5gCXuZMMEXoZ1BhMxAs/LMx1Fg2jAOxe+BD7pKtTimsRL4ONzfSneclimlCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fP2x/YP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fP2x/YP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414AD1F000FF;
	Sun, 11 Oct 2026 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791677032;
	bh=FWKMjmWHeJA8O1rpfSknkdz6pa7ZC6KyGE2ideprhJM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fP2x/YP4pFqdYnXHRApl3yVjLkv3eWzXsLhNn9R1cy6sTfPD26bMzf2LIA3MYhAfb
	 n5VyhHP/W17tufL7llxHdG7r6Ku9/TWM4kiNeaXjOen2UsJIgqUbLN+PKYR/qDG38Z
	 XihmGPBXn5B7DHbOMuPBsWaPWPnNwTjOXe8pUDC5J5xoBoRigi/IJhmUUVnZNcNfDQ
	 +KGCnyfWwjkuy/FEVibx4eSbv9nfMTwiNUdhPc24d4rI2OtCxeM110iDIKdx6Ra5n5
	 V8tDJMwbVhBY+8x3PCnXWRn2iisooTRffq7VyexmIv6GiK4mB6L5NTnk9DfwsqrB7w
	 aP4DEpXCNfrrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A351381195E;
	Sun, 11 Oct 2026 00:03:52 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty-Gh9_5sqdFzz6gVvvVjQ4erOSEg_bm8S9a5O4Seu7Nw@mail.gmail.com>
References: <CAPM=9ty-Gh9_5sqdFzz6gVvvVjQ4erOSEg_bm8S9a5O4Seu7Nw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty-Gh9_5sqdFzz6gVvvVjQ4erOSEg_bm8S9a5O4Seu7Nw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-11
X-PR-Tracked-Commit-Id: c61e23ed14359e6289c08e55940dd3401fe27db0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb934c29fda8dcd409145a0deddc1a8095fec930
Message-Id: <179167703070.1871243.15634334620212402831.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 00:03:50 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 Oct 2026 21:23:16 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb934c29fda8dcd409145a0deddc1a8095fec930

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
