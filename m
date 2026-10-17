Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED1363C6F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197928; cv=none; b=qAklJ9fjHE6eJ1gwdJKOikUhc+lwcjNNax9Jo1J4D/YG33dCJ7Lt84jXPE0WxvJx9ETsE9LFxiMuaLYeG0U3IGOunYro9qfNJzhNT4+1ImcbrBOKrr/MtXUxMV/uztIz1wViYzCgFNtN6v57y4YU1+1m7Nl7DFVfrUIW6KyiE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197928; c=relaxed/simple;
	bh=mZhJhu2zt3IIUeA2KCCk16DLN2fy+RAp0rT22V7mlEg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bc8geiqG0b4Ci/TtZpaiRyvplea0LXyJVOkg9eAcU7SXxgJVEiGMCsfIp+/XF7LhstS8ArK4JY0m6WtIKgP50Kk50sDKXUbsovxukIdiQltY7aP30uVDpqObWDFQlNoWvHb+Iai3unNUNy/eKJ9uv9PyuYMJuAPi5MUWDlb01HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFdzXOki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFdzXOki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FF61F000C4;
	Sat, 17 Oct 2026 00:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792197927;
	bh=N134vqPy2jHmda7htrPQeDqd+DMMP2TJLZpX1yr9wkE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HFdzXOkibuQ/wAjqWA1Sw4jL6PaqEB3Y/wF5UiM0WNOK6f/eRVmeoRzqq5He5YGqO
	 0YUkBOG8x++XqbP5kjL5hyfdLVtGmxAWXZdFgDAr4QjKUJoeI0cjuE08lKzDSpQ8UQ
	 ImZyU7alApT6BkGQ1L0Gcsf8C8jA3wAK4h1JP4XXn3DLPyiJJjfoYm3jLat/IaNqnc
	 Lh6M19rqWug5vG2BSkbX+TsrfL5IeOPb2lo+ZpiG26ngA8cCKbWkee+blKMV8OdAFo
	 fLHJWntzRpR8JFdHS6movr1t4YbsWPfsDF+jX9M8Gd805Wp9P1NK4dsmSPoFLK+Jsy
	 FCJVyWXYZo5BA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772F1380CED8;
	Sat, 17 Oct 2026 00:45:27 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Final fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261016101022.7db98574@gandalf.local.home>
References: <20261016101022.7db98574@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261016101022.7db98574@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc7
X-PR-Tracked-Commit-Id: c47a7b11bcb3d45e29723afcf6336866476b1d08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2c278bc37b52222e53d5f88971ffcfacd6c97be
Message-Id: <179219792596.1032542.2120440001390545816.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2026 00:45:25 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, David Carlier <devnexen@gmail.com>, Dmitry Kandybka <d.kandybka@gmail.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Hao Ge <hao.ge@linux.dev>, Krystian Kaniewski <krystianmkaniewski@gmail.com>, Lee Jones <lee@kernel.org>, Taeyang Lee <0wn@theori.io>, Tengda Wu <wutengda@huaweicloud.com>, Vincent Donnefort <vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 10:10:22 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2c278bc37b52222e53d5f88971ffcfacd6c97be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
