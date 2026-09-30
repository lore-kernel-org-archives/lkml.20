Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6951476F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788809; cv=none; b=T/2vgjW7I+1n5mYSayCQVOjIFeRtofoKVTZrk8dupdgoxh5P5/rgw6nDyE8zVJI1cHssOU/glS7RKAIIDEg7dSQMf/vnQkEThCltTClEOjx5csxm9955NrgYAU2lJSi3tH2j2I2T94l7fsR0stpv4gne8did7X/Fokq+n0fjtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788809; c=relaxed/simple;
	bh=pHMlsugIz/WTQ0fvjHdIXWXwqAy6PTSNsQLdsWksCBU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Uz65dr08WxS2CWlqKBrKiyodBOVY44L2wAHKzGmgtUdhM881w+ryDKjzf1eWf28rq7lq4WlguZFIoFP9F0OS8GEuI4JXusLyqqSNV69m2LZcjehatGgs8j3EVf0RytNG7HK3auWyDaM7GjSZgx5z/uW2X8Hc6ftJq6KENo5DCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEHQ4Pl1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEHQ4Pl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F4F1F00898;
	Wed, 30 Sep 2026 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788808;
	bh=tuVOnxNWCgPPQeO5g01VIr/PzkqI2Sr+czEJMlodnZg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JEHQ4Pl16XgadK8EliWwRtgnSpzQOnB+YQmtbYd2E5feJmujXQQrlO5aj8AaYcbJe
	 T0h75ZYuUY7QEwMTXGGsxzdIu4ToNJVCjS8A5DekzvpdtCF0hoN19NfmPmgrk+6BE9
	 tZ/9zxhJU2N0NhgEB2mC/qqhiE8CL0CD3B1MdKVHsFqy1WPweDJIaJa66KU6kSsZUs
	 TSWuvZjKcmxRC8O5PXiNClOT9Q5FtfTXKZdzoMU8Jrk31AVVwCPC/uvacB94DCoyA7
	 69TlJgFF1+2H39mo520QV/Qjq987C1wduBbaoR7XN4sGBp1LnT5+Abu638d9d5y6vn
	 ZwPa2WvJgBqrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A36F3A566F2;
	Wed, 30 Sep 2026 17:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix unused-label warning
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179078880677.2027760.7016145024100060677.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 17:20:06 +0000
References: <20260917142222.1591270-1-arnd@kernel.org>
In-Reply-To: <20260917142222.1591270-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: jaegeuk@kernel.org, chao@kernel.org, jnhuang95@gmail.com,
 zhangxp1998@gmail.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 17 Sep 2026 16:21:42 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added label causes a warning when QUOTA is turned off:
> 
> fs/f2fs/super.c: In function '__f2fs_remount':
> fs/f2fs/super.c:3142:1: error: label 'restore_holder' defined but not used [-Werror=unused-label]
>  3142 | restore_holder:
>       | ^~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: quota: fix unused-label warning
    https://git.kernel.org/jaegeuk/f2fs/c/4faeea625cf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


