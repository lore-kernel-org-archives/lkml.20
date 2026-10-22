Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694351;
	b=2HY3rBVuU1IF+945KQDTQQVbg6BIeOKME8DczRkw0LIJ7tWz+NmwWuNT67uyUxDrV4dc
	 YPgrYzVk41O4WKhI5W8vMroFT22tV1f/J43wMaBzHPHRpCNlSc7N8BzrFrRyvTZjOBmVm
	 tpmwx1TxLdSO5xfvqIFg7CwjjSEeWdDA9xRA1yPTckFFhWhtJlb8nMfyBBqcbgV2WYG4x
	 0ZTn2/oomlielMpa5Uwf6NNvbEXTZ9JWcfCa5KLkcfBK8hQR6xrM5gJCxgR1BmKriNEXH
	 bXNrQBVoo/gPzZUnWiKMk0CgsnfGAsKx1LNg/EA7ySbhXeZgpg475WgOjHfyjbLK86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694351;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=9o3gMC0RrQ2EwkE0gWE6vtV8jBk0fItCJxMdnAlAfJ4=;
	b=VoTf6H/PJ11ZYrxdMY3xsUPm97PZo5kxExPKNpKvJ16hyBsQCcfT8gqpStEFUHNYWQnr
	 oLyIpilbqGvEHTXB3jv7nHuRjkyEVxIqxa5E3pK+PBN+wptKYuYOMviPkTrDotTQGhDl9
	 9EiH/rgTX1slrru/YYP1ZFReyGs+Lm4lTlUYBDniyy3FvXXnwknYk9RsujErbtk5Md3Wy
	 62v2eADGnX8cAXj3Y+nWivsdR4X9e2OKgcGpVvzzxutJaF2U/TPWnhtJvBS5UyMA7Ojqr
	 eaRmVzCR4uqr+xHG3ymqzZIR5mTa7IPbL0R7K6TG80hPXiZIe/BmWR/buwi9UyS3kRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9OMEOGG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096960A3827
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9OMEOGG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0741F031EA;
	Thu, 22 Oct 2026 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694351;
	bh=9o3gMC0RrQ2EwkE0gWE6vtV8jBk0fItCJxMdnAlAfJ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Q9OMEOGG7GPN57sND1lDeY/5mEd6L14d/wH/RTqADkIugUkkObS7+JG4ln3bqkc/B
	 yU37c+n5m1qftEhT9pLYlcwW03HJ2wA5smQyw2iCyl5DsFMeq6LPW/NsN/RXHpMc5L
	 mRV2ueIKUnSsf28sy9FVkssZWPpS6TfD88195QcDqChNFHK2PIxuDJPCHl7ZFaTciR
	 cYOJ4Wk8F9X1BzEQ2+hXhUiTlZ9f1pqs8i6NP9jd8xaDDv/N24tHhSyYVNCC6VLw7L
	 TdVTXe0oqQ132iaFTyordsYaOgGoLdD7JWfees666o+M+fVNwgtecdQ71CmBhNp+nN
	 0RHXWybz3EIFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444DA3808222;
	Thu, 22 Oct 2026 18:39:11 +0000 (UTC)
Subject: Re: [GIT PULL] regmap updates for v7.4-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261022122643.57BE31AC5994@finisterre.sirena.org.uk>
References: <20261022122643.57BE31AC5994@finisterre.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261022122643.57BE31AC5994@finisterre.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4-2
X-PR-Tracked-Commit-Id: 2dee91ee94eec85d09c13c7ca83e3005906d3732
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9aa54fb74ead1737b92a9dc2f7a5d9d5e48dc7b5
Message-Id: <179269434977.110555.1138431670680287086.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:39:09 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 13:26:04 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9aa54fb74ead1737b92a9dc2f7a5d9d5e48dc7b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
