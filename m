Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149874;
	b=FnVbQJBv+s7WXJZ5Mkhn7AIlmnK567amgdpqD5KilbATe55A/MHcSNaDpy7OypM/ySIW
	 9/GcgbLUCdLWHH1a8V0aEcXqV4ZxR/Y+39fyjcJVi9dCRhTTwXlSeEj+ieLtIFIlHB69W
	 pKWnS0z5+Dkgs3Uz5e0lSpCz7k2QrQuvYDc00SHDc8VeVz01ay853dRSWg5PzD5tH7dfi
	 qVrA8TYbhQ3EpIhKXAFIWJNeLBQT8DdTas7B4ZUuLh87Zyt+KJUcRrbBsAlctLTh0fQFM
	 BZyY+UXF5fG9cG/PeiVpgurTCtntDZC8GwZaH/wX9/+tSNNOappA/k+GIThaXUBDsGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149874;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=78/LL3b8c67jYYjiAU/Jc4njOjQxJpfNJjONqrZsEKo=;
	b=EJiOmNTJxPjwqbgYlKZHL/VOqUmF8ulJOU6yIvJEKlgllqlD6/2TIaiO2jRi2gu7U84e
	 n9MEhHY7udXfbLIPaKxz2Cy8B2dF6zttKenqInKYLO+JwoMYbSGpQMni07QYbyg5RspPN
	 01aDlMx4flvJPEeYSVyWFmdGLrlEmUO1c5apj1EL8h+hupLCB57qGDDP2RPeooMW7R0FO
	 QOGXTVApTpkXuEhUcNkstqCxyiHWCLS65qSzvAXHVsRagiaxjzLxEHjr/vLYJP1Zc5cvp
	 x6QmP1YSEmSYdxdf9WooEXXc26etGul1ZMCUzG6fcIjql3o/0OVfEmc1lFAVNzckr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yvi5DHCT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yvi5DHCT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DA21F01825;
	Wed, 28 Oct 2026 01:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793149873;
	bh=78/LL3b8c67jYYjiAU/Jc4njOjQxJpfNJjONqrZsEKo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Yvi5DHCT2hNethZohFR5In1OPrlAoEFIj59Bw5Wn/SPNrgTFUAAs89SDgLRfY/nCr
	 CshCrM2ZxYF/mIW9+VOm8XPdzyzFIMyzAycrd/UfE33yA4Y8x3KFbPgspQ1lL82bSs
	 rnQ79E1UUBk3YSooeI78kfoL8QjNXVza1PnFEOPmtxvH429yXpGXTfC09D8eES/g3M
	 uIxOE98Iskx4pXeiH5Rgv8Mjjtt9l9rupeex4pO6IobcItI5LvNgk6WHZOVzFpI3ha
	 f3GM9g4hqoJMD29RYbI/GJ0oyWAP/M96QZ3uRZXE9sWUaWGbaJTv1onJo0A6ZKOoGm
	 rKrrmJSIRuxeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE7793AA9413;
	Wed, 28 Oct 2026 01:11:13 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261023210925.3dddff9e@fedora>
References: <20261023210925.3dddff9e@fedora>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261023210925.3dddff9e@fedora>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4
X-PR-Tracked-Commit-Id: 1fdc4164e488916402badddbb1f51e9380dabb91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59a02493f3b68fd0ad68c661393f680bcca5a85b
Message-Id: <179314987249.422389.11253753620886375720.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 01:11:12 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, =?UTF-8?B?QWRyacOhbiBHYXJjw61h?= Casado <adriangarciacasado42@gmail.com>, Chen Jun <chenjun102@huawei.com>, David Carlier <devnexen@gmail.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Haoran Wang <haoranwangsec@gmail.com>, Kyle Zeng <kylebot@openai.com>, Lee Jones <lee@kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Vincent Donnefort <vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 23 Oct 2026 21:09:25 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59a02493f3b68fd0ad68c661393f680bcca5a85b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
