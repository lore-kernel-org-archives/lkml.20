Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537819;
	b=mE83zWxTMHqDOkFRMdOLMXxWWSQ9tNLNzL5jUjiQbzXRM0GGNaAM6PxQ8NK2ioiE9T7g
	 zMiWuygQ6tpAO6jzRhznsnbQb3bmhHQ2+wv67/XlTwWjAKjGtGmaGqAt2bcTtCRS1sEJ7
	 TI5hn0mkDEqlUulIMl3il3+Y2oZcB40NTVUJglXdq6yerx5ehY1nu/4DU8hRPr2Zne7JY
	 D/Ck+MIAi+YFj90wVCSFqMwITyARwU+o+Hy05m9e2ZG1deVLVI1OC06Z/BX6VQuOzW0cG
	 JEjQrAl60kRBxrLxR3/9bMSddGX7Y80fdHkqvaMC6rjd15jZFq90UdtCL8V3scKxCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537819;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=3hbUD9MaBs/nCc1T6wjHCj+mldmNQQMYXm2Mj5H9vqM=;
	b=HwetLMCyu4AGOUAo0EzFpwD8yR4qsf5eeX+J8ZsR8TKk5RJSffS6matsxR2+ifyDWYZ4
	 z1Zj/YN0V4l3fb8XI6hle70rLkN3vslUsyywDOpqWpDJQtKFABC4A5HH1mxu8wyvE9yQZ
	 2nVee2Zc44fCjRXyrfesIrV2WXLyo7eQb/8QnoH9PQ98f9dRaAO1oVT21uYrLBGuZDZr3
	 JQQmDBvp7C5Vjul4g86S0unDw6yI0wfvEo54eqC4Oza+v4zSetbXCqe9n/SEVgEtrZKqt
	 /VkX2mmC0zU+QO1A/I32ONyOdMp6uQY4DmnSeivLfvpXSh4h47Dm7v7HgAorCxTfakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HS/NuK5H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7785606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS/NuK5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA0A1F000CE;
	Tue, 20 Oct 2026 23:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792537818;
	bh=3hbUD9MaBs/nCc1T6wjHCj+mldmNQQMYXm2Mj5H9vqM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HS/NuK5HgiF42vYTeekSKVysMmWY12WXP/+FOkdaWCFdgcl/krYZGsmtdG4wCY9wC
	 8TeHizm+ePabX9fH/pBCICbPQWnJ2mntE2aqqTssNf4WX2q1Txuo1hgrAOHZHfmRjR
	 PdxbpR3Hnh/uXu4CH9uD7Ge6wGnFwG1mabXg8EfuEnuv43FqmLgH9n8bH8dw0APDOj
	 FphXu+PYQmbS49hVv0b7WRMYApxqUPi8zuVwJXzJM8xin7KTaP6kleyTwimHT40/lm
	 38osL0/OUx4FAfH3CaXjVjLbqIM++62Gc4mN8ogE1DSjZ2DrTErw2DRRPm/ijSxuG7
	 u+tCl648BMOMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B48853809A0D;
	Tue, 20 Oct 2026 23:10:18 +0000 (UTC)
Subject: Re: [GIT PULL] locking updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSVJgnfPWO35u2U@gmail.com>
References: <atSVJgnfPWO35u2U@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSVJgnfPWO35u2U@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2026-10-18
X-PR-Tracked-Commit-Id: 67e0eadd862616cb22145d6117b79b79c4ae48fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 776bb6df3f16ab68c40a97dbb8af26af4185d7c0
Message-Id: <179253781754.260052.6620523998332355369.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 23:10:17 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 18 Oct 2026 11:45:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/776bb6df3f16ab68c40a97dbb8af26af4185d7c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
