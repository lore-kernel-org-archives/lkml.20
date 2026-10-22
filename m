Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693897;
	b=Mg58Zr//G08f1uvn/NRQ8EFBQUMmKNe3WGg9HqlC3DdQ9a7OCKMQTYOaMDG5K4gmicwZ
	 HWHp184MdoilxeIqTJzGkreBMxAWM+4BZcI0ZQuPveT6raXFyc589WGAqFfmV6zN/c3es
	 8zR1Ei8YML0g71tMJbyPN8PRX129MOWmnZltkzIhIdthAdOZCiZEg3EIT6Wa2sc0uQEPB
	 8295QnEAddO5gdMpuuRj80KGrcUrr26OE+b9/8dG0xYgTw858GO7moiy2JWtOoluDkRSb
	 bdzLvnoMNZ/4+SGHFyjCRStdMW1TxFsKJ8KQnK035jMa38QThsypUiKHQ/YqAwb7WtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693897;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=houCfpQumQUvgNpKAR6G1uMk9OC0BWmJbHWo907DfxU=;
	b=Dd56hM7OXaPxvwqMlDSpfWzhodvIq91Su8zX9r/KT1vBMvaN9LgfQANOkFrtVIoxB9Dv
	 Jjmc0+douVShhwbks5JfJAIS2vsUJfaGKnPRUVLB6VnvkXFYIB55qIqbBGVLn12jXO7qz
	 4uqOG3O6B6b9G43p1VBufFuY2Ylo6GIpa7XOkUMlal54m8cHBgyonBvK/f+uyTOVyJss/
	 L9lcv6/eZDe7iTK2KRHe7+GE7e1Ue5ZUO5U10z6b1UZGihVcaFFf1Jc1ngr8kszUX/sEv
	 ADSkJn4i00s5ZMpNbnRE8lctHTb8sF3AnN2meZP/OE+YDb/3nnol4Gkgfi5oO8RPILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSY0SkPV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA7606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSY0SkPV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E31B1F031E2;
	Thu, 22 Oct 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693897;
	bh=houCfpQumQUvgNpKAR6G1uMk9OC0BWmJbHWo907DfxU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=oSY0SkPVcU+zWu1jejWdElrlyEeszdhAXeGj2zO09r7SsaFMR0B3co1iy8xBmjPP0
	 nGz8+7abd/Zig+en6pTlihgGtVNegVLDwXvP5t2yVeFmXN2vrcgAumMFcTS3adnRCO
	 fABdRYR7d3Bfolozt5bgCUL2A9c1JiAQiDhdL4I3XdNwFZNaxtMYgOvcg7O10nbkLL
	 WIdyrJOFtxOiGoySfSDF9kMVX4EE3fnRttFeaqBcBrhTHN6o7p3TcsiSANqNVc6KJg
	 qaalSGpLF8bdmuPBbjaS0+jy/m8kMPVFv7H8Y0zaGZ9cS7Mb3riIpt0Zo3d9r7YK5u
	 xpuUCNO38Yg6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 650F1380822E;
	Thu, 22 Oct 2026 18:31:37 +0000 (UTC)
Subject: Re: [GIT PULL] uml-for-7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261021081440.697408-3-johannes@sipsolutions.net>
References: <20261021081440.697408-3-johannes@sipsolutions.net>
X-PR-Tracked-List-Id: <linux-um.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261021081440.697408-3-johannes@sipsolutions.net>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-7.4
X-PR-Tracked-Commit-Id: 4ad423aa2108485f8bc5dde51fdf9c1ed979ee4b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7cd80b8168c9269e4b11788ce815c0f446ab5b34
Message-Id: <179269389626.87271.15718849308077192326.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:36 +0000
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 10:13:21 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7cd80b8168c9269e4b11788ce815c0f446ab5b34

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
