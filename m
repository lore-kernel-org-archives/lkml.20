Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FF34B1A6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634850; cv=pass; b=OOBXqLzMTOm1mTjGazvgDxqeHTH6Ixr4RFSROlhhqJ+75Cet3tKmF5IS5wnTAPGBgGwLvj2iZlIFAqJ/bv44Wh5rZYDCf+tbZlpzxd84h3MkAoBz+wv50t0qmoHSsii0x8Lsz9PNt85Go1Re+o/3gi/GR9tFGzrh3U4H8qG12mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634850; c=relaxed/simple;
	bh=lc4UsY1TZLGvC2N0lakWf5ohFA9smFejBK2iwHxxb6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h45NLCrjSoN6r4Un74CL+9HAyDq+V491/VC4ZvdRwN/S5sMOr9rh5LYYM/b8xpf8npMPWP3cGkdX4rol50Czo4FYDYRps1/qqlvl7JhjEwcBCapB3WfGRXVtXDmC3XY08m9SwXJtiXTVW1T9iiFc8aUAM/+mrQ5B/NKoZYYiflk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvIAIewd; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvIAIewd"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5337c7b9937so84241cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791634847; cv=none;
        d=google.com; s=arc-20260327;
        b=PPjIzk/yNBCJM/puAiVcrD0ZRl3iSXBINBTSo79ufmmnsW5jgssWyawDR1nc23O6Wq
         G9gGkAFMp6x/P8eycqjnF3n3+YbiBVLZlHjPaUzcvYPTHn69E4bVZRf8+u23eI/qCkuE
         NHRxXmZ7IdNxBsBhhIG1T8wvq0Ji4NoVrEta1V+lmJ0aBUJUk/1WZpVjdkl8g7+GfCDq
         00cNyVWXAy5s8V5kTOpLBmAVzpxgffhpMyVpgX4O4H/Me/S82+pTjQjEzxS/n+7I9Bla
         m3CYYJdc1obJyp3oblinDApXjof99dRW7x9M0p/jjxgkoAG0t3bKVbge7t+2Z2gh78/J
         TdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        fh=vM2mqRXZvtmwSINTRRllIK9zAun/uXYNGnr6ZTaYUJ4=;
        b=hRi4JVRIE38TNHBBVxmMsLoKJ7Dyd7wR/+ovEpvhL2/uc7dfX9U0H33B+fR4A0wz0R
         NQFvAkskq/l4W3WeaWbvn7NTvOOhF5JKDQpAqwBNwymIdueGsnoEtj2xqq+uMxtaFHCO
         tdlrlUastEIiyMq7p+ARbS4Mb72vtzjjXYSXoDwYQJlsrIRov0Ewm3adY2Yb6x3F1pOa
         Qd3EqNrl9Ow9zjn7obT72ut0DpO5clFHlOEjoIcOhsZ+XMdpfbnvfCaKHcw5lvZdB5E8
         1ccNefTNqNAtWtbG0h7UyCkCdDnwnGf6JTNvwQc7JhlPZYBOyY63Trjnt7SDHKI+Amx0
         tkTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791634847; x=1792239647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        b=ZvIAIewdLV5P4Dlh9k6I9ddOCBm/shEpw4jJ3Hmjz7hMvseD9tm1PgWVT7cHXLgbbs
         D+JbmSJuJQwOBxL4/osd1k3xz/9MIPtR9vfcdI8jJBiEmNDgtbp3mocjLkqqYLhykJBE
         +V3YlIBcpKvdPOAInd+t7bY3SKECdOAIwRIdM+TTRo2R7OEF3ewhLbALkhdf2lAnz+fQ
         EwtBqvD6kA2U/d1VJHYkBe5r2BK7BBpHVG2kECeR+LSqn1uCYeCihappkEgbBR/RC6Rp
         zCDVuc6b19Ae6iA4GbNP2/9TMywtGmD9Y5eiNNMNzIOPCRBNZ6VLuZSij+LiWMUFh1ED
         HWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634847; x=1792239647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        b=aYVpMzSz5HFNMO3jfVqadXsJup1x22ffeoui1InfMSjUxd+dU/piqsHF1CUNOHXIlc
         vEOQUto7z9zx5hre9Xqe0wwO1QNsu82fycP5UwKgEfkubEH7rNsYm7spS1wLACF0XaV/
         0AYY+AykmR6YvU4MIajt5wcNnKFY+fugOh1waTF7cVTup/o1NYcXQVt4wLBuyysv7b3A
         wrsxsKgaOEPgjlg7oj7yR0KC937HDds8NJXurCOuOcVvhULaV6DDz90HqI1kB7f9SXXO
         +LnYz5MGWoDxS1wscZmNgGVD90t4gTVdf9ffYqjdptM+a/ANTTHNx1UqReGSC1tdUnqC
         DdPA==
X-Forwarded-Encrypted: i=1; AKwUvBw9ZGKPnRK/6Omzuaopb/tleM81+YMBOyuk/YPxVZ7uGAruMmVZWJR7z5buQ8h5UcS3QcaO7fuWr8cPfdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdlE451GP0lzyat50tpV11OPw4akg5Ic2/iJm/3PQYJ4OgL954
	ZEgoLH99jSDcvzW9w2yOMmzMyIaYOkHctgF8zQ5XiCGOhivN+t8AYU8tQqkSfAOArvzszkUy9v0
	sA/VzcrSfTwzorZgNT4QG6y4Rk9EizRM8cA2IGM/3
X-Gm-Gg: AYBFou1cM36owFFqdfFbTmnlA7x1XUljpWFkojfQnpoCtoL7CjLw7A7ggGwHye0YH2v
	XFPPBszJw0hzA8pTas/N6hY27BzH2LCllUAqkJuvtQ1to+FeBvdaJNBsOSvvTkpdU5HMajZhpc0
	0bnKtd9T4n5xTZbsCo/uAIoPlMZZCMtrolbEX1+6NtcJDLmCuzprePTZPYxiqgvSuw9jWCe2sao
	mxRgPy+R1zlN9xBm/9UzLAl3WoCIu6agghFbZ3nAmQ/rKScaffvpREOBnt1MBbRobYc3JI+r4HY
	3b2TpLnbh0i7hVspiPc+EqlgRvMnZkL0qoXgqXH9H6R6tJIgVf8Qpe/4
X-Received: by 2002:a05:622a:4cc:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-535b2910266mr7700761cf.0.1791634846455; Sat, 10 Oct 2026
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <620331f5-c576-4895-b4a8-7bd0baddbde8@kernel.org>
In-Reply-To: <620331f5-c576-4895-b4a8-7bd0baddbde8@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 10 Oct 2026 05:20:34 -0700
X-Gm-Features: AclHuK9Se0rWE6CksnCr93m6yCZdqzjvzXuHkfM3w-HeKaeFOS0TfWGW9tcRQsc
Message-ID: <CAP-5=fVOJNtg99B0_xoSZFCf6ex_YBf_ohhXSdzZvPXU2NTWXQ@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 3:26=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Le 09/10/2026 =C3=A0 23:28, Ian Rogers a =C3=A9crit :
> > On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> >>> Cc+ Arnd
> >>
> >> Thanks for the Cc!
> >>
> >>> On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> >>>> Hi Ian,
> >>>>
> >>>> On 10/16/25 22:51, Ian Rogers wrote:
> >>>>> Type punning is necessary for get/put unaligned but the use of a
> >>>>> packed struct violates strict aliasing rules, requiring
> >>>>> -fno-strict-aliasing to be passed to the C compiler. Switch to usin=
g
> >>>>> memcpy so that -fno-strict-aliasing isn't necessary.
> >>>>>
> >>>>> Signed-off-by: Ian Rogers <irogers@google.com>
> >>>>> ---
> >>>
> >>>> Is this an accepted trade-off? My understanding is that the kernel i=
s always
> >>>> built with -fno-strict-aliasing, so the packed-struct type punning w=
as well
> >>>> defined there, and the __packed annotation is what lets GCC generate=
 valid
> >>>> code for the unaligned access.
> >>
> >> The previous upstream version was the result of endless discussions, a=
nd it
> >> looks like changing it to the memcpy version was premature. At the tim=
e we
> >> unified all architectures to use a common implentation, this was the o=
nly one
> >> that resulted in correct and fast code on all architectures, so I don'=
t
> >> understand why this was just applied without including everyone who wa=
s
> >> involved in coming up with the version that was replaced.
> >>
> >> My feeling is that we should just revert this. I'm not sure about the
> >> motivation for the change. It sounds like this was meant to be
> >> used in userland code, and that clashed with assumptions we make
> >> in the kernel, but I don't think that is sufficient reason for
> >> regressing kernel code.
> >
> > So the original motivation for the change was that the perf tool had
> > an OpenSSL dependency for the sake of doing a hash when copying jitted
> > code into a fake ELF file for the purpose of disassembly and
> > symbolization. The kernel contained the same hash function, and using
> > the kernel function allowed the perf tool to avoid an OpenSSL
> > dependency. Linus asked the perf tool to minimize its dependencies, so
> > we pursued this change. The kernel hash function used the
> > get_unaligned code for unaligned memory accesses, meaning the change
> > required the perf tool to add -fno-strict-aliasing to its build flags
> > until we could have a strict aliasing safe get_unaligned. The strict
> > aliasing safe code is what we're discussing here and when originally
> > written it sat on the mailing list not really doing anything. To my
> > surprise Thomas Gleixner picked it up 6 months later, and I believe
> > something other than the perf tool motivated this.
> >
> > There was an issue with the original series on Power IIRC, they had a
> > char global variable that they knew was an int through linker tricks.
> > The change caused a correct compiler error of a 4 byte copy to a byte
> > sized address, and I forget if we used pragmas or a local packed
> > struct get_unaligned implementation to work around this. I didn't have
> > a way to replicate the problem locally, I was glad others were helping
> > with the series!
> >
>
> I can't remember any special issue with powerpc, I've looked into the
> history and couldn't find anything either.
>
> As far as I can see the only problem we had was with your version v1
> where you were using memcpy() instead of builtin_memcpy(), leading to a
> VDSO link failure due to missing memcpy() function.
>
> But if you think about other problems with powerpc let me know and I'll
> look at it.

Thanks Christophe! The issues weren't performance regressions, as here
with ARMv5, but build bots that failed due to warnings about the
memcpy source or destination being invalid.

You are right that PowerPC wasn't the architecture that failed; it was
PA-RISC. Here is what I could find in the LKML history:

PA-RISC build error:
https://lore.kernel.org/lkml/CAP-5=3DfVEp8UPS-B3X=3D66AwYbbbs8559AHEObpQZSV=
nSnVYSxhA@mail.gmail.com/
PA-RISC workaround:
https://lore.kernel.org/lkml/20251016205126.2882625-2-irogers@google.com/
MIPS failure with suggested workaround:
https://lore.kernel.org/lkml/CAP-5=3DfVBZPBz6J1omfvSS4JLkueRGqCdouLji6gsFLT=
eu9nJTw@mail.gmail.com/

Thanks,
Ian

>  > VDSO build fails with this patch:
>  >
>  >    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>  > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>  > supported
>  > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kerne=
l/
>  > vdso/vdso32.so.dbg] Error 1
>  >
>  > Behind the relocation issue, calling memcpy() for a single 4-bytes wor=
d
>  > kills performance.
>  >
>  >   170:   7f e4 fb 78     mr      r4,r31
>  >   174:   38 a0 00 04     li      r5,4
>  >   178:   38 61 00 10     addi    r3,r1,16
>  >   17c:   93 81 00 10     stw     r28,16(r1)
>  >   180:   48 00 00 01     bl      180 <__c_kernel_getrandom+0x180>
>  >                          180: R_PPC_REL24        memcpy
>  >   184:   38 81 00 10     addi    r4,r1,16
>
> Christophe
