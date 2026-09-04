Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212984F472A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536529; cv=none; b=hAjFDPnAHKBBoNfgKphM9wTSW94uMCqRaBWir3BktrP6WsPPKtvBQ7h53C7ZvSmY5tzgw4rglzsI43+RdzOZXsjsq2AimmnR8iBiSWCsyGlkI36MDpdqzMPyjD2NuAmRbY1uQwQt/3zDB1OmuLo5PimosnOvTzK3HXalgPkLEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536529; c=relaxed/simple;
	bh=DPhuY4RyDYwWD3lHU0D5z9Zx9wq1hpbXGeDwelVpLac=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=duEtNj9mAhsEsZzWqIJj+ZKQPMu8yPqujCbT6u3PPMO+pEGTkwulA4lf6ZArTcznoX6RH4FavNSGjJJm/FHkAdUgKbEs/30PNTe3O+vRDSjTSGB+6id2Jeq5ZM5n7jEU7eHv6TolCcZlxhmua0mYvpKgasqgKQ9nb1J9DrLNMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDretoV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDretoV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD441F00A3F;
	Fri,  4 Sep 2026 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788536527;
	bh=X8OwjpEc0kqJsxSxjES9sDD64gqatWUJMz9X+yMGrN0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iDretoV5Jl87i9x5MDiNiKt4+9ABdcDIXCoLh+Kv/Xj8zStTfj7HIteWyVxRandTu
	 +K3KJwZMOh8POnBiq9l+tNyBq79i2PDBBTkSZ0wljyITP5ZVdpKgEW9m0Pyz6yqskR
	 axBA2G2R+NeGwNr4pqL2DIaacrHTqQwhccD3pPcWAk4lausZKNEcRYpIK3aVXJYqXf
	 wYaAbOjVFldonqLWCGeSvzgbjK1eih4q5TkvhyVei3H/WQDv6RB5smQv9jHVq4juRs
	 vsr0dutFvpWbTAeDnfxbvHovgccS+l8aZ9/opMRuNcYckgL/UPYRGT5p7rT2e03ujF
	 7jvsZgC5v27mQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0ABB392446F;
	Fri,  4 Sep 2026 15:41:09 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
References: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc1
X-PR-Tracked-Commit-Id: 0c4256196b3a105307e2235fbfd85e768bbcdd0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 421066905cbceca1f78cba5f7d92b4980317ab2b
Message-Id: <178853646842.345039.41736783221135225.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 15:41:08 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <ak@kernel.org>, Henry Martin <bsdhenrymartin@gmail.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 17:48:56 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/421066905cbceca1f78cba5f7d92b4980317ab2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
