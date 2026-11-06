Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974683;
	b=0jIR3VZ4gVcSgvn06IPhg+GxmxH59fP5vJAdDogRFDVAFZ5HO2EoGL0T4wDCoKBKsFpq
	 qLRM1OF0hq0hJAE+/NiX02jVnLWHJS0LaM28+gYbMZwnCr4ZbN8yRDbHG7DAveRLiLR51
	 lOBEKsMa+XfSbgkG/AUuo6gGIhuXFVqYx/fKeTK7HyJtCOTcvnF4umz3iluYsxJz/2QC8
	 lx5PZD2uaqM2/auY7E9v7kZFayhnXHrN8ub9rZiJ2kuYcg0kpQxsGefpkTIbaLojkgBJj
	 I7NcAtEgcKAADpWFjnq1c7DeeurumKJalHey+Zm5bbOWeCiP41xgyy1kBPEdpYw7haw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FIhGo8m+HNV2DZcgKzXPZ8a3iS9BYDppM0OYIjD6kZY=;
	b=UpEh8Wga4XbpLUYS6wsCDDeQwH/R6kDaoRPYXbsoKADnYdh/fOlngvIapEXd8UIcEdQ+
	 z5Odc3Y0LGNPQ5N5xpUg85mcrEJSkanvvHH3OA1pdvwKZ4qH+pwsUfL1R0zCX8eOGQ65y
	 lRw9TWen5wO7rUCekotiHNmpVETdGqUsVWqUzR30Ur2ehiLbYq6fiitHWCqA6OW5cRjYT
	 ECDWGvoYe0zKrN4wM0AsmP520h8Xr3mASa3hMnp87DN0VEuwv4m0AK+JOBfaKJsz3aXcY
	 8xRRsm4bWnCFqGQvE+tsyC2Fqc6JWr4SFpw+6zkhe5zHiRknH80/d9dcfruxzIjYlEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjk0eKSy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBB606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CBB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjk0eKSy
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so5541a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974682; cv=none;
        d=google.com; s=arc-20260327;
        b=I6C32LXogQwYwJuoIrC/+U2O0Y8pKiOq9tntyPt8DLa2lT6cYqwCrp9aVYO6WrGFzP
         hG5cK3utDz8ejGtlCVcqJcUfj/zmIs1Y/UtxDowgY4ZIg4vo/HQa9rbYn2W0GkQgkJPD
         3pqFfqadrXwvKjoueE2L+/tp0ROp2yW0Y4yqUIwAD13KdBJqpAKvHtu2jkfND9979cSl
         v3Mksr1pPORBF6CHoLDrhmoEMuQU0VycnO6+GklysHvIrj7MR2o6imnxHBqwBV+sKntq
         UkaF/+nGt9BfqMugHANMKBe9/o2bbmporhT6UG431b9SJgHW5gQ7QLIbJ3O8mjZnilvf
         yM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FIhGo8m+HNV2DZcgKzXPZ8a3iS9BYDppM0OYIjD6kZY=;
        fh=uXchqydRXVLCGlaGDSgj61rA2JMPgQ7BhGvaCWSoMgs=;
        b=QY8hK1t57DYAxLRYMaDevTNX+Uh70kUX75IcyqJ2lyTJe26NpUjUeUqfYlkGq9x1VQ
         jpnHgmgewdkIWQ61WkUC6SasuHQD0PhIFJFkCMJZXTbH79ogX1/f6uICRQzUTtVCZS1L
         f06cMIq0Pnt+B0tRnjdQR/825m3aCo2tFqBJd9XHprIAPDGc39wdkPuCwvxHBDv604fh
         LE7WSL+WUvt80gHzC0AAGl9kr6/zUxaLUhHbNzV5Fsd9aN/8mlPKl4UbvOmrHk8Li/a6
         +hWore4OufN3u1SaG6wi8sSEhzZjyBvRvUd2xMtlR4LjtEzJft4DaR+7Oa0b2rjfO3b2
         FjNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974682; x=1794579482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FIhGo8m+HNV2DZcgKzXPZ8a3iS9BYDppM0OYIjD6kZY=;
        b=cjk0eKSyqyklOm0YKf5KxT4jaq/jhyY/OwWVxg8L/X49VLPqje0op7zRxZqFNqXknG
         8mccBNkOinFKsnLdDvOTYFaAYiANpExBZVuaA2BIT7kLBITDxkTMcXikNfuLUw66vr8A
         VSrG3rnraI/wYIsWtedj2+BqhR+9uEPOautSPxSWSqkPjFjBlBHyaT3x/WhRvi7bw6zd
         BC5rsgq0h7DxgNDWFsI/pGJTv0VMMppcrAUi1awC192tXW39wj+0MWjkkv4KuJz1GOXp
         /blUiNW/hII46DMIxqNUe5jTNG572LvYtWqd9zi4wcLrtWVT/4yn9QQG9w3FVqK0wuj0
         VkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974682; x=1794579482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIhGo8m+HNV2DZcgKzXPZ8a3iS9BYDppM0OYIjD6kZY=;
        b=1+feD6GwBGI5dSd/4YuhTG2Ta4ls6TIh6ynihBROtj8adaUptFUcxG5yN2XO49aG0Q
         2u6dsabrLGofI+sA8gZmmp05q2KCibHPOgJSFaDC3J2ssfvinvff+0a2T6uy+jpZXYxy
         D8YGZSYG3ToXPETXkcpqTaCROPFuPEfr/plqUS2THc986i5fg5CFKtmITtrPndTLLyDT
         lSzG3FssR8SJ/OXxwWpvM2cnNkm0ec4HF/8UplmBQ7K5mBljK+/KWx3a/Bl1FmTy9zdj
         izOpCECf4xmYNDAD8mjeF9ib+Z+SKPLWje3oyS+MSrkwbqB50sAXa2U2BN0yl5mjgOEZ
         B3GA==
X-Forwarded-Encrypted: i=1; AL+hErGBwKYOrrl0DD0tUvJmfoXia/rC11NU0AYWnUAmNkiZ6sKRq9kQvOa9w5YKv9VQfyJdNB2xFRKDZGRcM74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YxT6otkcRct2vtd51jcRwsaRyatkgpEQoyXmivuLTVXzfkCIm
	m0uj87DNC+j1wNbspo7KcpFKzB3z1CtSS8qfVE0spAryP7GNesWydfiDbqlj53pT8VG7ErFCU+d
	GAejNkosh53W2Bt6hnvUeZ5aGikkbB4YvgO/Hvo0i
X-Gm-Gg: AYBFou2igGYUbB6VEHK2mJz6TW900qop0/dcg5//zyX2kDny9pVgGzCmslcbMGBri84
	tuU47/hYm4z6MCTK8OLUhKUrIN5VBchBFhuT9QqP5N33uq04BPDkQ0NHufB4hckpTRtfowKpV4R
	sz6FZijOWnLx6Ai5X95JBlkrO+RZIjojcfoOaBjkSMx+V/429s2LHMRjd1XY6Yg+Jc37B0eQTkH
	CW7A1JB1olL6kDDrMRTcpsLflbJg01kTQGf8S9XHZfJAPpXDpb2bsMO7mKqUv3eKlOMxbrWOkxK
	23GukzUiKkh76xOm9ow0k6OGhSwJ9kr471PBJfv74RNvASrjHTLs96s0KXDi52qPjIJi2exmUNr
	JmIYftR5fmRP/93tjdW8M0RkdJRNiHyupAmpt3xEYMGvwqBSdhM4x6imzU+iY3sepjK5rV1sY
X-Received: by 2002:a05:6402:6d9:b0:6b5:5cd3:5dc with SMTP id
 4fb4d7f45d1cf-6b6f6e16609mr43a12.1.1793974681196; Fri, 06 Nov 2026 06:18:01
 -0800 (PST)
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
 <20260930210750.1487547-14-chang.seok.bae@intel.com> <CALMp9eQVheLs1S=OMGmtnx+G0fX1-nwwP54oLcEeHKUh3_tRpA@mail.gmail.com>
In-Reply-To: <CALMp9eQVheLs1S=OMGmtnx+G0fX1-nwwP54oLcEeHKUh3_tRpA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 06:17:49 -0800
X-Gm-Features: AclHuK-jOJlG6gVM1mOO4PZEBxQyAV4FmiWaZUbeD7ZW6SaNUIlIDjHa37rfvS8
Message-ID: <CALMp9eTOrO9w13Kj9exHy2fRz+3Q394b0SoQn8YLt1seNvt8gw@mail.gmail.com>
Subject: Re: [PATCH v8 13/20] KVM: x86: Reject EVEX-prefixed instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:56=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Wed, Sep 30, 2026 at 4:54=E2=80=AFPM Chang S. Bae <chang.seok.bae@inte=
l.com> wrote:
> >
> > Explicitly mark EVEX-prefixed opcodes (0x62) as unsupported.
> >
> > Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> > ---
> >  arch/x86/kvm/emulate.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> > index eba4e9b7cd5c..f0d5a40eba27 100644
> > --- a/arch/x86/kvm/emulate.c
> > +++ b/arch/x86/kvm/emulate.c
> > @@ -5052,6 +5052,11 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctx=
t, void *insn, int insn_len, int
> >         if (opcode.flags & ModRM)
> >                 ctxt->modrm =3D insn_fetch(u8, ctxt);
> >
> > +       /* EVEX-prefixed instructions are not implemented */
> > +       if (ctxt->opcode_len =3D=3D 1 && ctxt->b =3D=3D 0x62 &&
> > +           (mode =3D=3D X86EMUL_MODE_PROT64 || (ctxt->modrm & 0xc0) =
=3D=3D 0xc0))
> > +               opcode.flags =3D NotImpl;
>
> What is this patch actually doing? opcode_table[0x62] is already N
> (NotImpl). Moreover, because opcode_table[0x62] does not have the ModRM
> flag and init_decode_cache() does not clear ctxt->modrm, "(ctxt->modrm &
> 0xc0) =3D=3D 0xc0" in non-64-bit mode inspects a stale ctxt->modrm from
> whatever instruction was emulated previously.
>
> If the intent is to mark opcode_table[0x62] with No64 (or NoRex2) so
> that REX2 (with M0=3D0) followed by 0x62 raises #UD, then:
> 1. opcode_table[0x62] actually needs that flag, and
> 2. this EVEX check must be gated on ctxt->rex_prefix !=3D REX2_PREFIX,
>    or else it will clobber opcode.flags with NotImpl on "D5 00 62" and
>    return EMULATION_FAILED instead of injecting #UD.

Again, on EMULATION_FAILED,  x86_emulate_instruction() will raise #UD,
so this second paragraph is nonsense. However, the key point from the
first paragraph--that opcode_table[0x62] is already N
(NotImpl)--stands. As a result, this patch is a NOP.
