Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572779;
	b=RgwiRwNatBIhF6VicvngwEutUegLDxg1HI5EzlqhQNiBbGrKAmLuYJEvEQKq8DZg1T4m
	 fqM147hQ8sSA14Xo6VRTyrum5Dl39AdWKdkf4CzFHUy7Yvxrw7s9LOs8+gLfI+1bJDoUi
	 9zRs+6nUYc0KYRYRjatVcRvAa2YKYEotALkTg4kKjlAloh+5UFBOHd5Bred9wNO0GlHU9
	 uRux4dd+DLGcjclzzrkc4k9ALAb4mvSjuHRGUTzRR6ZETzcZ386SWxcas6BNLylwgTFXQ
	 Ic/jhfwxZTn/GjJPxRvqGRNsYySmxb44s4qghBIPhEYxJ0t3pu0qPu3HvLbzT25Y4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572779;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=DRQRIRQarXTnNZOzq36UNa3LsErU7BTljNQ23y9A7r0=;
	b=cPs+UeE40GwYA4Sw1CFSsEuNDxkf5E5RLLtXcETxb/FjUvgHFAdrB23nfvUtdZL744Cg
	 zSEKXTcR7K442LTrnfiFx1A8uK+Gj7B0ulzMZQvrY/l/9CFLIzW/SnFOu4Z7STemaffXT
	 Op251acRyzKIQpczd/EpYZdI9qdczLWHgM5Gv6dH5RaoNl7y2h9JjFmrbMW+mvaZdCe3c
	 rJEKoySLD6tCOF1ZSDR6cRNM9dYyiJ+rcK/UnVAz9wtXvxBahIc+1kXwALggphBZDaBLC
	 ZC3q0PUiwwkiNTKow/BHCeeoUoWZY/jHarQatxpZkgM7BS9q/CT6G0Xt9E6jBK0jl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NMPhMg7/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0EE606A333
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMPhMg7/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C614E1F00A15;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572778;
	bh=DRQRIRQarXTnNZOzq36UNa3LsErU7BTljNQ23y9A7r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NMPhMg7/LznAP1qKPdQhcyzfkoRnuRkq7vWZjqAO6yYDMCI3+mTSy00GNoTykPN/l
	 I+GcNSBWN/4lKNE6BrbqMKRcw2/+bmGiav7aSTicXO36taBJC5NZH18IU5+Coi0wDA
	 gdR+edr+EYORtPTeI3PIdccVm00zUB6RTLyHFT1po3Dthbd/+/AQoelHGin4MWU/kH
	 uoyu3FyWLf+cXi9OWPgdTyEABrwXLQsIAJPmb66RPyboOjS6jYP2HlbHO9F5enDPf3
	 gg8XEGofYWsoGjADLkrLrV//hLH/EIbWNPvi1BLJ2/pR3iSrs8Q6hADfijvq8CV2e9
	 aclo/6XUh1New==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA314391AF9C;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
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
Subject: Re: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357277729.2624073.16276179294842565397.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:37 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 13 Oct 2026 16:14:18 +0100 you wrote:
> Hey folks,
> 
> Might be my last mini PR here, since the RISC-V SSE driver is coming via
> the actual RISC-V tree, so there'll almost certainly be a much increased
> activity here going forwards.
> 
> I'm a bit late PR wise (sorry) but I blame conferences and a busy week
> beforehand for that...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
    https://git.kernel.org/riscv/c/7c2871861461
  - [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4
    https://git.kernel.org/riscv/c/928fdc6ff69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


