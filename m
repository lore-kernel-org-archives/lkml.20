Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211033;
	b=zlG5O5NQ3s9/+s50O+IopfBYM1908mXwAYsrBYQPwmQBYBB/ICWNwgGbDLAsqukfu5tI
	 TmmMT9aLdtX0XVfl17yhed1076uMnQJHiEfbtQLOiRAx1gk67SexzmFPLBIJErm3Dud6Q
	 APAz3uj3/6xj/Ad6L/UCZSMjbkYGEiNmol+tjfy6pthkvJKK3L6AlOz5E8gODxZc4EWRo
	 8uditldOyvdsU/aRnhflbInwSWIfYc3mkLCpefzkmqMvtkoKtBOFBEJbvfV9ZSmkmT4Ny
	 /1oW7w5iOqkRf50g0SUYz8wCIWlB/es13vr0HT+UUQsGmrdbbI2sN8jllKDTjjZqtEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211033;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=meFvsN4QDdGiZoZwjCHXeYGNz9e+UaR0oWAPQS6oBp0=;
	b=d15ORq1XL9VX1FIQdoAekSZSfSLILyuWHiEygbiDNKsUHiVq0/B49v43pZ5EnLLQHt49
	 594B4Tls106MHImqUImVilAH53+XLpPhYx6bxUtE/Isq2OmzdlhU490fSHU5BIAdkXNak
	 jKVQ1TYnZ2ro6wqgw3z9KEtmcPeUSDHEiJsgVn+h/1YYrpGq8NWw/fMYMgx7mjavozZfs
	 MwDvKkNW/Nb6u29q566gDyOsS+zrimLmTmMJVb9BCoshBvOTu7Zfqmji4knPHIxRQ7kUB
	 GTpInYwZrMkYqOapsUAgFqI+cmWvsIZbtBZ0ceZPHWd9C99MvsL8orfb2yD6qjOymJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xu/9see0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED23660A261B;
	Wed, 28 Oct 2026 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xu/9see0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA36A1F01829;
	Wed, 28 Oct 2026 18:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211032;
	bh=meFvsN4QDdGiZoZwjCHXeYGNz9e+UaR0oWAPQS6oBp0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Xu/9see0IGd+UDjobA9JWT7coUpwqn2yJDqiHhDTQxOUNAqobvg0NLpsIHnQCTgHK
	 XG0hGunpikq8wvpHeJOZ1NFAhS1g9Zd6PP5IghdiLmQ+xIAtffuAHb/vPiIixHUMRr
	 5RyfxCirli54gChJigudXhrThSM1lb5snGVOU95KRgitHOHlLdQ5h5IbTdLpkPP0MF
	 +NIX2cFxK2qSbltnWwfylXn13r9iyhUe5t4rulqXWjQ92b/a2OnrA/O8JwJmOGsnFu
	 P2eVG3FMTHcHx0rGlRcOfnPCBIsOnuLj6xg4GEnXintjJVTxAnBW1HDwl9IXw5zf14
	 IVUSFjj7me6EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BEB573AAA76F;
	Wed, 28 Oct 2026 18:10:32 +0000 (UTC)
Subject: Re: [GIT PULL for v7.4] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028014050.3614d83a@foz.lan>
References: <20261028014050.3614d83a@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028014050.3614d83a@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.4-2
X-PR-Tracked-Commit-Id: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d738fbd1a8b9d82ef5ea0d54a9e2b3ab7f1c24dd
Message-Id: <179321103163.1342141.7955231205480817044.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:31 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 01:40:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d738fbd1a8b9d82ef5ea0d54a9e2b3ab7f1c24dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
