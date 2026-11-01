Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571373;
	b=vwVjXS2GwsOwz7H4P/6IG5goJRgo6mER5tsD5z72t5B+Cw1pkuk8uoo8YSrr54H0YDGj
	 dg3JInMzO9iFgHu6ACtvtGoxHmpxUK+RkmJ4fn+VmEYpfoD2Sf8L2r0OL5estTpjN9lUM
	 Q0fIuGi8bj0njdVCmM50NYVn2DgvTkF5eBQ0ysJLm1k/eEvNaANQOtuGfdpk5x2MhcahX
	 Gc47CNxIuL48HJc1AxWwlOxoPITxvCRwWm7cW85ZzTI6ywaIHz3pPcDopegQ1MODypOPp
	 0yaU3sxBNsWZPIIeMbTOTMql5DznuSSHhLRJCzvZXQLsLk2VRguyk0pJE7Wqn3lnyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571373;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=giZGJrmJ+qacYqxmdFZFyw17xIbuZvWJpSr/F67UmNM=;
	b=C1cBHZYLp7ad//cBFZcuoTItfFDzNH8hBrD9+JX0SAm6XNJcnyFittJo/FQqTvcJNdav
	 BYq4TRd4g/RyzKLQHEbLc7jC5dJ9eHNEkubx08zAzJHNWR6rA3uGDm4T98/cUC9qm7VE3
	 WzeLBuDWYY+dSc8KbeN44yVGKLm/R8JOb1B5HLkX5q0Y4aOs3YmE8FdhzyinfcXvxHvmE
	 VfFHTTxwRCH84tZJNt50TbcO8BIN53PsEKLmTX9Vv/u/CwMGthTNrxht9ycVLk7jrs9Ow
	 Tag+BRms19x0hdgwOfSTybk5V5Gcj28Gnmi9uqNAjggPKrFQNqJFfkxlDwIKqF+OO4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP10cT91;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCB60A2619
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP10cT91
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875131F000C1;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571372;
	bh=giZGJrmJ+qacYqxmdFZFyw17xIbuZvWJpSr/F67UmNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jP10cT91/z/TVGLS1LbXUmDx/BvBQNuhf30v2H4Hx5WDw1rP1N7tofXE15JkcGK85
	 TY4ZvR/OPuuJQ90O3Wygg4v8bQQ0ahkmCONct0gECzbDiWFDPOkH3QXVEdwZEtJ4DN
	 RMt0JvJMQ87UevxMmtffQm2smJdP6NQ9domQ1VkvQBjypQmqgyJNxyKboUrCmj3Tcd
	 ictPzu9tMSImPCe91AaZmiopVLrfx+ViUgaMDgE+qS0XL3b8BJqBpztEM1PI7NBeY9
	 6IQKGPRlxlhF/HULLFO1uRyX/g9zjnp66sFOxLItIhI6Bn3ygRjxPMYbBEAL9VJHGF
	 TslbjOWCm0e4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D27038003B8;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
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
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137104.2624073.12690536548445042177.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:11 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:38:28 +0100 you wrote:
> Hey folks,
> 
> Diff here contains a lot of clock bindings, so I've provided an explanation
> in the tag.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] RISC-V soc drivers for v7.4
    https://git.kernel.org/riscv/c/b45ebc4a7cfa
  - [GIT,PULL,4/4] standalone cache drivers for v7.4
    https://git.kernel.org/riscv/c/655e6054acfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


