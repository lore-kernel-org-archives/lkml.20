Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9035C185
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197927; cv=none; b=HJfApd4IavuqLWH3oeyIa7pnA1/Bf3TyPusQamPOCP8C9bIVVSiCb27Ijr+hhIZ81cZ9tfvrqxqo0ZV5Ix3AVTwHULoLbv7n8BeEbiHQWDV1RAzfofX7HGVDBbDn0eaq2sGCk4CXYVkN0eW4ardBzotBK8ElHQjpyetZ13SZB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197927; c=relaxed/simple;
	bh=Xca9+hl9F7+rfjckzXLPRDAKWdYvaqCANMz5IXpYUmE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lXaoTyWUK5KwMt3DFI9J5QZLUcHRBgI4mUqAfCtfbqYUXuT+igQjGCf2Y+PubRtgt/VZIhG4yCiMwb3Vh6l2lnKT8PSjSSbIoHulL6H0kA0udhb3CGTrfVviu4+WK1VN14kYKgsmpGavP5ft7Lu4OkPznMTKu/25nlLDUXNulxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9mkjkKJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9mkjkKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEF81F000C4;
	Sat, 17 Oct 2026 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792197925;
	bh=pGDiCSg9IZuVd04EsfAqCKaPzWjt0RM8RGTxodPhRIY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=a9mkjkKJpol6YJTiBUOGuZTsJvl9jjQ9JpB5yS79cfyRfnjkqZ9BHk+GCSpSHO/hA
	 66tUhUtB8tNgbHQsy1HsGk3dj3+bZ+97c+yEaEgjZnHKxVj7SBvwsXBTaC5ppbfo76
	 uglDcrtg8fppKYBsJfyFvqUYiGRnATC1dKl/le9teCGQ+3QZmdlAgxHIdi07G1ISSL
	 XdSH243VrDCzTOoBg9PEnaSecJasvgnyMl9bc+glmlZU9Ca3bKoGBTsCCpj+KKOENj
	 8btbMYaukgwTYUKGrK777gp6ngL/Ez4/FicdCI6LmWcM+FDXv//luVwS3QV89QuCY9
	 /VcU3mRTee4xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4761380CED8;
	Sat, 17 Oct 2026 00:45:25 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261016111521.6B59A1F000C4@smtp.kernel.org>
References: <20261016111521.6B59A1F000C4@smtp.kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261016111521.6B59A1F000C4@smtp.kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc7
X-PR-Tracked-Commit-Id: 66c658033d842bb75f81f20aaa4a378fe47be1a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d2fe9fd50b57fc2563f4b7bd2fe83906f79c81a
Message-Id: <179219792432.1032542.174707575583573722.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2026 00:45:24 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Martin Kaiser <martin@kaiser.cx>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 20:15:17 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d2fe9fd50b57fc2563f4b7bd2fe83906f79c81a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
