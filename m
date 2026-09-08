Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E371F16B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788912530; cv=none; b=IJer3f1IblrIgoB6E/B/oDrU8uZAyI39VrOtbTOC9lGU2C8JDbe6UkIwo823/bM1WRD0yyqO8HkbYyLHD6IE7hwlws2CU6DLlEjVGzE6a924q7J/SsF4+UMs/AHMd5Vyxp2d36pKUPYLgY91fKMMe+C72uINBqq2RR9oLM31m/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788912530; c=relaxed/simple;
	bh=IGLQ70FuUcbsP1QxZNIeWxXr/9yyQ4zbxphFg90tgO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCpHNm6iTBPRVPEmPbSVdsIJdGkvR/61netOTWuaC7VdR2gOLCzjY8yuGPxFHgacalX60qB9ujlFuibE+vMxi4wkeVEWiV9qS20gpfZ92LquXn1YjGmDHzVteYpDY5uikcIViqqWAsACsYTv6m7JOENwYxsYHZ9+PAKV4R42fdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTFrmH1y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTFrmH1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03981F00A3A;
	Wed,  9 Sep 2026 00:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912528;
	bh=7ksINdiT0UFx/hKh4F2kWOsK2yxMCMTbkrzCWX8HXes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTFrmH1ythZRn8310h2B+9Idlt6oNgWQ7p6cGIH1f/WK6SkCZdi8NtTjveyvFTyQ5
	 bddKJz6zma1DuA3/VfM8SmVsrY+Kwr4iEnxE6qqq+6HWxW6cuBXzDlDlninYttFtAv
	 5d13UagbwJERi+/SlRpQ4GyhTuV6IOiD0gc8UeV49IgbmgU5eMfqf/IaU2S0CIwEpV
	 8ZxuAF0ZyV4o6Ba+sG3L1xzka4McqFgiLi61L+dvjSVDBB8M5deHsSU7RR0a0aNy6W
	 XXIfnBM+I6J9EMEJv+s/ID7YwnKjLBndTYughxxcR7+oMocCl/7+k9GC3p3JkxMYoX
	 MFcQqCcWe2yOQ==
Date: Wed, 9 Sep 2026 07:48:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 4/5] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 under
 NONPORTABLE
Message-ID: <aqCe6T8QKtJcLHiM@xhacker>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-5-jszhang@kernel.org>
 <20260907-backless-theatrics-f19e489bc63f@spud>
 <ap-FtoTqMCnNACJN@xhacker>
 <20260908-deflector-degree-ceca18036811@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-deflector-degree-ceca18036811@spud>

On Tue, Sep 08, 2026 at 02:07:27PM +0100, Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 11:49:10AM +0800, Jisheng Zhang wrote:
> > On Mon, Sep 07, 2026 at 05:21:11PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 07, 2026 at 11:14:36PM +0800, Jisheng Zhang wrote:
> > > > In last commit, we have optimized the pgtable_l4|l5_enabled with isa
> > > > extension alternative mechanism, thus a typical access_ok(addr, 1);
> > > > is compiled as:
> > > > 
> > > > ffffffff8001dd30:	1141                	addi	sp,sp,-16
> > > > ffffffff8001dd32:	e022                	sd	s0,0(sp)
> > > > ffffffff8001dd34:	e406                	sd	ra,8(sp)
> > > > ffffffff8001dd36:	0800                	addi	s0,sp,16
> > > > ffffffff8001dd38:	00000013          	nop
> > > > ffffffff8001dd3c:	02a0006f          	j	ffffffff8001dd66 <foo+0x3e>
> > > > ffffffff8001dd40:	60a2                	ld	ra,8(sp)
> > > > ffffffff8001dd42:	6402                	ld	s0,0(sp)
> > > > ffffffff8001dd44:	57fd                	li	a5,-1
> > > > ffffffff8001dd46:	83a1                	srli	a5,a5,0x8
> > > > ffffffff8001dd48:	00a7b533          	sltu	a0,a5,a0
> > > > ffffffff8001dd4c:	00154513          	xori	a0,a0,1
> > > > ffffffff8001dd50:	0141                	addi	sp,sp,16
> > > > ffffffff8001dd52:	8082                	ret
> > > > ...
> > > > ffffffff8001dd64:	bfe1                	j	ffffffff8001dd3c <foo+0x14>
> > > > ffffffff8001dd66:	0180006f          	j	ffffffff8001dd7e <foo+0x56>
> > > > ffffffff8001dd6a:	60a2                	ld	ra,8(sp)
> > > > ffffffff8001dd6c:	6402                	ld	s0,0(sp)
> > > > ffffffff8001dd6e:	57fd                	li	a5,-1
> > > > ffffffff8001dd70:	83c5                	srli	a5,a5,0x11
> > > > ffffffff8001dd72:	00a7b533          	sltu	a0,a5,a0
> > > > ffffffff8001dd76:	00154513          	xori	a0,a0,1
> > > > ffffffff8001dd7a:	0141                	addi	sp,sp,16
> > > > ffffffff8001dd7c:	8082                	ret
> > > > ffffffff8001dd7e:	60a2                	ld	ra,8(sp)
> > > > ffffffff8001dd80:	6402                	ld	s0,0(sp)
> > > > ffffffff8001dd82:	57fd                	li	a5,-1
> > > > ffffffff8001dd84:	83e9                	srli	a5,a5,0x1a
> > > > ffffffff8001dd86:	00a7b533          	sltu	a0,a5,a0
> > > > ffffffff8001dd8a:	00154513          	xori	a0,a0,1
> > > > ffffffff8001dd8e:	0141                	addi	sp,sp,16
> > > > ffffffff8001dd90:	8082                	ret
> > > > 
> > > > As can be seen, different branches for SV39/SV48/SV57 are still there,
> > > > since access_ok() sits at hot code path, why not reduce the code size
> > > > to optimize to make the instruction cache happy?
> > > > 
> > > > Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so that
> > > > the embedded platforms can choose the best option themselves, while
> > > > still keep the feature of unified one kernel Image for all SV39, SV48
> > > > and SV57.
> > > > 
> > > > Before the patch, vmlinux built with pure RISCV64 defconfig
> > > >    text    data     bss     dec     hex filename
> > > > 13439437   6790446  483221 20713104 13c0e90 /tmp/old/vmlinux
> > > > 
> > > > After the patch, vmlinux built with pure RISCV64 defconfig:
> > > >    text    data     bss     dec     hex filename
> > > > 13314445   6787934  466837 20569216 139dc80 /tmp/new/vmlinux
> > > > 
> > > > .text section is reduced by 122KB!
> > > > 
> > > > And after the patch, typical access_ok(addr, 1) is compiled as:
> > > > ffffffff8001809a:	1141                	addi	sp,sp,-16
> > > > ffffffff8001809c:	e022                	sd	s0,0(sp)
> > > > ffffffff8001809e:	e406                	sd	ra,8(sp)
> > > > ffffffff800180a0:	0800                	addi	s0,sp,16
> > > > ffffffff800180a2:	00000013          	nop
> > > > ffffffff800180a6:	60a2                	ld	ra,8(sp)
> > > > ffffffff800180a8:	6402                	ld	s0,0(sp)
> > > > ffffffff800180aa:	4785                	li	a5,1
> > > > ffffffff800180ac:	179a                	slli	a5,a5,0x26
> > > > ffffffff800180ae:	00f53533          	sltu	a0,a0,a5
> > > > ffffffff800180b2:	0141                	addi	sp,sp,16
> > > > ffffffff800180b4:	8082                	ret
> > > > 
> > > > only 12 instruction!! For refernece, before the patch, the access(addr,
> > > > 1) needs 32 instructions.
> > > > 
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  arch/riscv/Kconfig                  | 24 ++++++++++++++++++++++++
> > > >  arch/riscv/include/asm/pgtable-64.h | 12 ++++++++++++
> > > >  arch/riscv/mm/init.c                | 10 ++++++++++
> > > >  3 files changed, 46 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index e9476b8cbeb0..4cdb1e3f34be 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -602,6 +602,30 @@ config RISCV_ISA_SSQOSID
> > > >  	  cache partitioning scheme and use the MCID to track how much
> > > >  	  cache a process, or a group of processes, is using.
> > > >  
> > > > +config RISCV_ISA_SV48
> > > > +	bool "Page-Based 48-bit Virtual-Memory System"
> > > > +	depends on 64BIT && NONPORTABLE
> > > > +	default y
> > > 
> > > I don't understand how you've got this set up here.
> > > If this is genuinely non-portable, then you should not set the default to
> > > enabled. However, I'm not really sure that this is actually non-portable
> > > at all....
> > > 
> > > > +	help
> > > > +	  Add support for the Page-Based 48-bit Virtual-Memory System.
> > > > +
> > > > +	  Enable this option for systems for which a 39-bit virtual address
> > > > +	  space is insufficient. But if 39-bit is enough, disabling this
> > > > +	  option will result in smaller kernel size and slighly better
> > > > +	  performance.
> > > > +
> > > > +config RISCV_ISA_SV57
> > > > +	bool "Page-Based 57-bit Virtual-Memory System"
> > > > +	depends on 64BIT && NONPORTABLE
> > > > +	default y
> > > > +	help
> > > > +	  Add support for the Page-Based 57-bit Virtual-Memory System.
> > > > +
> > > > +	  Enable this option for systems for which a 48-bit virtual address
> > > > +	  space is insufficient. But if 48-bit is enough, disabling this
> > > > +	  option will result in smaller kernel size and slighly better
> > > > +	  performance.
> > > > +
> > > >  config RISCV_ISA_SVPBMT
> > > >  	bool "Svpbmt extension support for supervisor mode page-based memory types"
> > > >  	depends on 64BIT && MMU
> > > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > > > index 7e30ec0e9f6c..f2d29da93eea 100644
> > > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > > @@ -16,21 +16,33 @@ extern bool _pgtable_l5_enabled;
> > > >  #ifdef USE_EARLY_PGTABLE_LEVELS
> > > >  static __always_inline bool pgtable_l5_enabled(void)
> > > >  {
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57))
> > > > +		return false;
> > > > +
> > > >  	return _pgtable_l5_enabled;
> > > >  }
> > > >  
> > > >  static __always_inline bool pgtable_l4_enabled(void)
> > > >  {
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48))
> > > > +		return false;
> > > > +
> > > >  	return _pgtable_l4_enabled;
> > > >  }
> > > >  #else
> > > >  static __always_inline bool pgtable_l4_enabled(void)
> > > >  {
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48))
> > > > +		return false;
> > > > +
> > > >  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
> > > >  }
> > > >  
> > > >  static __always_inline bool pgtable_l5_enabled(void)
> > > >  {
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57))
> > > > +		return false;
> > > > +
> > > >  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
> > > >  }
> > > >  #endif
> > > 
> > > ...because the code here won't enable sv57 etc if not supported...
> > > 
> > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > index 2a2402d79bc4..90bb85c5f167 100644
> > > > --- a/arch/riscv/mm/init.c
> > > > +++ b/arch/riscv/mm/init.c
> > > > @@ -844,6 +844,16 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> > > >  
> > > >  	kernel_map.page_offset = PAGE_OFFSET_L5;
> > > >  
> > > > +	/* Fall back to Sv48 if Sv57 is unsupported on non-portable systems */
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57) &&
> > > > +			satp_mode_limit == 0)
> > > > +		satp_mode_limit = SATP_MODE_48;
> > > 
> > > ...and neither does the code here.
> > > 
> > > > Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so that
> > > > the embedded platforms can choose the best option themselves, while
> > > > still keep the feature of unified one kernel Image for all SV39, SV48
> > > > and SV57.
> > > 
> > > NONPORTABLE is what you're meant to depend on when the kernel that gets
> > > built cannot run on platforms without the feature.
> > 
> > The reason I put these two Kconfig options under NONPORTABLE is: all
> > distributions won't enable NONPORTABLE for their defconfig, and I guess
> > the distributions want to kept unified one kernel Image for all SV39,
> > SV48 and SV57.
> > 
> > I have no preference whether move them out of NONPORTABLE or not.
> 
> Oh right I think I made a mistake in my understanding of what's going on
> here.
> 
> If you turn on NONPORTABLE (but not these new options) then you only get
> sv39 support. I think what you should do to make the behaviour of these
> options clearer is invert them.

hmm, other ISA ext Kconfig options are not inverted, so I prefer moving
SV48|57 out of NONPORTABLE and make them y by default.

> 
> e.g. something like RISCV_ISA_NO_SV57 and RISCV_ISA_NO_SV48. These would
> then depend on NONPORTABLE and be default n.
> 
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -16,21 +16,33 @@ extern bool _pgtable_l5_enabled;
>  #ifdef USE_EARLY_PGTABLE_LEVELS
>  static __always_inline bool pgtable_l5_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_NO_SV57))
> +		return false;
> +
>  	return _pgtable_l5_enabled;
>  }
>  
>  static __always_inline bool pgtable_l4_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_SV48))
> +		return false;
> +
>  	return _pgtable_l4_enabled;
>  }
>  #else
>  static __always_inline bool pgtable_l4_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_NO_SV48))
> +		return false;
> +
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
>  }
>  
>  static __always_inline bool pgtable_l5_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_NO_SV57))
> +		return false;
> +
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
>  }
>  #endif
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2a2402d79bc4..90bb85c5f167 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -844,6 +844,16 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>  
>  	kernel_map.page_offset = PAGE_OFFSET_L5;
>  
> +	/* Fall back to Sv48 if Sv57 is unsupported on non-portable systems */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_NO_SV57) &&
> +			satp_mode_limit == 0)
> +		satp_mode_limit = SATP_MODE_48;
> +
> +	/* Fall back to Sv39 if Sv48 is unsupported on non-portable systems */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_NO_SV48) &&
> +			satp_mode_limit == SATP_MODE_48)
> +		satp_mode_limit = SATP_MODE_39;
> 
> 
> I think that code's behaviour is a bit easier to understand and the
> options become more obvious in terms of what they do.
> 
> Cheers,
> Conor.
> 
> > > 
> > > > +
> > > > +	/* Fall back to Sv39 if Sv48 is unsupported on non-portable systems */
> > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48) &&
> > > > +			satp_mode_limit == SATP_MODE_48)
> > > > +		satp_mode_limit = SATP_MODE_39;
> > > > +
> > > >  	if (satp_mode_limit == SATP_MODE_48) {
> > > >  		disable_pgtable_l5();
> > > >  	} else if (satp_mode_limit == SATP_MODE_39) {
> > > > -- 
> > > > 2.53.0
> > > > 
> > 
> > 


