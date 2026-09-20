Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6B446EF92
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927140; cv=none; b=fBRJD2KqQ7XJWbEfXyO4+sTTNSy91RGv7cUXWBi4qz5irdgI7ghqDyTNecWTzvu2dgwctfI0ZmK62spbvyjb2vncy2AaAv5P5TAAwQxTAxEPPRcvmZvvJJCOAUSWDt2vhsweVirZjMbtFqiR7HYpvYrJJoFbDyKTEJWu/NtHRAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927140; c=relaxed/simple;
	bh=T3ciCxjh/v+9vadphVzrEehTeCRFu19bt9ZOV8W8wyY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kZBF4hRb+peL1gx1MopEXW+EY4z2vkm32Ajd8uwboAk8Ow6E9upE99dUsAjQRBtnOEZHIDxBN8pL2hm9MiMu10YZtJtVvWl1h6fnJJ/Vm1Ru/yzJB0oILUXPGIE7gFrKvPVsF6NCPVd55B49g2a/UB2xVHq0fWPE117/8CwvW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxFyWL74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxFyWL74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060241F000FF;
	Sun, 20 Sep 2026 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789927139;
	bh=NaTuih6/nWfHxdqtvNLmfvELd/Hw+ZSnBJoyIvqaqiQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MxFyWL744c/udHjaNPIihYXMqI55CfUDSxOKlmVGRJSSgA91tRaBeUk1NTmQajkj4
	 2qh6BJlFmA+h5UAPOnTid0ZEOvKzrkYOeqIUlbdc2nKxxDEKusQaXtwa/Zx/E0+L/t
	 CZRZIUs/KrmEuPWYnOPVuJsf3FR4ULFmKfSELUC2vr81e+3dlNufj8RYAFY4Pz449/
	 /XRg7FeS/pWoSmIUkxwtqwM5VkpaJ7n5I5XgTkXHjUvDFmbde0c/r1/PkdibsPSC/l
	 AEQJJCcASHM9McNpJctS5fTsrtePUjesYnSgmJTZiue+9P3vGY+nqXRk1pS8qBtydp
	 KVfiFvt9oxleQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A0A39253DA;
	Sun, 20 Sep 2026 17:57:52 +0000 (UTC)
Subject: Re: [GIT PULL]: dmaengine fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <arAUJaluykugcCzN@parshuram>
References: <arAUJaluykugcCzN@parshuram>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arAUJaluykugcCzN@parshuram>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-7.3
X-PR-Tracked-Commit-Id: 075bc7b1d3dde5ed43fbaabbc1a69f09b7fc3a47
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a10a019dd4c7c57bef6b8dda962c8881ad220af2
Message-Id: <178992707098.1742959.4148901598380317591.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:57:50 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 22:43:09 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a10a019dd4c7c57bef6b8dda962c8881ad220af2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
