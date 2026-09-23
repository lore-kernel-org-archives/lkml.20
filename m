Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D318B3B895A;
	Wed, 23 Sep 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202674; cv=none; b=VeafcdHTNj9/MooHSrSb0ykMRvoOhdSFWqfoMYsiyzG1TFJe0ZYtjWxOnqtOX9ipfhpm4rKkyp3Yf/jl0I0Mmjf322fnv+72UJxcKmVuSTAxPXKScXuKv3SJzD2fvdO3hcM5Nqn5hFvAacXjKR5xXrue+JIuuF4jwQhBN2jWTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202674; c=relaxed/simple;
	bh=w7XfjU9UnIxLGFJJlSAtKQj5p4cHkRASZDMPWhJgZmE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WrBuZClA6707lURH+B9GiTqt2naBgX/6elULzmIrt3JKyvNTmd7JPmasEGJhOjLh8YmkuKLpfkkimHjzlca3dKgDBxayfGnEdScF4qymWJX7kNhyehkCN4XtPAQdaHC/rVOEyeOBU2cNT2x00CIhs6BTs1dSuRHF/Mxx5sJiCKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJl0KE7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJl0KE7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F201F000FF;
	Wed, 23 Sep 2026 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790202673;
	bh=Z1gFQFsVERABFG9WhtIQJgkmxjNq/ASJj/MHbTXisW8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gJl0KE7iMVJQfW7Oxx91VW5K7jtOMu+0tFPyeqtBuv4qvxucXn6WBirVbYtAL3moa
	 3tlSMvyv484iee0gXOTDaaXFxD/wcNVM01wba1pcH62zBVSiS0DX5wtwc2SzxLz+q6
	 MMkhYUxcLRsqsu3UIlK9OSu951Eo36aLBO574Xi+4v4x3L4yXUhd/0yO4YVETPtRY/
	 lutw1O0cG+rj3axGzvL+W/LCenWBztZp0z9AS9ity4rR9yrSItP5awj2mmgQmiWAhT
	 QYcrp6LtuGA/5PyzqQxqxUXbceNBO/uozs8O3DbKBxsdF+ZbrnyKtxTzv0wAKlymLz
	 IUIBQPHWG2psg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198D939E8A7F;
	Wed, 23 Sep 2026 22:30:04 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v7.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <arQ_8PdL1PPCVXh_@p100>
References: <arQ_8PdL1PPCVXh_@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <arQ_8PdL1PPCVXh_@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc5
X-PR-Tracked-Commit-Id: 94b7e3a7e871ae27d4935c76959dfc61829f27f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
Message-Id: <179020260281.732882.12624055437465903504.pr-tracker-bot@kernel.org>
Date: Wed, 23 Sep 2026 22:30:02 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 23 Sep 2026 23:09:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/62f4c998b297cf233997a2b4cd6fc2d2df0319c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
