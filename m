Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169191;
	b=C7n19Zs6CPelON9B+q9Ob4W8/w7RWfZubhQ+MzWmMxpCnNPKAy2i8qV1YFwzhzU6dBht
	 a26aTQD1ak4CSW2aUdv7CFE6plsEUgwG1ljeoX1QPUXFQ2i4MXzku3n6bcU9Q3VRy+njb
	 4lCfVodXHGOEY1UJMJNSTBypRz+wMqg1jYdkby28Zv04JzptH6DbWVP5ewo6skU80BJfl
	 RBgqUAXgUyNgBV++kMpTodKDRYGwUpAtiKAsx7asAtc3UVrGlRgzWU8//Ino39g9ej8hf
	 jL0oIQE3DkolY0cTHEcA957yt1Mq4ebDbSwqYGTmJtw+1TKTKEnHMj6w24Gcpx32kTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169191;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=rN41PB4qcycN/9CCB557q3Bg7hRxDX/KWe2xccqEGJE=;
	b=ixMHOWGGqVXzjUi52BU5k0Mg8F/L8cCm0oSEYRE5TFU/+5XPk4Cbo2r3ddfVnYO7ayS2
	 N0MdBfG1r2bMdvfwfa+DcXMSMN+gjPngkoobmhTEpNY9LK4zNBtoyFK8OzzpRDOfEmSwY
	 czdE0y1pmjOo97jWFHjr1WyGS9SZDt6CFUpz4950FVczGO+tRfsWjuJ6gIJnmdLt32D/s
	 YTBWnUdmSpWuXvBYUX+RzQhYceX7tsykc13C0lbGN9cUlzXQvE6aLL2DkkGdPLbZ4GzHa
	 2I17zbESP211eOXiEmo9IQVn2/L5YBu174HAO5Hv1ZrWEAeObedtkIGred1cYspvTSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bpcDdxqY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE95606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bpcDdxqY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6818A1F0089F;
	Sun,  8 Nov 2026 20:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169191;
	bh=rN41PB4qcycN/9CCB557q3Bg7hRxDX/KWe2xccqEGJE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bpcDdxqYXm9GShG1fmvm5qJvWxAvHBl/K8jY9eIBLAWa0wXBUk9ia9OoVCw7PILgX
	 UsSQPmAJWubz3SWCoPo3cyl3EOOVj4MEmmKai/upDVxH+m9bb/LFzL7Dd5nPfopHDd
	 XuGpuIfWC0gBgAtWifvTNhjJX2b/VOM3/2c02Sq3Tsi3XPerV0QuthjbUiLN6Xij0f
	 RId5xfIMT0yA/T6xMG19PhqsiaHdyi1IZEDJBdYjkCayVTbfFXhCWKsrL/y/jK7Ur0
	 QGAp7w+q7VizU+Jb7ZZYCSg5WOemtgUCSjuXgF/hKr1whXPMQHjNf/QGBLM9KHrWY4
	 9fym5o/XWpxhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E37D380821F;
	Sun,  8 Nov 2026 20:19:51 +0000 (UTC)
Subject: Re: [GIT PULL] firewire fixes for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261108005723.GA1751953@sakamocchi.jp>
References: <20261108005723.GA1751953@sakamocchi.jp>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261108005723.GA1751953@sakamocchi.jp>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-7.4-rc2
X-PR-Tracked-Commit-Id: 4acd5f806bf5569bfa3a45ea6a525936197df10c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25fccf436e6e978954bb2774170d1094889c3fc7
Message-Id: <179416918981.1696319.15529016288320772969.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 20:19:49 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 8 Nov 2026 09:57:23 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25fccf436e6e978954bb2774170d1094889c3fc7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
