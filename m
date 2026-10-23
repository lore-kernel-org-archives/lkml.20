Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785494;
	b=bt/VbdSVLJYWFtWXpWMz/OG4DZYf3Rg79jBvX12VwQdQG1/OY30g3TKYNSb8PsMcDKlI
	 m+K7FOyFyLfaNjAWw0zGyibypKhBAkJRMtHA2OG5+UzrSZ24fcXM7T05JTHVYWyVOId4Z
	 W+uhGNDvPVQIS6uBM+it/RzFdvTHG8CRgS7njoM9i9+5b9e8Ll9TkRLfNmBKsijzkSBX8
	 g7Xd9exjkd9+1JkD5gJTta4FrtrhCNFRXz18aLDw5kRK68tsIJT4MB8j8cDBZfORRYL/4
	 FSRdzo2sNTfSl5ZQgwRmP25Y1jUQqq95Qqq/Ikm49OOOEVhrNSQZaYpSTpSaGazC3Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785494;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=0kB1Eu+OBUcet3f1PztzYQFUl2ZFOUmK+s0rCwLUKcw=;
	b=w/gqbWScSc7sKyQT2rLylmWgXptpI8vpIe3B0wqE+a5lwicOn+4kzcPJ5clLaMOS81ch
	 LW2QAKV1QoUQ5O2GdS/XHhZJIdoEOWpIED82y88lrut1oSku1SkJ6Y459U7d+dEA+1Yw4
	 zFzlAXp404ZLTKRh26uLJg6mg+JvGYkcua8hogw78ZnVe05srPufLvRJp29Xl+zSehR9P
	 oguIRThCRLJyszCV9d/k+u5IvYe3o3HSaABgOi6rEUrIHFdpQwfrk6q4pAtEnZzJtVDA5
	 pfky7mk1v58Gt4fLiUnuZAb5uoJSxTWlLvGs4KPWOLeKwBoe9T+0xvJFCsc54dEC4QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mGGGrFYI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB33606B2AB
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mGGGrFYI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68B91F01825;
	Fri, 23 Oct 2026 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785493;
	bh=0kB1Eu+OBUcet3f1PztzYQFUl2ZFOUmK+s0rCwLUKcw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=mGGGrFYIGMqVKqk7/6VAAHYx6RcjgH0tsQSbHjXyGBheHWn2BofKOgbUZ9DvbZBxA
	 Ukc0nOvEGqpsrJgNyXl0rDgAZ7GPQR9X1eTLjjXidaTcl+N8W6VnJRz0sPaNJqYXcj
	 vY2w86uwntIf3muIVDHDMln0pS1FRajIFNLzl3+nISZikeE3uXl3Tb37HltUYHNE0W
	 JVO8z0t6o7qgbF4U8j0Fqo2E8lEUftHojqZy38t08yKH6vLd4N7/Yf8sn2Dz/AimnC
	 Ak0XzguCadW+Vci1qLAdzjBRaP/sNBqWe7lu++FqO0ynql2lVDYmwWMAQZeMaUxcD7
	 RwLiszItRT9bA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE549391B153;
	Fri, 23 Oct 2026 19:58:13 +0000 (UTC)
Subject: Re: [GIT PULL] Core MM updates for 7.4 (new MM tree)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261023172100.49643-1-david@kernel.org>
References: <20261023172100.49643-1-david@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261023172100.49643-1-david@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc1
X-PR-Tracked-Commit-Id: 07ae95d933b84db98696f23e24de078b251561ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ee2475e15b4ff8fda89a9edcb77dfd871de1386
Message-Id: <179278549235.1241373.11674189443259173093.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 19:58:12 +0000
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 23 Oct 2026 19:20:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ee2475e15b4ff8fda89a9edcb77dfd871de1386

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
