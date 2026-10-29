Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298575;
	b=SkMPUH4P3CCroODLOvKjWzxjNfaYD1w/kunSJm2kdLWAsJwcnDJG1/AqdSzNlv1Ibrw0
	 l35JxV+Qkq6wlcGsbeSql1Rocku5L/cF2SxHakrRQBCb2qHmb0JG/R795ZG9Kl+XaEidj
	 oZVg0YOjG9+7fhUfCfFePRd5c/LF96oiMkLRaSZPris3G3Q2fiGP80XTIrFXpbsqCVj48
	 bu+bgJHdS3km9ZJAe6fIXsT3XuKJn5Ky4xJ+1YevUyO+syGIzJg3OKlfokF+r3NiiSNjn
	 Xmzy1H6+DLtMnrwP8uSnn2MFjhmFs2de5WkAKPAPx0c4R7AjzAec2+rQL9qWqBhW7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298575;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=cGQE7KgZm+vUmlvNNDxkO4D/74nvFmVWmTvc7kv5p4w=;
	b=oahK05xHeJ8vuEGBSPjuOs1iuJyFuNz8Rqcmjs/1xnzWhrDROGuBOVT06D60ZoPbqZqp
	 EfZzgEvpRw20FeHbKwF+uJclxLnFJ/Ny3VOCO0P8vLrzf829iyY4GWFGlULUuopc/1RtJ
	 kpmJvzm6VWmjHe5QSSE85iiRim3+/zEdIS0gHFFhd4tDYYGZa4R/kNrx6+p0TNZ0/T6+n
	 mbeyato31AsN71f3qpgVa5SeTbM+HZFAvlF9+EB/eR8CzRmCMGmLGbEdgW0LNN1dbz4Ui
	 g3oeKuQZxszWVkWO7JTe4LgTWWd+5oEtkldGTx4lsnaT7S6f5J2crpN+MhEFMqxOJTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCV6eQLn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCV6eQLn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A741F01816;
	Thu, 29 Oct 2026 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793298575;
	bh=cGQE7KgZm+vUmlvNNDxkO4D/74nvFmVWmTvc7kv5p4w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OCV6eQLnxIASFXchsqFr2pybiCwAQhic7RbotZL1/LUIj7vStwRIFAJOT/qhiRoNP
	 8Aat+EMHOZLRtaJn/+HXkxznDiTP3Tc+/+/h7FrS3cVipTtPU0z7iBXgykEHysFkL+
	 KooCA4SBEwsGopKqbEyfBA/E9H8Mn8yxuCGJthtkC+mjilpnCwPJRcaX6pUHXB1RMd
	 wkO4HuKN81CU/cn5EAabBbsu8lR44Ld6Vy4+j6mGVrXvzHTidp4JxbsKaExX/coXzI
	 6XJJB8UIMQXKRmdAi9wUPx0NvqgjdySQ+Se82sQEsY4G8oE2v1gPj93eCVPiF82aNA
	 v3/iVDD8UYaZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 030A53808228;
	Thu, 29 Oct 2026 18:29:35 +0000 (UTC)
Subject: Re: [GIT PULL] kthread fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <auNlZtFskpC1ijA-@localhost.localdomain>
References: <auNlZtFskpC1ijA-@localhost.localdomain>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auNlZtFskpC1ijA-@localhost.localdomain>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthread-fix-for-linus
X-PR-Tracked-Commit-Id: 78ff77ded78f2d3d6040705a3ab5a83cc45275e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d011f648a708b231f7ef28c18ff30c815b07fe56
Message-Id: <179329857364.621556.10810685436848005542.pr-tracker-bot@kernel.org>
Date: Thu, 29 Oct 2026 18:29:33 +0000
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 29 Oct 2026 16:25:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthread-fix-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d011f648a708b231f7ef28c18ff30c815b07fe56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
