Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973219;
	b=VX+A/SkkVbs1wACHsMG7cySg7KgYM0EHCpsAGGmBnZtRWrfKN6EfCufNbO4KNdRH+tyS
	 QFwB/Fe2SUXVxj6jN7CB1h9eJSlbHbIJn7mgdJNjYPt+rFNxPtvljCGKD9cjDlVAcmIC2
	 MglKuAHjMgl3Iq7+5zUOFkQ5AC3V/Oco5KFBVAZoTdpewLlPrIKXfrSMuRh6NzRMtanhN
	 /O6BlUoqiVmJRjqEV4IElWzeGHRhc0C8+UBG4f/5vEASplQu7qmB6QkcUatL7nR6TM7ME
	 S4Fl0UmdfyA7E3SdI0UJceVb7QHHPdNjcZDkqI5QWED2FpCC2hJqm1aBY8TJx40qn/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bmN9dVJCwoGnw20a3NXtR9b7469JAXfMmrvl3BTM5x4=;
	b=QVPzRHQPkLYK/jL1ZJ22xPhRPLSc7jmd6/en9oLr/M5oxYXS/lsXIealHvO/BQu8IjSh
	 QFv2c2EoBkmcpDz1t5B2xeQwHD4aDXNEQstDNtRwITBhMFhrwGiJURNrIWhNwmFqZxM66
	 kUMg5LMM/GEI35QwRNgsYbTzC2hdAcBn+dWwXqsPxLILFsPn0QHq3arE2gBnPNU28CppG
	 ALFiAk1x4YI2xTabe79H6c7sm/JmzKC7Iz9tuHrl/B+OuaSP8RtxYOG012knE7nFtSFel
	 KQHPjeS1GFStWw4xtZbxb1XaafuvBtgvKNMxZ5tnGrHdPDHuMpAgbqW6+dZjpmsNxNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Is1zqaHR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93C2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Is1zqaHR
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso6929a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973217; cv=none;
        d=google.com; s=arc-20260327;
        b=iDxpPuYXygFFYE84Om+ZySweXwsBPhMfC7Gv10WNYN3mN8fxZY/0gQDZSOjjTR4u5b
         2vR1B/hUcLcsbkdk7YVnvhG4uwtUWhyohA9F1wYcnyrt4SNK7E45mOGa0cXD6WP6UGPf
         INM0SonJnKb3nEBS35utEeN3RG1Eg0kRZNfa8GUUFFL/uuJDiPyLv8gAjgsHZIxrCD6U
         cN8NhWFFa1CQDDm6PYKF5AVamyCVIQyMQaOYKv3Unwlfa8ioKJDjwVAuw33BVMtGHUW5
         Zl5wrKd2I25NZYhQOhauWA/a+IE0vzyAWfpgp2uvAIMliQlV/mFOqmDtSNi9F18p6PzE
         xzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmN9dVJCwoGnw20a3NXtR9b7469JAXfMmrvl3BTM5x4=;
        fh=hY9pliejKKwZFzNnNMIcJ5qPj4rH5v8ISSt8rNGt1iQ=;
        b=fLw+v4sHB1aaBga+ioyfP292I59mOqqttBkf+Sh6sIZdx2tfIPLI1wj+8J+ix7WteQ
         +llGKKASBNXoDTiVOnOhJdp4kX1NB5p+aOkZJx5BTXZusPBE2rwCa8OQCTzWjqG9ueCO
         cvLzFd/ekzqA/9OtRpDFsh4QJnOv38veZfblYKSmxb8HW64QMDYlnsbS2LfDcxA09g7b
         s0w64BGNmZnDW1Maz55m+DgOvxvRbYyhyEAGOJQ7o45JaLINskAYpUdg/mG6u0brmTje
         LwcxjMg4noGhv5Ceaipjv/6qvgqO/4Yi17LpImR+tc8HqkuIJPP3AYLz97WfsQQxrCyL
         izbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793973217; x=1794578017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmN9dVJCwoGnw20a3NXtR9b7469JAXfMmrvl3BTM5x4=;
        b=Is1zqaHRR3Tq6L0seIYcoJUJemNfBcTATHWSM+lHyqce2K+g9cgkgwT9FL1Bowzlcv
         U6QoVvwNeZBnPHlKH9grvrvKDGn5rnhA3yh04ZUWuNyuHdIohg6Y0tDoHfBWX7z75z+5
         7FaEMS0ug7c/lc96dLu7BTzWzmuFAbhu6dv1yy83gKZIHEpGAfxAh4O9pLgNQwanHO15
         OAcmrtHM8srZfrWcn86M9XfuhOxftxj37Svvk5VKhX39klsBAn452MF2bUaAYjQisMGs
         VPyV4k4NhEsLPuc3+gkE3Xlq/73EqMeqxyINWxlL/hvBh/xaly9TAc2KWDtOQrUESGzC
         xP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973217; x=1794578017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmN9dVJCwoGnw20a3NXtR9b7469JAXfMmrvl3BTM5x4=;
        b=CVbm8+p57sG05a2gQjmVc5PTGaxqA490jBb66in/AW3Ks6eTG53f3mHgV/gpYP3z5s
         XR3su4ASHbOYSxiKp5ONreymrANcb/DzpYAPAhAa/fFBbmU1Ql190mrFZKGPmZS9y51W
         eiWRiKc2Hg7jVmfBYhFP+AP12+hsHB6UVfpq63C8OJb+zyNUVuIKJL0ITG+1Lqhl5rp5
         NkRCiPmI7qhK1nWPI44BpwT0SYSxpzZgCTZ7Z1hm8Rc+FVhDoKI9ZF9r6vKguM1hDRME
         22q4n6QruxsX2yd5xHYdRIdZUscba39a3asjCdpPlG/jfbvoPjO+d16fP9EXy8kqrQX5
         t16g==
X-Forwarded-Encrypted: i=1; AL+hErFuLYCHFSaqOvFfA3CmdI5Ec6ItlSUbc0q0V0Vldv8odDmBXDCOVEHyRdfyyLljyiv59dgDkKnim9equMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cGBdXzDLQHQzLnH+1QOP64VOY/1+p8GXbwQT+lIzKdExE3xy5
	VjYeFeHhQQ2kQXNE3AAF6pWzURtqAuePw9Dpkq7cq5wISO/IHmOI/sdZqaCpLa0Nr4HPePdDm/k
	yv4hpEZG3mkwhSPi0RNneum9hjR7p6jaSuJ6NCtFi
X-Gm-Gg: AYBFou24CWLmcXN6x0w9PfWMm2RchpSpDzmsXb2ErykYvaBQtYAeA+90ZjNPP6IaJ+9
	njXF8++HXoUp60COIifMLo2bjM37UgaGoNRODdYejUDA3dV+QiGVpDy241Ha25WaJzLNgqT3kat
	yU5aLzBFhZ4l0S51pyXM+RkycEhloAFFm3KHmJmy9o9d9KWUpyO2bvk6SLBSZO6IzghCSBvgbvz
	QbvrfUrJdHYR2BTKqPL7KeXuHb/eJw/ArY2sxz38IBwxTI4KhJJVi9cMRx0Ksj/8sb8ZH8WXbIJ
	Za8HQkwjhl/Oeaflu9tcgi6Cwhx4Cj3xtf2n4WhVsIYsqK2l0aUDmXCIoNS7E/rfbgZULjGLX/W
	XhWnoSESl6j6rIQNsvwRBPlK+SG2j4JiRUaFsoiTMIVCB36BwctN9DDtGi1NpUpdb07uQph6aaw
	==
X-Received: by 2002:a05:6402:1009:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b6e69f57c5mr30914a12.5.1793973216633; Fri, 06 Nov 2026
 05:53:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com>
 <20260930210750.1487547-12-chang.seok.bae@intel.com> <CALMp9eSqUV64WbzZ0xbAc42+nyBJLN7CQ-ark5j-4P8PNPwC5g@mail.gmail.com>
In-Reply-To: <CALMp9eSqUV64WbzZ0xbAc42+nyBJLN7CQ-ark5j-4P8PNPwC5g@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 05:53:24 -0800
X-Gm-Features: AclHuK_WXZB1ikwPyYjbCiukjUEtl-A2aKNAC4gETdImy8IerSmaJcDJFAVCnWg
Message-ID: <CALMp9eQGqbFz1kKF7Hh+vLanMqYX3KTn0ieCW1hYsJ7xrjcm+w@mail.gmail.com>
Subject: Re: [PATCH v8 11/20] KVM: x86: Handle EGPR index and
 REX2-incompatible opcodes
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:34=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Wed, Sep 30, 2026 at 4:38=E2=80=AFPM Chang S. Bae <chang.seok.bae@inte=
l.com> wrote:
> >
[ ... ]
> > @@ -4385,12 +4396,12 @@ static const struct opcode twobyte_table[256] =
=3D {
> >         N, GP(ModRM | DstMem | SrcReg | Mov | Sse | Avx, &pfx_0f_2b),
> >         N, N, N, N,
> >         /* 0x30 - 0x3F */
> > -       II(ImplicitOps | Priv, em_wrmsr, wrmsr),
> > -       IIP(ImplicitOps, em_rdtsc, rdtsc, check_rdtsc),
> > -       II(ImplicitOps | Priv, em_rdmsr, rdmsr),
> > -       IIP(ImplicitOps, em_rdpmc, rdpmc, check_rdpmc),
> > -       I(ImplicitOps | EmulateOnUD | IsBranch | ShadowStack, em_sysent=
er),
> > -       I(ImplicitOps | Priv | EmulateOnUD | IsBranch | ShadowStack, em=
_sysexit),
> > +       II(ImplicitOps | Priv | NoRex2, em_wrmsr, wrmsr),
> > +       IIP(ImplicitOps | NoRex2, em_rdtsc, rdtsc, check_rdtsc),
> > +       II(ImplicitOps | Priv | NoRex2, em_rdmsr, rdmsr),
> > +       IIP(ImplicitOps | NoRex2, em_rdpmc, rdpmc, check_rdpmc),
> > +       I(ImplicitOps | EmulateOnUD | IsBranch | ShadowStack | NoRex2, =
em_sysenter),
> > +       I(ImplicitOps | Priv | EmulateOnUD | IsBranch | ShadowStack | N=
oRex2, em_sysexit),
> >         N, N,
> >         N, N, N, N, N, N, N, N,
>
> Per Section 3.1.2.1 of the Intel APX specification, all opcodes in row 0x=
3*
> of legacy map 1 trigger #UD when prefixed with REX2. Leaving 0x36..0x3F a=
s
> N (NotImpl) causes KVM to return EMULATION_FAILED to userspace instead of
> raising #UD when they are prefixed with REX2.

Of course, this is utter nonsense. On EMULATION_FAILED,
x86_emulate_instruction() will raise #UD, as it always has for N
(NotImpl), with or without REX2.
