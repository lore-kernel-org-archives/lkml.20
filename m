Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123518;
	b=qnSLCeD+q5LjCKANBrV2tiGzs4iejlwZjorId5zp/M7jlHVj8XQMt+WilTEX0UA9RlHG
	 Qvq8DG2UF/SGTnnuN2kwMQktLpp7SQg+ZByIx5n6ODkJeR3mmLPuUzQCPIHwpqzx9ohj/
	 zezNi2s7336jb8vBU8Owh09mcKRyX1i+WBFgox6/BDI2nHR4TEfl7QdYndH41QA2I9ngZ
	 ZeYo8kRnjMA9uhBoDoYteQNPtv924T/nYU4E0PqdToOkTfe9X/1ryrLVchQyJrpILGm+q
	 84McD46pooJ3YqzMxOs98GNUoKPy//aZ912bPJ8vi1OGxtZiVzZy4MjWk5jBvl1N1vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GGr5j5Bzi08+rjV4DuhZvfvPzAyD+nxpZaxVOzmJBZY=;
	b=uEtU6/EUn+m2nSvLmmxQg2lf6r1wLhg7kBOJqoSZSOpOC/z068wWzZF4ql+G/nZPxnVB
	 zPegVKp3TXurtv8FSg9mYEV9h9D4/WkLch5A/l77QOxZT8nPt+AJ7dcgdNAnu7jWfRcVT
	 ZOFN74VnBFizxnB2hRgBzze8mY5p7pUA3Buma2odcWZlIxNjkpYsjzF2Mh1ksXsHmwAUj
	 DAoPjnyeWRgYa9yqECLmBJLqtb5yfOkcg5GgsN0bZgr61AjMG2H8UAzYh/sNAt1feBktv
	 qKGkgqoKdlqqVqUVcZCnW6RUYwkt4jBN5Qt/2fjWpuxDR2Gg3vt53yji/Gm6xFjundg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGeF3+A1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D07F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D07F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGeF3+A1
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed188ee81so96459fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123517; cv=none;
        d=google.com; s=arc-20260327;
        b=PakXaSQ4OAAllQHraglcq3NS+YbaXmcSDK9XoHLrlB5D8NKWK6lX8TPXNXxAGaNMQt
         Ce0/b2ixWl4PrP37EaGA5+iEjPGzndqukTxh9pTTHL9gb6ostYroLwDwyg/rd/bMJl7G
         tUG4udgG9Yiai7bwWy8g2pKGNwLoyUiAbz++Brkh1cIpfcuJb7W9b7t+lN5Rt714Wlf5
         4/Csyc8jW+nmCcqwwtxiWNFV+LikZbI0N9MOpiZYKn+U7A/sGXj1jO9fUzEPoJ8STWg+
         RMIDP+YgHw/Pxc/OUCni057EGnaGRhG1yJWHoWYnOP+cUBTuqp9qNjNO4zoj6H99Mnmz
         DmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GGr5j5Bzi08+rjV4DuhZvfvPzAyD+nxpZaxVOzmJBZY=;
        fh=Bz6u+AdZIejFaXitE+2L45/5Fgg96o9Hlfel/GtwBQI=;
        b=GvZ1w4iRwM3U+DDGrWXdoqtn9olsK1exJ5AkqQmj2ia3vZf3zJdBctANn+hJNMdtVK
         KG8gCU2E6a0fZV8AJYAPO/VXt1i+8ksRrRy5MT1N9o3t25geQ/kC4qF4o6gN5pAa9Mh8
         S+GATsgzq8Ii0rBg3x2ONIvWldaPzZXeAYFsOOzDFgRVt4PV/C2OWeNgGZ+vjoCwHZqh
         CAVCC3A4oZX07/n5M97tl6sPBlqPY9/xuhLX3BSfRm/z/YqYiSuaQKjHJAttP2YJj+pV
         MwGZkqmM5t4vzTwRMWBo/jEhOeM7ectrXatw995sgClhEGgRWZI7g6IT+Umc/zCzyyBD
         PNrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793123517; x=1793728317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGr5j5Bzi08+rjV4DuhZvfvPzAyD+nxpZaxVOzmJBZY=;
        b=LGeF3+A18XYLFSnGiPjlfhx1AcqWQGJxM7wBVkvl0QGNZX2BDCjHB5AWnOguKlsmV3
         fMQD3skXh/F9QELC0+HtP/5mSju25uXXwropTt5kq1K+D/hF6QJTABPt1DeWY8yX4Sc+
         rxd2wxl3uZ5Wu1e+1gYVuhDSHGIfzSKx/uYBGgCQJdLRkey0AnZCsUECEdg/lEH5/ffW
         L6uARWO8Nrw7CD9xpYnziFVfy1RQl2LgliUrN0M4NxmT7Crs+QsYRiOdBQ8bJb5nCNVs
         fqVtN9Xe5iLQskvAqY6apcvIq/LIdzEBwdQCCxApLDGQcC1h1mPjzD+xLtYGR1z01sVW
         1UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123517; x=1793728317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GGr5j5Bzi08+rjV4DuhZvfvPzAyD+nxpZaxVOzmJBZY=;
        b=lShvN4yaXkL2gMgaO3d4Q0x7cjuHImbFbBXyz59HNgs6SYSlfK4JvYck9ge2wnZbhV
         GmXK4cNtExI3YVm8e66VO7ZYuE2Kh6+YJk1VN42o+8OeFKsZGUNitOIcLAALlwR0FsGB
         VmM8OEF0j2KsrmyDz7nnv6L2K2j6wfb/znuTqm7KLoHEBBFYVJeVwoXpvG020/nwoVYt
         mz1XHTAISgzukP+K/RuRqSBrow9ViOglWPPHLdObjYbmZ07C8AT/x/RmIc6OYePA5vW6
         U3uPAAVc2BgfShaWIlzDREwh69mDM30ajppgnzDLkxryegtHDl9JRJX8okjeZu4KWGNb
         IvTg==
X-Forwarded-Encrypted: i=1; AKwUvBx/7Ie+wqRYEtX6lGn1mercCNDv8MqRFPP7yqCjjzeX9BEzUacl9PeH/aeI/6nTdynm348s4NAm4eD1nEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3xYa/LfhXAUfVq9WHUSTxq3F02Ex8WzSFlIAcCHgYDbp9kw7y
	pSIzzgmSfgKWUGKUvj2twhi2zwsB4rSeVCWWcGgJiXH5v4y7+/1X18kt3FNohTU0XPU4a3uKuhz
	0yk+SIhBOSfXcTY6uaob5Mvd3IXBi/J/Gb25NbvIEmw==
X-Gm-Gg: AYBFou16knm6gG3OzvW6X3g8UK9ZZBXKCM6rmDtAG26AzXTqApLOmgph8ZIMhkzChb4
	uEbnj2nLrhQJaHoziLeS7xtAIaPZSFn8uT5kiw9Oaqmdi96amWiDNpEPyvOpe9XA6fJa7VY4ovo
	ZGyU4in/9yeBbJqxGnJsdO3+tMzut2UEygI1AC5WZVMdxrDowTOlARXcWaO3T+VPFDOcFDPsU/u
	+9VUX2tZtSJ2te6xWTmsShaDHkOepubSZIuvbEyCjGMRPR+8bUQOcx7PJBop8MlkEh1Pn/VbwPr
	jXHWFM5noGFgnESFJ2lL3g3I7Mp3KtyevL5OdAoqIduILza9kSWrhCskJhDZl45MUwje48qkMyp
	JfQkYbRpkvAURwJa/rIPiUZsWWLPKd0LZRz2/l8PzTNz4oe5lRau49qmCskcw+iUUJYi7u6ZnPj
	x91WLMOxTeeUxzIxtbW8Ze9FrrcgUbxkBNCbqBgZKSO9usKC5c5VU/iaTjeYO6PWzV0z9aEJZJc
	JQ=
X-Received: by 2002:a05:6870:32d4:b0:4a7:2ba2:61e3 with SMTP id
 586e51a60fabf-4a8bb68a9cdmr212651fac.38.1793123517141; Tue, 27 Oct 2026
 10:51:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com> <20261014-vc4-common-scramb-v3-8-c68d58d959a2@collabora.com>
In-Reply-To: <20261014-vc4-common-scramb-v3-8-c68d58d959a2@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 27 Oct 2026 17:51:40 +0000
X-Gm-Features: AclHuK8ZKJ_JTVubRk5FXQa86W3jtd6tziWTz8u6Qiv1FIRrgy2UTs2WpYRya4I
Message-ID: <CAPY8ntCPZBwg3ynaoQPM=EJFeWYCeueFNN_MD_4+sZuj3csMEQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] drm/vc4: hdmi: Bump BCM2835 max pixel clock to 165 MHz
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 02:03, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Historically, the HSM clock for BCM2835 was fixed at 163.7 MHz.  Since
> the pixel clock had to be at least 1% below the HSM clock, it was capped
> at 162 MHz.
>
> Since commit cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate
> depending on pixel rate"), the HSM clock rate is set to pixel clock *
> 101 / 100.  For a 165 MHz pixel clock, this gives an HSM rate of 166.65
> MHz, which, per Dave Stevenson, the hardware can handle without issues.
>
> Increase the max pixel clock to 165 MHz, which matches the maximum TMDS
> character rate of HDMI 1.0 through 1.2.
>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0a95e14792e8..5b7dedd7a9a1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1319,7 +1319,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>          * users are able to use pixel clocks closer to HSM's, namely for
>          * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
>          * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
> -        * 162MHz.
> +        * 165MHz.
>          *
>          * Additionally, the AXI clock needs to be at least 25% of
>          * pixel clock, but HSM ends up being the limiting factor.
> @@ -3190,7 +3190,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi_regs",
>         .card_name              = "vc4-hdmi",
> -       .max_pixel_clock        = 162000000,
> +       .max_pixel_clock        = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
>
> --
> 2.55.0
>
