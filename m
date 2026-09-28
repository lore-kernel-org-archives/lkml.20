Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55571415F08
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593358; cv=pass; b=pkNnwnuZlkoaS5deH9YaVIb/ntyA1Rx3CKMzzqso0Dgt7w3OUqT8ocCSPTdRyR8fRZpRJpevgs0uzn7G8SWBoZ3OTzeGhdIU+6naBMOmzGb24YFWM5DmNVgsgOu8r3ZZtJNYuHTROXNf4qlKKxPCxm5LzR69sTMBezboRot0wag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593358; c=relaxed/simple;
	bh=UPfxV8PVdA7O2nD4lGvgJiDAq5TA4QePgxk+3BbaSLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJER1xvGLxAg1mFAs0JgpBI6UfmoBCkHYMWcRTffiRZ373/wWSGNcgwyHNfSblhSCx2y6XAgr9h7aXYijxHhiHF5Vh1szYDjL/6M6F8RthAmPpjc9O2MGqk4KvCp8502q14eT8F6Y178pfKTEpMz1cptjowaKYu12j0ZrxwsMyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=R0SlybOZ; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="R0SlybOZ"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d8709e0e13so423121eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790593355; cv=none;
        d=google.com; s=arc-20260327;
        b=DJgcNsSpPofQDBRU6cnmzsOWIqjlpWmkmWohKQaE1H2VRQAwiNZg4zKuDzV9TQJRaD
         6TSADoZ80GuFjznmondW3ih+e5sWZR6sKPYdLWi07I88ydQ2M1SlZHgHIvRoJaQKHppF
         mH4Rrl162MnAAMlU5+JprwdzMyFUPNllX1chZLpkeUPhbThDrtbV0sFabZjjgCn9QLCl
         YvESUi6nPSJkBfcMfICsFrPn2NVBjPmmMBRrvjZoLFrSJSgZfH/9k+luD0nvWeIgnmpt
         QtmlUB5BPB7sCGb2EJ/5dbUmtDrzzqBBjCaWmEgXyRG2PlETK239oJvF9gwlXN3rusyM
         Xy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFLcfE6x5L57ZS16MpOasRd49TlwCzdeHjNICeg3bso=;
        fh=zKxMmWBR4gGZ43z70bDpfmtYc9vJw99uOtJ+iKME87c=;
        b=CeAepWOd0P79rTbT/xWy/TClz/N6M93QNmP1dYAhYVsjvEmDw2mkgvJ21vmtd18lTQ
         irHyumUd9Zhk6FcYstFWksugch9NiW/v1DaHBcZJvCSpIbPPUaJoptWEbJ4B2ol3OLUj
         SfyE4FKHNbsTfW3SPSUfW8VnnrVdiLAE4jv6tSF3DKRus8+F418G0Gg4/9aoJcIe3n9B
         TnV7zWoGj+WcsQZGd0ppogAfxJhC5cpdxlNAicyOz8as1jcc3y4ySj9RyqVJL/28AKuX
         daH7KLfz6N+uZphuTWR7c75lOEuWyB0pX0HWNLSzNkwXb6XqxZI3J8gWk4cjBG0oh/H2
         m7Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790593355; x=1791198155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFLcfE6x5L57ZS16MpOasRd49TlwCzdeHjNICeg3bso=;
        b=R0SlybOZ4DeG8QcveDayidAsfqa9SkJLp320yBs0s1rfcYo6WcpKRFrJIFRyPpuz95
         v0LTiO9z4SO/1jmE1VGKJLpGxMzqRyrHXmo2HeNu3vzQTJOJv/9mhglOV/4fnZ31P2iP
         Ne/5ymq+Xv6z52w+axrUqUOA9MIq5Cm4ne1Iq2LPgq0M15/pZIkiBZ8h2ukEq9w490Fs
         u5lSyh17sgsKLhxuEENNcuOt0Y/P0d5lgfj0hh2OZqyozr7UECCflskqt4Fqt1KIhXnM
         GoNvX6QCRDcEP4oAcvD6Cu4HDX/B20Huwmi+zzpOHMXELznK+eBKu8qXchZp904s2/5x
         3quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593355; x=1791198155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFLcfE6x5L57ZS16MpOasRd49TlwCzdeHjNICeg3bso=;
        b=BZoA4wp6rZEaWXqmkQ5CP25O0bWffomgGodrQno+6bSeurJYxC2tB8mBQi9KwWn1D7
         LLGImIvOBLA97ifTv0pxX+snLDTaGwf/aiHyztMSIzKdn5yXRGkGUrTfy36KwAhHkC0X
         tHrIB/aSNQ9bTFDsUcZUXChvFYyT4gWM5of2aZIGym6+MUuyX0LSobY3zAUlZ4rI+GDv
         BwycZkS/WlcOUP4FWg1iTGACF1KZXPrfmi/jjnWOqwhlnlwa0Mne9cJuZ2DcSIYfHPZn
         ILbKC8FMvC83+xTF99X5wILkigajhe750kJbtgpIzy4+5JvX5p3AJxUlwZQJrMV4g0DV
         26Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxfsjNuigRU4GvXud5hJQ9o2mSI74CaGK6XqdMDpxUiP/jtq9gxgW6NKNaYh0mf902022z/H70x8+DvcpA=@vger.kernel.org
X-Gm-Message-State: AFuF++mSvZ2E+oWQKc9rvaymW1XcAKS6UPOMutV6MYztLjwIDL75rwu3
	ukdLpDfVL0MdZRFiBUotJKOTcynCpAUOFzfNa/yk3II+82W7bTFK0B6X1XJxUmyjnn1WQG28EOH
	TZ+G+qjJgcVw4DRS/LCHRpKyZs0ZBEsjz08YXg/VZZw==
X-Gm-Gg: AYBFou2ntxG0FBKAxrOKpDST2e4unO141/YY7+EHAtSSf76AZjt+s3ftECO3iGfM5ZX
	m2cIsvvfLkVSBVPewHpTu25XNf6HpbWii0QXqf9ZvT/Wmx5TIS4dROwDN5imnqeJIfuX/Bu0Zac
	GLW2oJu7OZPjwPJ/oMlYixlkv7zqXIwdJup5QnsSq4OjEhdwZ8Gofo+PeGebiJ+jppnQj5bQxri
	nnc9J7YbyTZ71bZise2mNEZow5pYt6QXRPwjddUm7SoXDl+FRWLViPfx3iVfFlDX7xHKUWUgf8d
	f2VTGr2waD1n9xmLaVDK6iKVQITtsbMv9KmfhzY174B3OoTYP81HrUvRnzKT/nUQ3/fREdFAxqb
	/GVR/tJo1/akbmXUx6POMNytaAZe5cscS/omUXyaaiLv3xkHqL0h54JTt5nvLqBC+W206Zwg=
X-Received: by 2002:a05:6820:1c8e:b0:6d9:277d:79e0 with SMTP id
 006d021491bc7-6d9277d7cccmr2206566eaf.50.1790593354819; Mon, 28 Sep 2026
 04:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev> <CAPY8ntBUtZ3zkJrekAuXamMH-M+4gcS9vEid3DFrLgrwg2jQmw@mail.gmail.com>
 <aronEaoCLJo0h2Ni@bombadil>
In-Reply-To: <aronEaoCLJo0h2Ni@bombadil>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 12:02:18 +0100
X-Gm-Features: AclHuK86JhubYiVm1DkPM_tU117-YonJUhZ9DKD1L8O27pgHgLiiAxEtuTqB3Iw
Message-ID: <CAPY8ntAUQY_kFRVKGUZJzOD3ygPQqtirTAC21giKuLmBaph5zw@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure time calculation
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, 28 Sept 2026 at 09:56, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Hi Dave,
>
> thanks for your feedback!
>
> On Wed, Sep 23, 2026 at 03:16:27PM +0100, Dave Stevenson wrote:
> > Hi Richard
> >
> > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > <richard.leitner@linux.dev> wrote:
> > >
> > > ov9282_exposure_to_us() divided the line length by the pixel rate con=
trol,
> > > which is the MIPI rate and not the clock HTS is counted in.
> >
> > It really shouldn't be. PIXEL_RATE is the pixel array and LINK_FREQ is
> > the MIPI rate. Many drivers do conflate the two.
> >
> > However I did notice a couple of weeks back that pixel_rate is
> > incorrect for 8bit readout on ov9282 [1]. (It's correct for 10bit
> > readout).
> >
> > <quote> Actually I see the problem. In the hardware the pixel rate for =
8 bit
> > is scaled by the change of PLL2 multiplier from 0x50 to 0x60 =3D x1.2.
> > The pixel rate control is scaled from /10 to /8 or x1.25. 1.2/1.25 =3D
> > 0.96, so my 96% of speed would be spot on. The use of link frequency
> > in computing pixel rate is totally bogus as they are on independent
> > PLLs </quote>
>
> So I guess I should also get rid of the pixel rate pre-processor
> calculation which depends on the link frequency?
>
> Is it OK with you to just hard-code them?
>
> #define OV9282_PIXEL_RATE_10BIT   160000000
> #define OV9282_PIXEL_RATE_8BIT    192000000
>
> AFAICT it should be possible to calculate the PLL1 pix clk from the input
> clock (inclk or XVCLK in the datasheet) provided in the dts. But tbh I
> would prefer to not add this to this series. If it's desired and possible
> from your point of view, I can tackle this in a future series.

I'm happy for them to be hard coded, possibly with a comment that the
pixel rate is derived from the PLL2 clock tree. For 10bit readout, the
whole PLL config is exactly the same as the sample PLL configuration
given in the datasheet (table 2-10 for me with datasheet v1.53). 8bit
readout changes the PLL2 multiplier.

The registers initially looked pretty close to the CCS standard and so
possible to use the ccs-pll helpers, except the dividers support /1.5
and /2.5 in places so I don't think it can be used as-is (PLL1 prediv
is set to /1.5 in the current setup).

Whilst feasible, if no one has had a use case needing an alternate
input clock rate in 5 years since the ov9282 driver was merged (Aug
2021), then there's little point in jumping through hoops to
accommodate a theoretical future user who may never surface. I'd save
yourself the effort.

> >
> > If you correct OV9282_PIXEL_RATE_8BIT to being 192000000 (instead of
> > the current 200000000), does that solve your problem without
> > recomputing things?
>
> Thanks for the explanation above. I guess you're right, the link freq/mip=
i
> rate should not be in there. I've just ran a quick test and it should be
> fine with that change.

Great. If just correcting the pixel rate solves the problem, then it's
better not to complicate the calculations in other places
unnecessarily.

> As i would like to keep the ov9282_line_time_ns() function, what's your
> take on the following implementation? Would that be OK for a v2?
>
> static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> {
>         u64 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
>         return div_u64(hts * NSEC_PER_SEC, ov9282->pixel_rate->val);
> }

I have no issue with having a helper for the flash calculations.

  Dave

> thanks!
>
> regards;rl
>
> >
> >   Dave
> >
> > [1] https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbi=
nSMJ78ZDg+0sZg-1fz3Q@mail.gmail.com/
> > The original reporter did come back to me and acknowledge he was using
> > the downstream Rockchip driver which is doing the wrong thing.
> >
> > > The right
> > > clock is PLL2's system clock. With the PLL2 dividers left at their re=
set
> > > values the chain
> > >
> > > SYS_CLK =3D XVCLK  / pre_div0 / pre_div * loop_div / sys_pre_div / sy=
s_div
> > >         =3D    24  /    1     /    3    * loop_div /     4       /   =
 2
> > >
> > > collapses to SYS_CLK =3D loop_div MHz.
> > >
> > > Fix this by introducing a new static function to calculate the curren=
t
> > > line time and use it in ov9282_exposure_to_us().
> > >
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 46 ++++++++++++++++++++++++++++++++++++=
+---------
> > >  1 file changed, 37 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index c10b2e205834e..3f83a6cf338d8 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -10,10 +10,12 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/math.h>
> > > +#include <linux/math64.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/time64.h>
> > >
> > >  #include <media/v4l2-cci.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -472,6 +474,41 @@ static inline struct ov9282 *to_ov9282(struct v4=
l2_subdev *subdev)
> > >         return container_of(subdev, struct ov9282, sd);
> > >  }
> > >
> > > +/**
> > > + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> > > + * @ov9282: pointer to ov9282 device
> > > + *
> > > + * The line time and therefore OV9282_REG_TIMING_HTS and the strobe =
frame span
> > > + * are counted in PLL2's system clock. We assume the PLL2 dividers a=
re at their
> > > + * reset values, so the formula reduces to SYS_CLK =3D loop_div MHz.
> > > + *
> > > + * Return: line time in nanoseconds.
> > > + */
> > > +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> > > +{
> > > +       u32 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->va=
l;
> > > +       u32 sclk_rate_mhz =3D ov9282->code =3D=3D MEDIA_BUS_FMT_Y10_1=
X10 ?
> > > +               OV9282_PLL_CTRL_0D_RAW10 : OV9282_PLL_CTRL_0D_RAW8;
> > > +
> > > +       /*
> > > +        * OV9282_REG_TIMING_HTS counts 2-pixel units
> > > +        */
> > > +       return DIV_ROUND_CLOSEST(hts * (u32)NSEC_PER_USEC, 2 * sclk_r=
ate_mhz);
> > > +}
> > > +
> > > +/**
> > > + * ov9282_exposure_to_us() - Convert an exposure register value to m=
icroseconds
> > > + * @ov9282: pointer to ov9282 device
> > > + * @exposure: exposure register value to convert
> > > + *
> > > + * Return: microsecond represenation of the given exposure register =
value.
> > > + */
> > > +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure=
)
> > > +{
> > > +       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> > > +                      NSEC_PER_USEC);
> > > +}
> > > +
> > >  /**
> > >   * ov9282_update_controls() - Update control ranges based on streami=
ng mode
> > >   * @ov9282: pointer to ov9282 device
> > > @@ -510,15 +547,6 @@ static int ov9282_update_controls(struct ov9282 =
*ov9282,
> > >                                         mode->vblank_max, 1, mode->vb=
lank);
> > >  }
> > >
> > > -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure=
)
> > > -{
> > > -       /* calculate exposure time in =C2=B5s */
> > > -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_=
ctrl->val;
> > > -       u32 trow_us =3D frame_width / (ov9282->pixel_rate->val / 1000=
000UL);
> > > -
> > > -       return exposure * trow_us;
> > > -}
> > > -
> > >  /**
> > >   * ov9282_update_exp_gain() - Set updated exposure and gain
> > >   * @ov9282: pointer to ov9282 device
> > >
> > > --
> > > 2.53.0
> > >
> > >
