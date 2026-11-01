Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571428;
	b=A3Ak0whWv21DsxgFhzWmUSQKVs1+KMkvbJBZGfbr4/5YrffOA+x1LORcZcWRO4ZOotrR
	 6zUmVBkiVVHw79cpn/ispa6N4CS5Pk7B/dG08m3nm9ciVhNOoa80+KeTwWfTJ+m07Cv+B
	 VCXawmNEL8kQS/7FOXBz6e77egzWDfbHMxbQi2BHlK4WlpVpoTHfl74A9O1J6Gi5tUFbo
	 JuL/L8DthaKet2gKYokoKaO43+GqI3NtlURE04uZlynZ9KHG556iIoHPDIY/fyzHfxkQw
	 FRiFpuaC0970ekhmiUqbo/oiuW40gUwRCbLH5zTgdI9XcMGjmBEVUwdwITRUdmnBQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571428;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=nBcby+831tnh65V15hxneU/5jEcnLn3vcSSp3uQCZhw=;
	b=bbBXeuFE8cKyCQAkzUbhwnACOic0Nw94YoUVzrDuAde6gsWPgd7WQQdtKxJGBmTMsIgb
	 TUuIPqyE/UVWhe2lcc+KU04VQBYLMut48doQGXvCOmhzTGluylJrT4IOJC4NVMTn19JGe
	 6gEeI4YuO8+n1R3uGtvPuGzfko59jp0JQj6vVMfOWqb/M4GPPJcPq43RWLfO5blIkBklT
	 OvOo2hiS/KkdGiR+Ydsv/TKV5/AonNf9OL3KMXL9mqmzGX4pM8yvKZ6Tmr0FXtdfYzNZ+
	 F+5B88LN85oznHbAIPNRLcLCe6MyEpHJddQQuvCIMEXavzCLyJXaRzgKIjpFQuBswEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM2QO2gp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AA6074B40
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM2QO2gp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481E11F0093A;
	Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571428;
	bh=nBcby+831tnh65V15hxneU/5jEcnLn3vcSSp3uQCZhw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UM2QO2gpOUFN7K4kaI4CIv+BCK/BlsbtUXc6McRUkNmpG/SqfTu/HEOHHHo5l4CAn
	 OAo8AnZs0Sb+cGM4YF5L+tBa9M8+83JeELgaprjspGt5zewixeNEj9lGKtF/wxuJcq
	 nqFa1ziN/TB9BQ8COwY1bBL9x8JoYWXOucfN47kcCgGzgba13gLvHBtqKqqol+Gxin
	 KlO9N2iIUP+He2LtIwhX4zwsEHj/beQQcb8/KZzwY3agVlLdILI3RAFYLV4EJVa1Kv
	 szaWAjNYBIygMKL1K/v9ObhGNjQWniwA8IN3l77UViN+j0jjxIopZtDHj40xfy+6T4
	 Oj0uSH7v+Yt2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401C638003B8;
	Sun,  1 Nov 2026 22:17:08 +0000 (UTC)
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
Subject: Re: [PATCH v4 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357142679.2624073.3195794229721502682.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:06 +0000
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
In-Reply-To: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 urezki@gmail.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 liuye@kylinos.cn

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 28 Sep 2026 16:15:53 +0800 you wrote:
> vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
> allocations.
> 
>   1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
>      and outside the VA lookup range.
> 
>   2. The function searches only one vmap node, but allocations
>      larger than 64 KiB may span multiple vmap zones whose VA
>      is stored in a different node's rb-tree.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
    https://git.kernel.org/riscv/c/f4399c9927c4
  - [v4,2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
    https://git.kernel.org/riscv/c/4b52da012040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


