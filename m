Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667011;
	b=TaO/zPyi4gGvW+1vtIu+iyA9WNABSpsWT14cMjLK9qsqHW4WobAbMWoY0kyoqAJ31OH8
	 WJ1vZDZOrvxqFzVHyhVhzhGOumC2B3e8SDminEyahY3rYgCtzgQ/a5z6baSHqV4LlVCl+
	 wTwlP2FjEiQGUco00SyXILAFTRIS/7HZiEoSVmB1pAPErSx8RmQ0uFlsrTcc+AkAEmGWw
	 U8XgTpS9sEYq1hR019G9Bmm4IqdDyRp6Qvaq9NCZYzJGEFQz3cF4Rg4b16yVWbQ9mi+3S
	 G79E9HtbiH4NRzXfdbki5zxv+0X1BvlkTbxxPJsg3KfOHofeKENFE+6YMrE/u+a/28Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667011;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=i9RuHFNBZMENyOkDRUHN5XsZLW09wcf03LGDxLT8lCY=;
	b=nylPVNMBcxWgl3luWHeHh590Lo68ssVIJ4dYet8IZlbvDL8ObkQHWLeTnVZ7SNLYn1N5
	 knAsuhi14QjHr1m7M23VK8PsSvgYv5mAgyYBsjzNq/Anyp1t7HIeegMO6QoR8k7TKoySg
	 oM7NQAqusWVhmd3BKOMxmFv/Ph4j7ffsSolWkMhcSfzXZKO7JOgk86YQc4W9N8vTctHs7
	 EofY8AAwHPZArXp8XCbyr8b8iBDtzZ48a2lPiQ+rfpmo4b6xnXOTTHo/9AmkjixCOu/sA
	 SGrNlSn4Xb+KB509YXhOaiCe6863BDQtTSWwCQQAAGNxP7cIsgHT9oBzrQSWeuUQeGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N90XzO9S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4E606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N90XzO9S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF021F000C1;
	Tue,  3 Nov 2026 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793667011;
	bh=i9RuHFNBZMENyOkDRUHN5XsZLW09wcf03LGDxLT8lCY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N90XzO9Sb3Vnytfpu5xDABVi0dNPWLg+vaCUdWuaaPrlqEImuWcsip4rCFLqANy4z
	 XORE7+1/KldyXZDr1DSwZgxESWBdNFvcam4UEfspOoTytDvtc7gyMk2chLKJWIXIlP
	 hc4hZaagyJ5WJbmsw9DRqDYWsgoI/fAuNvTjTYZoLLHetoaqGvvnkV1XnYv2a1UbZP
	 YBHVySerbuA+znoXCk11CeMAh0Jx056BUpu6cl6rtwpm71QmaWVv/xxpfkhbSp+o28
	 Sh8a2g9/sFnwKCJkEKi96ZNeYi2eJI/FiIX/9rhDA1OXavsK5PeP09tmqYIE+RJUEE
	 K+X888CpFjTYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 030E9380821F;
	Tue,  3 Nov 2026 00:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: preserve 64-bit FITRIM minimum lengths
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179366700954.755181.16767852529542286905.git-patchwork-notify@kernel.org>
Date: Tue, 03 Nov 2026 00:50:09 +0000
References: <20261031233935.9600-1-dennylin0707@gmail.com>
In-Reply-To: <20261031233935.9600-1-dennylin0707@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 31 Oct 2026 23:39:35 +0000 you wrote:
> The FITRIM minimum length is a 64-bit byte count. f2fs_ioc_fitrim()
> narrows it to unsigned int while applying the device granularity, so a
> minimum of 4 GiB becomes the device granularity. fstrim can consequently
> discard free extents smaller than the requested minimum.
> 
> Use u64 when applying the device granularity. The checkpoint's
> trim_minlen already retains the 64-bit block count; also widen the
> discard policy field and its initializer argument so larger minimums
> are not truncated when passed to the issue and wait paths.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: preserve 64-bit FITRIM minimum lengths
    https://git.kernel.org/jaegeuk/f2fs/c/471dd2221735

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


