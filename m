Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481887;
	b=GnRpsv1fud2s9RgKjHeFoaz/LHog8dy/cLZ7tylyNhggLEAX1vdzPkoaDLpk3p3bK//J
	 l7H6h1rUt+/5S45p8rbkZP+aTjSdkNqkxUWXu/UyUpEZpSmWbfF2jGAb6xzA3+gUQXqGx
	 O8XFBIYQHaKWa19ej9kKqvBZy7FtM+UXkPiUn3Drol4hbcJfLn5XNB3JWQjb8Ws8Y0RnS
	 WFWfl+KntnDe3qJUit0tuuSz+p2cPGda+hQPw3EgG6Dd9htwxT7RAQj5W7qjZnjEWxQ5Z
	 Bomq2d5wIK8A6WOW0PJ2A0+RGiStW6kfGXXuyCdA2ah8ktsOG57vE2zwu9ykUES2/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481887;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=Aqy0ktg0S32r2+rlL8BjT5H9JlsDn3oPpE26yf+yLEk=;
	b=ZCws6YYlrnRJH8v12pz3CQ02qxdIh3UrnkDmfQNS+F5k0NSdcsNNsgHpAIKMYZs4olwz
	 rK6WAOzi35FT0EMfYuWEWLzsl1Nh3IuwCgJ6fLa4CaLOWbf4l8ubPxMZnBdVZ3NSvNyji
	 SxkDqpo+P38W49OD9doSh81tjahzNwoWmRM8Y63kRxBEiPVOQN0kjmWvNybFUyExyArkl
	 yx/Um7NQaXggNjcr1iXRkx9R2ywuM3w8UuDOfmpU1jiauj55Fq1FKJ1OExobOwYHcve4p
	 Aamvr0/ryoq7K1eHDFjTfZyM9IUior3R3apxl7rFPkxrtS9dfvd7FDpcY1TEA/fDW0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctpYJVZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFED606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctpYJVZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96E71F00A06;
	Thu, 12 Nov 2026 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481887;
	bh=Aqy0ktg0S32r2+rlL8BjT5H9JlsDn3oPpE26yf+yLEk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ctpYJVZoyRCWKA99ohKAamOpDEUxpuegeNzaPJet+QKmbPlVw1yLR6HGipGXOhDzH
	 KaEVLrjjbsUjGWug0l/E6lpxExkREM6oLeuuhKtLDrDiMdjtoOe8H/IAOzurc+jRER
	 t6LKV7AAJAhPUChNkpjDgkwvO7sNbOm9GAv3wOHW8wk2uO6J3NZ0awiaH41jSTp6EY
	 ws7968oocrGbolbnl3xgfecgPBDiQe7e5qnqSi976sHvaVuct1QXASieaUGX+AroCf
	 Z2QD+qWQ9+ManzS2lIybe4IdaIDhr6m7bEbEvF3I6yFCGy+nEHNsG16+rhrRqpVlDr
	 QQt4NsbWS0FWA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D486D198003A;
	Thu, 12 Nov 2026 06:11:24 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 06:11:24 -0500
X-ME-Sender: <xms:2p71apQNe8JJPOtD4H7Niz-o1uVe1vfuSoJ8AXxZZE_kqnnQRfmhFQ>
    <xme:2p71atmTlhSYerM7yqlDK7lxismHfESHUPM7qQrCD2hzMLwE2n53uPjmtPMb4ohN-
    fZ_c0zPV8HaY_4pftxJlHyWpKWLsvfUDN3aNTcnnZxPlYOT6H3IVgFW>
X-ME-Proxy-Cause: dmFkZTF8YiWM11fVZvfPDHngLgsr2+d5Dut4msZ9OV0ha3Ra8ULElT+ySoDK5Zwun8vnYm
    OSzfXeI9HYNR4ZOwUCYno5ZP9sN71qXikGQ5YEVG52QH8nAxbBVoX1JQ8Nc/PgRDTw0/YB
    WB+9onjREBVQQJoTyOnxXyD5shF5M2TqFJfUiQyvp51jKI5EXhEmPCdoR36MxBZMFPGr2A
    WVZbiiwm/KDpJf6mF/chMOGViCeqcBml7ZRJBcj+boJc3tRV/WplAKZu6QlxyljY0XZxnC
    8NSSy+QYa4zc3GVepZm7+aA5Yz1RDNxKHoS9oJyuQf5pmkQHhFAacyaILBtX1U50kxDqN+
    l6wh3doJ5MoQzejRHACs/i8Z+fd4nix3f5w7FRz+zbws2kVjwknc8oWC2lvNvKihatzdaW
    /+e+wGzpicOBofUANVBevJIzHrLjlalR/wJeU/IZR2f6Qd9olKo+Jfa1MDMQ5/M8BAkeLJ
    +eNUZn+lPzhph+SAN5gk51UyvsTDFUQzX/IhYpyev5suacNs9XpbwUFwOvrG6Q5lRJ3Ke3
    8+3lRoxxj1qhnU09ZGkOLGkDd6/KpjiYYYt3Xfh3L7oVeO31Fzzjx7Daf0gN68eoW6JSGh
    S1FHxhij0QUSMQ5Dnq7g2NjbsLlkF+fy2FUbMq8oZUuG8H2Vb16lFzOAiXPQ
X-ME-Proxy: <xmx:3J71amj3-3cBMLmxtQysCPfac3a9kivplj0lmJ8AIN88HdR4Eb03fg>
    <xmx:3J71and9EcxFDSjPybrmmBqRiNT0NG2QujbxcOAOKn_CnwSIs848Ig>
    <xmx:3J71auxR5j5R7Hfu6sMgNNSbj4GEsikbEmH-BZn4eVfwMriz7B8BGA>
    <xmx:3J71am3QBluBYuL5PoPaMfNAsao7ZNSKdw5xX_pdPgzjwRDRodF_Vw>
    <xmx:3J71akzlSv_woTdvQCOMZgNJNlfC2ptMXhbULoDul5j4BxG_gFYo5JxY>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DD1FAF80098; Thu, 12 Nov 2026 06:11:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 12:11:02 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Mark Brown" <broonie@kernel.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Message-Id: <536669c0-1e59-4d9c-9601-2691689da8bf@app.fastmail.com>
In-Reply-To: <autdMwEbDqF2u0Wr@arm.com>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com> <autdMwEbDqF2u0Wr@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section calls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 4 Nov 2026, at 17:28, Catalin Marinas wrote:
> On Mon, Oct 05, 2026 at 01:05:13PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The compiler is permitted to omit BTI landing pads from static functions
>> that never have their address taken, but are only called directly, even
>> if those calls originate from other code sections.
>> 
>> This means that calls into a module's .text section from .init.text,
>> which may need to be routed via a PLT if .text is out of direct
>> branching range, may result in BTI exceptions due to the indirect calls
>> performed by the PLT veneers. (Note that calls to .init.text from .text
>> are not allowed.)
>> 
>> The 'solution' is to emit yet another veneer - this is what the ELF
>> psABI for AArch64 mandates in this case.
>> 
>> So derive an upper bound for the number of veneers that may be needed in
>> the core module region to ensure that any call from init code that ends
>> up needing a PLT can be directed at a veneer with a BTI landing pad, and
>> allocate the additional space.
>> 
>> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
>> for a call from an init code section to a normal code section in the
>> same module. In practice, this only occurs when a module's .init.text
>> happens to be allocated far away from its .text section, which might
>> happen when the initial 128M 'near' module region runs out of space
>> between allocating the core module and allocating its init region.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/Kconfig                  |   7 +-
>>  arch/arm64/include/asm/module.h     |  12 ++
>>  arch/arm64/include/asm/module.lds.h |   3 +
>>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>>  4 files changed, 140 insertions(+), 10 deletions(-)
>> 
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index cab741a695f5..23879cb05d6b 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -210,7 +210,8 @@ config ARM64
>>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>>  	select HAVE_IOREMAP_PROT
>>  	select HAVE_IRQ_TIME_ACCOUNTING
>> -	select HAVE_LIVEPATCH
>> +	# https://lore.kernel.org/all/20260812162058.612202-5-ardb@kernel.org/
>> +	select HAVE_LIVEPATCH if !ARM64_BTI_KERNEL
>>  	select HAVE_MOD_ARCH_SPECIFIC
>>  	select HAVE_NMI
>>  	select HAVE_PERF_EVENTS
>> @@ -2198,10 +2199,6 @@ config ARM64_BTI_KERNEL
>>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
>> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
>> -	depends on !CC_IS_GCC
>> -	# https://github.com/llvm/llvm-project/issues/215547
>> -	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
>>  	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>>  	help
>>  	  Build the kernel with Branch Target Identification annotations
>
> I think this should be the other way around (and keep HAVE_LIVEPATCH
> unconditional):
>
> config ARM64_BTI_KERNEL
> 	...
> 	depends on !LIVEPATCH || (CC_IS_CLANG && CLANG_VERSION < 210000)
>

OK

> I also wonder whether dropping the compiler dependency should come with
> some sanity check/assert for (the unlikely case) of a large vmlinux,
> similar to one of Josh's patches or a boot-time check that skips
> enabling BTI. At least until we get some generic compiler/linker
> workaround for large images:
>
> https://lore.kernel.org/all/8932e59a4f6e8383f37078dada1f23639b85a035.1786768375.git.jpoimboe@kernel.org/
>

According to that patch, binutils 2.42 and LLVM 20 are ok, so we'd need
some version checks in Kconfig. We'd simply keep it disabled for older
toolchains, as it is today.

> There are some Sashiko comments. I'd ignore the big-endian ones since we
> removed it and it had been marked broken for some time anyway. But the
> other points look valid.
>
> https://sashiko.dev/#/patchset/20261005110511.157016-4-ardb+git@google.com
>

I'll take those into account if I end up respinning this (see below)

> Apart from those, I don't have other technical objections to the patch
> but I wonder whether we'll find alternative options going forward that
> make this fix redundant. E.g. allocating .init.text and .text together
> (you had an RFC) or a new execmem_alloc_near() to try to place them
> nearby.
>
> In the meantime, would something like the following work for us instead
> of the veneers? We won't free the .init.text module section but this
> should be small. There's the ppc64 precedent.
>
> bool module_init_section(const char *name)
> {
> 	if (system_supports_bti_kernel() && strstarts(name, ".init.text"))
> 		return false;
>
> 	return strstarts(name, ".init");
> }
>

I've done an experiment to simply combine these unconditionally, and the
impact on module .text footprint on a typical config is negligible (~10k
per 100 loaded modules). That would make this change unnecessary, and would
allow the init PLTs and init ftrace trampoline to be dropped as well.

We can always follow up with an execmem_alloc() fix but maybe this is
not even worth the trouble.


