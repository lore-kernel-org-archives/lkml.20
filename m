Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819835;
	b=5mhnQaxmW9DQOs2W6fN1XJXqp/ocidsRajqm3fapHLd4WAYRvWYcx0TmU/VhiCPEvPy6
	 pi3+t5o1fV4QS76F3sy18Nj9Oa+lrlInLCaDB1qGdTg0HDaaaWbs2NxIdfIsOjYLwRZmH
	 vAFwCiFCNRD9mgdrQw/TyybPG0QwhylTnbs025JT5tnuOseWS6pj00/9vrDiT9BaJs1s+
	 zZR2yZ1zGpzQO9sqRDXX2D+jsH7BbyZ74XBLP4a7ZWheKsvd7Wphb5/wARqBYMklq/yYi
	 w24SkLC8DCX3m0F7ZP44S93DqKFtDgFBmnaKSakXbTFKgRJorTdiyBwIAQ0MG8BP+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819835;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Dh97gih9aT0Yo7bMvplVYEJ4VBEfmnBHPPAVkbiXI60=;
	b=vn3pOTNW/4gLoV5h0uSXcslxsCWxv456OGRMjdLsUhy79ChzlqcOUr5RSz8l7b71pR0X
	 G8TfdeGA6WrTF1jtcahVMTIAKEIXuHoS50ySxcGXxbKCy9vL00nAL7+JPbU4EWvAJ9ibd
	 FDN0NuK6HfIqeadBgKdRpGWR/9uYK0GsPO2zO2Oxrbdz4MBmo6Qf7sYzUYTRijgldU08x
	 2/4MFySogXOD/kSCB4MDhW0NXfdM9HURb+eF3h2Od9FnO5RGT/l+0P98KOCw+WfKeXTOR
	 oEmhq1NB322iZkrnisamcZyQ/vNE2WofDkOVrVwdrGoLsOHPcrj6nkgVczqX7eKPBTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9h0KzME;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC70606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9h0KzME
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127C61F01829;
	Sat, 24 Oct 2026 05:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792819835;
	bh=Dh97gih9aT0Yo7bMvplVYEJ4VBEfmnBHPPAVkbiXI60=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J9h0KzMEsDoUNBMST/J9upJ11zYX9B+pcPL6uqiTtep5beDRZfmZXggi0mWeezslP
	 GhqaNfvLG0WK+RGGIlcpnLqEuyHt2m5aByChs8eoYZHItz6jEQgRqo2V/5bSkVGGi4
	 WHYbd6fMZrc3z8V0FGQvHKGGAy7bGZt1EfClJvwJZI3rf0VWhe7nMemggb0FlgDe3U
	 l9cPMEYHlKXhjHOmt7CTpCLNd/AiFpk4572QgKfhVHH/l0CdhGOwW4Qnc/wxmw2DJ+
	 2CKPVKAkC6+xgRgCqIcXscSQaZzD+hjGf2ywzGQyE6u2Llf7BaecxFLuOc/kdl6KHy
	 8TtMg9DrvNLiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05A10391B17E;
	Sat, 24 Oct 2026 05:30:35 +0000 (UTC)
Subject: Re: [git pull] drm for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twkDYDGdznUrXk8c-t1tXD52Df2LsdnF6KFDz_0xoYv7Q@mail.gmail.com>
References: <CAPM=9twkDYDGdznUrXk8c-t1tXD52Df2LsdnF6KFDz_0xoYv7Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twkDYDGdznUrXk8c-t1tXD52Df2LsdnF6KFDz_0xoYv7Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-10-21
X-PR-Tracked-Commit-Id: fad06cfaf385787b9ffa2f73f049d42dbe1de57f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
Message-Id: <179281983374.1490995.11409284564633418898.pr-tracker-bot@kernel.org>
Date: Sat, 24 Oct 2026 05:30:33 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:24:59 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-10-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
