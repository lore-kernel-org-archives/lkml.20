Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9848641F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044697; cv=none; b=eQ4xlpjNu5hXIJV4sFLGAkIJhJqhLAmdUS2vn522hiPZdC3WBniI1XMfSgJ7Teh1Pk9I4Cd4HFND4n/rFHw0FFSFCRAZS8ygaN+HGkJnrqRdnDOclnASFN90/Krcct8CC0itb3KlW6szkbAQDAbUYI6QjAyf2CaWQ/F1W56VRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044697; c=relaxed/simple;
	bh=uA/CmpvwQsW6bjQqz8fyb8lJvEtW2o3b8ivuVrLoUsw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UY6Lq8fwotzORl1N4Mc7EdWNv9esRjoyAbB9Cs0kDV7FvfSNkGOKifdYa601RGZjE8qYZbbf/r05MQfgNdZh8JZUKDw2OJz2szGXbiu3qdKvitmOt4JXFrFt2jjD4/U4G8LBex0q6clWTWS9Pkw3NHA04ZeW0+bNBpiftGX7pME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5b09+wZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5b09+wZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054131F0089C;
	Sat,  3 Oct 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791044694;
	bh=d1SWAoj5TWotxPnyexFOg1ewueEwFcC5yrKW7YERjV0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J5b09+wZ9ZKgBaa50qxeQ4/vjkwjPsupp9O7zIdrPGTY44FQMzJGafXXP5K4LbCWJ
	 hSuKfdyMQ5kgTY2LAUT+MffRaFycsYf6Yb+orr1FNRHDBEyGEC6bFDDgE4exzVSctk
	 JYSHWLsD95gZLimeJ1bJxOVdfG7c9atMgDCys+8bHdA4xUeTpWCyQsp/9BnfleQ1kF
	 dOw8mw9uO+sfUvGCo4NQxuVxq98CbI5xfB9xsdjyO0UWxHhHdwS24TdfbxH2aR25+9
	 X9VYOKpEZYm8cEph6RDt86sgA4ys6SxvFb702khENN2Bsu6OMAbx+jEkZz/35++sEu
	 FqnJ88xehf6EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14E73924475;
	Sat,  3 Oct 2026 16:24:53 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver driver updates for 7.3-rc6 - try 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <asDpUM4XCyJOh0-U@kroah.com>
References: <asDpUM4XCyJOh0-U@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asDpUM4XCyJOh0-U@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.3-rc6
X-PR-Tracked-Commit-Id: 8e242ada093af7d2ee82037f09c287fbc6f1e3f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25d576ed11108470d0999054265108400db1b881
Message-Id: <179104469243.131116.11276675155721921547.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 16:24:52 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 13:38:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.3-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25d576ed11108470d0999054265108400db1b881

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
