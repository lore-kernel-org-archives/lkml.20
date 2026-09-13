Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3A388392
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321136; cv=none; b=PLsGH8V5ft2dkgj88eaoy0d/n85Ycv9ZXConC+xy6oU7fWEYuCf/wxcHWU3tiWnb9SUvNQXgfDRdhBXfD5g0vMM7BMBM7xa26urNqJDk3nNebgxq1MxlpcEuAqQn6AYaAfTTL7KvsM02ERgoC44VlEnyAVl6d2fr3wwGqnsmkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321136; c=relaxed/simple;
	bh=XkWEQm8t4JL1Zh4hrNr9+XA2xxaSbeQnXDzYuAPAex0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QHGn1cQX9/WYkzRQkC/rvvODcVVy2gjJH4H0GDBzOoSkZCZKYHsTH8IlCjDtlZq98at82lHUrOt1RRlxFKnQQTvd939MGbMaxwCNofRuzNikgiAGlVHur/flUTXyEUSYi3X9jPSxP33Rqrz5jHKVzdn69be/6dVwaudMaLG963I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJi030Tx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJi030Tx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0761F000FF;
	Sun, 13 Sep 2026 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321134;
	bh=ODb/5k5n7oa45NWGeh+XWViUiVKaBeheYTspoZQAGfE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UJi030TxlBMzSdiFA03YhL3t+L2x1TUcIvPUDwQcVPGbJ4BmS/HHLf5AGZrJ5Ygcq
	 RBe60EavSnXc2GWuNaar+NOz/SDmgxS9knB6PW/uyMeOVVeSE7MLykdUK/RHC7Joch
	 FcEU01MkzH3lqLcde6+63pWpkSCFQfPCjGrL1LIThz3VQHjfoyZ+cbJ6y/k3ZY7MtU
	 RyorMQYIiSdBMJZ2KT3xRftoeaxfF8aHQEp/tnbaUR/IIJwrMkLEsiqIUaSTPe2cXY
	 bbJ226iiFknzCtni4Mgu42iPc2m1KnLowsNfCtuUDqcRATu+dTnNB/oPFAWZhSuqJB
	 aEcNd/WUdGZkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 567D2380A957;
	Sun, 13 Sep 2026 17:37:51 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZd_ZBZXumbuqAK@gmail.com>
References: <aqZd_ZBZXumbuqAK@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZd_ZBZXumbuqAK@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-13
X-PR-Tracked-Commit-Id: c5dcb3aadc18d7b82ba64790721b005d18193d35
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c874ace034a9cb647fe5e2a28fdb262b49c846e4
Message-Id: <178932106993.3902938.17126830912094138484.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:49 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 10:25:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c874ace034a9cb647fe5e2a28fdb262b49c846e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
