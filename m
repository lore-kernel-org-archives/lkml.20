Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405419;
	b=1lUaiSRUFixr7TgfPRy2dUzw+dNvwBAGzw7FtYp9NJso7SDxrquCjNUtWAOfJmqTReAW
	 yODcgdueYGfdGu89ROtcC0BtTYcYF50G9UcDxSQkpS959Q2rjooHbe8uoLDeRZPHRhhIE
	 TjiSYbEYzY9u4qLoAAv8ee2RYSXA1njdJag8Hl/VfJMLYtIlfIQF+2iIa8n9mMDuxVyxq
	 Tt+C+JV0AFxMsjW2wZsXVLZ3lE2LrpZydiumAA304LIcpdeQMN1iZrALXgtLwW3urjkh8
	 goGvjtEC19Z3dHAtzfUI2nI6PahJxnyLMHLhej4b1NgDHoq8a1Ydp4Oln2d0Fss0GZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405419;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=kw6LiuI/yFNgi/Lnc9mIFGKZx3wlY1r4nAoe3+F1OCk=;
	b=MD4CteUvH9Qy1KgORh9FXyBAaS+qjIjzqgrT+ftU+dtHX0Bl7TeLZ9tYJdnFttLQmIps
	 in0VNv6cD9JZravVNzTi9ukA9NKUk5wBItUGy5YGt2FlKNVyjhieqeRf2zFjrbkROSVBe
	 d1vfenubtpxvkNEfuww2H+OpVM6ELRDgK7nUiXOp0nsOYkn/p9qQTPY4qWclQ9mCFsA/f
	 3F9hqB8b7aTe3rbfyrZnSFjoFGHJLAAPR/nlDn1KLEWW0bYZDCzI9EwWe3ElPmOxL9GrD
	 Sc7NP2t2Nm4uSprQGmaTxZx5BeuOIUBqpaIvYUl3SyocJ7IMBxU6bCKySSnw+knHTBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcaGd+ci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcaGd+ci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889051F000C1;
	Sat, 31 Oct 2026 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793405418;
	bh=kw6LiuI/yFNgi/Lnc9mIFGKZx3wlY1r4nAoe3+F1OCk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IcaGd+ci470vvA7ks+1L73yg3DCJTk0aJ2EJjl7jo1tV3j+ZpSOBwFNV2iBhv5+6U
	 duWAdK5V0/qix/sVBw2ejf0/2DoIRyjbFt9Dnj/xBBgafFZ9GYDGaM+RdMK8Z+hh+J
	 VyrtB/VocdOTZBfyr0rlL91hkSk4VISSCfUkA9WrnoHVqpa918GhDP/1agfrG055jb
	 TUShKa+b9DviGc63X2nAhnW2y2+S8lJhp0sGYBvjIyzQZm4gNSWTwN6VlY8G1otToE
	 q/36PrVJ1eBv0hAd2iO8AKhbmJDPZknG2eDxuCARU+JNn2eA5JtNGQSwwUDC9IYosW
	 dVnCk7WdpA4MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D3533800478;
	Sat, 31 Oct 2026 00:10:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txuHS0rd7POC2gReGGnD0gmA-NrPzh1Gy4QC9824Qc4sA@mail.gmail.com>
References: <CAPM=9txuHS0rd7POC2gReGGnD0gmA-NrPzh1Gy4QC9824Qc4sA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txuHS0rd7POC2gReGGnD0gmA-NrPzh1Gy4QC9824Qc4sA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-10-31
X-PR-Tracked-Commit-Id: f94ed3d7cba3c83eef50b1a96d630d63cf54f69c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b92f6e90cf056ec80bafb858d5749829a55ac75e
Message-Id: <179340541701.1842115.2059104542542869130.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2026 00:10:17 +0000
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

The pull request you sent on Sat, 31 Oct 2026 07:37:55 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-10-31

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b92f6e90cf056ec80bafb858d5749829a55ac75e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
