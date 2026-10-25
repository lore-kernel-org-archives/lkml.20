Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893032;
	b=TvoPmj2qgdTjmIiRhSQ1Y0vRT+AlNs5nWrvMKolX3j7Eo1Gk5DSCv1xISex2McHFrnsG
	 LgUyy3X3mIi0oLvQa2uBNS4we/bJjgQ3KJsaCcpfHdPyUGXqGlRNRwpZ4iFZZEb2A5OIz
	 7f5n57nN0Oie+qGoogAHpV7w0wGJ6dZ7BoLeTsauBEhqX3t+rYIqb6wNPR7xmpmSrvFb7
	 TH3bXSPiMOkxoJtXK21f9FcPxBqi55ZtdTmS41tbLZdI4HDdueAJ7DoY2U4JmdEESG96I
	 Zmg5e4P0qKQbwJTpAFyVKYQieuoT0WYw/g/ghHITBw445Bc3az+fKWnlQ5uHb//ztlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893032;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=jECOt1jJcfT+VYkQ7BHSLkdcrjV8pXKOb62m1XX9lA8=;
	b=CrIaFWtxzxyfJs5bnymLehDMPweLD7jiW3R6M9CYXOxfXe3K+7ZY2S+rZ311IuZF5/kP
	 FcI/D6PN78ZwyT5sqbEvogAS6h5EgAo+kmrs72HiuHrCL2CG40JiACG1+tjiwJ4+Jn0ha
	 ANdIeFApz04dSBYSCB/bnjKzR1I2DSHwJxO0P44pJ81AbQmPMuP4oZtGUcUESnB627jaZ
	 9SA48cSWiccy67zxvVjAt69Sj1SbzoOis/G1G3YH19Yq5HYed/cezfEeD4ZbOTLmkGmb4
	 qIalUucIOfIHjaGn6NLkmCGYwa94++1pQbj//eyQrEhLl9kT0hmk/gVlomwqHKTk3mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGs05T96;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E5606A320;
	Sun, 25 Oct 2026 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGs05T96
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535D81F01829;
	Sun, 25 Oct 2026 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792893032;
	bh=jECOt1jJcfT+VYkQ7BHSLkdcrjV8pXKOb62m1XX9lA8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MGs05T965pyXZbzwGsHw2xwY5a6tGURSDr1PuL7K09rXYfsS/Y6ueFyJqS2n3gboR
	 FHmsq2TzCUYSMRphECyCF/bMRK2ZJpsN4E4q++g+U9V3ggUhNpdBOElvPRQGlWAle5
	 uI9V22I9ZUNse8LdKfGlkWVMuvkwKdbmRouZWnzifL0UbrvQPtblOmK14AifS4ULge
	 UfUCGqimJYL6Zs0NzJxb2JpUp6cl5rKitRqDb3wzD0qpMnm++5rQcDaQl3rNJ0hlAz
	 knDYQ7aqrc9zGY+nvF4jeafaMQvMGiMJ8+VwnedL+56RKDf9EThNQP6dZFszqUaEcu
	 PHEEZMzP/tCJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 44566391B1B6;
	Sun, 25 Oct 2026 01:50:32 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <atoUedBI3u813dYW@kroah.com>
References: <atoUedBI3u813dYW@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <atoUedBI3u813dYW@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc1
X-PR-Tracked-Commit-Id: 4a177d5e688e8e82113f7a32d6f75f0bab9658c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e1cff82880d13f62c64f20c36172a76aba7d989c
Message-Id: <179289303087.1865536.5552091323355499457.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 01:50:30 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 15:49:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e1cff82880d13f62c64f20c36172a76aba7d989c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
