Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907463;
	b=GbtcfQ29X4DDqihpRysrtB2gVgHZOlS2Wf/jh1CvQOTMVkx82Vl51WYociT4LaQuzz9i
	 92wNFnrKlvcQV65T08Nd2Z1P05JbzanTw4eScNaHTNYU91doVjF9Q42Dz7GHaG0En+OSP
	 Z9kYuwDu2JKN/Diq9OYosoUz7OTc6EisxcBFQ9oDhHlAaAHQ74DGzn6OEeG8NfgFGSo9N
	 XN9sewttJx9GFH2VJi1gAzj8fvPNz8DXlY6KTzazY9ca19CsJQH2p3JsGX5bgcKK3CrUK
	 G9WnzF/2Xm3sS4UVSeq1W9SxgxuUK4Qv8BYmyfnvXn2aKwQTtHkamEHCmKjkPEupCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907463;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FtGw49/ZIFoxF5wVtJVIx5KwPw6vIIWObxLi231ECGo=;
	b=nfSguNu0xEGnpmvL5tpgdzs+4uG0pe1tYAI23RBR/IqrcfZCzvEqOxcs+AgDdm6WK9Q/
	 gSOqMwaSDYb//oGZJ1MZU+DKAZWeZ2Zu7/lTYMNfZ70bs4YfMqB6DyUCYvxp0txeF9cQn
	 R1ZR6qeigXPfWra1++/JHWZ7htFLA1XYcbU+AMBm5ALXoYWsJsO64RZn3zIJPj9u1XzE4
	 X3lw0Sw6r2H+TGV1+x9MbFqVHoj43qZ4f4+3tf71dzGBEPBqS4cGlCmsDwew6qmAzNnkz
	 6e8RHNrlgMcKfMWagWLNpslozSE7qYgcg3Fu2cY9PL5VG+iBcD82DnGW+6oQK+sYU5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyyxmY+7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3749606A330
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyyxmY+7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAB51F01829;
	Sun, 25 Oct 2026 05:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792907462;
	bh=FtGw49/ZIFoxF5wVtJVIx5KwPw6vIIWObxLi231ECGo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dyyxmY+7PSXDFLB2QuGxBFs6AZmb53duSyJKpJTKEbjhy10/UTkIqhNSJNt/strhV
	 k5pQtS6E7ElCLP9op5Aac7UXWMtML6t3BOgWGKEk4+RWih12YylTCE2pSGzfbNKXtX
	 6RqbRxVhLP7FppN0YTizNw8eGr92uIKafRcAyv4/mhH+MQpk23Bz2lpupHdLSs4UM6
	 aswoY+k7h+b0ImZIj2Tku1+IFJnswKDm2HtEdsGZN6rJUbyQa1FlyoiTd/2mQ1seen
	 oG3B1yC8hbvr70sQHBbGcVV1S4gtn93UJ/eG0oZJMt5hdTOYFIhm5XUC/h8Oket00y
	 6XaHIOPM3VN8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE43D392ED67;
	Sun, 25 Oct 2026 05:51:02 +0000 (UTC)
Subject: Re: [GIT PULL] firewire updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261024115915.GA518900@sakamocchi.jp>
References: <20261024115915.GA518900@sakamocchi.jp>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261024115915.GA518900@sakamocchi.jp>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.4
X-PR-Tracked-Commit-Id: 06d410ba93d33a6c78e917d54e821355492e3ce4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 065af32bd4c4be5907ef45660cde59f13be08246
Message-Id: <179290746144.1990210.5586117616537380392.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 05:51:01 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 20:59:15 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/065af32bd4c4be5907ef45660cde59f13be08246

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
