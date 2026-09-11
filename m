Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89383E4101
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166148; cv=none; b=CbrtUu04c5LMZMUPXj6z2/91eXg1X1mdd6krvITKveQaBi1KR8T/PgvCNwbZW9wzv8egMgrJdxPpGYxKNPjqr3gksrq0Z0x6k/JSWZrFHrfOZ5jZtTl09RE3G7/yWG+Mr1MbO5qS/UAS4g9F+Dgw51eXHqVVwjXoxqh4p6TbSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166148; c=relaxed/simple;
	bh=kQB98Am6hepbpxL5opeDXk/96dibz7VW3pYuGBFIl38=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VDk5IGIkHN9iRrewCQM74wUcYfQ4om6YvCW2IoZ/7eOd6ijAp19IkJuiPIMbiE+LzVbRT/mDoA2bqPczksFq4gpWrXbojUgyXhry9LNGOoyY7XS2w47vPAworxEgT0YDru2bl87Wl6ohHAaJlBhSMsOWxLDzy+5otjrDFi/PVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLt88QDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLt88QDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C171F000FF;
	Fri, 11 Sep 2026 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789166145;
	bh=DwABCuGqhZdwHbE6/rRUQTn1Zqfmf5jlBb34vF7u4lM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QLt88QDDxbt//rMb8mwGUDHEBfWXSf4st1/5TH/vzIcfOPZyJF0b8+MXdGtLtEAfH
	 jcxuR3XaQ7XrHWVnJyclnzHksGz/EN0q7oGDlnr8jF9A9w63fjQb7bZ8Vlh0ooV7SA
	 DvXXMQhRFNRgmdkFJwaZ7oUFFBsrkGZ6HitPjcSIer9GMuDD/VHNrWXkTXe9stLSZP
	 hr6uAdXKbU49zHAxq8I37PEbtn+wCYLK/bKVlluGStr2pKxOdlJpD+/RT7Hd4s0Ydl
	 TvEhAqqQAEpKrf7L+W3/Tf9jET3e5wXDEibE4cl0tgLksYZO4DlUgID7ep3y6ui5B3
	 KHV++fLEx5Qig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93DEA3924454;
	Fri, 11 Sep 2026 22:34:43 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty1x=g_7+obhbefCdWXQoEoW7-WdVuoN+P4+sfYJ34=_A@mail.gmail.com>
References: <CAPM=9ty1x=g_7+obhbefCdWXQoEoW7-WdVuoN+P4+sfYJ34=_A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty1x=g_7+obhbefCdWXQoEoW7-WdVuoN+P4+sfYJ34=_A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-12
X-PR-Tracked-Commit-Id: b1edd3a3e00369080012b2e4c665fc662b96ecbd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 525f0f99a4f775060288b3069e12b1d3e2b576da
Message-Id: <178916608228.3141697.4310144305381553071.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 22:34:42 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Sep 2026 06:44:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/525f0f99a4f775060288b3069e12b1d3e2b576da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
