Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48CE566C40
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930642; cv=none; b=Uufwa1SlRScGni0emv4kc/uoyJfA1ltCFOdln1M77glc/3YODun+nDWFm/Y74zpV6jbllPyWMWKKMbMACYrdXbanyB+VBHoSwwz2L1GL6TInYhX+xfeMaNY51bAsXNN6D1d6ftQ3kn1gLF8izzPfLaI8HmIYn4I46UQjqfHYLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930642; c=relaxed/simple;
	bh=wDp1JNP8ADAdhsF6p7n3+olM6bZ7UvasoEXrJqv0OF4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mzB6qWXYCCWl2zhlXPzd11PHN5EQ5AcYUb8ilvhoWNo8rFnW9DDFJ414vQkCVi1+dxjfADu2BuPMOGqz1NOWhNqI66rM+Ad5gm/lyr1Iu11gzpOF+7sDUErZA9shC6mGeIG8n29UGTU/7Jb+U1pRKhfJf+QHLxnHnA0hroxiH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyPmGJvk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyPmGJvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051B31F00893;
	Tue, 13 Oct 2026 22:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930638;
	bh=uvj3O9c6RosAT0UyjB/2k5GJbzbN2n4aQ6TJnnls2VE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dyPmGJvkm70vJ23ZkLEA1xpCjBq7aSkis9VL7DV8yX4RyhZXQ5j9xmaCag9TMVzy2
	 CkS8VMwWNKtl1UTwEpqU6L15z20S/VK5gsXe5ZW+06on1Ukmk54KSapKUSzC/jXjlC
	 Vnmrl79cf45pUEe8ab4aoQz5DcNMa+bCHNzwG92AiAU3pKDSRvu35iPjKmeqCRLnq2
	 h5WLDxqjY54W6pIn9dJdsIgNY2j5gJlZcoHsX8uoZ3lJhQE1tEpwf0o52L3Yuo484b
	 0ud0Goh+nk56gbucxrRIPQuHrRrD/dmhR+4w0pldPpGN2pDkZC/VatFGDEJUIQnT8s
	 A1bMcad7c9+vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F151439E4DBA;
	Tue, 13 Oct 2026 22:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: check every cur_*_segno[] entry on
 readonly images
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063651.1493834.5827058831537711621.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:36 +0000
References: <20260918165507.1267942-1-kaixuanli0131@gmail.com>
In-Reply-To: <20260918165507.1267942-1-kaixuanli0131@gmail.com>
To: Kaixuan Li <kaixuanli0131@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 19 Sep 2026 00:55:07 +0800 you wrote:
> sanity_check_ckpt() bounds-checks cur_node_segno[] and cur_data_segno[]
> against main_segs, but on an image with the RO feature the goto that skips
> the duplicate-segno cross-checks also leaves the enclosing loop, so only
> index 0 of each array is ever checked.
> 
> An unchecked index reaches __set_sit_entry_type() through build_curseg() ->
> reset_curseg(), which writes se->type through &sit_i->sentries[segno]. With
> segment_count_main 120 and cur_data_segno[1] set to 200, KASAN reports
> three out-of-bounds writes during mount and the mount then succeeds.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: check every cur_*_segno[] entry on readonly images
    https://git.kernel.org/jaegeuk/f2fs/c/9c4ee79190c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


