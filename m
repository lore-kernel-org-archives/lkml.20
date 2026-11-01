Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571394;
	b=vpEvZXUx81vC4up2HEsrlBl/pDUtuQr3mcgSxNWcs1caznYOvniLY98QsT5RQ0cKCcJ1
	 p7nSSiXroZ4RTNjmZ9dPXfUwwUwaV6yHRaxwuKeSdv7PRaS4opXomPMEm7OPIvstKCXTl
	 yqMF9Uo2pqlXNAAUMg0pKWJvlNAhmA3zNYwR3aXwAJ06IUpW81h6B/RP8ts437oomrk8d
	 s9jqaATz5h2USZFBS33GDLwcaZBIYgamLc589bhqorBiNk9DIBwBoAcQFrj8nQ6Ril2Q9
	 SgX37nyxM+Lb7ArFm+18YShSTuH4JDTGHjrsT+exSArnFij4HzVM7ARzLGjqwYqhSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571394;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vPgja9r0ZoRtHVHcwxsfwm7w5JViho96W46Bm4fLyK8=;
	b=hq7LL1aQsugMVNjUKy00Zb3ebIojmyYFwCQjRMl9DjqGp54EnBHiHJt7ki/thtruWyiS
	 tiVdcF0vn3DkyVkiihNdzPk7SrCmRLVEXbVpDxZNCN7cBE+c/logjD1osp1t9IfcVffyb
	 DCBvlJMLxi+QSpFmzlNRqSX9/mDx7uCncNz8jj1xmdMoBa5n+G/Ce3Wfj/FfsgBrwBVIL
	 nunE3IsXQbPiXGMi6l41yp/+fbD5AZfdVlo/Th/0WrQbf+Fd+RUd2rWI68j5IVtJ03xc+
	 4kqYA5VymWLef9BO1hayDxdToAFEoIH1EXMCgFdiPuDShkJBHeAiOptVYHTClp1e5Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTSWZ6Dt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8798606E526
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTSWZ6Dt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61881F000C1;
	Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571393;
	bh=vPgja9r0ZoRtHVHcwxsfwm7w5JViho96W46Bm4fLyK8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JTSWZ6Dtzs9J0UqHUyPbPEyV//V4NX61L4kzLACDacmhWcsyGwdMTrPVS/Y+naCDj
	 uDrnMeeGtvuaKOcIsdCDhLA+US0bUAbj23SvZD7syFGKvml6d8ODjUM+tuk1HMnWbT
	 TZDV8WrLIfX8PEKmrstDDoxT/0+WupCSrWK3FiZr7WRGwQNPaM0q/+5ts6nRY6/53c
	 SbV7zaoJzrQ0ACFn3mXGCKuNjeE9zh9m2dX/apQ8mMU+RtiqUgY5NU/Pb+f/8H1/xm
	 JZPP0h3Xc44I3+FudJiqxmEFjp0cdasLgV/Y2y8Q+eUytWemZyuEVZcGyd62rbkMB+
	 pzWkDECYEExNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA39638003B8;
	Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
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
 <179357139237.2624073.15165428968109516783.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:32 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
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


