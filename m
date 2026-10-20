Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485368;
	b=gEFiouy/kMfzvwfaF+vIxPEjSLeR5gn077xJmC3E2sKaSe8CV7yTwQ8JDH6495a868r3
	 REP23LG6IIgwJOFD23ehK0vnsLgu+w0Gk2skV+kUAtKcOpjoG+rujLzEy/k+TuusQ+SQN
	 /oNJu/auGZeq9ETj/tdqWKq4f8PlaagN+KXTw9mlRxtKNrVIgdre65vKfCm5GvgXzSqeZ
	 aSgfxpHg2M6cmhRm1K1nUaC53lbrhpPSy9gNzDl6D4ADbOhIvRimWKDFxrfy1cy9KWQIP
	 bzI4uWtqTUbkgw3opsFeY5pTy7mqELhjiXe0X9yfFpFquODzrfoMZv8xhPuOHfBGE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g7ps3zGn8OLAF7lPgMJ7MKFZ8AlgIpWWo0Niz22K4DI=;
	b=4Kv7bnEBdicmrPl1OaAYHA5QXR97SNmkWhvjCVV2EsRBCpj3dk+CFpJgUmR+G8g55dXs
	 H4Nwl2qStMs3X7TJbp5Sh8XcDSeUSPi30OcVSpkyjWaNyZ9OpWqzaMInrFmlV8Lby6uOL
	 jPVyZCa1YRyCw6HrPRVXo2p3e9pgGJUpBMrI/BxHjx7fXb58CHU0Yugjg8O1uqT86Z04C
	 kX2WkLlIgxvA6jLFaHapQaIOc0TrzdgT3Dah2jK/cfZNL743+mGLOxes80inFeWNntu64
	 Fe/lEaF3bc2BHDKyi0judN55osMSbh1kgNnGDEyRaN9UyWiyWm1gxp17VTldVUzmv6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOVgfKFI;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD5E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOVgfKFI
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso287006f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792485366; x=1793090166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7ps3zGn8OLAF7lPgMJ7MKFZ8AlgIpWWo0Niz22K4DI=;
        b=WOVgfKFIeMhLkSQ89iOREKUhaTsMPtY2BQqZucVjrLI0JKf6o2dkBJ9qcCqJQUUTFv
         xy21PS7CFEXYAAsmi+gfcvTCnF1LZ4Ap3KUHY6c06ygKdBiR2lZWCPkywuxvjZD+LNCZ
         mTdBgrbFKqm9ZbZxIzcD6aO+F4f0mKHfDHFTqNAHYud4U6qXAaKPLub9ExF7tuHHqu2Z
         kCbL7msj7Nf1aJWUPg3LYcDXB/H1Rh4yWybIXK/zfSd+dm7/OQV5JDVv0WgfR3MS88Zg
         q8TbrtNzwo3z3XeJ52adZd8P73ldSxeQ806iDKN4UOUKooiQLJ/BJhSeQeqyygs5/x0G
         zWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485366; x=1793090166;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7ps3zGn8OLAF7lPgMJ7MKFZ8AlgIpWWo0Niz22K4DI=;
        b=GRR1aLPSE1a6zUILl3hlwJEveWU3m+XI2fDSSW9oh8WBu97FnX8fdaOwq0tCtHfJh+
         kB5ZenBEhDa9vpLc7NJi+peDyLJzB9YRpvfRJcX8DRi6QMUXQzsC1aHDauBrB+HbeBGe
         +ymSNPt4xbsC9GWaMdUrOAc8gH7e/gTU1KNkESU1oVkjT2sISQZwa1sOm4pxJrG9zYys
         zAY8Rjnz0drtKQgEM7ljhCpQj97l4kH+Jbcmsoeujt33UzfrqCqbtVkLwjM9I2h3u0IZ
         x4UwXPyprzknlNZn3dJCHgec4Idh/WU2Axdyo00emrImeqfjS4PgG0jgDWiDQlmm8i7p
         k3vA==
X-Forwarded-Encrypted: i=1; AKwUvBximMREMvd5O8hcooJ9Pb2syivbMDRjWYYb3sgGD065kE+h4gjOcuyh2/waV0rMuyiQ/GVE9BLkMBPq8aY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmqfmprxxhLlJna24xSoHQu9mCTa8fuNfGU5EEX/FWqX+l5Nb3
	09MTkoziNB8T1lfORhpd5OyKx4muKlHk4SBdU8zjCmQY2VhRxNrGzc4A
X-Gm-Gg: AYBFou10Q/wWqhxTgU3U93jIy6q13YP3DcLt4pf27futgsEMPy+O2NvySRwNMdtmSus
	oMzf4TV1RyQJoXv85bC4jZlAGVKt6d7JMxEvhgBg64C3FL9vQnS9NcXUZjEwlHX265eSw00yCeD
	994ekYId4N4Nk5yS6/3QF1pEmqxp8cD7l2cZmlYE4uGtTREPbG5qlD3qpSWUL3+2ftneP5+/+LK
	U2YyaixlGjXtEG8+7gy6Zaif228KCnGuXqLvFa08L8E/XXIdzg2VnbnIBbQaM6J1N+YyFGapRp6
	DoxUbnEg5cXJGeK+9o774lV3OLTBjegYnMSqtlnJGutn+U/OEMBz4ZAIQn4DUs4CZcd/kLyVzNB
	l+UWjmZFcFjouCCsFPSud2gkZHMXZChRpr1vjYIPHhE3z04Jbx17rIE+HtGXTMyibWAyxzehQ9R
	QCJ7uAptPHh046Y/R4LEepGWIIpSnqTr1m5aFMq3O7fxbUzkqJUsVQN35FxRugL9mr+7K4MQXxy
	x67cdc3D5p6GvQ8V4Er6Zy3BTfURoLR5Bc=
X-Received: by 2002:a05:6000:29da:b0:48b:946:c1f7 with SMTP id ffacd0b85a97d-48e1e9f1ed6mr2300674f8f.31.1792485366166;
        Tue, 20 Oct 2026 01:36:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm4903632f8f.33.2026.10.20.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:36:05 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Ian Rogers" <irogers@google.com>, "Marc Kleine-Budde"
 <mkl@pengutronix.de>, "Thomas Gleixner" <tglx@linutronix.de>, "Stefan
 Kerkmann" <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Helge Deller" <deller@gmx.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Arnaldo Carvalho de Melo" <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric Biggers"
 <ebiggers@google.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020093604.286e072a@pumpkin>
In-Reply-To: <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
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

On Mon, 19 Oct 2026 18:27:24 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Oct 19, 2026, at 17:10, Ian Rogers wrote:
> > On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengutro=
nix.de> wrote: =20
> >> On 10.10.2026 08:04:42, Ian Rogers wrote: =20
> >
> > It is a little more manual than automagic :-) When perf builds there
> > is a script that complains if the tools' version of files is
> > out-of-sync with the kernel's:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/check-headers.sh#n28
> > It doesn't break the perf build, it just adds noise to it. =20
>=20
> I see that the include/linux/unaligned.h and tools/include/linux/unaligne=
d.h
> headers have not been in sync for a long time, so maybe it's just not
> a big deal there.
>=20
> > My understanding, biased by my opinions, is that the preferred option
> > is to add a config variable controlling whether to use memcpy or a
> > packed struct. My preference, to avoid undefined behavior, is to
> > default to memcpy but set it to use packed structs for ARMv5. I will
> > vibe code this up, and apologize in advance for any offense such a
> > patch series may cause (ie I'm sure someone on LKML will want to
> > complain at me for using memcpy at all and give me a lecture about
> > strict aliasing being nonsense, etc.). Arnd or someone else may have a
> > different preferred solution, to which I'm more than happy to defer. =20
>=20
> As I wrote, we need the packed struct version at least on mips32,
> mips64, openrisc, riscv32, riscv64, sh4, sparc32, and sparc64 to avoid
> the external library calls the same as on armv5, but I would prefer
> to just always use that in the kernel. My guess is that this list
> is actually the same as the architectures that lack unaligned word
> access instructions in hardware, and armv5 is certainly not
> a special case.
>=20
> For 7.4 (and stable kernels) reverting the in-kernel header seems
> best to me, and then we can think about what to use for the tools.
>=20
> Looking at the uses of get_unaligned() in the tools directory,
> I notice that at least some of them should just not exist, e.g.
> struct debug_entry in tools/perf/util/jitdump.h is just
> needs a __packed attribute to correctly describe what it does,
> and tools/testing/cxl/test/mem.c does not need the unaligned
> helpers at all because the structs are all packed already.
>=20
> I'm also a bit suspicious of the usage in=20
> tools/testing/selftests/bpf/test_kmods/bpf_testmod.c, which
> looks like it may run into a corner case:
>=20
> __bpf_kfunc int bpf_kfunc_test_uninit_alias(int *out__uninit, const int *=
in)
> {
>         int value =3D get_unaligned(in);
>         put_unaligned(42, out__uninit);
>         return value;
> }
>=20
> The current version of get_unaligned() turns into __builtin_memcpy(),
> and the function prototype defines both arguments as pointers
> to naturally aligned objects. Do you see anything that would
> stop the compiler from replacing the __builtin_memcpy() with
>  an invalid pointer dereference?

Historically it has definitely done that.
And you can't 'cast away' the alignment implicit in a type.
The alignment can get tracked into an inlined function.
Plenty of crashes on sparc32 from that one.

Any structure that might be misaligned in memory better be packed.

But what is actually wrong with using byte access? eg:
u32 get_le32(u8 *p) { return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24; }
On x86, arm64, ppc (etc) both gcc and clang generate a single memory read
(byteswapped if necessary).

https://godbolt.org/z/d33hvesr8

David


> This bit is probably fine
> because of the way gcc handles __builtin_memcpy() optimization,
> but I'm not sure if that's an implementation detail or required
> by the C standard, especially if strict aliasing rules say
> that the int* argument cannot overlap a misaligned int*.
>=20
>        Arnd
>=20

