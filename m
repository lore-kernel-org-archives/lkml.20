Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F5538D8C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917777; cv=pass; b=Wf/E4o6tFcsXzC8NEC9V7CPlgJfh/7qxFqlYv7vIcRR8b4FQtT0QFomuNZikIC5LITcqrrWoFVaGwpZXBJkcBhBwblNztPF74dzLfwkWdumWmzScfRSuh9158pYwsPtJ8Y8uIrFVGJr9w3GrTybB0pnSf1jFIsx5Ss1j/Ifgtc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917777; c=relaxed/simple;
	bh=Npz6MJpL4OKnNkDARrkMIsl8yNRoSsqdy7nWQsZF4+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5h3/faFE56PVQcLQKYqFrOnUtOfzczFFUAqD/UeUaCzAIy/KuDaZz2gH3dk4448GRcEiRUmPTUaZwj19TgnhpoDok2/nZHUmmJrLrAQjxKs+eBxIdSC+nZfgNFbQblEFAhCRJApJhrO01z//sFkiQ3cKC8YQqHbhcWBy1pSl2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3lQaqLb; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3lQaqLb"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so299421eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917776; cv=none;
        d=google.com; s=arc-20260327;
        b=fg4niCN+vzU4uVlEvUN7yk03lk+9ivDh/eYS/oaVFruJNdnMQ3zsHPwBZO4YZC0mbw
         +BMWInCjT55si0H7y8TkW5FjsaUH5LnHWrzRhhA0QwzCQ+n70jUmAqA8zOB2X7ZegciX
         OwbDn3jcG4EO7qAgVxCzcxgj8XPn90zsMEECepC3ylE2nkq62IbRWHBLYvVxUgbsSnre
         R6Oa9U4q2/lo3rLGgn6SIMSNTUTLZyBDCREjzYBYEUyXcwf1R23xJK2OyJ6wE9yDYbnH
         PZdd+yGBKHbLKysiNnzANep5SidkrYV5cvE0FUHTT9yv6Ib4GacEEoTalM2SiEIRGTaP
         nvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        fh=R0ILeHY2ZBY50AjBYyRMgPvhEBPnBFr94EanCAWJClU=;
        b=cbsbUFVZclBFL/O7L+PINWxaN14u8vWFKavFAbimRByOYhruohoMy5uUm6BFEa3S2A
         7EIV6sshOomU8abD63bkOfUEECyb9HmEgJlf7N2mjjdCM8XEOAW5suy45fInnTlLObqJ
         9QrcoU0DhdyJB4D/e1IMjSmQpFeDWIJWaHCYKk5ygaHuu8OIbQqducZPp+qwcMkgjqj+
         s08GXACUldle3KDmykBnALcoAOd3p2TESdcNbcpeRmtpBj1p4eg1vincurFBDCp5X/z6
         44zElKYIcEZA8TGod1g/tNMZ/h37jDV4H9BnETbTme0n/VHmnaiMygm/OsyrnCg61wAT
         ok7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917776; x=1792522576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=e3lQaqLb6B5aGi4qjkf7UDw3znnRWVPNZ/Xi+a/e49uRYul0g8nN3D+HFHfop7vbjL
         SUpnXHSx/ai8Clo9ZQZyGwK/BduRM55DGLUUFwuUfa7uKEmFbozcNJktf4WZYxBj9Wdp
         Sru/3KWrKuUurJ2O4T8SfucLWJvHrmhCf2J9BxbTGuR+e8KKU+5CjHCo/KoqWMLVosWz
         0ufpIlt4gYUzVkR7df1yx97L7SfuujTjvqhLZsw6akRiUJfRjO1e7Gkx+u2C1Yra2mvv
         FskhKDm1Oot32W6RsNRW0IgWfoKtIZT9g204eWHvYRquz7zcQD58g8vMh9V2Frh5QBTs
         5u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917776; x=1792522576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=v4Y/OOoNN4KkVbkNY7vtgLt96P9zyfr8taqFu23uXXW9jKlNTcEohOaJdyjbl28uh0
         KVb+93G7ZUdrbH4okhmSwgUj32eVGrlgDeuF4QUhwTDCzbCMkhvi48uCuBmJYIg6/6zc
         R1AE+TQkwPuhQxhRUh1jaAgkbfnnGFXvEv3zsbHzBXWsGN/0sLeBHwCAwwh3Rm0L3Xwk
         Ct48Ek9i9zXSUmzdaFdOUEUJqscAQ/dDxZ3bNZdScH0nFylNh/vv6XBd2xWhr/+MOpEj
         Htiqd1SDSFaAVTEqff4BZ/DaYZ0iHJZECfv1vBP5TaZTJ7ouUxysXXgiWjg7fYOn2z8r
         Cy9A==
X-Forwarded-Encrypted: i=1; AKwUvBwtsdXeC0MvhdblJNHsZoqolnadcuDxe4mf9ZIbrvCUNGzBs6TmHBlZCC1S8zuMI6+8j++9VO+ZXEhXfhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUUb0K3Jg9oPUfdOC3iYj0ZEqE4eyBeoCd7g2cvrjVjTVKxLQX
	ZCojyQWr5yw/STWvla8b1K8FiWUOabkj802LsegQZ42o2A8Z9ReTTAQ9xBuPcDWNmXUqa8DmZTN
	w2MV6u5gbsu4dxkYphReqMTAR7OJbLJs=
X-Gm-Gg: AYBFou3bqmJlWKqeWo066D8VHSngN5zgXz0s5vy/pUv2033owx5cPbHK2s1Sfnk2+RJ
	PQX6JqAapuXCn6+whJa6pMWxEXv7UCBijFuAX3BFuy8uW/GdFqanyX+qlZkILYyBWEO37+4vPO5
	UPzdY5PwaLMaowcIIIlqedcB1lgoNMXVgD1Pr3TRn6HliotPMJUhX82tMbKn97/R1aGT4iJgjeT
	w8Y/ilV13l1TFvh1FOSpGaOFEnhAb80JsQoDq8NnuG+j12UWpTDWcRUWTqJ6OXqLJku42sMLAHa
	J11sjcnJ6QXH6PHOQbdpMIjvQII5tDF5lpmTxRogts/gOVnmlOWNmmzWOyHx1x3QdqJwDhW/2LU
	+16ty4DBKMBk/
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id
 5a478bee46e88-359d728ec5amr11295040eec.25.1791917775546; Tue, 13 Oct 2026
 11:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
In-Reply-To: <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:03 +0300
X-Gm-Features: AclHuK_OtQxv-lLSRNaI0a5fKQ3a0f0GrZurL_z_b4XMUDM8898Nfx1Ak8Ju-Do
Message-ID: <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
2 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:32:26PM +0300, Svyatoslav Ryhel wrote:
> > Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> > machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> > (P990/star) and Samsung Captivate Glide (SGH-i927).
>
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 =
codec.
>
> Please make the entire comment a C++ one so things look more
> intentional.
>
> > +static const struct snd_kcontrol_new tegra_wm8994_controls[] =3D {
> > +     SOC_DAPM_PIN_SWITCH("Int Spk"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > +};
>
> There's no Line Out or FM Radio widgets, you should get errors during
> probe.

These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
used by LG Optimus 2X P990 (star) for FM Radio.
