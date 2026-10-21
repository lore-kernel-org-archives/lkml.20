Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550251;
	b=scz/jXFe0FgNMp0YxIW81rAQYZsCY7pLCDEwZaU3g+o1SJLdrg2wUCRjbHtKyT0UW065
	 ZfOP+yeIdd+fkBueDuN2HUHoR9nDq2ePvVv7ZN2vbrvWFRD5+bdYBIpZqhhgFtg7p8qau
	 kNEHy3r0dTmKGO3XMPajyqnLSb1UmaAbz2C6INoGDRfy9RG7VWiQxCOG5lOzC+1/A2Cyg
	 8VjH067liyfq7jcHfrNtsK5Jh3WAfNAtlFCN++LEyjGOKXh9F9C6YtmYyrl4vtSIBWxI3
	 k1OfsuvisyDrVmv6b0vYqpdFcDh7qlJbmgNhek0ateYTJObg1SO/6B/wjhw+xRHFhrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550251;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=pzCcnZRQkpt5ADQvXKCty92GuOkSUKN38jjt6K12MQI=;
	b=pvS6eGDDlpjP2/YSOwB0Vcxapx1pTcgzOsj1QlXCgdWy9vJrWHP2SViZv6FeSYNFlAuZ
	 3n2cArI03IKrnr+Ce1j6+6I28+u4yajN2bqZU08MCNvGZhuA6BsAZvL9dI/0gNdRXmdXo
	 sRki1eAtBG3mp8FvJ80qhnk2Wm03KzNuCkEH2Jio/tCo/XeUTmt1Jf4WjJVAFDGPv09hX
	 0wXE4v7e1gu7jpq6sZ/zG9oFCYCCOO3/j4JUWh49N5jJP5oxjCSONUb5dADOgY6x6Bvam
	 XXAA7kdlGozbQOVa8SuUIHyGlBbeoZ1x8/5xRtFEdbDfG0G4RluURUFbB9g38Hzrflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQM4wOwW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC90606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQM4wOwW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1131F000CA;
	Wed, 21 Oct 2026 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792550250;
	bh=pzCcnZRQkpt5ADQvXKCty92GuOkSUKN38jjt6K12MQI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=oQM4wOwW6Fmhh/KUe9di5rTDrikZwheB0OXajPg/ifEb3W5ag8FI2pYYwH7aL7cdC
	 lruN394ZQyqEVfvvpBIZFILZV4268uunenGbXGBy4Xwispdwq1ZeHPQmdcy0S4VXbQ
	 RPeSRKHr49tltm2SzhdY+OVR3X2P3tfpuSNz1aTZyI7m2//Nc1pZYs+zhjhni+U2Wm
	 IB8JRluKk4YgBHzU1NyGrIHkcKNARmHqPGBVAIwh2aI8VL3RwezMQv6kUnM2zU0aV/
	 0KStEr4Isj4KmFqW96rG/nsWj72uRgfL4DJlh+s+Kw4sMVLgaBgQZ2rsbUBqqTOw2r
	 zMdNmkAC4LLJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B47993809A18;
	Wed, 21 Oct 2026 02:37:30 +0000 (UTC)
Subject: Re: [GIT PULL] configfs: Updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atJT326zoaI9wfhY@gmail.com>
References: <atJT326zoaI9wfhY@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atJT326zoaI9wfhY@gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc1
X-PR-Tracked-Commit-Id: 6c1fa55e287a64ebbf6877f8dd288c6d2ecf4ede
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d4d9eb226e4c2af8ab390bb470477fa68072fa2a
Message-Id: <179255024934.339009.8532214214994556780.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 02:37:29 +0000
To: Breno Leitao <leitao@debian.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, a.hindborg@kernel.org, leitao@debian.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 16 Oct 2026 09:45:14 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d4d9eb226e4c2af8ab390bb470477fa68072fa2a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
