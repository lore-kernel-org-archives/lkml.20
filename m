Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A037F30A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946659; cv=none; b=XkZ35tk4K52YBQSxOzFM0omF4USlBi0kSyKFhTxrWBsCIIk+bfyQGWMf8tcDQlkfTbR9NBDUPfhKqjwBLWpgxVzl+lC1AoQ69XwyGii/tiMFrqAxzF+uqnExuZuZ1IcpqsRbiuuIgZuNMnxYYiLzKAvqnqePXmdF0gFvFklRGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946659; c=relaxed/simple;
	bh=8ClDLlyfGTmcoIq8WE/Z7ZZFW12cu0/2YXRSBiUh7lA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nXoDDalwIZugc5mzR6bxRRHBm+fcU6R8BiU6j2Du87Hshhs+zzrMCpV1BpG5tPZ8Cg9SpejSno5mGCy6DjgDteIOBW6YRYtHUtNsbPoZPnbaLdPkKjFySBmdtnXplaLrxxwe92LpK6ncI9cdgRbOra8rI/Z1qjFxB//0AG0xHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1d1cw4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1d1cw4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD7D1F000E9;
	Fri, 28 Aug 2026 19:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787946657;
	bh=G7D90wuYUMGOL8VRkWzB6ufGelXYfw+2tsOaPS3rspg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=V1d1cw4XnsumXLuz9FSKfgnL2euAo/Pc6HbU7fFQEzSmrHcJo3hKHXOplJnVrVSHF
	 qXofLqsl8CYXye126rvfxZN7ikGc5U8HxMVczmkFAFgQdan52RQi/H37e/FI+Fu/aI
	 UmOl3AfxUMKIYdrKoenE0AwCVQ4lLEp+mBQejbIFrvg100nhXcZ9iNxfotZutaurBn
	 mInoTYn6WzFIeH5xiSe65Kko7tL7XvhphupxIVy4nkd9uH2IFEWq6YV2jjNdxoDKhc
	 AYWCxyEVco9EW+E4fLkLYfZjwEBnJkNfo9ruu7sZCjRkP/c2PZdapEUsMXJesgJK9e
	 Z37xKtKtIm4eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A8B380AA69;
	Fri, 28 Aug 2026 19:50:03 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <7545938.rdbgypaU67@nailgun>
References: <7545938.rdbgypaU67@nailgun>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7545938.rdbgypaU67@nailgun>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1
X-PR-Tracked-Commit-Id: a5e0055eac837a1168c781653943d4a0d9920af3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce727a090be04dc7c51edd5c0da2a41d2fb6e106
Message-Id: <178794660253.2763027.897003071588049712.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 19:50:02 +0000
To: Richard Weinberger <richard@sigma-star.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 17:00:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce727a090be04dc7c51edd5c0da2a41d2fb6e106

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
