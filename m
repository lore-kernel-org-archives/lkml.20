Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861B407CEF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787782225; cv=none; b=t1w7nK0sCjuL0XWRVo39kEPCrDugcQ17Mx9HtIXnGWggj2zd2Pny6JPelGKrHzTSCvuFJyrBG4BhEiIlkH5HgdGJnWd8xRB8ozeNRnEuS9LGKeRvMnTd6iElNnFW9c/CRhv80HyJdjZEraT8nK839TmNhMrWT2fVtB27v3mIJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787782225; c=relaxed/simple;
	bh=oAgcoj6nTg1ztoFz08igmLxovEIXr3rPZLhMZflgdFc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Boba767dhruW5AQ423kHuyxxN2Bifg5k76uLVI7On6RSs7TogW0QiqiP3edXcnn1cn5HgNEFlPqGoTcy/VGR6WsFD2TIbmiIbGgm3ScxAfVaJpoh84ySVJOxI3Ad8/nzdQvvFDwArwz97UbbTTc3HYU9VSzPnQc6sKj9nSLPyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTdEHeGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTdEHeGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCE11F000E9;
	Wed, 26 Aug 2026 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787782224;
	bh=k/Ynk0x5vQf6O6bWyoQGvR+kmpQnM0kC5uwqun1Viuk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cTdEHeGSbfrSmgROsp3PuIwDceMhbUjH7CwpCjT68uBV/jZlFy3qYt7Zatb5W5n2a
	 r8ebcTjwHuJ2IU8nEknxAGk/fRcDe8t0PdGYp34PWVqSvKaYxnuRGmEyJIAszIJPJ0
	 HVcLxcAwkedCxAq/mNcgqHhepnIeNbIGUO3GFzDvWqo/13rJP0rA+mgDa+tA34btcG
	 rCyFaWv+AOe0toHd9NjHev782bhdkISZlbefW5fbujvRMoI0Bkh51yiqW6rUaa4cZm
	 3pe/7Affb5pOPKLF4rwBpKyH13+EA7a494XM5O0/BJ4zx5fKH2RK0XC/7n/AWmv++z
	 XkagQ451eeJ5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C183809A08;
	Wed, 26 Aug 2026 22:09:31 +0000 (UTC)
Subject: Re: [GIT PULL] rv: Fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260826144817.7af76334@gandalf.local.home>
References: <20260826144817.7af76334@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260826144817.7af76334@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-rv-v7.3-2
X-PR-Tracked-Commit-Id: ab0304fd69b07605553e9f161d65ecf9ccc2e2fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b035a8be20ddfb932205beb9a1cbd80ea42e6cfb
Message-Id: <178778217029.915814.9411755440883091768.pr-tracker-bot@kernel.org>
Date: Wed, 26 Aug 2026 22:09:30 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, Nam Cao <namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Aug 2026 14:48:41 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-rv-v7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b035a8be20ddfb932205beb9a1cbd80ea42e6cfb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
