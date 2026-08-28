Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175D38DC71
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939471; cv=none; b=GSX0T+VjcPWdehRY2uP0XSaq7XwhtLaPH0w45mUFcfOWJIANp4K4kDxvmT4DxEDfKMnrcoDMBO71kkIjY5KuyVkvqf6EpOWBZxtpEytouUqzOTBqzdtESL4hXDLiPZy//RoJYWj6+k+EA4Z97c3akaA8NBbBUWNXkB/KZMKFZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939471; c=relaxed/simple;
	bh=ELXp6MDXuC6J7h3DyffnpPTUugWEIBYZM9ZMwxNiVcc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Pmijo80a9dcAP/ciSH8x1X8VpClKydhr7Xc7cPDhKL1iE/IBFNJbEN1flCg2T82p8a2w8OEfFIajtnCzeGg7qY/Thr7KtVGIYlBMOtP//1lQt0pHiXCnrIAUc6zlDIbTkCDPgt7Qpoa8X0NK69FiciK0comeJYd1VeN5aErBuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R54ZZDzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R54ZZDzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277B81F00A3D;
	Fri, 28 Aug 2026 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939470;
	bh=z2+Ks5onD6VZayneZORCHPM9r1UyFTApY0b6EIifr1E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=R54ZZDzHWsMsOAymAbmsnEbGWQAIjSn7sbAkZzqiF4GwumHubBC94q61AdmHEEnMj
	 GdhMRg5FIjYZBIIl6FyV5JfwtXEyWLUXmJbOZzC4hE69JyK7Gf94N+8jNrlA2od2mO
	 BMPcaBF254GcAI6ECbhK2s+2ZrpC6q7TVgodyGmSFJWiGbIg0hliBWbg1uSbmzLoCm
	 pD5xGB/iUojCKNFOLuRMHhMUcTciLqMY7hckqf1ehBhNmGU7zAvPIjbMWF6ybccwRM
	 rvw6TiY/5Ecde3EkdId8T9BXe0DPOuKz9Lw/rB6e/5Eb8eCKINorYFvgpD6fUt1zJe
	 0qgtYwS8fav/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B45E380AA67;
	Fri, 28 Aug 2026 17:50:16 +0000 (UTC)
Subject: Re: [PULL 0/3] xtensa updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260828100455.1303506-1-jcmvbkbc@gmail.com>
References: <20260828100455.1303506-1-jcmvbkbc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260828100455.1303506-1-jcmvbkbc@gmail.com>
X-PR-Tracked-Remote: https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20260828
X-PR-Tracked-Commit-Id: eb049bdbf2b98d103d93daef44a5e1a0164d01eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72ecc30d607f6c8ef8ac0d7b88b0c176a7409367
Message-Id: <178793941492.2708560.944572583470538969.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 17:50:14 +0000
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 03:04:55 -0700:

> https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20260828

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72ecc30d607f6c8ef8ac0d7b88b0c176a7409367

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
