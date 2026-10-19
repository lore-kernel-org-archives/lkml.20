Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443644;
	b=2ZRUvh8kWvRmHiC3cv1xCigOcCPeK/ejMgSE1B9JL4Glprm20NiBmqE2HbMv88AUnmaX
	 9Odx7iiD8gpZX+w59vLWSQ4nGUK3SOctW2o3Old7UDsI1y+xyySFx6gs0kKwl2dtCNLSH
	 SuP7UacghvyWgwuaeLx+hPn7OdY9hRjtTPU8UqQ30JZxrgXHEGq9r7rkFqUb3aOOzaSSs
	 O7jWuUMa7yVV+hKzymGI2z/OcOydSZOXRn12rM2OXS4qnIoxG83OfrkLVSBiUxTo3fdHJ
	 hyfNMH/GgjxHSs1wC1UlP0GEfB4IOHgCzOyp6bTCZ6FqEon5Cy8UEGtPI+2cU+CPsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443644;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=KjyNIbmhJtLcX8pLZ9sLexkeYj/mpTZVno1qnq8Ygn4=;
	b=TyexK7Oh4QybAchBceOerhV1eF5sozzNmYaem/n8VQRBvFh8BFAd1ktpKk2IeEbNYAFZ
	 U7PTUztV6zf8hzCh1aPZnLe2iynUJ6TwOB7FdrGsVAUhA3NFLSHWLqH8E6fa67ftl60vC
	 siYMEI8k7WnvjXhsacNiHiPgLFLyvt5ym2RQS1gjAmRxvqovetE3giESYm18L7u3Mh7x/
	 ABYrsjvKqFqqINypPHI02JAUJ1Ti6Z+EG8EMHnFHQo9Xo+nE5lzAD1hh4JGV1I2TpRxWX
	 NJvn2mGbI8bvZzdjskPRlVEJNG275pM7sk38zD4Z/a1h2Blx+dKVwIXAB69exUxIDTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=NlfvGiv8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WrfnrLNV;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 676B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=NlfvGiv8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WrfnrLNV
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5313014000F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:00:42 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 17:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792443636;
	 x=1792530036; bh=KjyNIbmhJtLcX8pLZ9sLexkeYj/mpTZVno1qnq8Ygn4=; b=
	NlfvGiv87wLUx55iLNkrJHukPCiAn8jxJ9rEnyXxVo2xqwv5GZzIKtWmURYOE8yU
	NPUcTketCznRPQhdVHA4XmbuX1nemQxQ5Qn/Bohkacv8Brv2BTTgoFHbo5wilwjg
	CfC1c3AioWC4tvXzLOHBIX4LDacrRSL9wpOK9q9Q9s/Sf873IOFDRc5HJPjttWAc
	Qvzt7yqUyuL0L8w/Bc+lZwh4qfY5w+3G1lroqzU76sfb2yPHFOaspyLbvdl0mRpk
	A+GyGFrvR/roOoeak/Hg8zJZ8/ihgqiUsJLDLpqgtTKuGrZP3HCKBjD8wQrfNMWU
	oWxAemsVm9ULYDhCObe7ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792443636; x=
	1792530036; bh=KjyNIbmhJtLcX8pLZ9sLexkeYj/mpTZVno1qnq8Ygn4=; b=W
	rfnrLNV1xkUum/cIM2H4wnj/2xXn/44IwjgBeYbgpfHjZTVGFgl+KCoZuyJNcx0v
	4UzUn0+DYWIHKjnGv6mjAzUjMKeS3XfGDeG3dkuWl8iWIF3/Rb/xN8+HH/LlQN3x
	TzHQx9IZnwLXMxmnJ3bjIdJa7RXlT3y2x21OiPYg0RD64imS7z6WSsY28YgjUS7d
	7DgO5wXETOLg53x5DXUNHbhtnRCTPIcjpUjMqlOLvC5Tq3KVxlw8sj0o85VXZuco
	8B9NT1YTR+ssKsCghPsZ2lLltsLoZYhLJgvf2RusfevBqdwe6T4k+tZU4U2xSNvU
	fxR9Y6JANuOkaXIRWapGg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792443636; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:EQV5wzozN2WfkzDBI/5PEoOZUEuFOihFpxwsrD1Pz9yl9J9
	hXogwOY/vHyI6ZnQ+PAC/FySNW6FrfWKxBnBMNcsb65j+CVxtvTtRBlaoy1TIeQD
	ZEoYXhL/wsMgezsiaXJq/nemGrLpfD+40mnaKy6psQAXS4Z3gwWBy61xgUhs+Ypy
	Efo7MrApKars/SLkwkyYMMq4oYdnomMwkJNaUK4KYuA0tm1O7ZfV/O5TrEe1A8Q0
	5HSyPDVqCAKlhn04ka2WXAQJmIkFTorvWll+BiihFmyF0SAHzHIaSl3t97CjRI78
	codfWZ9ct/sY3x9wDP/f+v9KVybudIh/gVWGTfA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aNDAt1XYLWPxHqJwyBq7uIiI/zuEkt/fNVS+1sXAqpM=:kYpvSA7z0jmRXB+66iahCPiBJK7tWHdPhI2uILtlB3k=;
X-ME-Sender: <xms:7ITWap0z4u2v8L0_7zEIxNP15MJE8QDxhimtwo80La4TrlEua1e9Rg>
    <xme:7ITWaq7b-RlV5jcKm8GtGtB6QkA7L4eBG7vlSRF36CwxvjGydpTUJlNnQrap9AjnR
    bcLmyb14wcg-D9e6BZPj6Dfk6RKo4sOmWVhYZb3BtmN6_OPyOcPWf0>
X-ME-Proxy-Cause: dmFkZTEo6dAhbFojSRKShBA8egYb1rceYDkNZ+d81fcczEF78+KBX5j9Q0VwT52aX1Gbhx
    jJBYW7lkrZiV5vE+4yKFqHJgaVnGi82bgLLVXnN90dy3IzAjthsHn+T1BR6uRPLKHtofHt
    Pj+6fSe9YJd+gqAufjb1e4t1k/bTNzXosjgzVhtQEnd/ZJ1eEiobM8zgCIekfVomHimJ6T
    8dPgpffcCM4LluEOgxLY2wM+5GJb8sjse8Hhz8N5UrZeavDOOmpLHoIBVztT+GPSjo9uCg
    wO+FixwxxVFUdNdvz0VRUC2vw9SKosurzhAn4Iis+fevCAJEDPNnSJy7F7uP+jzflNSVSR
    7VZzavN0B8UIz0TEYciVEDa2niMMFpoZDSf/oRwbvV7s8F7w8eB6UVkrx8bRFV13n4Rkis
    XOW3yRgD3RqA8Xwhu3d/OarXZAlSVxTm+jYMO9kPesMRjROEluntbT/bnnFZfqo+cpqYF9
    RLy34HUq7y1PsZdaJjY5S8EkdII4zGBVlPGnZJCy3xJCW4iGO2aEcW/8Wlo9yS1cjPe9RQ
    MIQ2PsHh6GpWbzqSsX5xQGX/qnkYzEKAwdeGUM2drMSkpJeXVY5DrCb5tPi7ydOgZooDoZ
    Bc3zJHyPSK+sNpeHzWnU4iJ4YD+VRCR3kXdzmYefNgHT+o3lzIdweoSqJbNw
X-ME-Proxy: <xmx:74TWaiu_rjGta9nry98p--0aFKos5oeWOZsiRwEc2PmGPK_b8tvEWg>
    <xmx:74TWavDWXQMq-L8Tj-39-qLZ90Klwf3bKytqKhsGe53GebwnXtCgcQ>
    <xmx:74TWatYu-x3nhR-d4Vf-eahVel10emTHxUWBNMzRtPM5SyLfAww1Sg>
    <xmx:74TWap-UAuVI6Xmd5xx753uT41fqIRKbDD8szuKgdFU5JB_fy1cgXg>
    <xmx:9ITWaj-_K3V-Jc8woFiKx4c0ws9l441VjmKtGihonOpP9E6Au-CXOmyv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B0A2F32A0096; Mon, 19 Oct 2026 17:00:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AICZ2hJ9SF6o
Date: Mon, 19 Oct 2026 23:00:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
In-Reply-To: 
 <CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
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
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026, at 19:04, Ian Rogers wrote:
> On Mon, Oct 19, 2026 at 9:28=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Mon, Oct 19, 2026, at 17:10, Ian Rogers wrote:
>> > On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@peng=
utronix.de> wrote:
>> As I wrote, we need the packed struct version at least on mips32,
>> mips64, openrisc, riscv32, riscv64, sh4, sparc32, and sparc64 to avoid
>> the external library calls the same as on armv5, but I would prefer
>> to just always use that in the kernel. My guess is that this list
>> is actually the same as the architectures that lack unaligned word
>> access instructions in hardware, and armv5 is certainly not
>> a special case.
>
> Is it more than conjecture that these architectures have regressed? I
> have a hard time believing the codegen on say riscv64 is lagging
> aarch64. When the series originally landed the issue was looked at and
> workarounds were added, for example, to PA-RISC.

I tried compiling a trivial function that calls get_unaligned() and
looked at the assembler output for all architectures. The list is
everything that does a function call to memcpy() rather than open-coding
the data access.

By default (but depending on the target CPU), riscv64-gcc avoids unalign=
ed
access because this is not a required hardware feature and may be
emulated by machine mode firmware even when it does work, so a
function call is cheaper than a trap.
On arm64, armv7 and most other modern architectures, unaligned non-atomic
word access is always faster than byte-at-a-time, so the compiler
defaults to -mno-strict-align or -munaligned-access.

>> For 7.4 (and stable kernels) reverting the in-kernel header seems
>> best to me, and then we can think about what to use for the tools.
>>
>> Looking at the uses of get_unaligned() in the tools directory,
>> I notice that at least some of them should just not exist, e.g.
>> struct debug_entry in tools/perf/util/jitdump.h is just
>> needs a __packed attribute to correctly describe what it does,
>> and tools/testing/cxl/test/mem.c does not need the unaligned
>> helpers at all because the structs are all packed already.
>
> There was supposed to be an 8-byte alignment requirement for perf
> events and unfortunately some events broke this and we added __packed
> as a workaround. The unaligned accesses wouldn't trip a sanitizer in
> our tests because we sadly lack testing on old perf.data files. There
> is a difference in using __packed as an attribute and using type
> punning to achieve an unaligned access.

Yes, that was my point: if the unaligned data is annotated correctly
as __packed, you don't need any type punning to access it -- you
can rely on the compiler to pick sensible instructions for the
target architecture, either an unaligned load/store a byte-at-a-time.

>> I'm also a bit suspicious of the usage in
>> tools/testing/selftests/bpf/test_kmods/bpf_testmod.c, which
>> looks like it may run into a corner case:
>>
>> __bpf_kfunc int bpf_kfunc_test_uninit_alias(int *out__uninit, const i=
nt *in)
>> {
>>         int value =3D get_unaligned(in);
>>         put_unaligned(42, out__uninit);
>>         return value;
>> }
>>
>> The current version of get_unaligned() turns into __builtin_memcpy(),
>> and the function prototype defines both arguments as pointers
>> to naturally aligned objects. Do you see anything that would
>> stop the compiler from replacing the __builtin_memcpy() with
>>  an invalid pointer dereference? This bit is probably fine
>> because of the way gcc handles __builtin_memcpy() optimization,
>> but I'm not sure if that's an implementation detail or required
>> by the C standard, especially if strict aliasing rules say
>> that the int* argument cannot overlap a misaligned int*.
>
> I agree the pointers should be aligned given their types, ubsan
> doesn't currently fail for this and waits for use of the pointer. So
> there is the specification and also what sanitizers enforce.
> For clang, when lowering from parsed C to machine code the compiler
> will use alloca to model local variables and memcpy as an intrinsic
> for aggregate copies. So:
>
>   struct point { int x, y; } a, b;
>   a =3D b; // Compiler will generate a builtin memcpy to copy b into a

The problem I am referring to is specifically where the object
itself is unaligned and passed into a function through a non-__packed
reference. In this case, the get_unaligned() must ensure both that
all address bits of the pointer are used and that each load/store
is done according to the target CPU definition and
-m{no-,}unaligned-access flag. We have had cases where x86_64-gcc=20
optimized away the low-order pointer bits based on the psABI
guarantees, and it wouldn't surprise me if the inlined memcpy
tried to make similar assumptions in some corner cases on
-mno-unaligned-access targets.

On ARMv5 and similar architectures this would still appear to
work correctly but cause trapped loads that would be absolutely
detrimental to performance, much worse than a few added memcpy()
calls.

> This is why I have a hard time believing the lowering is broken on so
> many architectures. Calling memcpy to copy aggregates everywhere would
> be madness. I believe, especially given the period of time this code
> has been in the kernel, that this problem is specific to GCC and
> ARMv5. Clearly fixing a bug in GCC and ARMv5 should be done, but in
> the meantime, a config option workaround in the kernel is pragmatic.

I'm not sure what you expect the compiler to do on ARMv5 and other
targets with -mno-unaligned-access, or why you'd consider calling
memcpy() a bug when that is literally what the code asks for and
there is no easy way to convert it to word load/store.

Comparing the gcc and clang output in https://godbolt.org/z/r8aq4n87z
it's clear that the gcc version is at least shorter but depending
on the CPU and caller it can also be faster, e.g. when the data
is usually naturally aligned and the memcpy() library function
does a single store while the clang version fails to write-combine
the multiple bytes being written in the wrong order.

       Arnd
