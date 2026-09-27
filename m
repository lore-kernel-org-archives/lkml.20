Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8B44239B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538563; cv=none; b=h7Bnu+HHIF0cRb6+oSmzej8g82xNc6hwtDJJ5+JsEGoBecPENGUJ1Mt1QIeUQARkFgrceCoiPtdHMS/nhhBbnB/LFI/tzve0nGy90pAX2IhCcttt4pbeuq02kT+3tuOVvptcuUuiW5kfbS2VJwKzurJn16QrfFx+UuMAopRjSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538563; c=relaxed/simple;
	bh=nN30n3qMk9JIS0Z47gsZD+5bXLtpBNGUomFc/N8FqfU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=i4FuNOQwaUdZZ6CnwOPlbU4qRDcgKElRrWCvIKU+VlMad6Yqs4Dr1qOsid6yyLshbS/QZm1YjtaEMJunh8EhIaLkO7FVZgDMPL16zOoh/D4xSRCWdngb4w+/eosSadNbe/C7QCFXWU7O90URz5XukCJq3VIweoy1qrkccFVyMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEP3DxGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEP3DxGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6151F00893;
	Sun, 27 Sep 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538562;
	bh=AJmAdIL2gJbtFW9i90jl+fqTMxyDRnyXjzLWjHeXqgM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YEP3DxGxZEA4jTrOsXhzrsGlHk+4IwcG7C1RUt3YrE+PNdSzNyPjIqwKIkLPjrwR6
	 PyMHCA4iNEBKJkq5+X1/MSFrIt4FLSYEErJA+aei3tMT2YjMLTqBYk9thXY15jlyHF
	 MaH25bRy4Ll/Uds2Oh8v5naXe10uqQr7kC3X4fMKOogWiXrx+TW98DICjGL3unXY/+
	 oPfDXHc0A3PTX7HBJNKHFzqXECnThM0htuFr9yBk9XPaPKj+o9r+xAIck8/+cqSgmZ
	 h744YWzQvLXbDV0D2iCJLwT+wXKg7xz7lvpaTVSxNW1BpZNuUiZcGjJdvC6Dnqysyt
	 gaDrh+LBJGNzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08B5380AA5F;
	Sun, 27 Sep 2026 19:48:08 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <arjOHApB_TyTUsCY@gmail.com>
References: <arjOHApB_TyTUsCY@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arjOHApB_TyTUsCY@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-27
X-PR-Tracked-Commit-Id: a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 673dab7eac1618b6622bbee9eb2aaa47817631e3
Message-Id: <179053848760.2777566.18190712393164325508.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:48:07 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 27 Sep 2026 10:04:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/673dab7eac1618b6622bbee9eb2aaa47817631e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
