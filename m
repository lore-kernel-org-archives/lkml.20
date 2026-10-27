Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123450;
	b=BhqmMVGgEE8DLgie81iF1LAkGGfIGpgX+YvGEA2fHZg36rBHED1X9wb4lWZaYIqCE+X8
	 VBLw5sk6Sk/gDTMPv4ac3WxdSi1OIdN1OeyTacesLsiS9huGhbTPj1w8zVAEp1oWhVpzR
	 im32kp7iFhvIudfTc2InjEeLiDdgHnfi0QkpzbCw2IgAlsteRVRRgr7KQmMnywAo9zSfJ
	 KwR6dmA50f/K01hqU9oPgaP7Ll9KSp+I+c1D7fsHFmjW+0DS9rSSKDTRbXo7996mHWJvE
	 52NuiWO7WVwgAoSZDx+UAThOHH3mSXBB4c5PyxcvmgY9vNoEKYhrGQNaNDvpievObQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EV/47UjyvEtLQbjYDkN466Fly+arTuIDMnysTk3prZ4=;
	b=JESlgv/wKP4oIJqbjj8JmFXqVfJCA3tE8Ht0ZclNYQgvwgeIWU7DUwlJEtodrczQiAtc
	 2INggPiYc0VRWUgbtPD2UgX004AWDSH2/qVEwFqRCmtXv9CLLDg1jNSLN33qUv9V3cOGC
	 52mXuI6+6GV6lGA5KbxLzmPgUx3ISt2IaXGe8+xf6fx062od1OfSKsKwbLzZLuiG23+99
	 LKQxU498CJGH2UcFnquIq/TI3yIBFSJvjOCohxWOjGNWCFIDF1t1aAVQ3LppVvU/26z0Y
	 g2qKG+8g0OJ1oXfr2C1C8ORRUEtcVarNcbZBPnY4i2LBcmZvTvgw/WwigthueK/VbWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mKXdY9D9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A946E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mKXdY9D9
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-46556b9e02cso72233fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123448; cv=none;
        d=google.com; s=arc-20260327;
        b=SuL1ZkVh5TuEc+CqZXi44eRmbxmzUdiD8O0cyG4BJ4oLruecOSfso+lrrghUv40QzL
         MlI+JzDiBsjeIkpnwDM+xLz2Ad53WM7tSmo0GdMmpLCOqhNvSnXCzqKscsT2sPg1WGn8
         c6PvhzXuXAYBV5oPrpgzy/ZqaxbOVd9ERikwJ5IhewK/YRFKxRDZ89E7YFPAAuklYnzn
         YgIRk0VaC9HUBp9v9Sx9epOUuwiu8DUeOGKHAV4l0scjg9QE5p8gfAfMjVrN37L4vFkU
         oulNjqKbxLVcXaAApSI58UWFPt2+y+xPZk39iKYBqz9r7orsFXekSBt7uP/JsPPcA0Vh
         D5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EV/47UjyvEtLQbjYDkN466Fly+arTuIDMnysTk3prZ4=;
        fh=H+0LmahbpmM6eCWrBkswkH5ey4gd8mmQG2MirX4Q1cs=;
        b=MtL0smfMqr+bsoYerP+9qcvuFJa+pkRt8tv9ZEJeYEwy8swSpA3Z/VLjeR0lCfek+O
         4F+vhElN1eneSEZAHIk9ksYmhfNs/eBfvfF5CV8EX6/9XZlj6TS0dsyzNY0oXOp5+a6v
         vHR2C1s/bp4l4BRxa8jvr79enk8GMbNo7wu8S5iNQu0uBHJ4llIKBF6SunXMkCWdbPFS
         44pcH5hxUcj+Rzg2ORF9n+0tVI3UtsbrmCA7p5qCaAIVmyJMWAlVHr+WuF3w1SuyTNHO
         1xx0eaWJCcvZRFmF2w/WXLS3yMeG7Fx2S7e7KkMSx+MNNcOWjFX/7nmXyLERfanLjwBs
         asxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793123448; x=1793728248; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV/47UjyvEtLQbjYDkN466Fly+arTuIDMnysTk3prZ4=;
        b=mKXdY9D9sWLt2ANh549EF4Il61wACGhkeJxRTBahZ1tx/q0NdfDumT71TiT5bb6mIs
         qJL0Df28pQHGTpznrEbZ3/qdM/6HLuucNCOtjiImK3dPbwkPFBElJemYBTbUOOWkHFwy
         H5S4v0IyrW+t+Bmlbisp78QxbDd/m4hXMW+pV1rpmbr1mZF15qfPwEGnttvCkFE7420a
         1Mgyc2TXe+Fcz1lOAE12NuNEqz8oqfWNdSriPbZ/rTdLYjm+SGOhlxAgQgz/asBAa2SG
         yvoyuoI7SyFgoiUgQHCEzbJnyhQ3bBgNaJ4FXRObe7GyfiIcr2EUuDDylBfEcd6a9/Og
         88+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123448; x=1793728248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EV/47UjyvEtLQbjYDkN466Fly+arTuIDMnysTk3prZ4=;
        b=DSvp7Fqi/t3SDDqY6+J7HMsgZPuVaoDnY/cz3QLWeEn3djLVOZTRXgJUDwYQEYQHSW
         uHqL7/Njz+a9ExW7qBONuDso3t3wafIdFfHHXVemENSrWkfXt0UX0jbQL8nafA/jxCbq
         ZlPYT7F9c3sErnzWz0Vz2IScomtRz15aoLvvt7OXvt7BAIweTPvAXGN5CeEzmOZTSMlQ
         RIqSA8S51xkkJfwpFpebhntDAUxWuFRMPCaJD8UtdKSPrD0Svi8yQpoWj/2UxC10pQ3j
         fcoPteBpc9d81ebf2JqWyg6ooRGyp7WecDow1KWQRkb7vWGW32eKS7xl2MD2EvdMt+8p
         wO1w==
X-Forwarded-Encrypted: i=1; AKwUvBz62KKO0EersSZIUOUiYO9Z6sReHejA4NS8RbQ3Fwc3Lwx9a8RtB3rLn62nZUWK1MokWf68AkyJhUc/FiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG/RS8vEwXvp9nbqmgqmLgoHouyV5T/71J8RLvlWbwDuW05WcT
	be93CbVCpk1utjvwEtG2iJ8u6N4u4QQeB9rWWsK37y+0EnnMGg8+Qby8R19gznA3jUEA8B7sZOM
	uXBT2DZFV4lntxuW5Hrr2mLruota0djv6w5m68u2vEQ==
X-Gm-Gg: AYBFou3d1yRl3JHqRPUCNwASYKfeoCsBnWTuGerWZ3/zuJCU2pY/w7eeHbAKUdo15/k
	dVdLVpeJYYoOBl07SYbYVwu6WG6NxjkjivY3f17Jl1fMN/6EGQJVA/tzDvdjMkpo3gUvxAFggO/
	M+n6Q3D5QmzSJpKbH463ym4GWfFMRsIqqzj5gx24/lsv3yCBDCDvALgluW6ua90oH2BMjbLbhP6
	4rd3/y6v3ASo3jBpfhECj+ILhgMGIbb2s6aK45MplOPwFiibzQJ0fJJexymhYDnCF+JPew6cNRv
	OmDNVRw2Zmk5i3CwR+8cPGbtOZTXdVO0x0hTOCljRWmLoUACe1t30tBcSL71Mx3muNM0KsHRM9n
	tk5VV8noZH3jov+3xsmG+QzfI2AuoUfYD0MhSmc8TdQJyZUGfIj8gHQaeTVNB4qar8AG5GEk3kU
	AJEI64/50RuX9+p9orQnnNnYq5qB8ojlo4v2LiE09DkrAWQWi17M+BNg==
X-Received: by 2002:a05:6870:36c9:b0:49d:d318:c12 with SMTP id
 586e51a60fabf-4a89b8fc3a3mr1775504fac.32.1793123448237; Tue, 27 Oct 2026
 10:50:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com> <20261014-vc4-common-scramb-v3-7-c68d58d959a2@collabora.com>
In-Reply-To: <20261014-vc4-common-scramb-v3-7-c68d58d959a2@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 27 Oct 2026 17:50:29 +0000
X-Gm-Features: AclHuK9QePu5dfzFpjyvRzZ61mYTzHhRQlgWJ8M2sWAiOXGhDxVqz0HepknjYFs
Message-ID: <CAPY8ntBKv9HRADVTsaZ6QkBKx_3b1_NHLy=Dvb7Zjx0t=9FZog@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/vc4: hdmi: Clamp CEC clock divider to its
 register field width
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 02:03, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The CEC clock divider computed in vc4_hdmi_cec_update_clk_div() is
> written unmasked into the 12-bit DIV_CLK_CNT field of the CEC_CNTRL_1
> register.  On BCM2835, the CEC clock is obtained by dividing the HSM
> clock, which in turn is scaled to 101% of the pixel clock.  For HSM
> clock rates above 163.8 MHz, the divider exceeds the field limit (4095),
> corrupting the adjacent CEC_ADDR field and truncating the effective
> divider, which breaks CEC entirely.
>
> The BCM2835 maximum pixel clock of 162 MHz yields an HSM clock of 163.62
> MHz, so the overflow cannot currently be triggered.
>
> Clamp the divider to the field maximum.  This is a prerequisite for
> raising the BCM2835 maximum pixel clock to 165 MHz, which pushes the HSM
> clock up to 166.65 MHz.  The CEC bit clock will then run up to ~1.75%
> faster than the nominal 40 kHz, i.e. ~40.7 kHz, which is still within
> the CEC bit-timing tolerances.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-168686@kernel.org/
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 2451ff85e759..0a95e14792e8 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -231,9 +231,14 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
>
>         /*
>          * Set the clock divider: the hsm_clock rate and this divider
> -        * setting will give a 40 kHz CEC clock.
> +        * setting will give a 40 kHz CEC clock. Clamp the divider to
> +        * its 12-bit field to avoid corrupting CEC_ADDR; for HSM rates
> +        * above 163.8 MHz, the CEC clock runs marginally faster, but
> +        * still within CEC timing tolerances.
>          */
> -       clk_cnt = cec_rate / CEC_CLOCK_FREQ;
> +       clk_cnt = min_t(unsigned long, cec_rate / CEC_CLOCK_FREQ,
> +                       VC4_HDMI_CEC_DIV_CLK_CNT_MASK >>
> +                       VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
>         value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
>         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
>
>
> --
> 2.55.0
>
