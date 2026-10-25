Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907465;
	b=v+3o6BLIQmwK9FpMB81zoqBsV84EySkM0NcM2bb6T4Uw+j4qgiU1Uyz8mqp+i0towmRY
	 yQA3wTsd2fqz5dNG5XLidgDvVWqN9fQJ3unYcYFXH+Mky/ROhM/4zoacyYfCeTaMfvDqO
	 yho1CVBklrrn2nH968p+u9F8cepjXfU4zyaOyVLbfQivtVV8z9cZ0IPci6qSBFGhLFnAE
	 yjKlAbcvZgdBCV3OW6iIGETm0LIfUtYFNU7/Fd103rlTAFfRsatSk4Nxsp/qLm9/FH4OP
	 Cjp4VLIi/H913tSq3neCK8vL8eg/TJbM/hwYYnfgPC2F3Scny1FAjSD9IPmqPw1Utyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907465;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1/oZ/TxZJUof8afLS6OdGmFUXlN2q3VXyFQycSv7KAs=;
	b=y7OunYMnaEanpNUHUxVYMgTbN7JR62rCcSd6h6WytoPxFTOHIRRg74AdjEL/55kIZdKo
	 TNQrVdHCJTCfxPPMce8WUpbTjj/OcjOYbzu4o36APo7aZIt3T3BeXtYXnSlFiXeICNX0v
	 Van4HMav4QpnqfoSDsEs7VfBDMUG5of7ISaDuBrdgaQg6z14raF1rJblHlOTUYGQg7knZ
	 ouhrCHXnnLb1RbyhoIdVCSr5yiKGll698an+WZPhRM+rRKj8pMvbzZt8aagNbABj8DSXA
	 192J+9OOElJ2yPJfZ/sgEO7pkitjdVUhI/izxM0U2UslLEmFu+gxgjlFhp0k5KNp11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt91qlKv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8DA606A33F;
	Sun, 25 Oct 2026 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt91qlKv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B151F031E0;
	Sun, 25 Oct 2026 05:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792907464;
	bh=1/oZ/TxZJUof8afLS6OdGmFUXlN2q3VXyFQycSv7KAs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Xt91qlKvsG+Wzj0P9eRUiDbcc6V1PUduR8roZGzGnegszRH2KKiLIDhl6ZE7vX75a
	 bb6IAr5paLVMVEi77U9PSLJ8vIHwmMY/dbSGFB8eOEq+iJnnmLVeYkIzdjnVTfFxdb
	 rNAEYEbvOScm9/OsKiX7UD31OdXgZW7KmRJw31/1a21vjE7bz3tvotXIX0rMOV0bqS
	 fAiKwEsF30uiJ0Skkt3lad0oRPksGCMermotHR+WRUfcJE4Y4iVHZZRspHscey4eIX
	 goPDzP3lCgtLkyTBmoq8dd75lJxtf8pscE7kfy2+xMm9Aexza3hKeKPz4R9bA7N5ru
	 GSY4x1c/OJ/eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AA6A2392ED67;
	Sun, 25 Oct 2026 05:51:04 +0000 (UTC)
Subject: Re: [GIT PULL for v7.4] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261024185058.20410953@foz.lan>
References: <20261024185058.20410953@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261024185058.20410953@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.4-1
X-PR-Tracked-Commit-Id: d7e7bca7169873b46e857c025c10f3336c1258d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42e6549eafc66f3648319585680ba0c71c2461da
Message-Id: <179290746343.1990210.17053245615719349059.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 05:51:03 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 18:50:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42e6549eafc66f3648319585680ba0c71c2461da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
