Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038418;
	b=uUjwuX1iWbKCgEccn58/Sc3AgoXRpfJbTxiSBuHqiz0ms0r1V/QiET1QUfAlkCQhJyW7
	 ntSYh7W1snY50arY1JOdmcmPT0DcT4L4FiRdbxn5jLEeQ9tekUY1bvfQHCBdIiKgRoy82
	 DENkadfvepN2BnHyCl7ootdcrxRCriRbXki4etlMCZnzPs0xVQY2tjwOJNosZIon4JRdF
	 cOVuMcdwY08AcG6t91vx7Sy0bsR5Ysr65hyhwP7r50EygSyDSlZSN8TLSPGctqYQv/si6
	 MR8xk5FatMil7UnzC+z5jQ5SgZAwbjufMP4zYEptXvG4/NGNBBhGjyZVH0Po2kMa7NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9AjMwR7Z8B2oTWOzAAhJ00jw1hl54hnoREOaiO4tzI0=;
	b=E0gExgZcQnGsOTxUAc6+SHUn6JqyJFsrU6l4Mug/hdaouvnl1/9Jpa+2QEpXmHo61uJN
	 PKZPTFoaJzQCVI6CC33TQRv1vZFmISaA4zrUisARWOmejokwU/qdg/IVE5CF+U63NzPMD
	 DyfuVU5q2ipLNzBYTNz/pvVxdc5vPlW4GULoyWGYv06DYQOlB7zrTEsduWeQiLrC8arRF
	 5b5Vx31Kr6ZAkhr16gMyIM86kbFEvqo20osf8weUdYFiO1oCACKoP9+19IGPbrkpONWr6
	 AAhCD3sNDig+7DywT1/Odvy8OPHRRXlfoKl4tWvm9HGTDDWjgao9dUzcAnvNkGUwIfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=EC1Nb7oC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C40606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=EC1Nb7oC
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df5e315bd1so2309460eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038416; cv=none;
        d=google.com; s=arc-20260327;
        b=PgdBFduLyHfxwOVhnGrAzUCVZcXhCpChehhyqBRDB+iRWLC4YlNUUz3QYoaxgma6CW
         KEwb6Gmb7xx8P3SA10AbEQlUAyG+Y4ba2HCAgXuOVfw9hFzj4TaI3lfewkNVC1zcvWkm
         C3BlHH+yB2B+W3O0YgZi2C9U0lM2oMtWWyehEDDRf62cRLSrPNtZHE8Kg7KUvSRCOyXh
         RQ2bJsQ/2MAuLkeaM++hwUI+sUQ6XQ37ORM9SK8h5vSNCiiLie0XzZb7wj8yQtxOdLUo
         RxXBpF/TjusOCrdR73Dswv4nCKgDtU8n1h0IfxwLKwkXrjZh/s5moTrIQXOC6jg4A5gN
         yDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9AjMwR7Z8B2oTWOzAAhJ00jw1hl54hnoREOaiO4tzI0=;
        fh=9uBISsu+nP99Nnfg5bfn2HrrSgF3DrlpHm1ymDhmaRw=;
        b=Eud9uNFaubZz+TzvIDHfBasqiSaQTfskMxgaaa/4wZYCFkb4FPLWb3SF02Y6hgwXv9
         rHeisKVz0SkevcZ/Rvc20ONtHfn8sE+/e8V28iVjrCoFS9JpiIqX8w1OIwFNJmoFJYj1
         VHfs4Kqi+zacoA5HcQoWLdwo8/kvAcIklI1J7Hb1bFrv3rLM8oJ8FaggK0iDeFIqze/n
         8XMMreyktUJ6hMorR8YOGEUOZXMHPyWyZRuHR7U/j44pQ0e3/g/9Cn42NXdK3rOZuVmD
         cmUzmvq48mK1UNc+qme6CgNXBDPKn2M6096tSeYpSAjU7ppWqelKge8J1ZAqrzX7glYY
         T1Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793038416; x=1793643216; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AjMwR7Z8B2oTWOzAAhJ00jw1hl54hnoREOaiO4tzI0=;
        b=EC1Nb7oCNe7kzmpPJ1zR5a/UVo+lb6hzi+ulbb0uVa0KI4tRtwFFEzkt/pLq+/vyS3
         UhCrBK/3o7RfSDPVgAjWuBr8v3oy7Bxsij8gqdFh//s1XnC/SfcaamBsGZitpAteiYda
         hi/X+CNRSvBoduofiaINF8rg/LwFZStp9v7YK82e9FPUcB5n/R1ew8mWc/Qo7nWZ9Lbd
         +/keNNBK8v6hVxqm7FQmSQJHo1pUSHv4XiF+7BXKXegCkaCy+KVl/Oly25titq9wnVZp
         EkAnQwzIWDKMHKBJtIMFKxPS1NFlaXTs4VFvF3RLiBsHuYE2VojNi7A10bnGptNLoAVO
         7NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038416; x=1793643216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9AjMwR7Z8B2oTWOzAAhJ00jw1hl54hnoREOaiO4tzI0=;
        b=qPPKMpZoZWrnElUCMneIu5QfPGwmPiDPJihyF4S8/qhCybY8drqGDxgfLMkumWd0Bt
         b4SU/pU6oIToXTqWZQ7JdL4qu7StnY+pHksFV52Ys8ir3KRyJ9Bq2wBvE0atnmYDR5TL
         oml5vdJb+t5HrtKo1RgocqLgP8KsLgGkuFtTzEF+4j5fgIgfOl+Phw7yxZIDOIbvmcn+
         ZUCzXmoKdd5NwBxA0oFKeMp3uSMak0KwQqWlV42A2ARY3idWi/gu9NC+M9cwQYE+2Oad
         K/aaWzDbeesT4otiS2bj1FbuJLFNa3OgOi6b+t3J+1+RLIV6WzYNV8MGqpGoSJivn6U2
         1vZg==
X-Forwarded-Encrypted: i=1; AKwUvBwWtqt73qCYkkUl1/SyOM+uP8wrfDqk+anbH0RR6Es+FmZs3ba2Z6GJs6V5Zk4p6L9++zEsFTSZBj0jgzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsizi5DatOg43V3EFtsGunvAF2xXEU8M4FDofIid7dCgCk7Gu0
	k0uV5G8vjbRpine7baCm2S8Xsf4p582ISts7z9htsyr303qzMBf2KFkKSVxJwi364dw78UhlD5D
	os3aTuofMRdtDMWdKd2K8BMD0qZlbXiBk//dj6BfLBA==
X-Gm-Gg: AYBFou2apFoKQc6vcy6FpjkWhjEe/baJfsB6jDJCRY9JJZ196BLbHVQoz42BYj7nW6A
	7oUQVEtweU7JOjuRtZ0pix4HIbHIr1KDkRnxKC2oDLBllwqmHaMZ7xhzrrqyfEy7mtvB5AGmBWg
	D4xZ1eawYNus27uA3Ao71xErRhfiYC0CP/pKP8O2sF+lVAsDPy40d8o5S1LAc+aY+6tDqFZez8W
	sTJ/7dBKX0pdYverPKxV+6BlEFj2cYKjizy4PI1mwe84a9OybbQ7dG2k0mUq4osPS0lqrw/Q+oY
	VcGvKBMYJS4VKqxeP+SKqO029/jIbTDjYWaBf/W9+RFrEFqdp0NliaklF2AZU79q1C2uyFz+Mu4
	3xpmE1BeDAuBLARPI4CPfFEf2gqqjKe1Q+GtHKgjlFv6lMDyPEVRobLDaTokqHV6dhWKJtf4j2Y
	V2yk4p01UNHhwSkpbPrSfEiGSmmqrmbHSLQzS1+AU/sw8J7aDhRlezyg==
X-Received: by 2002:a05:6820:80f:b0:70d:1692:14fa with SMTP id
 006d021491bc7-70d169217b8mr2519101eaf.13.1793038416125; Mon, 26 Oct 2026
 11:13:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174930.7237-1-henryzhang62@gmail.com> <20261019174930.7237-2-henryzhang62@gmail.com>
In-Reply-To: <20261019174930.7237-2-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 26 Oct 2026 18:13:19 +0000
X-Gm-Features: AclHuK_KlFEnUlqXLwNDSuqARQFNNPqFsCBg53fZhcmuBv7einI3hP8qmGSxzCM
Message-ID: <CAPY8ntAhuJ2cvoTjDoZoMe9c+43sD4muATtRSq-cFnQRk14-=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/vc4: dsi: Don't return error reports as read data
To: Henry Zhang <henryzhang62@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

On Mon, 19 Oct 2026 at 18:54, Henry Zhang <henryzhang62@gmail.com> wrote:
>
> When a DSI peripheral detects an error, for example contention during
> the bus turnaround, it may answer a read request with an Acknowledge
> and Error Report short packet instead of the read response.
>
> vc4_dsi_host_transfer() does not check the type of the received packet
> (there is a FINISHME for it). It copies the two bytes of the error
> report into the caller's buffer and returns success, so the caller
> gets the error bits as if they were register contents. Packets
> received with a checksum error, an uncorrectable ECC error or
> incomplete are passed on the same way.
>
> Return -EIO in these cases so that callers can tell a failed read from
> data, and retry if they want to.
>
> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>

Thanks for the patch.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Notes:
>     v2: no changes.
>
>  drivers/gpu/drm/vc4/vc4_dsi.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 5ed3c35..5452b72 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -39,6 +39,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>
> +#include <video/mipi_display.h>
> +
>  #include "vc4_drv.h"
>  #include "vc4_regs.h"
>
> @@ -1299,6 +1301,24 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>                 u32 rxpkt1h = DSI_PORT_READ(RXPKT1H);
>                 u8 *msg_rx = msg->rx_buf;
>
> +               /*
> +                * A peripheral that detected an error, e.g. contention during
> +                * the bus turnaround, may answer with an Acknowledge and Error
> +                * Report instead of the read response. Don't hand that, or a
> +                * packet received with errors, to the caller as read data.
> +                * Bits 7:6 of the Data ID are the virtual channel.
> +                */
> +               if ((rxpkt1h & (DSI_RXPKT1H_CRC_ERR | DSI_RXPKT1H_DET_ERR |
> +                               DSI_RXPKT1H_INCOMP_PKT)) ||
> +                   (!(rxpkt1h & DSI_RXPKT1H_PKT_TYPE_LONG) &&
> +                    (VC4_GET_FIELD(rxpkt1h, DSI_RXPKT1H_DT_LP_CMD) & 0x3f) ==
> +                    MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT)) {
> +                       drm_dbg_driver(drm, "DSI read rejected, RXPKT1H 0x%08x\n",
> +                                      rxpkt1h);
> +                       ret = -EIO;
> +                       goto reset_fifo_and_return;
> +               }
> +
>                 if (rxpkt1h & DSI_RXPKT1H_PKT_TYPE_LONG) {
>                         u32 rxlen = VC4_GET_FIELD(rxpkt1h,
>                                                   DSI_RXPKT1H_BC_PARAM);
> @@ -1313,8 +1333,6 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>                         for (i = 0; i < msg->rx_len; i++)
>                                 msg_rx[i] = DSI_READ(DSI1_RXPKT_FIFO);
>                 } else {
> -                       /* FINISHME: Handle AWER */
> -
>                         msg_rx[0] = VC4_GET_FIELD(rxpkt1h,
>                                                   DSI_RXPKT1H_SHORT_0);
>                         if (msg->rx_len > 1) {
> --
> 2.47.3
>
