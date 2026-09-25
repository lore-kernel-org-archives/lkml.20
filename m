Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56004501F49
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377634; cv=none; b=f+vIxqsjAqwaDnQXMJ4D0swz5AfcWAa5xLP4HccECoeNFwdC7q5r317EnzHWBT8DQHAu1AabRmKfQj8ZU4SOZjmaksCOMggWMf1IZd9oQRBfcmI2pqGAHx3j3Lhn+Krl8G8CAWqYBo9DeV+lBOk/C+kgQ69KCV5Hs2uqehMqSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377634; c=relaxed/simple;
	bh=UXH2Dl3jEr0DuXXIvsRLGxWJQjqggBhpnnJ5MwGXsPs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ph4nN+vpHpaSr9n7rUMAB5Fdio1qLMRE6hSguLt4tGXp97gBWXNCnoK4FADlzW3IMIdHliPOAI1e76TecgB4O5sGxWc58MCJkBetoZhREPQe7sHYBUtIWl0IqWjRvPBJfuV8ozcQ3ve9zD2tMG3kLqccgasOaPr1U4ecXiwckRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9PWEHpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9PWEHpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09F11F000FF;
	Fri, 25 Sep 2026 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377632;
	bh=iL1Os5cJNzRTGk3HlBvSKm7ZvK/CpuePZU4NA2h0+D4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Z9PWEHpaT/3UvqdMsoZXwicQzvmcGVJZHHTDLF6hYomvp3N5Wt+9IjnUiGzpCaDuS
	 kyZxytJiDrTr+OhWj18Say1UDkL5CuNGUBgrlTsJzwLcGfkLsI094Rt1/JdqvvfpVM
	 7yaKZQPCJX3rSzA6ZOP+IgKAa6S+sEKV3p/LR792HiElWukMzz+Cy/XTHLFVKvileT
	 K329F9vgkE0+80Zpt13jiQ5vb2gNAwuQ41b6Q7tGPfCj2TTLuNet7rZxtfqOiS1vtR
	 5J/ufCBeTKArEkYTy1UFR+UogPjFSIyTs1AUcjMq9WdyV/NhU65m4QqYHpGKwtJXmG
	 O+AZbNbKJXMfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C6C380820D;
	Fri, 25 Sep 2026 23:06:01 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twjOfCE5-LzepSB58uaQtn4kS2yF2sOu52kiJp2xkJXkQ@mail.gmail.com>
References: <CAPM=9twjOfCE5-LzepSB58uaQtn4kS2yF2sOu52kiJp2xkJXkQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twjOfCE5-LzepSB58uaQtn4kS2yF2sOu52kiJp2xkJXkQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-26
X-PR-Tracked-Commit-Id: a9ed3aa9b87ee41e8ab3ff471b1331c154767e45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
Message-Id: <179037756003.3195274.16267321532601727285.pr-tracker-bot@kernel.org>
Date: Fri, 25 Sep 2026 23:06:00 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Sep 2026 08:31:46 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6812ce4e4379ffc99c52401ec28f0d7ffbc36206

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
