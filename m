Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8638550E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201415; cv=none; b=YWjfQLawTroI1TWKyw6DtnbOywYeVf01Z7W15xUbukoKsz28/9YUJBtpbMMJ49C7I0UyvLO/qXTDRkOphMRHKeB3rem8Tp6BuXcKDBZC4GHm6X0BAtpAdKumKUTaG9qU3r6tCFdHcx5YkBpP4ZUggHJYoRe/rK0RmYWGkZw7EQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201415; c=relaxed/simple;
	bh=X/AKpQ80bfjusyF1H+iyP7nWsNCi4qFI2JwoaLoeLE4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OK2p5uwTAc/ad6ZzcsVmCdwZ2Jnqwqs2idBVlHhhTcGYqM7DoeutABcpv0W3jxmfe78no105Jkibl2gRWPy+j7XRd7m5tUmUVYcdcLs5BfpzfQ+VUnpv5acRkzOgZ8JcFhFRtPGHTiZAHS08h5Kbr3RvSbRLKqDK+djfzwt4q70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brCHT5xZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brCHT5xZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AF01F000C4;
	Sat, 17 Oct 2026 01:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792201414;
	bh=jbUmEp2hAjKmLTkX1BCZDqAGjVXdLC7pt4TCKIbfFxs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=brCHT5xZRhTVvx/gqp8S1r71ouXt3WbvN2v4iN6G9IzdXWv4GGKP1mlZqgQo/gTsv
	 +uL9Sp/tJbDfLs5q5g+tJMVNhfmVcDf1koveXY6AcCpkV7Yb6P1FvTH+vh/JE6UP+r
	 XiFbr+NkRf4+JI8DPDNCzyPOdtYUPm6wgZZ7w5Ig8zKhTaN4Bx9I4NiP5zEn0jLDJk
	 ++bAUiZWmVJ16X+q9uByl1kIHu/qKW84WWMrqELxrdB1+WHt6s7ldYA+VmFKteQHsJ
	 oZXAf7TgCUE0rOIpOX5ICdiWtnn7SZc53/xsL2oAPSr4G6sunhB2DClgB/C1hstQoc
	 nZgd7XUTPsnKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7745C380CED9;
	Sat, 17 Oct 2026 01:43:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz6wzOBn8o_xgpKkstWwUem0tGzau544TETtuiNthN1KQ@mail.gmail.com>
References: <CAPM=9tz6wzOBn8o_xgpKkstWwUem0tGzau544TETtuiNthN1KQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz6wzOBn8o_xgpKkstWwUem0tGzau544TETtuiNthN1KQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-17
X-PR-Tracked-Commit-Id: f91a4ac69629e1479745e82100863157e6967ec0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58161ead29e50d70a317ea26b472e0c7508e69da
Message-Id: <179220141305.1053691.11331644666621373723.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2026 01:43:33 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 Oct 2026 08:02:17 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58161ead29e50d70a317ea26b472e0c7508e69da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
