Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE549EC46
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968446; cv=pass; b=F4tPMP7cvLG1bqyjEO90j3rbYVW5dms62uiq9vobhl7dQsPR78BnOPxoMqBvY8jixFz2ZahJLYpgLcNivCrIaoBUG5TasD4+W20QRRHo8a2egSZA1H2Vlxpdp0El1V16Dps89B0Z5f309zIYsoIT+5TVCKMuQAu8zUTuYnZVtF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968446; c=relaxed/simple;
	bh=tLFxslh9baVvXmIpYm9o+POl3faCnXysDmFb2JzF7bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG/gTRE+vqL6fS4+HC+ZibIqmOo5DtXiC1cZqEGc8U+EWn9cPYYaintjzpROTUa1oXRcez5kGify7DnqC8wGiUZOVRxlZ8RaFbT5WgxI3YYtlc4coiVxb0XOu6ccW7qlgZJcyr4t5xP10zSP4RbjWgaK3KWRwE2W3VidKdFbUu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn4pgo0x; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn4pgo0x"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3653167eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791968444; cv=none;
        d=google.com; s=arc-20260327;
        b=sIP3pykRx8iUoELfQW64hAnIbgUBS0Un5zRvp97dWpR+xsMZk5Js2auiSr19QNbw6T
         JK7SqxwAIroU4ixOVrfMdmKqOVq31qqetAwKhpb3fJQ7a2VZYUknM2MBW89V6h6Fibbs
         yy8MoARmWit3GT/0+E6h/Y6v2yepEsDOIzWQ8Ez00bIbffplytmMFlsuf2FgR1UYJG2h
         vJ5oFtdokhEmdJ3OOLJZIdsPMP9ZlNTlcdPjxPLOMyBfT8BK6vIvEylVoHlhyjuo455R
         8Pb/PRiRv0OI9sWyfxuWphfmW2qLQ8MrTALOQLfltLWuZ4utfbx1dw70mTJdP0nN7VDI
         pllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        fh=Ilu6q5Skjatv4GzCexNnkjlm/Rlq2WjyLJ1LznFdIYs=;
        b=ZmGYfhFvBkecxpejj4K/o01e/mmUYwK5xvNEtYeB7pS4oRQUbG/wrO7INRo/NM34Xc
         ltxKQ31kYXkBTRNy+xPAhxW9hRpsczlWY9jP12gLPdE1cT22wETQDaZ6VP1+x1GClOOU
         Onj7FWKkHopwK8reB+jylbxa9HUUdJ0wpfU04EEGEirigNg41VeWz4RWuzh2mtjPEGoK
         zP3IxsowUZjJafZ20cl8aNLPsfI3AJD0dXTuZIpflY59yjpZSGO+7QnW39NcR0bD1b2c
         TcBKkUq/VPFfShO/x9DEl4n1ZTJdx5bqYa2i6Eo6DtqaGTC6fvCpntY69QuWpz0T31uH
         loEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968443; x=1792573243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=dn4pgo0xHtSUKgUFKsL31ZRID9HudJwxvdKau/+p/4ayiXhPQ5paiDSZP6t/9jjHmc
         d/omFrVGUKCMKwvlIRp+nZ9mCceUM5c+IEu/cwSf0bU68i4yYHzZWIoP1xyFsz4G6oTV
         0R26qzCL3fJZk1t+lYLX1uvBMP7iiOfhd7pbPP0/sBBWh1onTAtNtf3tEUoz+xYImUwQ
         15R179ZvljmfPR77ebjef1Ll3pd9j+RR4Q7oa7GNfl3aBBAWWCpI4V7H8CBn6KtGEX/O
         hvM/MRYJkOIL1rHYPV/0Fd4sUJBDm9c8AFWYrkbAenpJM4AhFqRIybzKVnCN4yi+3MKH
         FLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968443; x=1792573243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=xVcIo3Wabp/OthTQDjVkG2oa832+/8qvhayCu3dYjbps1PIP2eEXGx2E+ue+V4A8kN
         rUrArulhk9J9/p2mRQmYl0N1S1DUY7hSTnSbypXmQ4LiFJr4Q26l8aNxXFedUHVs1SPx
         uU36EpDRi//wL2YOmubDzRmr6JgRsTLEZlztHiu45EsgNC2cAle6SKztzvt31vrJ1eV4
         /kqKOeveuF19+IuFxShQcfEDb547EK7EWVw2UTF1PFL4StRFEepa6jXKJaz4gmZjEo6L
         5rWCFCDI30LLG+BBW2FdDM5xNX9ec5vCqwelh2WQ7UsKoYF3/VD/ZlAfeaatBa8cuEkT
         +9Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzyW5/+BA+4vr6V78+fJr/s99r4NoEPfYCfEyxZLO+hUqrlHWhMByNuLTYByGwsakRj9QRYklRksadP+CA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbYyVwERJSdTl++IfPz2FUApiB/nttELqVbBEq6F0RDVmEAHG5
	c5JCPDbLMp7JBBbG2jg48b91OZLA/rU/1Uo7w1ocTr3PYeqS92nRXcT1UkQwQFc2l6+zgSF98JR
	uH2mHOantNOUweJHAdsjjJElmvpzgcjk=
X-Gm-Gg: AYBFou1O7xFUjj4QtLdmSSXHEjPIWerIshWV/8vwI5HhP+eqTJIMJFLOol03Al4bihN
	baWOjUGTNtwErYW8+FSp0D0Mh3UcFXvDPDUsAEUaafVJS1LVeRO09ofkD7ClnMZ0ObaSR12mN/2
	JkAOPao/ApvhXVaCvcfuVNMvA9B7UZimDW/xH4TrXr9bK2CRQjYk2aUJFWIKDa4HGLPQOBQS1jh
	NKpEz70COkBK4NEeKW9hFwuo8qj7Bj1+Ba8u0ujH6NCI/4Q81VbNNiDbZaHzgJtFvtkMjYGe5/k
	s5e2GEa0ou492ouVbS8cY+VPZtB3cVqNgwH6SEUB3BHIFMWHFGnO2rh9tXK2oP/WxU32dW1Cz7w
	TyznPhpZ4kUl9
X-Received: by 2002:a05:693c:8819:10b0:35e:7bfd:4613 with SMTP id
 5a478bee46e88-35e7bfd4881mr73051eec.40.1791968443288; Wed, 14 Oct 2026
 02:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk> <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
 <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
In-Reply-To: <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:00:31 +0300
X-Gm-Features: AclHuK_kokY8VK1sVn_A_0bMv0Bn9Zibgf0bMX5rADMwX9GRUM7_tx62sAWh914
Message-ID: <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
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

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Please make the entire comment a C++ one so things look more intentional.
>

May you please be more specific how the title comment should look?
Just to be sure we are on the same page here.

>
> > > > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > > > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > > > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > > > +};
>
> > > There's no Line Out or FM Radio widgets, you should get errors during
> > > probe.
>
> > These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
> > used by LG Optimus 2X P990 (star) for FM Radio.
>
> Those are reasons why someone might want to create Line Out or FM Radio
> for a system, but the fact remains that the machine driver uses those
> widgets without creating them.

Ohh, you are right. There is a missing asoc_machine fragment that adds

SND_SOC_DAPM_LINE("Line Out", NULL),
SND_SOC_DAPM_INPUT("FM Radio"),

If these are all required changes and you are ok with picking this
patch, may I reload it without delays?
