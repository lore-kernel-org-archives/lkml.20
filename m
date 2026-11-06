Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979808;
	b=A4zE9K3V+J12epCnFXzjnWp13X5B7yOZAtyQ8ob1IGl/UXT3Ky6R2wL3a7dnE7wZVmZc
	 /5fUl+ZQogicPpUE2kOo6XyiItmbrKhfPKD7kws0gXI5x71qLfC4w+YbUvsM5ROqImy3t
	 u9TbiFCGWJzur4+i1sjjz1fqfNmcLOPM9AHk764VAxYqlzhtKILTA+Z11+daQQoqHjwe5
	 GjoX1QHdsKh0ReJeh+2Qqfa7G8Wq1+FWwD5pkBZYsvSK5GpdPKpGYm5nRT0bXmjve3udr
	 dAkhzPVfs/adn2OqW/Grneifsn2D5Tmv9Kq+YASflyVAKY9U3etALKxD8+mRhi6bBjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979808;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jPRtGsIMr+vS8k8SFEAZBCQ/fTK7nGN3sKe7Ag8BEKA=;
	b=QE5ozW0ul+0sTFJSHecxtc/ldogPobFKamG8wHJ3gl7d2fhT4j9U1zqw8fIdJcKsQ7cu
	 htvf7FtJX2WZG3LzKYVawOotLyuMrmT+mSKH1bxdT3fdtcuIgb5HfnHeXnYYLoGIq7tJm
	 ZzC65MFbhnY/wprWnHarFsz61MqK5hQnZd6xaMl+3Eg258I10bgsLqdde55QyVvGfp1QZ
	 mDb9T399nvHlEOQY3SSooEMe3QqR43p028Ivj8AltxzTpCM7aWBrPcG2JZ+k9dLni/rjh
	 +7q06z9dzKFrYtfSTNEPyvvAQ1ChqQB/qWPMt4Jzy/EdgficO8iQlTcW/mdgV0u31lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0304606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0304606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5B316200BBA; Fri,  6 Nov 2026 23:43:25 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7ACEF200BAB;
	Fri,  6 Nov 2026 23:43:21 +0800 (AWST)
Message-ID: <f0781521-3436-4651-82f0-f9fdfbe864de@davidgow.net>
Date: Fri, 6 Nov 2026 23:43:17 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
To: Arnd Bergmann <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner
 <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
References: <20261105163440.2381661-1-arnd@kernel.org>
 <20261105163440.2381661-4-arnd@kernel.org>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261105163440.2381661-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/11/2026 à 00:34, Arnd Bergmann a écrit :
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All supported CPUs now provide the cmpxchg8b instruction, so remove
> all compile-time and runtime checks for its presence and the fallback
> implementation, to assume it just works.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Hi Arnd,

As-is, this breaks 32-bit UML, as atomic64_cx8_32.S is removed from the 
Makefile. With that reinstated, 32-bit UML at least builds and passes 
some basic KUnit tests here (though I haven't tried it on actual 586+ 
class hardware yet, and building with CONFIG_M586TSC still fails the 
checksum tests[1]).

Reproduces with:
make O=.tmpuml ARCH=um SUBARCH=i386
or
./tools/testing/kunit/kunit.py run --arch um --kconfig_add CONFIG_64BIT=n

>   arch/um/include/asm/asm-prototypes.h  |   4 
>   arch/x86/Kconfig.cpu                  |   3 -
>   arch/x86/Kconfig.cpufeatures          |   6 +-
>   arch/x86/include/asm/asm-prototypes.h |   4 -
>   arch/x86/include/asm/atomic64_32.h    |  15 --
>   arch/x86/include/asm/cmpxchg_32.h     |  76 +---------
>   arch/x86/include/asm/percpu.h         |  14 +-
>   arch/x86/lib/Makefile                 |   4 -
>   arch/x86/lib/atomic64_386_32.S        | 195 --------------------------
>   arch/x86/lib/cmpxchg8b_emu.S          |  97 -------------
>   arch/x86/um/Kconfig                   |   2 +-
>   arch/x86/um/Makefile                  |   3 +-
>   lib/atomic64_test.c                   |   7 +-
>   13 files changed, 13 insertions(+), 417 deletions(-)
>   delete mode 100644 arch/x86/lib/atomic64_386_32.S
>   delete mode 100644 arch/x86/lib/cmpxchg8b_emu.S
> 

...snip...

> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index 44b12e45f9a0..5b78440a78b9 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -13,7 +13,7 @@ config UML_X86
>   	select ARCH_USE_QUEUED_SPINLOCKS
>   	select DCACHE_WORD_ACCESS
>   	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> -	select UML_SUBARCH_SUPPORTS_SMP if X86_CX8
> +	select UML_SUBARCH_SUPPORTS_SMP
>   
>   config 64BIT
>   	bool "64-bit kernel" if "$(SUBARCH)" = "x86"
> diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
> index 100b68f601f9..716da7b1e3e9 100644
> --- a/arch/x86/um/Makefile
> +++ b/arch/x86/um/Makefile
> @@ -19,8 +19,7 @@ ifeq ($(CONFIG_X86_32),y)
>   
>   obj-y += syscalls_32.o
>   
> -subarch-y = ../lib/string_32.o ../lib/atomic64_32.o ../lib/atomic64_cx8_32.o
> -subarch-y += ../lib/cmpxchg8b_emu.o ../lib/atomic64_386_32.o
> +subarch-y = ../lib/string_32.o ../lib/atomic64_32.o

Reinstate ../lib/atomic64_cx8_32.o here!

>   subarch-y += ../lib/checksum_32.o
>   subarch-y += ../kernel/sys_ia32.o
>   
> diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
> index d726068358c7..37af41df3e6a 100644
Cheers,
-- David

[1]: 
https://lore.kernel.org/all/20240720063937.2311958-2-davidgow@google.com/
