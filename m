Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830733;
	b=0OCA2UQoYgC5/RzyRDXk4HDsbXErRkU1O1N8CWiM2raGuUfnPqAFPMvMVxHA9jepqX1Q
	 k+rzhaAdqEYuEqAUbzbQUkRHkJiPcQU8S3OKS75LFTNkz61UgoiLzWe7eJdZ7vJqk6R8O
	 A2oCY/MKwmNR7fOEPDK/vXt6aB4gGxeutAJpHLFjdCwbuR+6jQzU7khIglGLqTIvzWdr1
	 ZLNT0wcPja6ycMvWfnHhenIWlIUJnsY/M/L6WRMfVnbwPkXr2Rz/XU4VNieuEC5xY+7EM
	 9z1gUKn7VAA62PEHij2xBTIyDsYzIYh+8ncjReHTtXFHREghawUn2I7qoXpcPN9Lahg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3e5wTqyNG5gGl5g2NVZElqeHpfWUg2RSrI9yhZqK4mQ=;
	b=0IEqLI+SLBqth1qzQ8rH+ZJpjg0jk7AGX+kJLSNpVC2avNfv8DK0QQt0d4+8KVrq+IO6
	 lVqV8j4bWWcjFrII3fbQnxswzRGzRKQN/lbmLohUXi4wYVVRqzPQteFWL+1g86RES9OJo
	 MtTXfBx2YrCuDyGMSPCpekhvic9RdOtwGlSaE9EKTnWyNqaBGAIYsjNVe8p6mE9crDZd4
	 i/4hHMUn89hlJCipkj0cRobsCGXscHECCSGSHmdTN42r0W8H26PJdwgmBnrvyrdtby6le
	 jDae4L1/I54wnCzXG9SJgLIgEqkdRwPSvy1KVZTPjDfMSVEqqLqw9JDYjZOJSfVstmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lw0aWJJp;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A88A606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A88A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lw0aWJJp
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10703985e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792830732; x=1793435532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3e5wTqyNG5gGl5g2NVZElqeHpfWUg2RSrI9yhZqK4mQ=;
        b=lw0aWJJpSAJSY2oELoukBHAw2g2gatPo64HcfcUqKO7PbG+KMOgojcMq8afebUsvqY
         +9ODGEf806WV6Tis3ceRZ0AGjFv2ugme0nS95nl0/R87/Y1JW4qq3QSefJ61q+4mJ03s
         dG5aShYRfWwA1dYorGlpmItOIfLTF0ceqbnOBCET+bx/qLJGrlzp7xSQdkoVURYj9IoW
         d0SNuEihEerPo3pRZhoqzNJGftO0F0mKAQgitQkHF16mNwTjHzLQz9pghHzru4PiuNFw
         yebEoObMmank+6g7dxyeyWyn797Ho0j/Y75b/I9jNEp9x/ApWkh+dazWIiNChchpHR9V
         94Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830732; x=1793435532;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3e5wTqyNG5gGl5g2NVZElqeHpfWUg2RSrI9yhZqK4mQ=;
        b=QwkN9KBldxDJp0ilEssrViAYjGmFNlJma1DadL00oNR04rlCzpwMhL4tZ1/OxlDaCJ
         Lo7NWhaWhZt8fCgLjoIvfxWLFPbOG/Dvm+a0kp40jdUeoQtynCrSr4ebr+9iOAWq9tqk
         5CVZAu6SQPLdDufrDCvwfiOjbXtmMLk78iprYdFhsrXARNzQg/aXxTZC6MmvmoiFyHTR
         vEn+UApQ5wUI8/zgG6DLt2RZvgKKcWDTWrpybE3st8LOT3vhwQ3oQ7yHVSmg1Iwni015
         nQAhvvzv/tR4MwZIGm9Lqe9CLPwIXlYV7oyi8KfjDbjbnJRiGjSC6Jt0aVl74V4GBH1r
         i2NA==
X-Forwarded-Encrypted: i=1; AKwUvBzUAXwms5yT5Con4fydwkVfnScVnEROkdxNq9p8AggiDgxV/0zGY/FXvPUGfyXTgwXgIVhtNlx+DgnyOjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC6QK/ACeWEiYJDvDodHpparJjxyjKQ46Wd4Pnk7vl3WAoqP/z
	umTDuFb2l8uXGC3GW34g1VO+eTnVhNMDrrsuyzqRJ1+aKWVJGhWNS6m6HQid/Rlv
X-Gm-Gg: AYBFou3otZZ6a5WvKOBgy6tbjPS4Wjd5otcGWGSdgQHI3owgTwIQYadEzZqYlf6bKRQ
	3JBE3pNWOmx29W2Jcosbd44Dx6zzFJWpiM3JW+PLlRoj2cdPEi3N4V6juCLl81Y0PrKajuV3GfE
	BHC+NQqAWtfiTpwj3kmj1o4r1wfrjjE2pUZ65tqRIlEs7LlCrCQrUdJ6n0PcEAWjSX/KcgXb/Fr
	KRZKE06Ghy9/HrxK83cXJpn9XkbLS2Zs7m0aFI5TaPpivdSO05iqepWPrzZlru9cOr2hQAqaAq6
	Io0L6RZUgD85OBx6Bz4kA4uAJSgXRznCuF9x/8XjDolLG2NQzsd3blnev4CnO0aue207KxJNnxk
	M8Riu/rX+vWl7izWfyGkJO7BZXfvb/zdpDOOXItYA8wP0tf5OvtYWxlP+V9Objs5yFHiQMjjDQj
	1B9+ZfT3v13sgmNk0Ny/AVxDurIVaJ0BqswEwf3pB6ECf1bZfJhiozNvvPq+X00fV9SiVAzqz/z
	eO8wuIjSVnvt/RKsejTuyMgpodjCoYqxjCijuYL0iE5FRMBjEqWhwu3WBc+dJXD0qGCprbWM5nX
	ULtckxVHo/YWVG+RGqCFMUMrSCsIHipq6HJAuQ==
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr19809545e9.12.1792830731571;
        Sat, 24 Oct 2026 01:32:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm2309302f8f.7.2026.10.24.01.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:32:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:32:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Ian Rogers" <irogers@google.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Arnaldo Carvalho de Melo" <acme@redhat.com>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>, "Marc Kleine-Budde"
 <mkl@pengutronix.de>, "Christophe Leroy" <chleroy@kernel.org>, "Helge
 Deller" <deller@gmx.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Eric
 Biggers" <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
Message-ID: <20261024093209.09367c73@pumpkin>
In-Reply-To: <9ad54286-4337-4022-8657-65e1ed86b6df@app.fastmail.com>
References: <20261020163210.742728-1-irogers@google.com>
	<20261020190718.6cba898b@pumpkin>
	<9ad54286-4337-4022-8657-65e1ed86b6df@app.fastmail.com>
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

On Fri, 23 Oct 2026 23:49:50 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Oct 20, 2026, at 20:07, David Laight wrote:
> > On Tue, 20 Oct 2026 09:32:09 -0700 Ian Rogers <irogers@google.com> wrote:  
> 
> >>  
> >>  #include <linux/compiler_types.h>
> >>  
> >> +#ifdef CONFIG_VDSO_UNALIGNED_PACKED
> >> +
> >> +#define __get_unaligned_t(type, ptr) ({							\
> >> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> >> +	__get_pptr->x;									\
> >> +})
> >> +
> >> +#define __put_unaligned_t(type, val, ptr) do {						\
> >> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> >> +	__put_pptr->x = (val);								\
> >> +} while (0)  
> >
> > I'm confused (easily done).
> > That code relies on strict alignment being disabled regardless of whether
> > misaligned accesses fault or not.
> >
> > So it is either always valid or always wrong.
> >
> > Additionally I think the compiler can sometimes track the alignment through
> > casts (although it didn't for a quick check I did earlier).  
> 
> This is the traditional way we have been doing the unaligned access
> in the kernel before the change. By annotating the structure as
> __packed, we tell the compiler that it cannot rely on alignment here,
> so it uses whatever method it knows to access unaligned data depending
> on the architecture and flags.

That relies on the compiler not tracking the alignment through the casts.
The only way the C language lets you get a 'foo *' pointer is taking the
address of a 'foo' data item so it must be aligned.
So even if you cast it to another type that alignment can be assumed.
I've seen crashes from memcpy() using word accesses when trying to
copy from a misaligned pointer into an aligned copy of the structure.
Now the current code must be avoiding that - but I think the compiler
can do it.

> The reason we need the struct here is that you cannot use __packed
> as a qualifier on a variable, only on a type or struct member.

I know all about that.
Somewhere it also says that you can only increase the alignment (I think
of a type), but you can definitely have a type for 'u64 with 32bit
alignment' and use it in a structure.

> 
> > Since having misaligned non-packed structures really doesn't work, the only
> > places these functions should be used is on u8[] buffers.
> > Pointers into those can (probably) be cast to packed structure types
> > without causing issues if strict aliasing is enabled.  
> 
> strict aliasing is thankfully never enabled in the kernel.
> 
> The cast is from a higher alignment to byte alignment, and that
> is always allowed unlike the reverse. Technically the only
> reason we ever need the get_unaligned() helpers is to work
> around pointers to objects that should exist because the
> ABI requires them to be aligned but the pointer instead
> came out of some byte stream or from taking a (non-__packed)
> pointer of a __packed struct member.

I think those ought to be found and marked packed.
I doubt any of them get used other than part of the byte stream.
That leaves the explicit get_unaligned_le32() used to pull 32bit
values from a byte stream (that isn't defined by a structure).

But we're probably arguing in basic agreement.  

> 
>      Arnd

