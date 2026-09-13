Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FE36D9EB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321129; cv=none; b=LKOOub+GYKCAK8QmnaP0AdZ9UROr30ag8mp9EA3AsIPhEVqB3skRI+F7NpTjAqTyOzLvc+1U7hpQsyZV773zMKzOwWJC3bysg6acEloHP9myoYgXeNlTU/s5YSQyxdnO9YMnN3Hb3aTqVi/nvSkA5mF2zf8tBk2tkd/UntNfyhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321129; c=relaxed/simple;
	bh=6n6AjGaIxJHGTTMVjnGQKKmBDmZOmsC4YIem3KS38x0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=E23ZqZ91sqpiUigAT5Fewp2pFLirHjX2iSYdAbYroKFR1bQ2LS69UxvemRXCrznivcF/o819oLL/I+FF7HfawmwrpGiL2flgYyv1OCfOLOm5gtmDlgdY71GoK0PPsKxFXCQm0VjChEpdQcTKn7UqT1RO7hOmyfnN9M2+5i5Cm/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8JxWxQA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8JxWxQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD6A1F000FF;
	Sun, 13 Sep 2026 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321128;
	bh=tDersQG5fOJFiDH/lwIaWeBeLKAOIxz07zp98WzgbRA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Q8JxWxQAyBY/aoMj/eTST3fXVANOD3fzRij6FVcHAPK00R0HIjrbyU5ntKwAPVAZi
	 rredETSefdbNx+Vk2bMlhBeJG5gWqO90IXj3l2EFWgPzA64z08iWM/uhn/ZbDk9/lN
	 /7p8xlF2mSzWLFTqV1CretQC9xY7nzPzvI3MQ38znP2VD66PzSDlewA1P+byC5Ogbl
	 P/h4p0mr+5elw5cekIwlKsKVMBBC6IW9oGYFEnNVCoRVvIk8mhF5WjXnLcwoZFf/qs
	 jvLyDevMsR815pEamvvaDLBhX9cEQ//zVnjF2R7b0Sxm/0Ow6ZmTQSOC/JPmS8QdJH
	 w9Mx/eSIyfNaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568A6380A957;
	Sun, 13 Sep 2026 17:37:45 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZXdwK5-GUh6Ryc@gmail.com>
References: <aqZXdwK5-GUh6Ryc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZXdwK5-GUh6Ryc@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-13
X-PR-Tracked-Commit-Id: 1017911fcc03584b6854b1b8f0aafeb25f5a8d25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f10ae89f3d7994e680a1190c27f383f76f5ea73e
Message-Id: <178932106394.3902938.13543117147246014017.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:43 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 09:57:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f10ae89f3d7994e680a1190c27f383f76f5ea73e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
