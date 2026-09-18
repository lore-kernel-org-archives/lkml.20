Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE9B51C046
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755119; cv=none; b=ETKwjmGqctJW3sV1MvDSoolwiFeK4GXxWFkmwZp7u5vMZ/HplWER+A3Ja3hu7CRbK/80Lqc55dxkX6tKS7Ih6m17THrC+hDXvGOosWqT2w0Cju1GcKarUhqfh+b+vidgl4ehVF3qXszWhnQ8iaRx1dfrhjVe/R2yszoI3P7onEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755119; c=relaxed/simple;
	bh=CQ+PUgUNT+bTPWcpDG0pyvos77VEc0OHXamEj0fUdLk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XkdVAlSaXot+jw/SWB/qMfqTxkSgcUj3UcUYLgqquzo0kQhIiuk+gF+O8eeFz+LQfBvXwFAdQmJ78GRBPlZPMT1CXWSMaVEO+F8QUcXCWbGt3Pc2Ivs8OKwXLD8APudQlF/tN79BVzEeNjo0IGBlQDi/ir9QuIXqv+aUU55zDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+vzWUKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+vzWUKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827C71F000FF;
	Fri, 18 Sep 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789755117;
	bh=kHTl2F8hkTe3jIOzjDEWZnHVJAZ8VmmACLWXMdtaOrM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h+vzWUKT1arUpwMlaVzHQQjHj7kOLghlzltM9rFB8cJlh956vA1hBh+XpW1jW9tM7
	 xufA0FupyILDD6AtAHplZt5XEHOSRwmDcsbnYE5ORW9+R/8mgqYJr3UPWcHAwRPOZ+
	 HZCQ+6VJPVl/vxVs9swLyNuHPAFpsKTHnVnZpT3mhTfWlmD48ophhvgjsCkikopn6A
	 WC+BgPtqLV/To9RKzzJc6epPS7g5QhJbW0Ol3S1350J3Pnaae2v9L4DgmMIUdhZjSY
	 BEezbvc3xyRaGeHvvIS9UxulOAwoKOeyuOghKcfwonQlviGmvpK1sOegqgo6EwTbCV
	 17I5bxbbfT79Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A9A380DBEC;
	Fri, 18 Sep 2026 18:10:51 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs fixes for 7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd-6AzThE7XG=EbFvhzeJ7iJjJR78LJQxXGbZ2pMj=8nDA@mail.gmail.com>
References: <CAKYAXd-6AzThE7XG=EbFvhzeJ7iJjJR78LJQxXGbZ2pMj=8nDA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd-6AzThE7XG=EbFvhzeJ7iJjJR78LJQxXGbZ2pMj=8nDA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.3-rc4
X-PR-Tracked-Commit-Id: 229e8188307b9724cc676a49e9600c4acd24b571
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfda5a01aa99c5c363ac9967b81cbd5902d6c940
Message-Id: <178975505053.1083250.3778696619154800393.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 18:10:50 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hyunchul Lee <hyc.lee@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 23:17:52 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfda5a01aa99c5c363ac9967b81cbd5902d6c940

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
