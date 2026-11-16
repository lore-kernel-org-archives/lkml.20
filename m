Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870560;
	b=m51D0nrbBQJ0QpHn/5pCRogaDrlV8wsYhGXSeHeRFsKg/rYY/AAiwnTVWCJa5Cz3CbIU
	 Sok4OdQPNdEQZKTaQRrbsPd/VNnSpZbrXbICiNr68TSP3soiVpRYdSjBbRQ10fIpPyz48
	 fjhhLkJp7TIVW8STqcD7JPD3Ahhe9djM/ZBkoYtqeywJ18sir866IVw0UUv8oMAsi6fk5
	 qn1sQ9LaRb5psOJl6A4ghg2FJ+4lx3TBCcb80lmvdrHO+YMRJuNSBc9oDRnClv07IhoXB
	 C1D1QsITQRSwcyzVVc02tsLVfgfjK3kBaRubyK+zCjmUuIVW3e1GSFTw03KPiuveuOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iBDnXG+nA4RFaLKF/XaZ7XmFYtNCdCKBdGCwJE/xM6g=;
	b=dNHGdEiGCPP2890YGghC47/rIkmL9dIgktpEWpl+laGs9AKKGt7cV3pvRgOcZkCz5gKE
	 7X6kl3SkTDJ8K9nAfI3PolleyZi+/pXdPu98GKZydQ74v9xnmBySZhgCwwNeCajVbEI/a
	 i5sLvTo4+Vgeq79qoI4c2pjHKjZnAh78VepfA1Pevgnk7522kSA4pRO4vx3OzITk6u79j
	 /HpSrE/h+k1vj3oTe9xuY2Ythjg9Aki4KVS1ia2fxgO41BUF9gEG9Ucrj+lThfGyO/M2R
	 pWcNMQ/jI+VAxLhNDPW+FmV+bgdxMt5TCK5rh27XZbhBZ6dQZt6bfe0rPwc2nIJCjAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnTtWtIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D77606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D77606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnTtWtIu
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d07494b0so4729427b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870557; cv=none;
        d=google.com; s=arc-20260327;
        b=BGLPU3qGiYJzzbO35bRHjIYnJGY1oFNoL4qKZPsccBtw/fl6O/7w4rnQfqh8hwmGKP
         Qld0Hui4iCYIVJb7xy8T6ukHpHd2LKjt4z1xcWM0/M9DnNi0bi7JTm+7BLy+uGx1sD3K
         3wW2ISPbj5EBMfK3f83QjmbV6T8JZms8pmBComX/0mcgBEHL+hTzhILaFBxUApkrYG5N
         mbaLBTb745slT7nw8KVR79PF4/Y9DeAbIPDEAUhhi6Ae2cy54X9+xy8BMf0lGRhWBoE+
         fCzK4+Eqsx1K+L80Kcdtiuoq+nv9BIXCrAqWYNeYTGNk5IQEUrCIdN5x5w0vLINr8JRW
         v4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBDnXG+nA4RFaLKF/XaZ7XmFYtNCdCKBdGCwJE/xM6g=;
        fh=FAx5iRltI2bwFHbPERRida4DT0Okh+H+siWO32ECb24=;
        b=jOqmc2PsTof23KvBF6eB8guhNu0ypa571eJ9iB/PTgeG0I6dDWotnrVdNrOO+daXHL
         7YF0c6Pn7TZUkiM8x/dO2icSqt2G4hSG1q+iVN9RBPGnG79CaLeIoazGBQDYaJYqI5tA
         yk2U39GTIcFmJMR9ROp43qMbpePw7jlEY7v6/j9zNjuTgWhzJx9NLr2in312lnAYE67Z
         /NOWMUcATj8A18XlmhSw5NEv5xmP80UTnMuOstRUlUmfHsqfJtYGJ4wnCrKfwK4PxEMm
         1n8OLui2IMNQSgOvQaRSVR5eg5eiGrwX7NcLjMwMshczjZqOl06vkED48efVh1TWJop0
         tflw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870557; x=1795475357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBDnXG+nA4RFaLKF/XaZ7XmFYtNCdCKBdGCwJE/xM6g=;
        b=WnTtWtIu+NCcFlKMRhNmo0hKPpMOSFhf1nJ9xQNi8BhtcD4k8YSCvotv7UfM+pvvCH
         o3C7Pz+aKWWhLBOswcNIlU+MXqg2pYaK8i7a5Hxj018p0krN9hejakIrh4qfFhYaGl98
         POm2Bpxzz03FKbe6dDGx0R2YUK5Cm5l5Rpt5JS4wSZKDdIz4LUojoA8BvewT2ARnmfER
         KkedgycmwzIwZE1OEL825xO6BYe7ePrkUDxuiC8P71D98FGxC+qircwPFRHRoyp+2bNf
         n8+OC0ViSRMwCN+n1FYoDDWlgRufElpxkdR2sMRGjKaTGUGan0Y3IpeJD6NamU/4sJdy
         wVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870557; x=1795475357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBDnXG+nA4RFaLKF/XaZ7XmFYtNCdCKBdGCwJE/xM6g=;
        b=aRmT2cAgZoUyPb0LdijmqdeuCHrBdizFCwLr+8OOuRDEpWzMHZHbp/NxxlKjAnepK9
         ow2xHbPIp1ZpdaG7gPFxolphfiC8AqTTwQ6pffvyUYEnxD+dxMtfRZTAHW+eU9IfLrNr
         pMMOUNX4O1e0HEjLmpWCfTfNfmMMxjvX6L41BWsLQ38nef5cHWfbMiWP1J3C3XER4zeP
         fKi52nQaMTE6MophyDBL7eUiYXuq2jfjoSxDLXtfjW11bgslGqFfuZ5SHjjhlIitLYgQ
         FAOgS5XnX69MAjnNmFDljeDN5KZs0Fsv4pAONlr3w6s2MbkPEpy4CV41zdl5MJcVOLlM
         f3Qw==
X-Forwarded-Encrypted: i=1; AL+hErGo4aLBwQhOnECki7WzJ1qlvg2O8CDINWew9cPMtA/jPeiGbfQ57DFC97kYhV/Zk2ems9CqJNrGflqS2Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N0oRAcnq7Xgyc3JstlQ1tFggH79qHqe7X5ah+IzOdcrR0SudU
	a9YVBhcR/046GQkJlNbi0s3N3NT7svknmoNFwOIOVM1EXdDJXWoPE0LPkhO6GKZNhXWqbWM3lWC
	U5bWTm5zt5Ktf9jYOChWcRlIle5wP38s=
X-Gm-Gg: AZFdTZd51RJ7OOBAU/OSR++26SMQYwJoypHyQ006auv9dohpHRSJ2PjU6pwySB1A5xY
	yb/y/v5h7Xh5allpFAm1Lu+Dkvb57SGzAp0X9+yVoVSRkZhrWVsOclKl5MbUjn72xGnv6v8awSl
	92unSX9t089pAslHcOTLehkSVJcBwyCss7ZGFjKHXHgdQyl3gfsYCEu/Fv329cTNSpeWi3Mu32N
	CEB4NxExZoHTTrOxDbg7fLuolEykPNA46RYPVTpdmewNW9i9YsoICu6LXV9RPPnUE91P3If4G2l
	ovRzPiPVe3boQ71em0Qhjr9A3Pty6OJ1RFgotHCPEOPkfGR0rW06IMTiZIhQdWV9t510G4caUDo
	/8OpVjsFnIJTjLyFYCbrBLw4m/pTOrcTFAoZUqLzL0/Q4gw/bS1f08xeSZhAjsQEcq3xF5mI=
X-Received: by 2002:a05:690c:88:b0:8b4:c69d:17e3 with SMTP id
 00721157ae682-8b4ee2a0d05mr5958567b3.32.1794870557228; Mon, 16 Nov 2026
 15:09:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-2-volodymyrchapman@gmail.com> <CAPY8ntApAUvZ5z9OkMPQfvhZJHcX6V6giY3V3N-Q0gVt0YPt7w@mail.gmail.com>
In-Reply-To: <CAPY8ntApAUvZ5z9OkMPQfvhZJHcX6V6giY3V3N-Q0gVt0YPt7w@mail.gmail.com>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Mon, 16 Nov 2026 23:09:04 +0000
X-Gm-Features: Aa3M54q1Y9Sp7fLkWObHhG5HOfYhkhm2TFO5M8s6TQLYxtrKpTSoW9J4-o5WCgg
Message-ID: <CAN1s30oyqjxR-xGDOW32xLsFTmOa+jGTkff0v_5GBGO_HzssRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thanks for taking a look.

> No Copyright from you? Or are you representing Intel here, in which
> case the end date should be 2026.

I'm not representing Intel; that line credits the register settings
taken from the removed atomisp imx driver. I'll add my own copyright
line in v2, and MODULE_AUTHOR.

> Most of these registers are following the standard CCS register
> definitions (see drivers/media/i2c/ccs/ccs-regs.h). Can you use the
> standard defines rather than adding your own?

Will do, as imx576 does, keeping driver defines only for the Sony
specific registers such as the binning mode register at 0x0390.

> This is probably another case where adding the binning mode will have
> to wait until the Common Raw Sensor Model patches are merged, and then
> binning (and cropping?) be implemented using that.

The binned 1640x1232 mode is the important one on this platform: the
atomisp preview pipeline is limited to 1920 pixels wide, so it is the
only mode that can stream there; the full 3280x2464 mode only works
for still captures. Would it be acceptable to keep the binned mode as a
fixed mode for now and move to the Common Raw Sensor Model once it is
merged? Sakari, what would you prefer?

> Is there a path where this is called before imx175->hflip has been
> initiialised? I couldn't see one by inspection.

No, the controls are created before v4l2_subdev_init_finalize(), so
I'll drop the NULL checks.

> I'd suggest you adopt the minimum as the default value, rather than
> trying to retain the default from when the control was initialised.

The default is clamped with min(default_value, max), so I don't think
the call can fail, but I agree that carrying the old default around is
fragile. I'll change it as you suggest in v2.

> Use v4l2_ctrl_cluster for these so that updating both only results in
> one call through set_ctrl. See imx290 for an example.

Will do.

> If the control is read-only, then pass NULL instead of
> &imx175_ctrl_ops as the control ops.

Will do, for all of the read-only controls.

> The minimum VBLANK period being the same as the exposure margin feels
> a little strange.

Agreed, there is no good reason for it. I'll read the sensor's
min_frame_blanking_lines limit register and use that instead.

> The reset and imx175_init_regs could be sent from imx175_power_on. If
> combined with pm_runtime_autosuspend, then switching mode becomes just
> a handful of register writes.

Will do, both.

> MODULE_AUTHOR?

Will add.

I'll wait a little for any further comments before sending v2.

Thanks,
Volodymyr

On Mon, Nov 16, 2026 at 7:25=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Volodymyr
>
> A couple of things jumped out from a very quick read through.
>
> On Mon, 16 Nov 2026 at 17:52, Volodymyr Chapman
> <volodymyrchapman@gmail.com> wrote:
> >
> > Add a V4L2 sub-device driver for the Sony IMX175, an 8 Mpixel raw Bayer
> > image sensor with a 4-lane MIPI CSI-2 interface. It is used for example
> > as the rear camera of the Lenovo ThinkPad 10 (20C1/20C3), where ACPI
> > describes it as INTCF1A.
> >
> > The driver supports a 3280x2464 mode and a 2x2 binned 1640x1232 mode,
> > both at about 30 fps, with a 19.2 MHz external clock and a 320 MHz link
> > frequency on 4 data lanes (RAW10). It implements exposure, analogue and
> > digital gain, vertical blanking, horizontal and vertical flip (which
> > change the Bayer order), the SMIA test patterns and runtime PM.
> >
> > The register settings are derived from the IMX175 support in Intel's
> > atomisp imx driver (drivers/staging/media/atomisp/i2c/imx/imx175.h),
> > which was added in commit a49d25364dfb ("staging/atomisp: Add support f=
or
> > the Intel IPU v2") and removed in commit 3a81c7660f80 ("media: staging:
> > atomisp: Remove IMX sensor support").
> >
> > The voice coil motor and the LM3554 flash on the ThinkPad 10 camera
> > module are not supported.
> >
> > Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with atomisp, on a
> > media.git next kernel with the other two patches of this series:
> > - the binned mode streams; the colour bar test pattern comes out in the
> >   correct colour order, and real scenes have plausible colours;
> > - v4l2-compliance 1.32.0 on the sensor sub-device: 46 tests, 0 failures=
,
> >   0 warnings;
> > - horizontal and vertical flip mirror the image with correct colours
> >   through atomisp, and VIDIOC_SUBDEV_G_FMT reports the same Bayer order
> >   as VIDIOC_SUBDEV_ENUM_MBUS_CODE for all four flip combinations (the
> >   test pattern itself is not affected by the flips);
> > - the 3280x2464 mode was tested as a single still capture, as atomisp
> >   limits continuous capture to 1920 pixels wide.
> >
> > This driver was written with the help of an AI coding assistant (Claude=
),
> > based on the register tables mentioned above and on existing sensor
> > drivers; it was tested on the hardware by the submitter.
> >
> > Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
> > ---
> >  MAINTAINERS                |   7 +
> >  drivers/media/i2c/Kconfig  |  10 +
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/imx175.c | 797 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 815 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx175.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index af302622c..286926a01 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26061,6 +26061,13 @@ S:     Maintained
> >  F:     drivers/ssb/
> >  F:     include/linux/ssb/
> >
> > +SONY IMX175 SENSOR DRIVER
> > +M:     Volodymyr Chapman <volodymyrchapman@gmail.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +T:     git git://linuxtv.org/media.git
> > +F:     drivers/media/i2c/imx175.c
> > +
> >  SONY IMX208 SENSOR DRIVER
> >  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> >  L:     linux-media@vger.kernel.org
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 11c302525..8047a12e2 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -158,6 +158,16 @@ config VIDEO_IMX111
> >           To compile this driver as a module, choose M here: the
> >           module will be called imx111.
> >
> > +config VIDEO_IMX175
> > +       tristate "Sony IMX175 sensor support"
> > +       select V4L2_CCI_I2C
> > +       help
> > +         This is a Video4Linux2 sensor driver for the Sony
> > +         IMX175 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called imx175.
> > +
> >  config VIDEO_IMX208
> >         tristate "Sony IMX208 sensor support"
> >         help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 59e31af45..af107440c 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -48,6 +48,7 @@ obj-$(CONFIG_VIDEO_HI847) +=3D hi847.o
> >  obj-$(CONFIG_VIDEO_HM1246) +=3D hm1246.o
> >  obj-$(CONFIG_VIDEO_I2C) +=3D video-i2c.o
> >  obj-$(CONFIG_VIDEO_IMX111) +=3D imx111.o
> > +obj-$(CONFIG_VIDEO_IMX175) +=3D imx175.o
> >  obj-$(CONFIG_VIDEO_IMX208) +=3D imx208.o
> >  obj-$(CONFIG_VIDEO_IMX214) +=3D imx214.o
> >  obj-$(CONFIG_VIDEO_IMX219) +=3D imx219.o
> > diff --git a/drivers/media/i2c/imx175.c b/drivers/media/i2c/imx175.c
> > new file mode 100644
> > index 000000000..b0b80ddeb
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx175.c
> > @@ -0,0 +1,797 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sony IMX175 8MP raw image sensor driver
> > + *
> > + * Register settings derived from the Intel atomisp imx driver
> > + * (drivers/staging/media/atomisp/i2c/imx/imx175.h in Linux v4.14),
> > + * Copyright (c) 2010-2014 Intel Corporation.
>
> No Copyright from you? Or are you representing Intel here, in which
> case the end date should be 2026.
>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/units.h>
> > +
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define IMX175_REG_MODEL_ID            CCI_REG16(0x0000)
>
> Most of these registers are following the standard CCS register
> definitions (see drivers/media/i2c/ccs/ccs-regs.h). Can you use the
> standard defines rather than adding your own?
>
> > +#define IMX175_MODEL_ID                        0x0175
> > +#define IMX175_REG_MODE_SELECT         CCI_REG8(0x0100)
> > +#define IMX175_MODE_STANDBY            0x00
> > +#define IMX175_MODE_STREAMING          0x01
> > +#define IMX175_REG_ORIENTATION         CCI_REG8(0x0101)
> > +#define IMX175_HFLIP                   BIT(0)
> > +#define IMX175_VFLIP                   BIT(1)
> > +#define IMX175_REG_SW_RESET            CCI_REG8(0x0103)
> > +#define IMX175_REG_GROUP_HOLD          CCI_REG8(0x0104)
> > +#define IMX175_REG_EXPOSURE            CCI_REG16(0x0202)
> > +#define IMX175_EXPOSURE_MIN            1
> > +#define IMX175_EXPOSURE_MARGIN         4
> > +#define IMX175_REG_ANALOG_GAIN         CCI_REG8(0x0205)
> > +#define IMX175_ANA_GAIN_MIN            0
> > +#define IMX175_ANA_GAIN_MAX            224     /* 256 / (256 - 224) =
=3D 8x */
> > +#define IMX175_ANA_GAIN_DEFAULT                0
> > +#define IMX175_REG_DGAIN_GR            CCI_REG16(0x020e)
> > +#define IMX175_REG_DGAIN_R             CCI_REG16(0x0210)
> > +#define IMX175_REG_DGAIN_B             CCI_REG16(0x0212)
> > +#define IMX175_REG_DGAIN_GB            CCI_REG16(0x0214)
> > +#define IMX175_DGAIN_MIN               0x0100
> > +#define IMX175_DGAIN_MAX               0x0fff
> > +#define IMX175_DGAIN_DEFAULT           0x0100
> > +#define IMX175_REG_FRAME_LENGTH                CCI_REG16(0x0340)
> > +#define IMX175_FLL_MAX                 0xffff
> > +#define IMX175_REG_LINE_LENGTH         CCI_REG16(0x0342)
> > +#define IMX175_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> > +#define IMX175_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> > +#define IMX175_REG_BINNING_MODE                CCI_REG8(0x0390)
> > +#define IMX175_REG_TEST_PATTERN                CCI_REG16(0x0600)
> > +
> > +#define IMX175_XCLK_FREQ               (19200 * HZ_PER_KHZ)
> > +#define IMX175_LINK_FREQ               (320 * HZ_PER_MHZ)
> > +#define IMX175_DATA_LANES              4
> > +#define IMX175_BPP                     10
> > +/* pixel rate =3D link freq * 2 (DDR) * lanes / bpp */
> > +#define IMX175_PIXEL_RATE              (IMX175_LINK_FREQ * 2 * IMX175_=
DATA_LANES / IMX175_BPP)
> > +
> > +#define IMX175_NATIVE_WIDTH            3280
> > +#define IMX175_NATIVE_HEIGHT           2464
> > +#define IMX175_LLP                     3430
> > +#define IMX175_FLL_DEFAULT             2500
> > +
> > +static const char * const imx175_supply_names[] =3D {
> > +       "avdd",         /* Analog power */
> > +       "dovdd",        /* Digital I/O power */
> > +       "dvdd",         /* Digital core power */
> > +};
> > +
> > +struct imx175_mode {
> > +       u32 width;
> > +       u32 height;
> > +       bool binning;
> > +       u32 fll_default;
> > +};
> > +
> > +static const struct imx175_mode imx175_modes[] =3D {
> > +       {
> > +               .width =3D 3280,
> > +               .height =3D 2464,
> > +               .binning =3D false,
> > +               .fll_default =3D IMX175_FLL_DEFAULT,
> > +       },
> > +       {
> > +               .width =3D 1640,
> > +               .height =3D 1232,
> > +               .binning =3D true,
> > +               .fll_default =3D IMX175_FLL_DEFAULT,
> > +       },
>
> This is probably another case where adding the binning mode will have
> to wait until the Common Raw Sensor Model patches are merged, and then
> binning (and cropping?) be implemented using that.
>
> > +};
> > +
> > +/* Static settings, applied after a software reset */
> > +static const struct cci_reg_sequence imx175_init_regs[] =3D {
> > +       /* misc control */
> > +       { CCI_REG8(0x3020), 0x10 },
> > +       { CCI_REG8(0x302d), 0x02 },
> > +       { CCI_REG8(0x302f), 0x80 },
> > +       { CCI_REG8(0x3032), 0xa3 },
> > +       { CCI_REG8(0x3033), 0x20 },
> > +       { CCI_REG8(0x3034), 0x24 },
> > +       { CCI_REG8(0x3041), 0x15 },
> > +       { CCI_REG8(0x3042), 0x87 },
> > +       { CCI_REG8(0x3050), 0x35 },
> > +       { CCI_REG8(0x3056), 0x57 },
> > +       { CCI_REG8(0x305d), 0x41 },
> > +       { CCI_REG8(0x3097), 0x69 },
> > +       { CCI_REG8(0x3109), 0x41 },
> > +       { CCI_REG8(0x3148), 0x3f },
> > +       { CCI_REG8(0x330f), 0x07 },
> > +       /* CSI-2 and INCK */
> > +       { CCI_REG8(0x3364), 0x00 },
> > +       { CCI_REG8(0x3368), 0x13 },
> > +       { CCI_REG8(0x3369), 0x33 },
> > +       /* ZNR */
> > +       { CCI_REG8(0x4100), 0x0e },
> > +       { CCI_REG8(0x4104), 0x32 },
> > +       { CCI_REG8(0x4105), 0x32 },
> > +       { CCI_REG8(0x4108), 0x01 },
> > +       { CCI_REG8(0x4109), 0x7c },
> > +       { CCI_REG8(0x410a), 0x00 },
> > +       { CCI_REG8(0x410b), 0x00 },
> > +       /*
> > +        * PLL for a 19.2 MHz INCK: pre_pll_clk_div 9, pll multiplier 3=
00,
> > +        * vt_pix_clk_div 5, vt_sys_clk_div 1, op_pix_clk_div 5,
> > +        * op_sys_clk_div 1 -> 640 Mbps/lane, 4 lanes.
> > +        */
> > +       { CCI_REG8(0x0301), 0x05 },
> > +       { CCI_REG8(0x0303), 0x01 },
> > +       { CCI_REG8(0x0305), 0x09 },
> > +       { CCI_REG8(0x0309), 0x05 },
> > +       { CCI_REG8(0x030b), 0x01 },
> > +       { CCI_REG16(0x030c), 0x012c },
> > +       { CCI_REG8(0x030e), 0x01 },
> > +       { CCI_REG16(0x0342), IMX175_LLP },
> > +       /* analog crop: full 3280x2464 array */
> > +       { CCI_REG16(0x0344), 0 },
> > +       { CCI_REG16(0x0346), 0 },
> > +       { CCI_REG16(0x0348), IMX175_NATIVE_WIDTH - 1 },
> > +       { CCI_REG16(0x034a), IMX175_NATIVE_HEIGHT - 1 },
> > +       /* no scaling */
> > +       { CCI_REG8(0x0401), 0x00 },
> > +       { CCI_REG8(0x0405), 0x10 },
> > +       /* timer */
> > +       { CCI_REG8(0x3344), 0x57 },
> > +       { CCI_REG8(0x3345), 0x1f },
> > +       /* timing */
> > +       { CCI_REG8(0x3370), 0x77 },
> > +       { CCI_REG8(0x3371), 0x2f },
> > +       { CCI_REG8(0x3372), 0x4f },
> > +       { CCI_REG8(0x3373), 0x2f },
> > +       { CCI_REG8(0x3374), 0x2f },
> > +       { CCI_REG8(0x3375), 0x37 },
> > +       { CCI_REG8(0x3376), 0x9f },
> > +       { CCI_REG8(0x3377), 0x37 },
> > +       { CCI_REG8(0x33c8), 0x01 },
> > +       { CCI_REG16(0x33d4), IMX175_NATIVE_WIDTH },
> > +       { CCI_REG16(0x33d6), IMX175_NATIVE_HEIGHT },
> > +       { CCI_REG8(0x41c0), 0x01 },
> > +};
> > +
> > +static const s64 imx175_link_freqs[] =3D {
> > +       IMX175_LINK_FREQ,
> > +};
> > +
> > +static const char * const imx175_test_pattern_menu[] =3D {
> > +       "Disabled",
> > +       "Solid Colour",
> > +       "Colour Bars",
> > +       "Fade to Grey Colour Bars",
> > +       "PN9",
> > +};
> > +
> > +/* RGGB is the native order; flips shift the pattern */
> > +static const u32 imx175_mbus_codes[] =3D {
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,     /* no flip */
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,     /* hflip */
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,     /* vflip */
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,     /* hflip + vflip */
> > +};
> > +
> > +struct imx175 {
> > +       struct device *dev;
> > +       struct regmap *regmap;
> > +       struct clk *xclk;
> > +       struct gpio_desc *reset;
> > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx175_supply_na=
mes)];
> > +
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +
> > +       struct v4l2_ctrl_handler ctrls;
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *pixel_rate;
> > +       struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> > +       struct v4l2_ctrl *hflip;
> > +       struct v4l2_ctrl *vflip;
> > +
> > +       const struct imx175_mode *mode;
> > +};
> > +
> > +static inline struct imx175 *to_imx175(struct v4l2_subdev *sd)
> > +{
> > +       return container_of(sd, struct imx175, sd);
> > +}
> > +
> > +static u32 imx175_mbus_code(struct imx175 *imx175)
> > +{
> > +       unsigned int idx =3D 0;
> > +
> > +       if (imx175->hflip && imx175->hflip->val)
>
> Is there a path where this is called before imx175->hflip has been
> initiialised? I couldn't see one by inspection.
>
> > +               idx |=3D 1;
> > +       if (imx175->vflip && imx175->vflip->val)
> > +               idx |=3D 2;
> > +
> > +       return imx175_mbus_codes[idx];
> > +}
> > +
> > +static void imx175_update_pad_format(struct imx175 *imx175,
> > +                                    const struct imx175_mode *mode,
> > +                                    struct v4l2_mbus_framefmt *fmt)
> > +{
> > +       fmt->width =3D mode->width;
> > +       fmt->height =3D mode->height;
> > +       fmt->code =3D imx175_mbus_code(imx175);
> > +       fmt->field =3D V4L2_FIELD_NONE;
> > +       fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> > +       fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > +       fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;
> > +}
> > +
> > +static int imx175_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx175 *imx175 =3D container_of(ctrl->handler, struct im=
x175, ctrls);
> > +       int ret =3D 0;
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               s64 max =3D imx175->mode->height + ctrl->val - IMX175_E=
XPOSURE_MARGIN;
> > +
> > +               ret =3D __v4l2_ctrl_modify_range(imx175->exposure,
> > +                                              imx175->exposure->minimu=
m, max,
> > +                                              imx175->exposure->step,
> > +                                              min(imx175->exposure->de=
fault_value, max));
>
> I'd suggest you adopt the minimum as the default value, rather than
> trying to retain the default from when the control was initialised.
> Currently you default to the full 3280x2464 mode, and set the default
> exposure to be "mode->fll_default - IMX175_EXPOSURE_MARGIN". Switch to
> the binned mode and reduce the VBLANK, and you'll be in a situation
> where the default value won't be in the valid range, and this call
> will fail.
>
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /* Flips change the Bayer order, keep the active format in sync=
 */
> > +       if (ctrl->id =3D=3D V4L2_CID_HFLIP || ctrl->id =3D=3D V4L2_CID_=
VFLIP) {
> > +               struct v4l2_subdev_state *state =3D
> > +                       v4l2_subdev_get_locked_active_state(&imx175->sd=
);
> > +
> > +               v4l2_subdev_state_get_format(state, 0)->code =3D
> > +                       imx175_mbus_code(imx175);
> > +       }
> > +
> > +       if (!pm_runtime_get_if_in_use(imx175->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE:
> > +               cci_write(imx175->regmap, IMX175_REG_EXPOSURE, ctrl->va=
l, &ret);
> > +               break;
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               cci_write(imx175->regmap, IMX175_REG_ANALOG_GAIN, ctrl-=
>val, &ret);
> > +               break;
> > +       case V4L2_CID_DIGITAL_GAIN:
> > +               cci_write(imx175->regmap, IMX175_REG_DGAIN_GR, ctrl->va=
l, &ret);
> > +               cci_write(imx175->regmap, IMX175_REG_DGAIN_R, ctrl->val=
, &ret);
> > +               cci_write(imx175->regmap, IMX175_REG_DGAIN_B, ctrl->val=
, &ret);
> > +               cci_write(imx175->regmap, IMX175_REG_DGAIN_GB, ctrl->va=
l, &ret);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               cci_write(imx175->regmap, IMX175_REG_FRAME_LENGTH,
> > +                         imx175->mode->height + ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
>
> Use v4l2_ctrl_cluster for these so that updating both only results in
> one call through set_ctrl. See imx290 for an example.
>
> > +               cci_write(imx175->regmap, IMX175_REG_ORIENTATION,
> > +                         (imx175->hflip->val ? IMX175_HFLIP : 0) |
> > +                         (imx175->vflip->val ? IMX175_VFLIP : 0), &ret=
);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               cci_write(imx175->regmap, IMX175_REG_TEST_PATTERN, ctrl=
->val, &ret);
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(imx175->dev);
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx175_ctrl_ops =3D {
> > +       .s_ctrl =3D imx175_set_ctrl,
> > +};
> > +
> > +static int imx175_init_controls(struct imx175 *imx175)
> > +{
> > +       const struct imx175_mode *mode =3D &imx175_modes[0];
> > +       struct v4l2_ctrl_handler *hdl =3D &imx175->ctrls;
> > +       struct v4l2_fwnode_device_properties props;
> > +       s64 vblank_def, hblank, exposure_max;
> > +       int ret;
> > +
> > +       ret =3D v4l2_fwnode_device_parse(imx175->dev, &props);
> > +       if (ret)
> > +               return ret;
> > +
> > +       v4l2_ctrl_handler_init(hdl, 12);
> > +
> > +       imx175->link_freq =3D v4l2_ctrl_new_int_menu(hdl, &imx175_ctrl_=
ops,
> > +                                                  V4L2_CID_LINK_FREQ,
> > +                                                  ARRAY_SIZE(imx175_li=
nk_freqs) - 1,
> > +                                                  0, imx175_link_freqs=
);
> > +       if (imx175->link_freq)
> > +               imx175->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>
> If the control is read-only, then pass NULL instead of
> &imx175_ctrl_ops as the control ops. Otherwise there are some paths
> where set_ctrl can be called and it'll hit your "default: ret =3D
> -EINVAL" case.
> Ditto for the other read only controls below.
>
> > +
> > +       imx175->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops,
> > +                                              V4L2_CID_PIXEL_RATE,
> > +                                              IMX175_PIXEL_RATE, IMX17=
5_PIXEL_RATE,
> > +                                              1, IMX175_PIXEL_RATE);
> > +
> > +       vblank_def =3D mode->fll_default - mode->height;
> > +       imx175->vblank =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L=
2_CID_VBLANK,
> > +                                          IMX175_EXPOSURE_MARGIN,
>
> The minimum VBLANK period being the same as the exposure margin feels
> a little strange. It may be the case, but the two are usually
> disassociated.
>
> > +                                          IMX175_FLL_MAX - mode->heigh=
t, 1,
> > +                                          vblank_def);
> > +
> > +       hblank =3D IMX175_LLP - mode->width;
> > +       imx175->hblank =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L=
2_CID_HBLANK,
> > +                                          hblank, hblank, 1, hblank);
> > +       if (imx175->hblank)
> > +               imx175->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       exposure_max =3D mode->fll_default - IMX175_EXPOSURE_MARGIN;
> > +       imx175->exposure =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            IMX175_EXPOSURE_MIN, expos=
ure_max, 1,
> > +                                            exposure_max);
> > +
> > +       v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_ANALOGUE_GAIN=
,
> > +                         IMX175_ANA_GAIN_MIN, IMX175_ANA_GAIN_MAX, 1,
> > +                         IMX175_ANA_GAIN_DEFAULT);
> > +
> > +       v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> > +                         IMX175_DGAIN_MIN, IMX175_DGAIN_MAX, 1,
> > +                         IMX175_DGAIN_DEFAULT);
> > +
> > +       imx175->hflip =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2=
_CID_HFLIP,
> > +                                         0, 1, 1, 0);
> > +       if (imx175->hflip)
> > +               imx175->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       imx175->vflip =3D v4l2_ctrl_new_std(hdl, &imx175_ctrl_ops, V4L2=
_CID_VFLIP,
> > +                                         0, 1, 1, 0);
> > +       if (imx175->vflip)
> > +               imx175->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       v4l2_ctrl_new_std_menu_items(hdl, &imx175_ctrl_ops, V4L2_CID_TE=
ST_PATTERN,
> > +                                    ARRAY_SIZE(imx175_test_pattern_men=
u) - 1,
> > +                                    0, 0, imx175_test_pattern_menu);
> > +
> > +       v4l2_ctrl_new_fwnode_properties(hdl, &imx175_ctrl_ops, &props);
> > +
> > +       if (hdl->error) {
> > +               ret =3D hdl->error;
> > +               v4l2_ctrl_handler_free(hdl);
> > +               return ret;
> > +       }
> > +
> > +       imx175->sd.ctrl_handler =3D hdl;
> > +       return 0;
> > +}
> > +
> > +static int imx175_enable_streams(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state, u32 p=
ad,
> > +                                u64 streams_mask)
> > +{
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +       const struct imx175_mode *mode =3D imx175->mode;
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_resume_and_get(imx175->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D cci_write(imx175->regmap, IMX175_REG_SW_RESET, 0x01, NU=
LL);
> > +       if (ret)
> > +               goto err_put;
> > +       usleep_range(5000, 6000);
> > +
> > +       ret =3D cci_multi_reg_write(imx175->regmap, imx175_init_regs,
> > +                                 ARRAY_SIZE(imx175_init_regs), NULL);
>
> The reset and imx175_init_regs could be sent from imx175_power_on. If
> combined with pm_runtime_autosuspend, then switching mode becomes just
> a handful of register writes.
>
> > +       cci_write(imx175->regmap, IMX175_REG_X_OUTPUT_SIZE, mode->width=
, &ret);
> > +       cci_write(imx175->regmap, IMX175_REG_Y_OUTPUT_SIZE, mode->heigh=
t, &ret);
> > +       cci_write(imx175->regmap, IMX175_REG_BINNING_MODE, mode->binnin=
g ? 1 : 0,
> > +                 &ret);
> > +       if (ret)
> > +               goto err_put;
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(imx175->sd.ctrl_handler);
> > +       if (ret)
> > +               goto err_put;
> > +
> > +       ret =3D cci_write(imx175->regmap, IMX175_REG_MODE_SELECT,
> > +                       IMX175_MODE_STREAMING, NULL);
> > +       if (ret)
> > +               goto err_put;
> > +
> > +       /* Flips change the Bayer order; don't allow them while streami=
ng */
> > +       __v4l2_ctrl_grab(imx175->hflip, true);
> > +       __v4l2_ctrl_grab(imx175->vflip, true);
> > +       return 0;
> > +
> > +err_put:
> > +       pm_runtime_put(imx175->dev);
> > +       return ret;
> > +}
> > +
> > +static int imx175_disable_streams(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *state, u32 =
pad,
> > +                                 u64 streams_mask)
> > +{
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +       int ret;
> > +
> > +       ret =3D cci_write(imx175->regmap, IMX175_REG_MODE_SELECT,
> > +                       IMX175_MODE_STANDBY, NULL);
> > +
> > +       __v4l2_ctrl_grab(imx175->hflip, false);
> > +       __v4l2_ctrl_grab(imx175->vflip, false);
> > +
> > +       pm_runtime_put(imx175->dev);
> > +       return ret;
> > +}
> > +
> > +static int imx175_set_format(struct v4l2_subdev *sd,
> > +                            const struct v4l2_subdev_client_info *ci,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +       const struct imx175_mode *mode;
> > +       struct v4l2_mbus_framefmt *format;
> > +       int ret;
> > +
> > +       mode =3D v4l2_find_nearest_size(imx175_modes, ARRAY_SIZE(imx175=
_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.he=
ight);
> > +
> > +       imx175_update_pad_format(imx175, mode, &fmt->format);
> > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > +       *format =3D fmt->format;
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       imx175->mode =3D mode;
> > +
> > +       ret =3D __v4l2_ctrl_modify_range(imx175->vblank, IMX175_EXPOSUR=
E_MARGIN,
> > +                                      IMX175_FLL_MAX - mode->height, 1=
,
> > +                                      mode->fll_default - mode->height=
);
> > +       if (ret)
> > +               return ret;
> > +       ret =3D __v4l2_ctrl_s_ctrl(imx175->vblank, mode->fll_default - =
mode->height);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return __v4l2_ctrl_modify_range(imx175->hblank,
> > +                                        IMX175_LLP - mode->width,
> > +                                        IMX175_LLP - mode->width, 1,
> > +                                        IMX175_LLP - mode->width);
> > +}
> > +
> > +static int imx175_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state,
> > +                                struct v4l2_subdev_mbus_code_enum *cod=
e)
> > +{
> > +       if (code->index > 0)
> > +               return -EINVAL;
> > +
> > +       code->code =3D imx175_mbus_code(to_imx175(sd));
> > +       return 0;
> > +}
> > +
> > +static int imx175_enum_frame_size(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *state,
> > +                                 struct v4l2_subdev_frame_size_enum *f=
se)
> > +{
> > +       if (fse->index >=3D ARRAY_SIZE(imx175_modes))
> > +               return -EINVAL;
> > +
> > +       if (fse->code !=3D imx175_mbus_code(to_imx175(sd)))
> > +               return -EINVAL;
> > +
> > +       fse->min_width =3D imx175_modes[fse->index].width;
> > +       fse->max_width =3D fse->min_width;
> > +       fse->min_height =3D imx175_modes[fse->index].height;
> > +       fse->max_height =3D fse->min_height;
> > +       return 0;
> > +}
> > +
> > +static int imx175_get_selection(struct v4l2_subdev *sd,
> > +                               const struct v4l2_subdev_client_info *c=
i,
> > +                               struct v4l2_subdev_state *state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +               sel->r.left =3D 0;
> > +               sel->r.top =3D 0;
> > +               sel->r.width =3D IMX175_NATIVE_WIDTH;
> > +               sel->r.height =3D IMX175_NATIVE_HEIGHT;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int imx175_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state)
> > +{
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +               .pad =3D 0,
> > +               .format =3D {
> > +                       .width =3D imx175_modes[0].width,
> > +                       .height =3D imx175_modes[0].height,
> > +               },
> > +       };
> > +
> > +       return imx175_set_format(sd, NULL, state, &fmt);
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops imx175_video_ops =3D {
> > +       .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx175_pad_ops =3D {
> > +       .enum_mbus_code =3D imx175_enum_mbus_code,
> > +       .enum_frame_size =3D imx175_enum_frame_size,
> > +       .get_fmt =3D v4l2_subdev_get_fmt,
> > +       .set_fmt =3D imx175_set_format,
> > +       .get_selection =3D imx175_get_selection,
> > +       .enable_streams =3D imx175_enable_streams,
> > +       .disable_streams =3D imx175_disable_streams,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx175_subdev_ops =3D {
> > +       .video =3D &imx175_video_ops,
> > +       .pad =3D &imx175_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx175_internal_ops =3D {
> > +       .init_state =3D imx175_init_state,
> > +};
> > +
> > +static int imx175_power_on(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +       int ret;
> > +
> > +       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx175->supplies),
> > +                                   imx175->supplies);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D clk_prepare_enable(imx175->xclk);
> > +       if (ret) {
> > +               regulator_bulk_disable(ARRAY_SIZE(imx175->supplies),
> > +                                      imx175->supplies);
> > +               return ret;
> > +       }
> > +
> > +       usleep_range(1000, 2000);
> > +       gpiod_set_value_cansleep(imx175->reset, 0);
> > +       /* Wait for the sensor to come out of reset before using I2C */
> > +       usleep_range(10000, 12000);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx175_power_off(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +
> > +       gpiod_set_value_cansleep(imx175->reset, 1);
> > +       clk_disable_unprepare(imx175->xclk);
> > +       regulator_bulk_disable(ARRAY_SIZE(imx175->supplies), imx175->su=
pplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx175_identify(struct imx175 *imx175)
> > +{
> > +       u64 id;
> > +       int ret;
> > +
> > +       ret =3D cci_read(imx175->regmap, IMX175_REG_MODEL_ID, &id, NULL=
);
> > +       if (ret)
> > +               return dev_err_probe(imx175->dev, ret, "failed to read =
model id\n");
> > +
> > +       if (id !=3D IMX175_MODEL_ID)
> > +               return dev_err_probe(imx175->dev, -ENODEV,
> > +                                    "unexpected model id 0x%04llx\n", =
id);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx175_check_hwcfg(struct imx175 *imx175)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep;
> > +       unsigned long link_freq_bitmap;
> > +       int ret;
> > +
> > +       /* The endpoint is created by ipu-bridge on ACPI systems */
> > +       ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(imx175->dev),=
 0, 0, 0);
> > +       if (!ep)
> > +               return dev_err_probe(imx175->dev, -EPROBE_DEFER,
> > +                                    "waiting for fwnode graph endpoint=
\n");
> > +
> > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return dev_err_probe(imx175->dev, ret, "parsing endpoin=
t\n");
> > +
> > +       if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX175_DATA_LANES=
) {
> > +               ret =3D dev_err_probe(imx175->dev, -EINVAL,
> > +                                   "%u data lanes not supported\n",
> > +                                   bus_cfg.bus.mipi_csi2.num_data_lane=
s);
> > +               goto out;
> > +       }
> > +
> > +       ret =3D v4l2_link_freq_to_bitmap(imx175->dev, bus_cfg.link_freq=
uencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      imx175_link_freqs,
> > +                                      ARRAY_SIZE(imx175_link_freqs),
> > +                                      &link_freq_bitmap);
> > +out:
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > +       return ret;
> > +}
> > +
> > +static int imx175_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev =3D &client->dev;
> > +       struct imx175 *imx175;
> > +       unsigned long rate;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       imx175 =3D devm_kzalloc(dev, sizeof(*imx175), GFP_KERNEL);
> > +       if (!imx175)
> > +               return -ENOMEM;
> > +
> > +       imx175->dev =3D dev;
> > +       imx175->mode =3D &imx175_modes[0];
> > +
> > +       ret =3D imx175_check_hwcfg(imx175);
> > +       if (ret)
> > +               return ret;
> > +
> > +       imx175->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(imx175->regmap))
> > +               return PTR_ERR(imx175->regmap);
> > +
> > +       imx175->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> > +       if (IS_ERR(imx175->xclk))
> > +               return dev_err_probe(dev, PTR_ERR(imx175->xclk),
> > +                                    "failed to get xclk\n");
> > +
> > +       rate =3D clk_get_rate(imx175->xclk);
> > +       if (rate !=3D IMX175_XCLK_FREQ)
> > +               return dev_err_probe(dev, -EINVAL,
> > +                                    "unsupported xclk rate %lu Hz\n", =
rate);
> > +
> > +       imx175->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_O=
UT_HIGH);
> > +       if (IS_ERR(imx175->reset))
> > +               return dev_err_probe(dev, PTR_ERR(imx175->reset),
> > +                                    "failed to get reset gpio\n");
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(imx175_supply_names); i++)
> > +               imx175->supplies[i].supply =3D imx175_supply_names[i];
> > +
> > +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(imx175->supplie=
s),
> > +                                     imx175->supplies);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to get regulator=
s\n");
> > +
> > +       v4l2_i2c_subdev_init(&imx175->sd, client, &imx175_subdev_ops);
> > +       imx175->sd.internal_ops =3D &imx175_internal_ops;
> > +
> > +       ret =3D imx175_power_on(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D imx175_identify(imx175);
> > +       if (ret)
> > +               goto err_power_off;
> > +
> > +       ret =3D imx175_init_controls(imx175);
> > +       if (ret)
> > +               goto err_power_off;
> > +
> > +       imx175->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       imx175->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +       imx175->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +       ret =3D media_entity_pads_init(&imx175->sd.entity, 1, &imx175->=
pad);
> > +       if (ret)
> > +               goto err_free_ctrls;
> > +
> > +       imx175->sd.state_lock =3D imx175->ctrls.lock;
> > +       ret =3D v4l2_subdev_init_finalize(&imx175->sd);
> > +       if (ret)
> > +               goto err_entity_cleanup;
> > +
> > +       pm_runtime_set_active(dev);
> > +       pm_runtime_enable(dev);
>
> Use pm_runtime_autosuspend? It saves a little bit of time when
> switching modes on the sensor.
>
> > +
> > +       ret =3D v4l2_async_register_subdev_sensor(&imx175->sd);
> > +       if (ret)
> > +               goto err_pm;
> > +
> > +       pm_runtime_idle(dev);
> > +       return 0;
> > +
> > +err_pm:
> > +       pm_runtime_disable(dev);
> > +       pm_runtime_set_suspended(dev);
> > +       v4l2_subdev_cleanup(&imx175->sd);
> > +err_entity_cleanup:
> > +       media_entity_cleanup(&imx175->sd.entity);
> > +err_free_ctrls:
> > +       v4l2_ctrl_handler_free(&imx175->ctrls);
> > +err_power_off:
> > +       imx175_power_off(dev);
> > +       return ret;
> > +}
> > +
> > +static void imx175_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx175 *imx175 =3D to_imx175(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_subdev_cleanup(sd);
> > +       media_entity_cleanup(&sd->entity);
> > +       v4l2_ctrl_handler_free(&imx175->ctrls);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               imx175_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(imx175_pm_ops, imx175_power_off,
> > +                                imx175_power_on, NULL);
> > +
> > +static const struct acpi_device_id imx175_acpi_ids[] =3D {
> > +       { "INTCF1A" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx175_acpi_ids);
> > +
> > +static struct i2c_driver imx175_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx175",
> > +               .acpi_match_table =3D imx175_acpi_ids,
> > +               .pm =3D pm_ptr(&imx175_pm_ops),
> > +       },
> > +       .probe =3D imx175_probe,
> > +       .remove =3D imx175_remove,
> > +};
> > +module_i2c_driver(imx175_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Sony IMX175 sensor driver");
> > +MODULE_LICENSE("GPL");
>
> MODULE_AUTHOR?
>
> Hope that's helpful.
>   Dave
>
> > --
> > 2.43.0
> >
> >
