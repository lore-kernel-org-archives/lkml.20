Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058048C3FF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399876; cv=none; b=P20gNOHZTmjSJ0aophk7N/RmZXU9bmqWNDl2P1BI4rW+6nZi23C6F8/mp3klNCjsB5sLMTiMbMkllZKcRJtkFqzvBiaNMoRPKf3TEDcMm25z1HdKCfqNBl0e7r9EBGDCZtfZ5k54KusDr0zABKwrGDEhVMazW0S8Xu2u5Jr/388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399876; c=relaxed/simple;
	bh=A9MI14gZ6eXUO0wTfrhoIvbPsJwkMGiOzomMS+zXiDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AZvHlQGaemeT87xn9RUh1Cmk9Uc6nogeooZ4a24j73Kj4+dYmGZFO31IKtqUDGKVzL0y7gvd8t0ifx1qiIqD/RvxoANgzHs36aH5HpJfVOJxZZ9962dUr11aZxloxcUzMv5Zh1B1EdmKaJgcDMTvKGKklORsMvW2DDlTLoVjcw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxCx4DEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxCx4DEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F771F00893;
	Mon, 14 Sep 2026 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399874;
	bh=GRni4l4ymYbY7XYMoCKgvBmsHJcn3yOsNFwT+xszDes=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TxCx4DEgFDzcucn1Lt04a2ETZcqd+9D8sNwR7HIksokdJcFqKFo/nUym/orNGwDrw
	 6C1Jk7ZUCbTu/HC8Zj7shyaO27IVq5cHxb9sTZGv6HFCD/GQviRIkghLQkQkXaLGN3
	 4jEcAu+pUStPQP0BXbFnFcvuxVaBivHQ014DdVg6/AcR+OVUsgXWGMHwPFtB0HR5sg
	 aRz5b16dWYLa3WRhPG6jKGVpeZCMEzgd8U9E+Qk2YDNLbeou6KG4oSoMmRmyMowrr9
	 hawJQfCncekX/NyGTjkUWQ0V+V6BVsm6/+dG44lz7Nrfj0BlV9WhujQYZ6+xWHhg6X
	 MsrIvYCEZVl3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BAB3924A79;
	Mon, 14 Sep 2026 15:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to record both APPEND and UPDATE ino
 entries
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939980937.647967.15687709233091039790.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:09 +0000
References: <20260910030243.3005578-1-zhiguo.niu@unisoc.com>
In-Reply-To: <20260910030243.3005578-1-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 10 Sep 2026 11:02:43 +0800 you wrote:
> In f2fs_post_evict_inode(), record_bits is assigned with BIT(APPEND_INO)
> and BIT(UPDATE_INO) respectively, so the second assignment overwrites
> the first one: when both FI_APPEND_WRITE and FI_UPDATE_WRITE are set,
> only the UPDATE_INO entry is recorded.
> 
> The two flags are not mutually exclusive.Once the APPEND_INO entry is
> lost after the inode eviction, the shortcut in f2fs_do_sync_file() can
> take the flush_out path in the next fsync(), skipping f2fs_fsync_node_pages().
> As a result, the dnodes holding the newly allocated blocks are not
> fsync-marked, and after a sudden power loss, the data appended before the
> eviction is silently lost.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to record both APPEND and UPDATE ino entries
    https://git.kernel.org/jaegeuk/f2fs/c/06768d77ed95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


