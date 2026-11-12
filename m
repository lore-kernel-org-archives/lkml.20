Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511726;
	b=0mcwqe9KLxiLkWl6TJz5P9aOKLV2C7ATWIz2PE/c5IcFGF3UU3WwZHrpvo1L5zupZpmS
	 snGQid3rRdKIQ2btpFY3w1rrlqzc3WnC2yW4/y4CO9JdtjEYPiS6ZrlimzlyPSj/3aw9J
	 YcMgQcuNs6FSqkYoNbNPdYr66ZaBuz8MvmSuccD0E3qMGmwJEsU/9JbNRidkotNZrpx7W
	 vTi0luRQF1IY7ebg2VJNiaT3lyUO9wrPsydb8rgkONDbjHnp9YPW0u/rfg4+or3VPUS95
	 AW1VjhPWlZJOzZB7XfhGfoNjYjsFxPKwPxVfZF9k776xA9lnqbH2xAJOzJtzFIpHo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
	b=LvAzrvzqnMYYaVo2Insp1pqlGWEReh0h2OmxOnR8tgUD5d+mpNZNpdN6YcNscIuqEqZA
	 YXQY8jIIzZr84xM+eyBEviDyx6Rr/HG8dYm0r1O6uvGjgr+4ozYzOE6hpWPHbJiWA2FZ2
	 frW2yoCRxhbdHwVRH6Nm+TgMzTf2pmBMG5cPI3VSgn2iT1qVp6FOBljdM+vSLtVKOcHDz
	 ETiFaCOD8bvZVU0zjg2pIxY7QW3fvAchiM4B/+06jG7HSpERd3KPL7jdzcPKam+l55lkd
	 JZHd9fifIl001hqSlVTDyvBIbQVKGc+URHEuXC2oQ1KGw3zHVXkS1X/uhnGS5rKlf1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntm4h6oM;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB44606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntm4h6oM
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c506a231b88so14959366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511724; x=1795116524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=Ntm4h6oMbZtyqSa2JGYJ60Ndw3pnTBKUvrnqLF1RgWRBQPSzVDyTzn+ay7NBV6OVau
         d53NZPwz8D7VRFBejJJ1Jn+zF21zzU3qEDaCmHwi8yrUvJ/2TfrEtmctgrjd6uJy2u3O
         MH9LSUsw825BnJalEaDPkDcVcXqxsavHcdvag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511724; x=1795116524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=ORegnBqwiPVpO/tgl85TSwVjfhL3cvlz9oUNMP/KmwaYX5w7dTKtDdMHamfp0D+W91
         tOuaIWvQG1xHvhk9JQpRSXMFVxBnBELbvlmpuvXmsNVLUhllTy7MK6sf8F78L+FNN1NT
         rT58Q06lDCKD9ezzrn2ynBg+dY1lrtteTJdU/v2/GRnyQeW5iZvNmqBDq5DTeHLXipHH
         CRsU51N0OwfNhXVtPUqPvtyo2YD7IPbrvkEbZSYCTIHCfS2iZQqFb+3D6Gnzqe/7xoN5
         kQMZSpRGBiLcGWlq/GwZ5ogs333vljSmotr1oJpnYU/NvTYNXVg2dX+C9OyXIzWyYeMo
         uyIQ==
X-Forwarded-Encrypted: i=1; AL+hErGskRLSTZQT/6S26tQCGktDc6UqDoUfWdcSfMWVjVQA6fdDTJbk8EOcxACINAzAscSpragwu/tNmVFAUzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CXKRhaA9WoBwOpMsXSVgjfAkq8UnvkWejvrERSdVb6btC7eMT
	FnzemOBBTMEend5pIasPjpVX+qaD4kRZOFB3Psd9hdekycbnzeKgCKLM9P8+GPKiVfL8rRJrvP6
	Cn9hhgrwu
X-Gm-Gg: AYBFou1lpRlf0I17gbliQ92PxoipIwtqFfsPGAobBtHN1e6e++cmOjuT99akshh/8Dh
	pjWf3688ZfoXtou+w5P5/NKUc+9seKkSFxJR2fzghzLt/QNnH2HleEFMTKBbF2S0ec4HvB5oQq4
	W2sH2y9xXlOWOeC9j0z7eDUNUFLQUAQvupOubuuHUleK7B3Tiq76mGmN34cEKliOnWH0aMSkLu2
	w721Mh9k1x9RZB1kkR7OQe2g0TLQFiMJRRRYv3MFKJbbDb5S/rSyk4CYiMfdLKkexFbRCqc0aXu
	NiaGOLZ/P+egz12pX5D6tIZXCvNkNLzNPMhOolPIgVO9fpfIc+gAyLs0GFYDmb5vgbrsPLP7HDW
	AZDkUpfv7/GYx3LvcZ6UfY4m2bfe+F+T4+5NqiHH4uKQWP7e+IzJjDrlT0pBeHSjxOCXSt9JDox
	jrwrhT6TQoTkVJApvd53ALRTha2X7wQ/LglPmg/xLgFF9DhRE8gDkIUsEnYg16zzqwgxsq1OVTp
	UpBKV1FZxNBdxtdaS0H17Idb32N+Llb65i4xr4rePG9+Yat+9FnlXeLgcHoUd3/BFPF8Oury6Fd
	9IMK7++UsrEDt5f/Z5GRFFVZFddmM3/s6UUeCUdobzRFc+7QTcdydpelnMeIL7KuFmtB
X-Received: by 2002:a17:907:7ba8:b0:c50:55ad:ee74 with SMTP id a640c23a62f3a-c509642f8d3mr24498166b.26.1794511724582;
        Thu, 12 Nov 2026 11:28:44 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23708sm9963466b.24.2026.11.12.11.28.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:28:43 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso91227f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEr+yRlPqGdcgsJJ6uMXbo383WDw9rkcY+rzREbB6gC122vD5L3aZsd5GZAdObIoDlovAEUsxzvUhirhmM=@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id
 ffacd0b85a97d-49c6a645dd4mr1080826f8f.0.1794511721573; Thu, 12 Nov 2026
 11:28:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss>
In-Reply-To: <avUZ-uqxLAu2ICyJ@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 11:28:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
X-Gm-Features: AclHuK-14XxhBI8vAM9M4iq5bb2RGksEhVHE_lHln7MuRG1naDAYFNT2nkSydH8
Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > > > > +++ b/devicetree.py
> > > > > > @@ -0,0 +1,226 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > > > +"""devicetree - Non-flattened in-memory device tree representa=
tion in Python."""
> > > > >
> > > > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > >
> > > > > I'm not sure what to suggest. Would libfdt_devicetree be too awfu=
l?
> > > >
> > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > objections?
> > >
> > > Don't love it, but can't quickly think of a better option.
> >
> > Would libfdt_tree be better?
>
> Not really.  The problem with all of the above is that they're making
> this library which is about managing a non-flattened device tree a
> part of the library/project/namespace that's explicitly about
> flattened device trees.

Personally, I kinda liked "libfdt.devicetree" that Simon suggested
(though my analysis says accomplishing that would be difficult).
...but I can also see David's objections to namespacing this under
"libfdt". Does this mean "libfdt_devicetree" is out, too?

One other option is "dt_livetree". That matches the "livetree.c" that
already exists in the source base. What do folks think about that? If
we switch to this, should I move the ".py" file? In my draft v4 I
still have it under "pylibfdt/", but I could move it to a
"pylivetree/" directory...

-Doug
