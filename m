Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19497451049
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775219; cv=none; b=Tdf/vC+iMrDci79oBXwG3s3+06bmaRXgZ6blB5KAvP081VII0sPFjgqxn8P1RZbPis9pSBeSK99cbkWSRLwdq4y1MBBFPUUuFM6scOSrOEfGjx04gwGfyL9aS7kmpmDsBHBVT+8NdeFEDUe761A30EGTujk7DMYq8WmZqhNK8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775219; c=relaxed/simple;
	bh=ipJkf74uUlDU/9cq4QJ3outAphs0/rAfDVy6kyPJBSg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pOk8lhehr6GK7fRiagnDTOIhHOi+e5FJ7KSuLY9sgrM6DPenIiUgd/1BSTgkQo8/IUE2DFXmDrcsnO6g7McdXUyFYFTbSDFSr7BpAk1cw6J5enLC9navo5Pl9UlROTtvDnJfviz5Ypx+xeRwTwsqXTvrVmi9++QVEJi3EAtCUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEOPZ4C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEOPZ4C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55E61F000FF;
	Fri, 18 Sep 2026 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789775216;
	bh=s2Zok4+sRmuTh9bTb95MbeiTB30WDV5CdXO2vJdNr8o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XEOPZ4C56Phi60+aRJ0+AO+1Wa0MYe9PmDXSp1gL5WMxMqwuMtgPpt+6/okLD8sDY
	 krpyy6ROksDSczMI3Ms2jmcRGuyHLlx9zhLv1ehTvRDnRWtqp4lt2TnRdBo26p3fc5
	 QOph68vIE6WOnSON4crAiVWk5TDFMdsqd9/JYzDabHNZJ0Fs1spgB6VduzQO8++faP
	 oJ4VGC619lJDcYmcaUpbzekL3ITkBOJaKSIAMwCixnx1uwdzttC9JE/HTlFNFn/I1J
	 0dNeTNVZp6s1u2OH+z9Jl8FzTLIVAOW8HXuKL1BicV8NYiCwJ/XGoZnNikYeoTqW1l
	 em/86aefmnpVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0E313811977;
	Fri, 18 Sep 2026 23:45:50 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyHWoVvi75xn2duuoMm=MMux5fmBSx=UjbNkPAvbZZ3Nw@mail.gmail.com>
References: <CAPM=9tyHWoVvi75xn2duuoMm=MMux5fmBSx=UjbNkPAvbZZ3Nw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyHWoVvi75xn2duuoMm=MMux5fmBSx=UjbNkPAvbZZ3Nw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-19
X-PR-Tracked-Commit-Id: 71f370e9ee1bdfe1f916547089d93b5265a918e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40288c9206c17eb66a603262e06a58d300d0f279
Message-Id: <178977514946.1191559.17325193394068189608.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 23:45:49 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Sep 2026 08:16:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40288c9206c17eb66a603262e06a58d300d0f279

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
