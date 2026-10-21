Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544910;
	b=W755zmXdT6svxih13RQlBO/LnoT8c4DyKNllv97lUu2u7pCl4y5oLvWNP8jo3pB/senx
	 y7aZq+QgapnWWjkMdRt00nyxW2K+Qc92j0IWyVO3Pr3nIIlm+PLyaCCQtwQg4oraMtv2y
	 mSwwmoIOz7w9yEYWA+vegnqChqUHWHx2sN/K2JtIFx/Ne0Cr6Fx7uoxZezdcgR5Izp6/b
	 4ynzGw3+VN3v+2c+Qwjs1i6njUClelptImrkIWt+w4J6Qv5msUlwEO6BaHzyYZkdDnTKN
	 Ri25pP59ewdSiTRQiUEGQcPr8Yv8ivnNk8DXJh5rtzXke3W9y1sKjETODB/RfLDfWZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544910;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=vNsMqMdHNCOe/DCqswoNqnilmxo7Ql0Eq8AIPP9cEsA=;
	b=BuhXz7xKyVGRmG05O/9bt3Uuwa8wuHm3cTcomjWyGttQFTMpcuOlOHU5sKD1j8myiNYB
	 FCrYgduHT01KtXAhtfTrY2kR1tIOwL+bwjvrmBPkJvn5zy9WbZ69/TKgLI8rEFsPnj3wb
	 5RsLurJNT1IY/4LQL63x5iAJnFDikrThFW79G+zpR2O+SUOeVwdnGDK8PeA1OvdwCSFZg
	 Aenz8EgmgVtFByla9SqmcshH0iT3f6jRREdGza17vfDM0fyMzSNC27sEbBchzDttuzpGB
	 I2bpS8itX+fm1CAYdICjVbx9NVM2hmT/yxi5g+jxa05SwfSQKxxAhtt/ZMcyKMQxhwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZXHCvYu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A71A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZXHCvYu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB221F000C9;
	Wed, 21 Oct 2026 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544909;
	bh=vNsMqMdHNCOe/DCqswoNqnilmxo7Ql0Eq8AIPP9cEsA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=DZXHCvYuG8KzzHQ/kDSfR/BCm88UC5SOZIb2HYhlSFAUaaT0zK1t3tS5atKgofArZ
	 9sK0Tb3AMda5RE0RLTjgxFjRLBepwf3933UYlYZl7HZ0/OeLiNSvssuwNXE6gzDku6
	 /RGy36OkZb9NPMCe8T2m3nQdDga+xPu/c8+3n+tifdtxavZ9JnJVvpt5EoRCpxQYu5
	 mT154ViRSPteW3f6Tl74dvjWxUV6fnqqx6Q9OsYYIY5PPwM3Rd4M6GJAmI3MiLzQZ3
	 uai55Jd3cQW08seEPPSOZyWYUanMR5LI+s9sC1amtLpbbsFsXkWzoe1ITThhgkICZT
	 JImHQSibmoWoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44B13809A0C;
	Wed, 21 Oct 2026 01:08:29 +0000 (UTC)
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/cmpxchg-emu.2026.10.12b
X-PR-Tracked-Commit-Id: 558ccc91ddf98d58ae726ed7ccaf5838f284084f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6303381334e3ac3f0762c5db2f240e0348c36c9b
Message-Id: <179254490822.303828.8719612500235433245.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 01:08:28 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 16 Oct 2026 20:51:38 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/cmpxchg-emu.2026.10.12b

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6303381334e3ac3f0762c5db2f240e0348c36c9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
