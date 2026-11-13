Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607433;
	b=4y+oEKKcuv4eTYVebzbSdZP1ZiU36HaN7h1ZKD28aCv1zVT4S284aD0oQa3254dpB7gQ
	 KZVBGybavEoIBTMBGRI8/JDMyD8UPpyKoG84SKwSkhJ2utSVXa1E8BMSrUBN4YK5UCDiS
	 4EZkntFgoVwaAVLKFynXEQSK+BWyf9Oh1B0qMlqvv1afjBnNM4rIk4EaQ9V6X5vKUY/po
	 R7xpNlkrCvL2q3Y1fpJDXnm96lUQinZNzvxE0k68JO+WHz3Z0sRvOjIomyV4Zkyx+9FpR
	 Ac1CoSF9l57ZwSVMiGLy55jXtYARvCeDNdqgSqLmc8gAbFhuAgq+paa/z+wxcbvVlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607433;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=jFj0VLgjgN2A/4dBU4nmmeXTXZ1XJNsGKVLOTIazsgw=;
	b=lsfqeP7fnmFiPxclAqb3Nja+h4ncadWqZdh4gMpbzS4BQoP5Ery2xausyNrOZ3ISVi7n
	 yt1+GKxlelYdYmb87Tr16KUvvrKVaL6S1ATPt55JH1110NIk3lU3uKWD9tiD1h/AiuDbS
	 +T+VWc8238mLASnFUEvTwJPvYnhRz5+VreTBy8kp+2SnF9F3HTIygCiY18HqwEo7xZN1y
	 ithT4yWhFs/LNtflH9TG1Ct6qospHeaivNO2kakAe8Ow+VcdBo2qym3DuMGGV8E1JtYhU
	 qYB7DuBSkEMlLs9imNwHHScpxgkprfSAOUm3we3dUulAnwjYjeguyOuSY7qTSPR/bQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBuuaWh7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B1606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBuuaWh7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0865D1F000C4;
	Fri, 13 Nov 2026 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794607433;
	bh=jFj0VLgjgN2A/4dBU4nmmeXTXZ1XJNsGKVLOTIazsgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WBuuaWh75WI2O1PBsZM/Ux0tyeqbDWespwZ+IOUytWa65um/27l/IOneiStPewhtW
	 dBoL5EXOE9EL1ihyCV2W8oVCCBufZ9ZtlT2kRLgUgnovRAEzoaQ+e8baT6vZNpppI2
	 IHkSQbKuhWnbZRUP5UxWZnjLMB9sYuhUQt5GrsowmnMmaBRDGNkIoBhsvO1vjquBF8
	 C1VWSPui+8g/lsYbzpvlMY3zkhWYStJ4WtTZf5LnLbW7HeSKCvJ17V603n0FhQ3MHH
	 K2rEqcaaRiSc2dlgGhnczvrR/SPAIpUIxSnPwTnPnZtuvykzkEJ36mECwAlR0AvFjK
	 1J+IkgIOX4myQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16D0380821F;
	Fri, 13 Nov 2026 22:03:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261113185244.3798402-1-catalin.marinas@arm.com>
References: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: ad3fc05c7e65009355effeea06aa629a687acef2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97d73c8251226cf27cc6656b4c542869bb8c69fa
Message-Id: <179460743154.1865235.10495301897269785737.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2026 22:03:51 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 13 Nov 2026 18:52:41 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97d73c8251226cf27cc6656b4c542869bb8c69fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
