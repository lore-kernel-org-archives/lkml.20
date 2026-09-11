Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4853A9612
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166150; cv=none; b=dNFQPriRVDt+GabtNxUO87kiNyqOhOyQKI2q/xKqTI6ao5HJWlQiawJM1Xj4mUQClVuLK5qJdlT2M5SWuzdSny1Kq83G+tLpdwyAaccucRVYzvR1u6nPoDWPNMx8Mlhj07+f1tFr5IXFMgg//d6bocJcsKXYAbl/ZH0vzq0xZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166150; c=relaxed/simple;
	bh=l5SE2fDDqrThdk/gYZnMbIvjcImbdkXZs6rhLTNa8C0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ePryskdNncS/hv7k3QFVmLTdHZb0+VubLtY7NtaxxDOB4A5N+ZT4H7zhUehBA1Fe12ZD5GEtXJekZlQ1IUnf85/1Vu0yO+fNiHpAXddI6gjpOBK1X/n9zDZQpTnbe5ArCz3HGS7/9S2B16p2Lq/AMK8uSAInXQIC6lqj1Cc+cl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObrbnatV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObrbnatV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65E11F00898;
	Fri, 11 Sep 2026 22:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789166148;
	bh=PdPu3AqWjYCtv3KKE4FJRlwmMuTZXVc+Uo3O19cEPkE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ObrbnatVMSg/SQkdiUUPtMCOKrdlsCIqaAAkA+xYhaJ5WtNyr95djFDq5tEiNhN6F
	 riinOmJKOsSM9OnP2PYkJ9gM/v+IYMRS1kP7BpRzaQoZScAhANgLgbzFS8pUmxgmwD
	 4GOmxOJkwkF+segdlaq7pvwZGiEHxDZofz591OQ2LT9c5xLfA++Sfh/mVakMSJ9xh8
	 F1bxJxLSzEiPQtyNSYMwz2sUDW7j0QVAp2AtWWmmniUBcM4tF/bUJ2CTbnxbGldDBK
	 IcgF8+I1nv3lXCQw+3yLyrq847g59vrpDThmExTmfnzHNkh2vcS8Wt+55umhCaXS9j
	 q3YmTplEZKzaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939213924454;
	Fri, 11 Sep 2026 22:34:46 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260911214118.2D176DE8ACB@traversing.sirena.org.uk>
References: <20260911214118.2D176DE8ACB@traversing.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260911214118.2D176DE8ACB@traversing.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc2
X-PR-Tracked-Commit-Id: f3e6ef13e24c9f26dca0d35de57fcdf04f78e378
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 114f73092b5d1bbea2554a6a784f5ebb53d47bdb
Message-Id: <178916608522.3141697.7583620422137297374.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 22:34:45 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 22:41:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/114f73092b5d1bbea2554a6a784f5ebb53d47bdb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
