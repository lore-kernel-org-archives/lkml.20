Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52403BB127
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110695; cv=none; b=uSqLYX6JtM9do6+t3g9Gc86VHcvFYcpl6L9kboTwhgySx7KFjILeI/XEruMowXKCcbEAg/vip1WIBKqwqPD3TD5fqn2p3hBI2L44C7fTW2xoPpJqVLfwyXvblhTJyogTELhynbIfp7ji+hzorauef/LP7A6ODJBkKQxvFpnS0ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110695; c=relaxed/simple;
	bh=3e3SIJ9h6o3OIxW4CPqANJwQjWHmUs1jaVCUMizTkgM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FsHljg2n65TD+GBqGbqIW9BAaenNQXfq1RhVl7TEGnhSECJarCBl/KawLGz/S0JswJEW7UlL4Uyr10G0tj+H0RpkJrDJOpmBCmBEuSQ9TlVqjUsQN3g9iq/cLJEPejsECBpCQNHSTSI7o5c4Cqd9dURRNCikEsD1pQvx180iiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRAOqe3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRAOqe3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD551F000E9;
	Sun, 30 Aug 2026 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788110694;
	bh=nmUkri1cp9Ovvja9379UAEqV+ERWZrQBkQWJKTi/lCM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nRAOqe3gdOxgDboKLGanhAzbju9yuPWo8tbW8h9vhrYFPfdntzrDqYLVWvRHSkXrB
	 +yCudKplRpKD3e2I9yuW7PQwiSqaMez1cLRKRt9+Ud9WDSnOdnX/liwz22rdhrV96y
	 GxmdE1zNgnR3Fp2dFAewjxavAGZjI6IkUc6LhqI7C3MekPRKJvQ8xMGbt+57axBBNk
	 MnS5CNYvPgOkJrRKFrRQ0PyTz0zcbKYZ6wgtlul18ZFFjxyazm0TAvM7NrUXbtTVAB
	 seGG2oDp5FFo4fAoVrLeNo8PVQGtVBVmRy+RUx87goU3jSAfLJ/QV9iu/7AunYeMJK
	 3FEnUzjF1PcQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F3380CEE3;
	Sun, 30 Aug 2026 17:23:59 +0000 (UTC)
Subject: Re: [GIT PULL] locking fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <apOYwlQs4nKjVqJo@gmail.com>
References: <apOYwlQs4nKjVqJo@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <apOYwlQs4nKjVqJo@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-08-30
X-PR-Tracked-Commit-Id: 46094a7708b7945cb7eba9eb887e3ea9757440a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 637836563deb95f4338decf2d2d832c4deef022a
Message-Id: <178811063820.3405738.8336825728568755648.pr-tracker-bot@kernel.org>
Date: Sun, 30 Aug 2026 17:23:58 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Aug 2026 04:43:14 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-08-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/637836563deb95f4338decf2d2d832c4deef022a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
