Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667013;
	b=pZNgJhKB5vtpGyKL7OW7igxh5RPRxkQNXabXIVMfv7CQ/FoaYARzjoP8EQlr4pDledMg
	 C9weKQ3O/UtzLDsoH3UPefwxfxKlUb32mQdHKcKPxbe1BOaGI/Sx0sOMTDtFT1/KJ/341
	 KvJCghOWoYYn9+F3gmac2Gof4w4EmFwTgduva/stz8j5CQvGCb1ca9eKGnqHFZhMwnzPB
	 Yd+Ht8KOEEm0UFE9T0hzerVH7r2zElIevALt+jmmjAl0zP0e+I5kidB2Ev2syO2mNcICZ
	 3hd62IxGgutMdeINrtY0Gx4iAka5bcJEbKzAt1K2d9L7zrU3GO/sGHIaDlLum0dVjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5MqMEviFPtxk2smI/6/uFwg7z2yrrSNsVcQUUPOJjns=;
	b=o0EBuyK0hgQjrXarxbQdvk4Lk85v6+1iUtYvbBlN769tqu5rfWMpFPn9hqtGdDys8Rc5
	 FMxrCjumsyanUClVrGGlNs4Uja4XNzMrtLFqwpz5wjJEyhjiC+fFh/xvgnUazTaJqWdug
	 L85GzPbwz0CN5vBDn4ltBJeKI4UgN96qom/ptbW3DeFmNihn8w7H93lmY+1mIFIHnAMaj
	 6erOXY3oVxXJvI8Fyz5krxLjVXeELPPbIakYYSM6CAGQxGBysYwlDPBjilZDJqXKmv6XT
	 Boz8L9BH/YbjpICFHuTXlFSzOPN/EbvVxt3Jy1p3sybYEl67MoGYjsb1nSPxj6yQ7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9haCeH1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC244606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9haCeH1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8553F1F000C1;
	Tue,  3 Nov 2026 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793667012;
	bh=5MqMEviFPtxk2smI/6/uFwg7z2yrrSNsVcQUUPOJjns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e9haCeH1RDGNwYAf5G9DszI2hu0r1f9zDPL7mEFOnyHqJK3shPrY6696azFfTRGBD
	 X7+r4/IJdgvt16Bj5cv1DOSJnR8lRVvy2aBt3xUu1tzB/WZyOlKwAmU2ESZDHN7NeM
	 cr518SbjQujAVKe+SPeQA1xQLu2xL9N7A4FyQDqtOhVll1kfhGqtPjXtnuEAiRg3cF
	 Ajc4aQMiKgqd67MguCYvJVrh6eVgXMUyHvOgOX6Ji5J6q6IPnFqFfS8bMfBo0IQD9c
	 C3nWDrQWMP/cHpaxXhWL2w6NUtEGktwDAI6ZbvFyzMY358EHFrSOSL4nYMRfFQLIKn
	 eUqrlqloJwM2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0F3380821F;
	Tue,  3 Nov 2026 00:50:12 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: report sub-block project quotas in
 statfs
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179366701104.755181.6875860401998181621.git-patchwork-notify@kernel.org>
Date: Tue, 03 Nov 2026 00:50:11 +0000
References: <20261101230552.55034-1-dennylin0707@gmail.com>
In-Reply-To: <20261101230552.55034-1-dennylin0707@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  1 Nov 2026 23:05:52 +0000 you wrote:
> f2fs_statfs_project() converts the selected block quota from bytes to
> filesystem blocks before checking whether a limit is set. A nonzero
> limit smaller than one filesystem block therefore becomes zero and
> skips the project block statistics.
> 
> For example, on a filesystem with 4 KiB blocks, setquota accepts a
> 1 KiB project hard limit, but df on the project-inherit directory
> reports the filesystem-wide capacity and free space instead of zero
> whole blocks. Quota enforcement still rejects a write that requires
> another data block.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: report sub-block project quotas in statfs
    https://git.kernel.org/jaegeuk/f2fs/c/9b12299b437e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


