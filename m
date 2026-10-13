Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893F563292
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930615; cv=none; b=vCmwWKMIaO7tz35SxLgU3pUI03Y3nFrXaGy7pNMXt6aFG6Vlth/jWqX5NwUZeaL9/PxKKSqPBkebIzuBYaX2jVED9cMAV0IIzxDAJlyiZTCq20/8NEvOEDJG9EBWr5O/9z4Crk8Z24r94Cg2a+tFoLpRP8yy7aXXNCypDMxDb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930615; c=relaxed/simple;
	bh=hGVjn9Y3fbmQinwOk7nmE/GtAPihMD0Btoheymr27MQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PPF6n14Mb+bprHTtaBi4I4lRGBVxwBU7DjIb0m/iwloZwbdYIX14Fre36l/r+R/OSGnynGk4gKm42YS5WyLPlPqZdfiv4PJ/RAiPfgMYwV5JV1W/ndqmwX8HhtexAEGX8GpZWPW1e3+z6RQhzvrygUd4YV6u6paA3Xrlaq53p4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O29F58Fu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O29F58Fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FE01F000FF;
	Tue, 13 Oct 2026 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930613;
	bh=BSHmkURCUcWvxpyD/jCZQsnATspfn7E1v3Injzg7glE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=O29F58FuUvsAc/gsyRGVHW1IDQAKv4ZDQHls4L64AlP5GEvzOUfpCVnEdzF/fK1mB
	 esy5EEaOk1ERUm4CQzCxyZl/0bPCbmu/AlmXagrM9asfw7zurhdNn0gx3l0X1S5fVx
	 uYxl1NJbZhDxxf6+e+Rma/MljEpfBtCoI5xuINTA0hCnaHzWo4A9nZ1pWkyjDKhbXd
	 SM6diOgGVXTm6zEgSNYzVVQfO/xTlJhziONAVThOGxFSYqI/9eUOO7GlHDFlghWk6J
	 GQQ3fest+9Y8pSV+sM/gcmPzAA8T74ikv0Y9S6Awf1/WVa+60gsWPLI6zp6LdnVLED
	 AkRhkdysCV/ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43DA39E4DBA;
	Tue, 13 Oct 2026 22:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to use bio_in_atomic() in
 f2fs_write_end_io()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193061226.1493834.2807763265154203620.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:12 +0000
References: <20261010065546.1762091-1-chao@kernel.org>
In-Reply-To: <20261010065546.1762091-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 10 Oct 2026 14:55:45 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> f2fs_write_end_io() uses in_atomic() to decide whether a write bio which
> exceeds max_atc_write_bio_size or max_atc_write_bio_entry_cnt should be
> completed in sbi->wq rather than in the current context.
> 
> However, in_atomic() is not meant to be used outside core kernel code
> (checkpatch.pl warns about it), as it only looks at preempt_count(): it
> misses irqs-disabled and RCU read-side critical sections, and on kernels
> without CONFIG_PREEMPT_COUNT it cannot see spinlock-held sections at all.
> In those contexts, a large write bio will still be completed inline,
> which defeats the purpose of the above knobs.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to use bio_in_atomic() in f2fs_write_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/e4582e5f3b43
  - [f2fs-dev,2/2] f2fs: fix to use bio_in_atomic() in f2fs_read_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/a605d5d71a6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


