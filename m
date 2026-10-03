Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6542903F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041009; cv=none; b=umiBBwQvJys6xvXl4oh8JTZH42R1YDOypCwmkAIZ9X0yP9MBgxASg4eIT2fhmRX2ZVa6BtF1yubKyEqR84omszowYlJw18NHi0utm7dEUd7kH2tl8tw0v0Pl0h9blIKvo+HDdHttINTuQkW8xCT//Wg5/SW0Q1Dq4O/YJICRykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041009; c=relaxed/simple;
	bh=hnOfPEQ/SmKphbZ/FjEaBudR0bb5Pydt36P1B3gIV84=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=V2eOx6VuknN2ZUxO+LKDa1gkQ18nRVjD7eDDp9swRvVnzNUn38vRVZ45NiA2IC+KgjhibnsTaujaIlPCnxlFQiUuoqx9lyDPsixr0oTwwdyan6UG/5biZ/n0tRJHYyO4TANNmZSHTJRy8kiMhlsUXqhEdYwvtTZ7OrDQdNw0ssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDgLwrOl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDgLwrOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433A31F0089B;
	Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041008;
	bh=dZFsMAAio4MyynFkVOwcTl70yzlCaaP6RPy4jzGQ2V4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bDgLwrOlpJKHrIZOIejcTJ3yI3BC+pP6zepnXJE8NBinApH5b1fk0u7UuJ/tNPopP
	 cQHItu/XDEDXLqUiQPDZ+ilZz9Sk0YgyJCAWlffm7/DU/bU3QC1GVTCwOKo6nG0kJy
	 45PXr3C0KUjo83d/Q0WgpuxYS/FvXQn2nBhpH8eUzAyFPpK1TTSNJEV6vynkFcxrK9
	 HYbwH4ww4svosJk+45G6ivZFmYv5Ssjvm+THtK9aC7guy4PaPP3TevsUd9ImtyeAc8
	 9Phj+9AMKyc+pzcOKDC3Y4pQCw8lSwD+ZGbZji28b+k0FiEeJ+7dIGxcSjgq5KjLAc
	 6qwCA6lIinvkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3F73924470;
	Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <asC14CHKGoRQLv6n@willie-the-truck>
References: <asC14CHKGoRQLv6n@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <asC14CHKGoRQLv6n@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: e060d9069b49fe55f38057dfe592068014652671
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5adb6c8a26d653fe1d0ee52908d998f7471e9eb
Message-Id: <179104100695.114271.9380561947647238848.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 15:23:26 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 08:59:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5adb6c8a26d653fe1d0ee52908d998f7471e9eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
