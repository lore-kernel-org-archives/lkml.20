Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813837F33C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862365; cv=none; b=HJSBm1pURWyeiL/PAP6aKNr1CQyt1EKAilXNPtEQX2btqlRLpeSv0QsJ0nYiUGrnLONgBwjwOIuCS/0xjZWpBrclKbEMiEjot1A5zm0lDpx6sN6zpJCn+olrTHyY09TDJP1KD8bxl5wd/nmQkISEgj3nhDOVAR7pvCUzLZORbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862365; c=relaxed/simple;
	bh=pH6e5dXha8sLROjwKizLbuSYY2s3Ahezlx3UpArjuqA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rulxmektGOELQxj5282LeqPRO39voiUnx/Z6U7gnoVCxqC/nYG33noblZfYDJWwhfuHkr0gGr8277SrL6RD47+zQyFmJCO/fLkVO/9D3UHXqFpidvslAsxR0sR/VqWVPspa5HMHwuNwFYRlP5XTdUQHVxee17mgfXYZgA4QgOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjYtOuhZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjYtOuhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5271F000E9;
	Thu, 27 Aug 2026 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862363;
	bh=Zxxw1FHQmdTvR9tpmgFoXR0yuRfstC9cPaTH3tI0EoA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LjYtOuhZyS3kZjZ0BbfceOTzgfPNzfI9DPX3TYSlRucZs94tt0HBxreeuDPIOmNJh
	 vGDbrmkLoY9pYQIsMp/bWIh6S6JJQFNUdMXFQZxZzbjhAvpATZEvAzlR6VBw6EULFO
	 PQgroORQKPmumfERTyT+cqFJsLCpOPu9eMIPlGmN4blXl+5uPCsZP8ggA7wSAOGzAA
	 XphGgQUbyJzfb58WDerFdeHxED+uzl6eoFpHYDUXqpn3scxgVovToXYbMiRPxfH8zj
	 WdPslSNORA+NFO9/Ap/AhOQD7fl9h8YEDmsrvA5ptu7FH4ybcIdyKd6c+wHV25mqFg
	 AFhvqXemCoMng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56CF23809A8D;
	Thu, 27 Aug 2026 20:25:10 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.3-merge-window
From: pr-tracker-bot@kernel.org
In-Reply-To: <3b632d103057ea6801fc357dda0384fa@kernel.org>
References: <3b632d103057ea6801fc357dda0384fa@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3b632d103057ea6801fc357dda0384fa@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-merge-window
X-PR-Tracked-Commit-Id: 44f7b876b7c6c7b3a219b7a810d3d9548df21540
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6253a29206959128f5d99a119fcf29bd7fb3c106
Message-Id: <178786230888.1831091.5015687660011020778.pr-tracker-bot@kernel.org>
Date: Thu, 27 Aug 2026 20:25:08 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Aug 2026 14:23:14 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-merge-window

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6253a29206959128f5d99a119fcf29bd7fb3c106

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
