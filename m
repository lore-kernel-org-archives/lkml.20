Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06845562F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436038; cv=pass; b=OQQuUcDXxdwhv1vOEo097thSaUwmtBEENkCXqiDJKi0x3ya/WIcNMo6P2lM6JLcSuPl+jGaC1R0jvVlObMCw/o55xbdYbfX3EDzhyqGq18hpaegn+Eh4w0DYfsJ8UZ1/5tfiJKHUSUtsOgin9jiqwNgvKYTfQ4+gLh3KkUE5Qz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436038; c=relaxed/simple;
	bh=5yzaVabpPxw5RXtOFZG6OegQNvc0fKUaFe2aJ4JqkjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSu3YEE0ZysmbBtOvVWRnanwzQd6zAGMLOH1hVwePL8LYPynRjZuZz05DVIdg0tGPUAlyDoXah1dPhsehmxQI799djtg2U/IDg8CRZ2gyByoKnvOSbNBsSsx9U0K+GanS//IyhXgXwAgJrvhNDkmRUvhp5UcD2PTQcFscyTSJ3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kYjHylo+; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kYjHylo+"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-459281bc13bso1561279fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436026; cv=none;
        d=google.com; s=arc-20260327;
        b=it3hNmffLv9JHxu8i2Bs2zWi6bGRHjhryVhKznVl6qZvNVmVzkTFKMAV1qj/NduiXq
         mIaa53zIg/o8O24pxRWglraOoVyKcPUrmxIKMVem3Llp6VhXVn3D/JAhQGdHKo4GGj5t
         0p82nvgCzbTppOBkiGgcASFer5DOpzIraG57FVMsTNdjtTPoTWK54BZGP39dCexYZj1j
         W6PmnbG1frCtqYOZJaKaDBJ2exWWTJh9K9zBgWvq+z5mdIO6KZN/QGbHXyn0u50Pu2f5
         JjQJZUbthCobaIl0Mm3I03qds3IcIDtRiH67OB/VkTTiWqLO7geFlysOxiDvgO205a8Z
         99UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        fh=OQMqNTkONCRXohIU6WrvSptqMWfP4mZg5Wld5h+8ljE=;
        b=UcflGx9oGQKWK6Pk9o+dk4eYHqAj8AY4ERgjAYmKnMSA/bMaDlkLIegtA91wrR/sM7
         5RzPiFvzd1TxMc+C08XPCGl5+ENKy0hVxOgo9MYwVA4sf4QTBvLv+/eYPPo2ZMpN8VM7
         jhafILFlU452QJOskHksRmM8xtHmKQU4g1/6HkzAr66Wum5xaXLklt8idLtD0zuSJxNH
         tRknUjwuMA1rpIT750bDiN6MCAX57/dkCOf/5Jya/ddtu2idkB2qV/UJFpLwjFURq1nI
         YaAZv33zd1NaAXF+Jw6ZnRpNGFmWqDtoCNZ6jBn+JONOFPlM0SI2cdxeSXeKyAGYIZR6
         TZXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788436026; x=1789040826; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        b=kYjHylo+ex1HszaofgBXyyVB+T/8rEM4tHaEz/5GJrNwxO4j8q2D8TFA7vW8CGpIUJ
         Ii6Hy9VdLdzYSTu6DjEnIX4aahzvbg0H5Qk+JpV4R5fWTMU6MNA0g5ucQtOEkKI9g3p/
         RDn0m90CE71BtPbDGNcDJsVn31nQj0Ur+7MP44N/Y4bUml7PwAAAWjJpxfCtMR3tA+K5
         H7bjiq2A/5SXAp3iXALUp+Xkm5JgHvipLtm0yyhW+G1ujOA9RbBShIlKRpfCKyk0NH62
         jqDU0HMsL20zZFinL/VyjDYFgiZ12NxDaHUpUbGiRz/b7WYqKPvTd7rZ84hGT7j7ySVi
         DPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436026; x=1789040826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        b=sNemRofUXT5IhwXOHfGWcQEoG+TXW8N4Zh9nqzzxcSSKK4i5fKj1b0BLCF29z3Ha5U
         +beAheZj+dPR8rdsH3jbqPgTVOMkGbHe6uLqaMD+x9Bh5qXnGp5BN9YwSz4EiXHK0RLJ
         TBeWQVit8WTcWy8G5HTKurot5EwBYS52bND5swErUwWtIClDOt8RpFKpyHJBiywthV7K
         qmxs4GrHvD66j1iGYARTWyGdpfWecVEDdY27vUGI6WwTdFCKe251kwRijrlaxHrfa/B6
         1NvFGScebH1VCVHXshL8+HoiRaLbkjdI/McJfuKwXQKkR1dhRq5hA2j26kkWhfW1unxr
         XGUA==
X-Forwarded-Encrypted: i=1; AKwUvBzk19Z1MPXLIssqx+vJ5fb6BJZxvYbHa19+oJr58JHjlLCOi6nnaqjUwImB8FR7v/hczT/zpJOBODclv8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k/OI5aDVCqXDb3zz+nf6x0zb8KQ6GtHPqC68oxwo/tXAxDfasu
	WO3oBTjm1TwcB1wY6V4QVFvXcbsa00V8ZTmDbj73KdfFyQSW13lDst3aMfUPg63uqmeFJxCXo2+
	MG4QhshVx9e/Ei7mMOjlvqYH3Vn7mIyKiR3zurRdjkA==
X-Gm-Gg: AYBFou3LZpC6Q3W4a0wjZZysxBrF6Fqxiy2M4M0MxOjxhwwXsvnHPHUtTD/dmfRD5um
	7zosicHQWxVdC/WdHvTjNVgk+xfuulGft4CWpGhJdUeHBbRvJ8iHncPbAOsyrrENda/JnYdUSpN
	Gw123aZoUMyFVyQUqXpeLhgErd0vQ+IWvVfk+yUnAb7xGR8CWFZ0xSZ6CMwkWKo3/Mez66pNV6T
	vDHFEXDHsSPxS4AjmNF0u28EnVA/egQnAy1BcyLqXzFaMXE7sf+OZswcw3MtNi7eMyc7kVImEPM
	0qjIGKbBVqIFX0ivOIa8HR/JmzAPTpbVxkU/s0R/qIbRx62dxjKPXBX4sL8ZXIF4OoJbfiC3xhu
	8iRoETlSx2HztDtDWw5ytNvUFbAn4Mdk0OisKD9RI4vNpPIYTcDLb1dH84OM/RQ==
X-Received: by 2002:a05:6871:c921:b0:442:175:cea7 with SMTP id
 586e51a60fabf-46f85e01f72mr10128824fac.1.1788436026484; Thu, 03 Sep 2026
 04:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
 <20260805-media-starvis2-v1-3-91e8e4eae44f@raspberrypi.com> <178840924662.11722.12680340547715469059@freya>
In-Reply-To: <178840924662.11722.12680340547715469059@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Sep 2026 12:46:48 +0100
X-Gm-Features: AcwNN1V_rdED1LTqBqth4XivSuKPAiq1rGIGwj4L0ffVbXE0kyqHxqrMRNIHSmk
Message-ID: <CAPY8ntCQQhPiGoJFOADY-0q7QtKbi3XiCYHz1A6qogwhUdnL6A@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] media: i2c: imx678: Add imx662 support to the driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Thu, 3 Sept 2026 at 05:20, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Quoting Dave Stevenson (2026-08-05 21:39:18)
> > IMX662 is a 1080p Starvis 2 sensor that follows the same programming
> > pattern as IMX678, so add it to the newly parameterised driver.
> >
> > FIXME: Update the common registers based on the Sony spreadsheet.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx678.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> > index 40ba6661b366..9083f2744510 100644
> > --- a/drivers/media/i2c/imx678.c
> > +++ b/drivers/media/i2c/imx678.c
> > @@ -673,6 +673,47 @@ const struct imx678_variant imx678_variant_def = {
> >         .hmax_min = imx678_min_hmax_4lane,
> >  };
> >
> > +static const struct cci_reg_sequence imx662_common_regs[] = {
> > +       { IMX678_REG_WDMODE, 0x00 },
> > +       { IMX678_REG_MDBIT, 0x01 },
> > +       { IMX678_REG_XXS_DRV, 0x00 },
> > +};
> > +
> > +static const u16 imx662_min_hmax_4lane[] = {
> > +       [IMX678_LINK_FREQ_297MHZ] = 990,
> > +       [IMX678_LINK_FREQ_360MHZ] = 990,
> > +       [IMX678_LINK_FREQ_445MHZ] = 990,
> > +       [IMX678_LINK_FREQ_594MHZ] = 990,
> > +       [IMX678_LINK_FREQ_720MHZ] = 990,
> > +       [IMX678_LINK_FREQ_891MHZ] = 990,
> > +       [IMX678_LINK_FREQ_1039MHZ] = 990,
> > +       [IMX678_LINK_FREQ_1188MHZ] = 990,
> > +};
> > +
> > +const struct imx678_variant imx662_variant_def = {
> > +       .name = "imx662",
> > +       .id_reg = IMX678_REG_MODULE_ID,
> > +       .id_value = 0x296,
> > +       .native_area = {
> > +               .top = 0,
> > +               .left = 0,
> > +               .width = 1937,
> > +               .height = 1101,
> > +       },
> > +       .active_area = {
> > +               .top = 0,
> > +               .left = 0,
> > +               .width = 1936,
> > +               .height = 1096,
> > +       },
> > +       .pixel_rate = 222750000,
> > +       .pix_per_clk = 3,
> > +       .common_regs = imx662_common_regs,
> > +       .num_common_regs = ARRAY_SIZE(imx662_common_regs),
> > +       .vmax_default = 1096 + 40,
>
> From the IMX662 SRM I see the following constraints for minimum:
>
>     VTTL >= PIX_VWIDTH + 70
>     VTTL >= 820
>
> And the table giving round FPS numbers like 30/60/90 assumes VMAX = 1250.

I find it weird that Sony's datasheets fix the number of vertical
lines and extend horizontal blanking for frame rate control. That'll
give you the worst case for the rolling shutter effect, so why would
you want to do that?

> Did you manually verify that setting blanking to 40 also works?

Yes, I've verified that vblank of 40 works.
This is why I queried the values in the IMX908 driver that Lachlan
sent, as the datasheets always seem overly conservative. There may be
further restrictions if you enable the various HDR modes, but we're
not there yet.

  Dave

> Thanks,
>     Jai
> > +       .hmax_min = imx662_min_hmax_4lane,
> > +};
> > +
> >  struct imx678_model_info {
> >         enum imx678_type type;
> >         const u32 *codes;
> > @@ -703,6 +744,26 @@ static const struct imx678_model_info imx678_autodetect_info = {
> >         .auto_detect_mono = &imx678_aamr_info,
> >  };
> >
> > +static const struct imx678_model_info imx662_aaqr_info = {
> > +       .type = IMX678_COLOR,
> > +       .codes = codes_bayer,
> > +       .num_codes = ARRAY_SIZE(codes_bayer),
> > +       .variant = &imx662_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx662_aamr_info = {
> > +       .type = IMX678_MONOCHROME,
> > +       .codes = codes_monochrome,
> > +       .num_codes = ARRAY_SIZE(codes_monochrome),
> > +       .variant = &imx662_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx662_autodetect_info = {
> > +       .variant = &imx662_variant_def,
> > +       .auto_detect_colour = &imx662_aaqr_info,
> > +       .auto_detect_mono = &imx662_aamr_info,
> > +};
> > +
> >  static const char * const imx678_supply_name[] = {
> >         "avdd",  /* Analog (3.3V) supply */
> >         "dvdd",  /* Digital Core (1.1V) supply */
> > @@ -1470,8 +1531,11 @@ static const struct dev_pm_ops imx678_pm_ops = {
> >  static const struct of_device_id imx678_of_match[] = {
> >         { .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
> >         { .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
> > +       { .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
> > +       { .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
> >         /* for non-conforming DTs that rely on runtime check */
> >         { .compatible = "sony,imx678", .data = &imx678_autodetect_info },
> > +       { .compatible = "sony,imx662", .data = &imx662_autodetect_info },
> >         { /* sentinel */ }
> >  };
> >
> >
> > --
> > 2.34.1
> >
