Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571348;
	b=5pYlQaheKFytzw2S0EmLh1+PKhfCd7J37LWzORcmMtu4BOEklj8vXObsL1Jpt6kEVcjn
	 TmlrvDJxc6jmVaWGVTAlMhm1KR/iClIrAXmgjNDKC6BlId0/Iv1t3wb/8K2Fpketab0XO
	 n5LOt0kM/S2Hke6sQ7qtvPNGuHOTwtM/i1SRTXmgQ6qMwZC8hDK6J1NBUsmBbGghY1gwj
	 vm+Tgo6oUaVm6CXYlV+iiEaJQs0yhvLdbDU0wW11BiR6Tno4IxOyNZ0goRHTvEXZkBDEC
	 5rezJDmG92KlJYNE6V3io6bHoFfyaz2KP8gdo5t+zHmU+CIk8/1NPs+nwyJyiZDYG3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571348;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JvZMrkFAj4cuxDxTXvU7TjTIfCCUoa7HG949wcMrARU=;
	b=vSlbz2KhGW2KFuHgjN3/CWgq8p/pFWTcwFJZfKU6rHCKSRzitJA2zbng6pw4o4DE1u3D
	 UJhHNvgjfn9YP9owdkyvTHyBq2QtHXbDV67ju3zQ3f+3+gqso2hxlsERxhk6MUBDRvgXU
	 FLdEmZKawiLEnMgbxIgIOQCc36mkizLg+Ok69OU0Zs6kcZl/7Ty4S9gmBsO58FmZHrcXQ
	 JIjuH0CAMK1o6J8zPeS7hKduSZPo0umHtHNH5q6zg4O+V2ojHqzGpoxUN8onfKA9TYj5P
	 S/h1F4xZwX/wCEIqtY8lAF1T9RAxSuSLXtn/ScrfbxtGNdPQgi7+8QnFpKTF4YPFiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsgCfXK1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF3606A324;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsgCfXK1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9391F00A17;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571347;
	bh=JvZMrkFAj4cuxDxTXvU7TjTIfCCUoa7HG949wcMrARU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lsgCfXK18Oengq3LRjoYkZPO+6SC8jlVqgMOxGhbYf6DhhJ7gJLlBe7Y6Ani1CP1q
	 YTl8YzcQmWJpIiYoIDW7/60MUvIeQoGBoRLzYrHbzc/ybAqIrb8JDl5cW4++mQVvJP
	 rRl0pi4jare82zWO8nIdn4//CFelRizT0b2aO6WZojStQm+YFdDbl43GlRLD7vdnWz
	 Lc/MQ2ywPVXyfom7ekn/7yiwaRBvBIOk3IjqGYO5XX1ai9sAcfjDz/mHemiW88S92d
	 3tCwt2f3YzCmtXLFF3ypGGLgnusjSEhmEIowD33VhD/raZLHOZaZkap2soMP0zEtvC
	 17MpR+vLbQXIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0318238003B8;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
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
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357134580.2624073.9566786925548319371.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:45 +0000
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, fustini@kernel.org,
 guoren@kernel.org, wefu@redhat.com, rabenda.cn@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Drew Fustini <fustini@kernel.org>:

On Thu, 01 Oct 2026 15:44:09 +0800 you wrote:
> Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
> SoC with four C910 RISC-V cores. Add the board compatible and device
> tree for the Milk-V Meles.
> 
> Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
> name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
> support over SDIO and enable HDMI output through the DC8200 display
> controller and DW-HDMI transmitter.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: riscv: thead: add Milk-V Meles
    https://git.kernel.org/riscv/c/2c8613ec65f4
  - [v2,2/4] riscv: dts: thead: add Milk-V Meles
    https://git.kernel.org/riscv/c/8360e1bcc246
  - [v2,3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
    https://git.kernel.org/riscv/c/a7f2539005c4
  - [v2,4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
    https://git.kernel.org/riscv/c/d43b33e0253c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


