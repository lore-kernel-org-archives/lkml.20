Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87A314A86
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788808; cv=none; b=mdquuTLMiukuURdOLAIET4UhUfOehPeoOBv6fzJgenQ+v1n6ZYUINHYjJL7Rb37gjC0wBabhn89u4Fu7348092itopmxxjzFnp6RpzGlFET0xuL+v4O/Hdrc2IfKUPeCp6AGK/+mw1fj1ERHYRkQaWl9UtgersUifIcDXJmGVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788808; c=relaxed/simple;
	bh=hxudOqm9uSRpIR01cddyWtIWsXleixqO2bek6O6JJCY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QOvOiNDhHgDclUK+ES/J8SSgLJQYa2cU9OeIkWGTJ9lPYdktBuUg/F0UsocQsAykNRfhqc8nm+47lZL/iwQLphP2V702P/zxEMScrv+Lydyc8gV499uaU+02U1p4Z778Guml/yZYDNirVnRsh6cp7KHBO9XX5IUZhCfnm0HjDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckndykqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckndykqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9111F00898;
	Wed, 30 Sep 2026 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788806;
	bh=S5SovKu31nc0diQzX42s1+cZ/X3J7FUudvMNU5K5FaY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ckndykqqNUOSFtGG/pMBSGotblsKgMn4ceJAhSb0AZOGbXC6TTVQxcWW+nYhJ158o
	 5i0c2DlNDGZV9fPEByQO0NXQIq/oHJ1cZHJrdiZTLzQpv7U93BtuksiY5OLTmiixoj
	 atFvYY6NMzprSrqdEuWM8uMaJN9D4hZfcmSx+NGJMF4V5AX3BBNiwS3jJ0/B6AjEbt
	 X1YowmimXY4C5rLituG1hiqM6xyzlm79+9IsSNHHcufLKB5lnqkcTn5k75AS3cablJ
	 MLvlGxw6FqnEfEtmSiBHNmYsKaoixh6BCvbFklrpswHm3HqKqhWaN+RkpSoJOB+hvU
	 M/2NVeixb/EEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43773A566F2;
	Wed, 30 Sep 2026 17:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject device aliasing without a
 multi-device configuration
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179078880553.2027760.391939361418091885.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 17:20:05 +0000
References: <20260918133922.8163-1-jsjlee1020@gmail.com>
In-Reply-To: <20260918133922.8163-1-jsjlee1020@gmail.com>
To: Seongjae Jeong <jsjlee1020@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org,
 syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, daehojeong@google.com,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 18 Sep 2026 13:39:22 +0000 you wrote:
> A malformed F2FS image can enable F2FS_FEATURE_DEVICE_ALIAS without
> providing a multi-device configuration. For a regular single-device
> filesystem, f2fs_scan_devices() returns without allocating sbi->devs.
> 
> In this state, f2fs_dev_is_alloc_blocked() passes the device alias
> feature check and dereferences FDEV(0), resulting in a NULL pointer
> dereference during segment allocation.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: reject device aliasing without a multi-device configuration
    https://git.kernel.org/jaegeuk/f2fs/c/7566fec606d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


