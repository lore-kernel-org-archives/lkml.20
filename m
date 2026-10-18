Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25598381E8C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792350402; cv=none; b=cm6O7k2xlV7m8FOWLE8ab+vrtLqubUSyG43wyQU1hcjemSZBHH8psuyVH3xZZ44Ukf6m4aM2XuXKEYRoEoSzfYqbfesO3lqJ/TSZPAD8yWlPBvkF5dn34y/GKkRgnbBWaTukytSq11okX25eTJcel/Ya85FQcDPkSz4Gks5NN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792350402; c=relaxed/simple;
	bh=zgbEg5mnGnAwRPbuMxzjx9WF7JnrRWv4FYbXYr4LGOU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=p0aBfGydGuARCRItrcMSLZoXrjU17BvOT9U0sSLbwL18H57E3hfIofPkDuZ3v5DN4gKcuUt5f+yon+r+1PIjOli5hDwzBWUtWu2Ay11fcDfG5CGozxYgIJw0mcNrllkLj+wWMLJEvsBh03/GBiJsoUIwjY2hYroerQ7D1Z3Yymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlsqGe0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlsqGe0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE29C1F000C4;
	Sun, 18 Oct 2026 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792350400;
	bh=2NiSFL3Ifp83/vtjE5rOk2IuKt66RHLYGWXaR6teyrs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VlsqGe0gDEqpfVm6TCd2079wVAHOIDQmR+WfArwzFxl/IkBekJZ3hOCs7WaLBOolT
	 xP52N91WTRnQWGnYR6RlnKX1BHwrMzHvNFGJrtyA3T4LaCwrWPnx34aln9fm+Q8TNT
	 OIQAMLlk6/0qAxX5WDOuJ4oSPPqzaMfphq4OTW8gws7LOs8R+seNM01ct5mn9GEotS
	 oLOJdmSQuhK9nQBfBFPmNKGUh2dZ1BJDLSU5hIbp+gw+RRuGquKmUzANzgWHrRezak
	 ZLfxTyEDkU4Vk/8QjMCScI/sGUSxOFdKPdL6GMIskjOFpIoByTgbcGGFi/pB8YlzE8
	 OMPQL1Za2EUTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B463A381196D;
	Sun, 18 Oct 2026 19:06:40 +0000 (UTC)
Subject: Re: [GIT PULL] regmap fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261018125223.0B4901AC57D1@finisterre.sirena.org.uk>
References: <20261018125223.0B4901AC57D1@finisterre.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261018125223.0B4901AC57D1@finisterre.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.3-rc7
X-PR-Tracked-Commit-Id: d5a821f66047c2effd06147b84775f9b2ce0f4aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d679a244e0deb65d31cb02f1d1dcb790fcfcae2
Message-Id: <179235039928.1786430.9593255380249220666.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 19:06:39 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 13:50:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d679a244e0deb65d31cb02f1d1dcb790fcfcae2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
