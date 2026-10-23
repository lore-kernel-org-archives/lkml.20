Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794370;
	b=i772smJN+hU6eFR5f4JKH5SJEy7QdG3MAcUjyf4r8KDL1Q5Mi4BJkBb13Ipb0+YeyBXE
	 kVOwfZqeRERZJfsNuSvBKsL7YCVJ0srtzFYY+HZ5NVDqzJDUKjViXNIr0Lu9CJ5H9Qk8u
	 JTdd8V5KRZt1iURAEi5AXXMF+O7x1or2g2eTGQGRhmnT/0sUSlgKv2zJiKo1QguaSHsBT
	 Bbn9uUZM/gKeBQriEG0hHvnoiWV9XnlmNEAFJ+4ZPun3jVPVYR5IrbFdk7efSrEEE1QUw
	 q7Lo/5Y8rWWWFXPfFsJbSeHxQqChmNDeafFQlUzBxGclrzc5RDWrg5ZR6gpZ0eKsS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794370;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Gr+kDiWAoH5c56NWSvYBDFeP6GP70vfbZl+khZhMCjw=;
	b=i8sxuBcilbROC/yreOngs58lRePzrLefmehcYuaP4NA/l3NC2gJmw4mk5A7XiZbp3LVi
	 x9IHasWxGgzMw8AbP0zcdzycNFaTqraXjakj+OVp0HmoLr2vK9U4FbKkazUiW0V7Hwcmc
	 aBqB7t/M3A+lNpX/wqZfhBt0TZh7UBguV4NKaFiVtEKnoRZggcMIWSL58iUrK79TP5TDu
	 912ioGbv2lG2g2OVIIox7O+MFPsb8pzCl5ACvImeruMvly3ISsacZ0iif/puVXA2dc2pm
	 lbrx6/G2ShgcNStTvVYbWwVrcg8A753QeeCIiP2a4BtqI/9G1WosN6NAQH66KdG5sTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TG+tCf0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAF606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TG+tCf0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D891F031E5;
	Fri, 23 Oct 2026 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794370;
	bh=Gr+kDiWAoH5c56NWSvYBDFeP6GP70vfbZl+khZhMCjw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TG+tCf0PrzAKUDTbDgIoDS4d5sE5DaaDOuTQyvMAU4KAE3kMgCv1QMhUw8yEFno9B
	 sXaX1uFpw05Wzi+OqJyvl6T8gOZR0xXgfEU1TnzvdX8oD2SUOR6g7rj98pyNLGO4Q5
	 IjxdpnIfr13POB24psoraVcs4xIpzlE8qC2e4XUzYl9Gk06ikx+xUq2Kq52gscOhio
	 IsyuIQd78anF9gP+GmoB1PkLHWTks1iCIE6zzNv6OBHjFwyJ8n7mvVxHjlQTLtnyAe
	 Ce3l3ThYDP4bdSTEHc1dvhZKhIKxAlloezlignZF+YsHhqTbinGNSr2rJcRbwV38qu
	 CYeOKhdOqI+uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0732D391B158;
	Fri, 23 Oct 2026 22:26:10 +0000 (UTC)
Subject: Re: [GIT PULL][RESND] bootconfig: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1792628307230719534-5255786064a440e5@undined.local>
References: <undine-1792628307230719534-5255786064a440e5@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1792628307230719534-5255786064a440e5@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-v7.4
X-PR-Tracked-Commit-Id: 677f83795fdfc25ddc51b665a9111f5ff199f7ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90b754d40117b2889bbe847ce7bb4dcf968e7cb8
Message-Id: <179279436874.1300063.1716755371636443048.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:08 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 09:18:27 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90b754d40117b2889bbe847ce7bb4dcf968e7cb8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
