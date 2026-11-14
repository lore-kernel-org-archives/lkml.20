Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674958;
	b=2U/P9HBPmaXlHdi5KAAMH6zfJPqsIYHGH+g60f3DMrO7M0E2l9ijKeRLVaQvEq4euI8U
	 0rMYErBmM2GXSMw8JjFxgw2SDaisebH/5Kg0NX2nirw23IkzVZSyeiO/y6sM0saDn/yoH
	 hTOcXXUJCUfahgj1f/JWYsEH6wD4NFL9+CMswqqa+DJbLflVYsOAdf/dYyIaoDWbIh6WA
	 fGJxhI3ehUhUdLU1HvmaJgs5afNe706x3pkAA4GxBKgwd+Ur4Af9zEtPKTp/eue5gRlYR
	 ipNCk+EON/6wPuEAjg0bGGjvBGi7sHoD9Ggi/3r9wketaKbGk0W5RSCv11g1N3vGr2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674958;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=GFFDq8pJNZo/uEP/nJ8eiBqAW9Nsrz2VEU8NX0H+46E=;
	b=ntfAOfw54egy0ixhQJ6/P3Cj1wt73M6ipmDW+ijQMmPP1CareqydBmbEFxdf0ESLvcy/
	 1I9fxkPDsLZTzAQjSsQP3jugWlTNN871fh4ABHrw63GHupvdYxZPdHwEO+NFTdXnxVzMT
	 h97EzVPsqktv4MmAgwtxSaO7QTeOHNUpN2scPbxD1n6xSg3B6Fed23p4uNps78oNxuyz4
	 KkOc/VQTzF7sZFgWELihVwYi3YwARZb5tpxrt/AGcZA0wdG3xEPL0ARgCswJjxxfgvXan
	 ZYUe0fCsAuZPi6dh92SQV/6WqyP0h6qxpZLnUV4BeWnxE9o/N/n8KkXYOtHAKWknnLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv4ajCDW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E62606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv4ajCDW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4325A1F000C4;
	Sat, 14 Nov 2026 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794674958;
	bh=GFFDq8pJNZo/uEP/nJ8eiBqAW9Nsrz2VEU8NX0H+46E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Kv4ajCDWNDhAC5GBILJroZgOzx31Ur3TLYVGnIQW9sjMCYrAoqY6XUQmbMzFEe/e/
	 RogjjtmMEj+IVNfa62l60XuHHbJRo3TDyV0iXp9lZHfWzUNptVLvrRVxIkLy9EYWI/
	 8cpdn7t4+8j1xpcmyo3jdFiiyiIiadtycXnJhp7EW4FhgrfDoTuNDNTcDfshu7lPyb
	 u6Ua0rXpdme8k6+8esDqIQGeOB5q5xtUiez7RXWicCk8cFCDtX8X6bArek3NcVq6XG
	 PkOdLPLQHVnRiGDyMoiScYub/ZbEi0ZCRONg2T+xEJtpCzfMp9hYXRAaVf/4R+GGIw
	 5LaJlNKbRNYMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A43C380821F;
	Sat, 14 Nov 2026 16:49:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyPUacWoB9-tqq+hNDB2RexAuTB7Whp1hMs1d4ZmeswpA@mail.gmail.com>
References: <CAPM=9tyPUacWoB9-tqq+hNDB2RexAuTB7Whp1hMs1d4ZmeswpA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyPUacWoB9-tqq+hNDB2RexAuTB7Whp1hMs1d4ZmeswpA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-14
X-PR-Tracked-Commit-Id: 637c4514732baa5d19bb716c00d6fd67034f238f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b21c45d2151a2ce78806b4234513a1793525611b
Message-Id: <179467495679.2233204.6522313419302052392.pr-tracker-bot@kernel.org>
Date: Sat, 14 Nov 2026 16:49:16 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 14 Nov 2026 11:30:32 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b21c45d2151a2ce78806b4234513a1793525611b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
