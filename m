Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636071;
	b=weS5SQXWwCHRPv210wGjGvQ/J1a2ivNB05bMZ1fyKBOWa9ymzOfWHzwjW+gyeAfgOAYO
	 iUGXNvfw3hH5HhEzqZ4+bXT9vOCoxWCs1hT24EL08pUJb/2kkoTTYhZsZIdKyP3sdYUYT
	 +TixqfHs7MKxWqR2N8Hn1p3PuGstpYHDr4B6kTrFy20XxBkTqxYa1xAXH2q65hd8o3gIL
	 ywUWBYJnpzCJ1plM4OVYohUzIhhORAwe8xYpjoL5++m+EkZA2YrVAzqCb1XPCA88a/axU
	 FxMbX8OmPZCl13S0opkPKrg9GEWc1lECjGcDEUjF0KjVeoWAPgqUiVBMya1UJFJov6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
	b=48ZEmNJkJ1Jt/ovlyB2E0BhGAaEkBrs5YdoBb0Prk4dXyUOqMqtWSXFlW2zkVzecCqmT
	 keIxZYQHyiYd/aQk5g9U/bYLWGvsPhEQdHrizIjTGX4Rj/qHvUC6VevbI6TYp2/HVp6Ym
	 DG6d99PInTby0cIFsuZF4fFSkFfkUKdyuPfaGopcqYSSWwi9kREgk0myuhzLWOG+NDNhT
	 oBntC7GIPqpgDT0MpgzPBDicR86CUC2GV5h/4RrYBHfR/u64jdLJCCTQfu8bD7aH/YA5b
	 714/Ca/R7pXNhliMhKjr2ablAA4puv8M7QVM/c5FNmiv1dIs0jK0T33PugaYaqAN8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ+Bf4sh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298D606A90E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3298D606A90E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ+Bf4sh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so26928285e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636069; x=1794240869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=AJ+Bf4shabMyjTIBY0O+LXPatqHnqTS127UhZsQaTlHtowQdrqPjokyL/XjHXYqMlt
         GeLKIB+MzYbgoous0JoqPyEm2FI4uoff4cfGT/jdnGCjay7a8NtdzyaL2onq1O5/xYxh
         b7ujNy0qFQbVKpr7C7+6l3VyLTbF9V/XXxfuG/EwdP4ciaQkhq/RPT3njAxQL9+g2dud
         KmdPujr5WcSbefxjEXprbRnrQN7Bxdyiz3GTgtBIlsqmTsqBvi8yHDoeUwVXcDwoMCZ5
         NpmpLh6QNQtIYsbvFn0j1gjx3URsAcQa4XRTHqISfUswbiSx1KM0p0AtBmgSQkCsrdpk
         MxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636069; x=1794240869;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=FGhluE1+WoG4Ejya+lCUtcgZHJPuT+OAUAbaBPzEll63KTqLZHDiN+3I+U65rM8+JC
         DQLajh9N/RBsWYgXDmTgQOlbYDDOCWhXOjMm2IT63H7pIFO+fhW5Z3BlqpmXHzwVZvkn
         WmBAkq8DmA10sDrYQDovDPagdwrbv0gSOQvF4qhetP14mEyX2vHypwIXQNQh8UfGSXs4
         jE587pI91xiswrAkJqHw6QcOU9Uikc+6iAPsFE+PsKajgeu0LChxchQB5lp3zSB8r9V+
         YgGF3+2scyo9FpwoCxpq9CIiKg77xJpnWIAwCGp4OXvc0fRHjmchUiMFCmmduosVU+xT
         pMQw==
X-Forwarded-Encrypted: i=1; AKwUvByx0hMw5hBVIcQrZQ3XSC37qG6Bss9uEQXWYUC5FjZEENHSXFxVytOEK0AtPhKky0qwheyv/+zBKrQMHcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cstt9J+MQ8f/yyaswaWeV2RJpZr6FFIgktW+7u9iLacl8eJAl
	hAPpCjrEEkSyJbj+fUwaCmCNNCzF/2Qy5FCyRnEWjOaR3upcO6GTLAbZ
X-Gm-Gg: AYBFou0VId5JzFsbXQdfkgM6MVljLq6sw/D419hWwrAqTxzMPSUInwDYzan7odfPypH
	RHYBUjMBbJk3rd67WvgpwLbJ9d3gk4idu99Ex+tRtGRrBa6iDs2DMF2DBg1E82wady6C9BYUc1W
	TegOnja1EuNOet0vioYt5Nna9fMda9MO80Ylnk+LMF5M7fpB2wiUq2O+K9WJX8Lkf6b4obvYsPf
	/UGy39HXcstFVXl0CWTTQ2D0DQtZIpchOBVWMGpvJao7mjh8EfQb28QtUqRnR8rujaTuxRlRbrb
	lhn6+OTJbntVJdQwQrEw7pEWWsLK1Xy5nl5t6wMVFbZcS9L0D3g+NovJmVQbd6Wjw8y2M/ETD4l
	8YU7Nf7kjhcCh46SxFas5pVqRfmDjExl8WiXfJ6iZKuudLFDrhnrTR2isniTtbdLqu4qEAshZhG
	YOco2Gtc3CoNsfzjcioJplkyMZyrHE/Zqms0EWUu0POg6te+Ycm0ely9y7AfTIvENCgGOb1btkC
	5fElA0Mb2FjiBzmsLakElizemhpN+AUTG4EBZ0p/m9vVO/sJBdIUD4cN0Dx0yUO3fwmi2HgeDUK
	qlRGT8cfCVY9i2qA3Fp6+OFdZ3QsM2Itt/ZQUCBhFegLWZSNwKKd+o6Zl1NJbjoF
X-Received: by 2002:a05:600c:c118:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4af79eef775mr111736695e9.31.1793636069327;
        Mon, 02 Nov 2026 08:14:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm267629925e9.0.2026.11.02.08.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:14:28 -0800 (PST)
Date: Mon, 2 Nov 2026 16:14:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261102161426.2403d308@pumpkin>
In-Reply-To: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
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

On Mon, 2 Nov 2026 16:14:06 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation. =20
> Depends. I think __builtin_addcll() is needed to get roughly the same
> performance as the asm version. In my tests GCC on arm64 turns it
> into adds + cset instead of adcs like on x86.
> But I will look at it, thanks!

The C version I posted earlier has the loop:
    buf +=3D count;
    count =3D -count;
    sum =3D carry =3D 0;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

for aarch64 you get:
.L4:
        ldr     x1, [x0, x4]
        adds    x2, x2, x1
        cinc    x3, x3, cs	# adc $0,%rxx on x86
        adds    x4, x4, 8
        bne     .L4

I suspect that is close to optimal - especially for fast cpu with
out of order execution.

https://godbolt.org/z/eso79K7Wq

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:=
44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.c=
om> wrote: =20
> > >
> > > I would prefer to keep only the scalar version of the fused copy+csum.
> > > It reads the data once instead of twice, and on real Armv9 hardware it
> > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > depending on the core (+6-8% throughput). It uses only general-purpose
> > > registers, so there is no FPSIMD state to save and it is safe in any
> > > context.
> > >
> > > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > > the scalar path only, and the KUnit fix for the x86 zero-length case
> > > Jakub reported.
> > > =20
> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation.
> > saeed =20

