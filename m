Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6335218E92
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968573; cv=none; b=BG2ItWgJPUQn2f5HMmbyoyf6dDAAaPwiWgE9pNv7kvH84CIEkk0GUvCgqnh3MSm8TRCoSJ47IOgwZlYZM29XFyMe/VxveDmyUzZo7qT4is+Jr7KAvk6piUWjlPurAuCszERMb0FBAhmb3v6Q1tFIROVDpkgGYIAIhmphZodaNkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968573; c=relaxed/simple;
	bh=Y3aI6kyJxq95xYxyiMoXM81zXubrvDQKxJ8MiKezfR0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H4CuyOLl3+0bZLMjXYibMHwwbpyEzb/kYmZ7F+dcgBDwve+jke+kNacrfh78GtB2UeWihu/wNu6SRMEXBfQCoG6dIVZtdbUEekj67agS5zgAKKZdMxQ2EKRTr4mp0Gtf7X0KTXXyFyU0hUUNWNAUa2wByiBOMl/7x2AX/LyGjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVVfzrfr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVVfzrfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F021F000FF;
	Fri,  2 Oct 2026 19:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968571;
	bh=TW/3Bgp+W6aVNC7AIynY6HBkchlAdDDuI95oxaq4ozg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JVVfzrfrCKD42iq/WhBRg8oJzshkAtYmyRXrM3oSS6R/qygwS40pabNn8N7WRCgCm
	 40PeEvIIthYIJp+IkLrw9zIi9PvuKrt+MKZmy7febET6Jxsy1A0rJ5BollQkMeBOeS
	 leIeA/E+7DDRbK1bYo9OarDSWIpWbb/yUJICqYBZKxm73avJGbFdgh08PZf8fzPWN6
	 x2IVdmW4O2Jav1mpfb0E+2ogI/y+7CVRu2jNiwqNPtDBIdRuRhKFsVv/Nd3nscStM4
	 zLEitkNfjgAndrgGK1+RaI4R7eTILP4+2fPE+/BOqyCzZ+YbKec1KR+lUY07Flb2Ct
	 yyOiI95fTVF/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775413811A6B;
	Fri,  2 Oct 2026 19:16:11 +0000 (UTC)
Subject: Re: [GIT PULL] slab fixes for 7.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <2283e699-01e3-4575-8bba-93d0f5b2066d@kernel.org>
References: <2283e699-01e3-4575-8bba-93d0f5b2066d@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <2283e699-01e3-4575-8bba-93d0f5b2066d@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.3-rc5
X-PR-Tracked-Commit-Id: af2fb3ee6679b517e2fdbd3ba16ec276a8b74312
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e9a2de02fedd0137f058a6e69848072a20f8f34
Message-Id: <179096857000.3549447.11222267736622715493.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2026 19:16:10 +0000
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@gentwo.org>, Roman Gushchin <roman.gushchin@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 2 Oct 2026 11:15:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e9a2de02fedd0137f058a6e69848072a20f8f34

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
