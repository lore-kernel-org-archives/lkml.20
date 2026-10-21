Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619013;
	b=BpN2s7SRlWw20kS+KTkZqGa0MFm6zT4rvL16v7uH/fZ2dKD27iserI3syEM4XGZXM3SS
	 Dnpt7kBA5BF4iuG5v0sbFKCY5eQrwgaxgM8vmUh5T5wQG1jGV60S2rbY/YXyRyMuzCDk5
	 odBn0MCGqvDY8qiGkLhHdZ1JSD9xXVMvbmbUPuVvgIh9ZRihZHlytJi/jrb78NIx1iEak
	 tivX41M4QN30xyUu2HUucqHCGa0is6ULTmVfsNb1sb6IXFjC2Eo6JEHxTOE79fcwCq7LH
	 uhLIKZw79o97OBvEhPL1V2y9m/PP4+rZFdw1oCKrmJpuBGUTkZMO/iehSeOFiWDf4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619013;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=w3AxVUuW/PdKB/NkvaaG/Wx19tTAKt3BQwkoaRgErkU=;
	b=qfuJn9nTyc0msqU2tV3ZFJ6Xjf7Bp4JTJCuKlAALnI9yvZgvIydOi8IMWxHHwbp9CNjW
	 kt+fsBYXvdZgoO5yirBnOVjtAffiNKN8gAkptGWvOrt5QbSedS+phAlygkP9+6S0hEDOF
	 /dG+2uxUXNjRHmdWK9wIoI95GaLQFkMLWwVzLos6Y1lQFZ/eH1RFf6QkHHUwi8cKnnUV0
	 n2c0HuWkmpUZVszUr+ZwO39AJ/ksnIYnfd/DYC9YZk9YFVFJ3QrfW9l9rP/QZ6UEPAtYX
	 d0ezfNxGZUB6+NtormL8NsMhpMj1H/Yr4RWIAlUS9TcMW3RZqq2SPOe70BkPliE+3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUcBxk+n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD404606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUcBxk+n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD361F000C1;
	Wed, 21 Oct 2026 21:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619012;
	bh=w3AxVUuW/PdKB/NkvaaG/Wx19tTAKt3BQwkoaRgErkU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dUcBxk+nisr3o1BzeQ8cf3ktKRZF6EM8sDFVNjiPCBfERPlFdqB4d2wd8+Ga072Fj
	 mfPgt1ib46VzgqShfB2Y3OpDU1MJRRDZDwRzJPj2/miClfaFxG0xCzBHKjZ1RaURGD
	 RCtL0NWl8ZwQASAkg9n5JhWHL89kU4HfNNXEZfBweXHa0C5uRuKKmsnKgquFVsQJlZ
	 5M2pMB/o/I2SO3DGB6e5s/Ams2ASpagkIYpxtpZPyVENtkZwadLuDn6KLsD1XWVfM9
	 RIeYgmbzBX4SVtzQWYhR9+C/sONUbbie5KpVhpDB1pki/KgUtW6nhlYaJW+NGMjEGS
	 l7rGXShYm3jFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77501380A962;
	Wed, 21 Oct 2026 21:43:32 +0000 (UTC)
Subject: Re: [GIT PULL] Report recovery time for CSD-lock stall for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <b854ac43-0f6e-4cfb-a18d-6586410f0902@paulmck-laptop>
References: <b854ac43-0f6e-4cfb-a18d-6586410f0902@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b854ac43-0f6e-4cfb-a18d-6586410f0902@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/csd-lock.2026.10.12a
X-PR-Tracked-Commit-Id: f929e61143a2842e8f8ec9f2319ee19dbb048e32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a56a18c14aea31dbb952b8eb03fc4d7b95fb429a
Message-Id: <179261901104.1324168.14721748257541422505.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:31 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, Breno Leitao <leitao@debian.org>, Dmitry Ilvokhin <d@ilvokhin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 16 Oct 2026 20:54:47 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/csd-lock.2026.10.12a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a56a18c14aea31dbb952b8eb03fc4d7b95fb429a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
