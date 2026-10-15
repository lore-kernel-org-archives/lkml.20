Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884F3B83E0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102452; cv=none; b=buuQuosBQMsUycSx4GcmUoPATJ3GnuESdxtr36gN6FHMSSmVYzV2HKJ/DPEEWSXF5l2wFPVavbh+wIG2sb0ZuXBSz6gfgLN6skIU0mhm1DKcJ5uwn0ErnHJhqovKxEfQS5FdG6LfMWI1brPdmTBV8hlp6occ7HHMxKaVLyZGAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102452; c=relaxed/simple;
	bh=FN9bWeoSs1NYARd0BXB556upFwx6BhLnSqw0kfac1Ow=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VfvF4LdXNqv6qLGnDUGogG8GiEAfMQmxijzS1UpspKm0J51A180cXX+KtqfiKJOUUONbnaumzovJG3XNwop4iLJpTuLLdWuHGIfGoyjQ2e+IDmxcNT7Hjb77lr9rQdMxdYGgG2ESYSFTuvQ1sQXqLiSoduoxybp+ApPztNaDjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqrQvh6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqrQvh6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7DA1F000C4;
	Thu, 15 Oct 2026 22:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102449;
	bh=ZcYacJF0PsVqkRtE2SYQC378jYxe6oYUoHOdDEED3Bw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FqrQvh6pbypC+99JB3jyNNrswuAU2ywkSSYkMY/sxITGH57hGXbydmNM/2S9zwHdB
	 AxJVp+/z+UzJ1Q3/wgBw2CV1YcXt3jGucS2RRr8o839KIVECoOaBLLUlcxk732IG5i
	 o7ID/J9kQKfbVL85Rk6GPbTTiS5HftY16+96KB2QpOciFXRKOhE7gdoN3gkzVz8K17
	 m7C0ZbeVLmzuC/hvf3B2/gf6tpzWh3qymtIaOG5CSWY2a8yV+q5WGzi66YyRJHmrht
	 6HefBZvNitwijKQXSrhqgK3jYzp0qVm5T4kgOEHlnlUNyn9tZM3XEvHFJD/meHlpKh
	 awXV6PCMqkQ5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B46713808209;
	Thu, 15 Oct 2026 22:14:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
References: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3
X-PR-Tracked-Commit-Id: 59f522f5a0ece96ce051a27d15533667a1d0dee8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
Message-Id: <179210244821.4132939.991066524806095559.pr-tracker-bot@kernel.org>
Date: Thu, 15 Oct 2026 22:14:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 15 Oct 2026 22:33:25 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
