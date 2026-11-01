Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571395;
	b=PHA61tXfFOMtHZGohSa74BBA6VV1ujC55Sy4tCZetOoNO6JVYYc+I8Iv/BPFe1onc/Yg
	 RqyKa8xEBhKWrv7lbGZcn9IAzEZbQqIruiUXbCXx9AdPHmak8uUxNOvv1+hriwjBvTTUl
	 97+uhETKycysrIyy5+v7v14GzWCVmolHw455lpCLdV66ubJOb9z5nGlhVo6FqBzb+r/d5
	 qFqof6qI+HPYrB3mflZ2TRR1Xxxk2Kx10LQuDPiwdjqsMtkZasXnPMR9ZP7ZijrkZUJJm
	 HebcW7KQryjxAKIm+EnUYIT33LluEzgAFODDO8nID3yiawCSzhs4ozZikhqfIsWyItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571395;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ommBQgrQeMhNbDQOeLi1eUBrq5i9pecvZuHTvg+KCVA=;
	b=1tP7y2g3AAVSKOHit9WM7nTDnW3dErcA4D4gq2CXtwbdf/caT49yzm7xAD7JNKRkPISS
	 OnZqBWaJ3O8yEi6bCxHILpTNlcZjGBL4lkjw2wo0JjIVmzFcOJORVcOnyn6phClPK4w9F
	 rV5t+SuRnEJQgyPtcwvEaA7TQ+AH3HL6tbmC62R3OupWD2yLuGJvvxR86cCnrV49k6QAf
	 gGZO7aSEUrdZ/dcGNsS25hksctkAueRv96fUWq+oIKSwZP7iBLyBiMwmvtz6Wft5L4NyV
	 jLK+BDitiXKpV3giKZFXnPiPiY7x59tbd0afU0XJ+PDZxFVJXzVUcT/kdRulT/3hjkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5GhBN9X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7560A2638
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5GhBN9X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4847A1F00919;
	Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571395;
	bh=ommBQgrQeMhNbDQOeLi1eUBrq5i9pecvZuHTvg+KCVA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X5GhBN9XGEjLvDcB/bvkJIcWjHLmjFuoNl7IPxqhQ+x5K/tgHjKPHLcxnMlip4mu6
	 APdud8YmZw2K37DdQZzUqHA8yG3qY7yo7IzC6lsBz+GB7iS0QqNROv1zUGAI1PDiMm
	 WYKDtPcobc4yy4cjuqc9Wt1zCWzznJi98CPOlWLcMx6PyleaGq+ajmIBy2JLpJD2zS
	 7dSMPuQk1+QHMQfS1wCpKJw1ZfcwdpV2EXrpClw7PusP11ECRQ1CWfqJaborqShyoS
	 sZ9OCXQ/oxNq5rvkLnKFla5RZGdVR+XhgqxBsOMKwJ8x8GajPgAqSPUY/UNRedZMB+
	 qOPixWqR40iTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4026838003B8;
	Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
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
Subject: Re: [PATCH] irqchip/riscv-imsic: Use GENMASK for base address masks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357139379.2624073.2605115252327012698.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:33 +0000
References: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Sat, 18 Jul 2026 12:34:36 +0800 you wrote:
> The IMSIC DT binding allows riscv,guest-index-bits up to 7 and
> riscv,hart-index-bits up to 15. On RV32, guest-index-bits=7 and
> hart-index-bits=13, together with the 12-bit IMSIC page offset, is a
> binding-valid layout that consumes a 32-bit low-address mask.
> 
> The parser accepts this equality case because it rejects only values
> larger than the remaining bit budget. The base address canonicalization
> then builds the low-address mask with BIT(sum) - 1. When sum is 32 on
> RV32, that expression shifts an unsigned long by its full width.
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-imsic: Use GENMASK for base address masks
    https://git.kernel.org/riscv/c/bd7d57a03c4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


