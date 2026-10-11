Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54C3546C2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742694; cv=none; b=G2zMjp1coXZOQIwEnQZsGPxfl6jlMIjFQ04MMsRnNVASUPN1hKH9+QKYUDgvieD/MSiiqPAxnTXuCd4HUK/TwiMX8JlmQ4UdBT3fBDAZKPRzHjQrw5TQPpv211p/tWobgX3SlDyzLWspB75JCbNr64Bd0FCjSu9/IIqtUZKeKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742694; c=relaxed/simple;
	bh=VdWARNZf8wSU67gzKY+wUJ2GexDxReIErC0uwQma8fo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I4i47hkyWXAIedX7LB5Jn6hN3YRMF+CVPCt+HPiZ1Dq0HYemdvs3kYYZ4fOK0nKPmyA11cxTILoO0AOUyNe9eGw/+E5+dawwCwqMxDtpzECv3hHjGJIbFdzBujqB+HCdBWttiDQS/jED/SxpkPhpp0K5Xk/EI6tJuFruK9pJvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VugM3zLh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VugM3zLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC6B1F0089B;
	Sun, 11 Oct 2026 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791742692;
	bh=s8ybK8G2XkeNsuO2iOALqieuZNCFjE3XeRu9g8C85PI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VugM3zLhIpzUjgxb57Xh/WnC04yhP+L6Qjxa2yXPCK+V2jHy4sntHJV11CEfyalSf
	 z8HH+iWFMcwzIzH8I6lNwJ+GlM7QjAiuuvyvl/o4V6Y2ssCL439UeuT/eMZkojXIQx
	 a7gKX0wV9B3RHr5cKf7t9voRnoL+aUJQuq39wvJPQe5xarXnu8fi6iN8CpqdS8eZaw
	 TvQh6eg/m4SPHClhsTwOW0PZe6kthz6EBZPYsJB2OLioZTxOEtT/XT7hdqwUTZ9bzb
	 zr39W2CwxzUaj0wAF37cIzEUWLBwvpbsz3K4wOW5eyMSlPBWiVdM+ToE5kjjyNRq8C
	 qjNMLcv2XswtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B464A38119D3;
	Sun, 11 Oct 2026 18:18:12 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <astq2yZg1CBM70Q3@gmail.com>
References: <astq2yZg1CBM70Q3@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <astq2yZg1CBM70Q3@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-11
X-PR-Tracked-Commit-Id: 87db7795cbaaf636ae22ae031f4906db7bb77803
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d61397c866eb1ae656c39fa9f28766e4388776b
Message-Id: <179174269128.2129915.8071860321384769222.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 18:18:11 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 Oct 2026 12:54:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d61397c866eb1ae656c39fa9f28766e4388776b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
