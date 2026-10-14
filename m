Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3852FE39
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993012; cv=none; b=kEbz52eLLufZsZbz5QHN1T84DxQ69yYM9IJbhHnrzEDDjlT6dmTABDRy3Xvy089LojrnRLzpDVhmtPaZOQYen9FDDKJHL9wzhZ7OdVAA1MfuChYLjEpJ6VGkERUX8CNZJDLz4bXBOYI58rgf5aEYKFo6JjIuOqlwmz6ooXa7FC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993012; c=relaxed/simple;
	bh=zI/j960gABfhaafarDD099CYfx+sum22GOuU9Uh6cbc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ek02wpVKcoEwdwOgMaASYCvo/LR75yApJuzqZH6YVFYhJVMqYOZ80z+Nqsl+6J+MhDgj+IakMArci8/MH83TPW3aJr2zHVESTiaz2CCwhMKQZovijF8qhnGn1VH4rmhPkUvUhGkKMH+4sj25+LZoZPKz6/o1UQE0jQF58gYzYfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnoiLFO+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnoiLFO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE9D1F000C5;
	Wed, 14 Oct 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993010;
	bh=RnZFiZCHqen420BMwmHz2LltrzsBVhrMtvMbdc9O47c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LnoiLFO+J6taut+9qzsx4nt3dQwNXaZCsLVea5Jp6GQbdGBc0tjx9uxbwu4rWwR97
	 ovyRw1pVi3VYRaKOZ5yOYsCS1Z3yA54TvexsyFoo1oklLHHVyGSrKNoP6eDmrE4fbC
	 kv/bB8rR1Ic1Afc9UuUWxvvGNiGy0yB+KACQbJX1Mr2KED5S0c0BLeUcCxekgU6Jcg
	 25u1T/EzAW4VX3QMD7/cdmAI0H9Qu5p+0v4aGXjDyZw6AzJFMhWA8cab8mPRGuCvy7
	 +SwerhPy4MHYhHX0HnfFETdmicXfEvVZKnYIUoUVeN3g0/J8B9pSoG4LO73EkCJgpv
	 CiQyazjz1bwmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B432E39EDE30;
	Wed, 14 Oct 2026 15:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: return -EIO for a lost inode block after
 cp_error
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179199300926.2827562.10260780687438036774.git-patchwork-notify@kernel.org>
Date: Wed, 14 Oct 2026 15:50:09 +0000
References: <20261012182233.2685282-1-daeho43@gmail.com>
In-Reply-To: <20261012182233.2685282-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 Oct 2026 18:22:33 +0000 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> After cp_error, dirty node caches are dropped without being written.
> If such an inode was never written, its NAT entry is still NEW_ADDR,
> and reading its inode block returns -ENOENT.
> 
> f2fs_get_dnode_of_data() passes that -ENOENT up, and callers take it
> as a hole. Since the inode block is missing, the next offset can only
> advance one block, so fiemap walks block by block up to maxbytes,
> about 2^30 blocks, while holding the inode lock. It took hours in a
> power-off recovery test after shutdown and blocked unlink and umount
> on the file.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: return -EIO for a lost inode block after cp_error
    https://git.kernel.org/jaegeuk/f2fs/c/01ee16a7a758

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


