Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16833A6F7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703234; cv=pass; b=VfZwoFCvX/4jz6CbJRNWcxAFs/lP9OzCFaBgUUHDt/RqKpHBYpoFFFgIARP5B2+O7+hkY0zI5nd5t4+/GMFxxgbY/rrk0MxW0q7xzV+XbP2MYVihoLdEEQ9Q+KOEwl7xSgPrwfqARHIZf9FNox8XN2oVBftx8j57LxgFcQS1Pz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703234; c=relaxed/simple;
	bh=8KOKIwaDjvb2cYDxEoE6i5g/eeyXWfmuX1STLiv97yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD9DoRaSMrE7tz7KvEnNPPurpWjTWoVHBYemo68hSXU2bQwC4TFpMQWMbd5Cxjd8EW6P12w1qqNluMVSo/Tc0oymSGdQ5PUIne3wmkxWOCOM1Y8rVs/twU4mYWvFnCLd+7HS9oZmPxv0tMY7PnDUUaheY8DNzwZ2EnY/AQpOLKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=sxXtctnu; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="sxXtctnu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917866225aaso17857316d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791703231; cv=none;
        d=google.com; s=arc-20260327;
        b=aM01BXTszr7iGh6eJCWQgHQRuA7pzUSYl1dV7r888MY/PwYQa4EWsAnVGinCeua4b2
         w08lY2OfZian8zjaUc1X5x41aK2HerJaIz1RGgdVPBgH/vhX8D9LdtsjhFY6ZjMs76mq
         8ANNoQcnrOBNyHl8LyNCbVaLYy5BfPzFq32fxMAfKiKOwyJL3Q+b7s4b98rUMU7UkERQ
         YQ2zJxWhCI/QCtu73Un/epNtf1gO0rwGhe0Dqy9vbpYre08LmgSTaaCBeBqMqN93R7wq
         WfEDvGzDYazs0uND7HcINZAyQ1Fh/yKHpsRQL+13bxAlpff5g2KcIF2tjm/fQvqb3PWR
         e7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8KOKIwaDjvb2cYDxEoE6i5g/eeyXWfmuX1STLiv97yY=;
        fh=CWTy1FPAmQvv7k9Zhsc94I7r2irvVgm0oa/SVNaHUkU=;
        b=ggQ90W/ImmOwVYpWh2jqksJWKI7f3ObDuk8A+r0J/6M9FJrtvvnW3Y0aIgkFv/Y4GT
         KXuTc8Jsa143EjL8YuVtKibI6kRBplIwaNVbT7fceAj8+64uKJrJydW8xi6RkdEUd5ot
         NkQi7UvVzPcc7CV6Gc6NuWabFIMkancvRdtTC2c9x6ddTMITiJUesdxvWVAh+2pKE2vY
         zSZJQ/+UoHQK9Rqo9pqHOy3ovXgL7Z+yE3rHqCFbE1o08jivvuKzmWkIWivsYHiMdsgo
         LsQUg3HGsuhPuV6wq53r8d2ac6B09a/QpmM5EWWBj/M/nEULf9wlMHKO5DU15hiVe2Om
         SyhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791703231; x=1792308031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8KOKIwaDjvb2cYDxEoE6i5g/eeyXWfmuX1STLiv97yY=;
        b=sxXtctnuF0KW8c9lkta/dvV10ZVXoLbzP5Y/uMAEDtmPPnRg1iAI8FeSxXxhKVHQRd
         ZJ9eoCL6ExkZ1I5eI8dS/8f0+LtMq/uujSs8zJrifl6bNdFd/HmvLIMKSZr+6YoVPveu
         pTfJSh80QCwM15GtuaxHMB94w9cKJ+f5Ab4HLP1vgLGmsnOJXDnLA9QGt2zGE9eU4IeO
         w9h6jAd14i9v9p14Ii/LMlJFnGbbR2tVArHhHhiE8crLN6aknmFmVlSLdLWVT9b9z6uo
         BI5YzDpHqRwqzg4prsMGgzKmOhmIVNTYbth4whp+EgvFZsryWxkSJFcopn9hWTB7IlrK
         nnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703231; x=1792308031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KOKIwaDjvb2cYDxEoE6i5g/eeyXWfmuX1STLiv97yY=;
        b=JSfwX9qvwKJMKFi9LOrEP8WDI452NsbDRSDENmn9DOK+OtfunbYa6fL+4s+KaHRTDM
         ZtP06F0Eu8p6vcjloVRdK5BoLAqZy4Xu7Er2rwfYW80Eyl5tO0ilFbIxSd06ZOJS+rnt
         8xkIn9OeJmB1ckiO8yfNCirDSu5xFv29VKCbVkyWOIIkDkpb20TYcHy4RErgEWExPrdF
         I5l4zXoW1ajqB+Uvyts4oAKcVJGj65LQAWOBmBXpGhbjqjKIgJ5KwkBsxKKdcrM7k9ND
         PhszqOOGZO2jo6njDDsomx26jY0wmhkQpvJi5RSexO88Nt6Bf9hHtDCC0xAyE8D7Pnph
         oeHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPYtOenYxm3daPPgYAqAu6iDQz5w14DndrKFLxUCucOW2rqZ86C3nfihqfnI9i0mDaU8vvtelbfKDHMHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxIxkSIxJE6M/SwpD8+4UJmo377Q0MhMFDEcIxBC0AR8tQ7rLY
	4jHshKiilQaU2sORn9viIYZBJsiMqxRh9QXF8cZIv0wLm5lq9EbMsnU4RCE3vzjpfgfnllihzEO
	040lseGYLrha/ezdWkg0UHEXYC90SA+Sm4HqQZ4AJT2wbXTK6LaLdYrfn
X-Gm-Gg: AYBFou2/sJmlxxgTraV7ae6I9ipj+ZoKxZnb/RiZiA+T4nDdXzCI9muB08fFxDqZxNZ
	2CpThSiQfjM9tELeVsTQSkj/Bxsx6Ns8/VIiVFNahjK0DIXT5v4FtxnWbBnxERgvzDfo0OTlpaG
	aTR8N/qrZ7tdmbtlpi1B3HiYorHE+Mj0bbk/jJoBi9txRcv0+tMACIPYajcG348HLnlmt5cvZG0
	gcEXKwhcfuwnwB7G6iL6VzdlGvvpmY2R5DrG+f4rwIjfqifWoUl0d7VYBLMVwDrfX6flqnHYwoZ
	XWkd70V0pMNmt7C+cRH2fRhOvcGFCW3jV95Zi+AXRDtrZU+5ZEAyO1Y=
X-Received: by 2002:a05:6214:3209:b0:917:9ec0:f0fb with SMTP id
 6a1803df08f44-91b5e019a01mr109533446d6.24.1791703231532; Sun, 11 Oct 2026
 00:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com> <20261009143506.2507607-6-jjc@jclark.com>
 <3b1a2994-5251-4800-8c61-b63d7a435b21@broadcom.com> <60accbd89cfaf0d4be1da5ec2fafd975@tipi-net.de>
In-Reply-To: <60accbd89cfaf0d4be1da5ec2fafd975@tipi-net.de>
From: James Clark <jjc@jclark.com>
Date: Sun, 11 Oct 2026 14:20:20 +0700
X-Gm-Features: AclHuK9Ocwt7HcU-vYQEwbBPDKcgav2cMdh95NRnUvL2pDHuZe7MJXWz9dxj8UI
Message-ID: <CANz3_EYfcBopo=HgRioXkhoT6P+4WWpfFT7UeWkXd5eM_RNpSA@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] net: mdio: bcm-unimac: implement timestamped
 MDIO writes
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Doug Berger <opendmb@gmail.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 10:18=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de> =
wrote:
> I dug a bit deeper on a CM4: AFAIU the MDC runs off the GISB clock,
> which the firmware sets to 200 MHz (CPRMAN 0x1d8, PLLD_PER 750 MHz /
> 3.75). Bumping that divider to 4.0 at runtime moves the MDIO busy time
> by exactly the same ratio, so that's the one. The 250 MHz you have in
> mind is genet250 / genet125, the RGMII side, a different generator.
>
> So instead of a fixed clock or a compatible match this could just be
> BCM2711_CLOCK_GISB in clk-bcm2835 (critical, firmware owns it) and
> clocks =3D <&clocks BCM2711_CLOCK_GISB> on the mdio node. I can send that
> if it helps.

Thank you very much for looking into this. I think this would solve
the problem from my end.

Let me just confirm how I would need to adapt my patch with that fix:
in the pdata branch of the probe, I would call devm_clk_get_optional
to find the clock on the mdio node, falling back to pdata->clk. I
would still add the chip-specific compatible string because the number
of MDC periods has only been measured on that specific hardware.

James
