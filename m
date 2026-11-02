Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637016;
	b=I/eR9bqun+F9Aa9N4vcSaulvGUfXQJIQZXMDlojOacfFWjnFoLoe6u+R73eVVq3c5J8o
	 YdU6tU38C+xTuhEZGGMH9PXUQTo3OTwF7EWOocFOBDPlYWcgpyh3OeFwF2O0H/aWVK1iS
	 U1svhNS9ctZYqfL36vWku3JkuOvRPzJjHbbVoA9fDZWZxOkJaRrhs4EscM+/JXleXIdza
	 tTdlC7PhtqAtHaT7pqsZpR7PI1fYlW6Cmm3luoxv5nn6XeM8RgeZIJjKb9McnV9lvIK5k
	 VR5f3M/5WGJVT/XrdWAvTP6HwvHLTyn9HLOdjIu7Q+AWZ2Xq7MFC1LBAiCtkuWLZ+Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637016;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=jQ6GbPYMtNVed1QlpIMD9BCIvq0E83bOXm/krHws+PI=;
	b=WP96rPi/IwU2FBARxkIKPLYZAnEbllLZRnVvWR76YaBTNXNDOo6kn36IxS1oYUF3tqKk
	 C0n/Bu4+T7EiTLJ76CSEXCMZJ5pPRUJtkcdTIL3LJLX8HBmCJ/mTHGMiwqr4wVVTLtC/4
	 1VqqGY634XJpah/VztXWBVtM2cReuj1LJd9ux2QBbGFIxofhmo1697vmirsl40jW8wf1b
	 52dVY7WOgSve7GW2REHkwzgCoPxMUYWXhaE5fRD3yQd7XggrfLpvT/edgMncy4ZkDpg8p
	 Dc6OVN+wAXfu14IoWs5rA3WyIgww8Q+9vaZlEZG0zOEJ9NJmBnri+ZB01ZXZR1ixT5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rv4PV/+M";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3036089592
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv4PV/+M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D981F00A17;
	Mon,  2 Nov 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637015;
	bh=jQ6GbPYMtNVed1QlpIMD9BCIvq0E83bOXm/krHws+PI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rv4PV/+MPAdYY4I32EzmVdNiGpHkj9lKleI5ydSfzj8xISYJIze/WFcBS9Hp0NpYG
	 4GZlrBgCSvVedb34m0mQYytUfA/YiU/Sq/ZU55zrIkpyK8dQoaPb+tQMvQfFAL70G7
	 QRQg/db62C14Xto9OccnxpC0n/KcO5BqnhW25yLyXD5sTD5s237CBz2wFw09pR79WH
	 rLDmpRhPlkumJWEXDz4SQ305dIBRWzykCMszclUhEkhiGDWZmk4IA9gUujPJgQ4Kg1
	 WJ8SqwGppHRFirIdzj0bl+V28Y6gqsqJIIXB3pnChuJxzELmy81PR5owoxPmye8rRa
	 qGVP3mokbIEDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D209380821F;
	Mon,  2 Nov 2026 16:30:15 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: do f2fs_zero_post_eof_page for all the
 time
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179363701404.39295.8939045880809671371.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 16:30:14 +0000
References: <20261028050615.259268-1-jaegeuk@kernel.org>
In-Reply-To: <20261028050615.259268-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 28 Oct 2026 05:06:15 +0000 you wrote:
> This fixes xfstests/generic/794, since the issue is not related to the
> posix=strict mode only.
> 
> Cc: stable@kernel.org
> Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: do f2fs_zero_post_eof_page for all the time
    https://git.kernel.org/jaegeuk/f2fs/c/31fa11a9401d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


