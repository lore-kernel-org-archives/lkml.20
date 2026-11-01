Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571368;
	b=N5P6n39ZgJ8GhO+Ha29MOpUOeMaBlWkqIojp1ukz5aq4NanNeH7TL/hOSApkbxccl+E+
	 KvnYYa6fDfsc3F3Yd9lLwUqDFGY6JHBgBXqk8sEcQPcGKszjEstuJg22gEZxwQlqADR6X
	 X5g1BXJ1J+BRDBIWbJh/1/yJNimgCQ05Yfup82Wiyc21zwfx9gs7o6AZ7HxpROsI4Rfl2
	 aN3ynrgePWnzrjGE473iRKm+YK4Er543VPbZrmImEImN4hUC40fpAJoOsTagO2etMKyh6
	 WvFRTbkRFsdE+iz5j95Fv7u3bsTH2NqdeYEehmFQHJujt+6lk89QawbNPL4S/qp3Opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571368;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ZBbWyt1tVlT8vsng1tUZth+SHT9mZ3wIi2BBqX1Sd68=;
	b=5hMLsnC6/EWwztuAvhA/rt1M2wn0bWItvceZFj88jbEheKzaHw0rubneE3w16iryHsK0
	 wPei3i+EZ1s6IGx6PSBlBzuvv08tg9HFDdhCRTaZezm2icHiTowlUztf7BHFYfXvFmE54
	 Dhhz8FyWg+xdd8Cj87FKbA/oAcgh+FVeBjjbpMv8Yf+yYQzkh0+/DxeSPDjS30BWHCQBh
	 /sm1zkb2yNquP3kaO05h3wIjoH9fZ34PxZSmifWq26BnwrUQq/4C+WYJZwQHqzVLelNSu
	 TuzxD3gH/XG7TPs4v4RnvYFBvibZeC54rVAGdjIzMt+St8XUkbB2GFHLKeAdJZLkutA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FILr4eAK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E860A2600;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FILr4eAK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB51F00919;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571365;
	bh=ZBbWyt1tVlT8vsng1tUZth+SHT9mZ3wIi2BBqX1Sd68=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FILr4eAKrrpVTY1w+0lPnmpm4m+KvSLrl1sI3qLC6vcTCXawxNaX6GqkUyiku2N8g
	 lSaWKAfAnI1XlRfVF9lnSnyVCerEMHgjtn517BWK4EO9WUPrVqt6SLDsCV7BzVCqjZ
	 cSQEfzyYjr1CnowfD/wxZKufFzlOXp3QTuyBM9pjdtkgMOzeW3qpLSd39GREJYBd3+
	 GcPvcSv8rh2pGUVKzlYQVzgfErpTGhd4NvBEJAh0VpIWMt3PNwVujLLLxwc2d4Ogfc
	 Vs19Xseip7SCtUvLA97omV3Nhf2wU3N3dBTnfASZIsbZSaa3V5IHAJDmRRc9WXQasM
	 IWbAGr85MFw7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031D338003B8;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
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
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357136354.2624073.14746852216689780189.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:03 +0000
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org,
 tglx@kernel.org, radu@rendec.net, anup@brainfault.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, tip-bot2@linutronix.de, nathan@kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Hans Verkuil <hverkuil+cisco@kernel.org>:

On Fri, 11 Sep 2026 03:27:08 +0000 you wrote:
> This series removes the implicit assumption that RISC-V supports exactly
> eight IPI message types.
> 
> Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> separate IMSIC_NR_IPI definition set to 8. These values happen to match
> IPI_MAX today, but neither is the proper source of truth for the number
> of RISC-V IPI message types.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: smp: Move enum ipi_message_type to asm/smp.h
    https://git.kernel.org/riscv/c/1ae91dc397eb
  - [v2,2/6] riscv: sbi: Use IPI_MAX for SBI IPI muxing
    https://git.kernel.org/riscv/c/2a0d49514f29
  - [v2,3/6] clocksource: clint: Use IPI_MAX for IPI muxing
    https://git.kernel.org/riscv/c/f6326e26f602
  - [v2,4/6] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
    https://git.kernel.org/riscv/c/a89546503a0e
  - [v2,5/6] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
    https://git.kernel.org/riscv/c/5b104000160d
  - [v2,6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
    https://git.kernel.org/riscv/c/d1d2645e755b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


