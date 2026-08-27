Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576749480C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856898; cv=none; b=PH0G4r6E891h2mrOdz4oM2ITvSxO8ZjwwornsvNivzfzCBcsQwS+UpLrVbqbkEjWTh8zdcbfNH8G/rqovMVVAC2FydN28qPcZ3YPro2pRDphwFeIzAYKvo3EbmVMgw/1cOWsJGj5VGB9EK72fOSB/mQnmFvJoWhhOAVEj1CJ7rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856898; c=relaxed/simple;
	bh=7KE9SE6oGNnzNUBSRiOGwwV3qbL9JxzC1boRRE04DvU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GU1HOdVt8p3KqZu9Z6Rp5F/6o+H/BNf4PSUTgytMVFjqyxw/4RNw1Ls71iM3onFzgfoYeA8ULxuorrgk5ijmyuIm3ZgR3WPm1aqGmAg0YqNN4u+CRlgSs/nG1blDS8w3jdH7ePBtWLUzxcu2efJ2IvIxGUkBZFkY8Dq07Uc45l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRpNAKJZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRpNAKJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614CF1F00A3D;
	Thu, 27 Aug 2026 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787856873;
	bh=RXZ2kaCwsEo8omPZLQwCW7DmO9pr8ymSI/z0v1BLTHw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nRpNAKJZDR4kJdCt8jLsZENx9p8FQd/zGie4i7wGDqD6WY5ezIGAdQELlHCG+HCr+
	 NcfQ3sv9yjJ+hct5eZm5R7sZ0HnrNNoHqsTQq66pew09EL/YgAdMjzPlVSOOiYBl2I
	 HVdri1//ITdHbJZE6hqTg61vEIU0boYB0y4pyOwE/jYli7LtecCZpPNuaXd0CWoLns
	 ghuvakys4d3JYLVMnB4kYCQjrBYXCnu4BamMTZZBk3PTbhCtf53Eu4O/HX6GKMtRMx
	 jXYsbdUCM8ttOXb+FKjaHxLnLnuGkc19EeNsk2MCUKGW5NyZzeIcb64vqfQ+NbAM+S
	 0cCIe1cxTEnNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1982A3809A8D;
	Thu, 27 Aug 2026 18:53:40 +0000 (UTC)
Subject: Re: [GIT PULL] Backlight for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260827124718.GG770273@google.com>
References: <20260827124718.GG770273@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260827124718.GG770273@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-7.3
X-PR-Tracked-Commit-Id: cf1a12e0804515e0ed8b3f50c1c32f7f425bd660
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7e3f4d9f425cf4c5577cd84a096e6e618488083
Message-Id: <178785681873.1798634.5967790285865706146.pr-tracker-bot@kernel.org>
Date: Thu, 27 Aug 2026 18:53:38 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Thompson <danielt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Aug 2026 13:47:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7e3f4d9f425cf4c5577cd84a096e6e618488083

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
