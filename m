Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571416;
	b=taz/VwI4wX1DrLZGAy0iO3EoLGMZ2Qq7E7C86ORt8qNnezkOgLz/G2/2jVYPFVXix3zA
	 L4VvBcfxRBD0GsKvG2TMyaQMOg1s/CEDoKeXWVQsV6sG3mNH2MRKROxuiM+X6xewOplKe
	 L5yarugC5pDf6BARd2/CY8EGzS3ASb1z7dgGmQHPuiYwEcRl+Tj+TlEhD2xE5K5+uDw47
	 +w+aVwODuQGOv/XJLNA3atfgC0nb7OPrQZGkriFwzD+avGSoYNO2/zOiXkj95fMGoMMFB
	 AOPVXv0UCDQNmAjOUnBQoA59oFCdX2rCsmUMH0tDCVCfrmFr8m98mvPBG6IySa15/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571416;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gmHoPhac8xdzo93RJmgS5fUm3Pc0rWkwSmth62nTPqo=;
	b=Fl0Mc0HhtRgco3N7dQpf1Ik47LcW2Y+Kk8tyjST6pyAjC+dASkh+7gsLjNckl+WZn2Jf
	 /FZNOLaYFRtM0BHlJADEjSKoL7s/hPZdWw94GerZIeYUvF8mKPu7Dy/D6UliKNG0JjUDQ
	 uqoUncN+ZvJ338hLO/EQ4XyiC6f8fNPijpiguR/Bb+rOQdVIsMzgTk5aLjE3dxUmD0EBM
	 MPV2AFR/WtCETp58vZwMa3K9W5Mb7RReQL9dYPYaIrSbnoTXpfQeek+2wiVugs23D8bO/
	 xE9pqSbUEnRnEdAL4Vh2ERuoORDfWUfnEJEQuuOQkUViNEcAuwda5qmR84xWUKrnhuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6nTVfdH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729D6072B2A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6nTVfdH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2621F000C1;
	Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571416;
	bh=gmHoPhac8xdzo93RJmgS5fUm3Pc0rWkwSmth62nTPqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N6nTVfdHt7MVhFuXciAxURK0MJ2kI9qDi9HMYYd5jGX4G9Jm8Bg3ANfJkThMy1oXu
	 ZOS0MJoKf+NZYrRifICZK4JbYJKfSjtTWM2uzNWhta5GHaIW3Frqnq+ZKpjjujnOVP
	 QPCsQm/I79caUKsvjHGTBZx7K6VX9iAYPPRFGk0HsRRYu9Vj+Oyg0XwMoJclp8Qauz
	 ZDM7s/DSEeF6wJ9wTTSEvO/iXLh3UGzjQET8W+96a2+jl4HqUqwqgHRmdAbO6mBHKF
	 MKuLE0Umzge+n/nxtFwnx10gepJ/IdxUYc/qA3zMssLCR6fuzFe+eiaevGu9MP/10s
	 c4o6nYNmjvXrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4014D38003B8;
	Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
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
Subject: Re: [RESEND PATCH] mm/page_table_check: add explicit pmd_none check
 in
 pte_clear_range
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357141484.2624073.1401864471103431291.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:54 +0000
References: <20260819025516.2967199-1-ye.liu@linux.dev>
In-Reply-To: <20260819025516.2967199-1-ye.liu@linux.dev>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-riscv@lists.infradead.org, pasha.tatashin@soleen.com,
 akpm@linux-foundation.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, liuye@kylinos.cn, alex@ghiti.fr, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 19 Aug 2026 10:55:15 +0800 you wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> In __page_table_check_pte_clear_range(), the condition to determine
> whether to iterate over PTEs only checked pmd_bad() and pmd_leaf().
> This relies on the implicit assumption that pmd_none() is always a
> subset of pmd_bad() on all architectures supporting PAGE_TABLE_CHECK.
> 
> [...]

Here is the summary with links:
  - [RESEND] mm/page_table_check: add explicit pmd_none check in pte_clear_range
    https://git.kernel.org/riscv/c/0224133dba05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


