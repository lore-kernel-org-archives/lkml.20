Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A33E95A8;
	Fri,  2 Oct 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968588; cv=none; b=G6YjJtCeXC9j5kuna63BJCjU77HBPY4R4TaQllKfUBL7HJpDlAzqyUXiKz0TKsrgQqU9hB6QClMCFcsmzvdpTAoleay2OysSujQ0bCS09OVHicDYk4YIjMfR0M/VRv9ZTb1mfS1MfHBR+hisIrpznvuhYt1cWR7MNWV8fr85nc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968588; c=relaxed/simple;
	bh=qgdNlEGge40xPluHUXbbBVGmCGirlXnVZO/jwsUACAc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZgL1ezrzFVp1jDTaCMo9WlmJ6iy0Vc5s0XisZWcKFLTKgLL7hYh40EZLqBiCqTPHHutvu9TzNEXeutx6a2PQZWSP9Wq88nO+n/M0W+nU0ISJRG7xbdyybjgUQ8lxX8WLenVlu86ddDnVVBqrNogA6N+Re1eAG7rwavUqtpFtS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo+KvhWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo+KvhWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819461F00893;
	Fri,  2 Oct 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968584;
	bh=xs1LcWDegP4fgllUjiBrR99vhmG9u0pY1zXoUXGjgWU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=mo+KvhWhek7HoxadlnHmnRb4wjofVSBeFIG7JlflrOf1xb4toTmAzfQD5UHOGZ8y0
	 ZaYxxwLCh6Hm75qO19zVtwMEV8DV1d8+Cu0268MErznaxvSRexSKb+4Ptusp0y9ThK
	 If/lwYB1U296w/F4IHbpyYRdukFRUE5XJkVCxkqjYgvGEjdY54M222dDxwTlryYvA8
	 A9KxkM+YZEUVO3s0CJrxBW66R4LU7RvdEQDuqLhdN6tFDxsTxZsn4t7Dj7EF4oGrpt
	 48babrf+Lessh3aLBXQCrobJEDmWu/g21DYDHNfBq7a4TTj6L9b55DSPLiscPEp+Kh
	 E8Lyp8gQ5gHLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774573811A6B;
	Fri,  2 Oct 2026 19:16:24 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h5j4yxtw.wl-tiwai@suse.de>
References: <87h5j4yxtw.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h5j4yxtw.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc6
X-PR-Tracked-Commit-Id: b4e7fc36e31f59b318d38afe621ac20650314d27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d144c294ae21c1bfb275ba06ec73c2d1ab7cf92
Message-Id: <179096858303.3549447.15167100972391571457.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2026 19:16:23 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 02 Oct 2026 16:35:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d144c294ae21c1bfb275ba06ec73c2d1ab7cf92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
