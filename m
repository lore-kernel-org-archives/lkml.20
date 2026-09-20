Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089646EF9E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924972; cv=none; b=cRIGvG5c/N9AEr8YAeZJYjMAX+m2SpHg/psNSYeAC6PNdMe6XsqS7MTHTV9+g9xKoEJ4ZJzP7UM4dV4dLIuSdnwOCnyr8xZdMTosolQdIuqgXr80IHn2rCj79uYEk6F5txzVKCPRFyXHzTfAcYjUa74lQ2oC5GAfdA2okBB/ZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924972; c=relaxed/simple;
	bh=ZwzI4tTfp//gIMmYMoV7d55f9iAIXU/rI1LjDGCJ8pM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k9303qgmKbryUooccM80PTNvaYtMMVrE6IXGIHNbPX/2RKu2TWPDOKjZ2nv9GEqeiL6Zjxbm83/CRZ8S078erc/I5GfBWxS8gMeK+kVDUgwD4WCdNkX+PAk3zZB712F2sm41hLVvY1QG1kMykBQu8qMJxEOOl/AMUQBrlNSZ04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iP2t55Sb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iP2t55Sb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970991F000FF;
	Sun, 20 Sep 2026 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924970;
	bh=NHxyN3eKP0f1XjM2TKTQGbUhjfN/v3OsUPS87SZxrJw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iP2t55SbotC8CLqFkvL7qwweYAbP7132U9AJRB5kd9ShNf1MkF9H4lHKMBq4/Z31O
	 3q+HDiK+12zmHai9LbP8zgbO19Iw5epZQ2xFzRUxKo31wngaI7ZRk2N05+zBC07vgG
	 yL7RTGtk63C9YXeXcHvmu/OiEaBDwY76Iq7KNYwKqSxHyFdD94T9EFAYvYyI0iJwHU
	 SXlh/4DHdrXWjm1UHiaaZcvD08rjUPNdRH5Th1rwHtPu/tS3LQELHvw0WhwBHYhz7b
	 RiIyl5MIljGrElr9saBTne3SYf0kb2bi3HccpRR0XgBbLy0EHnZnAv17as195HMSd+
	 VQjB/YPbLo7EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ED3D339253D8;
	Sun, 20 Sep 2026 17:21:43 +0000 (UTC)
Subject: Re: [GIT PULL] objtool fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-pbOlsNz7HnVZ1@gmail.com>
References: <aq-pbOlsNz7HnVZ1@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-pbOlsNz7HnVZ1@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-20
X-PR-Tracked-Commit-Id: 7e61560628d17ea6b1d8ee370f6d42694cff8758
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f7ff5f5479b020df69feb7493d4012685a8fc96
Message-Id: <178992490273.1735599.16259264489132319876.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:42 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:37:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f7ff5f5479b020df69feb7493d4012685a8fc96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
