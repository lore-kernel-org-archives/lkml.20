Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881D3F9F3D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329467; cv=none; b=brh4CtyMUAg7t0GK/MhzkfyViesfL6rYAsOR+8JBGEeu6gMZbzXTeUeSs2rF7WEiZVM2knlJnVhOKETsVW4oFMmvy+SJtD643iHGISPkXV8/hYahnSVgsSLJ5TGApqUChdvqkUxTW3CZvYTzr62smLPsm0t8jHLCl3E9IDyVaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329467; c=relaxed/simple;
	bh=Rcj+NfsxfTKTqnEEjzZTbSb4BIbSYx//dd/jDaBMahU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PYSL+BHB3zqppfJGD8dLg0a8SZAJ0dIXibT7NKsKuP+aZFzgrcMD0/OHSaKDBpJWaubY2dM1DD6yOH+1ks//kkDXr/R51R1FOU9flKC5ai29LPf6a/+z9QxEl5Sn15jYexfBqwMJPgdIpvhZyRJYR9d495DzndQ8aP9y2aRJyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4e+dTc7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4e+dTc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA161F000FF;
	Sun, 13 Sep 2026 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789329464;
	bh=0hOSqgIgx2/NJIj0is7bOsdUlspQlSwq7jQ158r+XTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=F4e+dTc7tzp/QET0yoV05efTsBqcgPaHw1MvX1HQWdr6FUfZ3fyOmk9V+iaCtu07M
	 HkYP7t2TaZFhwS3pmGi66jRrNHcqUwTpijT/q9a2JyZPQHHxJWh5wckThArj6J6rAN
	 E8pWbETZB6vDlXYu1+9CazqHmf4MOs3CSHjcwZgYmuuFXvOZiD8aOlqe6WwWcGtqqv
	 Ivk2+IOnOr/opVPT6zGB5aTBKXKsra8GQW3tJYmW+EB92kt2OZiQ9QroZ4ZScCh+HR
	 b/KwDvPttAyvTdjRSkf6kH+QfR/JEeXBtQ//MmjZwgF3x0uJLzcgHnB5i8YFO73FkM
	 ZD+bPEzuNzCFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199CC380A961;
	Sun, 13 Sep 2026 19:56:41 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260913133506.601e5bd9@robin>
References: <20260913133506.601e5bd9@robin>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260913133506.601e5bd9@robin>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc2
X-PR-Tracked-Commit-Id: d860c67c051685abb0460b593b193f0f45f4fa92
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22098763a10d9c1340827fcf6edab66f153b27f0
Message-Id: <178932939990.3933600.17374899408318406781.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 19:56:39 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Ali Ahmet =?UTF-8?B?TWVtacWf?= <aliamemis@disroot.org>, David Carlier <devnexen@gmail.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Hemanth Selam <hemanth.selam@gmail.com>, Henry Martin <bsdhenrymartin@gmail.com>, =?UTF-8?B?SsOpcsOpbXk=?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>, Karl Mehltretter <kmehltretter@gmail.com>, Leon Hwang <leon.hwang@linux.dev>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Vincent Donnefort <vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 13:35:06 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22098763a10d9c1340827fcf6edab66f153b27f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
