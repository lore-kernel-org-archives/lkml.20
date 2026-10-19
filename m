Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424412;
	b=MagosmZQMSzSxr+DDcFtbEuIT7ph8PrgFMqnmgV0S/2QiE6h0u69AR88umoc1T98x94Q
	 XJceZSroN2klxVY/xrIZW/oZm07QQTN6Faxg2ld5hAGpxQ/TtGt30nUoTH9VUXUF8kHjG
	 5dgL1AK3DgBqEEbZr4meTlKIj8ZEieMeyFCDhWl+g/SGaBqzJWlpvKck4PTIzHZ577mxC
	 LtxJxCPY4+PWqyX/XwO76xVhl8EkOuABl+KWmKW/EGfdvTEk7YcN3jwAFWyAm6RSdFth3
	 WHlki3OCVnIB1J/luXwhSgAZO98MrBbnW1VQ6XQHu1EhCnaR1a+uFQdZB2gfRGll8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424412;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=1AwhYTo8TdLx73LUUCO1C29ZRra7sMAgFbZ3DOAdGuw=;
	b=lTC00W05lQgr9KazqVVuNyGEjQVvx3RtUppQTeR4IF89rkq6U7hdbo6K+EMvVPQAKE9Z
	 pLc+UsAodCGqOlfNEQHNAAPCjpbPXtRLZ5sBV06WurMvEHUag7kTQoehNyD3UEcYTZrCV
	 W+JSK563wI9Av8ZkV0r82ziQKuzUYIATZ4XoekbtvVwMVVVdq6aXyYssPvYxQ8Hq4aWnP
	 HJ/6gMgvix3TD8jSzQwN6RXg8QqVHmLxoQv5g5UKP2oOCMOQUXMkH5MhYrmPKPWzOwngf
	 JehCaFQgs9aGeokcPEqfo8PKP+QzScmqy20R9/AIi9CValp2TozF6JxsnA4utcHOyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWZbyyXV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B872D607BF23
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWZbyyXV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DBF1F000C6;
	Mon, 19 Oct 2026 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424411;
	bh=1AwhYTo8TdLx73LUUCO1C29ZRra7sMAgFbZ3DOAdGuw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iWZbyyXVdSY3eWdJByqIQvFRAF2kplc5pHMk2j75LoQr5Qknddxi0KdN3zxsjlVIb
	 eLjgdXAbKDDTz8leqUd6ScAKr8irnHX0KrdxJTUxkIyHx/NVoR2USiPUzAsgC0GUvt
	 vdumFGX4X4MSudqlHlErowRzFbqGz6R3pR+0/2HW7PFvzGufhOel28ruVdazXDzNRV
	 foG2h+/9YpXiVttOhuJ0ek073H0sBmcUElxGcHi/imA0RcIwCdcvFqYPwIQvkpzNLS
	 b7i0DvCdAmrUF1A/yezWyy3y8Axhr8JNnVDyILf+tg/bA3eFeJI97Fz02GSV1W0apO
	 4AIyCBVyAJdBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F12D93811A71;
	Mon, 19 Oct 2026 15:40:10 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH v4 0/2] f2fs: fix online resize state
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242440952.2714099.9716703809963334539.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:09 +0000
References: <cover.1792116883.git.qiwenjie@xiaomi.com>
In-Reply-To: <cover.1792116883.git.qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, sunqiuyang@huawei.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Oct 2026 13:44:04 +0800 you wrote:
> Online shrink changes both persistent SIT state and the geometry used
> by pinned allocation. This series keeps those states consistent during
> range evacuation and after the geometry changes.
> 
> Patch 1 drains the SIT journal during resize even when there are no
> new dirty sentries. It is unchanged and retains Daeho's Reviewed-by.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/2] f2fs: flush SIT journal during filesystem resize
    https://git.kernel.org/jaegeuk/f2fs/c/a6ede4054551
  - [f2fs-dev,v4,2/2] f2fs: refresh pinned allocation boundary after resize
    https://git.kernel.org/jaegeuk/f2fs/c/e4df12e37300

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


