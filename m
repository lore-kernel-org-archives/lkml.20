Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF451E433
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801940; cv=none; b=hnfF2+xO1yK69fy4lQXVXdjTGwcyP2DMQ6ybVPTwD6na4SMThMaATlsck5DtCvg3hAR1S2DBOyUhrxWzgz4lApFByZ/LWrObK7QZiskhoaWsmlAjM33GaWCMaFkDO0tQqcmYoi9YfnVSQR6xFIsjmlKKybS4PJn/hEDtU+YCoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801940; c=relaxed/simple;
	bh=M+mcd7b7c8Qjm878o5zNMgR3uEnPjSsihgD59xeK870=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fY0XX8KHaP4U9klC8/pIk/GR7zugFNF8RWWf2vBLLsWB51qybiawPKSa35Kf1VR0D7azmDKblyQBdvthl5lbZfvKtjYcv9fH+YuDK0JJi5Uh7rl7rmf0AYVHjLIs3We7DXv3DKwpCXOTYIamMsuQpc/Zo9e1mmen4LyAGYaFovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7c8Dwpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7c8Dwpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37D01F00A3A;
	Mon,  7 Sep 2026 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801939;
	bh=oiH63y8JXeCm7rbVmxffGywRanC/15PSfGamO7yaWCo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=R7c8DwpggN+iW+J7xiHlL6FV9g2fjIxLJldP6LRUd3DoHThObXtIwXqIbGo1cHiLu
	 KDQ6Vh95ntcg+647pS5tpbZPcX2sNyrGPjT8XeiQjZAmPJSLsoTFoZgCg7NFeZ9TBG
	 hDIjfiFt62ijppiZvDdEGzGMZhnquvc/f8rdi7N8b/OoM2dKYx8fIdlJU1hs4DxqN5
	 uelILw92Mq++yAchmQGblGk4o6F7Slcrs7HTsGLdayWWtOS13n8XdVOywkl5+9+B2G
	 6yxtskmvLOnku1N9pkT6clpl4Kl7NcgxizjjAKahYji2/5xWtgi9ivEbyxypXFy7Pl
	 szZ2Xzgc18uZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569EF39E8A44;
	Mon,  7 Sep 2026 17:24:39 +0000 (UTC)
Subject: Re: [GIT PULL] configfs: Fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap7pHxLx9DDF8Rxd@gmail.com>
References: <ap7pHxLx9DDF8Rxd@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap7pHxLx9DDF8Rxd@gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.3-rc3
X-PR-Tracked-Commit-Id: f06c2d26d1999d37e93299db0ecead04ca7d0b9f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c297ed90fbba72d32b7759aae362b36d15b2db1f
Message-Id: <178880187791.3092637.1316635143514788176.pr-tracker-bot@kernel.org>
Date: Mon, 07 Sep 2026 17:24:37 +0000
To: Breno Leitao <leitao@debian.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, a.hindborg@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 7 Sep 2026 09:59:26 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c297ed90fbba72d32b7759aae362b36d15b2db1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
