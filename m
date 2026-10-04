Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5769637F338
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129879; cv=none; b=jwe/f9k8OJQM2KaOkY6bTwUaE0l13eI06agauo31Ehj5/oZJL/OK9lY+OYkBKQDQ+Kdyr+rgKCXuKyXEZLgw9akgvTg3kvIDcJpLiWZglOu6wn4QuB8emAmP1Rd+FZGyt9svwmSRGiY8kkuEvnT6BtwkNx9w7pTVFqqjlBMdwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129879; c=relaxed/simple;
	bh=68fKDtv58bLiT0ppWu1Hyt0/vh1bXORLKQP6Ejaz7vE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uynY0xRFU+vwNIfCFJmYZK45LVkbiS8Rdktxr6ApZVclj87bV9jt2mpUzbRwapzPuyzfBH+noevkW02oXMsPSTadekwDYocJ21Ijbcu0Okn5e1MbA1WV2QrnVg+yAObE7kOJOw1IhiSP69nx8ssr0xoAt1Ye7I62pWrFw4aLYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tpd4WVRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tpd4WVRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066B71F00893;
	Sun,  4 Oct 2026 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129878;
	bh=1dZMm0h/YlNjH4tdqEegWozZEgp0NJdqjq+wUWnc89E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Tpd4WVRfzrLyxGUbf+oyh06HuUD5DhVzx2nIYmiUGU5Y8xBfpDliITYrvnPafQ+nh
	 4NFebn5hkSN/KQuJYIU1daOPk1lgSVYNq/yAlsYoCWJDJcIasThqw3op48n5+OzsPx
	 emKPWrtc/3wWg1f47FV5A+qwj48cAbYoFaoKokcsBi/ZQiKV6GLWzP4V0qx7l68kln
	 7skq+lPZ0YH2FEVBi5CW9ZTMHBldpUTy2vx7RaFCQ/xjW71BdYL0tdKmtTJBl5N/ic
	 fkHhS+OIsbHhfHNya7/WN55YIEKGaaE9xP1V5vFcHkBlPMj+05fCk9OExWP7l1fzeq
	 dOStY3+0047UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F141A3924FCB;
	Sun,  4 Oct 2026 16:04:37 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <asIGXTyrnzreymrr@gmail.com>
References: <asIGXTyrnzreymrr@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asIGXTyrnzreymrr@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-04
X-PR-Tracked-Commit-Id: a661c34fe693c8f9ef29b45ee71cfa1fe593502b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06ac073129191a01d77933ed381f89c67674db6f
Message-Id: <179112987643.456308.3786932200475299979.pr-tracker-bot@kernel.org>
Date: Sun, 04 Oct 2026 16:04:36 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 Oct 2026 09:55:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06ac073129191a01d77933ed381f89c67674db6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
