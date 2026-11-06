Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793940546;
	b=sNb5gPQHpxJfx4iJF5wso6BbAY5NgWqvEpaBbUFodDvseognIaQjFJvbAYQhqihSfuNu
	 CDbqx6170ECPlUEUaDd+8VvZcJd1Sw6x8N0g40ASNIDLMloOOrARJusAaotxuLys6Snbz
	 hApyppc0b7f/IUL0VH4tUUWy29jXNX/7FeV1B4uFSJVnchXtsnlTWFu19Z4ooiHyz+v4o
	 4JXyOKE9kjHkwXFhP8U5PRAjA+C6b9QqAHQaKSDgNgkUXOmEBoWXFjETl4OekHX+RWNDP
	 p7yd7oZahn4KH86ssDgfRYsabCMw8/XYcYOJOZwuFhZmFzNNVGIL+nEjg+7VD4T30DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AXgtC+uzvBL8URbn++UYMD0lFRYfFcx1u0QqN2Fgjus=;
	b=0Pq9aQ2rnCEjA5Ex/kIENZQe2G7mZH2PMzdsRWjYmqaYJ7evyO9rEqSE4Pl18Q/qRfBD
	 R8wZHZkE1rMnsRGJK/2kIsliq8h1Ak2fLo6Qw+nNIBEn80Rm4RoDSMuFO8L3Qf112nVn3
	 MepB8zWWs3hxfOo+ecXNFiepIy3To95yhteV6LOD9yEZTECzJz6dSqYrqFB4aCn+stTGo
	 YV8D6M7K8rxkYYpS1x0f74qNnRyEW4VZNP/v2mAfFpJnkdS4JnNM6tO4uEgstpZpRCn9Z
	 21A6Q/v5nJMrRDCP8ygo33kJ94QBrq4jZGd/cQdtlLrqALAdEZ9NaC/keKbKdnfAaLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qj9hSY3E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884C606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4884C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qj9hSY3E
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so809a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793940545; cv=none;
        d=google.com; s=arc-20260327;
        b=KYnDEBAz6r2bOmTOP2wOumERehaMKSIIcUASPWT9F5DlvdoPagLrfVg6LZxyX/GY0o
         3MxiEjH8cA9Ta5klmDgpt1khuRju7mvaorAsMhmSHLHX2GXUpm+srW1IacVzVe1xEgCm
         2fhHFHfiTDpbmwEsbhHDvqkbqSEOV/8KUlxw51eSdsk+5YcEx75O7P9Ve7iOll6T5mVd
         13O3e+KXrxIGQNhrBlCJVKhfA70crfnFVQx3Uiv/rw6GsA9sgpZukHDlqdjxHVzLJ7Rx
         FLwrCEMHExSffITIdjSUvOlPQM36Td+pDY5/5dX94zuHYE1F87rKx1kmHtr+a3E7FHBp
         1SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXgtC+uzvBL8URbn++UYMD0lFRYfFcx1u0QqN2Fgjus=;
        fh=GlX7FM248tEyk07KlGsvUU9vsnyaNSPlyuO/z8j5oTE=;
        b=rQuJSqmQ3y0WmF5lNNHjwivYT2xBc9/U7rvSzwcQfqvhY87zRtgMPVDiTaFBV2P66u
         OItTCCZJ7asld/JZFUYvb4VC4S803BkL9Han4vuKOhNqvOnXuCARa4Jv2YQs4J/e4Gv0
         0F1pOnae40B2wEGaZDhiawt2f+3GUYFv/wqZobokoc4r0ZnzAUc9C5eX4+NGBn8m8t6c
         8T++3sBVqCRQye6HpatySRqrDadsBrft4Vj3jTqzXLFhpujb2fiH5qgUZEEkrojcHiLp
         SvWh6cwEHvxJsGsvggHPu4wtwiAhUpXTzc+JvNsSD1CgNkUKSa2CGbMTsVItyx5/MEVu
         QgjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793940545; x=1794545345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXgtC+uzvBL8URbn++UYMD0lFRYfFcx1u0QqN2Fgjus=;
        b=Qj9hSY3E6uneZFB1f/IDKRKoWHY0lyC2i9I794X9ValaeCAhhwh1r4KZAAQMVnQThN
         AwOtxeP/hYvWt/w2kMt1dVVcZCxVKfbeajKMV8hx2lwCBnY0D3Ep9d6TlDWMvYQOb90R
         zT+sdPdEc5/R/8uMEj/fj10wGoUgBnrZ/0C7ztRnbYV4z0UgetnGChm59OO4KsQNtJ/6
         WDXSIxi01qkEFCJoE7WCg/9SNS9qbLRBLCBCg0n/7I43qTJCvVGjVI/IaB3e+r59qZLg
         4O1HLf5tNdfsT8Q584ePbclSfWG/4gcc9pObT7j2Gm/W052V0AT4jLzuyLXTWA/pLMU2
         bLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793940545; x=1794545345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXgtC+uzvBL8URbn++UYMD0lFRYfFcx1u0QqN2Fgjus=;
        b=yP5mQ6nOfC+rMm0xtFnMnYD0t74VJJRdpuf2Ea0LSeyA24Xgryu7/nenhP2hNG7qvw
         u1KFoHTZAD5Kv74XT4+P9JHjDq3yNdq/bVe1qYmkT0FB/YiI/4cin0iYrKlEFK4+ATjb
         6FbXVTIB10ZxeoCdfXs3h37VTYtdZa0L0oeUJUnJDVa44+4shKXRmflAbqNCOmCR9sgD
         0zBgdrDBgzZ0q5sFmJYCnlB9Z/Mlya6eJ1gdLSzNrEyxBnGNkNeuU6kALZ86NK1KMLdl
         FvMUCne/UZ6vVttQtipfC1gqe3iyIurpgA29wskabxrf9PKL+3/A8+p3TfcQNsfVEg9s
         xL7Q==
X-Forwarded-Encrypted: i=1; AKwUvByzHvWXUbFz7EXddYuLqnhzKV62S7Dk4sn7LSxVwD+tc5TvC104TUIemzwJciPnSaLtDTeOy+UwwSOH9KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/h5C7VlDh+30YbXWXaQZjhizxCdOdUwAHCFrjNNIUhz7lPfe
	5+1D3mhU3ZLWfMjCVUDJm0X7/iJa21uNjebc54yPqp1wmPl5wqgyrvFX1eXuQhUIsiUms0OjN2g
	wUo43337jt8v/YWonjuTwWDz14dgwBwjxwuZC93y4
X-Gm-Gg: AYBFou1u5j1gFqaLOJmJWMrEWl2e81WRUaoi06VVINSobG30lfzvo2BtRjk+OxWepl9
	9CStPkR+ydEfsAoLklZjpJLXR0Rq/FLb5WA8BDQoRQcRF2vt3L7OxVLSlFiCD2Z6kHmOfpi/kzJ
	sqUVrwGWJ9lIGUp/MC+fooLF8u7jQAucqjkwDRZvCpOaeeUljefFQ7vtBFrvAw6Vuc02B1tDQEC
	uQi0S7iKVUvRMfFUKx4NO8OHEab/pjL5QscxoQSWX0VRGlU2GfBhGqSgpC4abzEkUWsp2+SYiq5
	CVQsTaORYe1gq6Le0TJU44HZzgQ4OtMchDZgIzihNNTy1OEzMvUAtD5uGfOWZwgv3WAkKAZVTo7
	dLGGfEMKnEVF7p+lz0yT81r+60G/Pp0is21acPrZ/EhCoSP2nVDOVCl0hdolH7suJ1Eh4jVfHPy
	BjqDnGkNZlOym0SyTcLpy6Z6V2
X-Received: by 2002:aa7:d80b:0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b6e762aad6mr686a12.15.1793940544242; Thu, 05 Nov 2026 20:49:04
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
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-13-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-13-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 20:48:51 -0800
X-Gm-Features: AclHuK_o9i4JZ8lB8IjHuT1J30DQE0_pIpPmIAYaAPQPWqapU0-9RXh80TZCrBg
Message-ID: <CALMp9eS_NHtj--citTS_PhrSSfUG=nfLNLDcDFBX9rhY2CqF=A@mail.gmail.com>
Subject: Re: [PATCH v8 12/20] KVM: x86: Support REX2-prefixed opcode decode
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:32=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Extend the instruction decoder to recognize and handle the REX2 prefix,
> including validation of prefix sequences and correct opcode table
> selection.
>
> REX2 is a terminal prefix: once 0xD5 is encountered, the following byte
> is the opcode. When REX.M=3D0, most prefix bytes are invalid after REX2,
> including REX, VEX, EVEX, and another REX2. Also, REX2-prefixed
> instructions are only valid in 64-bit mode.
>
> All of the invalid prefix combinations after REX2 coincide with opcodes
> that are architecturally invalid in 64-bit mode. Thus, marking such
> opcodes with No64 in opcode_table[] naturally disallows those illegal
> prefix sequences.

This is only true for 0x40..0x4F, 0xC4, 0xC5, and 0xD5.

Per Section 3.1.2.1 ("REX2 Prefix") of the Intel APX Architecture
Specification (rev. 9.0):

  Furthermore, since the byte following a REX2 prefix is always
  interpreted as the main opcode byte, any legacy prefix byte (namely,
  0x66, 0x67, 0xF0, 0xF2, 0xF3, and segment overrides), a REX prefix
  byte (0x4*), a VEX prefix byte (0xC4 or 0xC5), an EVEX prefix byte
  (0x62), or another REX2 prefix byte (0xD5) following a REX2 prefix
  with REX2.M0 =3D 0 must #UD, because none of those bytes is the opcode
  of a valid instruction in legacy map 0 in 64-bit mode.

and:

  The 0x0F escape byte is neither needed nor allowed. (That is, the
  REX2 prefix followed by 0x0F triggers #UD.)

In opcode_table[], 0x0F, 0x26, 0x2E, 0x36, 0x3E, 0x62, 0x64, 0x65, 0x66,
0x67, 0xF0, 0xF2, and 0xF3 are all N (NotImpl), not No64. When any of these
bytes follows REX2 with M0=3D0, KVM will return EMULATION_FAILED to userspa=
ce
instead of raising #UD.

> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/CABgObfYYGTvkYpeyqLSr9JgKMDA_STSff2hXBNchLZ=
uKFU+MMA@mail.gmail.com
> ---

[ ... ]

> @@ -4958,6 +4969,17 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctxt,=
 void *insn, int insn_len, int
>                         ctxt->rex_prefix =3D REX_PREFIX;
>                         ctxt->rex_bits   =3D ctxt->b & 0xf;
>                         continue;
> +               case 0xd5: /* REX2 */
> +                       if (mode !=3D X86EMUL_MODE_PROT64)
> +                               goto done_prefixes;
> +                       if (rex2_invalid(ctxt)) {
> +                               opcode =3D ud;
> +                               goto done_modrm;
> +                       }

"ud" is defined as I(SrcNone, emulate_ud), and SrcNone is 0. Jumping to
done_modrm with opcode.flags =3D=3D 0 sets ctxt->d =3D 0, which then hits:

        /* Unrecognised? */
        if (ctxt->d =3D=3D 0)
                return EMULATION_FAILED;

before ctxt->execute is ever set. As a result, rex2_invalid() always
returns EMULATION_FAILED instead of injecting #UD.

Also, because any legacy prefix after a REX prefix resets ctxt->rex_prefix
to REX_NONE at the bottom of the prefix loop, a sequence such as 0x48 0x66
0xD5 will not be caught by rex2_invalid().  Table 3.1 ("Legacy Prefix
Applicability with REX2") lists 0x4* (REX) under "Prefix before REX2" as
"Illegal", whereas the accompanying text says, "A REX prefix (0x4*)
immediately preceding the REX2 prefix is not allowed and triggers #UD."
Does hardware raise #UD on 0x48 0x66 0xD5, or does the intervening legacy
prefix nullify the REX prefix as in legacy encodings?
