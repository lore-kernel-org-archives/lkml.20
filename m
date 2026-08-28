Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF935C68B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939411; cv=none; b=C7beC5+vUQICiJSmLIEb7ovDajh23XWeROZb5+26kwotXQeeIHzXXkVMSYMlIbpgFeQxf2Ug8zdVhx0XHe0Zbdfi/0s1l2d5+jJuy1Vxtxv8zOJb00Tkfhxi6M68YOWiij8idsV6i9G5uK+5H6Fk5KCKWNwMhQSFEODL2TbCAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939411; c=relaxed/simple;
	bh=snqAfZeT8YH0RK7AolpyayA0CV9flwOfRAGCM3WrsNU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=igAg/IQS7TAGWzYap8fP5tGKV7l8BesdB4fgpNX4BRxymeVSyrwdaLPzrkGSeNkobbPrYP0GLluMu/HsDML2KO8bLd6v5z5w9KCNOlS/QWAMc2Z1wvsd7qpB0pfddFqzXtE89bdbWGy6BiDjv5Rl6BeEVTtj3rMUhgVlqKPtVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYCjkXJw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYCjkXJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434451F000E9;
	Fri, 28 Aug 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939410;
	bh=ueT566sjBORq18eNHJc/KDUX2nEdJuI5A0LGDnBZhM0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OYCjkXJwjLGZtuC2TuEeHjm/EVqgO87BhpIyOXxkemewND+iT9g9/h3PBGwjSKrzF
	 o8MCh/obpIMJjMvdmwowlyyJojB+iXrkZxt2NZ/ABSCXhEWGrsXdMA4a5iJLhs9qGI
	 LkDn2XKRByRKywbQ/EtkjuKUcQ0Jq+7JOliz//6Ffa6PioMH/XGo7rLZVz1BdOKz6p
	 qS1MNanUFQ+45P+pSDqzqheNDjWcrITktWIoMs3rbW0h+mtaA/4QMFcEcPFntMVDmF
	 dN4bz13lmhFs2tLfwYVs5Qgc/UR8KHwmedOcmaVZjAziiMtFy2FcM5iYsrem2EEqSO
	 zv6fvqCPZW+NQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569FC380AA67;
	Fri, 28 Aug 2026 17:49:16 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <apGVNo7DgJmIQRHm@willie-the-truck>
References: <apGVNo7DgJmIQRHm@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <apGVNo7DgJmIQRHm@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 2bd533739234d79b74afabfece1abfe9c6d52c83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d607ae0f7d629dc068aed5f498e24d3e9875ef1
Message-Id: <178793935490.2708560.12637339671283035073.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 17:49:14 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 15:03:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d607ae0f7d629dc068aed5f498e24d3e9875ef1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
