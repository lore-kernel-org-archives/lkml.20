Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A29347FEC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744969; cv=none; b=CvSMkM+hBHNbL0/EX4c8kGzlHHsGPB5Q6yC81XHPw59MfQapXG0VQ/vGRv35OqHeJmzak5P8k8/nXHTeEYFPk6S1ThyWE+P/kZj0ASTrFRmm8vYervmaKx2gsTc3zcSHmE4g+MH/Afi6zLra2wxfyfferKHe9ZwTv29NC/7uJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744969; c=relaxed/simple;
	bh=Lg10RC/GWQxylJorPTAu/8tgga+CM/3XDOwimo4s4XY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bwFVVuUtB32dm7sh7dYUDfDttTmat3fBIvEt9uysNqM8CP5Plwgy1dwlikHvoX8ZCjoFuQ622u78AUjP0qq0I1wcu/p90uNGWcew8l3WF8Cwd/i3gZbV1oQUa5xzuo1qQL2OVKP7r7eNBswvx0Gk6R2rWNKzc8elFlbfzMkFhsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h16WnXLt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h16WnXLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073961F0089B;
	Sun, 11 Oct 2026 18:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791744968;
	bh=sd9yZ8auF+y21o9JeUGKQUfB67bu+4kh1sygRvm0j/k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h16WnXLtMwhWpQHkiyv/NLYDEUejFO8KEOnDYRfw4P5upDw1vYyJkCWHPSioznQ1H
	 g478umtLzflKkOA+myG1WUTeLh4dOCTtSaOd9fPRcpcopuzt6czy0LK5b/Y9CNG+kh
	 laKMhrjLMQauRgeLUwJuPhaamwu8zyhlj0d5u+peI01nNO9OhX+8sMw8Cq/vYYpTZn
	 lo5PYHANeGxClyU6cwOMX413nIkA2EXjYcL7LXXZ2XSPUsOjnwj6o67052+7ls9GS3
	 zQaF8t6s/CqhMH8Elvj8TYNPS7DFVjPwShVTFgIGod9dqeDmOhKYJntvGh2g8Knric
	 Gv2VB+tepFA2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BE38119DB;
	Sun, 11 Oct 2026 18:56:07 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc6
X-PR-Tracked-Commit-Id: 28c2388ee24cdbefbcc458fa41ef7bffaaa1cc83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5906f156e8818d29839d7d7280b691f627b59883
Message-Id: <179174496648.2141808.7251434759942231183.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 18:56:06 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 Oct 2026 00:48:12 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5906f156e8818d29839d7d7280b691f627b59883

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
