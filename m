Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2115650EE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930635; cv=none; b=T8A90Nu/DVIsL7pjfsY2MSl7iIrBPfqFb2xsMzPRtfQrw+MOQJ25gtaWmhgqknuyWFGIJ8C28g2WcEdpuMDI3N7US/Z2qrHethlMj44NLtfcccj3w6AbTOsIBtsnnoop32UTYkLQTD13iaefeuN2fv3Wj1UionsW83ZF/cfv+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930635; c=relaxed/simple;
	bh=EJr1MuoBatojglNQUgiQH8IOZzRUxE+w0v996NBpGlk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QKui9RGZBHXqwC3hZmghMebSeCcAUp4U24M8hinqRLfR8s9pwqU6NENx2ngxVhj7O5dL/IBI/RkgfGinS+mgHs/PUoS5T9rh3LjCrhCSSu8HXmioaM+39XddnhoM9iW44Z+efJ6ZdT+/Rsjvu7kSoFZwtS+tRKCuMU26Y7ERMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GG9k4t2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GG9k4t2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B961F00893;
	Tue, 13 Oct 2026 22:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930629;
	bh=X7/uKeE/+oIcs3CACNXtRNe+WMreIgFyM/jVJG64BJE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GG9k4t2y1gkxV6RA7JOUo/4OFI5IE45bPo19MxkCrzPH0kgCFs9G0Edka5XwWMIDy
	 MYJHniHeEBuOiDPlGNPv1JO9v3PYg1q8pHP6Dx5HHU+/URluL5jkLbg93a1ekzHfpt
	 A3nyiS8XM7Kk+ePD2yaKGoYjHn1xOs8wExFyQvtZgb9nHVy1H+L32bLaYh8NnuQ0fs
	 RII7T3GB50O2tkv24fYsJfirXpU8vyeOm1JqXBiRY4qdQpT1UQA0YE/jqOFFuub5E2
	 VfenPhPlnzFUSQ/Lzv9azmP69q+Q3SDnot25bKtaNwM2avuHktXwNgBM/aR37t8Ghn
	 HEPlDbrv73fnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14DD39E4DBA;
	Tue, 13 Oct 2026 22:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert inline quota files when turning
 quota on
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193062775.1493834.5789106553835125031.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:27 +0000
References: <20261004170456.4104287-1-daeho43@gmail.com>
In-Reply-To: <20261004170456.4104287-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  4 Oct 2026 17:04:56 +0000 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With a block size larger than 4KB, the inline data area is large enough
> to hold a freshly created quota file (quotacheck writes 6KB), so
> aquota.user/aquota.group stay inline after quotaon. f2fs does not
> expect quota files to be inline, and this causes two problems:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: convert inline quota files when turning quota on
    https://git.kernel.org/jaegeuk/f2fs/c/a85e09bd6cc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


