Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290668;
	b=zPcK4e0DpYk8ttf5w0juQyolqBYwmjXf9UCwODzPVU3IJawgKqwNlM/3axgoKgZyQ22C
	 rogAfrtjz+GAJxZkeM5sQxL5XFCHME0ig3L4AAmuZvlzgzKa/EpuJgQem209xeeIRvdhZ
	 SG7PYdiVEW2EdDq6Bn1EGKhZxg8VEE1REQXman8v5vhvxj2BsjsUrJrnOGbbzd7TBVUYU
	 ma1d27i6SRhjUO1N7ObUjwhi8XD7xXPlwex1V9YT0yZOcCQWTEUfWl1VucZSw9lDTm8nO
	 aFv53P5BCZYoH+5kYoEEczZvCBIeqBEXPWQWb/wFXgvzAJOqUmPsQPquqBtCPjQjMFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
	b=WQGqw7nXKyHrnqf+n5UUkVQ1zprYW/F73UIHujXAXc4S+OuKjkw4nZnLME8mmxMfPSZN
	 5iqbAqVaR12mQRvRalUgqP5QKT7P95s7WsBjIMSmS7uhPCB82B50yQgTTxAiH/hDW/670
	 aix0co/eQXkprsh/EV+yhf5/PTW8xITLORfiJGSgb9v9OvUwxTF39i8qIR9FAyc0DM0u2
	 Rh3nKnVqhiWP/ui3tyMsXPF7TU5g9b4wOJcHBahGclT9GGoR7soCm5r2sLd2H63nC1q2M
	 lsPCNqVyrG3UQQcS/UGdembEiUKu11wcN78mtRKiEIEg8JeCwOANBwCqzDEV0M8kL2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=lQwA6HCT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A573D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=lQwA6HCT
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1117878fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290666; cv=none;
        d=google.com; s=arc-20260327;
        b=OPZH5X6DKI0r+fif7E32Fup874YiDpdFxAK6zr0BoVrH1uTUUEtAatH+wGvdb9rSni
         sg29A+zj68lngcQfhItp0bxkm4BoSJeoYBvxW9wAwg/Y+vAKWkrEVXLVhYO1birjhZU5
         56xKGf3KQ11ESnBVbW+BwnQcs+eERESpqGhqgLimi3U2S9JSR1iohim37ss5xZba55vA
         bbIUmdNUbWudybLi+uZDxnQ9k7ejOg7f9kpXSFd+4kixyUaNGGrnmp2fM4xl0RzEy9FM
         yDg5Oc20rr0HKiYyfl3fUDbpAtYhyfMgm7TMycJZWOMm3O4c14pTEd1EeHHbpH6vGBGR
         hMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        fh=jgPP2YawosOoGz4EeBWY5iffgDlCOwmYYZgS3IbBoug=;
        b=WTk0vuZG+JCrPrnUh52p7Sc0tCluE0qMhvRS+1R1dZQZ34rfP79mmlEztve6ycJJxV
         VRdFQ29Z/L19+5In/i1wU2+ofatXFoywi9dGMpEMpjRXIM/w+qACIJl58LeGplt2yj8p
         86DqqA12V5+LcxlGZW2MOxmrBukSgdOZorDWEhAM85TeoPfOVilvqaOtfvOlD/lFyKkM
         AMWbM6tEmOejrotGwZF4G1pzUTHbfJ4mY94qphXCHdr+kX/XCjqpOQjp3/RKCNqiMjlB
         mDcS4a55dciDcTC0yWUdTwMZ7SH5LkSG5vgZJSw1p7Kvk3QIiG6PlnrGm2fEH8M5NvEz
         bl8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793290666; x=1793895466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        b=lQwA6HCTlJowMc3fUQb7f1jdQFm07tgAPzK91ILicAIBwml/CuxI55Rk+m5fu163EA
         yeN5Idq3BZZyKkkbK0q7S8RocwFypKDHO1LSSEMCppvokNQl5EmIBHOYjaaq2xP5Ejf9
         8b/07vyk/MkBNsXGFwyV2HBmszy/Tifv5Ri4vYuGBoUAL2EOclfvcnVZk+t0G7KyHpeW
         AjFNj8K721EsryPPCeWL42+iied00pDshoEoTcovNdqHEwkF18Kjdpa05hCFA0IJ0fx9
         tpaUOI6iU0DJb6mb2PQColERxTbhUucglLmyVULiZpKFULkkJ4pVRo0d+8ENn0Jr0Pnj
         KfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290666; x=1793895466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        b=NqtlZNwIa+lxxiPf44c80mK7cW7kcvWfo05g4iQDg/EI7dZNBS2mXECXayCnddgfvS
         DkPEEx5n+TPaaf6jsDxttsBxVGD34MUxb6nYHwlffqThGbO/Q/oKyGsBlc7zbdILDUO6
         lF/k2mqyokS8pgsgJO6xpsJRAD1Y7Xhuvn1t9QZgVZ2yTTStGpaL6ffbTZIwdUmkvqxH
         d1D3cLEObz26vtypaECYdDm8vOOf1IhMKKFeIAoY6Wnzwa7McDlkSuJ1szFfCXwpziZh
         ZBW8rnUnF/HR7H+IhAhy3l9h0t/rFv4/dpgjdA0qobE1COuLRCXV2iU9W/bLuUAPM4ZO
         G6zw==
X-Forwarded-Encrypted: i=1; AKwUvBzhuP5m2tK3ISDMsg8av1LIvXavWABT66F9KSspnvogWLhWykTBcnz3K1fU5ZxqClnRkOq07voniHsva54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvk7lHG+ub1/UhtkvKy+MIn7w2xpBxgnarBj8B9CvfE94pExSV
	f1QfgF1HZvzHbCkfrqOvz0f58FqEllYm20NPLz6X0uNyh7yx+Jw0MIr324GVxT0IbC+VuKNyg8s
	Zklc7BMuqmJWFugLN51BtwqmjCJeZ3G1Kz7/eIzfb0g==
X-Gm-Gg: AYBFou0yzo7BVNwYnJ9wVD4jOKa3uPtHTkdDJAf2bfXynxZLmD1OEbkr17KvElwLFO9
	nJkIWq0UI/5hYk4TPoh3lXMT4AcWnjmXnfkyLyQGxn5zCiLyRDO0SATTWx/6l70cOeb31xA/OEC
	5hKREzfnjQCJhql0fohy/Ovxq0HUJhv4Gol2N++rP+4L6PFeZSa11CRBMrYmTEX5RuhGhiY7gGU
	K0LTGeX1qabp4+NBHbJJuFz8BkfMcYrdcHrxn3yB/gO+wufjp1ZXQMNrpdBL1x76eUl2XehZJms
	mmejww4IlalCX4yFS/22/6lZwX9Ch8Sp6brO0tH9ocqHODDHLW6+BnU2f3P3gIp4QJWpWqJIB90
	I+PGHDgXAcat5ur03SLs7UN3t/TddewuRVS/U6z5DW+i627UrdD5NPmTcN0bOT17YkAJ24x3xfp
	eGo0PJwUIju5U1B8+IZryjPgUfoMc7QtvAkCDY8MyyidcdSpmQKg/3HQ==
X-Received: by 2002:a05:6870:322c:b0:494:888b:33e8 with SMTP id
 586e51a60fabf-4a8bb9635f6mr4642047fac.20.1793290666459; Thu, 29 Oct 2026
 09:17:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <20261026111032.88355-6-antoine.pichot@gmail.com>
In-Reply-To: <20261026111032.88355-6-antoine.pichot@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 16:17:29 +0000
X-Gm-Features: AclHuK92Pqhgpz4CY3r4Mn98MdOq_5fPo7ARJt1Ycmz9acusfVL0tHSkEH0sYpM
Message-ID: <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: i2c: ov7251: Move the strobe registers out of
 the mode tables
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, djrscally@gmail.com, dan.scally@ideasonboard.com, 
	hansg@kernel.org, andriy.shevchenko@linux.intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine

On Mon, 26 Oct 2026 at 11:15, Antoine Pichot <antoine.pichot@gmail.com> wrote:
>
> The three mode tables write the same values to the STROBE pad output
> enable bit (0x3005) and to the strobe control block (0x3b80-0x3b96).
> Move these writes to a separate register array written right after the
> mode table at stream start, and name the registers a following patch
> needs: SC_REG5 (0x3005, whose bit 3 enables the STROBE pad output), the
> strobe frame pattern (0x3b81) and the 32-bit strobe frame span (0x3b8c).
>
> The values written are unchanged, only the order of the writes within
> the stream start sequence changes. No functional change intended.
>
> Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 93 ++++++++++++++------------------------
>  1 file changed, 33 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index b6579a56a5..ad66422d9e 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -53,6 +53,9 @@
>  #define OV7251_PLL2_DIVIDER_REG                0x309d
>  #define OV7251_PLL2_SYS_DIV_REG                0x309a
>  #define OV7251_PLL2_ADC_DIV_REG                0x309b
> +#define OV7251_SC_REG5                 0x3005
> +#define OV7251_STROBE_FRAME_PATTERN    0x3b81
> +#define OV7251_STROBE_FRAME_SPAN       0x3b8c
>
>  #define OV7251_NATIVE_WIDTH            656
>  #define OV7251_NATIVE_HEIGHT           496
> @@ -240,8 +243,31 @@ static const struct reg_value ov7251_global_init_setting[] = {
>         { 0x303b, 0x02 },
>  };
>
> +/* Strobe output settings, the same for all modes */
> +static const struct reg_value ov7251_strobe_regs[] = {

Is there a real need to add a new array of registers for these, or can
they be added to ov7251_global_init_setting? As long as it's after the
{0x0103, 0x01} reset, then order shouldn't matter.

Seeing as there obviously are others using this sensor, I'm looking at
upstreaming a few of the obvious clean ups, and I have a couple of
patches in the downstream Pi kernel.
One of the first steps is to pull all the common registers out of the
ov7251_setting_vga_* arrays into ov7251_global_init_setting, and this
change is partly going in the opposite direction.

Thanks
  Dave

> +       { OV7251_SC_REG5, 0x00 },
> +       { 0x3b80, 0x00 },
> +       { OV7251_STROBE_FRAME_PATTERN, 0xa5 },
> +       { 0x3b82, 0x10 },
> +       { 0x3b83, 0x00 },
> +       { 0x3b84, 0x08 },
> +       { 0x3b85, 0x00 },
> +       { 0x3b86, 0x01 },
> +       { 0x3b87, 0x00 },
> +       { 0x3b88, 0x00 },
> +       { 0x3b89, 0x00 },
> +       { 0x3b8a, 0x00 },
> +       { 0x3b8b, 0x05 },
> +       { OV7251_STROBE_FRAME_SPAN, 0x00 },
> +       { 0x3b8d, 0x00 },
> +       { 0x3b8e, 0x00 },
> +       { 0x3b8f, 0x1a },
> +       { 0x3b94, 0x05 },
> +       { 0x3b95, 0xf2 },
> +       { 0x3b96, 0x40 },
> +};
> +
>  static const struct reg_value ov7251_setting_vga_30fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -314,25 +340,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -369,7 +376,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
>  };
>
>  static const struct reg_value ov7251_setting_vga_60fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -442,25 +448,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -497,7 +484,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
>  };
>
>  static const struct reg_value ov7251_setting_vga_90fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -570,25 +556,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -1369,6 +1336,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>                                 ov7251->current_mode->height);
>                         goto err_power_down;
>                 }
> +               ret = ov7251_set_register_array(ov7251, ov7251_strobe_regs,
> +                                               ARRAY_SIZE(ov7251_strobe_regs));
> +               if (ret < 0) {
> +                       dev_err(ov7251->dev, "could not set strobe defaults\n");
> +                       goto err_power_down;
> +               }
>                 ret = __v4l2_ctrl_handler_setup(&ov7251->ctrls);
>                 if (ret < 0) {
>                         dev_err(ov7251->dev, "could not sync v4l2 controls\n");
> --
> 2.53.0
>
>
