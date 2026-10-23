Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754788;
	b=JO2f1mYyIyvhsqlU5mANEuUX6LRtw3fUHF3hvORXXGYOKVZZM37Z3OjRC/amMYLd17Sr
	 MRXwm1Jhdm5Y/KijGfSHwmnRpB9mgT12iAVRoJKKmpkV1NXaSoKegyag42ijBLceK3g0J
	 +iFyY6MG0r5Scw1LMpt4ItyLetS8V07jdZgJfYbaVHMmbu+dq1rZR+0T42V+P+bVlhRgd
	 Fa2E005PLU2jIeNvnFkFgwjiXnp8BA2NPCwlirL4gOPF94C/E52NTg9Mz5pHsOJHhagKh
	 UILnzCQtXdmAXSOf3hRDsKTELbCYHMTpRCzegN+XtaU7G4W8lqKNnvNs8WUOkJFyUAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754788;
	h=Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:User-Agent:MIME-Version:Content-Type;
	bh=xhUEUI8qpYiSFhlcnEeIHI8XOFA71UQe2nDyi5gq//c=;
	b=YtZWB+VSlFAG2/Vxeoe4qGu3n+IhPFiP7dJVVsJgXAf3nEJ0mttefV9Ls8D/7pS8uKDF
	 8vIZzwUntjrv2iPeflan46yx/cadGgVd8boRv6oz5OaFBxyTzWorNxl38uhE6rnFg5jPc
	 nzu56lGw7jULJCXjuwjRVy+JUOdRZhkv9gQYDbgqo2qijxCN906ZCyyAVZuxoB5HJe14M
	 PLWPsW664YMkswYgezgqdX084w/+1YXio/h9rOr+T5v2DaT4kTiQpPXer2RWl72ybOhT2
	 74Fyc+Of/cY0vgg0XuhCPGhaUlAbpSJyYNJL9FxSJ5Mb63FZJRrzK7teRlXRz0GWmNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03420606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 6E9551003D1BC8; Fri, 23 Oct 2026 13:26:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 6C5AE11091F45E;
	Fri, 23 Oct 2026 13:26:25 +0200 (CEST)
Date: Fri, 23 Oct 2026 13:26:25 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, 
    kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>, 
    Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
Message-ID: <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Saturday 2026-10-17 05:51, Paul E. McKenney wrote:
>
>Add emulation of two-byte cmpxchg()
>
>These commits add a cmpxchg_emu_u16() function that emulates two-byte
>cmpxchg() in terms of four-byte cmpxchg() [...] 
>namely sh, arc, csky, and xtensa.
>
>There is reason to believe that these systems will soon no longer be
>supported by Linux.

riscv64 also only has two exchange operations 
(lr.w.aqrl/lr.d.aqrl/sc.w.rl/sc.d.rl). 
(atomic_compare_exchange_strong with uint8/16_t, in userspace, gets 
replaced by the compiler to a lot more instructions thanks to 
implied -finline-atomics.)

Are you saying riscv64 is going to go unsupported too? ;-)
