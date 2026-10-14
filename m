Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A21A6839
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791937042; cv=none; b=VsE+6RNu7LJBF7sGMht/g5JZx2YjupROiovJsYCpVnc8h+ABkEO+7zvZH2F3nkRzpORz7Mk9uDnsfNgVqxL195GboFL7AhAms0z4dDUX/aVHWwj1IPWVoUk7h1vJ/m9vF7K4A4vp/8fr2PgAM5ijiFVYDQdnZGaipYlUYHEiL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791937042; c=relaxed/simple;
	bh=U4eko34j2kHWY5uQ8HqHDmo/OimXt/RopoKfotWepOo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qgA0UK/YjWR4NAZq7BFux4nudfeNvgWvG8oFkPSKdkwItPOBXHrxxTE/Z415uF3FMU21zwlu9XQaFF6K4IgO8mzLUwoNSuugM5vrey1R8iDqzDSqSAxUTwEClcj4acTBOS2Jx1F8reqkEAZ5fXjumDQflNrzFyMVm0f7mWkQndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1ieXKse; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1ieXKse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B3F1F000FF;
	Wed, 14 Oct 2026 00:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791937039;
	bh=+jN4yvdpy+6MMcXlRD/7k3Z94tcypTN0X3S9kaL12mM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=B1ieXKsenGGKs2TZO0ZM3ya17KxQ1OpcBvtjsAhB98csE/u86LE37Mt36luFyIkQQ
	 pw8Sts1cPRd8J5oipEE1VAgAUYwZ8b5QynbJgjIBEwE+z7BFUS2bpAy+eLGlHwi0ZI
	 T2kxj7Xpu+CjBRaXQsjIrOrfJXUkzpUxcG4QpC1CkC5YD3qKfQ/hYqGpxNCzwx8SKF
	 mpeIqFaSOamlnnxcj7ooBLj/DvchliEb7HbetU/GpKzlBMe4L2fInVx6KJvAZ7AiEm
	 bP4KcZSUuwi7MVqdxu7zsouLzuTEr7l1r0JEpANfhLMGvbMgQnq9aH0aDVBJTauNoQ
	 JWxWeMllsTo7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2B439E8A57;
	Wed, 14 Oct 2026 00:17:19 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261014082058.e42e2b558ebb712bfc0f28fc@kernel.org>
References: <20261014082058.e42e2b558ebb712bfc0f28fc@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261014082058.e42e2b558ebb712bfc0f28fc@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.3-rc7
X-PR-Tracked-Commit-Id: a1ddc2721467fb68241372db77657fd0dcf6cda5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca3e345926b00bd59106c1bf2022b1daf4164a67
Message-Id: <179193703777.1530094.5151385769231539743.pr-tracker-bot@kernel.org>
Date: Wed, 14 Oct 2026 00:17:17 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 Oct 2026 08:20:58 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca3e345926b00bd59106c1bf2022b1daf4164a67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
