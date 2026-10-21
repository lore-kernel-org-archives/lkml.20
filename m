Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619021;
	b=ZbnR3gPeZmCjE4dltCs65l/xvGnHBF9Gp9z+5lObKuwm4f/Y+YcZP39WJ8J9FjeDOaZ0
	 zVWCZwvHQWXs41HzkcNAlFBW7NCLMksTJ1x9Tzfwa7Mi00GAF/4InzW3h2IhxuP3Wj+WW
	 bcKgBO1g8uoyBLGB/ghsKT7fpRfLN9Plgxq6sawX4TIJMkY1BHdpfsuYEzB0XBbcGTp84
	 OAr5GWhhy/LLrdXL7+t45aqVmW4Xtv2sc/ZaYTBOscftM87QXiIulWFWcz8E+TmUukmzQ
	 f6EKzODbweAb4i3nV8KH5NZi7DhYpqPO39iCyQ44ewz4WLNjZCokq4ciC+jqkT3ciCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619021;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=czIOozgmtBt3m2kEGdImXsqF8tH+oxg7h8tCcBFaC5U=;
	b=bqrKhjqB2ub1M9z3MP5ZUzoREnLdi/7I/I4tW3NYWVCTx0DhfTn8jUkL6QyLWx1dmm5+
	 mSZz532b+W9PDyaCFJpiavrdFGj+v22jN04sFoH3DFIhO3Gfixl9qiOhtMrKJlqWGkIR9
	 Wk3uho4ovDTM+NjgTGy15NVOfKpZDmf4f4beMuAB96QD9JFNK1YYiCoaqtUfkZ4+Y7tEk
	 wodB8pVC2y8loeMmsIpmgjg+qn3TkYdpCbxbIyXce2Vq0MlB65Lme/6N8t96AQRM3Js2K
	 0KW/HnbAV1YSGt3qMx/ycxmc6Um90C93gKVKtsBb410AVLm0qxLInvnYBngN5GpjHvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IMmIQFZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C948B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMmIQFZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8046C1F000C1;
	Wed, 21 Oct 2026 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619020;
	bh=czIOozgmtBt3m2kEGdImXsqF8tH+oxg7h8tCcBFaC5U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IMmIQFZ/ns/e1mGDFhfj6XPsPPsfZZyb7RLSTji1ZLbaopFYSI9P/hfS0pV6fTsaz
	 qp5gJzyc8RxVHIzNvy7uLm48KKakU6Xl5ks9B/H86C8dTkOnbQOXzOK463cYE02UZu
	 sdvGzw6z3RF7OcryQ5zV5e6ceRQJYFK78ooZMo8S2xWEgtcNNXJjVqVndKLzGTAf2y
	 MtuSBim4ZwCVHM5HOj1gpTXLJkeH2lxgtNjJlAXWIcBLhx05nyId+6eJ7LB9760DWN
	 3ebHI2+iZomUBUPhunaBnUjjGEQVy82SFQoPpafLwWScsS9p37HX8eyqVvr2ttnukc
	 /qWtez/veO9Ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7726D380A962;
	Wed, 21 Oct 2026 21:43:40 +0000 (UTC)
Subject: Re: [GIT pull] irq/drivers for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257622554.804100.18080783403674327820.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13> <179257622554.804100.18080783403674327820.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257622554.804100.18080783403674327820.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2026-10-20
X-PR-Tracked-Commit-Id: 9376df3496753563e3d7f7cb5d91525f9a6e9497
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e973d4882230079bfbdc9f33077006bb50de700
Message-Id: <179261901907.1324168.16919184220627573207.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:39 +0000
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 11:51:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e973d4882230079bfbdc9f33077006bb50de700

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
