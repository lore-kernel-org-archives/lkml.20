Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7543B4EBC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110698; cv=none; b=u6mMqgrmw/iAVOP+TE/5lAkSrr/JkpNDV8oH5ySzo1ECdCfRGGnST8ugQ2PAThLgPbrW6ZszSSBLPK7VHYsW/VyfAblx1cNnuO12oGFjORCRgmWQDMkMBskwSm/zSzch2x0fu0KFclSdWkAnVcQ2GYVcH8mk9O1sIwii9Cjs/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110698; c=relaxed/simple;
	bh=XgV1XqP1qSqRI/ugHN5EmsaAqGMApVnZEKZ5WaXgMbI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Fm4Xi5ezaoEk84SHYkPfk7LlEnPD0XtK89Ulr6F253TPfti1f1oEsU6nzN34IMQb7gmlW2o2QUf87Wckw0eGxDBIUMoBuIWMlgch6cUEZnxrl59Xdawg5Vo3RXAvi0m5iTxfpaZrmY4aXBNdOYr69M/g1pp4/JTnm+G9AHV2Ptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ypc4Yh49; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ypc4Yh49"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7291F000E9;
	Sun, 30 Aug 2026 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788110696;
	bh=8m6w/aKZOxar0ZLQG07Td16cwt0WtlBWKP3PMFB5UAo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ypc4Yh49sPz+o0zT72BDgDClBiZBA0tc3P23yZotZMdfvjRxwCnUopNkthQy6/Cz4
	 BQd/6i9DvkUmFqTz5hvq5Z67d56VRYWIEz0kYPVXUU0jzLsCL9gfiUT5qXlOGP83Km
	 ICSdgiGLgNGQ0T0p5f4Ca2Vd37ToREbRsVJoDK67apOptBf1nzsTgcXfADCQnwonsf
	 rfLVcaGqkb2sY0SvIq2IlijKZlNJ4ySSRLhQMDk2VWthZrXiF5k6hexild4QFC6h2v
	 FkMxZxWG2+An55lmgPdWSBGgMD1bFjrSBE85w2sOcDcXmUtswpqNrmARr3FCGzOgsP
	 qqtgm2EfxadFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7A378380CEE3;
	Sun, 30 Aug 2026 17:24:01 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <apOZj2iOQp8cDjKP@gmail.com>
References: <apOZj2iOQp8cDjKP@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <apOZj2iOQp8cDjKP@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-08-30
X-PR-Tracked-Commit-Id: 64f74d8f728877858372c52067e5c0c091f8db24
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a23cbb05744b22719efdc34f9e329a120e81e617
Message-Id: <178811064021.3405738.11517355928902783477.pr-tracker-bot@kernel.org>
Date: Sun, 30 Aug 2026 17:24:00 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Aug 2026 04:46:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-08-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a23cbb05744b22719efdc34f9e329a120e81e617

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
