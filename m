Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD644AB77
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516253; cv=pass; b=Ood8HR2i6C3extSXG4fKPkHhZu1EdPZWAZ8NFAWTsN/5gmjymx6VrsRzjmsDlWgTpwhUNNhAuNkCbPSYMDuYuc3eqme3uftQ5Y/xVlAyJ5E4tBa+mOiP6MaeWMRJAtrNn4rmSm0AKLToggxuF40iC/fo2DqYl4rtGPn9vheKNq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516253; c=relaxed/simple;
	bh=6pWa6nwlBQWirCkIeVY8vaG8/HkEyvZHQABqTspSp3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMXFWgbXgKQqnGrD4wfGv7Q5+xzI9XM6+Has+fKG6zLUFjvOSUmZ1Ir1mnAkHWb7Ki9XABRPv+KY9GP2j/QUDN4PBcWfDjYep+M9ZYC/lJBhe7F/ss5Jk67I+W8uKt9i4RYqQRvOXANaur4clq6PKLRzyNoucFuB0y7gF1ExHDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QumnvHM/; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QumnvHM/"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66e63afda8fso735232d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788516249; cv=none;
        d=google.com; s=arc-20260327;
        b=PQEzdTC2lU4YEDde4YQ3vBd+T6gR8oV3mrO5NhG7l9xFS9UQ0psWVoCcnIlsivip43
         WdcajSA3Tje+m3Ay5PC5b+ONGI9/CEo3FrhLr0eKrle9jXk30ESGZgxoJ8YKfnXD4wdE
         ZgnN6xInUr3xNIPYC5kPPnfOOqT99c/wU8xCNqp4epZW7XNCHdY17SF+1wgaVWqOeubU
         Gp9Etb6OXbQ+IgIpxdQzMQtTXMU6CNCaVrPnvGP2LARY8Ar1NqtFHkUr0iu0qva2tSKk
         OMdEkH8tZUFBFPVcN5xn9qJmbghMK/DfMPFhdd1UUDbbgVwb84m1sj2yf4IAk/u0KU9j
         crrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        fh=5ndqWI9VNoZvJ2YxwDFTAeaKjG5ed5CkyyTYnLqxRqc=;
        b=NAum9RqnainGcWA6NoevYtAq80kn81fFIqey0y7xj4G/KaEl9o873fchMHzkst5IHz
         fuH2rGwctA9ZSU8Wb9GC2rJL9NJjuepxHCsdQPK7X4gBRSWj8jDB5HJHfIqDdMFLIgR4
         9qYA9hmecN7IeMpT5Tjp24GlMn5vW//51FPzJacg9cOEifknsbk2GBp13SIT8dsMhey1
         omOsugQkF598vx6+3fPc9YvvJ2kW/T7ONxms1Y/taQCDjullUg6dEd1EUapWJ7+9GtTf
         nIE7wV3d7YzrcPe4EyilHCGUfLnl7Q9+qu/i0WfTFmJGw44MDcra+HvqE5CXyZJ+IUmt
         KqTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516249; x=1789121049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        b=QumnvHM/niiIPPb07CYKNGbxRXqVJNXCJy9YS7z+FWS1iGiKXru8T07eMpFgIahETA
         wfuGdSPmw7H/0NxnOBTl2ZHtjiukMMJNaOv63+QT6Zoiss8Ou1KIepsC/ZL0DlYWR0oW
         tv9nC8kbaOBlX6xdKbDFZLWatr63UYLXySxUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516249; x=1789121049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        b=fwOGKRzGTLwqWdZ/wWxvKPRBeKtaBZ1rbvD/4GPdAtZbuHwhCwAcsaORnDvZTEqMUl
         0viPzYoa805oB9pG1ZOkzszB5/5FP4ejJK+vI85yKAHUxSX0R5fA01TMXSA/YL2fOYjS
         j6Z+MW5ujhM/HlC5k6pFK/EJTJLMJFASZjxtl9gy020P72bZjsfc/Mlg2nL8glMQcaur
         HZ7T6vG+3+7bgKf9HjTfc+dtxF5C0zMRXPf0QPrYPZkceOMyFoPoqzdoXumEPfsPqSCz
         LvFM2i2lFSk1TpSTx71zsyjCv3sp8dYdz82rA/ZJTQRZHS0nVz61yYaOosH9AG3ndWiV
         kSyA==
X-Gm-Message-State: AFuF++m6/fLHE++P1PL/4EZm86/dCZhqbE0xj4pJQZJi3J35xywbpucA
	bYDUXUtUBiuY9+D013fVcYZkgkG7KFCLIhSb50MbZ1KfI7o1r88Imm6qwrZm1mGpgUn9MKzk5BP
	2CginyD8BmJYPJjVUkAdrOZU+BOSesa9ZsYA8s2qgOQ==
X-Gm-Gg: AYBFou0QOIeu5CKpxekhCn3UMdSI8ogQwu28MQpXG75dWEndsn/CvHkp324vx812vfe
	IlYTIIZyPTI0Ez6LpT5+xjKESUEH8ylOvdYQpIN6FREAMpwZ9xQnu9BPsfqiYcY9UdjArxZqO1A
	SlzeK0UJljgtw+FXwokVkBsn58z5GmmTv7zAPKoHrcwslekOoJayV0ocVJgTwtF17/8e8FbjEYP
	N3D0x4QKC8VNEhi1u8hP8XwZFm7Z+CC5A046jjGTZDryuk+Z2KLwEQoRi/JzmYf6/92k7qA1UfA
	TcZuqaeYYXe05uW9dJim85RVOrowOGo94E+A1Wwx3bIb2d1HCA/kUic8YKoQc4kSUstEKLYLATM
	=
X-Received: by 2002:a05:690e:439a:b0:668:db:8c35 with SMTP id
 956f58d0204a3-66fb5a00051mr1241276d50.20.1788516248536; Fri, 04 Sep 2026
 03:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-3-dario.binacchi@amarulasolutions.com> <appLSfbVZMAoXkab@shlinux89>
In-Reply-To: <appLSfbVZMAoXkab@shlinux89>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 4 Sep 2026 12:03:57 +0200
X-Gm-Features: AcwNN1WLCK8cF9fO0rVZ2w24f4EfV4Qsn9E5_zBg4kpv-6Itf3goXqLtwYdrxnQ
Message-ID: <CABGWkvr7J1-6UZfay8yXcZwiTViP74Ra4rJsiZ_c_Qp-nzzW5Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the
 OEM field range
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Fri, Sep 4, 2026 at 6:34=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> On Thu, Sep 03, 2026 at 05:32:14PM +0200, Dario Binacchi wrote:
> >The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
> >tenths of a percent, and the modulation frequency in a 16-bit field.
> >
> >FIELD_PREP() silently truncates values that do not fit in the target
> >field. Moreover, the conversion from permyriad to tenths of a percent
> >turns values below 10 permyriad into zero, which is then passed to the
> >firmware as no spread at all.
> >
> >Reject these cases with a warning instead of silently programming a
> >configuration different from the requested one.
> >
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> >---
> >
> >Changes in v13:
> > - New patch
> >
> > drivers/clk/clk-scmi-oem.c | 15 ++++++++++++++-
> > 1 file changed, 14 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> >index c1ebbdc6bbc5..4dac608edd4c 100644
> >--- a/drivers/clk/clk-scmi-oem.c
> >+++ b/drivers/clk/clk-scmi-oem.c
> >@@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> >                                const struct clk_spread_spectrum *ss_con=
f)
> > {
> >       struct scmi_clk *clk =3D to_scmi_clk(hw);
> >+      u32 spread_pm =3D ss_conf->spread_bp / 10;
> >       int ret;
> >       u32 val;
> >
> >@@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> >        * extConfigValue[24]    - Enable/Disable
> >        * extConfigValue[31:25] - Reserved
> >        */
> >-      val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->sp=
read_bp / 10);
> >+      if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENT=
AGE_MASK)) {
> >+              dev_warn(clk->dev, "%s: spread (%u permyriad) out of rang=
e\n",
> >+                       clk_hw_get_name(hw), ss_conf->spread_bp);
> >+              return -EINVAL;
>
> sashiko's comments is valid.
>
> And patch 1 & 3 have fixes tag. Patch 2 and 4 are new patches.
> If you would like patch 1 & 3 to be accepted in this 7.13, better post th=
em
> as separate patchset. Then CLK maintainer may pick them up for this relea=
se.

I'd rather keep a single series, since patch 2 depends on patch 1.
In v14 the two fixes come first so they can be picked up separately.

Sashiko's comment is addressed in v14.

Thanks and regards,
Dario

>
> Regards
> Peng
>
> >+      }
> >+
> >+      if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MA=
SK)) {
> >+              dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out =
of range\n",
> >+                       clk_hw_get_name(hw), ss_conf->modfreq_hz);
> >+              return -EINVAL;
> >+      }
> >+
> >+      val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
> >       val |=3D FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->mod=
freq_hz);
> >       if (ss_conf->method !=3D CLK_SPREAD_NO)
> >               val |=3D SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> >--
> >2.43.0
> >
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
