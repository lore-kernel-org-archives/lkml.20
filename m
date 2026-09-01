Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7143231C;
	Tue,  1 Sep 2026 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234921; cv=none; b=gY4tqcNkKbPCT2L+6mDIKsFDuk9Dypaslw20f32Rv89F0nXNxQ9Vum2cP7ONXm6F5SjwIT5gaCHh/mw5GwpC7XzUQYGIWOQRIGFZYEVDzOf827N8mWx4zBGl99QkvjG9FVl6r/R+m0eYg/ag8kSAcVxa+YkW3dlQ2gcIYHZyOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234921; c=relaxed/simple;
	bh=PphYRpmvj/zx5gUjvTXs+TOy2yJCk7S2zqnejw+oF9c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ns7h224KdQfrzDKuPCmkGqfdt6SLABOzLqo7OBzJuUPdOyiwt9mrmwDxLmSV41gqfzPHEgDrcqj9PgSsOBST/jEuVn2FyN6mjsl/pbu1EX5OzndUg8CATvrwXkEIhPF2wSBkE2tLDNXJmkJkbUZx1NeO2NjZA8mRlI4hvLbMlKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRw5JXXj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRw5JXXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B071F000E9;
	Tue,  1 Sep 2026 03:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788234920;
	bh=1IZypuBDGPEMKFi6QrkKgP0WnADBbEG2exWlReEvtNM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gRw5JXXjr6SDuxkeA4Yo/GTTSG2UlUdv4kHhIw78R4lRWpmtz2Pw3S5CD1XMEtED+
	 u2knq0OOH3lCe1CvBxjoz4+WfmgzWe/sh6VZSQIDG3V5Zr7WkZsyFdr8QrUg1om15+
	 aEjASEA3R/wJ0Fd/AHfobH1c35rliZY7A4VJt8Brw+fDnJisgkytZmjlbal3soOvXW
	 1OM0I8rduERt2kBPGkWRGAuJmJ65wWCsPn3L4x4jpmEbVknAe9/Kgud1JIB+o8WvhW
	 YEQaLvqKwF101NNyHKAYTGvAnHGvBc8YDlKqfd2FFJ90d11hpzVLEKCPQbYqLRRDvi
	 C9Xi15dIHH7Fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A3A3924A52;
	Tue,  1 Sep 2026 03:54:24 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260901030948.GAapZB_HCk7wi9A5OP@fat_crate.local>
References: <20260901030948.GAapZB_HCk7wi9A5OP@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260901030948.GAapZB_HCk7wi9A5OP@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.3_rc2
X-PR-Tracked-Commit-Id: 68c90773f40f91f48a557e9fa65e2a72cebc58df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 786262be6048deab760f68c8acc2c85607165894
Message-Id: <178823486276.926089.16311579816508162968.pr-tracker-bot@kernel.org>
Date: Tue, 01 Sep 2026 03:54:22 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Aug 2026 20:09:48 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.3_rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/786262be6048deab760f68c8acc2c85607165894

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
