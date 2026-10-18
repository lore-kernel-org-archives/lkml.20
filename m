Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91A3F9A13
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347330; cv=none; b=j7bwGGyBXlS5gt5FgSGGwizmop6VnZAKNeNHeV40wSVZbJ2lvERpvfG2qeA5UFmqRLfc64P+ajUnk/3EZUXWLjGeCif+46h+2rWsO7HKB14RS++o/ovMwzhTEW9YYQVBgazz8WQ3al5SXD86WJ15CPVjnk62hpUvcLR9tdL/Tns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347330; c=relaxed/simple;
	bh=Sol4YuX8lhTpwd9gxRpKbDpmH2ZWaU8kKXPTiU1JvEc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=n4iMLgEFuOHgWKIFpe4zZCeQbiRmWB2JOgtB+L7V7gV7C+zWmk2rflirwh8PFDdYEQafONzQ6/c8laarYCgc4I62w7l+3ZQw35+9Snu64q00hy3jTRG3S8i1ifKvn9pIjs/+H/uPAqXbM43Ao6yjb1EvjJwrDxZRxq3xRtXMpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmPQ8C/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmPQ8C/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062571F000C4;
	Sun, 18 Oct 2026 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792347329;
	bh=5A86y7N16Pwfa8aPmDH3i/fLjMNeof/ADbcnEeYLC0Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=DmPQ8C/Tv9r5/TuUuXO3OrYKWYf1KHGBiBgFmNg1WeIWZrdm4kCGvB8RDblV4155h
	 ye4eimU6QJIlJRAVCjz37QmepxFHsW7t7qcI566hmgKGdr7v4DkUN1oYGGk2nqRKnG
	 sVmXxbziqRCp7QhlPoAmgennhW+fsDC3+k0bhgiHPdFyNGCteg32/yQYFNHjUGCiNG
	 Wdu4z6ACm6zZhNffHMcIaS1353kLAv3Zyx3UZX8JHzmVMFgf71bv//mTk74EFcDQeq
	 lmLxu7GpLWsRAmPmHFX66ms7i9b2AOTnoyIjRkn7f8nI45xUZD1gloGGJ/m1doEbNQ
	 Vy+0seOsYCnVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13CD381196A;
	Sun, 18 Oct 2026 18:15:28 +0000 (UTC)
Subject: Re: [GIT PULL] x86/core update
From: pr-tracker-bot@kernel.org
In-Reply-To: <atSj4N3ZQycIAEyw@gmail.com>
References: <atSj4N3ZQycIAEyw@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atSj4N3ZQycIAEyw@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2026-10-18
X-PR-Tracked-Commit-Id: 41d1119e2f8577b4bd01d31321c6761af9140ce7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 53cbbb09c1b87425cd7184f81ecdb830aa3b0b87
Message-Id: <179234732749.1771961.2812456247389352391.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2026 18:15:27 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 18 Oct 2026 12:48:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2026-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/53cbbb09c1b87425cd7184f81ecdb830aa3b0b87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
