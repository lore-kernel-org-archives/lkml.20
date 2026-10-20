Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535840;
	b=vZOpNYv0L5CEFelKf0dBHn6hOrxdkz7gYRM0TUdoEl7yfpv+k0DxC7c+2BdeeihM0sNU
	 7jomOb5r6hcvNyYusm1bo3x5ge+46xn3j00hsR1br7Acz71SyRWsHiKzcVwabwvROcvDt
	 HpRzXeAcXtsCfWF/VPbfoyt1UVMnKkvICDxOt+jNV+IoL5bO1jIUFTxakQhG2kPz0c3lB
	 9VSdx5awG9XPOMQXKcDY2+8ID+bPaBCWbJygpi7De3qUTkUAXI8qVsi0HuDg+208Gy05Q
	 y8+N7zyAYAYypUJFcygn9wbrQ+C3GaPAr1N6fchZ/JYiynIYvSnekhtvHdI7Uw6FKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535840;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=9q5YNF5jucnZPu5Tcbr0Cdq3tGwu5kSM8vVZn6Gb/6g=;
	b=IDXv7XeljJ37jUMcgozZPN2az/TlDoVJ6Yl3X55VGFJvnfpjHRG94Hjpv8DkLFkiCTzj
	 D55RlvL4yB9lYjMRcH9J1CBHhiinsNGXugNsAlxvMSIoVQBKJVh2kDkoCGeYB6PNhLhhP
	 /v8VV3bNy60rd4rz1ChaN9QUAjALFkx4/dQ+1LyEn0FJzzagjM/+y2GpjKP3uqrDoxm0A
	 lb1qzSBAoLFxXEC1aMB/w3mr6lhvgaN2Z6Aex4sULZxUMSCzr5Tl4CBnOn5vn/tn/GIOJ
	 7Rj9hVf3WARO6n4GnCFB9Y9sPDT0W9nh9mIk0/V0UeRNPHhI455Wy6imp4koLy3/F+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jHTcp/XX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHTcp/XX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082C31F000CE;
	Tue, 20 Oct 2026 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535840;
	bh=9q5YNF5jucnZPu5Tcbr0Cdq3tGwu5kSM8vVZn6Gb/6g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jHTcp/XXwRF/Wykx+ZuGhwSeLUPPfCVY5h9UTz7XtuXAd0xRz2C/MRyMIr9xXmc8Q
	 8ygSFRr2+UBfaHgyRUcFKkPPvwlY1lHtLmsh9HYGT6HNSLQpVnL0uq+KfZM/k1RNs1
	 RkSo4SzUz6nMlQ+jGNEBc7qllX1tQaIsoXNf49S31UxhBRmb1OrhKINTdgkEiOfGXU
	 cPNowVINA4MfDjp4PPwldy6faxRHBv5/at0wtY0x44KIlF7h07ZjHVPpBkwAZxDlPT
	 H2Xr2RLwOI00kD7PvorNjNBIj7gkr6nMFQkoHJXM55Tu1QQ7GqUzy+k4ZbzsEw9bm3
	 Id6ooWJmjR3jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14C43809A0C;
	Tue, 20 Oct 2026 22:37:19 +0000 (UTC)
Subject: Re: [GIT PULL] x86/mm for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019154529.1878897-1-dave.hansen@linux.intel.com>
References: <20261019154529.1878897-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019154529.1878897-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_mm_for_7.4-rc1
X-PR-Tracked-Commit-Id: d92b5ac5aeba1ffc734576e30a5bca882722de76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 568b4576b2739d8e84509e2f7bb68d12a8b0a764
Message-Id: <179253583862.248332.13694032652829830016.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 22:37:18 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 08:45:29 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_mm_for_7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/568b4576b2739d8e84509e2f7bb68d12a8b0a764

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
