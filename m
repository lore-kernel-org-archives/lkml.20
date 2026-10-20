Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486603;
	b=TBs5g9e7HG7p0D1baY1vm4s/62UmmO7/itaKAB664C4cvgNxwLFh1qvpGfH0PnPW9YxR
	 75ETFhhoN5puZxT6x/ujgW6+t0YTAwN+4N/GlyyXUqMJyXe/q6QB6Fp/VtOyLyLMuCD3a
	 X6G3iet84ta4n1/CLKR9cLgB7rPmJoSgLBofejJbEQoC197pRJoB1MzzLzr3fR+QXfZxT
	 ROJxXZEMnbHHAaGBqOei5C4WG3xeZUcTAHSvboxXMNms5YdD4JBqDvYCi1saFrTP2ymou
	 NL4EUUUYMCSut/wLNRcYfammanSSruRJbQF3seFLxtdi7TxlvSXH+KeebNl/8URI33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486603;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6lRRpof9/ex1G3TdchHFpSqu8iuP8pTd5flOxKqoxAg=;
	b=bKe+1PwDPH5blqRqVr3zrE4VF9FMTQU1vUmh+jui1UST3XneM8TUyjZcForqaDYUfWyk
	 yU6IbLLUujR51+Brt3ym4I80vivzYUg+BY5JWL6SbQZTonb8oY3q4Fsc0fDxPQfIyvqfr
	 GSsKNNEnUYyFK4Kga6CTu4SfPA6MqtKWk/RDHII7bepZ5RV2kgKN8dA5ZKQglj4tTu9qg
	 lLroCQDwyvbGACfaDunNOL9g90SknHXnPR5f5qyz4eIorwaa6IufgYLyAdtz56sYSEdcV
	 +2meMzAU+q4wo6cM+tj3ZB6hpUQl7WCfhbfYOymQ00gw+FnyBO205taxHUFAFMTOj0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	arc=none smtp.remote-ip=185.136.65.133
Received: from mta-65-133.flowmailer.net (mta-65-133.flowmailer.net [185.136.65.133])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA190606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA190606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Received: by mta-65-133.flowmailer.net with ESMTPSA id 20261020085632be56b7ff5f0019fd8c
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 Oct 2026 10:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=6lRRpof9/ex1G3TdchHFpSqu8iuP8pTd5flOxKqoxAg=;
 b=bbWfePclAqRG+3XxDAVxj1DoxlYkv8xUCoUBXypY3MVXP4vSXtm/RZ7ZxAxzwfQsi5pel7
 Coxp5z/wB3yo2Vuyl7bNV7b5RZ5j0uu3KH3P4NZh4g/Jo4wLsymnUs7p+hpxe0SqJ8idRsSq
 y8WTw+Xl2gO4aEBrBcqc/1ooqGbE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=6lRRpof9/ex1G3TdchHFpSqu8iuP8pTd5flOxKqoxAg=;
 b=PqPU43kR9MVZo33S5PAO9TbQkKghHC2pitMuioTVvSnta7hngIi3GI+Ubp+47ONxxGjdeE
 4IibI8mQsMi6emR9a8BnllvIF8AGtZJNn++ASFudyUbrgTQ1Iwu50Uo47kMEnaPFjXyqqweV
 BB9hpCddf9+wnQmYFJNDh0ckO+yhPqZUdG4vzeb4aC1YES76ow1idfmn3OURGn/X/JIQ+HvU
 g/nrhDOkdbSZon3yuwIVfcVhK1tF1JyTxpNuM+4004JNsPcKoQdLWaqMaYCAqHNlyMJMvOfI
 BfzSKvdEX1tkdsxZ1TOOMZO3ygNsjtGeZPOPbrbFO7qJtrOrvR+YZrVA==;
Date: Tue, 20 Oct 2026 10:56:30 +0200
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3,
 muldi3, and ucmpdi2
Message-ID: <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>

Hi,

thank you all for the patches and suggestions!

On Mon, Oct 19, 2026 at 11:20:56PM +0200, Arnd Bergmann wrote:
> diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
> index f1ff4ce0f1a2..173588c31abf 100644
> --- a/arch/nios2/Makefile
> +++ b/arch/nios2/Makefile
> @@ -19,8 +19,6 @@ UTS_SYSNAME = Linux
>  
>  export MMU
>  
> -LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
> -
>  KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
>  
>  KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
> @@ -37,7 +35,7 @@ KBUILD_CFLAGS += -DUTS_SYSNAME=\"$(UTS_SYSNAME)\"
>  KBUILD_CFLAGS += -fno-builtin
>  KBUILD_CFLAGS += -G 0
>  
> -libs-y		+= arch/nios2/lib/ $(LIBGCC)
> +libs-y		+= arch/nios2/lib/
>  
>  INSTALL_PATH ?= /tftpboot
>  nios2-boot := arch/$(ARCH)/boot
> 
> 
> I expect you'll have to copy a few functions from the last gcc release
> into arch/nios2/lib/ to make this work, at least (a GPLv2 compatible
> version of) libgcc/config/nios2/lib2-divmod.c but maybe more.

So I did test this with allyesconfig plus minimal hardware support
configured in nios2:

CONFIG_NIOS2_ARCH_REVISION=1
# CONFIG_NIOS2_HW_MUL_SUPPORT is not set
# CONFIG_NIOS2_HW_MULX_SUPPORT is not set
# CONFIG_NIOS2_HW_DIV_SUPPORT is not set
# CONFIG_NIOS2_FPU_SUPPORT is not set
# CONFIG_NIOS2_CI_SWAB_SUPPORT is not set
CONFIG_NIOS2_CI_SWAB_NO=0

I used gcc-14.4.0 as the reference; this is what I required to get
allyesconfig to link (apart from some requied -Wno-...'s, but thats
another story), and along with the typedefs from lib2-nios2.h:

diff --git i/arch/nios2/lib/Makefile w/arch/nios2/lib/Makefile
index 9d5bf1df520c1..28d6a78533ba1 100644
--- i/arch/nios2/lib/Makefile
+++ w/arch/nios2/lib/Makefile
@@ -7,3 +7,6 @@ lib-y += delay.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
+lib-y += lib2-divmod.o
+lib-y += lib2-mul.o
+lib-y += lib2-divtable.o

This seems to be the minimal set of runtime dependencies.

In particular, modpost wants (across various modules):
- symbol '__divsi3'
- symbol '__modsi3'
- symbol '__mulsi3'
- symbol '__udivsi3'
- symbol '__umodsi3'

Interesting enough, divtable is not explicitly exported but implicitly
linked via libgcc all the time. It seems to be required e.g. by lz4_compress:

> lz4_compress.c:(.text+0xaec): undefined reference to `__divsi3_table'

This makes me wonder a bit about the how and why of eliminating libgcc:
I fully understand that we are playing catchup with gcc/libgcc here;
when gcc decides to emit calls to a new lib, we have to export that as
modules might use it; but where is the difference between pulling it
from libgcc or from the kernel runtime? Longterm stability against
'disappearing' symbols?

So, for NIOS2, the situation is quite simple, as gcc is not exactly a
moving target any more, but what is the situation with other
architectures?

On a more practical note, while technically feasible, I'm not sure
whether we can actually vendor/copy directly from libgcc; I think all
code there is GPLv3 with Runtime Exception. (I'm not a lawyer yadayada),
but I guess direct reuse in that way is problematic, given that the
kernel is GPLv2 only? So I guess we would need to do a reimplementation?

Best regards
Simon
