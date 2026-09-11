Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E837189C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104107; cv=none; b=Hz9FxlHOT7F77qYSB1GPSkXYVi4nP7lqVImkKvymltfUms/nfLSSc5R21Hv2Nv3pN8SW7vu0u9jpyhpRP0nUxisqwf2sXfOj3QnyGnqAqH8ue7dZx2u8xZqIXFY32WJNOydPaQRER8Uyd+zq7djtu63A1HUFaguUck0hU33TWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104107; c=relaxed/simple;
	bh=qbe4iXbColE9Lxv1SWckISZVDQh2o31P3TdzJOEvTp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ej5w14+YWUkrJV0aLPoYHND91IIPDVoooPArlJ/UM6YFFRHmjUrZ/2xcUsGeBV83zXQFMKZHp2lstwNFSpaR5FbHPZQYUMo3FEx9AKMtUeNUAELwZndAribEeZ9rZU7mtzVMZOmKz9AtKsstsroSDitpJAEfg/GVPrWaGTW1q0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR1K84sp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR1K84sp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4c1210748so436926a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789104105; x=1789708905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvxSaNqswfMI7MoABq1pjZcckfAsFzvKQ+mSQEh+4AM=;
        b=HR1K84spUiP/+93hjEiqCb09Z/y56X+nYrUyxeMe180Bp7SgIyL8OFuBYOHxexuXhQ
         +i/x/VqFq2A5ZUxDD9IJzseapD5kpPzF2NgMLqYl4x7tt5qe0HzTQy/xo31VjsT6StO/
         cE02uxXBzRTGBN4YjQDlbGB63XoU6MNqAnUo0c+NYQxv9dt2RSzIDqTQaSM+t5aci2C4
         dezAuM5AnNSJbtxhqZtOrEIM3OZ+H6av6uLkzWkbVTJezAOR2yoD97hTuo4fdDpV5iV8
         GxQH1+ecNq+ZEleF9uBlH8IHpJgQ61dePhK5XOaXDPFYX84nYtPHYTuCto+ltviesAZ1
         Ur7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104105; x=1789708905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvxSaNqswfMI7MoABq1pjZcckfAsFzvKQ+mSQEh+4AM=;
        b=k9tYYGWwfEDXFCs29apaNThOmXSfWbJMTsy7BWrA1JScIVKqbuswvwaY73m1LMId8n
         QelDi2u2Y5lj9hdD01SVshQDMOVqCypF9rn6hAYhJrQdjPUsnk2S9AXO4mRvy2dSAqUs
         vIsv+c/VqC+piV1GzETXqDTHicqiW7qQnwDyszeDVypulHKTY7r4N2Iz+wuGzSZkSN86
         i6ZIBRa1HOeGivmGttjPZc3x3/yGlM+r4TZGX9TwJOG5ppYtxD2QEs5sLaqGI+VEp23O
         MhvCmqJOUcRsV+lA5YeUpXhvovfsMEPJydncqKpeMPAhPjOmB42rP17s37jTRHLauOIW
         npng==
X-Forwarded-Encrypted: i=1; AKwUvBzGHKh6um/+NM24IBd/gOyFTCBHP2/ts9p3yooeL+HTHUFbcwgmgzXAh7FWjmXa18/+ZB1AVf4wQXaxFcM=@vger.kernel.org
X-Gm-Message-State: AFuF++n25Ad4mypm52ktD9YCqpihNBgw6RDoV8QjXMNeAgAZW6MeEfUm
	hdtYofy6Ivo7VzbmxCHeRW7iTrBpqXR0M85xJjywfPVugAVAl8zWAW4/
X-Gm-Gg: AYBFou3WyvPSVyF4jCwlb4VWTLPudabGyQ6UAuT6nNNq0CLme6OwOVCau6RGsFzeUMX
	ZQqW0/8jVlay7SOVT+aaO2KoRZ5KBGj4kYdKMnGPQgiVOyLHi2wCbNUuGhpclrz5F4sI99RkM1P
	Qa4ZGoMVKDLHKJjDz4cSwCWIAt4pekcHHUgHIqvqK8Bz5S/eikcT2HjkErx7yNMIcd0FVTrccmJ
	76YE4xYAlUlrbB+ITwRGlAtzHV/DSfgmwhErhvSJl9hP9xpmzXC6FOweMfrtZiyS6d802u2Q/42
	Eax0MA1Y+2uUcjN7afwYrGUt7Gq3YbIH6GvIrrw+IRjhXLGpqfMrVe2a/RmWn1k5Qlcol90F/qG
	Y4Nzh/rfZ1YfRpMsGo+35vxlky/Gswh1P9MJD8b2ZjfVHEvv1rM+c4P9Qjd1KdDDzfK/pMtcVAv
	y9rVoGPOh+K11JRTduVm3ho34I20UXVjnX7gNbWyVbB9AP0+3M/mo3yt41ju5plTd4dEUtEdn2E
	brQe86EUUt0Q2jmuqeutQu8Tk4eTglwjN0JMWelYqgvYw==
X-Received: by 2002:a05:6a21:6f88:b0:3d1:be60:2811 with SMTP id adf61e73a8af0-3daed30037bmr5351249637.15.1789104104920;
        Thu, 10 Sep 2026 22:21:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8137fsm3495801c88.9.2026.09.10.22.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:21:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:51:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqOO6_kXGaaIkCuq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
 <20260910.222417.2048885189565815846.tomo@flapping.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910.222417.2048885189565815846.tomo@flapping.org>

On Thu, Sep 10, 2026 at 10:24:17PM +0900, FUJITA Tomonori wrote:
> On Thu, 10 Sep 2026 13:05:27 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
> 
> > On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> >> The Rust kernel infrastructure generates inline asm for WARN() via
> >> ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> >> preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> >> arch-specific asm template string for use in Rust's core::arch macros.
> >>
> >> powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> >> Rust builds to fail on powerpc with
> >> ```
> >> error: no rules expected `ARCH_WARN_ASM`
> >>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >>     |
> >>   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> > 
> > I think we probably want to catch this earlier by have something like
> > 
> > #ifndef ARCH_WARN_ASM
> > #error "ARCH_WARM_ASM is not defined"
> > #endif
> > 
> > in generated_arch_warn_asm.rs.S.
> 
> Good idea.
> 
> One thing needs to be fixed first. arm and loongarch do not define
> ARCH_WARN_ASM. rust/kernel/bug.rs uses bindings::WARN_ON() on those
> architectures, so it never includes generated_arch_warn_asm.rs. But
> rust/Makefile still generates the file for them. With #error, their
> builds would break.
> 
> I think we should add a condition to rust/Makefile to stop generating
> the file for arm and loongarch. Then #error can be unconditional.
> 
> Does that sound reasonable? I can send patches.
> 
Hey,

Sounds fair to me.
> 
> >>  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
> >>  1 file changed, 20 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> >> index 0db48977c70c..df2183c35945 100644
> >> --- a/arch/powerpc/include/asm/bug.h
> >> +++ b/arch/powerpc/include/asm/bug.h
> >> @@ -32,34 +32,38 @@
> >>  #endif /* verbose */
> >>  
> >>  #else /* !__ASSEMBLER__ */
> >> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> >> -   sizeof(struct bug_entry), respectively */
> >>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> >> -#define _EMIT_BUG_ENTRY				\
> >> -	".section __bug_table,\"aw\"\n"		\
> >> -	"2:	.4byte 1b - .\n"		\
> >> -	"	.4byte %0 - .\n"		\
> >> -	"	.short %1, %2\n"		\
> >> -	".org 2b+%3\n"				\
> >> -	".previous\n"
> >> +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> >> +	".section __bug_table,\"aw\"\n"			\
> >> +	"2:	.4byte " label "b - .\n"		\
> > 
> > "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> > 
> > If the code uses
> > 
> >     _EMIT_BUG_ENTRY(..)
> >     "1: ..."
> > 
> > then the correct label would be "1f".
> 
> Agreed.
> 
> I think keeping the label fixed, as v2 did, would be fine too. x86,
> arm64 and riscv all hardcode it. A comment that says the caller must
> put the trap at 1: might be enough.
> 
Enforcing the label would be a better idea so that we can avoid
mistakes. I'll fix these and send out a new one.

Regards,
Mukesh
