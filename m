Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800938;
	b=HVwPDDUS3vfWWUBOac1UXVbwxpMs3qYPlO7dc2a4OU1pDKGItjQuT9QJy6zrRF26S8Z6
	 uZn/XlI/fC9mq27rlqQCc1aXdXApS09MLyf34jJ7/u0D28VKIpTb1jAje4rVLEL+yogQk
	 l1QYinRJvYHT8Q90GI7VIAYIpYrgsUlPjrL3GYag+M+OHyq3YYRCWqXZCwZ4yQeGWZdFc
	 J6KE6d0mvRkj5Psjf6wV697ie63SrUUDMDH/lwed1yLPohTYGHpi/kQTc3zX+dctEg+ns
	 agsPHwfIk4PWU+dmQXD0jtP5Sbq5Xc03wMNlYX0acSRuVbBB4C2ZujjimLhWfQtMteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=AJdMBlp5AvW7Nf03LziKxpaZYi6yerfAfMO2esJZe/A=;
	b=n+CVA30SgTbevR8SAiJu5zw4n40OTz2GH3PJex3tNQZrmI+TDD8AQO/VJe45/hNhtsgH
	 xm6rwURNtkSmOnl5xOpjQeve1/K8kiL7k/zUujzKs4O/dJGbq3v0qDpl8dd31zKotqRrU
	 0EtTJYhpUGbsDJA0iKpm0HrUD+gu3JvOmkOQKvtVEuy4IjF5slgSC3V0aBvS8PEK3jUyh
	 wABk0lcyLY0U9L+9G0sGzsI16Sd3oZ/AsdkWv0y2ww88Eip2bbpsWAH+LcZGPd50kFmhg
	 x9OjObxABsbntWW1LudFue7ewOjYspRlF9K0clQRcEkmhIuw3jgaFssCYJQA5DcP8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+CYWT3C;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C0606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+CYWT3C
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35ef6b49813so2085678eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792800937; x=1793405737; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AJdMBlp5AvW7Nf03LziKxpaZYi6yerfAfMO2esJZe/A=;
        b=H+CYWT3CTTG5biJP74/Gtgu9JctbQP6qu8kpe/p3iefjxJWSLW2WDtX0xqvzxY3VvS
         umujDlxU2+97eeJUkA75gp71rS/QA+WAagpFHr+nIRYBTw8CCTweN5PFOvfjwhfWWZ5j
         xz9UgZEevxEHqAKeVtlpjOFaiBvc870ExFcTlBH2tZNGQ0dCTJZ3hje8h3NeGpb4AhuL
         Aix04wl//fTjXQQmtFGvJslBU240SnEq4JXZqMhgsdkJXteT8nu8Ep8W0FxLeU6EL1rP
         ZWoO67fLCIHw9SZhJ8vR4MWP0vBqa8x8+vZNEPBOmybUsUL2EFU3FSaWFj8D+LlZzwQ7
         uYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792800937; x=1793405737;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJdMBlp5AvW7Nf03LziKxpaZYi6yerfAfMO2esJZe/A=;
        b=y0k6wa4rJFXn8dTyxDOhzLGpGTzNSY2DhXmxwBGLLDfh3E+mWITIq4m4PFTrvKrfDz
         VTYnD+3qbaseBEO+CUikyMV3jmJoeQwWlkVGNYX7OmFUmpjtC3uYJfygYCNhad2vejH4
         0Lo7qGSLiLpJxfyli5wN//IgPUhuAar49MXBON3HelMT9F1/Si35ZwcfX5cSFvKFwQS4
         1lxSR+FFdOlsPI8j33k+Jz0FMcShnCy2u2VcvCsblkRavCtp58mXDHHi8D51NWGAukh+
         4TPjlRSmbo28p0xwLkOLhS9GecHPxm/qw22bfIQXnA0i9qlY6VSl1OO4F/U+Bxndnkzl
         2g4w==
X-Forwarded-Encrypted: i=1; AKwUvBzPmH+p9OqzxN2evZ5XcCp9TidaWBcIN4mlEUJse4GbY9q3Zp8npY7MGhpaqwYPEOlXm1ZE89+NdppBMQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBBtMfh+kfNsCE5J0QWyn7yM55AHgEEmMCIno73HeJF1zFPmf/
	k5VhWtrEBeXRUaZFntq1KuYa55wfCYfQ6tiRTMHuQ63J6jTsPY1e0w/w
X-Gm-Gg: AYBFou39y4/Y8w8ybLtCFLzqKyhSp1fj9JoaouUfb8tX92Fc6r/sCM4vNC9AuMrW4jX
	H6hgF5jj4wbQa+eNsOW/R1TN7k5g21KKTBzlzpQmYEuhmKiEAnD4KB9YnVY2v1Hf4+UT9Uf9y0q
	n1+ePLmufsD886FXwJCU89ALCGvqPdAm6z2nGfx5bNM3KVJIrir7seoxTTeqw95Z/D1FLwtISs+
	OzCjijcEi39/i9Zg8zLw0t3bzUaszqEQHUYA3ekC2LzFildSEJVgrwvQvtzyzfev7cyi+QTbeZR
	7YWgD3YnQerzVPYjP+bWczZD0jfqCUCymTEoJN++M4X25DCi4ApQhvR2b17oUicBnYxD+gRB/tU
	sVVYxUlpgk6bRupR7F0sS10U8ZQoLNdxcD9xkr1uohbkzIOn79B8PhQGvYAe/I3Kz5CtDSbO4Pf
	o4Kp0S7XrTfuT+WiHlglcgUHTG7BaRw1r3JtoBlH3TierYdiw5st9mhBrbBmMeBcg3n2oxYa/Z6
	o+3fyIuIqJ5W7reUWKqcsxX3MH5xtnnvkmi+FJZ95JxGNFTCCJFwA==
X-Received: by 2002:a05:693c:2d84:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-369e84fc4admr1462480eec.9.1792800937127;
        Fri, 23 Oct 2026 17:15:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d56957sm3151871eec.5.2026.10.23.17.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:15:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sasha Levin <sashal@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/irq: Fix build with CONFIG_PROC_FS=n
In-Reply-To: <20261023211503.3764302-1-sashal@kernel.org>
Date: Sat, 24 Oct 2026 05:39:30 +0530
Message-ID: <ecdg558l.ritesh.list@gmail.com>
References: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com> <20261023211503.3764302-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Sasha Levin <sashal@kernel.org> writes:

> Commit fbb22ceaaf8f ("powerpc/irq: Make irqstats array based") made
> arch_show_interrupts() call irq_proc_emit_counts(). That function lives
> in kernel/irq/proc.c, which is only built with CONFIG_PROC_FS, so
> kernels without procfs no longer link:
>
>   powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
>   arch/powerpc/kernel/irq.c:134:(.text+0x4b8c): undefined reference to `irq_proc_emit_counts'
>
> arch_show_interrupts() is only called from irq_seq_show(), which is in
> kernel/irq/proc.c as well, so build it only with CONFIG_PROC_FS, as x86
> already does.
>
> Fixes: fbb22ceaaf8f ("powerpc/irq: Make irqstats array based")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/

Looks like it still slipped through.

> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Change looks good to me. Thanks Sasha for fixing it. 

-ritesh

