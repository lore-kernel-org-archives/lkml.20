Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849415;
	b=Majgu8hRyJ7MSB1KX0o8KTMV+YnIx0HVD0X8eXmmTDBqlh0O5Dssg+8UZEYkgiyn9mAI
	 Dk1+w2KDjbeA+dS4DPwc4UZlRcLn02K5rzgpTUXGpKhBXyzT/M/RlWmXIXucdNT59+Ig1
	 GPKnF0GXTIHfB7dgAlXDuXbw02ay3FqEyWw25i4LkrwHhL3g90Pt4i1N3piNpauSF/PAK
	 jgG0SFSW0i6aGBl0xIJZ/d3DRnRfE9rQIBmRbBuucHzWunecdO4zMlRlRGpfvoh94YHW5
	 m8Gic55NBO+XQSHHL35d4ox6moey0fFrQ591RkLFVPcFlmCTRXJwridkbn/4NXg1YfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849415;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FWCmDJYn06wmclYL/C3CWZHSD6pLT7nEY3iSZCJIB3w=;
	b=GMeAEUsDPGNpmxgggAPAP1v3Pr0gDKwU7XBXNBsoZuIjXQvNBD2rsN2c+K0NCwmkgs4t
	 Cj4MobM2ZmlX369zqKVU4NmUXihuUxzoC7dqbi0znkKSguFwUmJXQs2bbpmVlZaPu7YQD
	 KMl3qBoR5PUVCbyREEipxw3PiQsmoFFPrAnbn0HS/ZpuEPK+xlrUCiPixcUbSzfZkZG10
	 nZaiKdURkAElaXAPtBjsiT+Q09GxNk9MaKtqxc7sy4WHU4J8rHrUA57hGKJwr1RBl2C5n
	 YTr/hjEYeVYEnf905Pr6ZYx4+pQ9B30xxspTRSwpnJGqNczUtPc0kUpUpjcNAscPOyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMXVRtC9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B204606A880;
	Mon, 16 Nov 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMXVRtC9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083661F000CF;
	Mon, 16 Nov 2026 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849415;
	bh=FWCmDJYn06wmclYL/C3CWZHSD6pLT7nEY3iSZCJIB3w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JMXVRtC9bNP7baAwUaxhhwtW9nVXLw5ReSLwJiM7poH1gOoSVFalKuIzw7Ouq1BtI
	 dhJc4JJJ/+g2pQqDMfnGvTuSCtrH24cU4XtwhOEVAk3Ki732A22lxh1Da7i85EMoRQ
	 CyzGYYuC7ZpFzWa86UxybLVlWmjzhu5Fn1BI8QchZ+/3wlqgLOiX/QqS4EJsEnrZ5G
	 YZjOMPDkP1lIWh3KnYnl1CWzXcIbEJEuheupSPUrUB0a22+OGmzffQ3RMbYrEvvP6B
	 anVEczStseo548lxC6+8t9pwHIi96ZCcRuBCJOXnuHddkod4xOcBGRvpGdLdH5bjIk
	 8VdJA8geuFF3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14E1391AFAE;
	Mon, 16 Nov 2026 17:16:54 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <avreo7CCI_5RU7cg@kroah.com>
References: <avreo7CCI_5RU7cg@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <avreo7CCI_5RU7cg@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc4
X-PR-Tracked-Commit-Id: 3149e8b3237f58d4dd440fc64c45c93404c4b064
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
Message-Id: <179484941382.3777341.15816955644192966249.pr-tracker-bot@kernel.org>
Date: Mon, 16 Nov 2026 17:16:53 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 16 Nov 2026 11:44:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f11fe7603df07fbb9fa02b0d385c1696c87a6dab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
