Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5373EA967;
	Fri,  9 Oct 2026 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588574; cv=none; b=XzhJLJq46QtlqPzsDNmxVj1wVGeL9mNGFue16pgYU5T9vjzoyEi1hwbgCBN2waNkRTkoHIUwFCqHyD0Z1174qrk6WQWErpAllDcwYoszt3uOcgHOZLY7hjfB3UrSxfuVxDHBqNzVhaP4yP/GbXXbiV40wZM4K4d3nFjAlasDSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588574; c=relaxed/simple;
	bh=JA8R4511pG14tHOQ+6cpbbP2WHqbjvMm5DKR5RwWoDA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cazd5UeJWsObHbcIv2SsEATycL7oDFM+v1jyMGhyyvUPojIY1k+dcttFf/ySCj2VnkxDbOuf+QSN0DMIosmvsBSB25jFL2x/W0jRL9r3u3NoUlQmzPu/T3UPmw+b2gieSOKvjEt+cHCZaScy3+n6dfvHZx0YSMhhXz5LP/wzlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arCmmnXp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arCmmnXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B351F000FF;
	Fri,  9 Oct 2026 23:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791588573;
	bh=sO2fwigL/f2ycVP6Vkeu1XiE3wHOpoSNt4FxzIlbgL8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=arCmmnXpSRTJcfrAvPez2VLuK7bCgbHhcECvQG4ky4/u5ve9RBpR3Ij7MPKQU537F
	 3Irs4wyEy1y3l1eKYLTlCaiQEjzopDkDdY5x2qXwJ6ugd/pe9kXzgeYaUOyCZmmPOC
	 TRRBmN1KZvcz7nyR8VI/mZzQi5+YoDN5UE0+Ow+Ivq9lMsl7S3B5aGz7JdBmsyx6fj
	 0FiXpbOAf5VgFGZojDbJ6TmmBvHs5vQb72E7arD8h8KY+6gvZbDTutrBVUqnGLWxaJ
	 yQ+XuTrQbPi59ORtypdMYeYEIGdIpuBP/VLa5BYFgyhrYi4bDXSefg3Fnw7R5q/3C1
	 t2oy+sN2mnmOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5FF39263A7;
	Fri,  9 Oct 2026 23:29:33 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h5iv3s27.wl-tiwai@suse.de>
References: <87h5iv3s27.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h5iv3s27.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc7
X-PR-Tracked-Commit-Id: 07c75552f7fe636a0695baae506a7d72fabd3be4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f6ee187fa3a7b3cee4b9dae6c3dda6d1d3237db
Message-Id: <179158857169.1045673.12914213662812480320.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2026 23:29:31 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 09 Oct 2026 15:46:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f6ee187fa3a7b3cee4b9dae6c3dda6d1d3237db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
