Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F954CF79;
	Fri, 11 Sep 2026 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155459; cv=none; b=qD3Mq5vBnG2lYQxt4A6w0pIhAAw1TcZrvo5/R/VCW/vGC0mjAK2RdXwUxWxj5lyUA2RuMVrnFt5/AuK8AZnbPezSoqfWIYtTjnYc9YT63HcFuEc3w586NSanJgInckJ2TP2wfTBwsY7Obc7Nhk3VfeKYB2IpCQmfIMRPl7ramrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155459; c=relaxed/simple;
	bh=nkqkWTjN1SVTv0LE0QbNwCnn/wW0uvOh7oBsS7GghBI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=l2an8rh6HyKxzLR01YDR0EKlqvqavJ/LPK1yypedE/i60v+zBk1aaEAMESy3Hxvitee46xj4ksCF7fFHV490TZepjQZee+YHV4r7p8YufQl2Gt/upREdncqH1l2vaiI08zTd5sDHRyUu24KHG671dDVe5l3jkCfCtkMQ4/tfIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhc4X2P9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhc4X2P9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0411F000FF;
	Fri, 11 Sep 2026 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789155411;
	bh=DPqZdptWs5zMmPfq2QXildzsn9V+ykenTfpSZKlv5w4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dhc4X2P9tj74XDWtuQrSzVRSc2JPPMbRJzbLusDgaZqvmzc1xULyMUinnDhpbgzAR
	 s1IhCSgfIE1uqasx2gZUCquj2e8HpAWagD+oYApmUZUipMjiQ1doKn1TgDY+0958kh
	 fyE9jKf8nvZO8z7lGr460Wd6gNSSQtXctNiMX8SuFmbuWm0ZB9m5GFu1IeJqf/9rbu
	 2P7EXzX2BwIXF5TvrESSMPdzywh06jdTWdf5FTFTRP+xGE2JazpS3Ry0qz/mwt3w0F
	 qXTR/r1uLs+uc7yLFFDwJeuLYq9ESn6szKJhlTyvzq1vSWcGlCgT1DahWYMrsls1Hp
	 AFK/9LtJn9c4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19EAE3924451;
	Fri, 11 Sep 2026 19:35:49 +0000 (UTC)
Subject: Re: [GIT PULL for v7.3-rc3] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260911101757.286dbea9@foz.lan>
References: <20260911101757.286dbea9@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260911101757.286dbea9@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-2
X-PR-Tracked-Commit-Id: 37bef2170d4c88fc3d708eecf3ef0f4032bc1372
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5d6c9d244c6d447c356df70d5c754b145dccd5c
Message-Id: <178915534764.3075396.11766295032189046190.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 19:35:47 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 10:17:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5d6c9d244c6d447c356df70d5c754b145dccd5c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
