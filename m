Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649078;
	b=5JZ2Dk+ZM4Ly1E13CZfX4EPI7ThjGmIX8hNpUqRYaVymfbzG6A8AfukDjH+kQjj6gQvs
	 AJvPmOlmPn/bmCWb4Fcrd4ZpOIO7O/6yCo+L62XXyhrbc7Ww4z3DO61j9vZTEOETYmjfX
	 XPeqEYiOVklHGcilPOy1/2LONnvmiAkcWicD2ss5r6PoDJ7u2BIaI6h2PoPQmEhGe434u
	 +lJQ8Am7DiI4LEKbi6/W+dxIZTPVJm1Mj+2TWZ9ca6U+oJdcgithFE66t9XDcAcfh0sdf
	 +iMSgcsJDwwNczUgHlKxN1BBpQ2yuAuTeak7IiupujOnRdpEKX+8aM9QrPTnD/GdWsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
	b=Hqm+vOqdnvzKUOiQsGDVarWBbVnocwSqNFOZAwDQmAvt3M61wXhwH7Dxfiy1GJRShtsQ
	 qyaLdp/a41jKRN/nsZHxWTAJzFcIfATYYnuH2Lk5C/9Z/Tg8H1VdVErxRcsUgP+tIUkCY
	 CTmcsqLnw9vwdpeWQ5ZX79l0OEz9lViZ4PwWFKMcUWtH6rTQUK0O2HLytjo+8VCZa/BxJ
	 SP9FWWWhi6zuMzSx7WKG6dNNhtMsATG0/Iq/ts/iAAfvYYzkKuSXzXujzziKMv00NkQ66
	 QrWaMqVEb1WlE8MMskkBdR/lorAN633iMYGLe4w9X96nnq5vlTX0GgCr/1byYWnIoXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIGnOxmk;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3526606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3526606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIGnOxmk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so26339645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649076; x=1794253876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
        b=NIGnOxmkb+2jVAnNLME39LE7KIlW1GaiH4Rrdx5uqLkEcAaH9DzFx+rYMBKWXzYSQc
         8sRbdYfKxcWxwDzIs9jSt/F5IxwFLcxErC1SR5p0DF+Qmvf1CKupro+xB7z9G5zVRqbh
         Pjm9BEeH1jTjqRrvDV6yhB2SYikroDWOPQsTSXJ35OP+j5gygP0noHNUi/Qy4wI7DTjR
         R7DEpE15OIrxnSiWcpYB3lsIk6W20kNmOwRU0YmQaO6XHSv9XjHUYP+YT9leL0izu0qX
         BnB0hZUQ/f86g3wntxIjUX7lMcF4EcwVfeZNJGyIFSzL/oIrsEA+UFh+Jkn44W4io5Fl
         c8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649076; x=1794253876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
        b=uBpKz+0c4VDfaowQ2PpkJQezQxWCHXwYnyXCC8LquKYttvO3/SZ3FNbvA+Uz/DZm0+
         zW66VtGZcQNVpSdzji2fRlNAT3F50dpr3QiCtD9W0rH37De7LqyYRm8bmY8hg4RWbbEz
         rWFgKRkgd4ngs3/+Ji38/wjOuHRKSwgHzDHuVxCqffBpKRDq9h6AXrOhtGUsj+ZHAjKY
         AhoZCSd48qTtjV7JH/Yrrc6Fx3eU9kjUvdzEUgBUjDq7/g/l2ocq/LwkvHpXK/vaVKeZ
         KXcNiZ6ETNa5CYhFKA0TVpDK4Ufjql48y3Owx/NZe4sieOQbPAjIBM9vUgccxCP6UqLG
         PThw==
X-Forwarded-Encrypted: i=1; AKwUvBwDWljWN856GLXlHZHjlM7w1Z5GXOduRX/gXyG9SrAXIGddrh1DXmQX6/kc81CTAdviUGfuH0J9ATRG2qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJnvahEFJR4GpP9UW/IoYRcy38Am9R4Gac9ZkD4AYAXnJ1sRTS
	lCh2C/CNXjOla1zVt9mJUmE1S2Uvcw5GyiWKSISdS9XvWLz1gMX1uBNSVWv1fee0
X-Gm-Gg: AYBFou0Otg5E9zgFKCMaNOWFahGrW7M8gtWsN5nwle8s/IGI3Jk0XSv97hQ90K58LWQ
	8vCk7TTQtZ+oV9kC8OfmNguXNXzBqriFxny97dLMJ/ACmQG4E0lY5yaaN9mimway5mZfR+24Huj
	UDABgHgf/GaC+carcKgXJVOp77INMJdn2p3K9nKFX2cd4Zbyhk00hvDQdOM45nVB6o6yZDs6b37
	gDbjOctosq3Vm+ycigW/YVibfGnCw8XiVncHT+0AwuHX1ssX5tIA2e6BermQrXA2jIpITEOVIZW
	H3MH22sRYX7m4Np4UhjBXWaglSEE65wEgOMsrrNU0kwwKOoHAPpcDtAo1/SjFDu5wTXtJJyK3M+
	4/Dny7JtiEWB/CksnV0ZW9qPBmzg5yHq81wBwbWUeX62aNbRZqHpkNs9wx2eSUiqCv9RPxdtoaY
	V9L9086Dlof2ddYLk5aj4QNmglbX3WC8jlLoa3Cx9iVaw2nNLqNerOGtIH7slP12HN8LYyhaIQu
	6jgc/yPNNkMK07pHo1uk48U7m9rUw6Gfn3IUqD3qoCXvN8rRsYl0EHf74w+dTZxuv6dWv1UewZx
	Qu2t+fKNxo4JGHeiP/BFgOtTlbI0cxwNegMLhtX3Kml10vnBo7Hn+M6Vruvis6hZ
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr153755035e9.24.1793649076120;
        Mon, 02 Nov 2026 11:51:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm8659825e9.8.2026.11.02.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:51:15 -0800 (PST)
Date: Mon, 2 Nov 2026 19:51:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <20261102195114.742df19b@pumpkin>
In-Reply-To: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
	<20261102094716.2c8b1cdd@pumpkin>
	<CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
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

On Mon, 2 Nov 2026 10:20:35 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 2 Nov 2026 at 01:47, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > An alternative would be:
> >         ((key) * (u64)(size)) >> 32
> > which avoids the division when size isn't a constant power of 2.  
> 
> That's certainly cleaner
> 
> Not that it should matter - afaik the size is always a constant (it
> comes from 'sizeof()'), and I would actually prefer it if
> HASHTABLE_DECLARE and HASHTABLE_DEFINE took the number of *bits* (like
> DECLARE_HASHTABLE() does for the kernel proper), and we'd just make it
> a rule that it's always a power-of-2.
> 
> It already *is* always a power-of-two, and the old code used to make
> it a slow modulus operation if it wasn't.

Ah yes, some people think hash tables need to have a prime size.
Do not doubt the sanity of the person who decided that the elf symbol
hash table size would be (IIRC) 'the prime number below the power of
2 below the number of symbols' - this makes every hash list have ~1.5
symbols so you pretty much always have to do name compares on every
shared library that gets loaded with a program in order to find a
symbol that is in libc.
I remember significantly speeding up loading of mozilla by rewriting
the elf interpreter to generate a merged symbol table for all those
libraries - no idea what the one the Linux uses does.

With a reasonable hash function (or even the crap and slow to calculate
one elf uses) a power of two sized table works just as well.

> I'd also worry a tiny bit about what the compilers do on 32-bit
> targets, although obviously hopefully (a) they'd optimize it to the
> right 32-bit code rather than do 64-bit ops and (b) it's not like we
> seriously care about 32-bit host builds anyway.

They'll probably zero-pad both sides to 64 bit and do all four multiplies.
But that isn't so bad on most systems.
At least the 32bit shift is cheap!

But yes, you are going to have trouble with a lot of builds on 32bit hosts.
objtool sat for minutes (long enough for me to think it might be stuck)
with an RSS of ~30GB on a recent build (ok it was allyesconfig - I wanted
the symbol table) - but I suspect it will hit 3GB on a reasonable kernel.

David

> 
>              Linus

