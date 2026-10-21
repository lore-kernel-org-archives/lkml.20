Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619024;
	b=3+7DPLit3llx2pzODup9P8MaPkHQdDCL1igh6WDzMJJtL3o88MxIuRniyXRLLZ1gAikD
	 xuYXUpsO8cZpcrRtzsoUWhjyX4joqFnE+p1bXg7MYo8oE6vuFysCMKgJ62rmdAMWcgyTY
	 bfQMmxq+91KdeOaXsohFJcQLGNkJFwIeY0b38iYxC4YmCSqPSZUJPjc7AHgDDKiYsbGen
	 j2O5QmYgzFr1eP8OzJfFjyYfLJmWNt8MejyZUHB06hkw3NQXsNl3pmFEPVZWxKih1anMs
	 Cn+iKhC694OjaVKs2rp/BJbnlII9oY4oLlwAgX7H108lU18hqm7IDkVcpITNtldfgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619024;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=U9RNvX5WFiUQv80j+h9LyRnCEVauXkyQn8EQhJn2zm8=;
	b=UklzapOLhVf1uUpVkYmGbn2SCR68HwxMU32ClnZUq0slvqx4EJPCiC5ICFcVopcVEbaf
	 Fr42yOXEPO2OwQn2igpSpUBn48nEJTYPp+HzrcCe/q/sopNyJq15aBD/n7xRnnDpfbEaD
	 ygk5ypPkW5E6x3vKJ+TSMoDFH6tt8zLleObQE0G9en/6VSqjJwWnDGDeMy71Vznu/MjbT
	 tnl+k0KIxVf+297Buxy3siOhfroxDu2epF2RLfe77PeS2zkb3R43LTsjZLsRVNhfDb8zU
	 +KPADkCaEQc9dLr/sgZXsohCWegiD5GIDxAkhj2z2sl7YAkhXNz7dF2fIu1D/xPGGpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhxcKvk+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2ED60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhxcKvk+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C691F000C5;
	Wed, 21 Oct 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619024;
	bh=U9RNvX5WFiUQv80j+h9LyRnCEVauXkyQn8EQhJn2zm8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YhxcKvk+JkjAYDSJC99eG1B7jNtcybILxH6Zh66SqDYnUr8cKXs5AbFRUli3PLjzE
	 XV5shfBjsAk5NPoDZ/xykYrCrsKxG1Pim3dDwGufbt659LpPzOt0SJf/C0BjRmjcgE
	 zFDWl5Uqu4+MLjvTKJEu0KoZhzq0kKPiI/C3RcDtCIS1124KB6dIk/o7HNBYMadLUK
	 4vyqjvgjfEQT4sqNcC347mettHr1y5Z+JIHGbR93KZIeTXhYie989B03dVTs4mUP+L
	 TvjW4xIu/gk6pj347vkdhwwFwhp4gnLZbUIagjOBpoWR+r+R6vT22s+t9kzy4HYHof
	 rFD6cM6fJGvPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13E3380A962;
	Wed, 21 Oct 2026 21:43:43 +0000 (UTC)
Subject: Re: [GIT pull] timers/core for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257622796.804100.5245716298409954290.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13> <179257622796.804100.5245716298409954290.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257622796.804100.5245716298409954290.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2026-10-20
X-PR-Tracked-Commit-Id: 348f54c435bf3177baa78201952810b255d44b30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aaf3d47e530616ed0cf9110ba8c537ace455dd90
Message-Id: <179261902256.1324168.3203001144027310649.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:42 +0000
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 11:51:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aaf3d47e530616ed0cf9110ba8c537ace455dd90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
