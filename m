Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793475432;
	b=QD4XXNLO+VQaru23duKIk2LSmQ2DvHqnzpdvuAlsLM0sQGqc8KSe5VdJROXDR13xpCkP
	 Pm1CN0shkUU7gdG0cWLfxLopqiFov1UEHD8McA0TipXXtn3JUSLWcENkd+H4qzXS2vvP/
	 oRjbfd57N096QYos8Hi07cW/7Yw9/iPaY/nugYmNlaYb9ZXmZ/OyrA0WSV8SyVrRSD9yj
	 jHQj7KSTnD/bVyLxCHg2KTaoSm4NvcuWqIRxLK3CkP/hGMT1diKNrOPvyZmYVDyZWJFeU
	 7YkuJU3v452FCNPPvCE39GVXzQV/7dcbtT1RVF41X0OP+cnCm2ty73HuO9J0nEWwXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475432;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=84Wn/P61IiMFTv9bC4A/xMc5+TWQcZ1ES4Aeig+JirQ=;
	b=COnwI6Uljq2aeGV2eOcMgq5KsPo2vnb9FV3wH9v+24V/mqjZiqiHigbLor95oc5gaqgl
	 CR2YghBb7n5kuoALLpbvIKwi8/67TLHWMOx7lEjbRxctXlzFWbtpTQ/rVppCivV8Oim/Z
	 CBx/rh9WbWWgBI1WTu2v7/fgSpQ4cma837yqD6Mup4uB22hSX16oiNoVN8kbUBy54qHjn
	 jshjVl0Ty37oKrJ+VOvkQrsZO4GXau0ly0nTYupNAqTc6gaaiwWJ+I+BIQqS1RX67KsOd
	 D/62ohEx54/pqW7ko5iH+epLIdulgM+moenw4dO1+0Zsikqtia3DxybrSXjKsnolsCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLsqqVof;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA0606A31A;
	Sat, 31 Oct 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLsqqVof
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B631F000C1;
	Sat, 31 Oct 2026 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793475431;
	bh=84Wn/P61IiMFTv9bC4A/xMc5+TWQcZ1ES4Aeig+JirQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eLsqqVof2/vsFjbrkqXwcfGjKyjJYmyXz6N809hpQ2c/rG+lfAVSWW/8YS04uyrLq
	 iI7ayUes/3LVHlOCDkTfq492EIBztTcggDWcb9L5rEZ4P9+2UDCHZLSbkb/xqwFo57
	 slSp7Um4h39uKbEf1AgQuEiRIgWd77YsaeFZw6Hr3dJF+c6sSN7VraGmqJ0tIkmOQe
	 0IDkmgdH8tz1+e62f1qLUY+cDT1kYJ0/F1zsT6a2jhVPcn+SqW9ndSbF4GgCKCrREJ
	 46AjIyiDZ0qZS2WyvQOebI0fBPcHQkxfazEkRWDDgjOhQRjFzh+QOa2crCqQePfNVH
	 nXJTJ6yZkn5dQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D3E63809A3C;
	Sat, 31 Oct 2026 19:37:11 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h5i1rfxh.wl-tiwai@suse.de>
References: <87h5i1rfxh.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h5i1rfxh.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.4-rc1
X-PR-Tracked-Commit-Id: 74f6055d0c5997b13e6a5253fdc2263f3af90408
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
Message-Id: <179347543012.2210326.17275801290029089083.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2026 19:37:10 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 31 Oct 2026 17:30:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
