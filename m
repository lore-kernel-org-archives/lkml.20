Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6EC41D648
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205454; cv=none; b=CnovbIjt060v+y3jdh3+w29+AMGVeGp2TEy0XmkKR7+b1zwhyW9q4UM8CK+5EN+re7XuOrEOkBCOohq3KJEWL1I8KjrPu6OLF6bFbRzpk7xJyPnfXxf3/dD6JCpzaMC93LyHPN/rG21EC7ogHhz8VtlFgzUBuDV0wroWAyZpt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205454; c=relaxed/simple;
	bh=JFkNJfIWl4JBPhtIiMKJsDFXpmdvhj7ZI5ApqqlkfAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOHVfhYza5uIuR1l5flepJLffKKpYZ6HEnlo6dTxbIDe6qS0spmMR6lP6u5cX3f9tU8Y8eUYYNufI0xmhuJljr/oDo8Gi/67ZgudJoo0A8sS7KCUySi8HII7fdCBZs4Qdqf2p1A5I8se0C7NH77pQqsH5U5pB7vZiAcxCWn2Rsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2fsXHiu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2fsXHiu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso4532835e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205449; x=1789810249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=Q2fsXHiukvnErotvdp8NVy6d8RV4/YZJCAqJyxu5qGJKDuzNNe5rPzUCLU8QT7RZs2
         bF+3ujmUnzXiDykLXUCDstyPmSpP+oBVos8pcXz7O9GbCq768nQE8CWTaiDLFUEvMOPq
         k5q2Bk0flpD8RBEd1ahQan5JvbOS3/mMRquT8BujuAOltom+uAMLwKh9/hWxdgpSr2nC
         biptUkQmVq90XJGr7q4rVjCME9FAAOnmx3dWcq9rywP51Cx8qKjUKp2j4p1WhTgGMXED
         Oz9gLam4h1S2cPxHZZXko/2MMEJ/azzGRey9y46+U1TB3pjCeT9w/wHx0zK8mJfr/Yih
         s/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205449; x=1789810249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=EcS+7T719Jdzm45tj+YXXHgyusshgOBe98Cqe3ZX3QtGoEkgNfOVvdpjt3CA3W+WBc
         cED5s3YlIwcD1n4UcDa2bWpGfih9SLiQBlXXotb3eATzV5dvYZAqIBm3HkaMM20lWYlI
         6pTS7R5VJYx04OSwXyVW8h61PZNRPfFu31x632kmw4TssD8fBPr5SPC/9Ro9MXJVCDjV
         wwqbcTlOR0C10fo094IjuxJoUF7Ed60j07XUvmIGt/2tTCNd83krELqTxixjVY/cRBfo
         CWCbxLAntJ2qzn0PHujLPQPZdBeb2lfyDq6ssV5czgnhSYF0pKCKFZkPmcPAp60KDFp6
         v7nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSB1eg3HlQbwEAMZY0VktaEwuPpRS6nVfSRrPADs01kyvh+TbON50tPYc9Ja5Uui2FyAGKn1muID6b3jE=@vger.kernel.org
X-Gm-Message-State: AFuF++lTlGu0TAvBoeruTvzVxfQA1AHD19/1vboxPkYjrGaFKObQ2fxA
	71eplFaMpY9CVbrma6vnQYIBHYUQlkRecU2IOczkE3NXkEvdbHJG87bf
X-Gm-Gg: AYBFou2WBk3z1hrz9I9/EW7U2X4KAHjJS9OQnlvT7U6etPnziELB/fZCedYEu5fwKrV
	VdroLuJIDdrnXaUQPsjE1FtbYqtse+lLHqjtOYHSr5+pV4kEbAGd29A2xI3aDPTehx5mjdxhsFd
	T23eJdtiOl3KMzXNT9p+r1zvrcglMt8N2YbhJed9d0KhEq+g4jqtEkoXXKTIxlaMIrdMVTw0fY2
	NQXZ2ecdGZh9/WA3QWV8yjDqT0VWRpccXr7D18yx6Fq6mj2XHlWWQNed/9Sf0YEx0Rlz5UUXjqr
	JBZnpBRZtZ7Bbjza2Iav29se/F0e6dRiSKG7FGom6Oo17nnG+tPpjGHoyUySfGvei2whgv/twxQ
	9oVox2wPTn5zGJAk76620Go3I/s9BF1OMxRBRqgx1ivOIkCrwgY8G8201HAaE3f7cZQ01I5kjT/
	Dvv/c7pWbknDQL0PlZ3lTZuuQS/KV9Q44iDuzNpJA55CgmVpIiI3k+69i6F/M5RxSlamKLMYiW/
	8CaawJio/5y0GMP3wAFgVPqy/YYN1oeSqeE
X-Received: by 2002:a05:600c:8411:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49e619f5049mr195258665e9.11.1789205448684;
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e706d0c1fsm26523335e9.1.2026.09.12.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:30:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Vineet Gupta
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260912103047.1b95bb03@pumpkin>
In-Reply-To: <d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
	<20260911231017.550f8cd1@pumpkin>
	<d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 16:09:16 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 11:10:17PM +0100, David Laight wrote:
> > On Fri, 11 Sep 2026 19:25:34 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> > > cmpxchg() for the architectures lacking native one-byte atomics.
> > > The same architectures also lack native two-byte cmpxchg(), where
> > > such an operation is not supported and either fails to compile via
> > > BUILD_BUG() or fails to link, because the bad pointer sentinels
> > > these architectures declare are never defined.
> > > 
> > > Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> > > word with READ_ONCE(), splices the two target bytes through a union
> > > and loops on cmpxchg() of the full word until the compare succeeds.
> > > Like cmpxchg_emu_u8() it is fully ordered.
> > > 
> > > The Kconfig symbol gating this file is renamed from
> > > ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> > > selects both the one-byte and the two-byte emulation.
> > > 
> > > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > > ---
> > >  arch/Kconfig                |  2 +-
> > >  arch/arc/Kconfig            |  2 +-
> > >  arch/arm/Kconfig            |  2 +-
> > >  arch/csky/Kconfig           |  2 +-
> > >  arch/sh/Kconfig             |  2 +-
> > >  arch/xtensa/Kconfig         |  2 +-
> > >  include/linux/cmpxchg-emu.h |  1 +
> > >  lib/Makefile                |  2 +-
> > >  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
> > >  9 files changed, 40 insertions(+), 10 deletions(-)
> > >   
> > ...  
> > > diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> > > index 998deec67740..fee8171fa05e 100644
> > > --- a/include/linux/cmpxchg-emu.h
> > > +++ b/include/linux/cmpxchg-emu.h
> > > @@ -11,5 +11,6 @@
> > >  #define __LINUX_CMPXCHG_EMU_H
> > >  
> > >  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > > +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);  
> > 
> > Why uintptr_t? Shouldn't it just be u16?
> > (Which probably means the code would better if it was just 'unsigned int')  
> 
> I suspect that Bradley is just following my cmpxchg_emu_u8() example,
> which also returns uintptr_t.
> 
> I remember that *something* broke when I made this be u8, but I cannot
> recall what the problem was.
> 
> Bradley, could you please try making it be u16 as David suggests just to
> see what happens?  Who knows?  Maybe it was a compiler issue that has
> since been fixed.  Or maybe the macros and asms using cmpxchg_emu_u8()
> need that uintptr_t for some reason.

I think the uintptr (unsigned long) cast is needed to stop a compile
error when exchanging pointers.
But that is an issue with the #define not the called functions.

Possibly changing the #define to have:
	unsigned long ul_old = (unsigned long)(old);
Or even, with the type check from:
	unsigned long ul_old = (unsigned long)(0 ? *(ptr) : (old));
(with the same for 'new')
and the removing all the casts where the value are used might be better.

David

> 
> 							Thanx, Paul

