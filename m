Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129410;
	b=fXGQrc0YRMKnp9fWjj4ULR/o2C0aT/eRrAuZTwyIJ46H4crtCa2sQ2oUkqBMAiOYNTjR
	 PkFcYNBjYsUX/XmViBeQyNfnl5vqs9cBYbIP87Wif5gYvABh20IuEMVjXhu/8aP50lyM6
	 o3sUZyW4+rSVaYQso4yXs2FZYNqQfR7Q7cu90uneYqJ9LjlVrlyo5ZAdE8aHRBTmpf5hI
	 iaD4g+NdzNX7TVKjv2eLb3s3ew7RjeZXQ3OpgCvff3u4D1UVEDG+ivMzERgUGcrF0LdX1
	 ocZHGyW/CxVpZZQPFbOxv+DX2H+F3jvzihq+BvgeIPi3l/v1vpIDLLcPHYOfLJh17nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129410;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=uC7PG3x9TMielGTexzJGR5TIZiJxo92cq9xXopeL92o=;
	b=zzI81S3m1fEoK6D7UEJRafv/PaumMpXyJ/FFfqmNw02XGj2Mkcb5DaJ5HW4VWCzpxcmY
	 IEnyJHwS6BUrMa1Xu1T9sQ7a/MCElI73nDDk8tMGmvGMRJfGv8uknnn8Osneczj//zwdk
	 yUpkoFF8qRkC+/c757UCzr6/uw81jmOQPvEkxmcwURjRZNV3GmxxVcSGmIaZTqMOFrXAY
	 8YRuL6JuasSzXJtCu0BGyHtMnA09Bsd64oZssni6dgvFR0QoV8CzOBCi3k2979u/vYId4
	 4hqGp4tZh+AjfGykXUdxGylngNCc/v8WDLO1EmLZ1+EV5SkFWy40mJrXC3E3CECHzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9TkdTD4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9TkdTD4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96FF1F01825;
	Tue, 27 Oct 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793129408;
	bh=uC7PG3x9TMielGTexzJGR5TIZiJxo92cq9xXopeL92o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=b9TkdTD4QujmEBIa/COcTUudd00KDtMibujtXgT4eCUxPzt/JEH3r0JwUUOtWciqK
	 bIXqDgRGtyfqxKkLyzUHfePhDiIc5BaTwtJiA7PKWrtVUbqE/DlP7hOJWQ7BGym5bV
	 dxXrn4NENeXVTJZmYYGFEoWarSEBZFc5zo4aBB+ohULuLXQV+vqqgSA605jC172kWu
	 gPUOYP1biHBTNeuujJ5OT8bu/qGFEJVvdGokH/m7fEv3BxJ+sBckPjGpB8pxpLooAz
	 Qft0Tf9RuEa/X1KadYHfBFjH+YvphyG5KwNXlRNW+8YVJiRY6kPbVUwCsKYdXOoZNQ
	 o6V8gAdHP/rBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE7FE3AA9F47;
	Tue, 27 Oct 2026 19:30:08 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <auDf-xw7n159FvUS@MacBookPro>
References: <auDf-xw7n159FvUS@MacBookPro>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <auDf-xw7n159FvUS@MacBookPro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1-2
X-PR-Tracked-Commit-Id: 209108a5456171ab430e25b54b2dfe083455bfb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83f32c773255720a661aa45d83e36278135f23f5
Message-Id: <179312940732.284542.14864597717952963666.pr-tracker-bot@kernel.org>
Date: Tue, 27 Oct 2026 19:30:07 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Zhan Xusheng <zhanxusheng@xiaomi.com>, Hengyu Liang <hengyul@cs.unc.edu>, Chao Yu <chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 27 Oct 2026 18:31:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83f32c773255720a661aa45d83e36278135f23f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
