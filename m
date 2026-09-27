Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31483435A80
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538568; cv=none; b=WXgPhVmrW2Z+kxo0Ho8fK2qs+1oRlo5E9kTNGecqhIFvoLO9k7COBolTUPGv9yPzXO/W28MMHvKXlDh+/MsVu44QlqY32cbOBx3ft7oYeqfnZIIhz+l9GqYAUtMvOShd64bbCPtLYNUlygzMao41CtMPO+m6zGX45GwbsbevjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538568; c=relaxed/simple;
	bh=hnjHs49q6rdmch7u05jnGrJsydAY6vuFqwo2AaENAC8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kHVV7wPfEj+v5iosqSnj+C6b9wzC0Ik0gT/Q05K2DsWPBv86gVLN5CoRyPkqWnSaWbE6LS3+smK+6GS+RdEYranyEhrGs4up8uA3ELBw39x2u1xuhV5wonKI/NMlX9UpQDp9WAIAIwH4SjdSxpfa8kybU3gdSIl9cZKYQlKPhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHVDyVU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHVDyVU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177251F00893;
	Sun, 27 Sep 2026 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538565;
	bh=t3Yu2ZIoPsSX0R6x7ogre1DX5YdqzBoDfK77HjhZLa8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NHVDyVU2XKilUrEBoDv8ZiTi++ko26kTQuUpTSHJZA7hd+w4qIUPpKbrr/k5/gozs
	 gWb8I6xCfCn3uqQWuvhFtF/tOU1cl7wh9PRwtYJBjWbD+4rHtAnVUnSRmZVA44fZGZ
	 S+HzX2g9j+0aK6eVmuAKag2Fv/V2ZY0LxSzjBcB40hkUvptA+Zc+B8GeAfTUQHuZa+
	 5rGu/6DSmm34SbIVl8BR33wcnK41xgqjfh5hUgqw8K7OZR1ET+/3CjM/41EgGO7OXZ
	 48K0DEdzkRqGKBWkhWVpikW0CSx5y0Sd+hkpoRZBH1ihqmiyPpb41i6GGK888Kz8KK
	 Lwzfk2SLzZitw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ED41A380AA5F;
	Sun, 27 Sep 2026 19:48:11 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <6b8546a8a2435140a96c6d8351c06227@kernel.org>
References: <6b8546a8a2435140a96c6d8351c06227@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <6b8546a8a2435140a96c6d8351c06227@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc4-fixes
X-PR-Tracked-Commit-Id: db6365ced4d5855e321f772b240c0e473bcfcdd5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 104484baf7484266fa0cb8b26362b105cf2d6a10
Message-Id: <179053849057.2777566.7333347080773626174.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:48:10 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Sep 2026 22:49:06 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc4-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/104484baf7484266fa0cb8b26362b105cf2d6a10

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
