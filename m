Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0E286A5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482514; cv=pass; b=QNiyFkm+EKfmfFMS5Dl4VLZDvfIK5Xv/2bgmlcL8jyQPNzorlRmPPR+bASGzte5ESIir1ANITxO5l0LDfdRa3BoXjtyOCYvWdVu9n/r2llfvYxTSpzrJg3eMGplhFLoqTAnmdKaT0+orx+2j8OtF5wU08nbW1I3aAKNhWZQnq28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482514; c=relaxed/simple;
	bh=P29WTRQ4owVXSs64rXKqh6yb7OH7buadxGsqp0szaGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTar5augTPwK8E624ykCjFbIdVI4xdlSglFLDUsUbOMA4y3UHnRuCqHsOFxxEW3Ggs614C9LsDecoaf8wOOA8l9Ml0tIIXhiwGvtLyos8M5K239QlvyH/k1Ie1AQ6VxeSWiabeIbj4ycpQlbyehSvStcjUVXb5XnCoEMjeFIfiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Q9W1YP1L; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Q9W1YP1L"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4af7283bf83so1456036b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791482511; cv=none;
        d=google.com; s=arc-20260327;
        b=keJgMeHCXsYTQp/s7WgNQgiBvUHeikO4LoxMSpRH/M1IZ4nvhW9hMHU3vuIwHJNh0h
         4QiAvVbN/7GqtHLP9CNfm8KpAU6LhapFY4ERaGZtTGuyFYncoReoNZj/MEd14lHU6Bo5
         rQ9NG2i8O51R85PsWLRbI2+yfCFcBS6gijvtimYY9V16Z717Nyds6JX8MZ5u+vaY1na6
         i+15sLd+a8NyZ9Zj1aB+LGLyaRwpT9gcDomqHQGFIXAZjpHpgwuncvSUtJtLd7QQrlZx
         2pYmKm1cgvoqiaP1eJUB+7kcBKXuHnkJ7t1yUhk/wYMcISk3s+kutHoxuDhwuGEI/Ehh
         nHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rj9LeI1dDZhOR4KJgKOQs0yMX4hB0yDaMikxwJmFK1U=;
        fh=U09kyrJ+YD0VBw+ZvvC1QWUPcMPspDUuRgRgMgJnDpE=;
        b=GjTyU/9HcXnjENPY9GMDQhvvwHg7Ued1GnEHjy7FzI0oaDRPVzZTF7a3zZrAxbadI/
         u2GJa/rSCe3Fv2RgO9dE92USUGKsgrdyzAg/W2xbzYfegomwEwvMKKeOfaNoKIdRMA9R
         TlDStZrSb/4eQ/CRmojZYqCunwCNaaLZ+7HCZoP15eo/w+0kJr+Xaf5sEP6VAIkI6aph
         RSN3z55ObHNUqSP9+QKjUef6ThT7cGOS+S+Ud2uv6kplBWi6hIboKINF38nhmsoADzAH
         ljdfs4yqlFtjErGBHbBfl+qnJuOuKpSBBV9SGiiMq0BKiSNYMSafyIuhqqmy0L2NUnY/
         jATg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791482511; x=1792087311; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rj9LeI1dDZhOR4KJgKOQs0yMX4hB0yDaMikxwJmFK1U=;
        b=Q9W1YP1LcrsqOHZHQyFAiMR7cTWeIzDQbof/zSEVI6woNxmNUNIPSHm+oKMjQHmxzi
         fe3Ijz/pB1tQtKaxNNaoaEaW892lMsOSH8wx9yXQG2rccc4iAtR1kLu4PY9W+VhWT513
         J9fcawB6LmZV+NjqVEcQKx9LsXeTOBmmZstQeQxArgDKbVHPdbt+c6A/G04ZQ1sfS9ch
         9ae8NR678IC39OVGhs+OvI290uKV7FMC9N8Ya8pitWqIR3TCCFegcrh4YzBaopzv3ioe
         kkFyFK9RUctp5mZabzxC3qBF3oosS3MqzTGU5r0Vsxdl0dJbaQPEA9+HS56EKw+6M8id
         Hhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482511; x=1792087311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rj9LeI1dDZhOR4KJgKOQs0yMX4hB0yDaMikxwJmFK1U=;
        b=ZGPqQGh+chrewO5nlB2HJjQtIvkOQ5WIfCjnVo7w7p8MXuRGahl4Mxo6s5+YSS5X0q
         Ak6+tOuJY9a6QgoHd6aAlLgj7p7+l3MRUZ9oVQxvc+68clFsNzKzUtZReuDG/HH27Wfq
         YgYHybrYL6NU2/IS/WhWmaNmO3O2rssQmoZCYCVWqKs3oFcJRxhbf2KRE8lUjDtrjFPM
         4q0HzrD79B27d/TiRhnBLnFDcqtfPZd04dQHL+oWffuZVgXaKVXguMsX2ou2HWnv3SOM
         pV3OuQU6SraVs0v+pu4+7uyUhoFR2PdddmSsKA+yVGZL9/PAS7jVyDWGONH1SPBlmBfT
         JDhg==
X-Forwarded-Encrypted: i=1; AKwUvBwNc+yKa3C/AES33ShIChqFD/Wu/PJdqPuWo/S/Hwd2hqGQm6jxwhN4Gct0ZTUywlSiX0j5SBMkzXUbu9E=@vger.kernel.org
X-Gm-Message-State: AFuF++k7k0rJXiA1hxBPKrohF9kND1Z1k6J2e2XgfXu2AkWKjIzWkqSe
	yxIJkW6jJ1040Fpsg0uSCZhdoQGoZdmUnuemAhYzElowt6jg2PVnS60cTHQn5damLbKLh/EddnH
	MgOkcDFA3XEb5ZaVuaAFJ7dI2sX47CL2oFz0+QGsvRQ==
X-Gm-Gg: AYBFou18B7AkLZQ78/BakPudSqkl3VQ5yLap7eTUiIOXxqRHk2dZydxlE4DqeY/kJ3U
	fLqsWs11vSRh/iBd+VV06UocanYqsgIW5Huzu74lZjoP4dlg1WA9GUfWue1h8StLVq/xNwAbJAf
	JaiWwC2wTAeJ9KNAaH64VkwKGP6ap4f1qOuJ4mlIFE5aW46vbmlsMsNwJvlN9a/G7RK7+eCNISN
	EuPCTK0+13ACvnoSBXdT/UTTs+CSnrSTSa4X0EcvHTYBLA5oJ544K0xjHAV3zehH8meAqZCknRJ
	QE8U0DvAr5YSyIFoN6ZuqxGH0XkZSRn+YYBZeJbYScfMRQwxzGnYcjWQKvJ9KVon6Ooe+WBT2jV
	D4COSnoqocSVcuVJFyj5EZBqGmb2r3TmOm53bUftSPscDyLnEJXtwn9FD97t3rRLCWqwVbZyJ
X-Received: by 2002:a05:6808:23cc:b0:489:5d05:552c with SMTP id
 5614622812f47-4fc46683267mr5689930b6e.18.1791482510745; Thu, 08 Oct 2026
 11:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-vc4-common-scramb-v1-0-51280460194b@collabora.com> <20261001-vc4-common-scramb-v1-7-51280460194b@collabora.com>
In-Reply-To: <20261001-vc4-common-scramb-v1-7-51280460194b@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 8 Oct 2026 19:01:34 +0100
X-Gm-Features: AclHuK-Sewui8Y7baQx_PKz1CfNAZ_l90MYcHcLJ8IU6I2i_vyOwGlo2uLO65MI
Message-ID: <CAPY8ntDCU80hkxdDEGphQCX362ut4AdWJUTGkDOwOHWfkPW6BQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/vc4: hdmi: Defer pixel clock validation to HDMI helpers
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian

Sorry for coming in late on this one.

On Thu, 1 Oct 2026 at 01:27, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> drm_atomic_helper_connector_hdmi_check() rejects modes whose computed
> TMDS character rate exceeds the connector limit before invoking the
> driver's .tmds_char_rate_valid() hook.
>
> BCM2835 is capped at 162 MHz, slightly below the 165 MHz limit of HDMI
> 1.2.

Nothing I have says that BCM2835 is HDMI capped at 162MHz.
Working back through the history, originally the HSM clock was always
set to 163.7MHz and the pixel rate had to be >1% below that, hence
below 162MHz.

However that was reworked so that the HSM clock rate is now set to the
pixel clock * 101/100.
The HSM clock can run at 166.65MHz without issue, so a pixel clock of
165MHz is fine.

  Dave

> Set supported_tmds_char_rate in vc4_hdmi_connector_funcs_hdmi10 so
> that the limit inferred from supported_hdmi_ver is overridden by the
> lower hardware constraint.  All other chip variants rely on the standard
> HDMI 1.4/2.0 limits, so the default validation suffices.
>
> This allows vc4_hdmi_connector_clock_valid() to be simplified by
> dropping the now-redundant max_pixel_clock field from struct
> vc4_hdmi_variant.
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +---------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ---
>  2 files changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 2451ff85e759..6d3db0d24c38 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1529,12 +1529,8 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
>                                const struct drm_display_mode *mode,
>                                unsigned long long clock)
>  {
> -       const struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>         struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
>
> -       if (clock > vc4_hdmi->variant->max_pixel_clock)
> -               return MODE_CLOCK_HIGH;
> -
>         if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
>                 return MODE_CLOCK_HIGH;
>
> @@ -1579,6 +1575,7 @@ static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi12 = {
>         VC4_HDMI_CONNECTOR_FUNCS_COMMON,
>         .max_bpc                = 8,
>         .supported_hdmi_ver     = HDMI_VERSION_1_2,
> +       .supported_tmds_char_rate = 162000000,
>  };
>
>  static const struct drm_connector_hdmi_funcs vc4_hdmi_connector_funcs_hdmi14 = {
> @@ -3185,7 +3182,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi_regs",
>         .card_name              = "vc4-hdmi",
> -       .max_pixel_clock        = 162000000,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
> @@ -3205,7 +3201,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi0_regs",
>         .card_name              = "vc4-hdmi-0",
> -       .max_pixel_clock        = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
>         .registers              = vc5_hdmi_hdmi0_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
>         .phy_lane_mapping       = {
> @@ -3234,7 +3229,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI1,
>         .debugfs_name           = "hdmi1_regs",
>         .card_name              = "vc4-hdmi-1",
> -       .max_pixel_clock        = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
>         .registers              = vc5_hdmi_hdmi1_fields,
>         .num_registers          = ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
>         .phy_lane_mapping       = {
> @@ -3263,7 +3257,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi0_regs",
>         .card_name              = "vc4-hdmi-0",
> -       .max_pixel_clock        = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
>         .registers              = vc6_hdmi_hdmi0_fields,
>         .num_registers          = ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
>         .phy_lane_mapping       = {
> @@ -3290,7 +3283,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI1,
>         .debugfs_name           = "hdmi1_regs",
>         .card_name              = "vc4-hdmi-1",
> -       .max_pixel_clock        = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
>         .registers              = vc6_hdmi_hdmi1_fields,
>         .num_registers          = ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
>         .phy_lane_mapping       = {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index f6159c9e6144..61486e7b4ba2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -29,9 +29,6 @@ struct vc4_hdmi_variant {
>         /* Filename to expose the registers in debugfs */
>         const char *debugfs_name;
>
> -       /* Maximum pixel clock supported by the controller (in Hz) */
> -       unsigned long long max_pixel_clock;
> -
>         /* List of the registers available on that variant */
>         const struct vc4_hdmi_register *registers;
>
>
> --
> 2.55.0
>
