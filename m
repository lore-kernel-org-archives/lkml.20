Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613155;
	b=Efib8l7VbgU+jNodw7uP8vaseLA8hNWZHYwYNhhExvs1G/UKUUoUOWISM6bCAJmaoM7q
	 uTAQimW5PoBdq7pGP8Jl+Fyr065TSY6moqB3SxgEwlZYNUaIV3HOSdawBCsghK01qIUy9
	 Izt7D6Lg3MysS7j/x+N5JQJ7nQimIucwpXyXdycXTAgkp0Y5kxCxSWgNvofdNYJdn9C5n
	 qRdzzV1NnwF2xFCelPsgeXlnuVVaSk3WBoLfHOcC0Mo0uJQ+YAgK35PF1rHOd3fnLo/zY
	 cM5y6JHRvxTwO6AyCrPuIDhYF1fhcXbucoQcZUw5Ad7gW87n/T0ngJF4LQOeWRzavog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613155;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=jeo1wO6uKx+KnXwEZuSWic3Vn6mcyeon0MnjzSZgQwU=;
	b=aCWMc3aXp+yIiBGGicE4F34QIhCs6wrE0J+QpbtO76fHI3/EZzMCcxiR0k7OeeBiD69k
	 y3qyMxhsxHWx4YjP2q+xCccN7xhWeHbdxSu82tfLbvVfIBVdAZsqySTIdSqeLlgqWRJ6h
	 Z7V5mcmY21JhnHGz3rOsbqbEshbwyG8HfbheT7zsy+X5kMTG4ZpQgKvsD1vtTD3jZQSWP
	 iUUySaW70Teh0jBBCMtfkTw7UuxoA9pTNFPUeRfyX1p9f9Lg6oI7rwic15uHAwYqqEf07
	 cHIkba6KSK5xWN/BIgWcCUfFlSu2PKsQFLdYIJJO7orRCFYaSBBP1Q9Tpnd6TlSGyrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqWZHSfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqWZHSfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4489A1F000C1;
	Wed, 21 Oct 2026 20:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613155;
	bh=jeo1wO6uKx+KnXwEZuSWic3Vn6mcyeon0MnjzSZgQwU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XqWZHSfrKeUXkKdnZudsIJUf9vs8Fv1KU9JQEWZSnKxYjz4Yfc1FEyJG+kLnSYCfV
	 o5JcFWMIrJATQGJTXMPoq3qIc2ObO7FqhGp77zrYTWDwQDHC+5B8xkGhO0m82Zp6l0
	 7vY+/Ikf5g/yG5ZLlXTmm58WpZVgpu4vCOsOR9tV9/ex21ne2AlD6b9OOtnU9PbWwu
	 WuR+AUqn1ao0SGtwt7skzAs7bW3a/yUv0Rd5iviSKYfrVfQhykUFLe0SMorYw29C+G
	 5uA8Q9qnhjShSfrCticOBqT9TyMFSH93bXcoLNapmsdT+DcwELWRVSxVl5qVHf70tG
	 T9pg/4/6lGTew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4EE380A961;
	Wed, 21 Oct 2026 20:05:55 +0000 (UTC)
Subject: Re: [GIT PULL] bitmap updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atVxQyCK11nPQsc1@yury>
References: <atVxQyCK11nPQsc1@yury>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atVxQyCK11nPQsc1@yury>
X-PR-Tracked-Remote: https://github.com/norov/linux.git tags/bitmap-for-v7.4-rc1
X-PR-Tracked-Commit-Id: a73b4d1fa7d334a5f7de5bb0a14726530f66196e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ba46df344883ca8bade47c0ed7aebf80a1e07b9
Message-Id: <179261315393.1282224.4363230229777805955.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 20:05:53 +0000
To: Yury Norov <ynorov@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Georgios Androutsopoulos <georgeandrout13@gmail.com>, Mark Brown <broonie@kernel.org>, Shashank Mohan Jain <jain.sm@gmail.com>, Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org, yury.norov@gmail.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 18 Oct 2026 21:24:19 -0400:

> https://github.com/norov/linux.git tags/bitmap-for-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ba46df344883ca8bade47c0ed7aebf80a1e07b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
