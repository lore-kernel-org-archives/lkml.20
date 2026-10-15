Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9C183CC3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046121; cv=none; b=NzejuuPNZYYKI9iOHDbdN97yfjUj7Y+mj/pUfuueqADDWgdUrAnqUy7hZSFIQFhA5z3MMwcjACReF1+Ch8IWkdEVWZU/oi4TWrsTMwJ0vIomzplSmFe1KVN7q197FIbcFnM9DqORgCAwC5Y2YiQnZS9DePcV7eaj3rHhDuDPyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046121; c=relaxed/simple;
	bh=5gGuecIY+TLFfIeYkg3QtFYvZvWee+P39tBBX5ycQ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkCunntrsVgvjXr53s0dVq2GQgvbjzvRwCtJFDa4GCGsEtsHKSF1ug52t2dO5Qwz+MMUJDeuejEeOn6J88leffQRnodwz+XAj2XqHeVzprWdOFoZL7WekbGyNYBf1yP9WtCJEV2gS1nuN2oeQasMJim921JyDKLE19JndBPmxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/mFodfp; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/mFodfp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso841799a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046119; x=1792650919; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vx7M7s3SuZxFkSx1BxbOLI08ri7SD/5H0oyHxOOrQc0=;
        b=l/mFodfpUEMG49Kf+Ky6UXNb+/3BmM6VOVJ5+grmzHNCtS/fu6BF49xSeYBQgQ00Mv
         kO5/9xVhuuyrT43GNqeh6xfrF/Ddoldoqw+To3rY52VTcSLm5mhNy99T8vFFsZCPndQw
         +9se9cJlC7t+C7oimCwaOkckdhtDg9nLVckyVSxMjQi5KCgjmXJymKn0XFw3a5nbLwhY
         OEK1r/ZiSp/vjZXGHLMNy20I8EhHSSZDc/mCavnf2+p3yKsF3DXVQDN5vS5ORUo8TX9q
         7admvfpSUBBG1IuhTLRcMN2QT5xQQ7irOcYV6wgJl4MVstoEDxnxZAgVo8TOkrQOQkjE
         1roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046119; x=1792650919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vx7M7s3SuZxFkSx1BxbOLI08ri7SD/5H0oyHxOOrQc0=;
        b=2aT8DCv3T91AkSiW9fEzGscgaRpsUXORMt/7QIU9MU17ElGLv83v/34Ux0DzbOPSpS
         JJl3D9cFaQUfDftkyIRjiELXMdYHs9sUxhenflytMP9/K8hDEw8u8b/7CuxgcENZj0iI
         TbBek05pV2gW78Q2RAkbOFX7Qj+EQo26Nr+4KmJN6NrRq8AneJanG6qnx8nIcjI/GHso
         6WoT4+CT4bT7mpCtk4vK7Bq6rIEvSahFONT8bUYUlRweXivDMrfFGIBP2V7B2qWaXg/J
         7AWQAnU7AyQ3C7kgsETLuELaS0R806D0DfO5h2eLfETj0AWhAXd/E+4iBWe3z6+pzxRs
         CL0A==
X-Forwarded-Encrypted: i=1; AKwUvBz3ekwmvJP9G81auRj3IGLLVtWdr11S+lOS6ZMQOZnARHrQ6uORaUfpf3v+l6S9lI0y4bX8OZ2ypjFoiHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0owBJFbBarQE1wLUh0vpzSLEmn1iM2OjdAmVsgorzIFKcM9PH
	6pieeYMUDLRVTniUZYCikP3f1iwrSOh3qyULP2n/eaySg496LAYQk8sO
X-Gm-Gg: AYBFou0nGPKd5KWquPEOoIHOLhgSsIc0aB1VLI0F6uUvQtCEBZETgkxCsGgBsSisWA9
	W5tTuhyD68ktrUEhplDo1VLy+AxeGmHkprdfxwrEFRZ/yb9WvdgPiRA6WHX26CIApASQfYQGpA9
	Kkzg6U3Fqr9kKsCQPt0QpsivvuNjrGPftlVoJIXUI5UcjGNXRw6FcrsaY7Vn9uBY1AuiHteS39P
	LBH+o0M3KTa+g6lMpkV4OG29nJlTdRB4el4hNZGuzzhPhQ8rfWhQRr/sZ6eEHn79mGmEG+KjoRO
	wItfNhzjZE7BGx2pbN1KZp/Vhc/cFGyhM18Vaw5R0AnuJ0Z0u3OFLmVryyRmNYiC5Ivwto1Pupa
	m7tHjH/477mjvO5pQjugSbAju/kYjL954ZZylMIxi0sZzvhytcT4VBhFKFHcHWwnnGoFjWI1tj9
	6GSHOjKqk0MviRuvDDFHLekm/DVwlVcoBHm5TCwJgQNQKTnBFbpdMIgKGw7IPCIakReiA7m1Gsc
	L4VtyYBNifARyYeDbxlkgWFD+lbxqdbasnr49vmg4k=
X-Received: by 2002:a17:90b:384a:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3ab3a90a112mr13973663a91.22.1792046118994;
        Wed, 14 Oct 2026 23:35:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm2856756a91.2.2026.10.14.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:35:18 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:05:07 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <atBzxk9JFdXKYHfN@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054311.906816-1-mkchauras@gmail.com>
 <as08wgiYOGOx5Jzo@desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as08wgiYOGOx5Jzo@desktop>

On Mon, Oct 12, 2026 at 10:02:10PM +0200, Link Mauve wrote:
> Hi,
> 
> With 7.3 close to release, and this patch still not merged, the kernel
> will still fail to build with CONFIG_RUST=y on PowerPC.
> 
> Should the Rust support for this architecture get disabled as an
> emergency measure before 7.3?  Should this patch get in instead?  Should
> we ignore the issue as not many people will use this architecture
> anyway?  Is there another solution I’m not seeing?
> 
> Sorry I haven’t made it known sooner, I was busy with things.
> 
> As an aside, this patch does fix building Rust drivers for a Wii, so it
> gets my:
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> 
Hey Link,

This is in line for 7.4.

Regards,
Mukesh
> On Tue, Sep 22, 2026 at 11:13:11AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> >     |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
> > 
> > error: no rules expected `ARCH_WARN_REACHABLE`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >     |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
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
> >  - Dropped KUit tests from this series. It will be sent separately.
> > V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
> > 
> > V4 -> V5:
> >  - Fixed a build error with DEBUG_BUGVERBOSE=n
> >  - Added a label for bug entry
> > V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/
> > 
> > V3 -> V4:
> >  - Fix Label with appending b at end
> >  - Add KUnit test patch
> >  - Tested on ppc64le pseries: pass:5 fail:0 skip:0
> >  - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
> >  - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
> > V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com
> > 
> > V2 -> V3:
> >  - Add label argument in _EMIT_BUG_ENTRY
> > V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com
> > 
> > V1 -> V2:
> >  - commit message now has error, fixes tag and closes tag
> > V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com
> > 
> >  arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
> >  1 file changed, 25 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..bf31ee1e902a 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >  #endif /* verbose */
> >  
> >  #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >  #ifdef CONFIG_DEBUG_BUGVERBOSE
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
> >  #else
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
> >  #endif
> >  
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
> >  		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> > -		  "i" (flags),				\
> > -		  "i" (sizeof(struct bug_entry)),	\
> > +		  "i" (flags),					\
> > +		  "i" (sizeof(struct bug_entry)),		\
> >  		  ##__VA_ARGS__)
> >  
> > +#define ARCH_WARN_ASM(file, line, flags, size)			\
> > +		"1:	twi 31, 0, 0\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
> > +		".org 2b+" size "\n"				\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >  /*
> >   * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >   * optimisations. However depending on the complexity of the condition
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Link Mauve
