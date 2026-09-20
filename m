Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368E47206D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924977; cv=none; b=TU9N7Ik0HcaGyunvQmUBNML3Z66D2N+bTpkdzj4ZHfASbFx5IgKfWpeB7EkhRCZgK/N1Q7+odnvTwZIRSP5yjWEbR6WM/aRvaSsgKg7S7aCxcaZaqMeug8Hk3BcAhJWJjtikCUJHAkOF3P3v3zDP1LSrIhBtwBVimjT9LFuJEdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924977; c=relaxed/simple;
	bh=5rBCnZyuJAE2tldKsZWwNt6YfHuKJtHf+V1KcSRM9ok=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=U8v+9/G5F1NUu3FrR6TlK9f8c0482ZeJwuMgN2qk+/vqn6nnUYQ9liBvkczGBSXz6ODH9jkBxIOof0xZ9OdTKjZyqDKSfSBeb7fDK65purBGyqqqWFQUJ/aleAJ8lsMEenX2OPqEQUpTZMMue9zZuSw1MNI8TsAuwEXBXh6o5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW1HYMHI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW1HYMHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3A61F000FF;
	Sun, 20 Sep 2026 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924976;
	bh=fmAOXGXxG+Grjmn4+IGjVNtFx4EX5lImxumdQo0vZ5g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IW1HYMHIbXKfAdjUQRyPTfKODy13TkDklyELIDoQPc2hQtKZ2vYbAqUzFJcwa1qhr
	 9CnQAk8fEwgt4YEAtUYWvR4TkVl4C+OL28BG78oBDtC9rpOU3rqvSIzGZF8pTS915V
	 m77H/V/mxFLOZf6eRCio8LkWwMEwwh3PSEm/t9V3c77J6Fp21cGeXOnHSfiPyVjhU6
	 RI22XUIQk/BGDxr5LtRHAOLbsYXB4WH+YNzcY/nxwG4/FYEr372e5UfzgqGxYMElH0
	 2CBjTRz+JGEh7iZXfyxaXfa/vBmYBEDZ5M34awsUbnhEzyDMmZ/ltxnduuZlIYm7/e
	 gqj1BwDT6QfLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F239253D8;
	Sun, 20 Sep 2026 17:21:49 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-uep_xbMeGoGTF@gmail.com>
References: <aq-uep_xbMeGoGTF@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-uep_xbMeGoGTF@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-20
X-PR-Tracked-Commit-Id: 63edf5a009ae366369a1b484cd9ae4ee7c51946c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 156fa7417fac89fd9dcf3a4ee88785ff90ab6411
Message-Id: <178992490823.1735599.11726364941631916247.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:48 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:59:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/156fa7417fac89fd9dcf3a4ee88785ff90ab6411

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
