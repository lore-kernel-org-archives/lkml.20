Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A3457E6B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927138; cv=none; b=CJkZXIE98TwQ+sjyARrnO8f515xtj21iWQ4S1WEdDk0INCcPmE20J/xNdh9DWo1e9gC0oKYHrCZx7dIrO6A4UCf9NFWZr1v2/0SMD+Etex8xLtN3tt/Y0qs9lyo2YQ0gSg9o1/nBsH2nphBGVvRQlPlsVtsJ7Dp1E4pMg0U98jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927138; c=relaxed/simple;
	bh=sUt5JJtUmCh50XT3QyZilTYz2BY4WMQlibLrupwo2g4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=c6i+6yvzu+xtxJFLQYjp53jJGmlktEuddE5k1p9e5AYxJ2XJWcKBaTxy2VEPe58AWtQNWvJt9EcCtBNnuNIzuCgLz9dxfS46f+dO65AI79gihR2Y0eo4yLmqi6jP1bcwEJT73+Ecrfub7k8QLGVWKn14uL/vx8zGxQF9bSfono0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwMz5mPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwMz5mPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A7B1F000FF;
	Sun, 20 Sep 2026 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789927137;
	bh=OdP0a6bU3JY9jF032Jw3SVmsGi1afL7vaNrynwHuIKg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hwMz5mPmfRMeTyRApMgu1hYE6ZH0+VMK/9SgzjthqXR2uqaLyoK7uipWXcd3VVRm8
	 0Thuh01yBlhGjUD6G7fMw16O35QMa5Mew8qgNXpO0irSUkFUzpT77SlXcbT+ZBgzXG
	 37cqxsRXigxN4ISj5lcHkzgEsFH3IqAJ6CXYiVKY3OcHVc+x7iRn9KvLwAYC6xY/Ig
	 FsdL0BFFNpadPqknTZzm1kzQx/GDZ8WJn/+X7RJkGJWCXrLdqkjT1rEooEkTOJkNSE
	 DlZX3dX7N7ul/V2lQcNGGeby/if2tqYqWPi1PSyj47+J9IKEqcHJ/mWryxT6C+qyPA
	 rPgX/05KYYzrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D094439253DA;
	Sun, 20 Sep 2026 17:57:50 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <arATyx8IcifVCpp8@parshuram>
References: <arATyx8IcifVCpp8@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arATyx8IcifVCpp8@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-7.3
X-PR-Tracked-Commit-Id: 486a70ef848264dcf9a57f0bb0452848db9537de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60ee24f055f87c74d3fccdedcb761df9253fd5c0
Message-Id: <178992706948.1742959.18314578244910228068.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:57:49 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 22:41:39 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60ee24f055f87c74d3fccdedcb761df9253fd5c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
