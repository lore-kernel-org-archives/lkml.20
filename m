Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80453EAC98
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968586; cv=none; b=ttRXKjvylFYp6gaPGZmWG2X6kIaHeyK+wYMM0eMkV5aOzZE/J0Rgdh/CgHvT9ueQZ4i5aFWvrdmP1c0HzUHOSnDjInbZf2Hcs3cczBocea8If6aXvjZxITjeGwtMoW9exXM3Q5ZytwOQ4g+sgP3cIW/UPGNmXDtScsvEMAsLtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968586; c=relaxed/simple;
	bh=OjSCHV5Ke0OQuQaOXnEDR0PPi7Jmt5G0t0y0kzfpp5o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WE260x4u6N/Y41feX54k8vklLChWVE8MQOMAQ2EsbSX7wxG1sAasXYZScUMsXo3BrnKQL2PWd8zEnIv5rHTnwchECqecxd0dGXs6P9CQg4YXwnhBatrcz+KKVxAjeXkkrmYZjNbUyIo3M1YiSeQJ/unE2Ecj8oSemFfSYaf9yfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEXP7pYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEXP7pYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD6A1F000FF;
	Fri,  2 Oct 2026 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968582;
	bh=WrO3IUItpUs+G2wDtn3mFgQ9UbgiaOUM+MVxFKTnMAw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TEXP7pYFznLCTZDDXIzNsHDRp/FbFsgFyl85o7g4BQ/LcugusLhqW8DruLOpU6118
	 ApLTcTuGixocTjn3phTFNJRg+YFBX8Ywhll616C64yD51o6mnH9Wmxsmw2Nt7l1i5S
	 NKiz6ZAr7KC08kP+FJnaEXc/BUs2FrKVLDIkkFCKcBXtO23jhx2JbOpNB62I2FjSHV
	 nlLm/CSojXqUKuqZfsNjKxYx/TyFYdDEBg5n37crnSLN4CgdDDRdhS5GRXXBiCDFSu
	 HKkrhUdZh4cSSuSg85GMvlphOsZWZYDeI+iq30sOvISNoJW4q0zuUna+MNjHOsd8TQ
	 1ClD858bjMwaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F83811A6B;
	Fri,  2 Oct 2026 19:16:22 +0000 (UTC)
Subject: Re: [GIT PULL] random number generator fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261002140110.1481971-1-Jason@zx2c4.com>
References: <20261002140110.1481971-1-Jason@zx2c4.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261002140110.1481971-1-Jason@zx2c4.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git tags/random-7.3-rc6-for-linus
X-PR-Tracked-Commit-Id: eb13a1ff271b0d180687eebb30611b0b276d5193
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac7445c28e7a28d5131bc9f9a143261e79495027
Message-Id: <179096858131.3549447.4986545066893410087.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2026 19:16:21 +0000
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  2 Oct 2026 16:01:10 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git tags/random-7.3-rc6-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac7445c28e7a28d5131bc9f9a143261e79495027

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
