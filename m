Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693860;
	b=fLFawH3awS6s4R2e635xK09Eg/MvVc/Fye0xewQ4V2r78mD0lymtSMAwGuikGIfG6wvt
	 Fz9ZUTk5nzhF1NVGc/ikTegZSL0+qVbnY8WagjS4Njy8Lk+oSHvuktu0c3KVk3zoNZoj+
	 e6veJNhaXy7Fzww/g7k8V92D9yG7SubczcqGf3L6zXnIxnjg4X4UtzRDYzcGjQCjEyMr4
	 aqfZM60OdluVoGNRdHts4EHFjYXN2nVIK2GSdo32x1mF2FzuBZvxosLtWufJRQVHGUBjP
	 3rRMyPu7tQxip51ibPv6heLjPPdUIbHZNOyZob/aMNF6ipXC1WnLxydXIEOqcWWmYUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693860;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=rp9LYTtMZB4juqGaag+zhPciOxxBTLZDtNH3dChyOg8=;
	b=r9jzaJCQuoEIdPqarl6+H5gqL94CZ82/dDQ3k/fTZOpw81WcjulJaeJudoq/ihfy+atK
	 hOY41JNpLy4iX60aw10iVw+2jH8GEWT0TYOQGnq/YltUAFJrfBe0yPrx0A1eYy98bGs2V
	 +73ohfurIxrRr4PM/ayWBL5aQ7nL4Hs59+n/hKPCpn3LT+4F/aszeUAvZoi9Xh6lXJMC5
	 jGBjBw3MjPj0YI4bowl3nLbeAB48jxyff6HZKjinNJLcMor3mi56NuU6PdoCohHp1EjtW
	 UDRcsGli07Rkg4LiR9UUxUzaegFbMCZ9xySwWyhDnQfodgVgMel68cV9r2IUYcjLESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKKJcfXC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF53606A31A;
	Thu, 22 Oct 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKKJcfXC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486071F031E0;
	Thu, 22 Oct 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693860;
	bh=rp9LYTtMZB4juqGaag+zhPciOxxBTLZDtNH3dChyOg8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QKKJcfXCFWM9giBQ1pqPvL5f8vi/cRzK+5lnOfw0FtlST0SCWZZUJbOGHmUak/Eze
	 +pAZMr7gpRnt66304ClAj+xk5SM8Bqe534MFjFVY1RKfbkbL3FrhQUpsn2psg/wYZ/
	 EkFIfLnNSx76toXXwQbW0uQPl7XQRB4cQBt3SgOnaBAf75lLyKs/NMEZPMgMEvucvr
	 gG+Xg20Sc7GVzBWOsrLU6IYreyXbPFLdiF2UComdRAAl6BmqZKnR/mWDAqzvhr4gV4
	 Fs/teS206ixQjK630+rOHNmbYBKtR3c6hI9WOASyXmP3ZibsqpzOkNjsaZxWwWOdto
	 5j9UxNY100d1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECCBA380822E;
	Thu, 22 Oct 2026 18:30:59 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.4 
From: pr-tracker-bot@kernel.org
In-Reply-To: <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.4
X-PR-Tracked-Commit-Id: 15644868ad522eac914d368fd08c340051f1076c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b9a0e857b427cdda5a08b662dbea7321e6bb470
Message-Id: <179269385870.87271.867381443730942294.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:30:58 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:50:39 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b9a0e857b427cdda5a08b662dbea7321e6bb470

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
