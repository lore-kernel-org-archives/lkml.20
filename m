Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571397;
	b=wiuo4hT/jsuELLDA/HHx2EePHnFI0jHp4JRKdldxbNKwPtjASd3jGgQ/UaOmB9OP5FY+
	 t7QyY+AaEWY8wNUlmUtPQBiAp1hL/nnEPEYcLqXHP4o1gLurEt6/s/RlVKKIUN1t4qU3u
	 hFlA8HHhPhiQKpF6pnQUP7za68do2YmvBThFDSz7IrTEms0A/lMT1MD2oLscqhQZbY/MU
	 rZeduSj6qlRT7H6X3KXZJxs90A70YNotcys+FehF+Y7v6CFLMRiSk4unNPxl5PejZkrMQ
	 Rlcwk0U3YkKcv1xcjygCT1Jp52eJsaWwdQLepmkDhaugNTsQdww7rKmblHKRidn7U3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571397;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=4/be1ZrHaJFMLso5b5pIRzsIB4FCGWBb23W7/vuRdXI=;
	b=qo3IV134Bcm+I8+zc4ZCUSujBztmJviHea2m8ARxXsopcayPIsTJdTJp70bFOCnn5SpJ
	 yqbawCK5HAnwtnYrC5e+cfCT8Lfdmg3RVvzSWJASUTyudKYViBtWvLOb7IvjX0p1dvVIp
	 KdGwjuCHTwHBA2MKcQhdZ/ZOsY1EzBtWF2Vu0Jo4aNPvuqhl/rcC/0+U8tU77gxifjuiy
	 ug97SZ3/qlHuRxSJw526qnmxGsRMQ7uspkNRzdd6HmeSZwe1Ew3fOBXh3EktDND8monaq
	 gPfZXry2aPGLy8JJTL61176vSwFuCSTG+Fcnbl5ttq0wNLb7tILQ8TILvPv0ooYi5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQucWQ4l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D3606ECCD;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQucWQ4l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27321F000C1;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571396;
	bh=4/be1ZrHaJFMLso5b5pIRzsIB4FCGWBb23W7/vuRdXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HQucWQ4ltkOJetKmKDw0fBX4T/NcSVy2UOVZe7RE1BwoXyWPf4E+/+gI+fAAt/JJ8
	 XvnAvlkVpHmaZwe2CkSSxrjlpxUMcvBv82b05B78RIRAqfrqqyr9ppNrPQ/3LQXQ3p
	 65OBUP/u9uuvV7XCxzRlSspAaNxGpU0Q0sHJ735yBY4yibdr1EqLZBrkPMGiiT4tgL
	 SxFqb33KkpO0owBrNtnC9lQHkQN3H4JPArw5MdGK09LdsxcosEr3bUHemz2nulD/43
	 jdW4qdmRNg1G1OIpVGTw1S0sfdK80uKuz5GLwlTQJ7dSi4uTaPjf58zu8xJVzFs5Lw
	 Z8SscnFcSUaiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA42C38003B8;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
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
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357139529.2624073.3641099794462777978.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:35 +0000
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-riscv@lists.infradead.org, dlan@kernel.org, robh@kernel.org,
 pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Tue,  6 Oct 2026 18:00:00 +0800 you wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> Changes in v2:
>   Remove Ethernet alias changes.
> 
> [...]

Here is the summary with links:
  - [v2,1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
    https://git.kernel.org/riscv/c/d05c62364960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


