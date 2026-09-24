Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D142D8370
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256767; cv=none; b=Vd7c19tHB7JOVDWTjcLHOAdu4Y73HwMfnsMJzIlzhRZZ8RCdf1mlx8ejmWfHGgE8laH0pyDOlaO1QGCJ7oEdFTHHQvoog5frETw6vvjh59RTN86+RtTPJUl5SMVScr27iQKbRftPRcDQcMIyXOTMMP7KY6HxJCWpPUE5APl8rL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256767; c=relaxed/simple;
	bh=mznlSrsZ1iBIn5Rc4HUd1ZNW9A/7VN8hROnCRLEsxiY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TGKchCftH27H57ZePPXxzxR+B/iZJbZ2O69s3OhOK+4Y76o+BF2YjvJHXpWytwiWq2ByoO7AeGscmA8XBpkrda2KdVTeSW0EDeKwbo2GFhk6w+2Tg16G2mk4pN8+Cr8hKYyESCZX4girgFV++BDX2gmfYGKbs9GFw9PDbCwvK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XASWSYle; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XASWSYle"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423451F000FF;
	Thu, 24 Sep 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256759;
	bh=rmAO1mDlJDIcWdfL3VZ4kivpJ6SFPym2jsVT6xZ2kIk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XASWSYle/lU9Z/u/2vIj7U2digTZPh3Woko79BXNlkYMizE0GltCm+XWKkzS0iR/X
	 htq5sqZr1sa8X6TSomaOBJbSOI2DpbjZezFgx2pd9XT6R6poZSGx+AWikBUxsS6Rmf
	 Splhj9FDwL+m8iDpgbArgtSd34FWWRjoh8ywnQIATld7unImnI3cQ7KXUyOYneU8rG
	 tPSE0+5HrawVSw0zX+8X1xt7GC46QPYms7brDGLf4P5f34bBmS9d2UOr27j9X3XtNY
	 iBxw3CgVZvOyQd5trPZnDk4W7iG1x5o5bWRVBxAbyz9axriUspQZr+AjihKTuejBFV
	 Pa2Wip1g7hJpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939FE39FD333;
	Thu, 24 Sep 2026 13:31:29 +0000 (UTC)
Subject: Re: [GIT PULL] memblock: add missing HugeTLB flag name
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260924073316.2325178-1-rppt@kernel.org>
References: <20260924073316.2325178-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260924073316.2325178-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/fixes-2026-09-24
X-PR-Tracked-Commit-Id: ba13f1f32d96d7ce9069ae4f32404ecde8da89c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2936d228b96346d474f368f1bb0172582035577
Message-Id: <179025668828.1550318.12391350899948810959.pr-tracker-bot@kernel.org>
Date: Thu, 24 Sep 2026 13:31:28 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 24 Sep 2026 10:33:07 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/fixes-2026-09-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2936d228b96346d474f368f1bb0172582035577

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
