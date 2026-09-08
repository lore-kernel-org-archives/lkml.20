Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C033E36A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886186; cv=none; b=WrVm7jENTC6qUIWOay0j0ysyiS+mlwJnU+TMFYrFPdDrIKz/AFP1Pc3RCAt5P/FEt+SgXqwZgfxkoADM8fPTabjs8xvAFyFxo8THQC9Pt6Pfv9D6UD/tAC1nLnzpv/jzWvLWr+H69LY7AIjubBHxoEqZjx1rMnS0P458twfmWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886186; c=relaxed/simple;
	bh=Q6XoWq7wHRYgI3HY7rJQUNRjq9S/ElwIiSvehNKdYUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZMs4uDHfoapIvGD2uxWTqgErh59HxDTW1wrmK2LVjn5i9N12IV+jJCYFlr934HX3HVMn0Y65eM6B3PoOjbRrf4AdbZz10VJGITx5OGYoznFOa0LEcNqzIqSWm5WYlxlifXAP0yQ7cNcjJCxOf4wPhFcx6681IFyQZFMT4NVeVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLgL1NBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLgL1NBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4598F1F00A3A;
	Tue,  8 Sep 2026 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886185;
	bh=WxZ7LbfHACs3pzhWJ4CsjpCYtuYOS4Xcie8f7D0g/lk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XLgL1NBZROxtoqQzvxJKsPWibG5oG+VwSqnsTZhsAolZXqXqUPCt6H8diDodCgK0m
	 mUmpEyuppxKREBDbBHNgb8iOLKuoB8p+DoJDewjkbow+SZhTDKMx2HuZJ2fXQCu7o0
	 Z8uBKwohCzF6dnsa/ACLJ6vPYARjLfhl7c4X8Dq83rgjZKzDcjWpa6JQqIatfEwzGw
	 vd19wE5Cc6RKOZKFs9E+dUDeE71Vo4yCAGXy8lncQHASP4onxC5kHo+h4ANt2x0eSi
	 vJjoo2809V5aTPBti7zVk+VYN2HNQsWrbn7p9wwTIQkFREFf341N0a4cG13WKbPVwe
	 uU4r5TcIbmaSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199C039EAFC0;
	Tue,  8 Sep 2026 16:48:45 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.3-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <54e891f8-d549-4ab0-91ea-999d6e8dd385@linux.ibm.com>
References: <54e891f8-d549-4ab0-91ea-999d6e8dd385@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <54e891f8-d549-4ab0-91ea-999d6e8dd385@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-2
X-PR-Tracked-Commit-Id: 45a5f7285f835adb3b74c9344c09a7bd2c4fb664
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5acbae5f7eb3d5275120abfe698c394b7325dcec
Message-Id: <178888612365.3639424.6482272206920161969.pr-tracker-bot@kernel.org>
Date: Tue, 08 Sep 2026 16:48:43 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, chleroy@kernel.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mkchauras@gmail.com, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, ritesh.list@gmail.com, sbhat@linux.ibm.com, sshegde@linux.ibm.com, thorsten.blum@linux.dev, yijiangshan@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 8 Sep 2026 12:00:29 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5acbae5f7eb3d5275120abfe698c394b7325dcec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
