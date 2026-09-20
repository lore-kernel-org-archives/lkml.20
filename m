Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A732B99F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924970; cv=none; b=khadPeGI0EfBEx5Imqv98etuKvvRxtXvu/QlGCJfNmvMVQCH4kxaMYO0I8vXrm30DuVG39XT+Q1+rwFQQuFlnpaNNeZ0hFR5+b7bsB6I3lDt2WET5o/Rk+lyzi6w5gpzp/SCeO6TmrJSvVOe8Ahjpj3o/Q9aHuapybjq1Jwfy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924970; c=relaxed/simple;
	bh=EiNY2f/1PpwfLYJaoMe9bx+N2D7KrwpYnGS7WX5WZZA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fKHrY+NgPx3VFAq+xgnFJ/dCZSt5paC4ju5yT0TJPsq2au7d2D+9tCrToH3WTFOZVX98YVoSf9MhC/IrucOqNgD4y5cl7xeWlvSSNW3d5z6O53Zf0XQWiX6TiBX9pnT8WOm0b5xP02RHm7UH96yjjlfnGu+pPrFuRyrGe+lG3l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7J2aS63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7J2aS63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBB01F000FF;
	Sun, 20 Sep 2026 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924969;
	bh=/ID/4v7/u5hrSo9ndDyexGrT5l7AP+Hg/3dhkvHezGA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=H7J2aS63vgMa2AduZvYKjhkr7jUoqOepubzONe8dqgaF2n+Pe8jTgS+EZduH0iKuX
	 IQcVxDbu689nXm2LK2SLLdYRv5l2tkakdUoR0Pg94lSzye0JWuhR2iOAfePrJXhXcP
	 gtAF1yFhMm+nHVjjg8OnGEH+IxJ3cPNJpAXYV4JZxCqnEYr/pyzq5hywftOnNF4Rvg
	 WSN7R+PB3ezVMPvoHo74kDBaWwH9CQHc+vBokNGFNjXuYgC//5Na5gJJuWQn82lJLC
	 5b95r3RifkWrCfdekAldb9JjTA3pkhQIo0uISHDCHziGP8zC0pHRdPxxUhjbM/IfNt
	 1uU8RRNoM6XZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CD239253D8;
	Sun, 20 Sep 2026 17:21:42 +0000 (UTC)
Subject: Re: [GIT PULL] futex fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq-oBuMuZKbqIPtq@gmail.com>
References: <aq-oBuMuZKbqIPtq@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aq-oBuMuZKbqIPtq@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-20
X-PR-Tracked-Commit-Id: b61b6f95d6722ddbbbd09e689fa41b55fd36f9a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdab18633a302c82b5e5d5dbc4e38b0baf9c0837
Message-Id: <178992490127.1735599.5967211973575503551.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2026 17:21:41 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Sep 2026 11:31:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdab18633a302c82b5e5d5dbc4e38b0baf9c0837

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
