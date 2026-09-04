Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C34EE868
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536528; cv=none; b=NQUaDHyzQXBpPAKh5iJSy3Onr8O+WvxNhNr4Z8IaALpYTWyC1tNZBmdBrsR0OzN0KHpTUN7BYgWhm4nPRzmUPMGGP9hJ85kBbwRBx1d/0WV0cCqkrtvh4lK6+2roNAaBa01zSuUiOhw57bxXMEjUhfMQBCyVMvocDBcGbwTLr0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536528; c=relaxed/simple;
	bh=DPhuY4RyDYwWD3lHU0D5z9Zx9wq1hpbXGeDwelVpLac=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KdPMJmVF9ngAMQY4U6r78CtNmq1ZFw3GFPS9zRs8QbF+0KHHL7v9ykQ/2KEZo+O6tWYUOQqCebcWDeurmQet3JY+hz1uDPsfwWvMeT2RznSlsd5bXaRvzL8BxTqxSq6e/Bl+wLcjulY4bZz85iE1sLaGr1T1HacgF9PvsOwyDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j56tYE0d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j56tYE0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706D61F00A3D;
	Fri,  4 Sep 2026 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788536526;
	bh=X8OwjpEc0kqJsxSxjES9sDD64gqatWUJMz9X+yMGrN0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=j56tYE0ddtnlpn0LSz7xpvt0vGae2JF+JieSppYgt+tsAU4oP4nbOfta9n6bslm7Z
	 A3tJe5S4WJ1K8YoQYqInaaxi2k5PerSu9iMya63ancBMNAiDuj5JbgNy3amPHg9/tW
	 J13BsVqJYmhnUmQflNLgD20VwmuMhvzpKEspp1vhpfEkbEGRTZaRtu7FMrbBFy66J4
	 lPOn/197NkI80vA7EigiSyAGifJAIKPaQ+OytVoiMbqmdJdXXc83bEXkJonZquLFCd
	 KG1xnB1VKAR25CFqj/KI+xEsD6ggva1gdbloYXsPzsC253d4JW99+q7xPrQnvWtWqP
	 mGX8UdI/8H0rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6C8A0392446F;
	Fri,  4 Sep 2026 15:41:08 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
References: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260904174856.495e1765ebaea4171d498af5@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc1
X-PR-Tracked-Commit-Id: 0c4256196b3a105307e2235fbfd85e768bbcdd0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 421066905cbceca1f78cba5f7d92b4980317ab2b
Message-Id: <178853646718.344944.12868413117474269569.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 15:41:07 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <ak@kernel.org>, Henry Martin <bsdhenrymartin@gmail.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 17:48:56 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/421066905cbceca1f78cba5f7d92b4980317ab2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
