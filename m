Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6950E27E05F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598635; cv=pass; b=fypGLSe74za/e7p16y7RF20BLz5wj6GHcZn4y5PGRhzCkcaqho2O/Mg9eajxec9KecoauaAhharP1zan/IjmywF0MVbjfP43W3hzYux53SG/Y3JmuO2/r5Ieijds/Lv+ybh2yVf+yzDyYgLCZcrgB1GAS5OQFmZEP0jt6TXjo8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598635; c=relaxed/simple;
	bh=huKQAayLatyglgFbqKm96EgnqJce6Ukx2wu42Xr6OGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etUopK4lpkW7aHO6+1yxwbyyB3D1xF3QfYiZoFPaMlz4ghdxLE6W6HPi4lpe93OIi8lt7nldmhAXoUIF/iCwScorL/uItsuk27lpQTsEHL4Q+b0bvN6zyROi/VqsrNVHklJn2arh7JcDK+dEeEB7Bit8y0M88YVxDMHf2G0tlFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qZhw9SfX; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qZhw9SfX"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df8bb777e4so9952605ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598634; cv=none;
        d=google.com; s=arc-20260327;
        b=CsoLrR3elb+piRMalNMNQi6vYnDOKJeBm7T4us4j7waM4I2QAiQaaVL2dnzYcgbbZ9
         D/jISScFWf8EV7jhi5OeECCz2HYfEmJuZIGZ4TGk4YoDf66cTaacuGD/gtE5csiHOCSj
         Z4TIKcemYhrvVEqc0VJTUJ3PB5I+Gdi3gpFBlPgU2i/CUyabSBQiHl6xqvWP6uypMalO
         dtkCM+fJX1Y5wI+GoqySgBEmzHlCkcu/OW1P9Qazl1jPJ9f/RC/zIzsZHQeMMRPJlUbd
         KFtIEH2q8QpOUZQCuxHLpJezNFfjPM6nrno1eNOVCEaGGjvxt1tpweJy2UNcS5uvDSMW
         ST9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        fh=BpkAHr/kv5T0EX7GnGMoH+kk1bC2m/moulbO0Urdl8Q=;
        b=iqzAvsPhW/5kkaSwaNc7MU0JH++tKybJMshEvFIlXFlRs1kUfxDLyIe/zbfWiv9oon
         K7e8jr/FTVRNxU6PSNWpvs7lNT3TYtAiwBPrENvpsQwCw9+0orVSXlj3oqj8K+/FtvPQ
         dOmBAMFk7Rtgm5A+pVaCwHjOFmkwBMkHEWzjFdAFNuRkieeuAQUwb5S676NCADJ2l/OG
         opMsLtmJZeLuhzmP9M2Jp4KD84Zajbi8mOr69lSEi8/iwrSkKhDr1xrfXDJ6ia0DmuHV
         DtfxWDdz96RsvoYaExpK2euFIqRaO+uYXKrGpjE+5wSLfSc1yOeebX6wroBXwqZJ7tmG
         VifQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790598634; x=1791203434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=qZhw9SfXzomlQg37NZRw1Gf46SkuvQpa1N6CnCdxoIZFJp2k0xVBzXcqYZZThhROeH
         SfRmjmxGCBGAmWrK0LNQPrTvqOquGpkS7TpdvIZQC2Jr2atdg4duBMcf6150KRFfQiVh
         oZdFJnDL85s5C3W5/iEFSEaC22TJDPQtDQ2ZkzvBYtUQfKAjwS1DofdgR2qgqGNOfgs7
         2OyVBIOIZ0dp6moCcgIWp5GAZbHF2MpOFofvVZg78+myDy5r2PCMokAnjmVe+NjznNhZ
         U//VZZkqcqzP+Kf0IcBShcvIsrixiAl4sRZZNaEaIaGoIshANK2HXq5NIJVroLgcsbCE
         8RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598634; x=1791203434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=qoQNC/SD4iNFR+jHBQ/F8OqZmRyFhyAtsP92bZuf+Eg4I1aOo7qI+ryHjnkpPJIGPG
         ddm1bwhCRL2gCg0o2kz32vebMHzpNzLJ82THRFRv82CaC9K9wqaD0SiMplr9kZSfosvM
         nyII+JZKT55pWMJPjmuDw4kIvKaCXtee6TJuMItWhv4xoaGOVbeSaPKjdASDBzBUhffY
         Q5no/Me25ByLtJXH+txY2Ge/Hz6iLgtNywBDGLTkk7Md8jTSdRmALdhw8S2Sw1HwBLZH
         2YqsMV+ebAvGYTIkteVgJVtJaTHwiOQhOLwdqdGNFRdgmO87K2vSWmC9FOyTg5glvrOt
         Sw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw++FqeeHqM03SK7X0aYjFLC0wE4dAQKuRCnLECPBmZqBipKH/I35SyzhZ4xgY5+8ZCV8eUlZhQ4yT4ZyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpyS0g5IN0cEivgv9QvZgg0q1ntBqXiTPeyy19cDMwvJc+oQFu
	jhAEBVJnhrZzpArH6DcPTrQqNzGUep20+iJQGeXvIiacWaGqd6F4YpwtiKOT57Ks0z/ieWsgcLL
	yf7lDKTbPK+2WXdOCeAhRq2fiyINzDasBhQ9FGdh/CQ==
X-Gm-Gg: AYBFou2fQ5yZyKZWFF05vWZ6pcaHrrOdITw7lUXwxuWnS/JW8gCDHDmY/8YH+FHx7Hd
	FkX7bAaFBRlMR1QIeNeOENI1aOzWhc0s62Y3Ps8tJOizdDd1NtMjRPMbk8GGHNo+I8n/qTkf8sl
	Fv6K4HFvoGHrNFUJAIQ8YFOItDIO6ygWNKfk8LbWnjecBwInol2kXanR4hOK5aKsa8UAQzW21nu
	N3ZPmSo+Yxm8f0d9F3YLQusgnJf90eVTXhvJFw49vdrzx8VcvjW7oZmIG0IyxoATlAFFb2nl3x7
	9SYEmS5ceZWoJGVOSG7nAFh0xKrjX7ioHkZRFSx5TO4rqW/owASnBQ/tbL+a0v/ARK0MszvRQ+G
	FzX2QOGhPWdfU/CcDHjVY+X0R+Y5LmvcFcMs=
X-Received: by 2002:a17:902:f54a:b0:2df:736b:d7df with SMTP id
 d9443c01a7336-2df7dc59ed3mr102946795ad.42.1790598633625; Mon, 28 Sep 2026
 05:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-6-robert.marko@sartura.hr> <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
In-Reply-To: <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 14:30:22 +0200
X-Gm-Features: AclHuK_ApYIEoqpVKRFrihxpibz6Yiy03tz8KYmapFitKvFghmCeqBLThyFR5Fc
Message-ID: <CA+HBbNFRufMuhuSiPnJSgSMrGMN6DeskS3kLLogwHk97oHzx1w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, 
	aubin.constans@microchip.com, ehristev@kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:09=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> On Mon, Sep 07, 2026 at 03:25:33PM +0200, Robert Marko wrote:
> > Enable the QSPI controller and describe the onboard SPI NOR flash.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> Missing '---'
>
> >
> >  .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/=
arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > index 4012ea7d07bb..985ca31e74e7 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > @@ -463,6 +463,21 @@ phy27: phy@27 {
> >       };
> >  };
> >
> > +&qspi0 {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <100000000>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
>
> As sashiko pointed out, #address-cells, #size-cells, should not be
> necessary here. I dropped them and applied to microchip-dt64.

Thanks,
Will drop it from future v3 then.

Regards,
Robert
>
> Thank you,
> Claudiu



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
