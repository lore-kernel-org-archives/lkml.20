Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893108;
	b=GxHAqZsZl7HRYqN+2Z41GCzc4CCFXnmVm+p3Ls1aY72MbcUzkWDv7aBQ36iZY2OrQEEi
	 Uc7EBfDz2flc6Y3pfU6KV2tv/a9nXPumcSP7mFaTisF6wEXE1I+QMPvahtz9okVTUjtKQ
	 eSBf8zXlrJ5xBTDKNAgqoDSUrLoInmlJkfmmp3TYk8DvR6toMKHqUg74Ojpb1PLiqLOIC
	 EzegOEZUWQFOVigqAbPIlzgGPbcRBSSOFakOpPNe8pvIIl0mP/KaT81/5+UrGwmlp0TQ2
	 iuF8aGKa1doYnrSN0XcF4l8xw/TeLCUbdDUjIqfTD1twGKJVTKCGsNxFcjxNWba4DJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893108;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=4ahqqR5P9Qm5OGHIZt2IGZqppDsXCRO934zl+/4LUKg=;
	b=EO31jDVCkObVSa+qSKmin8vyjTzgNmqszuNM8bxlhCb6vLQ1JI2CAjflW+GYH3SAUdaE
	 sZEaoClZ5azfoBqRrPJTgY1426dppWJlIZib3zxJWzqb/l5uD+D4rrnJlVEJ0EFUvd0Ig
	 F827QnoB4vmvb8IB+SqgkOdm6kY70yIKPkzoVzmulBmzEYto0uu6CYWf83Fpjc5//gP6H
	 etcxdlgKkDvOO8dn/97fqWIuK4cUthFlMN1NeNxPkVztvBMToatpr85CeGuOAgeMAkoKt
	 +BF9fY7LrgDuCmuUHeyN3X3YgrZHu3XURpL4eh/RSRUHlNxDYnMrXPi3W5aUdMYsYuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AJpm/2EJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B452606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJpm/2EJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4431F1F031E0;
	Sun, 25 Oct 2026 01:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792893108;
	bh=4ahqqR5P9Qm5OGHIZt2IGZqppDsXCRO934zl+/4LUKg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AJpm/2EJ1+xC20oGM2Zp6NQ1U+YDfxzwGyWlbrf9MW631TszAGLFUfVTwYYPIPy7G
	 kn7iHOZXAfcvgLWAZLWmUeOLzqxWlKMZvIDCfmLDcb1rYKwk/WKWr7awTQNmWtDBG9
	 aWKzGRDMuj/lALa+YxNaXB4nBXBdgd37tJjtJ7BupMd5erjKKN5l7I5XR3U3GTzDZ1
	 M4iCjHPsvV00guoSyKTOlb2CIQv13BUSqfGfaCgYHoOSv1bfd2E0BxIqvEz5uXFkLK
	 NR2+EXeSj79qEL4+lIb8UbWroGoKVyCY4aDFu/yDvxfNIuonLzFZUar67wMgjqESXv
	 RbZ648sTQmtkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 311AA391B1B6;
	Sun, 25 Oct 2026 01:51:48 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver driver updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <atoUxtzD4KuaE363@kroah.com>
References: <atoUxtzD4KuaE363@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atoUxtzD4KuaE363@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc1
X-PR-Tracked-Commit-Id: 985955d8e6b2b15cfd65b7ac6893e3a5a90c5870
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 330517c63aa9b48227b6ab45f01003effac77ae4
Message-Id: <179289310687.1865536.4361964475965058293.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 01:51:46 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 15:51:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/330517c63aa9b48227b6ab45f01003effac77ae4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
