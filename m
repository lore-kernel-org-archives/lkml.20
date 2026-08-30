Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8D352C35
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110694; cv=none; b=CH7EL0FBQ27SgsVNinpPDYWwaxUu7B66XiuM+6l8nDuIaaOX/qK/uLVuGctlVUg1YvZfjQecrgVbMmnhrmZz9/CYtoRdqUqgkDEpxDfrYiwFUYAC6qzJCdwU8Nr82Wz5+zX6DGh4w8WoIB5f1AA0P7cuoRMOpeIesIlbiNtIids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110694; c=relaxed/simple;
	bh=m/WdKfz/U29Z7HIcimu5CurjHWVETbXvltDSls0zEp0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nLf7tH8v2VYh0zfmNirwKrBOOpGuFc8YYoZ8R1kuX8DFUeNMjmpbGJDEH+F81ypBfllP8bg8rBVzmHMSMfhAB6TCuhcdiyMa0x5OZy4MC3EsJ8Nn3RbCEBoRNOHoCjbuNxtVNCLvp9T8IFrmAGDu+x6opo8SiISEBwddsoD21RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coEtS8HE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coEtS8HE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7121F000E9;
	Sun, 30 Aug 2026 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788110692;
	bh=mCYS/1Fr/ysPdUTYsI4X3TrZxMvdL6moD3aaQrPbklc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=coEtS8HEz8mCkLiK9OcSXSjiv8xb2xaU0JTVahkt68AyZudbZMG9c4AxDzJ5WQSAC
	 WNs3J0AxzO2UNOj8fGUOkJTGxXNUkICTj1O1gawV+lRyTeKHV7IvO3RhAIeExznXt7
	 kZ54mjP6DP1vYfwzS0O3qdhfwg63demv4xqN9XOsXwWK0R46w1941GqKhEbGIVph6W
	 1G/2/MCqFtRdW/ZveAOzgAAU6wZ7tJ8B7bRMyj/cLhOdEMfSQpE1l9AxBq606cQ/XH
	 6vZ0l55tiIjknqTAdyP+Oodi5Zc9wDJ8BZ6IJZjxfKuowR36WZILpBzwU5/Xzmn+Qe
	 Ioc3acC65bxmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A2A380CEE3;
	Sun, 30 Aug 2026 17:23:57 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260829211522.6623ee83@robin>
References: <20260829211522.6623ee83@robin>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260829211522.6623ee83@robin>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-2
X-PR-Tracked-Commit-Id: 5eab74874d11160725c42ab676ba97a797a362eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 034dd340b08be1f2f0477ad16131d609f9dbd53c
Message-Id: <178811063623.3405738.11930677609776903450.pr-tracker-bot@kernel.org>
Date: Sun, 30 Aug 2026 17:23:56 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Deepanshu Kartikey <kartikey406@gmail.com>, Haotian Zhang <vulab@iscas.ac.cn>, Hui Su <sh_def@163.com>, Ivan Immanuel Shaji <ivanimmanuel1234@gmail.com>, =?UTF-8?B?SsOpcsOpbXk=?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>, Vincent Donnefort <vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Aug 2026 21:15:22 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/034dd340b08be1f2f0477ad16131d609f9dbd53c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
