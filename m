Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAB8472
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790999249; cv=none; b=fLpUVut91R6lzLYatEoGF8OrxuFLc7HVZaCu6ooMbfGjIHy1KjcE8YczB3WGOSb+O25Rousaxuc6ZdGUhm2e2NDUajMKiaYC6qyLtuNM/NEmgCRKiSACxI6hDA3qEJ2vFsmptAwkpVzTyirTGOD333olvZeGsZ0v9Kk8wNs+RgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790999249; c=relaxed/simple;
	bh=TVAzFKX0XuRuwKXcDTw5Hrj7j2dB+9u4UiSkz2l1fdI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RJ5FS7AZE5hNBF3HunZngT6jTeMlD/1geOWnCC6CjFdRIe4e5/oPBTMxlddQtgKEhCCF1fy3pa15hsPe11DkLf0of9YSsvvU1rFAhwjAvc4JnyUOfVFxOxjW3skyGyznII8WECHqrU2QA0/rYa3EQPRA7oyPyoJJcg24D4IrkIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXdeAe77; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXdeAe77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060CD1F000FF;
	Sat,  3 Oct 2026 03:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790999248;
	bh=QTpk9BcUWiTfdpWQqYdMqMYdlt25XSC9yYvpwYJdD4s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HXdeAe776w7RI71QbMAZrdEKxinWmHre3/UIjXB5FvuCxcfumIpQyTiHr+aB5/Frf
	 RcVSsOUuZeFt+agGLeOTUEyFFWXo4Ziil7WHeEd+lZ7ipwdgShi8IkQ6D2fHwkD7Qk
	 GIQC37GgTkF3t8+RXBjdno1nqvc1r8S8EGmb7+h5HnebV4HH36O4WqbNdp/NKtTUWl
	 bUqdYlzMb6SdZZR6H01d/6hfZnIwASg9RqJgdcKDOoRQKvZu1BQN1J1Ao6kd9ggRDE
	 l+TjYRzXHLXvbc+cPcP1OgyPUEXAlGvu/hg00TEM+gxnKDskAMWazDyXG2pVOnVVKw
	 xyB2jz7tPiXCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F162A3924443;
	Sat,  3 Oct 2026 03:47:27 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261003092428.77fca44f8fa79bf95a1711c1@kernel.org>
References: <20261003092428.77fca44f8fa79bf95a1711c1@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261003092428.77fca44f8fa79bf95a1711c1@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc5
X-PR-Tracked-Commit-Id: 7a39c732a22ec4a369af9e19fbe3d666ec83eec4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
Message-Id: <179099924645.4128498.5181937937926480103.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 03:47:26 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Leon Hwang <leon.hwang@linux.dev>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 09:24:28 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e767a4ea70a3992c37ed604157d32f0dfbf9b1e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
