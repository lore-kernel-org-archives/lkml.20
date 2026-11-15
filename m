Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707574;
	b=HUReekFytwZtRLdLFHnxKkSIVIr4Eoyxa+ft9cAnfRmGSTo8sSMGD6h41sFUfDDKhf+6
	 rgpExdM2spGbcf3I3+tC0A45ttT/d6JU0KrlD09oko9zvuTLjRUf723hA4W6M7jb0JZSi
	 Efk/RKOdaEypx26kOhBzJyI2ZVRAL1kxFGiWQ8JaVDBUEruoTvkuyYNopWEsxyLgIZG91
	 BNge5sVG86fPA9eyrxLIonWsX5pwwRldWImMNuCQkmfaejSKMRHnuMJit58fgsLbTJyr/
	 Pyv9hii8EgbxeSt3ztsNGNfAIVXMf43/Hivt4+8Dvqs4czQoEzxwp4i8m23KkAMWq1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ejYmTs6mWnDyApUtB1ZIDj1lWthS9/CwrgCU+uOWhs=;
	b=YkIwptSqiHufO9IrdHDBPfes5qItRBB0Yu0aSMiTEioXp4XtPE1RMtIb/ju0tQ5PZ3Do
	 iwcLFaoqCDICCc17/uKj+cvJCh+rOnYJVaqODYs04lQnanya/4nvdFQLTnu4ILd7jQbAv
	 1iapM2/2aqf3164vnAcWKbIcQYBEoFmcF058ZbqbCCon95zzXgCGnpkmObGXYKLEzxiG9
	 EwW6k5KHj2Jijev3wSlXxjls17s98miWdvbUSobodSiHrYQolG7uyVJVRl84eWM/VJeWE
	 rotzh+FResxPnLE8TXEjlAczpMQiMayNQgpxnY9+LL24xmQBNHt5PRTzAYEMENqVjUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krssnxES;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E5606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299E5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krssnxES
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so3342145e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794707572; x=1795312372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ejYmTs6mWnDyApUtB1ZIDj1lWthS9/CwrgCU+uOWhs=;
        b=krssnxESzo9GaRXDH2qg++cHod8q/wIiofiMVhzU6IM3OLpyAG/Ozby9mU9ASLrBcV
         WU3+jLr5T9C3o4JT0i0nKRudNXDOVRei2ySxN8WhWT6FFXFj2ioddNtAhcn4tGqqi/jR
         K1w8K3GFcprQVHipESSL5qtuDsyG0u1KqIwjABdAk+NWFEVJOtsOOBeEDSab+HeCsETo
         XvXmZ2NczFJNZdBJ+3H1m5zPe2TY8BOAXyv8ukeiqOW4zhwIgLLl3C+9xtc2b/2wQJkh
         SLdhhZ+02lc24gwX5TQ0Y0a/SEnHNlNfODITC2y3BbjZL9gz8l86BRaxv7FuqGRKA5Mf
         k9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794707572; x=1795312372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ejYmTs6mWnDyApUtB1ZIDj1lWthS9/CwrgCU+uOWhs=;
        b=LYBif/fANEBdd247QrfHZM+5ZcguDXWwr5IsS9NwD+oiFCwywddhCWHukR82/bM+p7
         DObSncAe8alCOjsda/1wauI5SBVy/TkEMZl6xBM8cRwz7lR8W0bXM2jLQpKXphW5PNtA
         MJokx4fA4a8WK7gKF6qQ2Ey+xaqSchp9zdkdjem6vqGDIXxKQ9UzZ7wC8Y1FNL22GoxT
         CiUJnTG+MjPjwWJWaSSdOSQ+T+pXJXhbh8/TJzvFk3SEIbiDJZ2rtv6E6ly+BzeNWbti
         MyXPr3O0eTA6729K6femDqNc9ohQ0ef4Maw9uT0NtfR+ahrLpswTwfRkmVSROT4SW3Ek
         tY3A==
X-Forwarded-Encrypted: i=1; AL+hErEyBNwy4v+JjLaE0/w/cAX8haSnNMp3fDlo6ZSY2/VOHuarvmOejBVLsYpmO+Ki+7ZpyR+bX6fynT4ITv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XPkVBDojVRq40mK7P6l58Z5pjOm1gF1dFk8y7QZjr5H8AtBPp
	n1NXE46S009x4dPSyB90/3T/B993M+9u8ffB38RlDTzS67refsgvjLOW
X-Gm-Gg: AYBFou04VoSftycwxx0OOcgPBXi7NXOLosu325d0wFSxaxJgoMS6RBcWOLbvJXg0Lpm
	mE4xVZlipOQYUAHlmkfWeXnKhK+7piftXUbOgHbQCDtm9tY6jne8clSI1J2kQ3Bh7uc1zkx557n
	QrNSwu/P+K4TD1E50pmv9gTmOkm1tWNOlmJnZGec82eDNZ2NDvn1RgyNrpUP3wNplOKnCRSgxNC
	8y0E2LEn3ZXvxnWuSjBrQPC+dSyYxHcVIfkb21q8HqZf84Tj/mpnhHiqJtwGUavLJ9xfjIsN2aZ
	lokf4dyRMGtitMecJ7wfrih4WAQ6kSnViowhqioD78owuj7isHfNJ/faNDuFtEjJWBaxw25bLPR
	vxhAgUpuS+nwP0noCm5np5HtcmGJaDxVJqQPEIqJ+nNrJkBkER0+f7L/QIYkGKEXHnD41nr9Wtm
	keB7sI9S8FqPrcJBvWVtFVKWtGO+ViW2HPmqQwW3jrZO6ElG3czbRYjhHka34/65/pmqRONn1uA
	nVECAAJA7Ok6vYpxDBxnJ62H17DZmp35/w0qqAupX/Mhk1qfscbn2YvUeWyJjESPAQLk5+ZhdJn
	YdVq1KEQPlnM7lHuEiLHAWeZ3OcdFvd5Z2xHpIuJx39hC1GnJtisyVTI/ubfWCNBheSxdwuYuZY
	AV/+lVI5UfeviV74Gk3NGh+z3vytt
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr107415355e9.17.1794707572354;
        Sat, 14 Nov 2026 17:52:52 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm112112405e9.6.2026.11.14.17.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:52:51 -0800 (PST)
Date: Sun, 15 Nov 2026 01:52:50 +0000
From: Stafford Horne <shorne@gmail.com>
To: Sahil <sahilcdq0@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
	pjw@kernel.org, wangruikang@iscas.ac.cn, namcao@linutronix.de,
	kees@kernel.org, linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] openrisc: Add unit tests for KProbes on branch
 instructions
Message-ID: <avkQctt0CKt3YcsH@antec>
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-4-sahilcdq0@gmail.com>
 <avAsy43KVO-7Nm9z@antec>
 <dbfe2a41-c99d-4f00-ac0d-2b2b31a72986@gmail.com>
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
In-Reply-To: <dbfe2a41-c99d-4f00-ac0d-2b2b31a72986@gmail.com>

On Fri, Nov 13, 2026 at 10:45:03PM +0530, Sahil wrote:
> On 11/8/26 1:33 PM, Stafford Horne wrote:
> > On Tue, Oct 27, 2026 at 01:42:39AM +0530, Sahil Siddiq wrote:
> > > Tests already exist lib/tests to verify the generic functionality of
> > > KProbes. Add unit tests to verify that KProbes work on instructions
> > > that require simulation in the OpenRISC ISA, and that the corresponding
> > > delay slots are handled correctly.
> > > 
> > > Signed-off-by: Sahil Siddiq <sahilcdq0@gmail.com>
> > > ---
> > > Changes v2 -> v3:
> > > - arch/openrisc/kernel/tests/test_kprobes_asm.S:
> > >    - (test_kprobes_*): Set value in r11 register to 0 prior to running tests
> > >    - (test_kprobes_adrp):
> > >      Place function at page-aligned address
> > >      Use PAGE_SIZE macro instead of magic number
> > >      Move value in r13 to r11 before exiting
> > > 
> > > Changes v1 -> v2: New commit
> > > 
> > >   arch/openrisc/Kconfig.debug                   |  30 +++-
> > >   arch/openrisc/kernel/Makefile                 |   1 +
> > >   arch/openrisc/kernel/tests/Makefile           |   3 +
> > >   arch/openrisc/kernel/tests/test_kprobes.c     |  59 +++++++
> > >   arch/openrisc/kernel/tests/test_kprobes.h     |  24 +++
> > >   arch/openrisc/kernel/tests/test_kprobes_asm.S | 157 ++++++++++++++++++
> > >   6 files changed, 273 insertions(+), 1 deletion(-)
> > >   create mode 100644 arch/openrisc/kernel/tests/Makefile
> > >   create mode 100644 arch/openrisc/kernel/tests/test_kprobes.c
> > >   create mode 100644 arch/openrisc/kernel/tests/test_kprobes.h
> > >   create mode 100644 arch/openrisc/kernel/tests/test_kprobes_asm.S
> > > 
> > > [...]
> > > diff --git a/arch/openrisc/kernel/tests/test_kprobes_asm.S b/arch/openrisc/kernel/tests/test_kprobes_asm.S
> > > new file mode 100644
> > > index 000000000000..bc87a5fb00d5
> > > --- /dev/null
> > > +++ b/arch/openrisc/kernel/tests/test_kprobes_asm.S
> > > @@ -0,0 +1,157 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * KProbes unit tests for OpenRISC
> > > + *
> > > + * Unit tests borrowed liberally from similar work of RISC-V. All
> > > + * original copyrights apply as per the original source declaration.
> > > + */
> > > +
> > > +#include <linux/linkage.h>
> > > +#include <asm/asm.h>
> > > +#include <asm/page.h>
> > > +
> > > +#include "test_kprobes.h"
> > > +
> > > +SYM_FUNC_START(test_kprobes_j)
> > > +test_kprobes_j_addr1:
> > > +	l.addi	r11,r0,0
> > > +	l.j	2f
> > > +	l.nop
> > 
> > Just a tiny comment here about indenting the delay slots.
> 
> Got it, I'll indent this.
> 
> > You could also use the delayslots here, for example:
> > 
> > 	l.j	2f
> > 	 l.addi	r11,r0,0
> 
> I initially thought of that too. But then I thought by keeping l.addi
> before l.j, I would also be able to test this for the case when
> there are no delay slots. I can reshuffle the instructions if that
> test isn't required. Please let me know what your thoughts are.

I don't think it matters either way since these are tests.  But, it would be good
to note that in a comment at the top of the files where you want to maintain
that convention.

However, thinking a bit further that may be hard to enforce down the line just
for a handful of files.  We should assume the kernel code uses delayslots.

-Stafford

> > > +1:	l.ori	r13,r13,KPROBE_TEST_MAGIC_LOWER
> > > +	l.addi	r11,r13,0
> > > +	l.jr	r9
> > > +	l.nop
> > > +2:	l.movhi	r13,KPROBE_TEST_MAGIC_UPPER
> > > +test_kprobes_j_addr2:
> > > +	l.j	1b
> > > +	l.nop
> > > +SYM_FUNC_END(test_kprobes_j)
> > > [...]
> > > -- 
> > > 2.55.0
> > > 
> 
> Regards,
> Sahil
