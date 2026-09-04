Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EE501F4B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539507; cv=none; b=HuLgqmR72mnNh2LWoqpy2aKEW/Rv1+mKKJLIddv/79cZm6GvCFuFci+ijwCil+PrjMz62z3tOM7Y0G8U3u3t0/36jWBtKJiAU3InLovfCwupwbSKzrqhO9mCeC/lRg4jkcfwvANSp8JfBisnxbA8lqbL4QWiNODh0wHys5NSXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539507; c=relaxed/simple;
	bh=5J6DC/7LZJPcR9GxuHSxb774IyKyp6XeRughdzvJQeo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M2fk0hf+FZqyM94uFHQaMr04tR6/5icmxhgUFDijzUJl/MFLyR6azfi0cHvY5haYsN9zrmZemiBI4H3fnrFd8QsjugYpYaHv8m0fza4Xoe4f9VQ5iWeCcHJd6orqmuQUhoGFSVphg8kCz3n4j0wVdPWRszeMcU9woE0O5Rv/Rf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UttTYcR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UttTYcR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584981F00A3E;
	Fri,  4 Sep 2026 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788539506;
	bh=AAyE0h/kjKDzWqOveZMw60Jz4jD6J1HZUbcyWA3QLIo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UttTYcR+yLiLnoxMulcpI7v0AAUULYo133ACT6wLhlPyPpcWr2X+6+bMLhG5h1l4D
	 8uIZywwRS2X2T3fRtaO3AgYdUDc2TRFhSXcossTh0boSeVdZCpOmW5hzlB2Jod1xwS
	 w33NsMh/YirojKkoehtWXNKFsT97/jH7IbiDLu1qAWizH/wfS2GVLq6wJ2D4bbyqTb
	 O7eHxNxQLXB7/R6LwDG5bge++n8+0wsuS6An2ghO/wp2KXI0vCsX2mICRpVTf1+zdi
	 D/tHBOU3DY7e6I0u9N7GNXjWPrk0mfRvAzXz2mTZeGbZ5Ui2yXgly+FXTX8CMBasYM
	 8IaCpY648sk/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BA63924A4D;
	Fri,  4 Sep 2026 16:30:48 +0000 (UTC)
Subject: Re: [GIT PULL] ksmbd server fixes for 7.3-rc2 part2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd9=UQWCu+7da3w+pGa_v0kaYvDCYmvSgxb0d8r0hJ3e+w@mail.gmail.com>
References: <CAKYAXd9=UQWCu+7da3w+pGa_v0kaYvDCYmvSgxb0d8r0hJ3e+w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd9=UQWCu+7da3w+pGa_v0kaYvDCYmvSgxb0d8r0hJ3e+w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc2-part2
X-PR-Tracked-Commit-Id: b5ec6c462aab1062cf5d1e667ba7c6442f737055
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58f93a4b73a21d1c54457e4ff654d60029464c76
Message-Id: <178853944705.415389.10195823999237148225.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 16:30:47 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 19:59:52 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc2-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58f93a4b73a21d1c54457e4ff654d60029464c76

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
