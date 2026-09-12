Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD923BD03
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226250; cv=none; b=DCrBwUyff9rOTEi4WyvJFJSQu0X8NkLnpTlOFqwUDl6FQc88y+aN8ZzSqMXbe0bClBoy+IdtYBuyUmyTK6f9fGU3P58XnOL11MJvr6jDF5TZyfjyfzcBC1iuILnZdvNTePTaEKeXnMtrLfJwRngAAftbfoAOfj0HKut2ErN91kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226250; c=relaxed/simple;
	bh=KwVANuRAOkwsHfFk/kyNvlmJQt5w2fgdMoN8IO5hPaE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MxMY1s/zA+eKyoHO4RKajCfbx8+Nxx0mrEdAV1lYMa4RLVxi69NM5DeaqXp+PztClL+S93CpoFwiRZvjIl0ZlrXQFZcll4wk5uT1KzhCzUF8u7H8XvpHFlzO3FVDTnhEnOUEmzV+fER7IddBqakEy0IiyuzfZGYo8e9Ck47/RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyUl9g7U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyUl9g7U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB6E1F00898;
	Sat, 12 Sep 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789226248;
	bh=lto7jgAgpRNpr8dUDCGeD6PixlreSfcwTjjLcpd+ft0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nyUl9g7U5EzWaPuVCjUCCso79OPZY31KJmFqiOLAE7E1QCOgF1ZIPGJB6FVT+1lFX
	 01VoitH6aJMTmpeASIRMYJjtcuRQgy38qkwWf3+/1fhaT/jrqfAvhZzEyyU19alz0P
	 zGzX8NN12ZkubLfj+NS4qmjfNMKCwXNxMQnCM4i9tA4ID7BnXYSuQ9dxQaZ4foTiMx
	 ro/q53LZ689UBo8VPbRQJ5iKpMHMzSkqR5Hrrw3t0iUhALElbuxmvDaYWqS5guE1gL
	 3bXVkj0Xs9m1oagiGPAsS7IYXePbx4C6ToF+Ou1opFl9/Ya/EM/22Ylk3Nr/mkHsM9
	 BRTjVU1HloFcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C8B380820D;
	Sat, 12 Sep 2026 15:16:25 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.3-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <96c01d5a-3000-4921-9775-025f9c4c2908@linux.ibm.com>
References: <96c01d5a-3000-4921-9775-025f9c4c2908@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <96c01d5a-3000-4921-9775-025f9c4c2908@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-3
X-PR-Tracked-Commit-Id: 9e5c53d75c560a058abef0e4338c5e3e52cb432a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 52311be52f66f1a3c71bc808d156482feb1eb79f
Message-Id: <178922618447.3511661.5005092280380751370.pr-tracker-bot@kernel.org>
Date: Sat, 12 Sep 2026 15:16:24 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, aboorvad@linux.ibm.com, atrajeev@linux.ibm.com, chentao@kylinos.cn, christophe.leroy@csgroup.eu, leixiang@kylinos.cn, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, michail.tatas@gmail.com, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, sourabhjain@linux.ibm.com, thibault.ferrante@canonical.com, yanlonglong@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Sep 2026 11:40:34 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/52311be52f66f1a3c71bc808d156482feb1eb79f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
