Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941023;
	b=yxIXyAMPN8G8NwbM1XLatORdgsh+vBcXM7wEIPy+FkV+/saVf/jJIy5+OmSTtjjOPqTD
	 ZyOCs2iPLjLBn+FOgZ98cOUnGjuusdGV97j1h9otIKaUrAOdqWtPegdzrhYgiLkJEhFBf
	 enX+H34A2KcGVXObaccO/+fRDtcnA9zMUe/m8MlTG0/NYlvNzAWidrQLAoExM8Xw2WlYh
	 ogPFtFlgIUzUdwfxN8qPbiTvHPb82xtYaipWe6dYV3VDOdsnYlWFDN+aD2KZrIofH/K00
	 Nc4+UUL5u/ifb/se3P/kVVQv1QW1uA6/0teZfJa8pZk8yl5yTux5E3lSVoYxzPqJ6yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LomjFSiSVvN/UtH8tNxbJ7r2A7Q81k7fo1fXMCC44u8=;
	b=5Xo8tIRGO2XRd8aZbExCwhhGl5DXJjQmaNx/eMM7rIKitGl8A0u2KVbHQ+lNqqauCs+a
	 g1EBpVCDimMAyZrJcgHWuDZhdZyVLNpt/1wkLq5Stwi0Ag7rzGXQ4kgq+CsXp0zSkOenz
	 cyDz+toq+AriNU/k5Oh67TlVstmpIbKKbWH6IpiYCj6oUZhC1cuCPD0F4bT/TEqybHWBe
	 CwOidkC9bWM2SWFOgV4EI3u2M2l28GKR4UQ+UEQdQPGGq+EPzlBcxD+N7oTGzu4Ia9bL0
	 9DlNRNT+BYu/hiKKdRqa+5LMEFMm2/PU+VCF0Ou2LLIGb3jwjAgaXcpJlgukwS2qgnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gSIefBqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8A606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A8A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gSIefBqe
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5383c97c8cfso26951cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941022; cv=none;
        d=google.com; s=arc-20260327;
        b=O/fKEdrDUm6mo/BMn0H/5mKLJHykRBvyeutmc4Sp6WDNJNbtZHRN6eZ4uURyRuP+9G
         /fBVHxEqb2G1QbVmcU/ETwmo9+TJSjH/eWfcyduuvvW8zcNYz1UR3hCDBIZyGL7QXqVe
         WvKSEEzZMOmsuGjT7nXKrXJRePafIZ2G3mMZLeqmXIYn4JfFlooB8HH2Fqg0JrjUJFmQ
         BDTf22pKjq3QJTJnoPHOTQt8RhfK5OrGF2/I/OvYt/yZneiDEZ98p/B/pe5V41U0Mq0v
         oVXKDnoKIEk3gDVYGt9OoF/19y1vLGLK0bmTxXq3tezYZCLRnkSSH3XfB+m9OS5Gh8HW
         EU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LomjFSiSVvN/UtH8tNxbJ7r2A7Q81k7fo1fXMCC44u8=;
        fh=ayHzN3h94ix9u2F69epXj7N2JugampBRxWWi/+6/Ycs=;
        b=jTCopltNFS0gvhPFINnH5WEqsSuJl6u3eeqOOCs6+bwK/tfrBh0iAD2eySU6JClzBD
         uQAiO6lMEDNvTxPcxrv2hqACMxMCD8MSRKwxgbBEdCia5ecvVBLnY3QqQvY5Ft5BZjlZ
         64ceIumZw/e+Vwa3uBrGrdK3wADh350lXSHjTEt/QZL71uOlHu9OnZVo5Z26KNx+LEPh
         naUNhZ/qjYPu2lGrA37uSwBVnm0u9mlurAWRUtLL7y9YVnXJ2vG/5M2aC0h/oOVeJENr
         s/VAVsS5oP3k803GMF97fnt4jHqneycqGE8TWrxGkhzF8LeYQbXAIdC8UXrNv8Hh2hWi
         aOfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941022; x=1794545822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LomjFSiSVvN/UtH8tNxbJ7r2A7Q81k7fo1fXMCC44u8=;
        b=gSIefBqe2gfWUrZf6ihmlA/of+IkmB8awyasX4q7Odlmowd0PkwDvd0tzydT+faE9g
         Rh/JfNHDiYXdqBlEGpf51OPB/Nds0OS12FklAsgLGYBvClKr7/rkKANIemYbtZ9UylBA
         wtKJxXDb8p+er7M/VFB1a3iXwaa23rbJiDh7QyEeHEX/+66EOGRBIHpGw3NLmJi66aqC
         3Km9iZi7r1YY9TAvfhnIBfonCpAAViagLMvOmft6TZgZM1th4f2z6xnR0Pn45/nbCl+6
         CxHiUiTeA+zDPaKBdPf2rvrz81sorKgrehdH4s9Rz8WD/rWb1/BzHpahybNifqiBt05q
         lZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941022; x=1794545822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LomjFSiSVvN/UtH8tNxbJ7r2A7Q81k7fo1fXMCC44u8=;
        b=l7jPO28l0+rfE5ppPgp6IQsHvx52y0qlqBG+QyqXol4WCh5RuOYe/O2A07YlY1g+BE
         XZpkU0nWVgz2TzcPT+aWCAGOlzXDpZqxidGGauw2QxH+wj4wJMlgAx86eGHdGJ70k+kE
         opXsG793dO3lKYTH3WZMCYTj0ikzPgaX/87ui5hIG2NODGRvEkAZAjjCcFbVCmLf9m23
         ZGG6cVE3Jz83f9GziWr9/NejCsqXXPsQ2EdAsavJGHlyWTEjxEz3tumsgS02e7SC/yil
         69Nw3UJt0vm6asZV7+9auC0mVoQEhyZYohfqatSC2ZHXTuhBg1scXGIXURPIgVC7oHHR
         3Krw==
X-Forwarded-Encrypted: i=1; AKwUvBzGFVLIMoSbDd8UmX3q5wfoQCKStLZbcolUMBq/LH0gGefxHTchbvF2PFTWk/PKFdbjOdaoMFGFvtsmWVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hU+/nAxP6VfCE9fe2/T3+Mddbao3CfI6hAQAoGJF3yZgPBu3d
	ZQACk6apcKauLXuEmHRJjwFo4pCp5j+qr87xC2Fr1swf41shmpNi5d55TYtbWwfZKj8g+B9o+VX
	wRrUjinI02FG83vtVBFyucjicqRuKWBXA6DlBJinN
X-Gm-Gg: AYBFou1Wh/L+TP/ml7WqKldkMgo6b+K1cnQc+jaF+qVe/3Y9+mBNB+OlnRGlWlNo+LF
	vUvrjt0zcZ9eIx8IPZIuepDMlvVzsv1ru+anSYnldixOsS42oAE0z7CfbodCZGxr+tMJuQYR2CH
	SRfMwPpQPu62x1G8ABd3efPuuevaZx89k+vdQiB+GtoCK23kI6OE5rX3/VXYdmGZbXFybocozgL
	gnSuFiPfNMzQA2ecNbHUXbXfzCmytqHoT+/rJ1lUXrof7pGFwcqzBFBSR/Y4ZIecHwX2xalR/JZ
	XILgaJYmd1jWhi7xWb1nZ+mvaxqnNvLtEDucRYjTOhLYDvZX1Z8kyCEtrUspOYIg2IjiQ8F+i/9
	y205Fv+zemljlBVF3LGGKo3njq585vV4XMR9vmBFn6IGqZ7vnkas/eMiPEE+KbPa9SJIIShAs/S
	6qObZnyWoLWfPSlMMFXUF0lclNdNLWGIpMaCAiDi3aYHzwRA==
X-Received: by 2002:a05:622a:2309:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-54eb6d71d04mr557811cf.10.1793941021395; Thu, 05 Nov 2026
 20:57:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-14-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-14-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 20:56:48 -0800
X-Gm-Features: AclHuK8Ob5_RPYQZbgWleNRVHmNswKeBEiU-wRDX7dJ4XstMk2ACaiKWzzmO9Vk
Message-ID: <CALMp9eQVheLs1S=OMGmtnx+G0fX1-nwwP54oLcEeHKUh3_tRpA@mail.gmail.com>
Subject: Re: [PATCH v8 13/20] KVM: x86: Reject EVEX-prefixed instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:54=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Explicitly mark EVEX-prefixed opcodes (0x62) as unsupported.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  arch/x86/kvm/emulate.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index eba4e9b7cd5c..f0d5a40eba27 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -5052,6 +5052,11 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctxt,=
 void *insn, int insn_len, int
>         if (opcode.flags & ModRM)
>                 ctxt->modrm =3D insn_fetch(u8, ctxt);
>
> +       /* EVEX-prefixed instructions are not implemented */
> +       if (ctxt->opcode_len =3D=3D 1 && ctxt->b =3D=3D 0x62 &&
> +           (mode =3D=3D X86EMUL_MODE_PROT64 || (ctxt->modrm & 0xc0) =3D=
=3D 0xc0))
> +               opcode.flags =3D NotImpl;

What is this patch actually doing? opcode_table[0x62] is already N
(NotImpl). Moreover, because opcode_table[0x62] does not have the ModRM
flag and init_decode_cache() does not clear ctxt->modrm, "(ctxt->modrm &
0xc0) =3D=3D 0xc0" in non-64-bit mode inspects a stale ctxt->modrm from
whatever instruction was emulated previously.

If the intent is to mark opcode_table[0x62] with No64 (or NoRex2) so
that REX2 (with M0=3D0) followed by 0x62 raises #UD, then:
1. opcode_table[0x62] actually needs that flag, and
2. this EVEX check must be gated on ctxt->rex_prefix !=3D REX2_PREFIX,
   or else it will clobber opcode.flags with NotImpl on "D5 00 62" and
   return EMULATION_FAILED instead of injecting #UD.
