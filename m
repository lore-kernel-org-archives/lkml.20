Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DE360EE5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796753; cv=pass; b=hBCluV0xR3oM5xo3Q7uO4mOirDBVTp6uBJ+ZT5KOphMRnTQvpZNfAKdpZptiqVevdcXeJ1NKiICcpDF9uyUzqK2sXeAqEZakL0Jj1mOT3wGfYgBuT8G1RbSxOfnUCDpxYMalewT+S9Xdn+ecsSzp/z18kNjKqgnXMV5mojU/XVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796753; c=relaxed/simple;
	bh=BzLE8AuiJudHf0vx2hSK9ysChmOCt+AKiZt7J9X7MUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkYfAiHX4kG33H8ndlGt69P5P05/pWavMyy3muRjOTmZxhYLyj4qsCtiSLcEvUEiDh4bjKFrT8vcin97KD+tFWVRiCTsIw+62oScSSUxExrycwEn2hez/g7DbwWVp+Zb5hPW24Z4VFhaMZh3utO8ijJj6IKpspsDz/KbhVF0LFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJhOJStg; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJhOJStg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso258684666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796750; cv=none;
        d=google.com; s=arc-20260327;
        b=BsgGLbRHTxviONBHKRWUaJlDYQrlcVfo36tFXvr2Bb/RQkM4DSg2x68YYrOkBH/FR8
         U7k5CAWl443G+9god46ld9UHUDx7BEeuwZ5MAEE69yT7lrsWuSHGTjDo41gzDagi9c5t
         E5EIvsP9/Rqvdjo6nZVVWQmy353X2bx8hJlRy63dYhDs1xPZV93bVqmSpwUvx3f6HIxE
         JMDFfD/wX+WSklYhE75AQD0+0wlvPMySVtB3SOwU7pvMcrMNS57alvC6N0zTFaEzCDXu
         PqV9/6zp3/jU0s0pJdTAWOjyVfTZD9neTF7pGEpTMeKX/vp5gqS0bXQ4ZP76C/8LuNLv
         XKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        fh=aiH/9NvAxXNn075ewQ7dt8eKjgk53EQJA7x6+npRdL4=;
        b=de301INolJLcTejhxisPlpMqHD/ULAlR/SCDXEe6TD8kFZBEM9IIWbeZTNOm0dVqwY
         ziqdzPdxh4fnIFPksqO5o0t9GzzCz9qobot6/FcekoaH44rY6TFVr+SnXvZT6Jdgplnt
         EuprmtDbMnxV2E0jmopZzs6bGkRgqW8Z8CMi8dvExXDTFPHICnzvj1sugEao5hlYpBTl
         z5Lqpsp7Qpcfv4eTThpsh/pDt2oji8fBlv7rvD9r2EZra8e6ZFMspLdj5fYfv/tIgWj0
         wCkwXWSu2hcq7A8ZaFlHzzrCN4+Up4aSwKGuE+2Gc9Xv7KKVvj7RiEZB8iCbNGzzewuW
         fnpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796750; x=1792401550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=oJhOJStggfP9Gw/3A99Lf1yTvpnnV1tgozXytWeLe2qcUSAXFXSztylvTk2p9K9Qye
         7WBcys6nx2tmI90BnfMH+IbYy6v+LTFGvrytO0bkWyvEYZYQQINlPInEoUlMZuxBlQzi
         MaGdIcp643o98/KGgNyAUeUojhJndfbQF8WZuIl5/AYX7H5veEAneCWdw0afumKnACkv
         3Eli2pixmBUiT2q82b/l6MK8pk3B2yObdrlvylSs6aDjyGB/B/kNpUAYlwk6JsGvAI1W
         TfLmsKwCUppgStBjBPrFJ7hBe6E+Zy9Lg5+prYkrC2Tm+pHQxmRNd35MBMGzWMZ/oOf5
         zzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796750; x=1792401550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=tMH47+ltQ3MG2B6AWEkuJrfb+ng1Ck0VOaalDyuoqBw9rNt5+2rNcAYDkLY+K4a1As
         iD/8ymWX4fH4a0l8lCY+eppbfMepqLkw3FWEh1QVpMRi1GWk+ww1MmNJmOvdXnChgxWL
         yaAAqki1AAEiXOR3daJ/3keAnZHOWyyuTAEvDYy4FwHtMzXXSNrt1/tiobCvx4OwLTQz
         Hg5XP4FqJUH/fZIHHqzmvlC3HdpCVTBgV9OcVOdthuOAAX7v7KLOHKd66oOfnwCrSFBZ
         XpEcxDDqTAmKBYVIghBgUBHSRgxW/Jr57lHxQg11yxSgBHzfHAISy+4ZqQ1kddMmM8Sj
         Pbzg==
X-Forwarded-Encrypted: i=1; AKwUvBxh+eJmt8sC3x7LlH0rV9A7P9RiCeL//1b55zrWUNAj2U/T8MQlMaFaLtU4igDEWGYRfQF/SvrA16iYQTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlq/lL/+oOTMhPVeOB3YO9ktpIjyhD9p5pVlr+/UY+IxOoQkdh
	9AYYzka4/BzL3m+VDOWUGdvDe3YJ/Bu8ULqNizBgqEQP/OlKIYALCTffOVQCHioNvCJRH3R/YYG
	SURbBj9FdaE3g9/8xwzwF31Z1QD8ztSM=
X-Gm-Gg: AYBFou2SGlZXXIenZ0FpZOyVFOFWV2aJg6BnqRt2FjTI/ErjF4RxtUX7b2xfNxe7FP5
	XvlfqO190nBK2Z/RLRN8elIYP+tUyZkprXb+hZFOtyJfzlpQUgmdJtVL7XyxRY6zCM+oHeQMXvi
	durE05tAs70qIk4IoASOglx7WX0xdyrff2JI9Kh8lbPc4R1rzf47eJ8M4GtRsImc79QHtWJbYh7
	babPuUFwZNrUpaXyxSp9bZEMn6p+w7K3+qCTNb4vU8YBvs5Z+xiJTZPuj5FBqAZgSwLZQYinUef
	kLxAbS0+uUolhNdKlJuDz8KwM3u/B06zbSGF4z+sx0U+rZ3AXzDMJjxqJE5OvmQQPZ7N+EyRt0A
	A7uEqaicgVHIYKbcoIDI0IMvrh43ZPHy1ggLKXUInR8rHyYAR2wQX6afwX03dtgtPTkx9XyDgEM
	ylSPNktszozLG6F2dDXbtA609AkS3SKR4mHib2sHSs
X-Received: by 2002:a17:907:e109:b0:c31:e19c:fc4f with SMTP id
 a640c23a62f3a-c31e19cfeb2mr562736966b.14.1791796749871; Mon, 12 Oct 2026
 02:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:18:33 +0300
X-Gm-Features: AclHuK_t7SCC_fNqTJ9e7JfRmqFuaCbc-sDfdo-4CcqOLhnBhkL21_Jo8x7VqS0
Message-ID: <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.

Is bitops.h already included?

--=20
With Best Regards,
Andy Shevchenko
