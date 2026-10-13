Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83D566C44
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930646; cv=none; b=F8Q/7rgT+cG9ZhFuLAtYIxDaqn7PbKTO2xUFRQX3Rhq0Q8L3kiolWSkmFYHnC0232xBZvFgIN6oMru784X5AKiirutRHEb6mWOIzpXl0/tQtmCO0duzmWcuCWBEN+fLwTZwixbG505/MpQNSW1xCICghYn1rW6+DQlUtL69GLZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930646; c=relaxed/simple;
	bh=3sXgJyemUwym7Asx5Sn6zTFCSjIW+IqEMZV/JNRG3rU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mIY53fqEWSlirnpUgS5zCKPc8W4c8bXGJctfN1oopo0Gh02wLFxK8jxRBl7sAU84AdHv3ZOGGERbbkbvwGEAO5wsFGao2gjOsOcmQvVlbiMXzf3cM+StFagAxct17j5qwnMx9+uiWQ2R/oDFaeepGqQgwc/fLkfxjA1XDS4Pt+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYHqO+/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYHqO+/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818751F0089C;
	Tue, 13 Oct 2026 22:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930639;
	bh=gK5BiDEntrKD0+Dzj/T26h4UrOX6cmNMvMNJ/Y4XJ/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KYHqO+/dLQiNrBW0pAQsNxN2fCoI/LLOrf+wGTzkk6b0kDzNVaAwGvJOCaoGLTRXM
	 VCfhYnIE6mUE4BeLIffje9RTnf3CYdJclPJfbfOX06Hgxh/h4NSKMbh8ieeJjrtaMc
	 KjxEvopPb/bYA5sTH3ZcnD1YUxp3sDyldEUr3qSXuxiJXkxsFy0QdPjzkNA9SgJAp+
	 W+isKQrFIWVH2Gc2VybDBqD8GnD/DBCb6hUQvpkFYMk0aqka9QLmY12euzg57NFdVf
	 yP6YnSeOMtL9RHoOlyM2AWrKHsgwdo4fND/eVjNT2CU2VixPIajx7ymn20iHFx5rVM
	 x1M7b92rAp7sQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7732739E4DBA;
	Tue, 13 Oct 2026 22:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3 3/5] f2fs: cache: wake up f2fs_writeback
 when
 exceeding threshold
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063801.1493834.11114382446696553394.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:38 +0000
References: <20261012091737.308136-1-chao@kernel.org>
In-Reply-To: <20261012091737.308136-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, daehojeong@google.com, linux-kernel@vger.kernel.org,
 qiwenjie@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 Oct 2026 09:17:37 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> This patch introduces cache_wb_dirty_threshold and cache_wb_total_threshold
> sysfs nodes under /sys/fs/f2fs/<disk>/, and wakes up the f2fs_writeback
> kthread when dirty meta/node caches exceed cache_wb_dirty_threshold and
> total cached entries exceed cache_wb_total_threshold; a zero threshold
> disables the corresponding check. By default, cache_wb_dirty_threshold is
> 8192 and cache_wb_total_threshold is 0.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
    https://git.kernel.org/jaegeuk/f2fs/c/eeadc4807c95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


