Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694346;
	b=MMpVhyuAzbOJ1cATqWQtm4Cochx5r02P2J5nOXhYNcvoa3aZm1VUeygf2II1ZTwrqthO
	 a+UiCYJdlfROkTQzO9RMSy+I2Z+n1PDfaifF7nGxYEOfLA/VkSwL00Ftl4Ky2a4yyrHsY
	 lR7XuM9kftyR/j3QrVrks9zQk5Qf8JcC6klFCZ7nMvZPEtucFK2zCREF4A7RNugf6xquC
	 EdSxSXAArKWFzmWa6Jxsam50LF2Z8RM50LfAaS7QI6MoUCBT0/tS5m/K9vEIGQ5srgUG/
	 IUJs4CwwCwBZ7tRN2iGgXYsd77C0yBYHR07clw5NoAemRdyZnnN9wMQuVo7imzLs/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694346;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FYyernJixnw4Xft2ghd+AtUD+saPakcIKMtzoj4l1ws=;
	b=ytYeFasW1W2bvAIqb4eDIqSP3koanU+ldsyEooIiET5gSELj6FoNSecxL/+y2f1XUAM0
	 Z9HVPPyXhIbq9Hck7VcJahW/slH9XOC1RXEXAS3DiNr8U+/acFeD0O7wE76Qcaa0oaPdp
	 oCNDg8VARHOLVbQCCA8dxiA42XVi/R/0W4KrvsOwii9smOX1en4OWnes7d8/YQ6Nlck+z
	 AZBB8/khzQ9LFBWfuuNaV3KYxWUS5av1oiU0jYtPQHCeZHQwDwbrjUY8IRy/2rcpdiAT9
	 HkAq6v1aKlWQDagmz3tNcY4kI15uc3DC+W1U9BPHXDDqrIKWvsTgLRtBbZrFIEl7s9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHdotUu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278A60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHdotUu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCBF1F01825;
	Thu, 22 Oct 2026 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694346;
	bh=FYyernJixnw4Xft2ghd+AtUD+saPakcIKMtzoj4l1ws=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lRHdotUu30xT/IRnL7+jqAMcDhznTBaz8LbFsumdZVDdSKSEcNLOnCJs/xg0rQFqT
	 ccpNU4PShlr1n/1x1P3BbP6ajIkXyKGTCOrbK9rMRroB6Wx0hFvTZqL9i286XknubM
	 Mg4jhz8yi1WXpvToT7vHHIqfMuK7LoFCPtpDCWypyLYRmzA9WD4K/MXHJcY5jBIA/g
	 Dq+lBqC+UY0/ZOgNLUBfmK2mWOo0Pa1BPLKBrC8lEEXzKEFDr8L6AA8nO8Apjm+zCm
	 w5dlTiCRJe5hjmwvBYe7UK1i/JGzCRvpITWp1NyVcL8qpmEYz6sLr5CeZyYXahek3I
	 J3WbTDwPOpzEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0747D3808222;
	Thu, 22 Oct 2026 18:39:06 +0000 (UTC)
Subject: Re: [GIT PULL] auxdisplay for 7.4-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <atjQe4XqMT-gGiOJ@black.igk.intel.com>
References: <atjQe4XqMT-gGiOJ@black.igk.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atjQe4XqMT-gGiOJ@black.igk.intel.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git tags/auxdisplay-v7.4-1
X-PR-Tracked-Commit-Id: f63dc0eea92d07c5bb799a406571b555cd2bbd97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e3f52ef2fe67ae9689496760ab6bd3d5d68ea6f
Message-Id: <179269434462.110555.6286919535842682682.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:39:04 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 16:47:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git tags/auxdisplay-v7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e3f52ef2fe67ae9689496760ab6bd3d5d68ea6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
