Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524468;
	b=gwGvyOdhclbLIKxJfxY0tTXJjJA1Fmkih/Advha4bymuNfg7yS6Thkaxpse0AGpl1nq4
	 sWMwS9abcggv4Uc43R7dL3yu1hshxMOrEt3VAF2QibuZSqyBaQiv3Y3QqEVpSPWGst5OO
	 +D568AH490LVmk1IZgun1l3jSNHKPW6DgZKL9WC5y4Zjck+LjPtf2qybK2aIu2B/Pts+C
	 G5heE4q65oyUPI7JO2YcbdeF3Py4Cwrj0YiNnwwZHRg+kmqfde6k+kObGXlEdTyBK5DCG
	 GE9W93Pz3wBtNRdUTrnBPWk/dKbwSAiEfEV/spT294sNhk0FLbcEUeH0xdd+VBYNukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/TWt3YlpVeuXR4oSjIHHS1PhYu7Tj44EsQ+nSN9oMos=;
	b=l8VNSdJqbJzSwLPYEaWkH3Q3YKxy8xj8IczWNkn0UVmGfvsZ9a/dYEDbyoRzB5qmb/PQ
	 TOBZWNCBXoIQan5O4/FJvKoJ4u5wSchpYibewHgjN3iwYDFMRTRZjDmQoJI7bUOOw7uSQ
	 kr00rugL/oLKa1Bl/wOcHOonDlsrD25kfCOanPBTqkBfQE/zUBiuacksBW0HEOL5ZPs+n
	 mlG9pcl4urHPNloC7v2+X35NuUrWq1U0syhDNsxmoR8ToLfH+PCe89kEi62euVKXfYkBN
	 hT4KyTNJolhdC6BIMCeiosnA8jF0Q15oE61Bfnm1P+ygRs8BqSkft9UbVLnIFHpCXWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j+h6s1Pz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CAC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j+h6s1Pz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso36074585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792524466; x=1793129266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TWt3YlpVeuXR4oSjIHHS1PhYu7Tj44EsQ+nSN9oMos=;
        b=j+h6s1Pzp9AVjy8LfCILDfdN9HqdkiQDKOIE+gC7s4xu8h7ZpE5q9yUXsNRll/V7wH
         rYTPoz9JdhLnpZhHofY62Ldurv5DlVQk9UMx7HUrGAi5PXqH+tMG93VJu26eIf0ZdLpE
         Xcq9ASZgBC/WOCw3KJELRFz03euilK+lDDMfkI+i2snYYH/6AzZGRanLTi31nh+buifI
         N/PCMb51mer2rDbhdKq2eiPDWaLVDDXGlVKlDRX7JNNaIUVk4qdfVa+5JSXTX2AJ67ay
         PdhQ4fNtKBXanm/Ya6L+rfglQQ/V/2a+rXsOokxPDupk8VdPsfSBBwb6iJGd1seiA153
         BnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524466; x=1793129266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TWt3YlpVeuXR4oSjIHHS1PhYu7Tj44EsQ+nSN9oMos=;
        b=IoQXaXYZkGJo6JG6DNYJIp5iLj/qt+fDnd8OgjgiQlMQszKDuGYZwbSl3bmoKSy6ff
         75AoCw45gFEXe78naWl7bc2dSj5o+CugAmVc2IOjbK1V+EcUEcFsN2izlB78avfBO9rK
         GgKfQRf4vZ5p2rEqkTNVUtGQMzLqlM+KodZatuj1gdYJHK7GS25Uv7f+R6z8AiFUG+Ie
         gJS0vnRFTdJUeRXhsAa7FZIU7kPCXrxFrviYq+uitapF2n1vVSXy62d1ZeDI3glnNM69
         27Xk/+u9OCeqYiIftIKyfUdGoZ2TwPYfSU7XkQ7QxyFHV4ASIJzvXQnq4vdojxlZJiAR
         wQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBzIs57SWFhI6/mJJZ+iwm8DmjCohcbP73h3bQQnJbf8QOscMOC9nJwt9bdxdngvRooUo23s57Yhj/Ko+0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1XdcXl9rUpUlHw3S1ab2mOd3B9/6q42gsPAtWp7cOuHVYz5xl
	VeazKzJA14dJglA8JAyJhLUknDc+Ee8t0E8WKe1AlgZ4CyJeYttvMFxxziNHiNMq
X-Gm-Gg: AYBFou2G2oDdTKzfE+TfEdnsN1YLIAb7tyyZLe27h8URAgY4GmNnkhH4tZMH7JNwOoy
	DITKOHbjhrInYyZ2Hi8R8vet6lHvmESGNddJIabHvrEn5CHYJjozp4cJamwRo6Ve/1CLAAARqgn
	6CiKauU7F2tnkZLUWvqcVwIbEVY3iACXSqb9fwB3U4kaDI+YHuFmrRNez1GvIpyaM6MMKEQIR06
	nh4+whIgATZlX+DeoxpH5S9bOTLcBaRo2Blor1UMala+phJICHotG0rEWk8pOTwVfWEwpek7rK4
	WJHbUnSXLvbZ/JyIn0gGoUKl4FqDk1OPYZTMJEKv2p+yuBcSAJVZCtA6lmvJJWSvy3FhM1TG3HE
	Og2S8oXT6WR6jjBcGkKrxJJL6kC4DyjR7KO/UYUIwr5rnK7A+nb0m8WbR5Tize+ootL0Mm9eN1P
	qIA/rJx29weeibx78ERjUR526wGGoQdKWNvbtfHycNjH/SJR6r24uRCLofCW6pUaRl+AsRzx+b4
	6jqD7qXp5yHcjv70Y2QwsaVcu/si+2eesPV9GJzzzIfX1E=
X-Received: by 2002:a05:600c:a411:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a1f3775ec2mr58315675e9.34.1792524465947;
        Tue, 20 Oct 2026 12:27:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc119cdesm8779635e9.2.2026.10.20.12.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:27:45 -0700 (PDT)
Date: Tue, 20 Oct 2026 20:27:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Stefan Kerkmann
 <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy
 Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers
 <ebiggers@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020202744.55c52a49@pumpkin>
In-Reply-To: <CAP-5=fXQxGBYnCKbGpxvtaQxxhju2UXgzn1vy-8rcoNVOvSqyw@mail.gmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
	<20251016205126.2882625-3-irogers@google.com>
	<47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
	<20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
	<2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
	<CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
	<b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
	<CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
	<20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
	<CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
	<18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
	<CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
	<c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
	<CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
	<fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
	<CAP-5=fXQxGBYnCKbGpxvtaQxxhju2UXgzn1vy-8rcoNVOvSqyw@mail.gmail.com>
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

On Tue, 20 Oct 2026 09:21:47 -0700
Ian Rogers <irogers@google.com> wrote:

> On Mon, Oct 19, 2026 at 3:05=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Mon, Oct 19, 2026, at 23:14, Ian Rogers wrote: =20
> > > On Mon, Oct 19, 2026 at 2:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote: =20
> > >> On Mon, Oct 19, 2026, at 19:04, Ian Rogers wrote: =20
> > >
> > > Is there a reason that the compiler's instruction selection can't make
> > > the same decision for the memcpy case as the __packed case? We can
> > > work around the compiler bug with a config option.
> > > The intent with using __builtin_memcpy, as opposed to memcpy, is to
> > > avoid a library call. =20
> >
> > As far as I understand, the only difference between calling
> > __builtin_memcpy() and memcpy() is the need for a prototype
> > for the latter, I would expect the compiler to behave the exact
> > same for for both otherwise. Whether any of the string.h functions
> > are replaced by an inline alternative is a complex optimizer
> > decision, not something you can enforce by calling the function
> > by one name rather than the other. =20
>=20
> So to repeat, relying on __packed and assuming __packed won't be
> lowered to a memcpy(), memset(), etc. call by the compiler is false.
> Both GCC and Clang lower __packed accesses and assignments to
> out-of-line memcpy()/memset() calls in a variety of cases on
> -mno-unaligned-access targets:
>=20
> https://godbolt.org/z/qKWv6Gdav
>=20
> Using the __packed definitions of get_unaligned() and put_unaligned():
>=20
>     #define __get_unaligned_t(type, ptr) ({                        \
>         const struct { type x; } __packed *__get_pptr =3D
> (typeof(__get_pptr))(ptr); \
>         __get_pptr->x;                                \
>     })
>=20
>     #define __put_unaligned_t(type, val, ptr) do {                    \
>         struct { type x; } __packed *__put_pptr =3D
> (typeof(__put_pptr))(ptr);    \
>         __put_pptr->x =3D (val);                            \
>     } while (0)
>=20
> 1. 4-byte aggregate with __packed put_unaligned():
>=20
>     struct s4 { short a, b; };
>     void put_s4(struct s4 *p, struct s4 v)
>     {
>         put_unaligned(v, p);
>     }
>=20
> Even though struct s4 is 4 bytes and passed in a single register (r1),
> GCC with -O2 -mno-unaligned-access spills r1 to the stack and calls
> memcpy() for 4 bytes:
>=20
>     put_s4:
>         str    lr, [sp, #-4]!
>         mov    r2, #4
>         sub    sp, sp, #12
>         str    r1, [sp, #4]
>         add    r1, sp, r2
>         bl    memcpy
>         add    sp, sp, #12
>         ldr    pc, [sp], #4
>=20
> 2. Copying a 4-byte __packed struct containing a single int:
>=20
>     struct packed_int { int x; } __packed;
>     void copy_packed_int(struct packed_int *dst, const struct packed_int =
*src)
>     {
>         *dst =3D *src;
>     }
>=20
> Clang's frontend lowers *dst =3D *src directly to @llvm.memcpy(...,
> align 1), and GCC with -O2 -mno-unaligned-access emits an out-of-line
> call to memcpy(..., 4) (as does riscv64-linux-gnu-gcc -Os).
>=20
> 3. struct debug_entry __packed (from tools/perf/util/jitdump.h):
>=20
>     struct debug_entry {
>         unsigned long long addr;
>         int lineno;
>         int discrim;
>     } __packed;
>=20
>     struct debug_entry get_entry(const void *p)
>     {
>         return get_unaligned((const struct debug_entry *)p);
>     }
>=20
>     void copy_entry(struct debug_entry *dst, const struct debug_entry *sr=
c)
>     {
>         *dst =3D *src;
>     }
>=20
> Whether accessed via the __packed get_unaligned() macro or via direct
> assignment on a __packed struct, both GCC and Clang emit memcpy()
> calls. In fact, with the __packed statement-expression macro, GCC
> emits two back-to-back memcpy() calls in get_entry() (one into the
> statement expression temporary on the stack, and a second from the
> stack into the return slot).
>=20
> 4. Loops of scalar int __packed get_unaligned() / put_unaligned():
>=20
>     void copy_8_ints(int * restrict dst, const int * restrict src)
>     {
>         for (int i =3D 0; i < 8; i++)
>             put_unaligned(get_unaligned(&src[i]), &dst[i]);
>     }
>=20
> Even for a scalar int, loop idiom recognition in both GCC and Clang at
> -O2 turns the __packed loads/stores into a call to memcpy(dst, src,
> 32).
>=20
> 5. Adjacent scalar __packed zero stores promoted to memset():
>=20
>     void zero_2_u64(long long *dst)
>     {
>         put_unaligned(0LL, &dst[0]);
>         put_unaligned(0LL, &dst[1]);
>     }
>=20
> Even in straight-line code without a loop, Clang's MemCpyOpt merges
> two adjacent 64-bit (or four 32-bit) __packed zero stores into
> @llvm.memset(..., align 1), which lowers under -O2
> -mno-unaligned-access to an out-of-line memset() call:
>=20
>     zero_2_u64:
>         mov    r1, #0
>         mov    r2, #16
>         b    memset
>=20
> On the Kconfig patch, I have updated v2 so
> CONFIG_VDSO_UNALIGNED_PACKED defaults to
> !HAVE_EFFICIENT_UNALIGNED_ACCESS to cover all strict-alignment targets
> rather than just CPU_32v5.
>=20
> I continue to think that:
>=20
> 1) given __packed implicitly can be turned into a memcpy, it is no
> better than a memcpy;

I suspect it happens less often with __packed.
You can probably add volatile to stop the other merging.

It really might be necessary to give up on the C versions and use asm()
(at least for the unaligned access case).

David

> 2) the __builtin_memcpy for efficient unaligned targets avoids type
> punning, is more intention revealing, is clearer for compiler writers,
> and is what compiler writers tell me they want.
>=20
> That said, the code with a __packed or with a memcpy can be made to
> work, optimized, etc. I'd like to be pragmatic and address Stefan and
> Marc's problem so a revert works, I just think we can try to do a
> little better.
>=20
> Thanks,
> Ian
>=20

