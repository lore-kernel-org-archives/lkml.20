Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49E42B316
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391388; cv=none; b=Z40g0rfTZNKEFRkUJksrQMfWmniBAx/R1L7MD7TfOFSpz8aTb19fjHHwm4E+mMSSlk1HBtxKAQT8SpSgj5IRlmX9OaZArkajJ4GehBk3XgMRFZ47C/qWibAvozJwXT4Obp+k1ir0J5FBjB9bYZH2LQfcrUoM0fe91XOgOifiqVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391388; c=relaxed/simple;
	bh=a2u+xB+agGVURyWsxVgFkWe/SohTy3aXEgnKfUkoKmI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XLOqo+V6bViHOik350Tu1PtlMno1pP70JUMXtqBA1nvofoXme5z1LTkDtaX51c4tE75krarIzEI8CoKeZqUwaOXQDB0tM/GU51ZYrOLb7VQxSSZ632O1OJFpTd6X4ntIqHQBVQ2nWfrZ6M+MmUX5WHJdksps/tqPXHNH6+5S/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7BCaG+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7BCaG+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692AB1F000E9;
	Wed,  2 Sep 2026 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788391387;
	bh=3l6iqsdbRQm0T4hLun9DScmk7T5Ypy2PnelRZjXPrTw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=l7BCaG+mBJsK5Pub83fRW6E7gxisBHuzC4lnqB0a+BJ91T2rpzEJAlYuNizDMPuM5
	 zhWeKLvr+csgSdkMwWeBnxsKgkiuSeVxjCjGUy9V5J123iKRjBdzIyf2Z1TpTFc7jM
	 PAN/4OOUKvoRnwgmehBQJhGbtIezndLAtdee2C7stkWmMT4TWFYR0DU6cYGyI1t5e6
	 DQJXGIpIF6nO/AiM51Sy2nsEfgPAUybtqztLjr3X5d6OiPIYFPflvQZrRNouAybpnS
	 oHyTVhjNM9r+ZYAemX/fYsYeMbXgjzallh/Ej8+/7OD8M6LZvvoUK2Ao/JaU9g5nrb
	 64lk6IWnD6kbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B323927053;
	Wed,  2 Sep 2026 23:22:10 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202609020931.48FF902461@keescook>
References: <202609020931.48FF902461@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202609020931.48FF902461@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.3-rc2
X-PR-Tracked-Commit-Id: 2625480a1bf79c62ffb09aafdf61778e682da492
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 940de590b839f71d6dc846160534bf202401b8b7
Message-Id: <178839132879.2998104.1505560533907008715.pr-tracker-bot@kernel.org>
Date: Wed, 02 Sep 2026 23:22:08 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Sep 2026 09:31:50 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/940de590b839f71d6dc846160534bf202401b8b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
