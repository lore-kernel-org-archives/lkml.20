Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080105;
	b=gC8t4yfwKLutxH4T8oNEPzJrASdDZ27AwRg6Fpu1WmjZSYeh7JRAY6/hzVTcr71gGDax
	 Os5PHiVsw/P60TpApJO0koLPTkQC+6n63rIVbVNKXsK4KwRorl6x//uiN66CS4C+Gxlah
	 sbWXvOFu+5YAFCcSZRmCkael/eB4YAvjP0pw9j0OUgANC5mPc395BrJ6GmELNiMUGYAe5
	 vDxzhUZw+2OaOtqHh8/rXoH0t32a7jNO3WzEKf9as8/hFruXC+gA1ARlkNDwxge5xrIDJ
	 qnHAKRdDi2xF3SvYgHT0K5vJBBfTJ+wcvie1E9kP1/bxZqvSb2Vn/k9iyFMNfHlvjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080105;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=t6pr0Kq+Qg9kc8G/gGpDKk34Ekvxb6QZU84qcYwWb5k=;
	b=hVsp+KqCpJjDYAateaY+I4Yd8itsGgf6EViKYt438OX+NkJCP/sVhucjOKkytxrq5WC6
	 2gcSlpzHIsp7YjxvTplvLFi+Qc4NwlcA1hunDwpPGqWcaqlfK114A+/+1mwiTb1jTYOd7
	 6pvm8qmUdFf16DN3KUtcxoCJztDjcbVFx2JZUTDuLGfizXR5s95Sgg0nwMzWMLat1iDGx
	 8/LjtMuQqC0N8P9qEPXCzDyJ2Qfp1FAIJXKcIp8/kvZunD3OhAohvVoaVgtSP1DF2CaZU
	 yHsiWSACUtCYnD+/a2RKn+CAfGeiKFbheM/gi+hbJhdw/dY4sKWRHQCkO34t1tR8wXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzOq5IVa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160BB606A326;
	Sat,  7 Nov 2026 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzOq5IVa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E378A1F0089F;
	Sat,  7 Nov 2026 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080104;
	bh=t6pr0Kq+Qg9kc8G/gGpDKk34Ekvxb6QZU84qcYwWb5k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hzOq5IVapPSMFXdOadQUSEdQ3L5nfvfOz6EQQCPf4J2mUQcAbpFikRZFjHARD420E
	 N2IDh6qUPLIPLZXGM0lav/lmLESw8jQ/vkr1lqGku55l+U/WH+xqF3Pc5Jzvcl+UNo
	 leMlOX3yljrR6fVvMjzv/r+2Fnjq2q8mAHtuzlZYN0lX9aVdNnlShc4IsjoPDkhGnO
	 AQOi7sW9NKCF1/wMVLK8+6LdHL6eBVBiJNmUGOyDnGFwg2FVhvj4dVdZg7md+5b09M
	 RQ3aXJiYSRRf3eUf3TdczV6hBb7O15fSNTNOXP7lbGRh9wVdh4aBGbr4sr/s+7Lx+B
	 A+khKPb/NUaig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D82A8380821F;
	Sat,  7 Nov 2026 19:35:04 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261106213740.GA1851347-robh@kernel.org>
References: <20261106213740.GA1851347-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261106213740.GA1851347-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.4-1
X-PR-Tracked-Commit-Id: 9c1075791172d936935ca20d7f0c1da601c4f408
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d164c7d754f0e1f020298366ea92430e62476089
Message-Id: <179408010357.1301131.3089617069335281848.pr-tracker-bot@kernel.org>
Date: Sat, 07 Nov 2026 19:35:03 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 6 Nov 2026 15:37:40 -0600:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d164c7d754f0e1f020298366ea92430e62476089

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
