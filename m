Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571380;
	b=ohlOoqNGpDO4QWZVbtTGIeySwYyIT16mr6WsqzYSqTHBlVwT+Wh7mjykTUwdrifK+47Y
	 TB8fQ3MWC5Zk2K4o1t0p/hVmQq4yM8n6EibVTSgfAtY78SwH95+UHE2QCWJKe0GYnKgSG
	 LcIlcFNsn3goTQ6PtsMhsoRDuFXXnxpiSptOwBxseyFSUyCsoqzSpzOGo51IeBdrshjfK
	 4xcMhE8w3hz6W4EhT176NldTlH9jKPYO0AD16IiLV/0PWeFlDrYo4xvkUa5wbP0l7Z6xx
	 Y00Ai0MZz+oWBJETAn3Fq4WJIi9Q1cg1HD3WQfrIWvPDTXR8yuO93RkMWb+LSZRBPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571380;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3jtJ8UO3TkxY0olDal3hNFiHyaDqKlexwUqaCAVk6ok=;
	b=EBNGXqhAstegm0/DPykttel/VK7qARWofNeHXcaIWaztAvswZGHiHO8MJZHMuLcV/6u5
	 mofO5AX2wkG2hJiZhZXD1EiXhFnHqKZKlOUPy0ulOoDQh5yt5zcIx3rJbgxKiOtn4AXYz
	 /XoaKONr+Dlf5MCB9iqqY9CL7ae8sfXWkK9sdrxeNCPE9nPejc+KZOh9AEa1q7HV52Mly
	 xBVef8xjL9pmsCMJZUhlhuWamK03pfMr+ztS+wjoJADb5cPvvo/Aois8xLsmic0Lx7iam
	 /ioB1upbDPsY92DDQeoKG/8AMHi45/wZvPSohelHnZ0vqMi9UyJYb4YhzwCaBvHed3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/aQ2MKr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA49606B04B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/aQ2MKr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C768E1F01578;
	Sun,  1 Nov 2026 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571379;
	bh=3jtJ8UO3TkxY0olDal3hNFiHyaDqKlexwUqaCAVk6ok=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E/aQ2MKrGbi8mlSbFdskUu+G46rV8LTVckPtm9QEs2zR6KBVwpg1cdZTLjU3MPKFX
	 8hDyOtmRO2vLQl2nvvOumhVUBUjD2pQLrIGfZJNBq0lVm/FXApgzycubsx3wdOjcvj
	 4GFAtH9vVAYaMyetYOHalb2p1YW6Pgfta/AN0sBlmrOPqWpRoHhM9r7I7A/84zl9vU
	 OQBNREIuzXWERb7PVgKWI4AtxQjpRDSB5g8qSKAAO+c8+jOwBoaGYT3pxPDT3424fI
	 fbbdqrCQERz+qdOUmFCmlujLaGBL575NzeDeupoGvnqLS3Ds5HcDfaAI1XuyNGkpE6
	 ItL837Zn2+DJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA21038003B8;
	Sun,  1 Nov 2026 22:16:19 +0000 (UTC)
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
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index
 fields
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137829.2624073.14938760984077073549.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:18 +0000
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
 bjorn@kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 pjw@kernel.org, radu@rendec.net

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Sun, 20 Sep 2026 21:07:54 +0800 you wrote:
> The IMSIC address layout places the group index above the page offset,
> guest index and HART index. imsic_parse_fwnode() checks the individual
> field widths and the upper end of the group field, but does not check
> that its lower end is above the other fields.
> 
> Reject a nonzero group field whose shift overlaps the lower fields.
> Otherwise a firmware-supplied layout can assign the same address bit to
> different indices when MSI target addresses are constructed.
> 
> [...]

Here is the summary with links:
  - [v2] irqchip/riscv-imsic: Reject overlapping group index fields
    https://git.kernel.org/riscv/c/8caa8fcec8db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


