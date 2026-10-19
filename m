Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424417;
	b=yG6EVGm7g/QB0fO/hyGPGEoeStX+9jkS+ILGBpbzxLbqE7wln7gL4P7MOQvyiwunQ3vk
	 sc+PSy9grjgHH+5/yw9KSbET+1dX743LUyJZm8BvniegekBUrissL6RSpVimRjzhIIGgL
	 ustxS66r+W7dfHtBCaykxonU+tIsU6kpXrDHhthtud+zdlADn+JfOD6/3JyZG7L8iCcxO
	 WxlYP4ckNigL5PogksI1eBt/vFmSa9fWQH4VEibbzu7dqJ1eMVrvy2Z+eWvuNFcmrF4I+
	 ZcaWDeZ7otCHTWVffNvykrUufvGuRWQFiC5QyFXPQU5uoxTIwL3n5Ha1N19hRNjIn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424417;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=8Nf9wnupM7UsTmZYyOaqyszBk5fb76vjzvnA24gK3Vg=;
	b=F25FHus19pEN10rFIQE8wggHBb0XIjea9ki6jjln/JM8+4adVpw3bdD4biFavmtZ2Zf+
	 7uiQBoT0fexUJKqFYHZ2S0dHDIr+YcmrBvVJgWjbOGJy8obzN0EZDy3qfOon93jGSI1fi
	 nZrTLehkjNXRkZcBVAdr+CI1ys+QBeVx6rMoXsxcF6Aw0q3nr5ghPDzPRMO0A+0UpfsTO
	 /3gLnKjSkaJUm2ihgir9JP/HBqGDTLklMyLCmyRfIT43yVndiFf8SGEcGfZEREL3SQTAk
	 XLYuzABVTwURhTF6h/pI3NvsoqYaO2trkuuD/AkMwIZ/Z9uZ14tVC87aihbm6vK+wjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKV7OZXy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DED6084844
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKV7OZXy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0729C1F000CA;
	Mon, 19 Oct 2026 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424417;
	bh=8Nf9wnupM7UsTmZYyOaqyszBk5fb76vjzvnA24gK3Vg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nKV7OZXyxmcofkaBM5qibS4Zk6uWp2/Lf6OI7aLtDkT1e8jNTRkmT+4+8CmU/ouRE
	 Cs/XDyklAl8gb886JSebtddLTDWYXgRgQ7J+DQOY8pVygHlrqHiD1+NXFLDFJimVas
	 byuZCMGcAvCuH5x2MCUDNlDWmxIQ6GVQtP+9ITdiIWocq49ed6a4X+zGBOzrU8Ly2d
	 eHhzhzDHfOwSoedufOY27NIQ23beu6LrLsyQ7nSZ/kfnztRzOP1f+0rJTCUR9J0g48
	 Uw7x2hyKdJfm0mHebdRKWMguaR+9wX7MC/xBHwSwCnvaazAqZo1ZJ+dozX56IFx5Zx
	 ufO1tbEKEIX3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14253811A71;
	Mon, 19 Oct 2026 15:40:16 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential reference count
 leak in do_garbage_collect()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242441555.2714099.13023477274784358472.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:15 +0000
References: <20261016021737.4121867-1-chao@kernel.org>
In-Reply-To: <20261016021737.4121867-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, daehojeong@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Oct 2026 10:17:37 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> In do_garbage_collect(), we have reserved reference counts on summary cache
> of all segments, once gc_thread encounter freezing, we need to release all
> reference counts.
> 
> Cc: stable@kernel.org
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: 02d91398a602 ("f2fs: fix to freeze GC and discard threads quickly")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid potential reference count leak in do_garbage_collect()
    https://git.kernel.org/jaegeuk/f2fs/c/894ca8b85666

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


