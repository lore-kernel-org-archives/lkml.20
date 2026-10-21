Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551797;
	b=R0bstZnrVo4VBXmTAKYgghENDrN9IrJEW8kcSW/jdABCuA2o7/FPl49L+jfd9Y/7PaAj
	 gcgiWn3b2QVjQfO972U5rc4nLu8+mbUrfp7tvUK5ezHY5B/l9UY/o1U1d4ti3pJY6aDN9
	 BRiguabyyZdSHMWd2d9BMcZ+bowiC1x4YL1eHq/r/OqJI4/fLsjImu9/b9IC3nZZ+0bWC
	 bepP4g3G8UXvpE/iSRA8otn3iCZmulG2lIOK8IdfY+xJ8fuwxvkqa3fOYbqFK4wSSEvA1
	 1nN0FZSbTKraMKAPGlg63hSSbtC6/5/Yr3oWU3V6uGFewCZJyc+o5oqvMOJrKYIuvRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551797;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=oCfcfQS9oZIfhbFtahLoTFfPgh4X/RsLplRbPeoMUK4=;
	b=yZQliP9qvT9puTLRPhhGT9p8qk6izTH4x/3JzaJC7MvZVvi6qgqD8n3ynLkwp9OgbYjx
	 W449Z3ddT68OVhEA7AjqkYmmnH3bEI06vPP1nrau387zrM2owgU3fxndGW/WSecLe01fq
	 1JoE2QrgWVhpex55vmVD/zWhJDwdT+BHC1R5R1KuYaI0wZElHyBjDCIXT6QfdDaA+miEr
	 uV9qT+MpWAARn+9SPV9GkPI9Shbp8lufnkz+2IDIDqEPaLQilJzpV3kLULN4S5zdFqFuS
	 ZWkfUyh8HWwZp+Omyyrr3i0ceDAkEbmtg980ReypQSKS/8SKvfXQ3zrrahRXWKo2HVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hXL/CNPu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B640606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hXL/CNPu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FE71F000CE;
	Wed, 21 Oct 2026 03:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792551797;
	bh=oCfcfQS9oZIfhbFtahLoTFfPgh4X/RsLplRbPeoMUK4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hXL/CNPulwjHI9ioXmUjO8CRWa6pipSpQ5U/uOIa6yjFcH2ERNxdK+ZTS5hiRYKXT
	 8EIRWy+vl6BozhT3obLOplIQ8HKcI3JYJOQwSU6yvw2cCpN0P3GqCOVB7ZjFq+Ddee
	 bbqz5I6aAobmohMNPXW58vaKb3KRn9dKdohqk0EdyZTtaezE4waMjmCorbZ/+lGhVZ
	 xcN/v/olsSmYKRIplGzzWBWS69O9biQ3Vz43T2qIV1NFkyo6SCMhAS0NXxKyTowpOG
	 dw4W3hYTRXctFBgbVR1OmsnLFjcrcaAmvfk52wxy5NNEM1Q5ycNvzZ1bWQhv5FHwRW
	 cmG27NJpQ19dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A35F3809A18;
	Wed, 21 Oct 2026 03:03:17 +0000 (UTC)
Subject: Re: [GIT PULL] erofs updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <atZ5QThkCK8UnB28@XiangdeMacBook-Pro.local>
References: <atZ5QThkCK8UnB28@XiangdeMacBook-Pro.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atZ5QThkCK8UnB28@XiangdeMacBook-Pro.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1
X-PR-Tracked-Commit-Id: 1137aa577a35e2684e8046c3e53f920e79c7cc60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b9498b77066bd2a55f607e82a05b0888dde990a
Message-Id: <179255179568.353442.13679607997949913266.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 03:03:15 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Binglei Wang <l3b2w1@gmail.com>, Giuseppe Scrivano <giuseppe@scrivano.org>, Chao Yu <chao@kernel.org>, Jingbo Xu <jefflexu@163.com>, Gyokhan Kochmarla <gyokhan@amazon.de>, Christian Brauner <brauner@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 22:10:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b9498b77066bd2a55f607e82a05b0888dde990a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
