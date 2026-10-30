Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377658;
	b=E3eCps9ea1FpWH4AQHmhvwVZS59tUnaqFiQbKdBs0LVw7UvvCjOqVYSPcXW7ZPlaKbjx
	 /iTF/Uov5ZOyvipK27Xzci+ePdHGU37O8rpMI4duOvvdFl9lbnO/aBH4iMSykGB+wZ4Mz
	 oiYztuDGoQiN1Ju3wdiSiY+Zp2u/pfalnVnJ4/MGCbaiCL9qCEXm6B3zCkYHbSM5tgdle
	 O1R4fcxK95myJPXJ9dBvX2hICigo2yuXDnIv7U1BaoP9e4Sssdh36w96G57npsrhuJI9z
	 ZakJ3N1mbp5q2N+ewcMfGRECg/UybKOC0Er2CIwdFSNNrUR6EjgxI7YXPoAC3RF7wFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mzEUBFIuRLhQjuNB2s+5eSASza7E7mMlqO5ep8038NM=;
	b=aZTspec0I9IZcVId7lIV4FphNnYKmcUY3PMwOpc7Jm+8noVJG1o65geCjnyvSepTww31
	 EFowC66Z6IwVKct4r3xS/5V0kzJp99mzBCJ3LczXw9nO03dBN9zyw6l27BojeZg/iSWQp
	 Ddv8NsrCuB7JooUBQNeC85wfLOIB26pcHLWXBOGElBGUrIhQbys+qpySr+9P54gj+Fs+2
	 nOXio00dIyrzEfi4e9ZtNO/cNBW5yzUkuYp6zBcPUru6Mjxwqodm1frO+ohg2najiTw0+
	 Y/iwZ86UDQavKw+3B7VIUzJMz9A+n6NoCeIDawxNq7ulfpbbKOCi5CCeL4EwMGDugzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPDWBFPT;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78598606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78598606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPDWBFPT
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso527743f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377657; x=1793982457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzEUBFIuRLhQjuNB2s+5eSASza7E7mMlqO5ep8038NM=;
        b=aPDWBFPTU8Q78csDsdF9DMQr3jcbyJt14v/Bi59OXi9J8LSHWxibuQdxyVKGnagusI
         +PLV5PFhR0GWzNWALG7ct7t1vtT87WGN4H5IBO/yTNAAV7FOLDMnLvLw7Ph2jjB0OARv
         ZcCpCmlktijOGhyOaVtZf4NVnMZOz1Qrzr9f+FX8Gs69tnYIcCUai7YqhzZcEx+Wszbg
         Bbd5B+0XhSVF+Wu+WQg9RvWktHDBpwI+IxSSI1XEXwkp/PVKOtZyns7gmYp9eZGGJXrU
         0yycP9tWYmAyIYxj/FQ6fW+23k+4LDiGcawtwR8ajWpL44ARxx32un09AVK/5pSJ7tNj
         5f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377657; x=1793982457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzEUBFIuRLhQjuNB2s+5eSASza7E7mMlqO5ep8038NM=;
        b=ercEyZQjlBRncDpym1qUNz8M2mzViVlLOgo0g9YfnyqMbVNu1CJ4o9CxYNhTB2jaj2
         pHnZolzkmxJTfQhaquyHNH+OTnjUfQvyhHIgRo72LkcHBbx0g2YDennvTI5z1/wAsBwW
         Vcbr3sOqDccfYruYJD+FN99Nxq3ZaqGskQELkeufLwIa9iefqSrjvIDlCQBfCIOrV6hx
         L2S6R0UvpsMsAGwIxMBAE4JohFbt9SPIJU5JNTZY2MMHGhos8Tr/q/Qd/9bdnHYQoDhY
         s/MxeZZTuC+Ct0qDHMWmsQN7Pe2Vo26oSdv8Zqd1cpi1XxEJW7DBTFk/crV4BDkMMt1O
         gWGg==
X-Forwarded-Encrypted: i=1; AKwUvBxWuJXBi77emShmeAbS/yutPGRQey02mBajr90DPymb/K7QSAhrJifaEaI5U/6SAyL35hVKkwrncOUriWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOMk6cG+rqQIcvPUC8lONHuVma48JPLMdr5R6cbWHvgi6Ulbnb
	UfQmiMckEBGwiWUum3d1IndkJf5uS036gmvt+aFs1Wxp55cQi+B6F4rq
X-Gm-Gg: AYBFou3nlEhxYh0TaQuDfi67e89bAR8Qt5p6aVScD8DVUMi7sjfOfIYlrJwNYyQnJpe
	UiW8uYA0iT/WfRnFl/soiKuRo/ULr7a/Hr7gM+ZeZ3HhD3oA8X4zifj2pqb2lLPI3GHh376+7cr
	CVW6wxG5mj0A2O4Nt+fJicwI1zo4Tr9CeqU2dsW2xUZQMY08mGgaD/z5Ajhpu/GT88nuv1IttxB
	PM9HXt5hfsvkjsPJ/EuKlDgAh+BM47+qLFXRNSPWZre6Zq+MfLM3TPiU0ATIZwMErj0P1U9dD71
	e8b30nf819Zh0QUPqJ+0KRr8tpQ4YkkON1117yqBqOSF9Gn0E7KrFDZlPjGsRn5vgp5UJDHYkBL
	8bhr6cB9IP4hEybxjeAULMVLpP/FAPU2a61iEndABdYuhbidU8ST4Icx0BG7c/fpuloC1GWoTZr
	31eKJ3lemy5+XyOo0rzXVeCBEKW31ECneXGDjtjcYaQX94OaLcEqQKgyTQLCKV0s3lr6FSjAhN3
	XkSiPocZTwoTIw5SKkwvSUUu5iaTIfa+zXwxlt04cQGZK/PvKZDD1Ff9dbK9wSt7iXU/Y9guOGF
	d6XablNBXJXTY9r4c/n86eAvSft2wBu0/DPXugLyao1T87eiwDhlbEBzocxyiXznl8yuk4z6Iay
	fkIfSMEfwKEo=
X-Received: by 2002:a5d:5d09:0:b0:48e:76ab:7900 with SMTP id ffacd0b85a97d-48e76ab7eefmr386774f8f.17.1793377656539;
        Fri, 30 Oct 2026 09:27:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723b4sm4310823f8f.17.2026.10.30.09.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:27:36 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:27:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steve Wahl <steve.wahl@hpe.com>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
 dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
 linux-kernel@vger.kernel.org, Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261030162734.4baa1c22@pumpkin>
In-Reply-To: <undine-1793325629776229606-c448071ee52df6e1@undined.local>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
	<28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
	<20261028142625.GU2668564@noisy.programming.kicks-ass.net>
	<27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
	<auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
	<20261029084606.GE1779021@noisy.programming.kicks-ass.net>
	<20261029103438.69284f7c@pumpkin>
	<undine-1793325629776229606-c448071ee52df6e1@undined.local>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Oct 2026 11:00:29 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> On Thu, 29 Oct 2026 10:34:38 +0000, David Laight <david.laight.linux@gmai=
l.com> wrote:
> > On Thu, 29 Oct 2026 09:46:06 +0100
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >  =20
> > > On Wed, Oct 28, 2026 at 02:58:12PM -0500, Steve Wahl wrote: =20
> > > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:   =20
> > > > > On 10/28/26 07:26, Peter Zijlstra wrote:
> > > > > ...   =20
> > > > > > Also, when was the last time you used KGDB? I think I've tried =
it once,
> > > > > > some 20 years ago, and haven't bothered since -- it was *that* =
good =F0=9F=99=82   =20
> > > > >=20
> > > > > I can't remember the last time I used it. I also grepped through =
all of
> > > > > my stashed-away kernel configs I've been using for the past 15 or=
 so
> > > > > years. The only place I even see it configured in is in distro-de=
rived
> > > > > configs. None of my trimmed down debug configs.
> > > > >=20
> > > > > There seems to be approximately one clear commit that shows anyon=
e using
> > > > > the x86 kgdb.c in the last decade:
> > > > >=20
> > > > > 	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
> > > > > 	Author: Matt Mullins <mmullins@fb.com>
> > > > > 	Date:   Fri May 31 12:47:54 2019 -0700
> > > > >=20
> > > > > 	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()
> > > > >=20
> > > > > The only question for me at this point would be whether we should=
 just
> > > > > config it out for a couple of releases rather than removing it ou=
tright.   =20
> > > >=20
> > > > I have never used kgdb, but kdb is a different story.  I originally
> > > > reacted quite poorly to this patch, assuming from what was changed
> > > > in uv_nmi.c that both kgdb and kdb were being removed.
> > > >=20
> > > > I would like to see the kdb action remain in uv_nmi.c, even when
> > > > removing kgdb.  Is there a good reason why both were removed?   =20
> > >=20
> > > kdb is just a local wrapper around the kgdb gunk. If we kept that, we=
'd
> > > still have all of kgdb.
> > >  =20
> > > > There have been a number of times over the past few years, on large
> > > > cpu count systems that aren't easy to configure for VM usage, where
> > > > I have a problem that wedges the system or leaves it unresponsive,
> > > > and I enable kdb, reproduce the problem, enter kdb via uv_nmi, just
> > > > to dump the stack of all processors and find out what they are
> > > > doing, and check other things that I can get to with kdb.   =20
> > >=20
> > > So this uv_nmi thing looks a lot like sysrq; you could wire up one of
> > > them things to use lib/nmi_backtrace.c to dump stacks for all CPUs, n=
o? =20
> >=20
> > Where would the output go to?
> > The kernel message buffer is too short to be useful.
> > For a smaller number of cpu something used IPI to get each cpu
> > to dump_stack() in turn might be useful as a sysreq command.
> > But I've usually resorted to cat '/proc/*/task/*/stack' (or a subset
> > thereof) to find where processes are stuck. =20
>=20
> Isn't it possible to use another external monitor like capturing
> serial output to store the dump results (for logging all dumps)?
>=20
> If this is intended solely for performing an in-memory post-mortem
> analysis (without generating a crash dump) by leveraging KDB=E2=80=99s
> debugging information interface, it might be possible to restrict
> the functionality to just that purpose by new kconfig. (In this
> scenario, the kernel should trigger a panic at the moment of the
> interrupt to ensure no further processing occurs.)
>=20
> IIUC, the core issue here is that intrusive KGDB interrupts=E2=80=94such
> as breakpoints and watchpoints=E2=80=94disrupt the assumptions regarding
> kernel consistency while the system is running. For examining
> the state of an active, running system, tracing is a more
> appropriate approach.

Just writing all the stacks to a serial terminal is likely to be griefsome.
It will take ages and would probably have to be done from a context
where you can neither (sensibly) spin or have enough buffers space
to cache everything.

Assuming the system is partially working something like using a IPI
to get the stack copied into a memory buffer/page which can then be
dealt with in a more normal context before requesting the stack of
the next cpu.
Yes, it won't be as good a snapshot as absolutely possible, but is
likely to be good enough.

David


>=20
> Thank you,
>=20

