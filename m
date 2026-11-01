Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571371;
	b=bh5KNEmEW7Ie076YDTSuzA/sCL49viD0wbSTJVesA2GAQYopM7PiLMcdouvtJRd2g96t
	 uMdEjmSeBDrGPzr+whwivaDAhRoUfc0vPew/Z83KlhxrfhZW+RiANHPIUkXPXrcbDF6NZ
	 EcgUmnZ5I57yQUJ3d/BzBhxCaGEYquOw2SNHpqiyqlb/nSmsaj8jnloWyv5QNbW9BNTxZ
	 OmifOtC09XYKNcp8OjInMG/LUYPx4h7t6m3DiFOzgYl7CL5htCgFO7GoIPf+a6ZpUKnOn
	 W2s/QN64q8q2+2pieSEYzciw6hFw4ViFntOM6b0YR7oU41PcVtPAWRaOD9ZSa8NAL/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571371;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YLKh8ba9L3rUxnN5x+nnHd88mmDqVen/JZWph5lSrDU=;
	b=VMeCZnxokpSkBwGmhjnu6YI0ZOjFR/D8dfpKsTUf8VL3YWa364kRj+q2ATr6Vs/sXk5S
	 mwnIFznspwZnQ/hyTGrImA9jBAdXktRJG6ossMX84KyhLp5cueIXg3xHqDMf5j0tPO/Dz
	 B2d81H+5OEPFu4h5KEK1yTJlOO/SCEuiG6Ym2Zkyi2nYCEV8643bB5s9oLQA2umP4v8wz
	 4LUmalTous8BYXn7X1BhMSEQ0KxyDFCzbOiRS+XSem449dsOrcDL+ewem/hNUBQTAv1uJ
	 dCjdL4zSliPoXHeFou3awMi1Oc8PWgDsulsR0BS8myk/hHm19GupmF1CxLbWd5kCLYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSZItbFK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2860A3811
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSZItbFK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1131F000C1;
	Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571371;
	bh=YLKh8ba9L3rUxnN5x+nnHd88mmDqVen/JZWph5lSrDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CSZItbFKmma0qjQPQ1I+yVnn0zcypanEL3Js6cusu/K3BruI16405oj2sfQPr4Qxo
	 5vyR0gnYlSUMtCLvP1Sr5lji1J0tWWWmzF1yE4ojdGA4M6cWfaC4UrT28Uk+e7J40E
	 WIcpCJnlN0XYsd+gexjLjS718qwcGcvSvQqqNcH5DTxvY/HnZy2bouWOekavUGTTX+
	 rfIYZ9CrSd+SsV+poLXDzWIcuyml4/jPE8dQQpSOEj2TLS3JdBUqUmexEBuMmy7uZM
	 bBaAXihgJiq3V2N5pAkBfVjYTnN+aBBfjhqZ6A4R9rwY1OllGuQb6x9ADBVrjkI0UR
	 6ccb5+35KLfEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031AD38003B8;
	Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
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
Subject: Re: [PATCH] irqchip/sifive-plic: Panic if initialization fails
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357136954.2624073.18206480386098589488.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:09 +0000
References: <20260911145037.427896-1-namcao@linutronix.de>
In-Reply-To: <20260911145037.427896-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, tglx@kernel.org, radu@rendec.net,
 pjw@kernel.org, samuel.holland@sifive.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Fri, 11 Sep 2026 16:50:37 +0200 you wrote:
> If PLIC initialization fails, the driver unwinds and returns an error.
> However, that is futile because the system cannot function without the
> PLIC: all device interrupts are routed through it.
> 
> Instead of the unnecessary cleanups, panic when PLIC initialization fails.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> 
> [...]

Here is the summary with links:
  - irqchip/sifive-plic: Panic if initialization fails
    https://git.kernel.org/riscv/c/dd6abfd40c6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


