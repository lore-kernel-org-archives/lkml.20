Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554039D6C8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215292; cv=none; b=r+Zio6rPTFhHT828Dq/U59GscGnti685t6Jmr6kNGT5Us+dqxyF+aVOGJLBI1yrTweSxef5R22zhSZ6eFoCgfGFAJStpT9YlHTQ+QO6lEosrsS165SCVoeS3YapKXyKu1uYjv8jr0zCrDH9zsSK6wLj30XbFCKtCUTIfoA9YSRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215292; c=relaxed/simple;
	bh=+3IeNj6ut1jVXm/R2ZIRC+diTq+uKA28N0kV9tQcxsc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hV2XUdBop4gyXujLsf2gftvI6aQPFXicUkXbMuYqjse5MbXHu5v8kAWcWeFTVXzbzuI3oYvwYZ7ltlIRbs2JfEr7ni/+yHTgGBDeItvbXyQWvcwVUWNGQGSiidY0MpTxJVLEA1qLeBIKVYN5vBFAyyj7GHoHHDelVsFwhz5ZVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZMEKyLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZMEKyLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631371F000E9;
	Mon, 31 Aug 2026 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788215291;
	bh=aYF+jOIRc3G98/MOeRDgFMfrfOCiMFw7MuJwnYcKqhs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FZMEKyLlzQh0v75w0r89p8m3uGCpdwMJljiqjvLFXHVfgPIlfMJtgoRJVgyMq01Vl
	 R/NNbUo9KQyehS82qUr9s2y6FdJXom9IKK5k6j1UJED/DvhAkG+eHehmvovvE4YtLm
	 d+UzM66YezX+YrrZZTM/sWcRBPvYtSZg0CIIG6Johep9J+mNK49iwHTy46c9QgHdWM
	 Ndzn7CsPxJ9CVk8hHbYMVxusICllvOrb+sO4Ae+jVxCjNWDGBTLo1URBdqOxJZmUUE
	 bx4T4LMDqbBT3R+8j3jrW6J1iI8wssvSTsMMuO7F/eQ3WLHIk7t54C9jmDh+fQrrRS
	 HTcC9ySB+mxXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93993392446F;
	Mon, 31 Aug 2026 22:27:15 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <7b9e0a733622fb1973f75eed11704042@kernel.org>
References: <7b9e0a733622fb1973f75eed11704042@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7b9e0a733622fb1973f75eed11704042@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc1-fixes
X-PR-Tracked-Commit-Id: 93e257938aa67a6c957217db94091d9d9e5d403f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: abdf623ddb75b24659018d3952d8f61937306ae5
Message-Id: <178821523422.808525.13192433546394119669.pr-tracker-bot@kernel.org>
Date: Mon, 31 Aug 2026 22:27:14 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Aug 2026 11:09:02 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/abdf623ddb75b24659018d3952d8f61937306ae5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
