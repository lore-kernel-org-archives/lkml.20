Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE441D112
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347322; cv=none; b=tTY8sAA8JbOKdkfRlrapGFoigKikyGwCqqQJqTlGk9qDEXMZpqjBaIZwonY0w8g9t337JHbGK7KxopU6RhZD7ze126JvlVRTVye+CbCBiIdV+2sCL3VPVf07hf5orSHy1KYD9GmRKp7PVl7YeXX5uOC2/o0xhtxP66HwJp5+3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347322; c=relaxed/simple;
	bh=xNy2Vq6G0wWzeC0d4eBmUgiiITLY1M0pMbX07N7wgaA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=brvyfVBZNDsJ0ku12AmWHbqx2MI078p5hLYE8D7x33rT9YP8chz6KEpW1g+HiuCneaEnIKB1/yW2zBofHOUOjKHrJ9S7OMMYP7CNDaZhLfJjB9IwcT0zgdP2BLxEWNdDIP7TfnYELYxE9R3ajSfKHv0Lpwtj/ST9TWNtrn9Mt+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThUUYRvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThUUYRvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DBA1F000C4;
	Sun, 18 Oct 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792347321;
	bh=dtylZV/AmWGVtTyFRF357EljcovEylPs1r94cMLQEwY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ThUUYRvLVLn+Q9E1kkXUxM/EPU1XFz8GoJYlHuNBLR+FK+KJf4ALgPj0pFbS0iHkH
	 WpSu8j3W3viBBozg5sF/WnEB7Z4p8KKzfDhU0gt3l41u9igpfRcNGgx6eZ2zQOxYD3
	 O+DR2yMu0kMa8GszUOC/v5BzZwLbrywJleNJud09eVZN2RKfV+nFz+TkKVXoseNhAf
	 iUf7vhxIUX+nY762u7CqNRx1Br79AUWEn50680rX4p4nRI626p+AC5aqmbmM0/nocv
	 85ijHo8mx5kSBTkOnd2AIwiRoD1TNcY43RVR72RzBPaMW07J/CV6TL35kUo3MEcYlh
	 djHNWsXiScH0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 776C8381196A;
	Sun, 18 Oct 2026 18:15:21 +0000 (UTC)
Subject: Re: [GIT PULL] locking fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSNkdiR-oSd-QEu@gmail.com>
References: <atSNkdiR-oSd-QEu@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSNkdiR-oSd-QEu@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-18
X-PR-Tracked-Commit-Id: 7cbaa0f4579f48e92639c6abb761fdef8fbade47
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf20e7f96ae688dd8611dd6dce8cb4a036fecc72
Message-Id: <179234732007.1771961.11486939459759243901.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 18:15:20 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 11:12:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf20e7f96ae688dd8611dd6dce8cb4a036fecc72

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
