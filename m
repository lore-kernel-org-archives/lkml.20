Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565542;
	b=oGRdwaXZxHpIynzk0ykfKn0qmrE4jZLXVMiMNQYzuesAAEMgLbpC6BwVLzfdpcuAVUC1
	 s2QtuLGFyRuvPA3uXvq0nfGXI+nVuuI3McqBU2dKDAAJU8TNiGxO1odTc78ofXv0rNyS7
	 uuYGhGroejE+rsuPL9QwATuxACEzenZujyMS+lMSsyjsim9eSfELHKxOYVUEDge4aJIU9
	 KtBDcPIm1Dqg1J43WulzyLodK3ieZw7Fh5kvAECY1WsDBZ+FSXmUkZfGqLKl5w26RTSi+
	 VKLirL/Uk1eIe4l9MIw+jfYoPpWI+del/O1gsxohLBNtq/GEwWtdoydNKmR3OuQKB9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=r+1EHrHey7KgwCjJ4ikVuO1bQtlIeud0R17XoxzSHM4=;
	b=orJwQ0uabrsVU9UWzhTt+kkunDLdkE/BxGuVKMj6evQU5wrq5YNm9hOxP3gV/cLOC9RK
	 YMYQgP2brMOU34sG1e9uJrskqQF401hx8wgqFes3dNyfPEptjGPIuUJerWQEBh4QTgikQ
	 RAodenIrC0pPI+m5hEeSzJpTtrjIVhkvAmu640lP+GeRnedIvk1SXylNI9QssgvrhPtX6
	 vL1fzowUWZ8d8ObMF5tBBrCC+wL1u2yFitPUCzbu0/JEuSzZG2LqvMt4QhOOVFbkGgDFg
	 /VpisV/aUwAEeLJbshqiKxsXjvGUhI4GTMpTTZBijsCLjr5DdmqzdaM6g1lQsfcEjow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MeTHdbXU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA10D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MeTHdbXU
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f36c18b75so27933985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565541; cv=none;
        d=google.com; s=arc-20260327;
        b=MA92BpC7fdE0B5cRdLAOZ5NKBTm85QHez6x2+J0g4goswM1YVyBqv6CYFMjD5A9SKA
         FIKUdBfujvxLlmd4AAMm7wwAJuDmrrZrETOQM70Ust9oOvUX9CC1cU15z+YHRI7mW23/
         CPyqf12vQEhJbKbDiMDCRx2LaassCi20gytUIh7DW6sr7r/ZpTJ4mCwig8827qm+IVKe
         vVbzNiKDsbLxNuGrYQCMCb6GupiSvuF7xuHkhBWaChcE70DG5ZMFIB5BpgFd5RCaA1kF
         yapxMpT1VXKyJ/ERji2El3OVTJeO5jYtLiGp/gt5rwVZ8zTY+lM7B4HP95An+yHBo/IF
         W6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r+1EHrHey7KgwCjJ4ikVuO1bQtlIeud0R17XoxzSHM4=;
        fh=CTaLi84bbCCu0dZoVMq01fQdbp3evX0ZeU7C6O+IR0g=;
        b=LS4ogh0RvRrDwl2vXIrUhQc4M3cY1hhQH6UvwJJWoyiBeJPb+HBNZ6YH+1wQkz9+bv
         NEbwzEgoLVMR3lIHrVrK8AfeBJ45tt67WvrIVOfaYeJ9rKdc5xIYFDOfXlQY3tU+oh74
         lypyacxcTDUIY+ZYZqKplHwFGGno5C17kRDX0UcP4YSh3f1H2/8vjP2eIOtiqr3Jvbnw
         yCHiX7ZrS/PZSTziwC72n4YMlb9ZVODetXGToDt+lz5aSzty3tg6fTB/YkSHDa0tyqNy
         xKGSrsDUqLX2jCWEe+58WBy0X568eszzfiZSJqdCXkhwpfTqyxXJa5fiUiADC+4Soqin
         vp4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565541; x=1793170341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+1EHrHey7KgwCjJ4ikVuO1bQtlIeud0R17XoxzSHM4=;
        b=MeTHdbXUiRxkU0i6StyKryoe3De7rJqzBb84A9XhdiJDxJHO2BMzEapN75uvooHxkH
         FGAUb9LtJLliGsXulaHHaQ65G0FTYUzjr4XO+PAw8pRhIsxHTbwi7433IFxQ7Z9WxwtT
         0gOFbIkG8OwWsAuIzX5H390hEEEIZeTC65dUWiYviAEs6Fng2+hte+f6bAuqYM/Xf38x
         tGk3PJY3Vla4Vz0boeapaBoeQeRVm9EI+uceKixzkmdBDvwtuCeDTSFFZKrPwnGsfEFM
         ePIe513i6svUJ9Ca564TJm7Dvykhu72yp7E1UcsxwwMhhrfeVAKMZYzKE2y+0Cx/wB7B
         6Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565541; x=1793170341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+1EHrHey7KgwCjJ4ikVuO1bQtlIeud0R17XoxzSHM4=;
        b=cktApcszZt7uVlgCFJ54Bzszyb9FDm77EQcdKNtOOkSD0dCf3uUE6s40MI+9mz2QuT
         3AwB/sA3bzmbAmDF9p7iN7APoOgonYRkmogeif0TuQnNBIVvdHQvyea389G1pMTXFF2q
         B29R2NjruxaZdqCly79fEX0ahdlP+9nU3E70BabdTsasXLygMbRaxUwlHWFJjH2lUTMy
         LTQT+oBK3becy9Od0yG9f9u972c3Pu/1M5MqfJIJMtPv+HBh5oFAPbHQ2nsj+FOozmf5
         dbdcgwQoYDZADLU01ctEDg2BaN/eP9rm1K7ad0uIoczJoq/yDAqMkwYPcZK6HoTwPYmG
         tzvw==
X-Gm-Message-State: AFq9FYKsW2wuEASRzLefXQ7VL95VWRmMCXpqlE5FiFuxSpwfQWnwmpF1
	uY17/T2NuJQLikqOhi1y6jf7o6lvp24UEhd/riCJSei34430QnmwxRd44LyXhB4xJ7lr6QnNIFD
	Cpot84F1kogw6KpZ6zOlMuy1vyF4LdnxB1E0h
X-Gm-Gg: AYBFou1YJMq/xOPudUx2rWwZosNhW9OGMjJihFY9zO9F5sRm/lhQ9k4YSMuXg60lvTm
	eQwua72dYvxpezG+FXU2x1ZW/ZewAnTT9C4DqPChgsYWT7YMiKq6+kxFS73+4YG7bhZqWaBwrTs
	pXfWFvfGeo1qtmJs3mv5TGhxWb7XvusPQXD/cAZqbPO6bGqfGwhAaPQsNHtegRDkLrj/0yiKAyl
	aabzI1t6LdT7r/3OrKh5dbyFMVL194X7KUCOSKbh8WhAZHVZWM7Jbab7J/d5vyZim9hpHVZxyqt
	uMal4Qd8REpnv5fApLjxN0iFBJM4RPUV+/EZVvg4eI+vfZJSAduHk6qs5WPz9SnftmCyxQ7xHB6
	FB9bxqXAw6MPlZk8z1lAiwOu4VPXtmr2drdrGUQ==
X-Received: by 2002:a05:620a:470a:b0:93c:c162:1260 with SMTP id
 af79cd13be357-93f57f7a4femr232411385a.38.1792565540710; Tue, 20 Oct 2026
 23:52:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com> <20261020102709.GG1206986@google.com>
In-Reply-To: <20261020102709.GG1206986@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:52:10 +0800
X-Gm-Features: AclHuK8Vezogb57Su1aa0ILIvdzRhoJA21RXoz7Ke3iedkV9xt96dhD3ThIg1PU
Message-ID: <CAOoeyxV+okH_4x+6w=esBv7bsiyWudnv7Yc9Usqr1FWmv3RsBw@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] mfd: nct6694: Refactor transport layer and add
 HIF (eSPI) support
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thanks for the review. I have replied to each report in its thread. In shor=
t:

 - 6/12 and 9/12: The report is valid, but the issue predates this
   series. v10 will add a separate fix with a Fixes tag, and the two
   patches will be rebased on top of it.

 - 12/12: This is the intended behaviour, so no change is planned.

The planned fix for 6/12 and 9/12 is:

  mfd: nct6694: Drop the unused IRQ enable mask

  The .irq_enable and .irq_disable callbacks only update the
  irq_enable bitmask under irq_lock, which is a spinlock_t. Nothing
  ever reads that bitmask, so the callbacks do not mask anything. They
  also take irq_lock while the IRQ core holds desc->lock, a raw
  spinlock. On PREEMPT_RT this is an invalid wait context.

  The fix removes both callbacks, along with irq_enable and irq_lock,
  and keeps IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core
  falls back to lazy disable, and handle_simple_irq() keeps a disabled
  interrupt pending instead of calling its handler. The behaviour is
  therefore unchanged.

  Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")

I went with removing the callbacks rather than converting irq_lock to
a raw_spinlock_t, because the bitmask it protects is never used.
Please let me know if you would prefer the conversion instead.

Best regards,
Ming

Lee Jones <lee@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8820=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 13 Oct 2026, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
> > CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
> > driver only supports USB as the host transport interface.
> >
> > This series refactors the NCT6694 MFD driver to support multiple
> > transport backends and adds a Host Interface (HIF) transport driver
> > that communicates over eSPI using Super-I/O shared memory.
> >
> > Patches 1-4 fix pre-existing bugs in the current driver. They carry a
> > Fixes tag and can be picked up independently of the rest of the series.
> >
> > Patches 5-11 isolate the USB transport, extract the transport-agnostic
> > core into nct6694-core.c and wrap the firmware command interface behind
> > regmap, so that the sub-device drivers no longer depend on the
> > transport. Patch 12 adds the HIF transport on top.
>
> Please fix or respond to the Sashkio reviews on patches 6, 9 and 12.
>
> --
> Lee Jones
