Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805F3A5E65
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641211; cv=none; b=Tc/w5kHUiJsAtLTXpu0ghI5MlXohPxbw19fUcL5fHQUEduTo+6Tysykl3cA3aJpvcE+UHjyCHRpWVJcpIRoe4DU+HORWp4k5Xw5aCwbIX10rgF1JAYJUJzDq6iuTI90vtwpuEyBZNMjQOnt+GoMJ/uMxOMpIls5G6tCoHKoV3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641211; c=relaxed/simple;
	bh=bDqlhf4Mf6g0jk7gaIXlrcBpjPjNs9FuUkpIFraS0WQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hdiQIwdDzvq6PpUEXSa6VsZw4VEMXtkl8HwXa95EqTNpTeY8AwEnjAn4pc3H16AXf5vbB858iQVKu+QTaDz2uODsWk3WSneSVRbQr4mBW0I521O2/ydADmbmLyQ0mbYEjnbD6mCiVX7G1q/OWV4YNDNNWuWHiMZNwwyQ01UVJNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ffsMi9Ay; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QmAt2Jh+; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ffsMi9Ay";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QmAt2Jh+"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id B05231D000B9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:06:48 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791641200;
	 x=1791727600; bh=W827ST06pC2lge0Wrj+NOwnfPftloQBlTJTKaWRNFZI=; b=
	ffsMi9AyUiQnN2llPde8mfD1nyG0M/Ane8RNZIqN/XCH8kEUfPEokgGn/JCRcjca
	FKtC7WCSe1JEiN72YcRzSmhyMI3AdSg1M32VDVqxsWZg9ZzOa3aC240BUD57qKcK
	0ukqu5GZ8AJzpuxpYcJ23oTLv6pA7FzIAirj5P/Pm+0gaLPN7/TqLeNm2r5gu6oe
	cIcD4XGJjiVREE+kbJBt4wlOkA7K31r+FKkwZ2RbhItMagJA05iY6nsyLlyc6qF7
	s9vXcGVhCAVAoox1+6CGgtBgL48N/6vxZXQxUxQa/jfJNQ0LirpUl+7Pi6wshXUG
	tH8QBo4uZQky/AbBaqJvPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791641200; x=
	1791727600; bh=W827ST06pC2lge0Wrj+NOwnfPftloQBlTJTKaWRNFZI=; b=Q
	mAt2Jh+GpFC9o7KBuu5UrplJwG66JKOcWgjUYpNAfgAnFew42h0YB/72ge29gsvA
	fsHH4jLFwWM15QlNbb9n57voUI7JUqRjSn1t0BzXHRjNsxDObMW7+W/mVIPsPzJu
	YMIC+Drjx1MFhVumkQsXkK80xP6YFvU1lMz3vCmXDealUhR4G81iMobkK+u4c5g5
	kj7yHc7jitlz3amZfAQqqb/ORp+ZQcBQpljI/wEm6xWA8LXV16wG97NQkfrjnexs
	YZ3BeATXNarztO7MIXmlBWo6JcniHOx6zuc1Ic/HQ8pbUMqrBoaTTQH4Xt7SkrhN
	Sjj/iewWymMTpV0mlLQMA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791641200; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:WXiYZpkuMAOT/alP0FIGwDpe0emgkNAzXwEdj20ncsf7U5J
	uKYhpkFVZUDBGWkABLRKF9st6gAmHuZiC9kBqUkzzniiGppPP2Qwi1e8eBEyH0It
	GkSlP9mYBaI3dQAZXOGJ27EQ1eAZUcmV9M+mLoeINHa0zorcPTOkljf8k6nmE5VJ
	C6WeW4R95EU8lSDPDCuFk3Fj+3TDgbZvso6dmdG/yT7EDP+Ye1Oo8ykmYEM6uZ0C
	eiljbbEB9CBN9A4xRupIFVOEuzPeySpZSRBiOrf+swYeHTdWduddOwkAwNtuVuS8
	cZfKaShWTbRPOEkWIB0K55jRXIW4/8ymKOmyf9Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hHndMYpVEsm7OsDlRD1A4tFumF5/GgMHeYd7gusgw84=:bDqlhf4Mf6g0jk7gaIXlrcBpjPjNs9FuUkpIFraS0WQ=;
X-ME-Sender: <xms:aUbKah_OvmeaOEBje9YHOHczR25W8A6eXP_Csc0XJuI4eptp6UDPsw>
    <xme:aUbKaghxkFsByBNsXOpHiTZHMKUEH8-uIWJsDqogq2bRP0XnBLnPEXBYqOnBbcWRR
    HdqrQyCLYIUBgNsIJHd6pKSsXmBaIuvrsXnSDizdb6C-ZY2e0q5j12U>
X-ME-Proxy-Cause: dmFkZTGrLmC2EmPOKgfu6fq7KE9OCms/o13zwrpMX4JjZvcrpG5gTg9U6qoeO59MG+bvVi
    PuYjn7H22b5w7fxo7fW+UgB7P6q5q/KlKcy/Sg7fgyRNDf7/QkOedHAZH7OUCMiPJ3Hn1j
    S51MXKsyaXwHpy+LNLUliWurgyEoMwCi7+kHQjnttnUXEx2eMrDgvh4ZqL2kKnukl25g+T
    6RPhbSF2ISxVjjep7I+ya3+88nopD6dv/bZMSexat9IWLs1ZwyXzIsCFzaVBEZv6nieZew
    e6obG3QoJEp0yRLEbUhhQahnKLFtldm5K7iMeilhzjLCyvaRGkdEWyGeP2vtThHUHP7+gP
    EEX9gXF+mSDelX1EPAjtpRwuQIfD95+LGjEsjueQsLxf9gVvIzlFjeKNJFj4ypR1btR3uH
    khJzQ3P6FqDDgxvNBHM1O+8gpktQCgbPmFxi/w2lvPbb+a/di+Qx6ZYFpitbUEZPKm/3jt
    hDBkhK16W201pBo6H8qhPTq4ilkZjSDRpAPa3Gxb6zwWRe4I4sv5N+/WKEIZfSo90HqbZv
    jMmJVeYz2l7adz95nAuyBalXuTrV19l1IMxrzCGPPqF2fIhyGeEx2qRaVkSixoA0UVFwP7
    M1UcHYY87B5/J3bszjObSWjW8hG+wsc1UNXULoBp1/ig3Eeya1lkOwMSmg2g
X-ME-Proxy: <xmx:a0bKas2q6YuCD2FsKeP2DdIfLA_r9VF-fPkCNF2DcfGJU23LnEtkOw>
    <xmx:a0bKauq2fxNXTg8O25t-JilXME050Kb9hBlCADbnvzuCOX0-aCKUAg>
    <xmx:a0bKakgoGrLIml4bL_60htF3U9OkOc87FVZCjY9mh7000RfL_O0UZA>
    <xmx:a0bKaik2Z5t35whBj91jN6C1oBLDcK7-B4SeucCltBrkrpxz6cGM8w>
    <xmx:cEbKarU_wuCsp0az9irQRidZKPuINHuwx3dNx4VzMk9WqxGeLGRViX7->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 197F732A008E; Sat, 10 Oct 2026 10:06:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AICZ2hJ9SF6o
Date: Sat, 10 Oct 2026 16:06:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
In-Reply-To: 
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026, at 23:28, Ian Rogers wrote:
> On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
>> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
>> > On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
>> The previous upstream version was the result of endless discussions, =
and it
>> looks like changing it to the memcpy version was premature. At the ti=
me we
>> unified all architectures to use a common implentation, this was the =
only one
>> that resulted in correct and fast code on all architectures, so I don=
't
>> understand why this was just applied without including everyone who w=
as
>> involved in coming up with the version that was replaced.
>>
>> My feeling is that we should just revert this. I'm not sure about the
>> motivation for the change. It sounds like this was meant to be
>> used in userland code, and that clashed with assumptions we make
>> in the kernel, but I don't think that is sufficient reason for
>> regressing kernel code.
>
> So the original motivation for the change was that the perf tool had
> an OpenSSL dependency for the sake of doing a hash when copying jitted
> code into a fake ELF file for the purpose of disassembly and
> symbolization. The kernel contained the same hash function, and using
> the kernel function allowed the perf tool to avoid an OpenSSL
> dependency. Linus asked the perf tool to minimize its dependencies, so
> we pursued this change. The kernel hash function used the
> get_unaligned code for unaligned memory accesses, meaning the change
> required the perf tool to add -fno-strict-aliasing to its build flags
> until we could have a strict aliasing safe get_unaligned. The strict
> aliasing safe code is what we're discussing here and when originally
> written it sat on the mailing list not really doing anything. To my
> surprise Thomas Gleixner picked it up 6 months later, and I believe
> something other than the perf tool motivated this.
>
> There was an issue with the original series on Power IIRC, they had a
> char global variable that they knew was an int through linker tricks.
> The change caused a correct compiler error of a 4 byte copy to a byte
> sized address, and I forget if we used pragmas or a local packed
> struct get_unaligned implementation to work around this. I didn't have
> a way to replicate the problem locally, I was glad others were helping
> with the series!

Ok, thanks for explaining the background.

> Am i going to be able to convince people builtin_memcpy is a better
> unaligned choice than a packed struct? Well memcpy is the expected C
> way to solve this problem, and C compilers like clang implicitly emit
> memcpy intrinsics when copying things like aggregate values. The
> packed struct requires a cast to a pointer type violating strict
> aliasing rules, but has been sound for many years because of
> -fno-strict-aliasing. We'd like the perf tool to be clean for things
> like undefined behavior sanitizers, but separate userland code could
> support this. I was trying to be as useful as possible and I don't
> think the patches were rushed at any point.

Aside from the performance regression, I see more issues with
using __builtin_memcpy() here:

- since the compiler is allowed to always turn __builtin_memcpy()
  into an extern memcpy() call, it looks invalid to use this
  in the vdso, which is not allowed to call any functions.

- the original version used memmove() instead of memcpy(). While
  this was removed in bf067edf5d2f ("openrisc: always use
  unaligned-struct header"), this was surely intentional at the time.

- the use of __unqual_scalar_typeof() turns a relatively simple
  expression into a much larger amount of preprocessed code, which
  tends to confuse the inlining choices and compile speed, especially
  when this is mixed with other macros that expand the arguments
  multiple times.

> What the bug report shows is that there is a lowering problem for
> memcpy with GCC on ARMv5, presumably as ARMv5 lacks unaligned memory
> operations. It seems the packed code shows how we can teach the faster
> unaligned lowering to GCC for ARMv5. Fixing the lowering issue in GCC
> will likely win performance improvements elsewhere on code compiled
> for ARMv5, as optimal memcpy codegen is an expectation for things like
> copying an aggregate value.

As far as I can tell, this only happens when building with -Os,
and I don't even think the decision to call the external memcpy()
is necessarily wrong here. The same thing happens on mips32, mips64,
openrisc, riscv32, riscv64, sh4, sparc32, and sparc64. Some of these
also use an out-of-line bswap32 in put_unaligned_be32() when building
with -Os.

> Fixing GCC would be best but a workaround is to use the packed
> unaligned functions:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/unaligned/packed_struct.h
> I guess this could be a pain if there are regressions elsewhere in the
> kernel that also need fixing.

I hadn't realized that we still have the extra copy for those,
my guess is that we had planned to remove that but somehow never
converted the last remaining user in tools/include/linux/jhash.h
after commit 50b4233a22b1 ("include/linux/jhash.h: replace
__get_unaligned_cpu32 in jhash function") did the second-to-last.

> I believe I spoke to Stefan at LPC on Tuesday and explained all of
> this, suggesting the packed unaligned functions as a workaround. It
> would be interesting to hear of other motivations for memcpy that
> Thomas may know. Perhaps some config value defaulted to memcpy and
> switching to packed structs works for everyone. Maybe separating the
> user and kernel code makes most sense.

Right, that seems easy enough to do: the include/vdso/ headers
are not meant for user consumption in the first place, so it would
make sense to use the struct variant there, and the
include/linux/unaligned/packed_struct.h version could provide the
memcpy() based code for tools/ and get deleted from the kernel
internal version.

It's just complicated a bit by the fact that the current code does
the exact oppposite ;-)

       Arnd
