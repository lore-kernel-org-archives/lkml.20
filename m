Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674040;
	b=KbITSwJCMRgFo0MbamCCrjx4zrRgWMs5nnEXx0ufhoYsiiZt0LRmqkZHKRC3QgFfojvQ
	 0F/++YCKChs1Eo5jCOtU0PoEifInvvupJwAySKCasPyHL4GVcBEp9whrQWC13Q/JBiL3F
	 FyUd64cSMnYq6++q7FzWmVqQjs2zBQ7LDGem1CrSw29nZNkIanYUmmO9Eo5sFYnxafL8r
	 cOGvWdCImQAC94vlWbnMBOYE3ROU0hQc5bouck9NuOwJGB4F9xPs7VrU0Eahq8rOqX6Sr
	 3Cpqv5//BkoG0bXy00VS3ZfEYQMl5ZPn7DkObYm8JRWJ8ZMY9w5U47S9CkDtPz5KH+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
	b=Tp0D2dQjCglu0t6uvGrlBNb9V/1e2QFSdO0Rkm93J9myzn+z8tbuinzaxAMfexTZU5i7
	 wqbWelomTFyvA17V3oOOvr2PpdeKhplxU/YVKSRYzJRbjpTeuWNVT0JCDtn3G7kkwlpYw
	 rcxdFVKEz6R7SVu61qnXc2wIBdLMnhsnSk4cg35xD26T5yrRbXjo6QZ3+Lhfa3sJQy0jg
	 sD0hgaebPirxrh7NZcAFAB8O00iFXGhr05XtpkJHrRkdWXk/qiT14sXw6kNAhij+ufkWN
	 sax8Jamgqvoexc0WLpcE1mt2IQbjrRUrlAcjE/+cU4fmtLmz8zL5E1H4KOyUYEx2QUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWFmu6R0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA618606A89A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA618606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWFmu6R0
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53ec2cc397aso1975773b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674039; cv=none;
        d=google.com; s=arc-20260327;
        b=RuKQm/bk7qjRe82asOLoRlREbCIQ8BfzjC5qf0ziDwPu6tuInvvSgTVZaAuX1EHlup
         MEf5mXYSsDL9GIoQIS2Jkj96p0dll+KuUFjCCWiN6ccLpFVKHB/8giPwy2Xy+tveSqmw
         yJkBUrrgjXoPCe6gSxMAL4mkTfuSBS08Kg0PESJSj6v5QenyA5IBpy5wKKydMAa1vWQR
         S40cXrmgSbR3199bRqKFs2MOG/kQwZZp/bHGZYxPm9giZMONaJxLihJEg2oxutm/yS4p
         s1u0aIk2kR82V2TXGlmZAy7MpcfZ/76xjjKjnFe69QAiIRAut4XK6vtyuW/6EnZvSQOI
         1IEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        fh=SK8hek3p74hORIrus23MchQ9PFI8j6doHng4WC8k8RY=;
        b=ADaON2dUzE3Ds3onaPtZ9VBsLWrd7mI/5FKILW6W+AO172yElPbYrbX0ZAdD5ljfcQ
         cx8smLFpffdPNsp2XWHr2TUEssePUeksPuqpQud763+7fymvWo5QwS9dGCRhvVG5nYWb
         0pz04QlMGQxopcZ4FxHu9a6Mu1dgrAK49rz/WETqrRJnrtGTENgJpNL63tPhWfgW3QbL
         hmPIVtgmcG3w18FXZf7RI6g34WsmmF5OudoA6uKfR9W6e/s6oHI2gjCUq+6bc4urVxRo
         jLKJm99zUyvAzcsPML1pF2BkDyDqv9zeSMi0dD3k9gMaSKmpXmggJpkpuN/2H2Au6SCz
         anoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674039; x=1795278839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        b=OWFmu6R0C8YL4ENs8faaN0ciYYzcVEDiys7E3Uc06wkN9wS0JTVIkyPPsPF0wk6kgC
         JlrWhzO3erRR+pXGWPERJc5tNwtVLL6gpoj3j2D8QLHnm9Eai/MocsOJ6BU52Y5zWdkz
         y5a00k06+ZzW6RGk6KasshxUDxNFsF5JMuA0DLG/kc/1tTLB5cig1EexuJMDKQIW0OU3
         JcfOl+rZExxQx26gAzKbJFglqWVh+5ROuZJ6vIurtJtxxFw+VrImfiWRA7HWPMUlSdhO
         N20GoErMxH/K6Awi7nNir4kqVtf3WJWqWCBmYrwxv2IYBER1VSgMSALqlWuDFx1DlgGF
         SO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674039; x=1795278839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        b=zjXnjUkfXbzPANdeiSqp4HaKMq/PKeBVXSQDU8wqjbS6nFugSWMEaHhF6HPrfTpVYv
         LUNQxrzRqqIdEbcHP7tz3y/zXWWwGHutlGJyg38uD3T1jISPd0Lz+eerhFxEXvsAjeTV
         p7t/Dckd44s9dkBXi3ZvbieYoxwGt0oJ083DPcdKW76a/1Ff6Y2swMcSVjPGOTEdeY5N
         0OwQLTnJvvNVMVJ5j2QzkM3c3eCYejGEEuodeuucuCG+F8dmwM5YV3xK2EmHV7vfB+bV
         x/80rUAb9g3O76V/wxJ/og6v8A0MCbUbJNgVfSrQu/HaZY45Af6wynMhALcmr6VwLkAw
         vovA==
X-Forwarded-Encrypted: i=1; AL+hErHIKhqG+pNQVgRvkSPIx+XKJWwg4Nep8fqdFWFfw1e7fzw91A2FlfOdpkIKpAqa/7XEgeE1NSFRMBD24KU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9myF7pE4Mzb8ILJKWmZINs7I1p7BEWgK0xQpzgJKtiJJ3m6HGf
	KF8YM/PDvbXVdEa9+Fa/xwEYjZAt3TtmNi0UFgcDNEBX+OkaeKl2+CR7e+dUBUEq1DLokAR2ZeJ
	nJaCeaSrVHDhoA1i414mbw+67NbfYh5Y=
X-Gm-Gg: AYBFou2NVkhV0qPbcfVMHNupefo7RiNvI/kcyrFe7RWmCfE3XF6wy2VVPTxG4rpYif+
	xWhwuD3ytiIAErw+lon6g3/OeubRHkTELKHWz4cskOQMCDaij+6QQyJExzzFomLiR2ppsG4ZwI3
	6+FZdoJaNPO3uUo3rtyxrlh98Uu9NkNE3Gkx8zMAFO628PHRoruv9/jvYosOT/KSPzT+6/Vi7iC
	cCPXYQjjfDlUTQ8Cd+NLf4Ci1c62HSk4p5DtPYiHzzA+KDwErypsY27SL6lA+jiyMaBHMuWsUN4
	cKyhMyZm6acwn70x4bah3lNtXRaEnYfbpb0vLnf/lrpkAPpLy98Lr8JubbTtGDdBW1SwI7HaIv1
	pcc3Xq9VBotp4hxJqQbP4i9T04pvJYTeuxv96dWbs44+m8ulq3ibc6y1yr6zroUj2/cUTcpQSci
	4gm7zZkFpPtfB9znrvT/qD7cxd/ZM=
X-Received: by 2002:a05:6808:1828:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-56e62c65aebmr5235131b6e.16.1794674038766; Sat, 14 Nov 2026
 08:33:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111163954.1132921-1-mmyangfl@gmail.com> <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
In-Reply-To: <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 15 Nov 2026 00:33:23 +0800
X-Gm-Features: AclHuK-bXIpGCX3Wcq3WkSJlabtqODxxVnCuSNH-sxjj3O3IH3tG0EmoCH-wbAY
Message-ID: <CAAXyoMOokp1yJYKo-r9MFehrVTLcL9+eQQ386Ycwmw0ut-KVYg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 11:40=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> >  static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
> >  {
> >       struct yt921x_reg_mdio *mdio =3D context;
> > @@ -108,6 +196,12 @@ static int yt921x_reg_mdio_read(void *context, u32=
 reg, u32 *valp)
> >       u32 val;
> >       int res;
> >
> > +     if (!mdio->synced) {
> > +             res =3D yt921x_reg_mdio_resync(mdio);
> > +             if (res)
> > +                     return res;
> > +     }
> > +
> >       /* Hold the mdio bus lock to avoid (un)locking for 4 times */
> >       mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> >
> > @@ -136,6 +230,9 @@ static int yt921x_reg_mdio_read(void *context, u32 =
reg, u32 *valp)
> >
> >  end:
> >       mutex_unlock(&bus->mdio_lock);
> > +
> > +     if (res)
> > +             mdio->synced =3D false;
>
> Why defer the recovery to the next transaction? Why not do it now. And
> if the recovery fails, you can report the transaction which actually
> killed it, which might be useful for debugging.
>
>        Andrew

If the recovery fails, you have to, anyway, try to resync in the next
transaction, so recovery here does not help other than adding more
code. And we did not and do not report failure here, instead we let
the caller do it.
