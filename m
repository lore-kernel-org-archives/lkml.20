Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B643E06B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589033; cv=none; b=oxnOnQICvhM521mcFp+gd/yu5NonZrd5W76dmCtkmwnD3heyONqMiP9TdMM/NVAuaatndZ+2ASmRhjelRrpR2XIcVy1EpNku5QFxuLxyHSZiIy4Uco4qvk0I6nvn357p/l07H6wuhisMajIc1SiRd7Acc7s13bGpLHQv9+3wT9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589033; c=relaxed/simple;
	bh=N5UrVI1feRltUZ6M2MKt/PjXQa67LujHBsCDQEXJG3U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CnbKgHMMFkoTt1jidmHOB4WoIikEf2VsEtoxxidfm6KIoqCXJTvAuWHc/XdIZEiJYY3a4ewSYRYcqyP7NXsfin8xQupnlKdCVO8X9GLGoBFmtNJW0vDSPygW2OwqYXRAIL5fecOiGCGEHs3r9/AXP6AYbyaONTFgoQN+jNyUYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aysqbm7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aysqbm7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AC11F00899;
	Wed, 16 Sep 2026 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789589025;
	bh=VRWG2SoRwjxQIbFVUxojKYFvMyrNaqq8HsCrfsjBoUQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Aysqbm7mrAKtve6Fd2eCg40VfJ6uHVnQy6WnADRdaNkvFQ7MZ4g4U0HW2BfrjcAZK
	 leyo7DnB/SgLIztzGfVKDYPFN2OtrS2EOcikNuyy6Wv1kF3vmGVfReRmftVIoy0/El
	 knWXdtTWM2X4n0CDeT83Hk++ovcwEIBrro86ieuhL34tYYUHyaOnlDMWgyEKD2nDzA
	 c5BZvo+vetBncbPsGU7NMQcY4Km3pQXzCtH8sbW/ok1XXQGcs/HJ3rdw7MFU+B/zut
	 buygcDPfgQ2GUpEV5guxyAiSd9YcEoj/WmXM9NwJMtgCaADaXfwyy643NdUdffvSbL
	 dYk/H4MM/ijJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CF239E8A5C;
	Wed, 16 Sep 2026 20:02:40 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.3-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <376f4338-8bd8-44bf-b132-ee7bcb5bc29e@linux.ibm.com>
References: <376f4338-8bd8-44bf-b132-ee7bcb5bc29e@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <376f4338-8bd8-44bf-b132-ee7bcb5bc29e@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-4
X-PR-Tracked-Commit-Id: 0b271f7d7f5ed45bc498a03ce0aa9cfd8402fc71
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 238650ef6c7c7cca08e032527329424c9fbd70e5
Message-Id: <178958895949.3268005.4615565111290806567.pr-tracker-bot@kernel.org>
Date: Wed, 16 Sep 2026 20:02:39 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, amachhiw@linux.ibm.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, sbhat@linux.ibm.com, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 16 Sep 2026 14:09:04 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/238650ef6c7c7cca08e032527329424c9fbd70e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
