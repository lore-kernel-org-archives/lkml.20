Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595176;
	b=Rl7mB5iL7f4UBURWbfkSQ/+77T+FqAKLi39/6ekaK/U0/BkF7N9LoTjN4rw4oXV6xjIr
	 UhJkEs2rmmxP9/52HO+FO8ho1lv/smi/iuY/CQjQg1rNKc4RIBm5EZUeUz6oTRZ7nMg6r
	 uhpYnuyVEqi5eLvvwtrtKbJX3bXRkCkGxnkSOh6O3mI7PV/Aq0kEoqIpx8bwpPMAghVuP
	 /3u5bcDE8/5Zpa3lsCGbZJYSuQufpcQLsUNKEuWNY+3hRviAafSYywpYgBU+aF/ihLUKP
	 wn61Xx5917ZpwZt2rS2CmzNCCxh/93BSqKeYoScyWx5g+F35Kc9Ofhdy2xhlYtYN9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595176;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=GKkUaPjQ9HSzLxoN+bG5qq5nVAC+gnIY9tY/xC5NK/w=;
	b=k6LnxQNU7DwMZDUGXNQ8zTP7MteNBl7jXPHD1rKmiUW6HUL148O9Rg7MJGeG4TdfQSeC
	 rg5+8kR6XO7Mb2E5YyGAFxOlJcHF8n+P6Xn09t041b+nyLhtk5M7i0JTOGHhnCibx4050
	 fZ2MjBUGMAoWu87Wuxdn6TJDNgQaarsjo9yzHoblBqtBEmQCjAiJ+MUumyTB2xqgH01/m
	 J33K68IehSI4UXnFVEPQg18VtMUDne5VpODAuKCx6ZUOKecaYsiBum+GoL8GhAmmZNhQF
	 DZAEPGZYgRmcoqAWnm5WPMvLzxh0ZRV9sqUCA5N9Z8ncswqn8O0Db4mSAsvt+qLMK4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmHjhcH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822D606A895
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmHjhcH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825151F000C5;
	Fri, 13 Nov 2026 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595176;
	bh=GKkUaPjQ9HSzLxoN+bG5qq5nVAC+gnIY9tY/xC5NK/w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BmHjhcH6TeFUyYov3GX1U2GnMc+q5WbxbFGB2usDXgoFKGVeKBh4t5qwUfHVe2qbQ
	 WMGwYa92xwygNHcyaRNrPHrEGaJYC3asZo5W4B2f9daj3M+UK5nh6wsK5FJECJjSEN
	 Cr5aGrYLXgBW4CbwJm6JK6Hrqx+qipB1DAstEAjvxRlOtvsf5c9KE5CBDgAzfM7nNo
	 K7UNBcT79d+A/4gvACtz5LvCHn9OV5BWdvD6dqqIK7rcvu30NTIHPXN6YWjdbF5pwW
	 UmwRkdji0zNIHNlFIghcZAIAHWqS1LAxliFycv8i+B93RWkn/VWZ25aWFGfNsV4Y03
	 px4M9jj3OtIUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77598392E998;
	Fri, 13 Nov 2026 18:39:36 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <avYqFWIxinR9JB0O@MacBookPro.fritz.box>
References: <avYqFWIxinR9JB0O@MacBookPro.fritz.box>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avYqFWIxinR9JB0O@MacBookPro.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc3-fixes
X-PR-Tracked-Commit-Id: 7906eac042a4d6facd3b2dcebfe7179fedfcf1f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b970ee43be13fc45851e957469807cac049c10ce
Message-Id: <179459517518.1691752.5818346831969815186.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2026 18:39:35 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Daejun Park <daejun7.park@samsung.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, Chao Yu <chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 12 Nov 2026 22:05:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b970ee43be13fc45851e957469807cac049c10ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
