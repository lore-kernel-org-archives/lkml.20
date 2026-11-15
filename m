Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767790;
	b=o9JJLAb4w9KlqEWmVQQuAw+Do+yJWmP1qAewmiYHYqyll9k3IVwWxWTSAKapSFoS7Daf
	 GJ8t7KRMBC/EqcYbDDMiG2Cw2lwS/9bWQbq4ZtwRplQsjhxkieSK4X1W505UwEvT1qqd+
	 s24XwTbTMYdyAvOAsyOWsYB0piEA+lWKggH7e1dw71j/jMvTrf76fxA+oz8BcujWbFYs3
	 bvypJOWFJNY/0tF4rQ70M5foovB45M6vJl9kPlhnq2zjHpXB2FT0Qhy2ZtlbSHs02Iknn
	 amE81DJgsf4FF03u57J1weg0DwySkVt5GRTnCuWbNPmkZC45EkQ2dA17DHsZrihuPkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767790;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=+16e+dNDcv2dBYImvr643lRCkUVbWodtDh/LFG2RZK4=;
	b=KFZzTB/fy++GP3Zioq6GuID8C7zph0aEzSJ+SKaZpQ7VX4+TeSI+dcrPeddAVJ77qCTL
	 DaPuMMlIXKy+dHMJSH4zYzUTmFW3ObnJwqAmAJ2zFT1TeUeE4IGGCoidEAqkeavsEr2KG
	 tGLHcHJfQnrX93JVp98Xk6vE7PXEQVWARg9p6R2eacHD6ckC9Y0kFBjfG3m3L5oqTwrwb
	 U622K4gyPU5yG1j+QDa6XKTcPDuUKjQLmYpshQ2yXL31UEMFvehmoo+9GPsSuMAtxgBfF
	 M0QAW/lkF6mu7+dzBCjBLCra0SuzoJUdmx7sCTYsLoT56tJ7nnlqMCz47MmFO0a5aNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbPUZZRu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC37606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbPUZZRu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDDF1F000C5;
	Sun, 15 Nov 2026 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767790;
	bh=+16e+dNDcv2dBYImvr643lRCkUVbWodtDh/LFG2RZK4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hbPUZZRu4VAokdlrtiRpf2xjWeA7++iNXNJxT6u7l+PjL5Gwamg2HAqivznXj1EWA
	 FR7APKYypzViErRzbeqpmbVqep/Jfs4x1WNH65h5jUp0ruKUUb+ZvBDyh0ZBfvxI1c
	 KdofRUAxs5ND4AnHpy3tH6g1hybft1yD1RGY5EaD19Tswz7VqfN4oToB9iXK8+3SmT
	 KuVrLhKp0HamdiAp9GZ8V2XVd7UzUGMyUvmDcaljQ9UOiTQZ8cStm8uCDDm6eT6+Cw
	 bWw3WFKV/2D8kbVSXRWEOrGkYhfvE6CmaDA25oFm422KalmHtkC7AaKzpm817VC7cG
	 P1+qFdyEDmUwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F164B3808232;
	Sun, 15 Nov 2026 18:36:29 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1794657516055390723-80ad11d1aac80df5@undined.local>
References: <undine-1794657516055390723-80ad11d1aac80df5@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1794657516055390723-80ad11d1aac80df5@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc3
X-PR-Tracked-Commit-Id: 381b391bfaa3f10d52da4740529804b0b6b8160d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 442fbdb90e120c39bc0b27ffdcc6d7733472ddb9
Message-Id: <179476778844.2691368.3325628965924170055.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:28 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>, Zhiqi Zhang <zhiqizhangg@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 14 Nov 2026 20:58:36 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/442fbdb90e120c39bc0b27ffdcc6d7733472ddb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
