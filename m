Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D33F7AAB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512418; cv=pass; b=qnUrngt/qgSp+n8XGAM/Fb7JeUNGNBuETogJH7WIKAros4+H78lzT88DAjdus3E8FAVcyRVHmFWuIUS959Q5yuo3VzJbM1YzJCN1fM3TTKvo+qdpAuKajv+4DRTI6DiLgfVYABqzSLLqKL8QKUD7F55Bz9p8a8INC6EgvCDSPMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512418; c=relaxed/simple;
	bh=CmvRkw0tcfjCM8LSq8XxS0x2PFuwr0H01M7Zp2qL7tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcfKFq97lCa28ltJe6rS1AiOPxnTTkW06iYMzr/M4JYOVVYbYDDoJCzV/SDWHq8f6Bc+Ajo6yB56NDz+BzQu8lquEmD0MwoHGwrMlP61EVcefge8vPUe2DESnlMj8KQ5SMchnv7ejDiptZ5nlKhbXYAPA+DOdFnUsAXrT52+znk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh9Y0gU2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbZ5kUIM; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh9Y0gU2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbZ5kUIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788512413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
	b=Hh9Y0gU2xLRXXKGUdhv6aVf3dtICmyzugEzibQbTeTheCq8V25aVmMh6XCwXEGE+7Gj6bK
	/hU2xOm2P9Cttr8NaMe6/fk6hnG/ZYjKKfByBvqHkfqVZM6c5DciWcskTbxJyjAba1qBsl
	vKYK7uv97yEVEiGyvjyVYAgdJaYZNjg=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-5AE-KTxONxiwFNCVy_m8uA-1; Fri, 04 Sep 2026 05:00:11 -0400
X-MC-Unique: 5AE-KTxONxiwFNCVy_m8uA-1
X-Mimecast-MFC-AGG-ID: 5AE-KTxONxiwFNCVy_m8uA_1788512410
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-466d41a1d9aso766176fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512410; cv=none;
        d=google.com; s=arc-20260327;
        b=iiBnwCxovp86c1cLaHeJZ9UiF0+0BCT7Y6Gj2x8dxhllugjlIqaORU8637rkQ5O2r+
         EWDDuiKhhE9TfntEXQyBd4OqRoB6zEgKLXbpahBtsEeCeosL2aBKLDO+x9F03rccuprv
         F4OWwixNSfk855ORq3jAokZX7OsE2SwP4y+nGeehUNOBCoQkRZ7yB7E7VSrDyQgtKEk2
         Wf868nWQ8hZSbVZODUn6zU6Z9OZfhOClS42Y4HUaYdEj6GUD3YjCVRv+qR8vRnrrD4e8
         VztDX3qBa7bjvUu4Yzj7C62t6EfKyZONpdEeAAgtzutWMP+Sh6oQKhy7uxqXIBpltjwQ
         Q6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        fh=FoeN+eHAn9udgkrhSZhIvSAdBz1oyr6KTZkAY7CEAic=;
        b=BZQmQyal+Mq5oZYkjHhPhGVIunqj+tRE82qL6z8UhfH5coEwh+GtksydfpYaWH8BxS
         kLKtF+SPMgMDfeG9dKlpOsfCbY6ntn5eOh76bVI8z45lXB+MrOXeY3Gw+yqINUN3F4Ax
         /bwfwXqCHcWAoPqXHRm9JYH84FOH5RevM7U0dBvIa6oNh/mvYvd/bqyHHSznJuk9jIOs
         U3/8bOpkEBN+p+/1dXM8zy4eHrGqJ/sKE04eRvqWCkR2sUBJv65RjOJUXMr/kZIcqshU
         h//Mo2qQa8grWe2Xsit7jZjLh50yHv7FOQK0KPgCkyFJGE27LjleLPyRh3FfuCdSTTwG
         RYYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788512410; x=1789117210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        b=KbZ5kUIMB8P1Jkfdsc2zUQSPglrxeTARdmKGVz25M/yhzEdcVIMvKeOoCvdW4qTMBf
         CSwtUHzZWqx6vnKtAiGxMhAcdQw+4HDRiLfU9c/7TpguNXd1w2ygQSMWwHKfpC4D0Xhh
         7EIByKOxOTxIBzZ3555y6jobIY37/KiXXm+UhoCPHeFYPDzf+y7nXSFSk1cqBS+NGN6t
         nafAiz5u1Ws4PLRpyWwIRr7Mkn8AFaohSP7jD3Tz/YYES2kz33wY7shvQbMne2j38aGA
         rQVjBowC+6cDKC2HIETRdaPCilJB8K4cqjcLWmRYVdjFVr0+oF0v/4uAasAjYeby5Lf2
         kDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512410; x=1789117210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        b=NHrUcYpGqiNgjxcLunivSRQA8z5YkxcBoH1Jux6N/0shpTMrpGemSIRqJVyCYQkPLS
         gA/LfUhRGWiMVLGgYrhoKKM0BJAsNeNcYLKAc8v6ZQytnr2Vpy33QvKMIPLxOSciaRY/
         UwHQqnARE5zbC1XeK8x+/krhidnXOAljnNuBe8HdEweT+H5N6U/Q8IlJR2IGoD7A8HwN
         vXqW3orPCRReiRIf3nkJbbfqOxF0Mt/XsYeGiw77fOs48gmYXmR4yM5C02o1nnMuabnz
         Pcw/dK+nh3zH+N4G9DSqk544GZ+uXtJD8aeq+/T06QDEK3Uj6v9brhHi4P+MmYKulomR
         qfcA==
X-Forwarded-Encrypted: i=1; AKwUvByHz7xTvazmVZyrCC93qgxpu+/aUJ/Z7eu4gCXWo+5jRZ4WmP8YG5iYLH0MXgcH87AikuDNLAYii1Rydgo=@vger.kernel.org
X-Gm-Message-State: AFuF++mzNfT8mWy226X81y1Bw8deMucX3cWywMxgvIWOx5ABv8mrZoMd
	mE7gQB3PNv2SS8bfAMprCFOoPiRVLSr/Pz3eRpwU4X8G0TpbnesdDkJnsKn80ntMzng+NHhPP4N
	CxuVouUXEF9wzoKX/zVHoZOefQBCB6C24vwno4KMCbnrZSe4+MetlaDVJgPTyU8m2Ij6KFtw1Wt
	1rPGDDcq8InGgkIqaeNJqSxrdZblzm0UsPJfSfy9H7
X-Gm-Gg: AYBFou0bionCjZ6buY21uJF2D090G6oLGf736m7If8DU0pa4aGMffYFVlevwYF3+q1F
	cN0beLDF1vmH9scJLWu1w2qCw8Fb6ByPLnk/FvgVh96j3SG2bR+gMea99pkUqYGSwr0U4zbijNg
	7d6AUF6udrfwxLf6A7VXfM40tBdvRPTFiZIZKQYCg3jIEZrLKVTMIGzwXr
X-Received: by 2002:a05:6870:2184:b0:45e:25a9:5455 with SMTP id 586e51a60fabf-4755136f9b1mr4772108fac.2.1788512410052;
        Fri, 04 Sep 2026 02:00:10 -0700 (PDT)
X-Received: by 2002:a05:6870:2184:b0:45e:25a9:5455 with SMTP id
 586e51a60fabf-4755136f9b1mr4772063fac.2.1788512409513; Fri, 04 Sep 2026
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
In-Reply-To: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 4 Sep 2026 16:59:58 +0800
X-Gm-Features: AcwNN1WYQ90aHpgHAa3kyg4v5hrd4_0w2-C967zk3QLCYwvdk7dagXtPUGOfwXo
Message-ID: <CAEth8oF0__WNz9_gsSnrycP2SYcs_-G06r6TCPCFK2g1N=jbJA@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx471: Fix pixel rate and line length
To: Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, tarang.raval@siliconsignals.io, 
	jai.luthra@ideasonboard.com, linux-kernel@vger.kernel.org, 
	antti.laakso@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thank you for working on this.

On Thu, Sep 3, 2026 at 3:36=E2=80=AFAM Christian Murphy <christian@themurph=
ys.eu> wrote:
>
> The pixel rate is derived from the CSI-2 link frequency, 200 MHz * 2 *
> 4 lanes / 10 bits =3D 160 MHz, and the line length is the binned array
> width, 2328. Neither describes the pixel array.
>
> The VT PLL gives 19.2 MHz / PREPLLCK_VT_DIV 2 * PLL_VT_MPY 121 /
> VTPXCK_DIV 6 =3D 193.6 MHz and the array reads two pixels per clock, so
> the pixel rate is 387.2 MHz. LINE_LENGTH_PCK is never written and its
> power-on default reads back 5120. Timing frames at several written
> line lengths confirms 387.2 MHz at every value.
>
> With the declared values the line duration comes out 14.55 us instead
> of 13.22 us and exposure is overstated by 10%: libcamera reports a
> maximum ExposureTime longer than the frame.
>
> Derive the pixel rate from the external clock and the VT PLL
> parameters the mode table writes, and set the line length to 5120,
> which changes HBLANK from 400 to 3192. No register write is added.
>
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dr=
iver")
> Link: https://lore.kernel.org/linux-media/20260728042013.23707-1-hpa@redh=
at.com/
> Assisted-by: Claude-Code:claude-fable-5
> Signed-off-by: Christian Murphy <christian@themurphys.eu>
> ---
>
> Notes:
>     Changes since v1:
>     - Calculate the pixel rate from the external clock and the VT PLL
>       parameters (Sakari), naming the three the mode table writes so the
>       table and the calculation share them. The object code is unchanged.
>
>     v1: https://lore.kernel.org/linux-media/20260830173345.15886-1-christ=
ian@themurphys.eu/
>
>     LINE_LENGTH_PCK reads back 0x1400 (5120) from the streaming sensor.
>     Written to 5632, 6144, 5008 and 5120 in one stream, the line period i=
s
>     llp / 387.2 MHz at every value (14.5457, 15.8680, 12.9341, 13.2234 us=
).
>
>     Tested on a ThinkPad X1 Carbon Gen 14 (Debian linux 7.1.8-2, libcamer=
a
>     0.7.2): controls read back 387200000 / 3192, 17.296 ms frames, maximu=
m
>     ExposureTime 17.057 ms. v4l2-compliance 46/46; W=3D1 and sparse clean=
.
>     The driver is new in v7.3-rc1, so no Cc: stable.
>
>  drivers/media/i2c/imx471.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84340..0559195bcdd2 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -65,9 +65,12 @@
>
>  /* PLL */
>  #define IMX471_REG_VTPXCK_DIV                  CCI_REG8(0x0301)
> +#define IMX471_VTPXCK_DIV                      6
>  #define IMX471_REG_VTSYCK_DIV                  CCI_REG8(0x0303)
>  #define IMX471_REG_PREPLLCK_VT_DIV             CCI_REG8(0x0305)
> +#define IMX471_PREPLLCK_VT_DIV                 2
>  #define IMX471_REG_PLL_VT_MPY                  CCI_REG16(0x0306)
> +#define IMX471_PLL_VT_MPY                      121
>  #define IMX471_REG_OPPXCK_DIV                  CCI_REG8(0x0309)
>  #define IMX471_REG_OPSYCK_DIV                  CCI_REG8(0x030b)
>  #define IMX471_REG_PLL_MULT_DRIV               CCI_REG8(0x0310)
> @@ -232,10 +235,10 @@ static const struct cci_reg_sequence mode_1928x1088=
_regs[] =3D {
>         { IMX471_REG_DIG_CROP_HEIGHT, 1088 },
>         { IMX471_REG_X_OUTPUT_SIZE, 1928 },
>         { IMX471_REG_Y_OUTPUT_SIZE, 1088 },
> -       { IMX471_REG_VTPXCK_DIV, 0x06 },
> +       { IMX471_REG_VTPXCK_DIV, IMX471_VTPXCK_DIV },
>         { IMX471_REG_VTSYCK_DIV, 0x02 },
> -       { IMX471_REG_PREPLLCK_VT_DIV, 0x02 },
> -       { IMX471_REG_PLL_VT_MPY, 0x0079 },
> +       { IMX471_REG_PREPLLCK_VT_DIV, IMX471_PREPLLCK_VT_DIV },
> +       { IMX471_REG_PLL_VT_MPY, IMX471_PLL_VT_MPY },
>         { IMX471_REG_OPSYCK_DIV, 0x01 },
>         { CCI_REG8(0x030d), 0x02 },
>         { CCI_REG8(0x030e), 0x00 },
> @@ -282,7 +285,7 @@ static const struct imx471_mode imx471_modes[] =3D {
>                 .height =3D 1088,
>                 .fll_def =3D 1308,
>                 .fll_min =3D 1308,
> -               .llp =3D 2328,
> +               .llp =3D 5120,
>                 .default_mode_regs =3D mode_1928x1088_regs,
>                 .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),
>         },
> @@ -691,8 +694,9 @@ static int imx471_init_controls(struct imx471 *sensor=
)
>                                            0,
>                                            link_freq_menu_items);
>
> -       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/
> -       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> +       /* The pixel array reads out two pixels per VT pixel clock */
> +       pixel_rate =3D IMX471_EXT_CLK / IMX471_PREPLLCK_VT_DIV *
> +                    IMX471_PLL_VT_MPY / IMX471_VTPXCK_DIV * 2;
>
>         v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
>                           V4L2_CID_PIXEL_RATE, pixel_rate,
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.53.0
>

I proposed a v2 patch of line pck setting and pixel rate estimation.
It can be found here
https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@redhat.com/=
T/#t

According to the datasheet, since this sensor runs in PLL dual mode so
the PLL configurations in the op domain are used to calculate the data
rate and pixel rate.
(If it runs in PLL single mode, vt domain settings are considered for
the data rate. If I understand the clock tree correctly)

My patchset includes naming the registers and pixel rate calculation.
Could you please look into it?

Thank you.


--=20
BR,
Kate

