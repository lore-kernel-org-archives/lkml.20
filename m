Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC835A397
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320035; cv=none; b=saYFghksunReTLiwCvTQ1q/to7Cigqw1tdG1jWUNFGv0UKxM65M1NVABS1Q5bZKBogBYKOii1JiUWs3Bjan+Qxx8xRrr1FAKNwgAlF6/HEgims6ku6leUnWRdYOsYrRNhZzI4F21AMNOW7vi4wCxTnpQNLDkaqGknsbJYvQo1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320035; c=relaxed/simple;
	bh=vEKdETvCiIJXmAPikrApYzxDElX/8OCENfApSyIQtRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sgy2dPL+Yj51CANtpXYLr6QpDMs88LsiKLKCjgFMpfTGetF/7CmHRDB3ZBIZTTLbvRQauFiDaUJ4KOeRRa2IeG2pg08GUjKNwVzzfxyZuIitlvbZJd+/MLrEJERrL+CFNyftC3UTDtORKuJzhUkoxOkpA/eWovZ2Rn1kwsSmd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at8VLXUN; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at8VLXUN"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so299895eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790320030; x=1790924830; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaEAeO+KpKKY3qs5B15P5jzMNjkhf9IQUFD5AfYaJCM=;
        b=at8VLXUN5SwQeY9aasWJcRkMhKhez136MYXQe0ex9ojShdNuwyIAk+HpCKPKWmAYK5
         vGmRO4tQeIWhB7XV76iaZjsFB9II7evKYLx/0d/h9qlTdt8YbGD6mwH17LE2ToepCxaf
         +21Ea0T8TuMbkA8p8aEXmZg9fYcEcJiRqNFajIPh8bNsb+fajE1QP8grVxxVNGeSYamA
         wx1a85DN0fOXnhHoq+beuyuhs7OfYHacMaVa0Ks4RBhgXconE0jTJDhhrz25lSaknaL1
         8z3x2GGY6ivSHnnse9uC5h8AZk6VEJOz0WenWNAiJPa1k12YmE2aJWh61g0LKySfQiq4
         QY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790320030; x=1790924830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JaEAeO+KpKKY3qs5B15P5jzMNjkhf9IQUFD5AfYaJCM=;
        b=LNhDE/nep7m3kEnT+x44In12TW8U31wVdZU2KZLGbbQETfQA4WkQPBWM3Xrfg1WfoT
         QmrfPjXk51O/a+DJfjA25MyE5RVVdqkUJ6rKRu2VLTk9G2E1+1Xr8CyOqtNIz6A3K2/K
         05LLuX+B5eapjbwV+DROhFxxOKt7kncN5a7OKeu/afonEnGym9pYqUrTVTQbG6JZ09nm
         KawokApn2uLVmek2klY092+ZqbLhsjw4W/dDCcYNS7HqvbUIg6rxWEKkC1m+3KDqoWck
         WhWUZ4ClPTEfWyupOOkDptZ7yLYzwH0d8nku5m9UucJrATIUoVPL3Gd30MZxqes0QvCv
         Mf5A==
X-Forwarded-Encrypted: i=1; AKwUvBxf8PgLLmrOjssZODbvB0C2lqnnqC5UZzNq7fb7xebMLztzNdHOr9Tr9jSd2UcFHhLK252n0BvFX2Vw2X0=@vger.kernel.org
X-Gm-Message-State: AFuF++kAFoSC9MqTMgeM6pzN1+M3wignz9gyYyMVYDbC1/m1K9z85/iq
	ok+RCqkhLob65lgztLdQoRYUy3+pnmwFN5J30BGyeG1PMQa2du/mUWF1
X-Gm-Gg: AYBFou2kAoXJjw+gwXKRIEsqxaraesBA7MN3PjMiANY5NwsXnaGwaDWG8r5H08++PEg
	dtRQBlEasVwLD3+oDRvAn+vLMGbbHmXmG/2NaDCDnW3wNOD+jASi/jAy8mEc6AHTcyB/Ik0Lqpa
	Gt6dNfOlNA6fDby7VcESxSpXx8HN78yL75PqmrGf9M7yh6Iv1+HvnyI4bvHRbHAqE3rufonyTQM
	x86smyA5aqGcGpHZh4eFMJjaL1BnkULBslVoIDqV8XlUSlxs/1BcNR6SuBzM4nLH4BnPwigHUSi
	OPFxdY63D+Pxb6/g9o9DKanVzgvTKABdVOo0Nt2F4JAX11xwg2Ys2kQAsJF9ioCAPAjCf6bTBuy
	RI8wtrlEQVIy3+DCnnelWPVc6gszZzNW1zdELZy2rQ2fqevJyIOF0fJeLwJixQhJEeoprN0N5qu
	xwfFd82YFVKloGPKiICqr94mxRpcWXRK17Q54CqSEjQXoShxCPtkhqS/VDbbUiMZx1CjSlTqz29
	yImwTLEwfiXINBXTcTmPvx4iIDIXPgIXixq1t4LOScT
X-Received: by 2002:a05:693c:42d4:b0:33b:e47c:f384 with SMTP id 5a478bee46e88-34004f81e77mr3753409eec.18.1790320029935;
        Fri, 25 Sep 2026 00:07:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm4116769eec.8.2026.09.25.00.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:07:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:36:59 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <arYcMdA3Zn10Xbr1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054311.906816-1-mkchauras@gmail.com>
 <c91d9441-27ce-4fdd-b3c7-10b972f867af@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c91d9441-27ce-4fdd-b3c7-10b972f867af@kernel.org>

On Thu, Sep 24, 2026 at 02:55:55PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 22/09/2026 à 07:43, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> 
> I'm a bit puzzled by the macro name. The name ARCH_WARN_ASM suggests that it
> is used for warnings like WARN() and/or WARN_ON(). Which means it should
> include flags BUGFLAG_WARNING and BUGFLAG_TAINT(TAINT_WARN).
> 
ARCH_WARN_ASM is a raw asm template used by the Rust warn infrastructure
(rust/kernel/bug.rs). It does not bake in BUGFLAG_WARNING or
BUGFLAG_TAINT(TAINT_WARN) — the caller (warn_flags! macro) is responsible
for ORing those into 'flags' before expanding this macro. This matches
the x86 convention where _BUG_FLAGS_ASM is also flags-agnostic.

> Also I have the feeling that it only handles WARN().
> WARN_ON() seems to have been forgotten.
> 
I might be wrong here but WARN_ON uses an unconditional trap and
requires a register operand in C side. I am not sure if rust can do
that.
> Christophe
> 

Regards,
Mukesh


> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> >      |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      = note: while trying to match sequence start
> > 
> > error: no rules expected `ARCH_WARN_REACHABLE`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >      |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      = note: while trying to match sequence start
> > 
> > error: aborting due to 2 previous errors
> > ```
> > 
> > To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
> > The old definition was a bare macro with no parameters, relying on
> > positional asm operand references (%0-%3), hardcoding the backward
> > reference to local label 1b, and including .org/.previous directives
> > inline. That made it impossible to compose as a plain string outside of
> > an asm operand context, and left an invisible contract that callers must
> > always emit their trap at label 1:.
> > 
> > Refactor _EMIT_BUG_ENTRY to take explicit (bug_entry, trap, file, line, flags)
> > string arguments via string concatenation. This removes the dependency
> > on asm operand numbering and makes the labels an explicit argument,
> > so the caller's intent is visible at the call site and a future caller
> > using a different label cannot silently produce a wrong bug table entry.
> > 
> > Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> > each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
> > as an asm operand while ARCH_WARN_ASM can supply its own size string
> > independently.
> > 
> > Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> > convention, indicating that no additional reachability annotation is
> > needed after a WARN on powerpc.
> > 
> > Reported-by: FUJITA Tomonori <tomo@flapping.org>
> > Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
> > Fixes: 73b741adb264 ("rust: Add PowerPC support")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> > Changelog:
> > V5 -> V6:
> >   - Dropped KUit tests from this series. It will be sent separately.
> > V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
> > 
> > V4 -> V5:
> >   - Fixed a build error with DEBUG_BUGVERBOSE=n
> >   - Added a label for bug entry
> > V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/
> > 
> > V3 -> V4:
> >   - Fix Label with appending b at end
> >   - Add KUnit test patch
> >   - Tested on ppc64le pseries: pass:5 fail:0 skip:0
> >   - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
> >   - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
> > V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com
> > 
> > V2 -> V3:
> >   - Add label argument in _EMIT_BUG_ENTRY
> > V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com
> > 
> > V1 -> V2:
> >   - commit message now has error, fixes tag and closes tag
> > V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com
> > 
> >   arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
> >   1 file changed, 25 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..bf31ee1e902a 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >   #endif /* verbose */
> >   #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"				\
> > +	#bug_entry ":	.4byte " #trap " - .\n"			\
> > +	"		.4byte " file " - .\n"			\
> > +	"		.short " line ", " flags "\n"
> >   #else
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.short %2\n"			\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"				\
> > +	#bug_entry ":	.4byte " #trap " - .\n"			\
> > +	"		.short " flags "\n"
> >   #endif
> > -#define BUG_ENTRY(cond_str, insn, flags, ...)		\
> > -	__asm__ __volatile__(				\
> > -		"1:	" insn "\n"			\
> > -		_EMIT_BUG_ENTRY				\
> > +#define BUG_ENTRY(cond_str, insn, flags, ...)			\
> > +	__asm__ __volatile__(					\
> > +		"1:	" insn "\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, "%0", "%1", "%2")	\
> > +		".org 2b+%3\n"					\
> > +		".previous\n"					\
> >   		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> > -		  "i" (flags),				\
> > -		  "i" (sizeof(struct bug_entry)),	\
> > +		  "i" (flags),					\
> > +		  "i" (sizeof(struct bug_entry)),		\
> >   		  ##__VA_ARGS__)
> > +#define ARCH_WARN_ASM(file, line, flags, size)			\
> > +		"1:	twi 31, 0, 0\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
> > +		".org 2b+" size "\n"				\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >   /*
> >    * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >    * optimisations. However depending on the complexity of the condition
> 
