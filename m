Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974081;
	b=AtRHy12ficXMaBt797FPsOSZCraIHMbKB4XFCpjZJWXdTMmYslmmI064SZaF2yV68cti
	 mddaMKq8p86MJ0OUkxwubKaGMxoJAz7poz/mCAWobqFaUnhkgunFDFBXvYLp03fWF0HUj
	 070RCdmMDoO21q8AYjCuMpQNsDEzZWeq1265Es3KxWgKHH2sYhnsOylj7pT0yIk+p0Jgf
	 yYDt2gN6Hf43CrmB37XrWfrh7yRMrUMOc82XlM1sVxn06RpyCp/5z6rxmoSsHbYLANMpd
	 5+MlO/TyvrxBNFRUilqTFrXixioGfbPs+aiKphsgu0ErIqg08oORud5HQKgJluATi4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o0on77fT9cqdEenyVrlGJWJcAv5h/tUj6mGefibL4bI=;
	b=y3p69d+G0iWK2T4YSw8IIjtUZFtxsbL1t3Hg6WnBBYhftqcVoqqDah+cFU9SbFW5LgnW
	 L90sMXiXMfHqSYQyrJvXUn7B0mgYbdOpzVxy0uP7eM4TEdKt/4wQ8VccReL1nJggZ80d1
	 xd9xAPFFTyFWe2yqLYZ1cvMdYt+WYf1l8cMHEdUv3bn1b8A/+5PFrLROw1FJOf2DQqT/V
	 bVxuRdoZ2kXYWGdCKTKWiiNViQb0DJKvKEgepFWAnDuCi8apNYecXlfdFKDopAZSjSlh3
	 5yM65SORGcLeLjaiwBhrq+cmzVYyEBpavOhgqm+qk6ZfYPpo5PukaAl9Q2ua09bHnxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aa6gxFGh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFED606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFED606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aa6gxFGh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so5390a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974079; cv=none;
        d=google.com; s=arc-20260327;
        b=qaQf9WLBIRkEaTp/Ff9rqb20n+8MQvzgGaNa0yFewfLdB1OSN6va9/lKpoipq33Er+
         7AnxbcQvJnLwXscQMMDuguIpDWZ2nCRCRHSNtG04TS3vywIDAp1Fd/cGcOytrT22K1Bi
         2/JC/CAS32P2GTU2PDf9o8YRAZibrDsSxt3Y83dka8RHcIgbpQPCKplwWh1VK/6yEZWJ
         qXGhxIjJFlQOXjxLT/S4Brnh9pQqj4+txv+9+7X/mlaA/Ve+I/bHXdJ3KcoBrihDkiOl
         MTdl3gbw5Tv1CLAI0H6vWb4woVRIr5cyeOMbqFP67iXVntA+n9tsidrePgV2+FrADY2c
         1yIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0on77fT9cqdEenyVrlGJWJcAv5h/tUj6mGefibL4bI=;
        fh=WrK6AYEkr16Ze+ZSua6tmG7jLYd+9dRgBhlECwM5LMc=;
        b=Aw6kgFqgVwGqXLyIW4Ij4FGcgM+wb+Hmdelyu27JHzaznDL8C6/+OsMj/2V3DszPwc
         Rt06uBY1SUSutmp7pOTKBI7y7hrLfEUDGEa/nPK2znyZPCsjtRXcXLEbL7HDd2ruOeTH
         bb/6tRlz1h/CXIDsoV9xaFNDOsJfYyY3eAKBia+q6EqFS8evLOdy7a/YoOSODHkSBor/
         2TM0TWRQlB7FlBJzimpNP4hihm8UPsxLv4DCKKH81WfJ3eGt+6N1bPxRRbXLASveQi7X
         jIhpyYTDxPmA6nqpMxN+E+OVqRRGBp9hlgrdUgJBpjrL2Qigko77FoXmzF/sLgBfMsX7
         X0rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974079; x=1794578879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0on77fT9cqdEenyVrlGJWJcAv5h/tUj6mGefibL4bI=;
        b=aa6gxFGhvb2UWZsRedcf7rghniRGHP5ZBpm+KRqG8m/EQ7v3jAyZ3NDAscezqBSJMk
         chiNJhv4sM6RGck9jFJAGVS9T/Sv5XJDDl8Ak5f0AezAMK3un9me+1kJbbnvQ89mYiQ7
         GuAtya0AhPxKnrzYFp8pXOT4V+NYPtKelypECKrJr9vbvj/ognpMgAvFENC9gG9Pbb1f
         WHrtYn6Ieysst3JN+hLf8o3bHGW5OWRYlgeb7BtrNbp9M0RtW97xopHySPxSR79syOEv
         1fbFhjKUlgR80KY2KADcDTnA9AsAgnQZ2z+7l2tP5CtvstGqSv82pmuCJTUniMreA1hD
         L5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974079; x=1794578879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0on77fT9cqdEenyVrlGJWJcAv5h/tUj6mGefibL4bI=;
        b=XwmcVP7ujAxZ485riMGkFLM6410INHAdT61qJFpaa5IxCVU+JHJpEGaa84ruSo/AyM
         XAC0xZeO2TeqFDTexp3rD5DluNu+g/9LHKDvuaRJhBQp/GWPMkPwzdPf0BMqwWMndYlV
         zrLyJ/Dyp7QeAiB5VUx0Q/YKhDaXOzkEyAXev5mCohZcfVspyQz3yw0dz6JJf+h9iew/
         mmr7GY1VrQwMB4uPtXeXgSe+M5T6IkZ6HfrMtw7xn44anKXUoyKkmCqsUIuhQLUOdmFg
         OoyiKRJZPWOHLTqxaZ2g7HHftqH/iLW6XDwVAC8Ke/40Z9PCN0bKmKJuHv6MWhDBACUW
         WJOQ==
X-Forwarded-Encrypted: i=1; AL+hErHGgKVb3g48qogDLW95v5712yQUHcT9SEq5GeaJKM/J9AZwkD666hcv2Z1rb7juC63/RcHtDzUZFVKyUFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WMFiLGEVuwhR5VSTLELV1Zl8heHBUv7+NI2IGwvzBqMzkhQs7
	q1VeeuEETez2TdnxHy3j5bGMxHfCgAOb+k1VrlZ45zB1JpWMeCWaENY+WZKqzmBlC3N/pZty8PK
	LOefjvO1ENUSgt0qoCN/8LG/75hrTyNMD/vUfFDCA
X-Gm-Gg: AYBFou1E8BRSWFhwClEENoUpa5JkmrpzsTSj20AmnyjuEY0DHRbA7jhay6jFJS+PYqq
	eVnMzwttiJJiZSTCdJN4fo2B/1ZU6BkG5ju/3rC/D1j+8BEbcCt48zXwBPq/nJrWjeM2PkrFJhL
	rJptCpgU9F4nsNCwu4I7N8uu69MOpy/TcYvs6uXfnrYBnSvRWiqcNxR/df+TfmGSCTbsMfjhdWR
	41pUugNsqDD+a3vtNFNofi/XFh404/TKQ+a2J32E0uNZucymkSIINLA0jlLLoyUdMVllKMR/Avd
	xUQcmZcHHc1u4Ox9l5R0EOQqq+tr2VJL4AQmz0SyYvkHEaGbeDmfnQBpaa7IgeTSflrxZgsz6tT
	gPZUNXqkzq6RqETLAk2noXY+IAkPD+tVRxKDmoHR5Ix31kiDfNkFV7wZF1Bd7awBOHtqknrv8
X-Received: by 2002:a05:6402:7d7:b0:6b6:eccd:ce77 with SMTP id
 4fb4d7f45d1cf-6b6ecdd19f9mr22514a12.9.1793974078570; Fri, 06 Nov 2026
 06:07:58 -0800 (PST)
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
 <20260930210750.1487547-13-chang.seok.bae@intel.com> <CALMp9eS_NHtj--citTS_PhrSSfUG=nfLNLDcDFBX9rhY2CqF=A@mail.gmail.com>
In-Reply-To: <CALMp9eS_NHtj--citTS_PhrSSfUG=nfLNLDcDFBX9rhY2CqF=A@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 06:07:46 -0800
X-Gm-Features: AclHuK_pQnHXIrAahfsAJ_BwTSTy_UF_hV02UanDHo6mauvJGquBLULaAFPOnyg
Message-ID: <CALMp9eSZ7V=rOByRveQqCgAgnj_AwRKFa19X4_+4xRJh88H4sQ@mail.gmail.com>
Subject: Re: [PATCH v8 12/20] KVM: x86: Support REX2-prefixed opcode decode
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:48=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Wed, Sep 30, 2026 at 3:32=E2=80=AFPM Chang S. Bae <chang.seok.bae@inte=
l.com> wrote:
> >
> > Extend the instruction decoder to recognize and handle the REX2 prefix,
> > including validation of prefix sequences and correct opcode table
> > selection.
> >
> > REX2 is a terminal prefix: once 0xD5 is encountered, the following byte
> > is the opcode. When REX.M=3D0, most prefix bytes are invalid after REX2=
,
> > including REX, VEX, EVEX, and another REX2. Also, REX2-prefixed
> > instructions are only valid in 64-bit mode.
> >
> > All of the invalid prefix combinations after REX2 coincide with opcodes
> > that are architecturally invalid in 64-bit mode. Thus, marking such
> > opcodes with No64 in opcode_table[] naturally disallows those illegal
> > prefix sequences.
>
> This is only true for 0x40..0x4F, 0xC4, 0xC5, and 0xD5.

"This" being a No64 entry in opcode_table[]. However, N (NotImpl)
certainly subsumes No64.

> Per Section 3.1.2.1 ("REX2 Prefix") of the Intel APX Architecture
> Specification (rev. 9.0):
>
>   Furthermore, since the byte following a REX2 prefix is always
>   interpreted as the main opcode byte, any legacy prefix byte (namely,
>   0x66, 0x67, 0xF0, 0xF2, 0xF3, and segment overrides), a REX prefix
>   byte (0x4*), a VEX prefix byte (0xC4 or 0xC5), an EVEX prefix byte
>   (0x62), or another REX2 prefix byte (0xD5) following a REX2 prefix
>   with REX2.M0 =3D 0 must #UD, because none of those bytes is the opcode
>   of a valid instruction in legacy map 0 in 64-bit mode.
>
> and:
>
>   The 0x0F escape byte is neither needed nor allowed. (That is, the
>   REX2 prefix followed by 0x0F triggers #UD.)
>
> In opcode_table[], 0x0F, 0x26, 0x2E, 0x36, 0x3E, 0x62, 0x64, 0x65, 0x66,
> 0x67, 0xF0, 0xF2, and 0xF3 are all N (NotImpl), not No64. When any of the=
se
> bytes follows REX2 with M0=3D0, KVM will return EMULATION_FAILED to users=
pace
> instead of raising #UD.

As in 11/20, this is utter nonsense. On EMULATION_FAILED,
x86_emulate_instruction() will raise #UD, as it always has for N
(NotImpl), with or without REX2.

> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Tested-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> > Link: https://lore.kernel.org/CABgObfYYGTvkYpeyqLSr9JgKMDA_STSff2hXBNch=
LZuKFU+MMA@mail.gmail.com
> > ---
>
> [ ... ]
>
> > @@ -4958,6 +4969,17 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctx=
t, void *insn, int insn_len, int
> >                         ctxt->rex_prefix =3D REX_PREFIX;
> >                         ctxt->rex_bits   =3D ctxt->b & 0xf;
> >                         continue;
> > +               case 0xd5: /* REX2 */
> > +                       if (mode !=3D X86EMUL_MODE_PROT64)
> > +                               goto done_prefixes;
> > +                       if (rex2_invalid(ctxt)) {
> > +                               opcode =3D ud;
> > +                               goto done_modrm;
> > +                       }
>
> "ud" is defined as I(SrcNone, emulate_ud), and SrcNone is 0. Jumping to
> done_modrm with opcode.flags =3D=3D 0 sets ctxt->d =3D 0, which then hits=
:
>
>         /* Unrecognised? */
>         if (ctxt->d =3D=3D 0)
>                 return EMULATION_FAILED;
>
> before ctxt->execute is ever set. As a result, rex2_invalid() always
> returns EMULATION_FAILED instead of injecting #UD.

Once again, on EMULATION_FAILED,  x86_emulate_instruction() will raise #UD.

That leaves only this question on this patch...

> Also, because any legacy prefix after a REX prefix resets ctxt->rex_prefi=
x
> to REX_NONE at the bottom of the prefix loop, a sequence such as 0x48 0x6=
6
> 0xD5 will not be caught by rex2_invalid().  Table 3.1 ("Legacy Prefix
> Applicability with REX2") lists 0x4* (REX) under "Prefix before REX2" as
> "Illegal", whereas the accompanying text says, "A REX prefix (0x4*)
> immediately preceding the REX2 prefix is not allowed and triggers #UD."
> Does hardware raise #UD on 0x48 0x66 0xD5, or does the intervening legacy
> prefix nullify the REX prefix as in legacy encodings?

The text clearly permits 0x48 0x66 0xD5, since the REX prefix doesn't
*immediately* precede the REX2 prefix. The table is unclear.
