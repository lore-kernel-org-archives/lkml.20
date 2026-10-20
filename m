Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513321;
	b=mgbWdVOA6L779sCwyr4m0b/OZX76x5awzHTOco4TwwT8XRjk3PcccZS9mIdToXJYU00X
	 KMWObC7FutNzht3/ZNsixieX8eu/gg5DeA2gt8Oxb4jIq9olpXXsYIeIoQLcoKmDkwcRi
	 k/PTtLYr5rDniRII+q/qv4GTfLjDEvSD5r7c/ZiN/mQW3dkNgd8NQGl2b/NsoF4AIrbQp
	 CT6cHDXBgu60mkshEKbqJf78Q0msAZUgFlXE54L8wxYVP9oPGbtkkPjdViq+mCLxUqmpF
	 GZMizP9bwR5DB9BTB3uU2Z/pY7RQv0/Uo1pKWPFVO8PpAc3L8+BFNSHmLMd4kjSfLXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d67AMHTyGTOTygwWSrxw6jOWXdmvbu/aZOOwvvMFn6Y=;
	b=2TV6VRQWNB8iV/9iFWrW3C3Ylx3E0zdvWOLej2htOE9ajvtB58sSiqycyveXTLZfG3H8
	 Yds/l90Yu0hEoyt7Iy+irelwUVughDIsSOph+R6JC29hdQbbFJt8tVM73kFyxE//BQrME
	 0tgYjQrh1HvebRK7aUitBnkiVFp2IisxfZOj2H9hwTdrYMBlqMURhhy3hJbJUC0OqfJUe
	 NUPofNtihLRtC0v9v8TGcor/vE5JkGbRbi1cBzpwBnGLSogn25CRKLLDtwiS+gZVjF5Ws
	 PwUZyoZwqjYj+2uaAeXV/h8/AL2K2uFawQH1dGjmhBgf5a8yc1rLOBZaL9hiNzHPmlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uZZR3HCj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49988606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49988606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uZZR3HCj
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so405801cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513320; cv=none;
        d=google.com; s=arc-20260327;
        b=Am32NTZHblTPk1NvAtf1K9uViykYf+opdeYDOk89mvCtM6avr8D4PvzHNIcWdN9TND
         vOqA787z9hyQmNPMr7TnbI9tXssEmBqyGbB4Mpk5AtIkOrVIJTqwnjNfBbWRQ8guU30j
         CiplLo2OYsXaJoedrlWtzZ4O890L3Byajfr/uuG/1PS+6LXgsyTGxlpij0dhCZbQEA+n
         Fv943HrkAcdekoo0/kTV84RGCq2R3YK81RtjFt8cKbeKanUjanCZuaQ91Mblwj23PLnl
         2ycXdOR7j4TQ8j9D6C9dD1OwO8BBy3zB5VA58N1BBeUNnwfFfmD2/BEzOQmPey8sk2Rq
         fp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d67AMHTyGTOTygwWSrxw6jOWXdmvbu/aZOOwvvMFn6Y=;
        fh=Fk337agYSSjUIDU5/47ktDFCpQNJNS/SeznGEhD95YE=;
        b=N8YuhA4ZJvB1qgnWt74SMg/+yKeiyPnd5Oyd2RSdG/vBSsULW3MFcOuXnfaWtLCWAJ
         1mvbvdNFxl6pgqpKIL17GB7t+rv2s4/irsasvZek5ihCZRzaRNkYgsmLoTzDxnwjvm+M
         IIzllHg8USX+BpZNpK9itH6allDhMDqSY6hNWtwRXDqvtDXMPBhnUOfhWqb2GEysgsrv
         COCLCOXC1hp4FwLKTPklWeYgl5Nvhuj0rKa4a93G+wxPjLhR4/XR6CfrFLiuCxm7CSqF
         40dHVKWmZYKnpsyZakMQ1q5p9zFmjgB1h0pPItfbh7Wwj/DFbux670vxadV16+6nVhq8
         +z2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792513320; x=1793118120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d67AMHTyGTOTygwWSrxw6jOWXdmvbu/aZOOwvvMFn6Y=;
        b=uZZR3HCjAokIAVmbF7T20H9yedR3wTDyMO6I81V9BECzJU1SAJaZ6RNTk66euafSlO
         5t8jmrLgn1e6wFchbNt4RWChUchrkyjQLn0Qxi1GU8UW2fE6s+kte2WIi6tEQnj6aW+3
         DuaAX4EieK+Z4g1rjya+fpyEyICiNiOxOwJJ4EhmdkrG/9jOAKAPdaK5cLDj5eeXXKqm
         LOsGKkqnvoQRQ80hmszHADCan731n7RAs3IG8IDj+BPAAYE4bybYUGnDo9zjrLzK9oU+
         Aq4e7kApO+R19YU2RNjmHKsNeGtsJ505+3PlK5vXL/rAFRgfKIpaS9/0jTyAVvG6GO9g
         gJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513320; x=1793118120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d67AMHTyGTOTygwWSrxw6jOWXdmvbu/aZOOwvvMFn6Y=;
        b=gKkfNM1UcUimZm7IaZ7wCM06BEU9tUX73RFnCtP+Nd3Uh//fDHK5aOl0oA4DTLC1+g
         ElEuijXIeHm0Dcxr56zA0p5Lzb2LHtCMidSLkLhpaFzPrcPswOThP8fPTyBVZz1T4YmQ
         F2/EoE25l3TcGCLPvJiZfUylE44VhhyZvynztBFOYYY7oJsu1YFa/t7zgeiK3d+acyaz
         SapK4k44rSH5nZiTVgQs0NPTkIqYsBOOHIR2LdBAIqdnzHjAWBl/Ab0hu4vx+KDcrc0x
         kHPrhLNb8RZS6cJTLoGXSrDUdyBcg7YJkuAIG2D3EKZey7E2qmtIpxK/zWtYo+aBhmbN
         I5VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzurU9A0XaA7vkNfcpRyq8gFRdHmNdd+kngESo/t3nEL3g6av8oRd7e+CP6Za3+KABn9rK1I+Q36biPbPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa1a5auEbIdvRlYQGLxZfEMNZVRCug92Kf/PogsOF0NT4TDzVT
	rUS4AcN7702NN8Xy3pq6GYqn1pgZf3b7oHCpqmoFI7Q9aKmBtP6k3MTZTn6+nI8qSXSNFS8PRmm
	2RhL3WHsICGqQXoYi5PAPAiM91Us0q2LjaI2m0DYM
X-Gm-Gg: AYBFou1QxsmpxamGZJjG+F1pK7Iwmpwr/ZJj5dkpkpa53sOgYHz/bxd3W+U+f3uvhse
	Vo3WEqy/M9PkqEggKhYlVEWI99qXiwTM64QY4+EG9DeCEdmyv0GK+gndyKtzp54PWjGaALwMppD
	hoVqwzDs+aQ+7CKJl69P846hfJok2Op+kN+GPRqyzdnkj7CubZiUBPGDM+aEJklLRKvucbX6aDp
	zKXBPhlRUS4WDCUbiYDk65XJBBS4XMIJNK2i3yDHnxlu/OZOWeGdM8iQaS8E8EuOeeb+DkCr4ZL
	vb8PyUvFoy9J5hdSAoa0wvnetj4pcceZxht94ffGUU/5SyNMyx0L9N5dRAl05VfqsdeezQSGNtX
	3roYlpDDgpxLKQyLIQIuQkc0Q6nHWBr2aKFGewlp/PLbiJDcoTi7ioLbWFDpcpG+iHklTHUY7Tg
	pRdPLhD78aX4Ce
X-Received: by 2002:a05:622a:1820:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-53688244eb4mr17593181cf.0.1792513319526; Tue, 20 Oct 2026
 09:21:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
 <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com> <CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
 <c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com> <CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
 <fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
In-Reply-To: <fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 09:21:47 -0700
X-Gm-Features: AclHuK_poPJ7lOiU43_hXCpiT627HUzJHyCXiMLr5dkiKBBRyrbuXEGygL04P0M
Message-ID: <CAP-5=fXQxGBYnCKbGpxvtaQxxhju2UXgzn1vy-8rcoNVOvSqyw@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:05=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 19, 2026, at 23:14, Ian Rogers wrote:
> > On Mon, Oct 19, 2026 at 2:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Mon, Oct 19, 2026, at 19:04, Ian Rogers wrote:
> >
> > Is there a reason that the compiler's instruction selection can't make
> > the same decision for the memcpy case as the __packed case? We can
> > work around the compiler bug with a config option.
> > The intent with using __builtin_memcpy, as opposed to memcpy, is to
> > avoid a library call.
>
> As far as I understand, the only difference between calling
> __builtin_memcpy() and memcpy() is the need for a prototype
> for the latter, I would expect the compiler to behave the exact
> same for for both otherwise. Whether any of the string.h functions
> are replaced by an inline alternative is a complex optimizer
> decision, not something you can enforce by calling the function
> by one name rather than the other.

So to repeat, relying on __packed and assuming __packed won't be
lowered to a memcpy(), memset(), etc. call by the compiler is false.
Both GCC and Clang lower __packed accesses and assignments to
out-of-line memcpy()/memset() calls in a variety of cases on
-mno-unaligned-access targets:

https://godbolt.org/z/qKWv6Gdav

Using the __packed definitions of get_unaligned() and put_unaligned():

    #define __get_unaligned_t(type, ptr) ({                        \
        const struct { type x; } __packed *__get_pptr =3D
(typeof(__get_pptr))(ptr); \
        __get_pptr->x;                                \
    })

    #define __put_unaligned_t(type, val, ptr) do {                    \
        struct { type x; } __packed *__put_pptr =3D
(typeof(__put_pptr))(ptr);    \
        __put_pptr->x =3D (val);                            \
    } while (0)

1. 4-byte aggregate with __packed put_unaligned():

    struct s4 { short a, b; };
    void put_s4(struct s4 *p, struct s4 v)
    {
        put_unaligned(v, p);
    }

Even though struct s4 is 4 bytes and passed in a single register (r1),
GCC with -O2 -mno-unaligned-access spills r1 to the stack and calls
memcpy() for 4 bytes:

    put_s4:
        str    lr, [sp, #-4]!
        mov    r2, #4
        sub    sp, sp, #12
        str    r1, [sp, #4]
        add    r1, sp, r2
        bl    memcpy
        add    sp, sp, #12
        ldr    pc, [sp], #4

2. Copying a 4-byte __packed struct containing a single int:

    struct packed_int { int x; } __packed;
    void copy_packed_int(struct packed_int *dst, const struct packed_int *s=
rc)
    {
        *dst =3D *src;
    }

Clang's frontend lowers *dst =3D *src directly to @llvm.memcpy(...,
align 1), and GCC with -O2 -mno-unaligned-access emits an out-of-line
call to memcpy(..., 4) (as does riscv64-linux-gnu-gcc -Os).

3. struct debug_entry __packed (from tools/perf/util/jitdump.h):

    struct debug_entry {
        unsigned long long addr;
        int lineno;
        int discrim;
    } __packed;

    struct debug_entry get_entry(const void *p)
    {
        return get_unaligned((const struct debug_entry *)p);
    }

    void copy_entry(struct debug_entry *dst, const struct debug_entry *src)
    {
        *dst =3D *src;
    }

Whether accessed via the __packed get_unaligned() macro or via direct
assignment on a __packed struct, both GCC and Clang emit memcpy()
calls. In fact, with the __packed statement-expression macro, GCC
emits two back-to-back memcpy() calls in get_entry() (one into the
statement expression temporary on the stack, and a second from the
stack into the return slot).

4. Loops of scalar int __packed get_unaligned() / put_unaligned():

    void copy_8_ints(int * restrict dst, const int * restrict src)
    {
        for (int i =3D 0; i < 8; i++)
            put_unaligned(get_unaligned(&src[i]), &dst[i]);
    }

Even for a scalar int, loop idiom recognition in both GCC and Clang at
-O2 turns the __packed loads/stores into a call to memcpy(dst, src,
32).

5. Adjacent scalar __packed zero stores promoted to memset():

    void zero_2_u64(long long *dst)
    {
        put_unaligned(0LL, &dst[0]);
        put_unaligned(0LL, &dst[1]);
    }

Even in straight-line code without a loop, Clang's MemCpyOpt merges
two adjacent 64-bit (or four 32-bit) __packed zero stores into
@llvm.memset(..., align 1), which lowers under -O2
-mno-unaligned-access to an out-of-line memset() call:

    zero_2_u64:
        mov    r1, #0
        mov    r2, #16
        b    memset

On the Kconfig patch, I have updated v2 so
CONFIG_VDSO_UNALIGNED_PACKED defaults to
!HAVE_EFFICIENT_UNALIGNED_ACCESS to cover all strict-alignment targets
rather than just CPU_32v5.

I continue to think that:

1) given __packed implicitly can be turned into a memcpy, it is no
better than a memcpy;
2) the __builtin_memcpy for efficient unaligned targets avoids type
punning, is more intention revealing, is clearer for compiler writers,
and is what compiler writers tell me they want.

That said, the code with a __packed or with a memcpy can be made to
work, optimized, etc. I'd like to be pragmatic and address Stefan and
Marc's problem so a revert works, I just think we can try to do a
little better.

Thanks,
Ian
