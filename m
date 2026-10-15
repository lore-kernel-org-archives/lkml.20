Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC63BFAFB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077465; cv=none; b=FJelnzMN+gt/a8dHdswuEq/3rvrZbyyYmh1UC+zQd0qmRgJJhK7UMjh+jbwSYFadaKVlSUuU0gPw1oe972ayyZ7y3ucymr6GoBlOuiJSIFX4KtLmA9NpYbvzyenw/Q7PnPorSxAfaOQRQElf8GAK48up+zowTKO25nlknsExFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077465; c=relaxed/simple;
	bh=8OGt4t1bsib8qTcRv+GoyqwmhH/MyZLmbKu5SPRFv74=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LhH5Hj4SQr+UBiZkngjDhBto8dRrGpAOQYoNlFBU1N8/iN/lbTu/KkWCvlrtUA7ALP3xZ4LS6d8ZvbOv14xVT1C3DTBsIUxKDT5baFh0+13XOAHIDv55KCmZXqGAjwl0VcL+DFfpycVYEy7w5fBJaec9ka61b0xAWRpj+RMB/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFtEeQz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFtEeQz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434941F000C4;
	Thu, 15 Oct 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792077464;
	bh=/0C9JFfQ+/2qBcGpRMh266sJ9CA0BFzLqeLU+0ilAnI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HFtEeQz9AfH+BFN68j+ZSYI3FM/ktKbf7Phm3IacWjLhTKftJAKpNvdowpDfTEHlO
	 EpGRGypwM882ygWcLNG5cBzOQPrS7v3c/tkFCXE5luS7KfDdgiVXveT8+kGav99Nk3
	 BaVpWNQMuzW6NLYGWPWb1/v+cGX8ZaL4yPPdLu6/X83+r/lR2Xfq4z25Wh0bg2dTHQ
	 vK4uhrO72WbVjU9BO4HGV9R5st6n8PqJRxFfZpHrjYZsXCXjb8G0Si4dNOYk4kQLlH
	 3nUl5uZtFLru8u++JmD3xtKC28ubCD7vowoyFq/FI1LYqmb4SmqkxgRezU8/ZcDhu2
	 gKUoN8eIp6U7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A237392EB21;
	Thu, 15 Oct 2026 15:17:44 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <b947d220cd9f47e9778e0c10e4a27164@kernel.org>
References: <b947d220cd9f47e9778e0c10e4a27164@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b947d220cd9f47e9778e0c10e4a27164@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc7-fixes
X-PR-Tracked-Commit-Id: d1a4549a3645e55cc9ade09e360280590b3c9559
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9fee1f650a0a9ea6fa7c0b26244a778dd92542d5
Message-Id: <179207746280.3496071.15234872439568909399.pr-tracker-bot@kernel.org>
Date: Thu, 15 Oct 2026 15:17:42 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 Oct 2026 12:33:14 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc7-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9fee1f650a0a9ea6fa7c0b26244a778dd92542d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
