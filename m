Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532336;
	b=5OIltbZztqJO0Kf1txSJMx6AAQyV8k7olN+oWdSpsYEBpR08b6+YHbMOq6k6uFgTU1SY
	 Cxx21YElq5hbXyN6VuHWyb+wNQiO4E0vpU6gDznLYP6p/Yub8bYqipnCaGht6yPIoIvKx
	 ZMvsNJMtqeS44lYl5iFYfYzU+JbVw1tc3VXmagFusDXjaDgJyJYc3KKjtRmxN5ihfldQ6
	 79FY0Pii8YR/FMKj4biCW+QvxBhXYceJJxUvVAqspx4QuvqV2StPbShoHgvZwGiCB/YKK
	 Ra499HZIY9lCGSEWhs8f14JjoM6SWXWcoQs/+Hs4gFXV3xndmyxaVftGCAPv0Qq5Y5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532336;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=q0UHTZEVw7KCEd3jzwnJAUl+LJbRFmKGw8FXW+V3CwQ=;
	b=aca1tdLWrkUNYrI/p0AWtJ/FkYaAqAEhc3Dvp168tpPZTSn/Q39nsd8IJnTdvMKs0vDs
	 Vu7sSKWWUN+zR9cxRUx7DOrT+xbutW7CQCHmn/hVOscxkiCtZePoYtgdGwqnHEhR1o/MC
	 q7PkJfohSl6W1bjT0VVdq9oY2qncu6NIjUxswBrHVxxZAp5t1BoECkvRyTuXWt94lNBlm
	 K7aX2nG0ZDvkJnpvEMDRVb6LgzgookNILFMmVfi47dMy95kpn546z0Dn8xPRWV1bOPmtO
	 qeH3e9F+AE3m3wIJJRfMd/POVjidQaRLjdN+TrbCz5p6/59N48dqUogM2IwJ9PlM5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpvpnixN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB1606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpvpnixN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E581F000D0;
	Tue, 20 Oct 2026 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532335;
	bh=q0UHTZEVw7KCEd3jzwnJAUl+LJbRFmKGw8FXW+V3CwQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EpvpnixNXicu8gjRvWaoYSiPgjZCo14Px4piGW40yw0HlH6mRL7xzUXEik9qDpMDt
	 GWTRg1IofibVroVzSAUvUjJvQi9hBtfJxlst3jZQECX8cGYcykCmfVsRj6aYoMkbCJ
	 A2ML5IRy3xHx76QRNpS5IybX6uEHMmIpopBG7+Tw21Dbo1fEmjk3Ot1cdDpVG7W3Kb
	 zqWkvbkdiStYJfat28HqhaoQurQmM9QlIs2cdhvrhZr246wnTxAM7x9gvOYcNCTE63
	 PEwasc05lRw3v0/TGIrh5LLRC3VX9MVJntwUd0buewrSZxRqws7G4i8ct59kotOtZU
	 1ZKZtgJSGAa9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7761A3809A09;
	Tue, 20 Oct 2026 21:38:55 +0000 (UTC)
Subject: Re: [GIT PULL] x86/sev for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020061234.GAatcGUtJQYVgIvn7k@fat_crate.local>
References: <20261020061234.GAatcGUtJQYVgIvn7k@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020061234.GAatcGUtJQYVgIvn7k@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sev_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 250ee734115bca1c1f7a38d838909aa83cce87ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e135910deec43ffe97eca0b6af1f8f847285b59
Message-Id: <179253233401.225072.11078707929087610611.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:54 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 23:12:34 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sev_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e135910deec43ffe97eca0b6af1f8f847285b59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
