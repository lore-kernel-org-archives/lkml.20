Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794376;
	b=czAVKOht/6TtZbpfl/UQASi6SLT1faAtiUXonpTH0lJiyB9aaETe3ZE6s0RaQmPoF2Rr
	 T73qrucah8P+DtO9E9NWpg8K4azgf6H6k5bmGTXJcIjV/eGDG15MZbjMXtXeTFoPhQNcB
	 pIoHRtkcvXwUBL3Cj55sNl3EM1fo9/352DwAGH1ws0KAawthDHeu0Wvd32HXu9Pm5B4TO
	 lCFXQijfNR10nbhWru4MZCNmKH9Xa22EmDu+6TiLvSlL5F05Ne5LKNZqrCMkkft/7DY0y
	 4mcDQZokUfahHywHmhVP4woi5IjAq34RQ0VuUiHbHMzosXXPsMrKrcIos2Z0hc17LWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794376;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=wxtKmK056OsNkXeV1ZLWalDOQLXtvAE9MRbG3v9lsGs=;
	b=zSqHTmQ/fGJvSYOCeLveRrAICxT/yoVKz0mDi91XhjGIrPhj3Rug2A/O3z8Uco9Sk7wT
	 pjhK+eqyr7BhuQSaA4pAztJ/Yn4r4rCPZaLtFfsbQG7M+hXgYnXfXyxIAIZLUQECTVqnd
	 ALGAt7haWR+wpVhEgOssMWZE9KeJ7C0NWVHdWgAqUQkWzd8QiuLZCQynntpRqqKgCdkyN
	 A9FwMPGqmCrHoa4Xj9cg0Dw/FHdcRzZ20RAnzeUA9+M9KQ5+7uxMb/i4DBim18+/S2GR1
	 dq7PNsVsXHuHKh5wY6xIa+KWpN59RkHpttq+xBnoSM77VhGjt6GvtKe7b3O31vRVbIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hczqC131;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32151606A334
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hczqC131
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F56C1F01825;
	Fri, 23 Oct 2026 22:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794376;
	bh=wxtKmK056OsNkXeV1ZLWalDOQLXtvAE9MRbG3v9lsGs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hczqC131WZtTmHkwSLY4ZnZ8AQ9LsiFHbyJPG5kpiHe+tPQOe064V/urhhtvGzXqv
	 3Bx0A0QnqT1V4vG3wOIuhPTV82V8IRiVzegmIEOiK+0N/z5hNwSZBHZl9bJ3hMVRog
	 BddM+O5qLsTNAVL3Dv/SWVl/PPS5lr2riTLrnflLdUfajSyZ7x+aLk5wWMWg+kf9XU
	 x6Av18Zgtvh9uJjJzORsppXNVYT7k72hACnvDPgAapDwFK9dGFIJoUEmHSmeoBI0l/
	 540xR5d89BfzrnLzb2hKIVKzQrJ52YWGqbW6bToAnNPXeAKXSTmvS5p6chdQAyLaEq
	 kALg6fXs6g/hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 07322391B158;
	Fri, 23 Oct 2026 22:26:16 +0000 (UTC)
Subject: Re: [GIT PULL] ftrace: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261022153944.4e66e8c0@gandalf.local.home>
References: <20261022153944.4e66e8c0@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261022153944.4e66e8c0@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ftrace-v7.4
X-PR-Tracked-Commit-Id: e1f339ff3b83857b93baf8b88186275a413d445e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b8a7a86e48927472cc84463c1f038783bd52093f
Message-Id: <179279437467.1300063.584242301215279355.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:14 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Aaron Ahmed <aarnahmd@amazon.com>, "Jose
 Fernandez (Anthropic)" <jose.fernandez@linux.dev>, Yun Zhou <yun.zhou@windriver.com>, pengdonglin <pengdonglin@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 15:39:44 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ftrace-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b8a7a86e48927472cc84463c1f038783bd52093f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
