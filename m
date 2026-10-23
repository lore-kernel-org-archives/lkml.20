Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794378;
	b=u6r9fXBd08cLCJXWgxnLSdzHQbqMoCQV7+JRrXO3y0gnyiNepIS+Vd4GaTXT1XsmPCMG
	 J9IFHv7mrqe4VamvuVzGTcIdCpR5NUNHqs0SED++7LnbNUW1vyL6w05NSxN8zbCJsYtQf
	 B5Nb/ZZWN9QY+7jBua3so8hvbRMwNlTyMuO7rNdV5l8ePh5cbMwgVwW+HAKVwBwdBkMVY
	 LhMRaP8gzJZHyG8BZmXnwM7bq4FSDTVrpPCtbUTpn4yhYCNS98a9Cop67jeKhTX/Rolry
	 4HwQp0W1I3LIOAnro9DrmU7Put5pMvnsv3Pr6aWVRLpdQKvgvlNVUNx5Ig8bcoUxwnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794378;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ejCPZnsbyFBKc3UadQjcdLssI8TJhD+5Po5qMH1m7xY=;
	b=mHKcBdyXVT+OWdhqjB+T7Y9Ik6Ndl/ye9z5k6rEl7Gt91X1qLO5HmI/v0dNbJ/IvfPLF
	 kN3aqSOlOHJeYwgOj7sfd+6joMHmHUaskCtOfDQlzLtm/jUhd4W9OTy0cXfQra0gKiN4J
	 kfs9CUrfXaZRavnYAlaq/5bAYJZxz5Zl+LH3fJvSsOXEqJikeJllalq0MFF7gkqUYvCmX
	 a+oMYxTGmNx+cU9bW+IjxzJnyvxy5cYg+ithkXsXOnjhapA+5arelARME8LKjzxwBMNKr
	 7FnW6EMI717IuySqfTV8jPOsLZbxZi7oceqNFi8q27uwRQEIXVcesuccHsIzGJYMPaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcnpVPj9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274860A2602
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcnpVPj9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC571F01825;
	Fri, 23 Oct 2026 22:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794378;
	bh=ejCPZnsbyFBKc3UadQjcdLssI8TJhD+5Po5qMH1m7xY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PcnpVPj9Wnsw57XeNH/3esbAM/uWsltkI9SP/JjAIZFSkqIElv0nOpKWbxgBdzrO6
	 x1ZDkiPdjqkWt1mP26U0ooh8ZG4378XNNQ0c46woEbiWh78NCcc8qetQS6fpMuma3p
	 efs6R3M0vJNlusiv8DS8eeSDPQhLR+ezTZhz5ARAZqtC0rP2Wt826JSRAGFQ/kvMd0
	 Z7vpoolvT9WKISiQZw0u0Xl3N7OprBE21IQhSClzsIOfA+C3jmGGBL1RfOiZo/GhPY
	 e8I0cZ++VbaaSyqT9M96PdWd3X1k4OpOgMQUD6B9HpaxEpt+fub6xUPUMgkRPhVgJt
	 vHatOMfI4J87Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0733E391B158;
	Fri, 23 Oct 2026 22:26:18 +0000 (UTC)
Subject: Re: [GIT PULL] ring-buffer: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261022161802.6d512bac@gandalf.local.home>
References: <20261022161802.6d512bac@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261022161802.6d512bac@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v7.4
X-PR-Tracked-Commit-Id: 453d0f47b174cac387af48d303c503b84f82212e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d1679c8713221d257aee54dbe3dc2064aff776f1
Message-Id: <179279437670.1300063.5145700111741117075.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:16 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort <vdonnefort@google.com>, David Carlier <devnexen@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 16:18:02 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d1679c8713221d257aee54dbe3dc2064aff776f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
