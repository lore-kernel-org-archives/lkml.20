Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535842;
	b=pNeHq2oNtSr/LWa0IDDe2ojL7qnFKrY52mGxgdsabWx575B5oAMbL5tM8SM9mg8SuimD
	 NyPe1JE2nn2HvgqTAiaxEIbeX6serrLGkfHrofd68il0V8jOkAoN+6opNYncc+FuvjFjg
	 STcwqHu6tHI3r8K1F6/fJDwQchHRcIAGtRYaGr24JwkOMo+NcHnziGb3mKu3PBvNVzAlh
	 heFGhkx277mfE1AAwZmTc6HW5ghWCusEefFbUqte/qHW2kPJVRgzTbJPvx1ffne4OYwAE
	 RK/gfGuhNBmBJ9dTARIr0zeCmlFKSf+JbSNmVzEdkd6j7bnb939+DjO0wqiLsku8gAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535842;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=6smJ/bqZPBGR52/LkgeoRL7wC9W/VqmRAdPzf6H325I=;
	b=1kLpPg8/HYUgqIYcrpnHfDPBE5gl6y/MizM+tSzc+NNg8ARoXeJFWb16aqAoXjdaBwHd
	 pt5L2GkRX/rtbry345dR8l+rnz0XgU10IQWYMWs7/8767VY2+xZtWiS6LzWlb1ansoTbP
	 b1tJpeLjsFeHB+eEj3xVCEdGbOzZzGaWhP1aHIE4Q1Jn64blvkdYddLlAuc0+lTxwaKt5
	 pSQPd4U2mxd2EdTAUMSxYXtPgG30oGMCB9iUl1kmHAYPlKouv7VADd0z37XU6sQs2MNNJ
	 k0h5ujHOgbNQj4s8boYtvmXCSlYrCkucH9n95Z/AA3M5UV5Ot/KgtlpXilnSAurS6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knm9DAPw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knm9DAPw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A051F000D3;
	Tue, 20 Oct 2026 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535842;
	bh=6smJ/bqZPBGR52/LkgeoRL7wC9W/VqmRAdPzf6H325I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=knm9DAPwInpK1lFpbq+TQ19Tkqz9ZTFSD6/2OaZekzoMJSqAdgIEoV7A7DDO+6yZV
	 1AweDRdQYaAhsauKtI7a6A+oGAkOxhTc9pcanjGqkjDJmQ3v0o8TUE/ewdTXiWsXRA
	 Nzytt5oXuEzLj+o/VrDuyC+FQ4fWmWpcsfRdOlGOPZuYaGeg7MYodHa0eHGK4zThaL
	 xwPmVpOKFqVbuq75rgbDKKDNkY/w2BA8poOCnFtVbAaiwWLmuwY8Y5ruBUbd66a24T
	 ojzComHE7Ku+cOEIjXvB5RMtYrxoOGsoXBm3S/Y1OjpPGGobbHUOgZJFghPU6u/Eqf
	 VqOHVjAFNn1mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F144E3809A0C;
	Tue, 20 Oct 2026 22:37:21 +0000 (UTC)
Subject: Re: [GIT PULL] x86/tdx for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019163347.1916031-1-dave.hansen@linux.intel.com>
References: <20261019163347.1916031-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019163347.1916031-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_7.4-rc1
X-PR-Tracked-Commit-Id: 5b8212d45d99b77c84e3ad305a295e9e65d5ef20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a8bdffce502d70405391a7ac38bac6dcef94749
Message-Id: <179253584052.248332.7112066926655428575.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 22:37:20 +0000
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

The pull request you sent on Mon, 19 Oct 2026 09:33:47 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a8bdffce502d70405391a7ac38bac6dcef94749

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
