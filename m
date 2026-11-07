Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080059;
	b=yN0/IOQKIGxMG125REKmu+lCJElRX9kk8/VEwytr53W7pOA9u5gCCN54u6Jb7Vl6lqP5
	 IcYNKu2IxvBxunp+Rx8CfS7q74ek1pcNOpEOznZvO6oqSxlyvdsBpTsS9k3lvOYW1HG6i
	 hCDCYKHUUvh8Udm05XRRflgsZgvvqYzMfoW7Ai2Q3zM0SwYndOkjHw1O20scKFzFSl1Hs
	 ElrBMRznoe4OlRcXxybXtElyshlR1ty5+kU/04Ky9NqEM9iSbQEqBf8gUxNfvk/rD5tyL
	 QvzAHXgyO2+FHB/VmFZfS5TNa3dr3SpOSad5QMBTXqEGgjC7EvD4XXQrXRXFId1AyDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080059;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=aaRufT/glcbzYQ5iaYMOzr8eW1mrAYYmjrdy6CYbTHA=;
	b=aoehTJRRggFVBrGNtMNwkvH0lo2v51V5L6PTfSd5XU0+kZHDjtZC0sgyN8wmS4r/LfFd
	 2DuXUkMt8hw4Y3tw5E1H3A57L/s8WwYcbLe3P2BxybGzaFh6+BywqECAwiEFJW0nUq3cz
	 UrIWvRLEyZOvE367waYErr2rEf+FgJ8ciEK3uKJUne6hW/kCfVtCozC6vxme0LB9SIev8
	 3pdcVKxz6kEMGlCaObKVyAI15mm1Ayg/SqjxhTqNIbfyablD1lGy/t9Yo8y7nHnI8Mjx9
	 7v1fj/UGe3AWNOEgPgqv1KOXi6MPlYWK8dSxVH/bZhjAZb3zEWCwqeO4xKCLb0l7O1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l61BeN6V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA875606A330;
	Sat,  7 Nov 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l61BeN6V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A5E1F0089F;
	Sat,  7 Nov 2026 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080058;
	bh=aaRufT/glcbzYQ5iaYMOzr8eW1mrAYYmjrdy6CYbTHA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=l61BeN6VNO6PxnpQ8ZAhTZNXnMtNO9+NJ7YaoTCqV76LmaUNIw4L0b+/d0PNSbBMy
	 lJdnOFUWDIoPFMgPkIL5Rx/tsa+w+VqZEqcgz5rwLy+h0/cu8DUen5KPKtTwVw7g3v
	 Fgx+jf12Y0wXpmRSQbDsvNHVR62AQun74rfLTqWVDHcR/cX+R8KaN5BhonzcRQGVnM
	 uTDcQ/1YSt/M081EICQamPrQXKQC8ma9v0O5b6ta63sAXLjlyQyIsMIVvzXA32K7AV
	 a5f7xQmprI+1S5Sja/wRT/AzlTa23yZqm22yn3s6HKfG6gJ5vY4ND3ee438e4g9gUh
	 nMjC6MgxcZWjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B3B8380821F;
	Sat,  7 Nov 2026 19:34:18 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0b6pc4e.wl-tiwai@suse.de>
References: <87y0b6pc4e.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0b6pc4e.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc2
X-PR-Tracked-Commit-Id: 22733b6e2e1ebf75228a1e15b9fb9760a86137cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd7e9dc9997a3e792e93f8b6795cba1de0f52726
Message-Id: <179408005720.1301131.83873369247686413.pr-tracker-bot@kernel.org>
Date: Sat, 07 Nov 2026 19:34:17 +0000
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

The pull request you sent on Fri, 06 Nov 2026 10:01:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd7e9dc9997a3e792e93f8b6795cba1de0f52726

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
