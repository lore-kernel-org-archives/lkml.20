Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741F1A38F9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966071; cv=none; b=Tc2BdhBCGHV5WJ+J/VfhFn+C5hHg1MAI7x930e9TsWzDGS0iatlb9GdPZ8lO3Zm+OsXG1Xcba8jxoMiun3vb414/jqzDFh/Ncy3/3Ez/3c+xktmFfSpPSD8TISMaUeONrO6sgBIsq6kFHbiBF9D28agPTlysB9E7K9Q5txBYUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966071; c=relaxed/simple;
	bh=WZxx8VEt9F1hbQqSW2mJ6uMnaq0DU9VwIjW8V+nVI8k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oi0RJRDnrPRw85XUOX6yTm4I1JBkFicMsj8Zwmi7WJO/jnbf70opCnAEPy/hDggUPynYA+FwOwst/XeA0HWdqzYq1a7PulLXWnJl7w7je4UZRBXG4LpC4g6ZtIJ/3HDVNzoS4e6Vc1Qs3SyEMabBrprUDZoXxm8WnmgCPFidaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kji/DacW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kji/DacW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B68E1F000E9;
	Sat, 29 Aug 2026 01:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787966070;
	bh=yfOqs4Y1GT3QzLLMm9yIBGTYHIUt4SmviDY7AGZDR0k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Kji/DacWZ9AkqALujfenDhd+JXoaXyrwZRmcAceVCVJ0elLr0ClTWWdfp6cD2fZ9p
	 aBLsRNg0mpPDpxaacGlag7N8jTram4W9XNnQKU4U8HTcsJki6J+BrxfhrvFLf2sKQv
	 iCKsus6XXhy5snKL8AOQVGiVT5gnROQRRJy3pxypBUuFpM9XvzD/Tngh0ni3PS4fNh
	 oFJjlGvSm5YpDV0Iyo5vy50R535KJ7JwM+8XkQIMxgtrgnKX3qSrHteGrfs0Fj6SU9
	 ioQt6oax5nfAA5sxOBoW8H3rUPJGHAHSQAX6NbjlF0QKKogiIwfvlAtrZB4G/gHZ/a
	 4Ow351p1ZoS6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19C23380AA69;
	Sat, 29 Aug 2026 01:13:36 +0000 (UTC)
Subject: Re: [git pull] drm next / fixes for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz+KjNRJzYWKA-snStcyh8HpXEbCfWw_zwqEUQ+hANcdg@mail.gmail.com>
References: <CAPM=9tz+KjNRJzYWKA-snStcyh8HpXEbCfWw_zwqEUQ+hANcdg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz+KjNRJzYWKA-snStcyh8HpXEbCfWw_zwqEUQ+hANcdg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-08-29
X-PR-Tracked-Commit-Id: a8b02aa825803e6c5b6b27340f583900afa0861d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a99d741df7372f2175677673d78a6335f3e0706f
Message-Id: <178796601460.2866694.15417528546708724262.pr-tracker-bot@kernel.org>
Date: Sat, 29 Aug 2026 01:13:34 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Aug 2026 07:22:05 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-08-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a99d741df7372f2175677673d78a6335f3e0706f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
