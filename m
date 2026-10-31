Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405947;
	b=ExXS2QYcl1PtmApnTp9i57mz7xG48PHsQugP6sCapiJGEuGCqwy6pFTm4cxr/1Tq3oB3
	 4rXLzjALGSE2woKzHMDGKcuiCLyrKIza69tKE0ll+bEBxoU3b0YeJ7SHyttHQjQL2VS+b
	 UXd7NTQfx4gx37Hr58vIw/f+7VBiQDOuH0ICdw22kqZwNe+1C+40PjPBjLXg9hB9fDdnK
	 HxPw9YUCALdzhP64OdfNGXenrgCYGLuiZR3xvwwsaNTv+DcrX/da66FCGBqjckuysm/Nj
	 t0+oa3BN9ajyDcBwtwXeVrQV4TlYu28HNsuFgeoFBf4USbPm0bGIyG/3gKF1EXSxWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405947;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=/1AfTZ+gev4pcECnmZ0T91za69FFMRcL/oV2z5grZcg=;
	b=W7aQe241No9jBx/xxQHuZapCeIrE9dOm7TGbuQDt252OAsTrEo9F1sXu4UzexmTMt0+Q
	 KsMKivaxMUamyWqLriOJUT0FlAfKgbzfEg1XhM2usW29udlBdfcAD1PvvhGEO2I4leoTo
	 CEKEJfcYM3MBvI0dVZwbEVvxrSmPLh9HL/5jRRatjrW297izXKlesSJEKDUsCYsmChP5A
	 GfiaH/pxTesrnkrLIef6lRhDWs3Vejcnwz0uHJIUb+iiLfvlRGHvQtJGNxOHtHKFHFo9n
	 B6e03RepLGZCZ8VXO8bmiJSlnnnvIDvMYQeCL/dYOY3R3bH9Jtm24BE41O/rZSpBShQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7Dp9ckC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71488606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7Dp9ckC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B74E1F000C1;
	Sat, 31 Oct 2026 00:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793405947;
	bh=/1AfTZ+gev4pcECnmZ0T91za69FFMRcL/oV2z5grZcg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m7Dp9ckCuYHQCGqtDOy5AL8CaFZBCr6V9k/TtGTzK1KewpsrOrg6fdMPpPYl1qQy2
	 jfP4ysqiI3SAvaFfsdT2mxk4URJnh2gGtnxcmOoGVHTc5c3XEqFTY73Rd08nEpHHtR
	 X79k7G4V2hSVAo5M4nzsjQF1hw/nK1awe8aNv6NsBXAbFKCn7FAF/Itdm2m6qHe8Z8
	 q+g2AEj5UkUh6LQ3MZrFiX6CatZCkqbi56RoPPTSlvMZsenY2u5GKyk+Q17tyNnwXR
	 NaHcdmh/vO47tSQF3KYu5mOGL5nI6SU+Bh4xxv+skROF4NnKPIWGm1FDZfF092gm/p
	 14/olnM0Jv7MA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 402543800478;
	Sat, 31 Oct 2026 00:19:07 +0000 (UTC)
Subject: Re: [GIT PULL] ktest: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028213621.31707282@fedora>
References: <20261028213621.31707282@fedora>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028213621.31707282@fedora>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git ktest-v7.4
X-PR-Tracked-Commit-Id: 5b598ba5f3bf367944956cee59c6d078c53ca694
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 453ebbefe2e504057cdcd0e422ba39ed8b99434f
Message-Id: <179340594580.1860975.14880323678551640360.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2026 00:19:05 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, John 'Warthog9' Hawley <warthog9@kernel.org>, "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)" <ricardo@marliere.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 21:36:21 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git ktest-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/453ebbefe2e504057cdcd0e422ba39ed8b99434f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
