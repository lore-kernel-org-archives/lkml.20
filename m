Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE53D25C2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924976; cv=none; b=bLvDXMkGs7HC89ZDnipRbVVYVm7uj1ccByEcjXRDCuHDF4G9WEyUyovi23ET2bpPJS8enl/KZYzK1pDe1eRapoZ7WHqwMu/5HnM/10oeryqreUNJpPzWmbbPzZxsVD8vBZyyqLuWMUoOdtdGEelN/KXMcveTN1CNQtgrF0BYEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924976; c=relaxed/simple;
	bh=Cq52jPZt9N4zLpomrPVLQJDEpjz2iJcOAQqDyqu5Esw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QiqFqahZHKCT5PgKjWy+kSvXTfrVJI6/v0p09aptTpBfHDKC737H928Sp+eg8MTje5NFw9rr+Dpi5UIPp4NHw+ns9580q/0n9YvDlU+HKIS6xIjCzMzu1wo+BKD42RmOEkArMSugmx+u25BBWnwmX/rtn8coGJMCe4XTAzwUGxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuguQgRO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuguQgRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73FC1F000FF;
	Sun, 20 Sep 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924974;
	bh=oJ8WNy3uQ8Rreta5ADrVU6QmhNhE6OHDPA72XSKSAXk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZuguQgROpE/InzZtjmn3hrXEM+bVDxoY40JFNJfwGPCJMpR4irHTEj0xi4+90Dl7x
	 cGhdU72FlZMTyMo9yARkYmpYK7RhzJKctunDH1XM4l4aOHer2xlY7l/1aD+vN7xHDs
	 O6jl3cfd0z+ideVwLzgjQl3y9fCzpBvNZ2NM7wH3gMyiLdkr3LQl3ALU8zw9ORKKJy
	 cpSZ6y7br9ach1Z6PYpc4aYzessoVg1HoZFbgt47BpmvseudxxGZQ9Y6dhZv5zdVzg
	 y0i6GUUjLD552nna9cedHVX/RhHO6W+ipk/bBZv+GjAjbrTt/lEqdsYlnL7aM6QHB/
	 DZkVYbx4vMCDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1975139253D8;
	Sun, 20 Sep 2026 17:21:48 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-tCM9m07b_1kvR@gmail.com>
References: <aq-tCM9m07b_1kvR@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-tCM9m07b_1kvR@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-20
X-PR-Tracked-Commit-Id: c21eaa72f02fc6e85621cbe09d303d8fb8bd39cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a15ba6b0c3adec5842d4252c3e5d2ca935e9948
Message-Id: <178992490673.1735599.10838821053500789578.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:46 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:53:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a15ba6b0c3adec5842d4252c3e5d2ca935e9948

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
