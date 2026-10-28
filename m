Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199236;
	b=I5Afl5vt7cBFmBeOgqxd1QEqtFPUXfg5CXlNxAcevJH2/fZEJP0uofVzLu7HZpGQN+FF
	 Nss3fFf3ckXWgwbzJnBgLPrkOqgMFDSN9EBxHTeanhSL0UfVXuXhkBmq+HaQvpCQkLCFw
	 stS4Mk7fBB3GE+za3LAH1Xw4ZM0xuuSQQCEX6EGs/XZNsfmkttO/wt7/gWS9oxLVJBrSu
	 TqO4i3PvWspvw0zZfDRiK3uuDoxTVR97HLANob5JpS3U7uXRCw8tO4ojLgtgMBsr0XCZG
	 ZQE/wbaC8VfPyY6cWJqzKgcX/0cTYwbFPq6AYikgR3NoR2mRrprgof8/AlSWT2Q6PsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=d8xiOKoQDSvdpojkDy4fldRww1u+2VH02DEwdCLpEj8=;
	b=g1ym+UVRuAe1mYNrXUkkjdTTLPJjQtZlc4B0ni7eotVhv8Qn9ZLZgmGIaQyhlVcqY2Mq
	 Rxcb0i5V+RDnGqsFouIWWpX593qDB7PflT6f/ysp2qtquYohWbz4sONmGV+ZsBtQ34XWL
	 por7kQr1N7b4sIa76c6TQUh9vm5ofE3qoIzw6KD1TOcvDKLzdvxbQqs1ul8OwfElmdXPY
	 1ALEUA7hQrH1JBomyUrjRNs/zlc6mEpwgwE28iQ0W41f2FFTKjvnVJiormc4yKm9wh48w
	 7SNBilG9Nky+BDfSRvqy/wzwc0q9KSIdPcsejUcBXF7TfFvyOMFBRDArwqXkYjVQQ9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LB632zMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6ED606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LB632zMh
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a85c656c58so752872fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793199234; cv=none;
        d=google.com; s=arc-20260327;
        b=mestx7YLPqTrE5dVcKjsN7/PHGOq6dgjlyi046ysExnafaq8aX6VfS5Hlb6PgNgFRA
         1ay9jxEx2L68KvpbYX95mZ4iBQHNHWKwvinzMN47bwxzfZip8ikGTQDx1Jg2Nw7szeNv
         ON1hwsgc8TAIcmDQCcw6RUhRbx8nmYrD7k5BKWBQb4bfUXHZEhif8Kx2yX7zSvF1XKxY
         BseqkYrEHilzrXbVjEzPWFseZPtAHGvxsUd8Ye7RpUzlRpyfqDs6HX9clCHPpGe7BgE3
         p7x4aHIohwqIOfqEoWeAU9yJZ/FlfxjuJkmFebeXZaa2xF5YtvUwGt1+urrCVblK8Dqb
         /+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d8xiOKoQDSvdpojkDy4fldRww1u+2VH02DEwdCLpEj8=;
        fh=kKwISBuoDxw68NrwypF50f6k9ZfjYO0YOMzh3pnPMgs=;
        b=nKb4Zct8CyKSyXmdDBeqp/1p/pem5p33oihJyz5birBTVwJnk0epOqZbdQVJIa4hLL
         3FM/6IAlSNnLEusyJEsSltu83Ctqj/GQyxbv/jyTaH02NW4J1hfdPsS6iIwZa1+UkdKm
         6fe543mc3mmB1G/nHwXwla953ma8k597cLQDpKGDiHOnu5OX7xdQOBxFcP1Hm0lCN+X7
         V9N9vT3iVwKqs4+PaBXkuXQbQLorJdWGfjYRRNo58b58P8tBMyndOS0BFFi5bxsLnAhF
         0DQdeKNkLBN2lg3VG9govmZosf6YadSQN8jDd8QjJn3XT5qeYjCzDBlQjZ6/gcVMNad4
         J4hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793199234; x=1793804034; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8xiOKoQDSvdpojkDy4fldRww1u+2VH02DEwdCLpEj8=;
        b=LB632zMh6fbtAjcuY/JmB+mZzChbJULldZ3lslv+91OAKPqcR1wzMeMozQyYJtB/ss
         G+3i1y120plYc3geex7Gs0cPDheHUCt9IaIFhzZgd1ux9Zje4/nRIyfShqaeoPGG00q6
         cWqAC9PhAbV8BXbYKKpVDiOK0DJ9LpiXfRU31UngmdRmn/HgjUHmtK0MHrCSfhqY8tAT
         UG5bqWQt8nJQNVRIuDLxT1RxgYrU7wT3Vz2rI6Mb3ZvFogdKbRsNwW20NbPOibIqLKbM
         U3fOtFZR8alc5DqS/mFsze3QcoRI83g8m6O2uJyqETfaxjxYSxIm6MiwyUOwqNRh1u+z
         wu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199234; x=1793804034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d8xiOKoQDSvdpojkDy4fldRww1u+2VH02DEwdCLpEj8=;
        b=Du0biNPvuY2A2TgwGbf7EqusZMTuPaQtQNGwdhNLvK37uE3J3FFnBrnj+Y36gUHOZ3
         bKVjZId+fGa/s3tWckwRNUyK73lTOqfk9hTWsVIXhPRgxbyu7/voiWPzAEkM/ZIEwXgu
         +BP0WGmA99uP3C9G4HKqQItwZmplooyYKWKP41Ojaa7t1WQTKwQLaPUp71kO1FYjcRby
         IHfiUWYK5FP9uqW/GkXNB3S0IQureNU+uzP/D1EJ//cW1feDVcEDRuvU7AGXzrJhdAK1
         pcGwloGCIoxeYlK68aN4A0kdd2C1RT//SYo1Wu9e6Q2ubRAUx8PEkXg4ggC7oaELmsIf
         D02w==
X-Forwarded-Encrypted: i=1; AKwUvBy9u1ATf6C/DWGPUdGoKPTl5TFEQdUOfGjArX2B5YsRwDi+mTs4licKEHrL4Q7NU0mgg4tXPyESG9fGlxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiyMFtwI4ExcqiyHcLZ+Op0GHVcWXJgnSPn00WuPIf1M68lPho
	C9YjrB0eLiIIOrZUMjygxkkx9Pi4crdkwv6pRYoGsw7eEqgXVBT12qxkCLUY5ZpauQ0c6FQ3P4w
	GxA2dtpdfHCLHvTPBKTaq3yRk5gjM8uCeimxk5qGR42EAs8xnjqkN/7M=
X-Gm-Gg: AYBFou3lEBDhMAsvHHuXCfLEfgRHo4xffId4MeUdQ4gCBVF5KBOc2VYOZzgqLsvI0+H
	Ajq7uukMtka+hZ05xJZWS8/WVJh3JXC4PR2rpAysSLFxJwVwRAIL4NXNqfZ8OvphGqAv8rM8t25
	8Cli3Y3cjgG5tgFw6FZgXGz8SF4J6fO/MIbA/fi/2j5RcaxeqdtPb7KI/WdvIc/OQduqZByoTdp
	3WV5yP55oIxyRXq4hgFn65J63ADw9Rqqm++qZbjo4b5ZD/ZLk3wevISM5w6xrRtEjLZcUGmdTWv
	d2jRjUIFNANGG91+vXv2LiIHkYU3McV9pyfgmuzVHEienFWSWQv/8KuppOm5K+PKZTzF42jqV1i
	MMFmngnA/Cz8NKz6di0Odim5PefDbOSp7nHqmHwEpFnlbMEBhWSGkCZEEPfR7Xdem4Gr7Wr3WXL
	I0Bi1kODWyC1nhXZFT/ZVYVj6fwnWTAzOqGfgJcyUM0RyuytOU+l9g
X-Received: by 2002:a05:6870:812e:b0:49e:4ed0:11d6 with SMTP id
 586e51a60fabf-4a8bb54635dmr1913954fac.37.1793199234106; Wed, 28 Oct 2026
 07:53:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026191618.9430-1-henryzhang62@gmail.com> <20261026191618.9430-3-henryzhang62@gmail.com>
In-Reply-To: <20261026191618.9430-3-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2026 14:53:37 +0000
X-Gm-Features: AclHuK-yXvNbMb1wINM_sef0W5700xQE-XEO0jTPLsBShdsNppw3Y1J1uJ4AXF4
Message-ID: <CAPY8ntCBPwyZkM=F0_0EQOjMRqKO2Do_Cwum24ZGoWEofr7ETw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/vc4: dsi: Rate-limit error interrupt messages
To: Henry Zhang <henryzhang62@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 19:16, Henry Zhang <henryzhang62@gmail.com> wrote:
>
> The error interrupts (contention, sequence and timeout errors) are
> always enabled and each one is logged with drm_err() from the interrupt
> handler. When a peripheral leaves the data lanes in a bad state, the
> same error is raised again as soon as it is acknowledged. On a
> Raspberry Pi 4 a "data lane 0 sequence error" was seen at more than
> 50000 interrupts per second; printing every one of them, mostly to a
> serial console, starved the rest of the system to the point that the
> SD card driver timed out and the board had to be reset.
>
> Use drm_err_ratelimited() so that the errors stay visible without
> taking the system down.
>
> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 5452b727a..face44a23 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1487,8 +1487,8 @@ static void dsi_handle_error(struct vc4_dsi *dsi,
>         if (!(stat & bit))
>                 return;
>
> -       drm_err(dsi->bridge.dev, "DSI%d: %s error\n", dsi->variant->port,
> -               type);
> +       drm_err_ratelimited(dsi->bridge.dev, "DSI%d: %s error\n",
> +                           dsi->variant->port, type);
>         *ret = IRQ_HANDLED;
>  }
>
> --
> 2.47.3
>
