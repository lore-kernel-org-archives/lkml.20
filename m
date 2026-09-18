Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831951C059
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755121; cv=none; b=iV89hHZVYKGfnWe/U+URhgXHCLQerIydJgrCP2SHYVfjUzxh8xN+E4Ul3bt6unGt/dMXFWGeMHQOy/RBPRxPM6AIQGOV2k6QbqGDOxGhAAmF2iLOA4jVw88XzRCFcrBvhmqTSv7OBHB3SN9ouwxVWqDvea5lfa/YKM24BoiRCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755121; c=relaxed/simple;
	bh=IjGdqEyPgHbHrgcnkKTXDf+wcKo8gV4iYVXzHHV4N/U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hFgpnm8QFCjc2wCIAl5SeMFLb2LoF5Gv0ztaGmazP/eZ2gciutcyIYmqS49Jo9sK6PDI/zj9w53dOtGDUPajpiyhvtRbszWSdUe4me5gLFtvvu1GxTA8hDAJI3zLXHlbQzl1twAFvihuuM5QIRLH5NisRylayjqj1zmG/P1zEDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvbHAMHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvbHAMHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC721F00899;
	Fri, 18 Sep 2026 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789755118;
	bh=FwW+VHJnl4vmCbTVM0TI4FLmMv66XkXeTYuIjwYIIC0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FvbHAMHSZKeK8MYGph73pOXfQAfkIbOHiO8a7Bhr0BQo+vE42+F+AOm/zwQiegjBD
	 /kfB7TB/wKXvqi6CBkdx5E6Bw5ErALlf8QNXf59vYI0R+C0QVagRPBkLql++dEutZy
	 iZQYgLDAIxqeZ5aqB2MIrKjFgztoD1CG7cV6D8kq/+wtTaouys5WPX75Ma4a0df+xg
	 vSi3ZP7lLKYUsNirAx24oRcovLrGV52KaKAS6+wKmUA3PGeaugDILCSl8axFXxa3/R
	 EUHMUYvsoxWNVsnfcZn+AcbT7L1El++NjpEWYdsBrILreBgUJOfXdXWjeA1AFVi1bJ
	 7Q+UjqM3fpHyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198BD380DBEC;
	Fri, 18 Sep 2026 18:10:53 +0000 (UTC)
Subject: Re: [GIT PULL] ksmbd server fixes for 7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd9JO_5Rr-09YbFKdxr6jARFDgqK8+hd5JP83_PB9TZssw@mail.gmail.com>
References: <CAKYAXd9JO_5Rr-09YbFKdxr6jARFDgqK8+hd5JP83_PB9TZssw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd9JO_5Rr-09YbFKdxr6jARFDgqK8+hd5JP83_PB9TZssw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc4
X-PR-Tracked-Commit-Id: 9fa26285ae70ac2d3d1b47459a6b4463ab053e1c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3d85c669d09007aeb9eb9f3d28d8c863401f83f
Message-Id: <178975505199.1083250.5063891537270413166.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 18:10:51 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 23:44:00 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3d85c669d09007aeb9eb9f3d28d8c863401f83f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
