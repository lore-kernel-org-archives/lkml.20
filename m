Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14A384233
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321138; cv=none; b=cfTJIGARVoz382FbcLojMDXnKwK4MvHgra3W91Syc/oeWqrPYjZgBjjtYNR7mtH/iA2f9ANhbcANfdz1ezQnOywevXzOMpG1ZZhE++yxlcoXe1IUHQ6PXw0AGo9RmK+QcX4xowJYeCAp804s2ZHSxQ8MevBnXLub7xV1ermKbHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321138; c=relaxed/simple;
	bh=D+WJboGat47My7FnjPASaOftD7B4qrtQb0Cw4/4gp3Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jcv1tXjjdZmLPojX4w3ARfMgYg3NfNLD2nkRgFN8g+6XPv+/n0DFs/3css6OFw+tkrgisBQfYQZU/+LV+W5QpPqIi+ORa5HZSvpa5d6gNpIeK/MRO8MN5+bHcV1oelBK8e/wgXS8U3w88PODagkO4PIxZa2v4xbABnUHYGSxlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZfANbyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZfANbyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64401F00893;
	Sun, 13 Sep 2026 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321135;
	bh=zaqEPk6/IwTFecI5XyOJNQ9FiLos9gLXsk1OG3enrFY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iZfANbyHMZWwlzMR1GVFEcwUAyY3/j3k++7XeahM8jTy751YAbEzdRvruDjtXalVa
	 PHNYPqlTHUZSsCOrVIZCyzubs79SW6FJrzm6z0Uo/cy1VbbTzJdbX5BH3MDdEbG9zA
	 BggO2OPG5I0Aw6MBGagmYvSrJTC+ZbidvCWM+k0qPVM0gV40QKXULnhFPg6Wgb68qm
	 1oCgqenqNgOH4l76EUru8Lg9/bor1hDqejNphDltb5gDTI5Bd14YYFd00jdh90/cHN
	 iphBuaGfoaxOXyIxclrcUWp0TvAslJRwZ5+wtf+dueiUnmscjYpNgwqcegTYRKvq/H
	 C+Pk3uHdPT/QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0DC7380A957;
	Sun, 13 Sep 2026 17:37:52 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260913213215.664a6efc4b690c9c78d7985a@kernel.org>
References: <20260913213215.664a6efc4b690c9c78d7985a@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260913213215.664a6efc4b690c9c78d7985a@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.3-rc3
X-PR-Tracked-Commit-Id: 7812d6dab0698001e50e8c2f901e17da3eb6f429
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a0b3fb48d485754661dd648a0cf9533cfcfa3e5
Message-Id: <178932107144.3902938.11412210943222876421.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:51 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 21:32:15 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a0b3fb48d485754661dd648a0cf9533cfcfa3e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
