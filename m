Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682941;
	b=f21FHoA2E/zL1HSNRQYnKHrtJxJhITSlaY/MAHEcHvUUEI2E3W3I0x3JPMxtvPEcBcsM
	 OdxCp4flMvsFbFQtOSM9IUdXuUBBn57Sc6E1WisTZVZ+wZ5HFcf5RfaS41TTUSxrvkSBO
	 Q+uReGb3clE0KK98OFYwMSGlqTi+ARS0zHvJNH4j43kRNDR+MPHG+7Ld54g2P8+15xLTV
	 265WW7xzalJ3hb92t3wRt0E5gshAnlgdpSgEfoTmDXtkfh6LCXFZL3zarQNslO36k6JIe
	 RuNObtOCDKkO6HKW1BEEnv84JspgryXTH+fruu+e1cyu4VKvm5pnkvTc+YLevOg0Zlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682941;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=rTQls0dGboxwD1qIgMh/h9S9atorSO8WtqfcOKvBL1A=;
	b=tbVHOoYdzABELtkpQN14hNiSC6ABdGgYl4u5K0eNLJXCU2MhESccOz4PGUHyLF4C68K+
	 HU7qk2FmAyqg196tOwjEaoXGrksLFnSuYBZU6U9EuM2dnnAYdNDijvV+JY/KmYbGEMab7
	 0KWJqExx+/wrBfZ3IEW9CWFSeniqSQClrL00F6VlTChWNW1rIz/7fNsFSxecYxmW0x3dQ
	 FtESGTHyCIMQyTFGZQcssInGyyz1YEOyD2Vh/a2jVceTKEUMsUJyhVpx6H3OKg7awf18B
	 AzfK+4NroCNogG4zJGpZFtT6vDdb2czPFoW7UOeToPmKbcFkUlJN/wYF11X7LRvP5tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntvIk4zq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89CF606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntvIk4zq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455721F000C5;
	Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682941;
	bh=rTQls0dGboxwD1qIgMh/h9S9atorSO8WtqfcOKvBL1A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ntvIk4zq2LSQ3UPFUCf0GTUwugijQsuTnZxHY/vaLHJe9xsbbJQEAr8m6EMtAqYQK
	 19FmFmhbSjS8Q7eE82HLKxGZdMdOZ2K8/RioCI3lDHN44hdTYqiJ6nIJbTJ8JOpMFU
	 7ZyJ4tGlJFtDhr4uzjhyFjn3jV0XVilPhoB3VbIMfkrYXC/xTAkn0sY6af8fdOrzHG
	 DSdP4cqz628t8jzbyW6s7DI2jHAoecGyhALPAA2xCR5koy+r7WEAYJO81b8/jRTkmg
	 0Lk49a8kClXI/XIQrScEPzqrqrnWkyktY880vESYWbS9Qqw95NKlNdC7A577Vovw2y
	 FG6NbtzMENwLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A55E380821F;
	Sat, 14 Nov 2026 19:02:21 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261114064543.1079564-1-jgross@suse.com>
References: <20261114064543.1079564-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20261114064543.1079564-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag
X-PR-Tracked-Commit-Id: 2b66f2cc753243a6adb3e9a5c038b0fc59ba7ec9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23c62304dde29abe92013d85910d03a77dada35d
Message-Id: <179468293974.2342540.13763964076757328991.pr-tracker-bot@kernel.org>
Date: Sat, 14 Nov 2026 19:02:19 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 14 Nov 2026 07:45:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23c62304dde29abe92013d85910d03a77dada35d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
