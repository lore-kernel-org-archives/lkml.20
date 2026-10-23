Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785489;
	b=Vf690gigffTVywepyIiiG47tUX0twroDIyxl0il8NP9MSd8L+9HCh59nVlxhIT1D8wha
	 S3W/fZru3ILN0xh3VKeU7TudW95761D/iCcl9Sf27ofn6qmSlJvBoNt1WZNORcdGQI1OW
	 d7ZozHLnSyLZjrbd+6++6vdDWEkIX9ZL2ZpMD6TCPcWTaEZIFS7GT9kZBCo4jY2Cu0V3n
	 +WbJLNGP2KMgXsXQzk3EbS48LXqIMkRKPFnqcqTsoiVi81yX6ZySwQFxsZ/2MyiU2ZXdI
	 g9l0quN7y3N+fzoAWXm4sY/MSDBqU9datFMOV1LrCW/BfN290+kCBmamI6J6dxNPgnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785489;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=SoLUd57UpurzCp3TfNrochKgqeTvNyyRQnHVp8etxRw=;
	b=sjP8yWN5joQYBK3vWOGlPsKZ+jPAV0oxj5y5ZaTM2KZGNlpQro5mMXzHkiJYEcbd9Tti
	 V7hNyrsxcTl19VFKHBPW6nTAxor4KbdtuDu4JYSxVeR9xm1FiLV6mT12QMeVEV6VvMUDj
	 qiFGcybpLFqoamTCI4el/7W0zo6/WKha13uoqUrxvVugA6sLsYeMRCUzkmCvsP/NM03ua
	 ky3Wx6yYVw9fCMPiTqMol5qHFp7emBHzQguUn5sXbNOtUqBhHOHD23WeiQQT+pdeo3Ztg
	 thg8jI7DptScCt0c67suBuJzqOoGBWQsmDXXOFc4yAL1cJAw1+OnK0VeIM0S21U+IDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ1qq0pg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BEA606B2A6
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ1qq0pg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4901F01828;
	Fri, 23 Oct 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785488;
	bh=SoLUd57UpurzCp3TfNrochKgqeTvNyyRQnHVp8etxRw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WJ1qq0pgTQP6p/PgBL1uXk1Nxpqk5rDGgeTaqGJT7hM4te6Tk+yIw9Cy2EQr2wDBu
	 PmowCgiyDFyG56bZSg9gABAOKtpVHfzOLiFUBQyfzMI54aw052D/2UDrSqJRbvaSov
	 sVFvUigNGma3uE0ygFwZnxcfTXl/9qIiTbbU2QA1fQsevaPrD9pa6wzPok2f02f60y
	 4jgsnnbQsCn7EMFqwOYopURxynkq422HW3stKLoGxgjyGdusNQYAewXbXA0CMVBpJl
	 r/+c+3imJmoGkV6nLpOEiENr3jEoLsDR0/M+oMbLIR/HlBrr4KUn4e6rssTYYzRU6G
	 LNPpyPny57TWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 44681391B153;
	Fri, 23 Oct 2026 19:58:08 +0000 (UTC)
Subject: Re: [GIT PULL] slab updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atoJsKNb5KiE44jl@thinkstation>
References: <atoJsKNb5KiE44jl@thinkstation>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atoJsKNb5KiE44jl@thinkstation>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.4
X-PR-Tracked-Commit-Id: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a78f7ba9f24962c8033e0152bf34a7903ff61ba
Message-Id: <179278548679.1241373.15147187620040740346.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 19:58:06 +0000
To: Harry Yoo <harry@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, Imre Kaloz <kaloz@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>, Longlong Xia <xialonglong@kylinos.cn>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 14:10:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a78f7ba9f24962c8033e0152bf34a7903ff61ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
