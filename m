Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414E2E7BD9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666742; cv=none; b=iJNfjk/oZ0Koqbr+6ic5rXC5xE0eXl469S+X3lHF+vcIRphiw+f9ibgEwD/z9fJNF6SqSl1J2paTpuF4nb3WeRlYMDV+l15nt33fUcrkO3fBH4zW0jtSME0TXSRoDz3iUiNepCwcwWoQJtcpWvMCGdZMo04xwmh8pcfjI2+5HAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666742; c=relaxed/simple;
	bh=nPqjFwnZxxZ9+qr/IcvnjPOmAORuv+LNgr9nsn0DfGo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gpCIp32HF33qZfivyEIXJ/QmklPWpG9Bf4COxs92envSpg4ezF5pN4dLTxhDCbX4uAeLFyrUiYV1V5i+8LbsXVinlgtPeczDBnBeASgwztWYR9QWdfOJQVNuWj6ypiXKL4W4ImvgEPcgdi8HSMeI3CglugZSftjiDDG0bViO/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhxabHLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhxabHLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB891F00A3A;
	Sun,  6 Sep 2026 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788666740;
	bh=R2nPnXC2ajLzr4IbYwpXX1FqJlbrGMpt9Vngky1idUk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EhxabHLELmiOpDFywTv+iqMxmnVyyfqBu0xzV20ar1FJybfEXVa80G8nFRkgeaY8f
	 E/TJJUAPmVZK3lb/C/bv+xcmD3OHx3kFhloKXRgeTLi8SkwX70GGg54uBrQIjxoo+A
	 SG89hLW0QFuEzncIABBiyPMw6jlUx1RnqdwTi8waqTCGhj6ZxGchP+LWjR9Ue5YBbB
	 5aQR/T8t1O18nND0GOP0Tz8pNII6XCXhKwX1XyBC/MucI8pzHFrsiR5r2Tdvn7VgZn
	 /S1l9nvjVPIEJ7NoqbnHqQFfZEMz8/Vi3PkEOFBATtncx/QvbTpbdetfvelIEP8yIA
	 zHM6WZfR5zKsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199E139253CE;
	Sun,  6 Sep 2026 03:51:22 +0000 (UTC)
Subject: Re: [GIT PULL] kmalloc_obj() conversions for v7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202609042302.CE61BD262@keescook>
References: <202609042302.CE61BD262@keescook>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <202609042302.CE61BD262@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/kmalloc_obj-v7.3-rc2
X-PR-Tracked-Commit-Id: 3a2c4d55e32ad65efebdb6de44eef3bfa08bb49d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fc5a74b108fc90951890ec513ac81869f5eaff1
Message-Id: <178866668057.1434849.11544433788861142262.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 03:51:20 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kees Cook <kees+treewide@kernel.org>, Manuel Ebner <manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 23:13:26 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/kmalloc_obj-v7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fc5a74b108fc90951890ec513ac81869f5eaff1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
