Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987097;
	b=k10iugodB1YEh5+GUD7iAyBgB8QdGI89lW1mctFAtbcEbZ5WlkSiPpMAkwfgDrbITjGw
	 u34fVlYHyhDGOAXQHdHAxTYJNtWw0zkA1BBp0UniCd0rUEBKHD5yhdV5MU76Mp4F3W50S
	 XxBR1Ulrk/jL0Zn4K0Zw7HYJdy03Cox4S26/hAcGklvtgqWd9dVKSYFGv/zqt1Ci3ZrTW
	 +p7E5a3vh+QR5TtBgyOpoCwuIKXTTrc8K0wtjtmcVbTbJ6WcdmJjky9QpAYSZyuGWZN7A
	 LXHb8+OgSlTnb9KVNVjROdQomiBMCO0CS8OVQ1rGbgCFTISQOGwnG9XomaswhrIGyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987097;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Lk93Kf+O64gxYBrssm1zL4aL746kBWCKUYLz7tli6OU=;
	b=0ZS+pXWAIXsznac+Pm0IrVVmQcQSkVfIQUAh7y1RCcT7nnALEDWFS38+JR3UXZx4D8mU
	 uITaKnP9naUXiamzcAdWAG/cc4pa5UnMS48H1RMn6j7/Fk9hh1axUjlb/aBDaqDAWPDpE
	 GmxrZvpqyNgWjF1m1JDGYLQbekpZp45L4OIkCIPjRup8mvPzECtuGzdMNiniLrc+z9weR
	 9xnwBZWvrc/5O+FvHsxk6eQCB3nifvRORSsz9jRloa40zd23Nt5owReUpt+dESBzjUM8X
	 IgHZhSeTAfdCchaTNCokZZ6tcqAgnkz7cmjqEaE8+en6tTlUwcuPyhhUlaQOMvfFg8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8+hwsw1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4BA606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8+hwsw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF051F0089F;
	Fri,  6 Nov 2026 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987097;
	bh=Lk93Kf+O64gxYBrssm1zL4aL746kBWCKUYLz7tli6OU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=m8+hwsw1iNWf62I+XTNrmNboVAGQNXy1WTXNA8LnkgqF20L6pot8i/1n0kvmQVka6
	 0PchTYKPh1Rl7hd6m5nzb/AdYyWr0zrbRTvkSqiJQnpJuUm1C152547wjLKtvyuDU5
	 kSYlY9ThTMw8cdvkBE6uB+SVbMj0rr/MPDnO4cEoy4mdLCGa7XyFe5MAMhczVCfWZh
	 AY9Bs5d+u/zCM+n9yQO7Sqc3TzjPqLW7WNLZTgjCvPztTCMvlSL0YDbV2ObHSwFRw3
	 ffQWE1b8bBnu0J8hyl/tO+qLo/lh/UR6Ew2VxiAWaVG5V4pVHDw7nxaBaLIu0hiBTK
	 LpYQ3JiclYlcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 210563A41005;
	Fri,  6 Nov 2026 17:44:57 +0000 (UTC)
Subject: Re: [GIT PULL] configfs: Fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <au3_CGlshhRsbX5T@gmail.com>
References: <au3_CGlshhRsbX5T@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <au3_CGlshhRsbX5T@gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc2
X-PR-Tracked-Commit-Id: 57d94d26ed42773d6378da45eed9de03b116e7f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a91337fb5e8e0127c8b5be87be9f3027f95b48bc
Message-Id: <179398709567.773298.4816063358887763450.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 17:44:55 +0000
To: Breno Leitao <leitao@debian.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, a.hindborg@kernel.org, kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 6 Nov 2026 08:25:00 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a91337fb5e8e0127c8b5be87be9f3027f95b48bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
