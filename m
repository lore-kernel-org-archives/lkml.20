Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792591175;
	b=iON22AHK83dLXMoy7Rjx3Fb8ZQouauZXRuxIHWf2PqtDntuvSZhZDMpu8OVKNfekq2vw
	 yAxElIWmJiUXB3EYLjc/dAxs8yR9RLkjsfuFiFZgoQpGv6Xp2Ro1fzJEkgsWpnXp/BHWS
	 39kLphTZTPO697W23Q/Gv4Eh0mTKrrF0CHSlSX/4wgXffRGvW9T2UsY0Ewl7FyGLC5V1m
	 mViiOsVBK/vD65Yn4aCv9oAJghd1sT8/5ZDFxLQYnWoSxakGeEdqAtxpap4uHjLhQVwtX
	 Mt2/4HhciBiwWqhmmBPg3aW4QKYTAOnFIPhrOtaqaVaBSCQWB2GIVjJMKR0Al0+uWCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
	b=a1Fa/EufIxfLo4nz1MyHd54DFcflVA2WhAFgjEzbu3lWT7LWL9Ko4rSnzKYwrtA41tMh
	 UYEZ+PHJ18GEXfixXDwOLO7O+yTGVai/Bs9l8LIcnUVPuprbT6KYKva8bWNc5ZIvSmf1/
	 bJHKLp3jz4Rd77wQUtyVgW9/IMMjJdFehF4BrZ3+6AFH/NrKhKZwHYvVzScCAQJDH7fBo
	 L1Y0A+zOSzgkIezLvooIQlLENx1GCUV68O1acv4lH5QGrgm5TciT7Vs0e1Ev7I8BTsPEa
	 EdDLSZnG4+oyJmD0AZzviiSe73v6n6bf8mNHjtU/YIbgxuCTM62DteOXVGGfkXWFB6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PPiUOnHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE860A261A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FCE860A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PPiUOnHl
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso355970fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792591173; cv=none;
        d=google.com; s=arc-20260327;
        b=eoDV1prHEsjTjhrdLM/RoycSUZKD8W6Bx3Up2t90M/BZ0ibCc3hskB1Mrc0zJpHv1i
         UJ0KIJeIhszFuPqmWHqrn4rDVk6/rIA2FfnqWDPLq+fiuQfwz6ls7ZHMFhG6vR6d6O61
         BAfGx0L+hAnZXanzIKMCugYhH2l2oY+76cz25jDuSJ9Hxxl8UsX6SQCyDf1KXoQIXPy5
         IWPRWiPM55ZAoaScVTCrUqGyEYDSxORejZd4nECILcQ4ARM1s9SP6jz4JQTbVvvY87G5
         1kKOqTEvpqz+rJph1+GzvQ37QSIUx3FRb49LjMPMTQ3eidH+ua4qFBmR4hKaNZTXxDOn
         kbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        fh=ozT5OmdnXGYPjrABA+uWKOjDhOuom135ezcrrmkhyuo=;
        b=UFQHx4g0gpYdkAqJNKE+5ll3lirStf3+g7+G38ntUwODqGQAX2F7Qi0vAeyPqgwF+I
         v6rRCQN+t5PAq8v5RvcERamzMZe0cK2TUdnpIEw3/fZ6ry7sa5EdM98c9HKNs0M864kE
         ER1v0PHb+kPw9oF3FT3poJm6FAYY/tZnQar0LcWDFqAzIs3FETO6Omkw5PCPDORVwgui
         tPCEDP8Czea4u2ct2js57plEdviuc6VGAMq5tc/joGIXLbBBZBCQtcilxBgi+XmJqe53
         vmkJZsQfYkubM30x5LRUCiCOUD+kJyRXdyuezXLnktzxSrpz9Gy8719Xwaoli3/xhxVe
         F0wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792591173; x=1793195973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        b=PPiUOnHlmfiQcWyQ4BCY5Rhv1mdtaCs3vtKHRRxw5/4QN3goEwwBe8ZqxjgBzy8HzR
         hcINe5adlEI0lXh5N9+mm+wEsPyvVg6eiyDmCZthRlHFE9/h0Dci6UHxnYMiipRZmptA
         EX7cW/QoTJ8uSLjM2Ux3fdvxCW0wcqYw6llJp0R2XeE3fYU2j3yN61i5m4qPOxm5Bx6f
         W+o5B79cvE/uMNx0vBh1lENVQS5vwBr0V6OYTlw/iHJPCKJFdu8D9+k99vly5hQrK5e5
         EuKZXDp8ZQbtJ1+QYqT13MW01xEeM+kDsX8HXOOLb5Natjbp36aJTRriamSqb9jTGBCu
         QvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591173; x=1793195973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        b=aQn4Z4dffQhhpF2ApVw3asQC9kFqarhnbYNlUZIYEIVxTjhW7A+yCDfEgaiqWzUwS2
         e7KBYK7p2sU9xeUcJDAmRz1K1pyeeqM/gmNbbRR1n3a/YOH0kKIFKekRwv8ETVT0uZoz
         RhEJBspVIFg/jeyWyn/DU0/f22+hwm7jZbkgGPZMY5kB7nfhKN+v6mk+ClecG9aE6FSc
         ORO0WoqNazyfe5Y/8zetlnIfgJg4m4cDf9jTti8YBdLnw6Unrc/Jgi0wKs2LwWh3pkSI
         BK7KKZys/d+Br/90yr717jKX7eS33KM/gkRSTaWVfsAiUnNXSP5Te/xf2ub/B25jCLoh
         DvNg==
X-Forwarded-Encrypted: i=1; AKwUvBzi0HOp7hIN+Ac1WQqt9I1oHLm9BKQOjqdhzbI0ey3sCX7/uzUbyeqiiznQoRl4zGHl8OcEW1jZHpeS2rE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJru69UQ6+/tfqvZva8xM2towhB4KQYBJtz0yRa4zOHNN9h2LBn
	T/VPsSFW0drSVTrFlhW/0Wcbw/ufyCzV4cHyLyid93hkpVYztgge6KhWtry0+773O5cjZn/kL2C
	NUB/6ljGDdKXTZ7wrumjpgAwfJsYSLKsFCFtUggc+mQ==
X-Gm-Gg: AYBFou1iS5dB6jXZIMzrOUteKK9HPVEkWjPCdBHv6mj9oyfa0HzdNeKu/J7QloYNDj9
	oT1q1W9cVpOPJs8et9cMRCI8DzYbtQr8ACJnspqUwNhaffiM7ld/rbOcmRnRghpORPwKR6ogMnQ
	9i2Me2K+njLX8+B0rMoZD37PDfkD1zGQzMEwWXYPqUHYy2mZcWpJFDccNwvZRO+16N4c9xOuB5e
	6mTL/poWKi00f/FVUbXVfHBoEAlPGvGiBaMvInu5hD/uxjjDZvVy4FnuTDx4lIMMhJdwrdd/+O+
	VQQT5udLG8iCP59mNSWdLRaKh3Jv25mRQ7npIqTu9otZSUjlBVM1ApuEMYM8Ha8YXPXbiM/lniA
	nQfU5di3pjlcUt/P2bClVsBcsFByeRSEc2nAsXCyYjs1ZIRfu03IYLX4BhMvtl1awCbqQZQli01
	+4ncopJ7GwwR65pTl2cDRiN+mtP7eiOiozoV1nbwVBCsQIOFJ97lQz
X-Received: by 2002:a05:6870:c6a4:b0:4a6:f705:25a with SMTP id
 586e51a60fabf-4a7dc1757ebmr1057975fac.21.1792591172606; Wed, 21 Oct 2026
 06:59:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com> <atc1us1fj6MN6UfF@kekkonen.localdomain>
In-Reply-To: <atc1us1fj6MN6UfF@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Oct 2026 14:59:16 +0100
X-Gm-Features: AclHuK8fDstfvV4kpy6BcazMRbHSLbyvfAabyEyGh48fK-Qeuexq4Pm1-IrJHMo
Message-ID: <CAPY8ntC1dU9r7Ku890b5cqpH5LtQkRFS68dVkYbe0FtVXG7GiA@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 20 Oct 2026 at 10:34, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 15, 2026 at 04:57:30PM +0100, Dave Stevenson wrote:
> > Several of the Sony Starvis 2 sensors are identical in the
> > majority of their programming, but differ largely only in the
> > size of pixel array and some timing parameters.
> >
> > Parameterise those parameters in preparation for supporting other
> > variants.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/sony-starvis2.c | 170 ++++++++++++++++++++++++--------------
> >  1 file changed, 109 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> > index c4f590c489d9..189caac78066 100644
> > --- a/drivers/media/i2c/sony-starvis2.c
> > +++ b/drivers/media/i2c/sony-starvis2.c
> > @@ -51,17 +51,9 @@
> >  /* Lane Count */
> >  #define STARVIS2_REG_LANEMODE             CCI_REG8(0x3040)
> >
> > -/*
> > - * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
> > - * pixels, thus giving us a rate of 74.25 * 8 = 594 MPix/s
> > - */
> > -#define IMX678_PIXEL_RATE            594000000
> > -#define IMX678_PIX_PER_CLK           8
> > -
> >  /* VMAX - Frame Length in Lines */
> >  #define STARVIS2_REG_VMAX                 CCI_REG24_LE(0x3028)
> >  #define STARVIS2_VMAX_MAX                 0xfffff
> > -#define IMX678_VMAX_DEFAULT             2250
> >
> >  /* HMAX - Line Length in Cycles (8 Pixels) */
> >  #define STARVIS2_REG_HMAX                 CCI_REG16_LE(0x302c)
> > @@ -102,8 +94,6 @@
> >  /* Sensor Identification */
> >  #define STARVIS2_REG_MONOCHROME              CCI_REG8(0x4d18)
> >  #define STARVIS2_TYPE                        BIT(0)
> > -#define IMX678_REG_MODULE_ID         CCI_REG16_LE(0x4d1c)
> > -#define IMX678_ID                    0x02a6
> >  #define STARVIS2_MODULE_ID_DELAY     80000
> >
> >  /* Common configuration registers */
> > @@ -153,32 +143,11 @@
> >  /* Subdev pads */
> >  #define STARVIS2_SOURCE_PAD          0
> >
> > -/* IMX678 native and active pixel array size. */
> > -static const struct v4l2_rect imx678_native_area = {
> > -     .top = 0,
> > -     .left = 0,
> > -     .width = 3857,
> > -     .height = 2201,
> > -};
> > -
> > -static const struct v4l2_rect imx678_active_area = {
> > -     .top = 20,
> > -     .left = 0,
> > -     .width = 3856,
> > -     .height = 2180,
> > -};
> > -
> >  enum starvis2_type {
> >       STARVIS2_COLOR = 0,
> >       STARVIS2_MONOCHROME = 1,
> >  };
> >
> > -struct starvis2_model_info {
> > -     enum starvis2_type type;
> > -     const u32 *codes;
> > -     unsigned int num_codes;
> > -};
> > -
> >  enum starvis2_lanemode {
> >       STARVIS2_LANEMODE_2L = 1,
> >       STARVIS2_LANEMODE_4L = 3,
> > @@ -207,7 +176,7 @@ static const u64 link_freqs[] = {
> >       [STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
> >  };
> >
> > -static const u16 min_hmax_4lane[] = {
> > +static const u16 imx678_min_hmax_4lane[] = {
> >       [STARVIS2_LINK_FREQ_297MHZ] = 1584,
> >       [STARVIS2_LINK_FREQ_360MHZ] = 1320,
> >       [STARVIS2_LINK_FREQ_445MHZ] = 1100,
> > @@ -267,7 +236,7 @@ static const int starvis2_tpg_val[] = {
> >  };
> >
> >  /* Common configuration */
> > -static const struct cci_reg_sequence common_regs[] = {
> > +static const struct cci_reg_sequence imx678_common_regs[] = {
> >       { STARVIS2_REG_THIN_V_EN, 0x00 },
> >       { STARVIS2_REG_VCMODE, 0x01 },
> >       { CCI_REG8(0x306b), 0x00 },
> > @@ -650,16 +619,74 @@ static const u32 codes_monochrome[] = {
> >       MEDIA_BUS_FMT_Y12_1X12,
> >  };
> >
> > +struct starvis2_variant {
> > +     const char *name;
> > +     u32 id_reg;
> > +     u32 id_mask;
> > +     u32 id_value;
> > +     struct v4l2_rect native_area;
> > +     struct v4l2_rect active_area;
> > +     u64 pixel_rate;
> > +     unsigned int pix_per_clk;
> > +     const struct cci_reg_sequence *common_regs;
> > +     unsigned int num_common_regs;
> > +     unsigned int vmax_default;
> > +     const u16 *hmax_min;
> > +};
> > +
> > +static const struct starvis2_variant imx678_variant_def = {
> > +     .name = "imx678",
> > +     .id_reg = CCI_REG16_LE(0x4d1c),
> > +     .id_mask = 0x3ff,
> > +     .id_value = 0x2a6,
> > +     .native_area = {
> > +             .top = 0,
> > +             .left = 0,
> > +             .width = 3857,
> > +             .height = 2201,
> > +     },
> > +     .active_area = {
> > +             .top = 20,
> > +             .left = 0,
> > +             .width = 3856,
> > +             .height = 2180,
> > +     },
> > +     .pixel_rate = 594000000,
> > +     .pix_per_clk = 8,
> > +     .common_regs = imx678_common_regs,
> > +     .num_common_regs = ARRAY_SIZE(imx678_common_regs),
> > +     .vmax_default = 2250,
> > +     .hmax_min = imx678_min_hmax_4lane,
> > +};
> > +
> > +struct starvis2_model_info {
> > +     enum starvis2_type type;
> > +     const u32 *codes;
> > +     unsigned int num_codes;
> > +     const struct starvis2_variant *variant;
> > +
> > +     const struct starvis2_model_info *auto_detect_colour;
> > +     const struct starvis2_model_info *auto_detect_mono;
> > +};
> > +
> >  static const struct starvis2_model_info imx678_aaqr_info = {
> >       .type = STARVIS2_COLOR,
> >       .codes = codes_bayer,
> >       .num_codes = ARRAY_SIZE(codes_bayer),
> > +     .variant = &imx678_variant_def,
> >  };
> >
> >  static const struct starvis2_model_info imx678_aamr_info = {
> >       .type = STARVIS2_MONOCHROME,
> >       .codes = codes_monochrome,
> >       .num_codes = ARRAY_SIZE(codes_monochrome),
> > +     .variant = &imx678_variant_def,
> > +};
> > +
> > +static const struct starvis2_model_info imx678_autodetect_info = {
> > +     .variant = &imx678_variant_def,
> > +     .auto_detect_colour = &imx678_aaqr_info,
> > +     .auto_detect_mono = &imx678_aamr_info,
> >  };
> >
> >  static const char * const starvis2_supply_name[] = {
> > @@ -674,6 +701,7 @@ struct starvis2 {
> >       struct regmap *cci;
> >
> >       const struct starvis2_model_info *info;
> > +     const struct starvis2_variant *variant;
> >
> >       struct clk *xclk;
> >       u32 xclk_freq;
> > @@ -770,7 +798,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
> >               cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
> >               break;
> >       case V4L2_CID_HBLANK: {
> > -             u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
> > +             u32 hmax = (format->width + ctrl->val) /
> > +                                             starvis2->variant->pix_per_clk;
>
> This seems to be a pre-existing bug but it'd be nice to fix (and backport)
> this before this set -- the control value is divided here by 8 but the
> control's step is still 1. The step should reflect the granularity here.

AFAICT it already sets the step correctly.

https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx678.c#L1197-L1199

imx678->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
  V4L2_CID_HBLANK, hblank, max_hblank,
  IMX678_PIX_PER_CLK, hblank);

so the step size is set to IMX678_PIX_PER_CLK, which is 8, and the divider here.

> >
> >               cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
> >               break;
> > @@ -851,18 +880,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_selection *sel)
> >  {
> > +     struct starvis2 *starvis2 = to_starvis2(sd);
> > +
> >       switch (sel->target) {
> >       case V4L2_SEL_TGT_CROP:
> >               sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> >               return 0;
> >
> >       case V4L2_SEL_TGT_NATIVE_SIZE:
> > -             sel->r = imx678_native_area;
> > +             sel->r = starvis2->variant->native_area;
> >               return 0;
> >
> >       case V4L2_SEL_TGT_CROP_DEFAULT:
> >       case V4L2_SEL_TGT_CROP_BOUNDS:
> > -             sel->r = imx678_active_area;
> > +             sel->r = starvis2->variant->active_area;
> >               return 0;
> >       }
> >
> > @@ -877,12 +908,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
> >       struct v4l2_rect *crop;
> >
> >       crop = v4l2_subdev_state_get_crop(state, STARVIS2_SOURCE_PAD);
> > -     *crop = imx678_active_area;
> > +     *crop = starvis2->variant->active_area;
> >
> >       format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
> >       format->code = starvis2_default_mbus_code(starvis2);
> > -     format->width = imx678_active_area.width;
> > -     format->height = imx678_active_area.height;
> > +     format->width = starvis2->variant->active_area.width;
> > +     format->height = starvis2->variant->active_area.height;
> >       format->field = V4L2_FIELD_NONE;
> >       format->colorspace = V4L2_COLORSPACE_RAW;
> >       format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > @@ -896,8 +927,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
> >  {
> >       int ret = 0;
> >
> > -     cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
> > -                         &ret);
> > +     if (!starvis2->variant)
> > +             /* Powered on during probe to do detection. Variant unknown. */
> > +             return 0;
> > +
> > +     cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
> > +                         starvis2->variant->num_common_regs, &ret);
> >
> >       cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
> >                 &ret);
> > @@ -923,10 +958,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
> >       cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
> > -               crop->left - imx678_active_area.left, &ret);
> > +               crop->left - starvis2->variant->active_area.left, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_VST,
> > -               crop->top - imx678_active_area.top, &ret);
> > +               crop->top - starvis2->variant->active_area.top, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_VWIDTH, crop->height, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_ADBIT, 0x01, &ret);
> >
> > @@ -1080,11 +1115,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >  {
> >       struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> >       const struct starvis2_model_info *info;
> > +     const struct starvis2_variant *variant;
> >       enum starvis2_type detected;
> >       int ret = 0;
> >       u64 val = 0;
> >
> >       info = device_get_match_data(&client->dev);
> > +     if (!info)
> > +             return -EINVAL;
> > +
> > +     variant = info->variant;
> >
> >       /*
> >        * This sensor's ID registers become accessible 80ms after coming out
> > @@ -1093,7 +1133,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >       cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
> >       fsleep(STARVIS2_MODULE_ID_DELAY);
> >
> > -     cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
> > +     cci_read(starvis2->cci, variant->id_reg, &val, &ret);
> >
> >       if (ret) {
> >               dev_err(&client->dev,
> > @@ -1101,9 +1141,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >               return ret;
> >       }
> >
> > -     if (val != IMX678_ID) {
> > -             dev_err(&client->dev,
> > -                     "Chip ID mismatch: %x!=%llx\n", IMX678_ID, val);
> > +     val &= variant->id_mask;
> > +     if (val != variant->id_value) {
> > +             dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
> > +                     variant->id_value, val);
> >               return -ENXIO;
> >       }
> >
> > @@ -1118,7 +1159,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >       detected = val & STARVIS2_TYPE;
> >
> >       /* Prefer to use sensor type specified in device tree */
> > -     if (info) {
> > +     if (info->codes) {
> >               starvis2->info = info;
> >               if (detected != info->type)
> >                       dev_err(&client->dev,
> > @@ -1127,11 +1168,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >                               info->type == STARVIS2_COLOR ? "color" : "mono");
> >       } else {
> >               starvis2->info = detected == STARVIS2_MONOCHROME ?
> > -                            &imx678_aamr_info : &imx678_aaqr_info;
> > +                         info->auto_detect_mono : info->auto_detect_colour;
> >               dev_info(&client->dev,
> >                        "sensor type missing in DT; detected %s sensor\n",
> >                        detected == STARVIS2_MONOCHROME ? "mono" : "color");
> >       }
> > +     starvis2->variant = starvis2->info->variant;
> >
> >       return 0;
> >  }
> > @@ -1162,7 +1204,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >  {
> >       struct v4l2_ctrl_handler *ctrl_hdlr;
> >       const u32 hmax_4lane =
> > -                     min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
> > +             starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
> >       const u32 lane_scale =
> >                       starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
> >       struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> > @@ -1181,13 +1223,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >       if (ret)
> >               return ret;
> >
> > -     starvis2->vmax = IMX678_VMAX_DEFAULT;
> > +     starvis2->vmax = starvis2->variant->vmax_default;
> >       hmax = hmax_4lane * lane_scale;
> >
> >       /* PIXEL_RATE is fixed and read-only */
> >       v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > -                       IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
> > -                       IMX678_PIXEL_RATE);
> > +                       starvis2->variant->pixel_rate,
> > +                       starvis2->variant->pixel_rate, 1,
> > +                       starvis2->variant->pixel_rate);
> >
> >       /* LINK_FREQ is also read only */
> >       link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> > @@ -1199,23 +1242,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >       if (link_freq)
> >               link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -     vblank = starvis2->vmax - imx678_active_area.height;
> > -     max_vblank = STARVIS2_VMAX_MAX - imx678_active_area.height;
> > +     vblank = starvis2->vmax - starvis2->variant->active_area.height;
> > +     max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
> >       starvis2->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                            V4L2_CID_VBLANK, vblank, max_vblank,
> >                                            2, vblank);
> >
> > -     hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
> > -     max_hblank = STARVIS2_HMAX_MAX * IMX678_PIX_PER_CLK -
> > -                  imx678_active_area.width;
> > +     hblank = hmax * starvis2->variant->pix_per_clk -
> > +                                     starvis2->variant->active_area.width;
> > +     max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
> > +                  starvis2->variant->active_area.width;
> >       starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                            V4L2_CID_HBLANK, hblank, max_hblank,
> > -                                          IMX678_PIX_PER_CLK, hblank);
> > +                                          starvis2->variant->pix_per_clk,

And that IMX678_PIX_PER_CLK (8) is changed to
starvis2->variant->pix_per_clk, which matches the change above.

v4l2-ctl --list-ctrls-menu with imx585 is giving me
            horizontal_blanking 0x009e0902 (int)    : min=544
max=520424 step=8 default=544 value=544 flags=has-min-max
and with imx662 gives me
            horizontal_blanking 0x009e0902 (int)    : min=1034
max=194669 step=3 default=1034 value=1034 flags=has-min-max

Are you seeing somewhere else where the step is set incorrectly?

  Dave

> > +                                          hblank);
> >
> >       starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                              V4L2_CID_EXPOSURE,
> >                                              STARVIS2_EXPOSURE_MIN,
> > -                                            IMX678_VMAX_DEFAULT -
> > +                                            starvis2->variant->vmax_default -
> >                                              STARVIS2_SHR_MIN,
> >                                              STARVIS2_EXPOSURE_STEP,
> >                                              STARVIS2_EXPOSURE_DEFAULT);
> > @@ -1356,6 +1401,9 @@ static int starvis2_probe(struct i2c_client *client)
> >       if (ret)
> >               goto error_power_off;
> >
> > +     v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
> > +                              NULL);
> > +
> >       pm_runtime_set_active(dev);
> >       pm_runtime_enable(dev);
> >
> > @@ -1436,7 +1484,7 @@ static const struct of_device_id starvis2_of_match[] = {
> >       { .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
> >       { .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
> >       /* for non-conforming DTs that rely on runtime check */
> > -     { .compatible = "sony,imx678" },
> > +     { .compatible = "sony,imx678", .data = &imx678_autodetect_info },
> >       { /* sentinel */ }
> >  };
> >
> >
>
> --
> Kind regards,
>
> Sakari Ailus
