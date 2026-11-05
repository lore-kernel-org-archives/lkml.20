Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871623;
	b=eOGZcn+HTlwtdBIBp3EcDCQOL4vTJcJtTrsHzKwdjbv2mMCzCxFDpQssKjPO2FRHNQhN
	 /BEQlPDxMO1cakIcOzltKA1HGLrqnVPq6xpnFjF2p+FTahX2g/ZJW1rNuKVzCVvrqJV6U
	 qRrBu4GcS655VkSCyo3fvLO/SMPk0a5ndZaHMkDxFuNMkg31ARkLO1nidMnw1ppF43Ros
	 WZyB5SkRrrjDYQbRxuG7NmYxKheearmQIY0yL+a9dHdhCPVq977Vlpf2lT0mfGSJr+7a6
	 BNPNm7OlOhcPj2VDWLirXUjiA4zRsNn3sCOR6CAIUK0ovX+yb5Pl7trWMnBMnV1cNEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
	b=EDmL1Kpn62fXW4fIuoVGC5eNWJrM+3z9ddq1Q3fOiwiUHCCn34WfhwWPSc3t5xGZM1l8
	 AZpX4+OAnoxfwaWO7WCYEQfZAEzJ12NICOM0f9bBSdg3CR+ERQK4BVJCuserk9TxIll2R
	 XfMRn3sIlHSEmJD8/0TG8+0ixur6Y3izCxmchW7/HmvZ5777IawBjG9w/j536h3/aPEbj
	 Huc436zTur76XjHBfrnsjxDsfE57yfBvKBG0TzfmfncTS/L8UwqU/U+lv5CZGvCqKnDij
	 RDa35PaomvbzDiqV0lLHokAkZss/9g/HQZWTeJUd6g79mY0+W+UMULo0X09uDBvDVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSWdi8vS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA53C606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA53C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSWdi8vS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso10876095e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871621; x=1794476421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
        b=LSWdi8vSfjrNkPLBY60K5y3Zj+8Awu6uDqFePdT0nLSPyP/FSWoKWT3oLqS5Z2oTik
         P6wOJWHNhfkF2WOFkzYTg0AsDml7StOl9tLmLX/KOgp13QbJ8rX7Hx0tO5FhNft4BbJo
         zss+4mg5wOHZUe+8OfEZDYWk5j2pq2ZLiNmc8OixKQn9MIJRhHjoB6jyWIGai6ulMq4f
         ek13QSTVeeLlpXbRZobKamZI3X8OmNec471dkXY470Xkr2mEYIGN6rNObPAVl/aHHSix
         8aV+DLwz9108fXn0XDahCSk88VhAk1odQ7hs34VAK3qwJ+ud8XfMIqxoKU97OMYgvHUv
         jLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871621; x=1794476421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
        b=nK4PUrmz9ZQxiRGUNKUZXJ/WcMfdmk+eMEnqJS4dzMJkhGaR6EPcQ2wrpsT6stqU2D
         PhpOOVjAYluoGXpnU/Dml7TqUnCH/40A2X+/+RMC2i2PZuxOxTFg0v6J/puRBNb1+mlc
         F91lgKiIJ54egNe0nSIuOFTZyNPuTD1MiPCuXvWX6r8hU177gy55Ek8sxKiS+scZaMzg
         ZGi7kkNmIT7yrzx3iXvFSYyobr9HHzaPaWDGtXWOh8zepY8a/s8lt3UI0F5PhWIromtJ
         GsuNftdZV2FFfCgLtIdzuPGANgItIQGsxune2QXflq5CFqH95QLe7fVFRmVAd0pmduVa
         i4RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEfeWmV8+LeN61XcRJmeXFHn1NXCrsX4b8RluuQ5xjV3B/+ac+oShYo6aJfPES0clPWANQCm4fn1rBOz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1RpEWGX/tq/GMCGxDGidDFzHT/vHfR//9zZsDQfJ6blsNefVq
	Ar3eM6oFEmAz1GhqjwqYyzi+/1sjDurf3mKbPUQ0Lqfta4oB/rDTs1At
X-Gm-Gg: AYBFou2eJ4Qjji6q0ZAkLI3r1G/iTB5PW6YcJ69vB1QWhREXKL/CbQwkROlGWyR1htP
	Pr6d/L5dUGc7OeT0SBw7aly6gn35u5veOeCg0iTXkPbMO6M+g4A0i1Uetlktz/iAmNi9VZnPA7G
	ZX2hgHkWCd0YdtYbp/M7Wm2uUTIf2sk2ArwwojymxSWoI2adzqpwejqqMudi4hBBXJgngZXrC4p
	k7nbM/L2o6KVc0/W6vDTOPgh263cwLBAk2fX6pQY5Zx1Y+e5Bw4naDxc+rryc4WNLDHGgAgFBma
	e1bgMPTyhPTZL7Rn0A+Rt4W6KDReReK6l0ccqLrHa1p8TYF70YphHEkxplZjqsDZbZzqMZtyIYo
	9j1ekoaH8CV9MhFLT1tMlNR+eShwHsIyl3CCc7es8de8D/IXZwfqDV2skJzXzIfBPIeLzZ/Xd0Y
	Vy5J5E9SXRgTNlrC1MZMvuQVztmA+zTWJFPVbx6iaEsYFj++fQounmQHNGXS+9c3xjMb9zXCZgm
	Wl1RcnIYXr2q/E3ycXKQYwNYfbXzevKoDg6pQXH9I++rgY7nXuofQpwGKy2dxnAXjVB1qZKKRX2
	b+fPZqHNkJAyJKZXAc7zMKeHJSNqpD4wuS5Ma8hvT+gWLxuzWTft78UkrVYlUkIH
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr431560105e9.30.1793871621024;
        Thu, 05 Nov 2026 01:40:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm58866395e9.11.2026.11.05.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:40:20 -0800 (PST)
Date: Thu, 5 Nov 2026 09:40:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261105094019.1ec31c30@pumpkin>
In-Reply-To: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
	<20261029104938.GC1813469@noisy.programming.kicks-ass.net>
	<auM6mSXz-BVIjYBc@gmail.com>
	<CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 08:56:12 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
> >
> > With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> > becomes a compare tree on every x86_64 build, so system call dispatch is
> > the same whether the mitigations are disabled at boot or at build time,
> > which is basically my end goal.  
> 
> You're basically saying "with that patch, both cases do equally badly
> whether disabled at boot or build time".
> 
> That's not a good end goal. You want both cases to do equally *well*.
> 
> I do wonder if we could do computed jumps. It would be lovely if we
> could basically do something like
> 
>       # syscall number in %rax
>       leaq table(%rax,%rax,4),%rax
>       jmp *%rax
> table:
>      jmp syscall0
>      jmp syscall1
>      jmp syscall2
>     ....
> 
> and avoid any indirect memory lookup or indirect branches (outside of
> the one computed one). And no extra call/ret frame.

Could it be a table of 32bit offsets (from some point) so that it is
a data cache access (or miss) rather than an instruction pipeline stall.
You might need to use a retpoline to avoid needing endbra.
(or is there another way of avoiding the need for endbra?)
You probably need to patch at least some of the code to nops when it isn't
being used.

> 
> It's possible that the branch prediction hardware hates those kinds of
> very dense jmp patterns, though. I don't know.

Some cpu have definitely not liked having a lot of branches in one cache line.

And performance will be absolutely horrid unless you are doing a benchmark
that keeps doing the same system call.

The cost of each branch miss is likely to be at least 20 clocks.
For a random system call half of the branches will be misses.
Plus all the cache line reads and other delays.
Definitely non-trivial.

David
 
> 
> We could have a single static jump that picks between this one and the
> "conditional branch tree" version, as in your patch at the beginning
> of the thread.
> 
>              Linus
> 

