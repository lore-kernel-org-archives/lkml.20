Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA35616B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930613; cv=none; b=spON7U5A0M/7N7DGBZdVDgZZ7oyb1Abhs+W5NIZb2KIFQ0i3Tr+52i2B1R8JVLGsVLTMJPKuVTMvea1xxG4J98ZrwbImX9/aZD8xa46fr25Coh8FfUvTzlTEMlHMjf+tR4+wLQGXzL3PC92OqMbN+XyBBHYDzhIlY/eUTkw8VHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930613; c=relaxed/simple;
	bh=f7JxhN5/32SSfcaX9AhkH5aLip9dtz21hv13HWxpBOg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E+NuzoJcG/spu7IH/okj35DY/fxZ7ySsiCjaElUNGTH4V3kKCds2swoK5TH6RFb9tJAxcF+zB/yr5k0Ydh3BUISjNHfHbTU2ZlwGmV5J7mCbo16ycrcCYPvgaXFlA+98thK2ixwS8P4HVE9U6c46psILHXJ6pcYuTb1hP3LpHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv1QrvWA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv1QrvWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8F01F000FF;
	Tue, 13 Oct 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930610;
	bh=5WeS8w4Ji4g1xJ9NDbo6XBD3M/iITXPbtnMJ+1aCzZ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Bv1QrvWA3Exuyznt1c1aUmzEyqKvRv8jMoJFf4I5aD9CDwnRc0Idbyf/IIdukGFqL
	 ZJ9dyqVNTU1725x2ubumMobtc7e9Gw/AjXIE5BwDOEmrzjgpJRWpMqn35JdvDENCdr
	 lm0LYrSW3nTlcK8rGq8szPW4K7Klc6+x98BnmrVuMhn7KbJCT3eNWPaOi0RDsW2aWQ
	 XjmYc6JllobitMPp7LhheluMCeqZvsUDwrSHlCYCDDo7zmSbFkpg357OikRUjvXerO
	 hxFnVeYxW90UfeU/kDxJmctwtSX6NNi3DK06xfErkrDCTbOIovmO/C+VVT3CDHU9os
	 vjLITES0iH9ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44A239E4DBA;
	Tue, 13 Oct 2026 22:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix termination of
 f2fs_sync_meta_caches()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193060952.1493834.8525794701490344819.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:09 +0000
References: <20261010074912.114840-1-jsjlee1020@gmail.com>
In-Reply-To: <20261010074912.114840-1-jsjlee1020@gmail.com>
To: Seongjae Jeong <jsjlee1020@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 10 Oct 2026 07:49:12 +0000 you wrote:
> When __f2fs_write_meta_cache() returns false in f2fs_sync_meta_caches(),
> the function only exits the inner loop instead of the entire
> while loop. This leads to an unnecessary lookup of the next batch.
> 
> Also, when nwritten >= nr_to_write, only the inner loop terminates.
> This allows the function to continue processing subsequent batches
> after the writeback budget has been reached.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix termination of f2fs_sync_meta_caches()
    https://git.kernel.org/jaegeuk/f2fs/c/a45c9a0055f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


