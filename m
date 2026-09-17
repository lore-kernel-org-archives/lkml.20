Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD41502798;
	Thu, 17 Sep 2026 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665221; cv=none; b=VA59BIvuLUVx9ssBZ7oj2sT6owUTfjylMqOcogX5uwNQqoV4quFrFaX43jADm+VfbN869CkpZZE2o8drrX3TEywDgFnQOrKOHzmeCbi2Sj0K/5xVc0BP7yx7p8h+kzcScfzdijwNYEqwyfe/1fFjFYm7BZqAOT/rBLBXUUS55q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665221; c=relaxed/simple;
	bh=kU9u7aPQiDXpsU3KZIRIVdwhOcynvHchZvkMNomGDRM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Rtd3DcB49/fdbaqH8p2DF4TWk10jhNDGOTVkdeNHAlQdrHW96XoaXRp+afwDpluTsxgZ5j7wrWH0l9LxO9SmEqCgUgS3GeH/PvUkYq/+wtdBkSN6jbqCP+34kiG431BIkU4gVSInz7HSG20lwaW7XYdCxaS2hcJOVjaNAU8UKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTWRJtSc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTWRJtSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69611F00893;
	Thu, 17 Sep 2026 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789665219;
	bh=2KwG4KNE5UJytbEWhR9h/JJwxFpzdyFeN1foNaKQRxc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PTWRJtScNuoehKaGFF1WnAt8kgzsstav9Pob9nJI/GZPN9TP6dnW1N8D2xODu2siz
	 V1H1sCM5wLDn9Qy5QUgAfr7qq6VtUqK1RMhrfyDW74u4w9VokNc3BeBLTDy2YzNlI/
	 h3uoSNHldRnOf6CD8No5yE5NbZEpWa/fLJ9YcPiSK7Kr1vZ1pnbCbObQfgHHJ8pNqD
	 8Qgq8VBw6YzhDVVApXLXhaiegLAEkTzlTSbIE0KsSBWE0bx6e+Ip2dDJ/jUuri5l4A
	 G+2dNS1oXRB+fR2O/AAHls1SCD8C6neb/IfdsftfUE/SVBoW1IvQrRZCTxrDzy6P6+
	 XQgUEIr3cPx0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C7381197E;
	Thu, 17 Sep 2026 17:12:34 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ecesgeet.wl-tiwai@suse.de>
References: <87ecesgeet.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ecesgeet.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc4
X-PR-Tracked-Commit-Id: 546b928da0427b0d6c663cbb992bd7bfa9ac7971
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4982d3552a3bf94de503acf93433277d08421de6
Message-Id: <178966515302.3773542.3694353447037190118.pr-tracker-bot@kernel.org>
Date: Thu, 17 Sep 2026 17:12:33 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 17 Sep 2026 16:07:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4982d3552a3bf94de503acf93433277d08421de6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
