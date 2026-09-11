Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4F59E33F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158359; cv=none; b=mpGM3OQqEvS5P9h2yqZTVN6/s4xQNPdQVx6WME9kZ2jasmONGW60KgHsrIGxitPhh45TepRO4td0//pFcwVhb77UQNll5SQi7ikctTUEm9wTBHdSE9eXEffhOwdMpz65DFLqkpLb2teexmBvCOmVycoGDrw8+GQf6EWxJyw/W7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158359; c=relaxed/simple;
	bh=q3d2l7yD3Ldd6dRPxZj+wofyB1bwgMOa4hVjnAQdsWc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k/YYzPEDWEj7+C7boKuKc294azKtymTxBr6pHse+iETCBF78OrQkgXF70DyrPYN9kEZfnZO5ShpOgsH1rqEFfxRnFKx6kYC1fqNHFehAhLXRY+Q0vLsue3SmaaWEt5gz1zevnsexFWWISi/ST/jPuGmdKpwipZCtkRWpseVea9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAfYmrlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAfYmrlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A7D1F00898;
	Fri, 11 Sep 2026 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158350;
	bh=zs6IpTeCkOFuPIwx2qA8uFPMR9hOsbr1wK0dg4OkG6I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YAfYmrlEp0dpeLYk+BTMudVIqg4WCZZQuelaq49bcFx+2sbNzy8QK3OUQ4p9aPEtK
	 TUY7fQbr895JLqi8IlMg6wnFVk10LMGvsE4CegR6/uux9n47Kp7ed4a7vNPkYOVJOh
	 bUj0DhyRF/VH0GR30sQSxEc6olvMpF2yEyTyFdmq91kPNQSe/K3Tmd7mv6zG0hPmO+
	 uxUvUmYJ3TzkH8mV0Tg3CuOruE71puRweG+a4jT23j1XyGSHwZZS45N/eoPh6+S4po
	 aLhxCrw1jcYYjY4//7Ex3YEbA99RjS8NoLZu+MvKTM52exviFckjEPtPACJrDbztte
	 MCZDx8oHmDWiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B183924451;
	Fri, 11 Sep 2026 20:24:48 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
References: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc3
X-PR-Tracked-Commit-Id: b94cec5761d22624d109d859467d7d4ce0a1b88b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 827751b699b79a6e569983359c02dce67f81b94c
Message-Id: <178915828749.3095760.8641038885777827919.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 20:24:47 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 11:55:00 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/827751b699b79a6e569983359c02dce67f81b94c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
