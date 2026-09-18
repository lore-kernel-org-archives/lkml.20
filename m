Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B4503908
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749735; cv=none; b=IOkugeGFDvrSpE5WkyiyZ0FpiEKmUJW0bnd4Lsz/jNz6X5CSkwghGg8cCSvF656pWH61OSq/kj6JtHRa7JHUPrg5h1tUaoEq3YqSHH69mqlfGA9yikZ8c2E+ltYxCAOeEOl7sl/8ebqfGSQDtPcZf7zhh5SMaZOO4A2AFy5MdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749735; c=relaxed/simple;
	bh=s/ZE2UR0/pjeklBKfVYIcaUD/luuoZEr/iBJoRrexrA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fjSrGN8yx1f5/wKO0lRm2D4qiELVHc9hcgowpjvGYw3P2FUUVItgA6Vfbk9BZBlJx77ZgZWbeIxBkg97diRUxWmk+CCKQFY61ClIlIxxFLqdYXh8wfVL98/YwRxSecd6bit9nuvzzGB/xzXX2wh5RW7Ab0MCUabF2Qvfit1+xYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI75iQh8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI75iQh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9771F0089E;
	Fri, 18 Sep 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749715;
	bh=IyNcX9OUtMhOcEQFyBSgh8i1Ie6T2QMgkGLlHuu676o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CI75iQh8jj6GwZeWKpSUrh2UTMeXeF7ZRQgqtWtUvkAlniCLy1fdcsx3ZxtPLTx4E
	 4ZNuFKf7QL9E+M7hE3H9py72DcD2wkiN9YuQ7SAlF11yuu6xkgFBCpX0LCi3Qrx2Ih
	 M1wvno79JbqgGCYsoKWj8uLmlHAS0AJ0DXDXP+BSZFUrDNSiFbjnMVS6YCo/nyx7oK
	 HEEh6KjTtTp1xtnf7CAZbdhPufBqVIoZkgcRIKqO3r4UauoKOC5r7uY5N8S6+iR/bc
	 zLOCXFOoJYU4/bL7IY6E91n2Rx2iZbpZLN34lI5n7+8BvoF1yC5wBs0NT9RSF4Kp+v
	 X6Jx4V3fupEQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C0380CFE4;
	Fri, 18 Sep 2026 16:40:49 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aq1SSMDovHJhKmwF@willie-the-truck>
References: <aq1SSMDovHJhKmwF@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aq1SSMDovHJhKmwF@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a077be4fde21ee6e751fa70eb641ef5d9bf2fc48
Message-Id: <178974964812.1040423.4048897901383038528.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 16:40:48 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 16:01:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a077be4fde21ee6e751fa70eb641ef5d9bf2fc48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
