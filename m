Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572778;
	b=ynsi6ipptn4/pjSC9g2QI4h88mv63Flgn/3YzR2YZVYl63gs2YpGcKVI5jYDKGP6HAj4
	 4ZVOgB8y2pr8SdHZcrcKI8Xk0Xwhlp7PaZ1L6mj2ofP/3dAZ5B1kTGUUH9/jIrVnGNI0l
	 Z7xeT0vwZ58bunqfjzn5Ny9SVDkJLiJ3a6cbdwM81XbtnXMMD/niwcTQ7Pr/U2+UQtydy
	 UXTGS7p271QReE7S6znuP1HEgTDlZwYcw2NFsxe8HGWNd+NLEfZYAsNgxI2Z2EhpWp5sg
	 vK/qnvFdEJOD3qTePgqIVcgsvYjYEro1DQtkdG6ZM+ijo/ks7esPt/UJ1njE4tveKCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572778;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vLtVfEGtwu3bwZiOUe3jPRQr0Jnv3xFPriBAFC9hebk=;
	b=42jQ8iiSc+5UfP2nXhVNuYl3eGSTYIEdFZROvw1QeGr1EQhrmK0tqkvWwpqWJcTKbX2+
	 CQ4i49+PuC4ENu3Dr3YZ27WIGw3QoZVnr1WIDUn6q6YLz/qAKGTLBmca9trFHoNSaJZJt
	 EBY90Lyt5yeZrDL4FtzEFe2yNXcmv3ilN/3izVK4PMFx7niFC9HIiyPGAtr2eX5ycHxfR
	 dbkxBtPPOaG3/KEnKEzS+YjmIQ0i77BudUnZ0vx/EQBKvmJuwBh6dW8m3izSokXds9NYE
	 IHeSp5Oh2zElPuLAlxb/K0csyGFyyht47VQpVzu1mX0nGmLuUFRPfEGwbeObPu+jNwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbiTQpLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8725606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbiTQpLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D8A1F000C1;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572777;
	bh=vLtVfEGtwu3bwZiOUe3jPRQr0Jnv3xFPriBAFC9hebk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EbiTQpLLtPVIrDr6uk8x5RwxaKWrPWGzzmd5Tl7f8dq/EKS5wKCLl0pjuuFQy/VMK
	 NkZFMnw34H7smMwZEESl7iDCOsGYEXzJKXj3ZkPABstCuAq8/4I4BVSaE4TQSJmF2e
	 Cu8aDXaE/7S2+3SF8kYQ4m3ZwecHQJzkARH934GQc9r93Ks7ebs+RQIuuJu8hKEH5K
	 NassOD6UfCjOhDVBR1f3jVhG78r4CznZwGNHPDYaFPosmE0Z4FgGhaM5VBbm9jeZYd
	 gPmvX0pZfNJnTgDoQWaqpVJroZrpBLrCZ/t8sQc7MTvJvWF7gxmK/ziqttkOB6N1mf
	 l76zRkzrKbcBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401EA391AF9C;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
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
 <179357277605.2624073.11642438626081905507.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:36 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
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


