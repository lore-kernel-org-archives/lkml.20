Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE543CE72
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041016; cv=none; b=LrT7YNNYNzxzrFbiM5nvZ1G7Gr5gXph1zdy24sGOa4uLDLKxlvM9dIQs7dTJqste8ZDpDYKNFMnLBFo43BWsPLytyrE6UQ3p05c9XvTtYC3oANiN/wmb3IYg3Q1Fxr8dIeynvetHJxemFMAb11Cg2glhlWr76EIUWMM7kTLvHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041016; c=relaxed/simple;
	bh=XInwACnyj/20mkClekrZFldwA87gy+shTIfUKXsZOP8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ULuwoaFTH2bkyq018QxQLWA1AqVWzYX5CiTH5CmoarL/ph8vGqqQVScFetnFNAgnHlnUkeEPdTiPa7j5j1O/yeLmB5jBZydfkqspeE3Y8+Ea2acaCRQyYi3zrcMouJQAetTbeIyRwfzc3+247btrOUUm4oL21pk+zR0ciS0l2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et6VSceP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et6VSceP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451821F0089B;
	Sat,  3 Oct 2026 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041015;
	bh=ntJ0Sl9+vDNqAIzlkhpF2rE8mLtf9FfUKVEYa6vIxG8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=et6VScePntro2bWHv24NDKKM0kDLd6V4aFIsC0UU1TyHXmVVSFW+fwQ6BPTjiXG5V
	 T7igamHNkauShfE+lDZjOMoD9bITZd/6R7kBn4kEgFikN181xEuJid43PgIv3DUSoa
	 m+Zc5GVzPE/y0OXIN1uUEAJfEXFWOtw7SUWlSaflpVdOY1lgnJs0HRGOHYwxSeGUDk
	 ANs1A9DEk7Wkv7cClcdhCbwbo6dBXNSPl4Lovic2WUJhmVZsMgzML2bxlwVOVnAGGs
	 DVqDsMeRTUdHKgnyQALqrj3JgRozpR7Eu5r/jqw9YoMRmiIe8idyVZ76E8SPMbUa9f
	 zTEOmi5tk0zsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4013924470;
	Sat,  3 Oct 2026 15:23:35 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzVwVzu5NsshoL0Jgjs3aSiN_aE44H+H54+FNE1F2GKpw@mail.gmail.com>
References: <CAPM=9tzVwVzu5NsshoL0Jgjs3aSiN_aE44H+H54+FNE1F2GKpw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzVwVzu5NsshoL0Jgjs3aSiN_aE44H+H54+FNE1F2GKpw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-03
X-PR-Tracked-Commit-Id: 9c979cba980522f044ea2b14d8cab87ea3cddb56
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7c918b8d9f789e79ebedbc7660b682aa1984210
Message-Id: <179104101383.114271.11229231104800298557.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 15:23:33 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 19:12:23 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7c918b8d9f789e79ebedbc7660b682aa1984210

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
