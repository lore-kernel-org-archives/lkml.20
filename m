Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB848F85F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399879; cv=none; b=pwYvtJgodDNYsAbMenvQW/8OORVnkGuHtmwnyQCe9KaEXw6Rg2b+7e1wq/dUkbdBjPvzwzIeUBSm3XNY3G0dEtZwH3vUwONOwRB4lN78Se2TMgdfZZ1/5FZlDZ6D+J8nW2Exq+zQj1dW1IA7E5ya21otTjn70Ri2IYlMAgh4RWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399879; c=relaxed/simple;
	bh=SthltkVaMfrxnSzd4k2+dCJ2fJ2LDymgzQIQU5tpdFI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cq0F1199HxFrzb65865jisOGH189NYflo/VnazHgngTIOpq4tllbhg68FrfbE2XJ3jrcnB3McBQ7/aSCoWzKLX8ATNu+TCFHR5d+63qi3XQroJ8OTMKmHMyXjId1B4Hd9SmB/QeBhVmKHACq6A5W6mMt0St7gddpBX0RJ7/wA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em6UoMxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em6UoMxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A3C1F00893;
	Mon, 14 Sep 2026 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399877;
	bh=IIaU1MK4mUN1n2LJQplC+wDgs0ECojrkK1qlSDjfHIM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=em6UoMxyMnzmhg0SAmr0kTTa0/oAR3ZodYmMK036WejTwDZSILrnGBNl+5r2ul3tr
	 1fqiw/3BHG9Yudkxo0QMZwJBuujU9h+AxQ0WzmG6zRrntcHVmNrSJMw9EeQD+cdt3Y
	 gKBGWzWADt74mnx13kjivD1I9R6uyRe1RhN8bmK8bDh5Tazg7/znLdjkfD4qO9BhKn
	 R8PB+EksPrC5oiaECyZfG1xVQfr2ne+GP4seNAZ6qHrNvBsUMdv64qhOux3VsypGGb
	 Q8uao4clw4RJUrV8nFMuUkmHFC2nyl3ayd+DwyCSrXkum3ashl8q46oT2/cmqDxsjY
	 Db5sx6AbOgIHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CA33924A79;
	Mon, 14 Sep 2026 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip node_change lock for inline data
 writes
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981237.647967.4356162890529018525.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:12 +0000
References: <20260906145614.2749-1-jsjlee1020@gmail.com>
In-Reply-To: <20260906145614.2749-1-jsjlee1020@gmail.com>
To: Seongjae Jeong <jsjlee1020@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  6 Sep 2026 14:56:11 +0000 you wrote:
> The node_change lock serializes block reservation in the PRE_AIO path
> against checkpoint preparation, since block reservation can create
> dirty node pages and update checkpoint accounting.
> 
> However, writes that remain within the inline data area return before
> the block reservation path. Thus, they do not call
> inc_valid_block_count(), change a node mapping from NULL_ADDR to
> NEW_ADDR, or create a dirty node page as a result of block reservation.
> They also do not update total_valid_block_count or
> alloc_valid_block_count.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: skip node_change lock for inline data writes
    https://git.kernel.org/jaegeuk/f2fs/c/66eec36c2421

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


