Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88701556BB9;
	Fri, 11 Sep 2026 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155459; cv=none; b=JD6r8oYsNoeeoZfAv+IZlBBYQNZMSDFtHGj66P+JOtZy/lcxtytpHGEady3Pq7e9Mh8wR0XjOZBs3JNp9OCj3FkGRSh1BtEPUOHnD7ygJuLPkQNmco4d/czzY1V9MruZ6eH6VcsGKyTaORL+xQ3sUT9gP6sq6u3w/6SkNuODX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155459; c=relaxed/simple;
	bh=imWpnFJNFK/2G2gX6u1+vM7LEURQDpjp0Pr2C5/tdJ8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oipsfiaxCtBcW+vcWv7NleHAhWSipgKstdvFZHYEmoYqtg0LXkrXD//OSE6TXjqsfZodmDg9nlcdBM6BojwRGiA8PxdrkNRjmeaAKjSyBxZ7vxXyFmOxprPdOCq570i8KftkbeCn4DGoHEEMKBTDA+3qG0fhIcy0zbTFIxGL/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6Zm0D9v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6Zm0D9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5933A1F00898;
	Fri, 11 Sep 2026 19:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789155414;
	bh=T0woReuJQaw1NHPEPP1e3vbeTWsN5/VI/yq7znuk6JI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=j6Zm0D9vSyCalRaG0Lc3gpt+S6TxSQ9soRZwNHDkUxterRJerEZUedQLe35UD/9wx
	 fdh/UxUcrzJvW0N696Yq1CffK4CYsIySET1Gj9uDalnukoBkXdVVV5WBUu7sYLhXDR
	 O8erL40XSZuTKk2fF4+CuX3bpc0+CyNkRNuVBb6Dv812qVSVZmuzQ+BehVOtcE6qvA
	 PPB5k9rdwKaGExRHlpydowQDZlq7fpCCxetXioAiKDw66EcB0LxlNa4Yb1VJ1CskI6
	 PNiAxiMWydms6vWl0H3X4XpxpPOC2o00lvQW8g3ntIJ5gxyOqVSTAlqFCzzJFOnj9q
	 M7lYcXK9yNMBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569113924451;
	Fri, 11 Sep 2026 19:35:52 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pkykhrc6.wl-tiwai@suse.de>
References: <87pkykhrc6.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pkykhrc6.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc3
X-PR-Tracked-Commit-Id: e10f2b7e28be3e1ce42a4be8fa9b0684d1d354ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 576da3462c991923ee4aed4bcc22d94531beb0dd
Message-Id: <178915535077.3075396.12650377793215592236.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 19:35:50 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 15:04:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/576da3462c991923ee4aed4bcc22d94531beb0dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
