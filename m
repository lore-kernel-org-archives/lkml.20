Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC244E65F;
	Fri,  9 Oct 2026 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588580; cv=none; b=n69iMHQ7ZBLyEfxo+UqD2yLRARTtQ6VOIZQhrOfUh3VAjfJ9A80XlSqvWr2+ErH52Nr8s/9x1jgoM5adPajKqMitO7mVQK9WTHBqIN4oX+0NUN4sUXAfN4lz0/ugcW6802muYmV/uWhxQOaxLG0YmRji6rJWFYLgW57V3z6OMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588580; c=relaxed/simple;
	bh=y9ygZ5PjWOgZpr9lE72PVwsUfhclgJ2p8WcJ+3KJgiw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JdaVQQjP5t48duet8TffK9csuwbwqICm7YTTBI9gl688CezLJEdi7ix+orM4wlxorTlP1B9B4p9Smpcv9l1YZhpR1JqD5Hx9jyINEbJfj0xLt9Z+dtfI+qvvCmSegYhrQFe5/PD8ne0WKCq1iRAAWnxsLx7NzCzif6C5fylhXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AExyRT7S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AExyRT7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822E71F000FF;
	Fri,  9 Oct 2026 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791588579;
	bh=ChgA0oN7VteR7IVoSiywjMgZQcOFQuk6uTh9yr1prwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AExyRT7SEIxhObN7x/aCBQY8PkrC6DqxIGcPIKs1M4lV0xf4w04yYfhqgrqhkf9s3
	 EZRqpKCqRwhmNlG10GIQy1aOmOIOYwXm18CiiqObUkVugRCWkbqviK9pIjUFLFYyI8
	 fQ0VOZbVHoWv63YfBF0BLyasEzWwGI6tjJQuiFvgZG9/ztFyg8efEo9eMSc1YHhXDx
	 zS4P4iXN/4YJF/kGpmZ1pe5IPLxuiwQpq/2W30wovOGlVGv6SHjt/4emhn+xO96jaH
	 aSci6F8Hljip3xtI4ywmmCb+cXxt8gG5mLHnClRL36ZGT/Gn072q7WGuSAcN2oz+vl
	 gn+CMHFcRTG8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 785EB39263A7;
	Fri,  9 Oct 2026 23:29:39 +0000 (UTC)
Subject: Re: [GIT PULL for v7.3-rc7] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261009174146.0d324c14@foz.lan>
References: <20261009174146.0d324c14@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261009174146.0d324c14@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-3
X-PR-Tracked-Commit-Id: 2579cbe68005f46fc7f8f95364f6b101b07b9d1c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7bec60381da152e110bb71358c0903f9bc1826e
Message-Id: <179158857838.1045673.6733666314685294352.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2026 23:29:38 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 9 Oct 2026 17:41:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7bec60381da152e110bb71358c0903f9bc1826e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
