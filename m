Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5748C408
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050583; cv=pass; b=JWqb3RfWWDN2dl7imms2XywSYpmXvFfJPloekem+leWb++6U2AzHYpRKkPsYfCZLY0mAkDJGAM7r8KUQZ+ru12+7r1WSidXe16+cpvTeeZd2goIy4zsPVOdQhDeem0Aa+vYVh4lzOhnnOMtp4s3eWFGgnzkA/CtD2jrgTp0MzTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050583; c=relaxed/simple;
	bh=s0GzHLToX8l2pJV6FGUrdQW+qoZWtYzYSSm2Om3AhAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVyjEkOF5woc/vbQg9F82Dqj6hh0n8g6kgIjYrR2ZdHaic+JazghoXtzjG2LqdN7EW/SmFDabAiNs2jfvjszeYEzcg1vHjl/W9iTUwRrMmwVWkqMi+912PPN/0YhHeAgeD46bUrEvy0OiuZgPRyVD1jwMa7Na5M15kviSY9T+VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0cx1fJ/; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0cx1fJ/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3337023eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050580; cv=none;
        d=google.com; s=arc-20260327;
        b=hg4RJK8lTmsIqRAxQCzeNOEzq3UzZR4u+nFnwwvx6+hkhzxNKlUO+us8nephpTbtBP
         RC+jJpvebkDEKtXar4EhoIRV4JwinaszIPsaYd7LVIAwQt86/SKt2NyPNm0bxUwPEvgj
         vW7vfjUdxnIwAJpv/9obbuCzpROTZsr0fXFkpqi8Zu2wzH5iQA0lUUAdKz+Z17vR5RvZ
         SlydlfkcecHnzzLgoH8Rerw+8VhFB9p+lawNsRYHpHXjOVfmO8IdXQEHHbkdtszZJ/UL
         oRNeMaL09nMUbQeZyOghlFgk8mo8tNH3CESfKGk8qHswHJGwIrERzRNewbYYeJ/+0oSa
         RoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        fh=oDGbyzDNftfs0ucCkbdWSFidzJD0lVfoSZRhDCoXR70=;
        b=mXF0x0pyTvM/o5DW/HGZMuZvK8C8IKMuZ8Tk2AqcGaHSeP2PRrIH4x8uwBHe4XfU8x
         VuMlixh32lS2oSrgeoH80avxZyKUMyhCcZfVsz/CX/So7oQ9Cve+GeISVbpCAVA1+TdJ
         vzxajbJ56VNJDianWLzWgQURdNFg4BWS+9MlISbB15YtGELOt/cuzga6VW97niSKecWB
         z3l3rsm9JTWYOr/bVaOkS4vscFq0HWALWtzXM1AjiHtnstulKpTYcEGly3hfthK2TgDk
         IkOAf1WSjrjJYzqxbt+bibwy4K0k7KgKvTkAMjczvD3qNsBMyQVYsPn25uniMUlMtdyD
         VClA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050580; x=1792655380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=O0cx1fJ/BDpY7KUOgOuGRDjQHPXU2Sax1fG8UyVch+sPis5isWnLDv1fKhlI82OOxS
         NIfC6XolPitBu+MBvV1+lbhC5MvQeuY4RdH7zDza7wN+PM+j6+X9KHsTn5XfMEVcHs4l
         UpBVMDNrxx8KWwTuYTO54TYGlMumcnqDAs3qSqNtkdiUb7ddZI52uT3FpXMJX65sPiM9
         LPFcp/qfPpW2gu7vMvqb0/okQ+p1ZpdJkIkIp6PxCru0wyxuXw1aX2f87vnqUsOxHTG+
         rv7Hekdck37en3gS4yd5UwKbomrHDGm7JXe7L6XqUwqPdycf4bKkvea9wGCccF/mT7KZ
         VKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050580; x=1792655380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=0/0s8ZoxcPIiTZburceiAj/Qf10F79jIyYys2b7ijgbh6QsaeFKB5p4M23L8UbsWOY
         3vBTlD3ZY5hmIEBkoTaLUXPqWL3S+Ndxw3xZ5jK/ONLpT1prvskkONXEV6pknhzY6Ano
         OXhq/AMpdGJRWgwMr/tv4cX70Smhm66VLT1wE+Kllu/a/J5zmLIcXHbHQipIm3BeM/t5
         vFsdncopLpZE/25BZyWYrAQC0c7DqDOVwiGzSaxZZEhL6m8nsxWWOGoLAOA3V4/qWh+R
         uYAAL0+Gk0/1kiUrh2f3QepexJGBIqOKea2351lh+1tOBrirNjHUCDRZcj+yZsIrTuSg
         0+9g==
X-Forwarded-Encrypted: i=1; AKwUvBzbmDhROolI5/715cMmj02X6LZkzMM1am5iDkYUKm1v72DbiMaeGpoPzhIQ29OjITb3Ew0VbpPQMDFCt4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK69sOxJQhx05wfp5vigEpaqB+LxC6mHcyACKUQTICuELPyDVNa
	pkFi9nMG6w24d9Uo/1e1mpFNDdkQBrMvXRYLtQK/+nekMynfwO2BDgG6uIrA1LNHgVrE8xQblTT
	xoabEPCJDovyQiEuYzRlvsIa5ajuYVQc=
X-Gm-Gg: AYBFou2XiVlOJ8qr0aCDcZT3pzIzRwM8r5LE7fAFDJzxAgWabeYwBD2765HkMQM4NxH
	wRaQCfuTkGH02NKJS8GDvmnE5hIlTmMggX9LFu0EMNCi8411J1BWEp4kFpC7tUQ8XIIGoKgnha5
	4TqHbpDugjGBc2IM89zEFXHv72I8waOD7Y6AcfdI9b4YZfHGa5mbxZy914OFS+3hYYcyB+qiCUX
	UzXMIy1IpiZOqVSC3m2kZiqEBVJiJ+gWqxNHpMd3QaFJETbG4PmDOStAnfXjXCXz9i3HbQb20st
	3LKUzIHutjvD8PvuKyrJdUxLNUB+UEDi6I6iKHhn09sV3QBJnN+6o8aLyTncZRgCN6/b80bYmON
	+0AfJaFidUlbk
X-Received: by 2002:a05:693c:80c5:b0:35f:6d9d:af68 with SMTP id
 5a478bee46e88-35f6d9db757mr1154283eec.23.1792050579562; Thu, 15 Oct 2026
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
 <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
In-Reply-To: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:49:28 +0300
X-Gm-Features: AclHuK_Oo9j5QRqhps9x8wmywtw4oQlKiNMQc_P7VxvfWQOhI0DwxVL2kvoPOvI
Message-ID: <CAPVz0n1YcHwH7b8kg82Gfh7GaT=O9Sx0YEhx9jAGkZ=C1JV_JA@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
8 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> > +static int asus_ec_battery_get_property(struct power_supply *psy,
> > +                                     enum power_supply_property psp,
> > +                                     union power_supply_propval *val)
> > +{
> > +     struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(ps=
y);
> > +     int ret;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_PRESENT:
> > +             val->intval =3D 1;
> > +             break;
> > +
> > +     default:
> > +             ret =3D asus_ec_battery_get_value(priv, psp);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             val->intval =3D (s16)ret;
> > +
> > +             switch (psp) {
> ...
> > +             case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> > +             case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> > +                     val->intval *=3D 60;
> > +                     break;
>
> asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
> unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
> properties >=3D 0x8000 into negative values.
>
> In particular, when the battery is not discharging or not charging,
> TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
> into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
> Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cas=
t
> to s16?
>
> Thanks.
>

You have a point. I assume that using val->intval =3D ret * 60 should be
acceptable.

> --
> Dmitry
