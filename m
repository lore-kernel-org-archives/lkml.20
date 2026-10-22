Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693914;
	b=1wshB/1CuVPq8+3p18oW7UU4hzNfHUj7Mo1gTHcn07024uGwNlo71b746YpVZnuFpIo/
	 pTzw4H/fTZT+QwQpaECAPrG3+0I7pzbQZCweLb8O4snlnmXk++PZMs9my0vDumHrN7IM1
	 EurG6EV/d6aXdYoxY+RURjFrlJ8IB4DL9QTVRaEOEbew8tmulmV707UMAbuZ9YdnrwKlM
	 /BAmGv6jDz8SJGR16XrHL5dBC49b9nanG0tFs6ywhj4xq3EWWj9sxG2bCpyhxAjF+fZvc
	 KumaSgTTuLm4wqDL0uWTSNQaQKx7t5Za3/yD9lzoKaEbWgEij3lH/q0B092DPoDR9Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693914;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=keAq1iPxFEo2evsJ0qd0k15BhRdGJvIBe4spZOxl9bQ=;
	b=YjkyNp6CMQ4t6TDxRSKDUDsaGyvDPZmspykeaDbMWs2DEzU6nXL7BD1J2XBOw1b4/jV9
	 nMU0D3iF9YniIJa8eba2JtIzt+Fcejy1Lh7E2ldjcQF5gKoHbwYIjBae4GCxUSbE8XegM
	 EaPJG6jyZAYgou8Zax0HUou3+JsGxW9iagOvLsxgIQ0hsmCSZq5K6LuBZFba2MzR+09Uc
	 C9Zqa4LeHUW2BU1O9p+wpRMsdysZa9jESwcG/kAm3McWz69Z26EUnyZdGuR4QDdi3cLy2
	 4NBV7bEUTeWNITd3m8K0kyHOv/53sjXBgONgGMNigzG45BD+/nFajT6wyPoFhC/HCrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iV1DGU+X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83860A380E;
	Thu, 22 Oct 2026 18:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iV1DGU+X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8733C1F031E1;
	Thu, 22 Oct 2026 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693914;
	bh=keAq1iPxFEo2evsJ0qd0k15BhRdGJvIBe4spZOxl9bQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iV1DGU+XTtMbsy/PFXpzXcOPXJlskwzMfr/iP7Rs8o1GoOXd2Ic5PJAS+ANsWkEOy
	 8f8s4q4zh+6qykZrnzT2D5ZwQ70uE5mYz9VCUPbo0Lo09b4XLRHztpoEvOSAq3SpZ1
	 jhLx1/RFb+tXO4z1Q3Bd5po2TBnHC9/jqNW6/8wATFptfHE0Pw8Vi73ccT8OKZLIeQ
	 WjCoHJiWrP7WtXwWUHX/xsVyHgnq8FJ6r+Yx8IW4ZREZBaXO9KYbqFZzrfRgJTBVxt
	 D8n6Zb7ri7Rb9OofSEQj14lHPJiBF/BgBgzVtA3J3BpNrmqohHmFFy6lj/S/PY05t5
	 jXH05j1BQdZAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77F69380822E;
	Thu, 22 Oct 2026 18:31:54 +0000 (UTC)
Subject: Re: [GIT PULL] hte: Changes for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020191505.3080042-1-dipenp@nvidia.com>
References: <20261020191505.3080042-1-dipenp@nvidia.com>
X-PR-Tracked-List-Id: <timestamp.lists.linux.dev>
X-PR-Tracked-Message-Id: <20261020191505.3080042-1-dipenp@nvidia.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.4-rc1
X-PR-Tracked-Commit-Id: 30167fadbf87fa901a2fee49c30a5c5a506a43e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8279fb300585e0a8ee69bd0a12d343e59b6fe7be
Message-Id: <179269391310.87271.16260644557732058834.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:53 +0000
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, dipenp@nvidia.com, linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, runyu.xiao@seu.edu.cn, panchuang@vivo.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 12:15:05 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8279fb300585e0a8ee69bd0a12d343e59b6fe7be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
