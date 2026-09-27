Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21F3C0A08
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542244; cv=none; b=D8oI408jhU9+DuBrxJsy7J8x7ds3Kmthj6bR6qphPkwg7uCfFl5Wjk4dV4/+kVC9hcno+SFcx1PE+OzDJjmJOj2JGn5KS2+St7yckstBGkaLcNqy9HtbPLcT/taNgJv+QxMMz1+mC6Sv92ZbTC3SYPRb1e8OQ4McxdQj7j0gDhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542244; c=relaxed/simple;
	bh=Tays7rhJ6pXGicBlxX/kVxzrffmdML4KH98t29Qh/9A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pCMbonYXM6zaO/JvznDj2AmtRUbKj7K6PO+SC+cw3Wz4L4kfO6YXtZDq9usim4IUiDhQ4c/KOxh1jVrUlZIxiPO2eF0/NlS2C+kYKrLKymY0uDpnR706ggL4TWxbXENPY95OQwIuNySxD0YWdJgCGN3ip3TnYP6yNLCua/RPLVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=qXXYO4EC; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="qXXYO4EC"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D13ACD0954;
	Sun, 27 Sep 2026 23:50:37 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D13ACD0954
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1790542239;
	bh=+rmtSBQ8iEU/mOIOP0F7DWxl8lfXJ0xJmKbLo/9cuX0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qXXYO4ECyKgsBW2su65wMyseJRxSfeRrLB7zttnakUSx1jMb8mO1xWATI/R+0+/42
	 QU3gb0Ey5OSM9rgHPZ/acfoPHxsVvWYATcbJyUBC7pfx05IyzlMuxJ4uyBeu+DVQoE
	 KL33BNaRil5AW5HmJax/VYdO5Y9B+BhDhXVAU3MZtuAFe68VUNfJM1EbIYs+nAr5Rn
	 Sy1i+rzR51igzyRa5Sa09tbEdxoNcpIpfJI6CvvxeXXkMZ0fKjG1KvqEAsTS5maKdV
	 QJsQccQ93mevmYRHl9UKkyI3y3dWAzh5stdyLqbTlKTekxPBZGxhGHK0oN6YTN/hvh
	 ERdw1/BUL++9g==
Message-ID: <490d315dc08b25691fce7d0eb440224976e5e953.camel@rendec.net>
Subject: Re: [PATCH] irqchip/atmel-aic[5]: Disable interrupts in the
 irq_pm_shutdown() callbacks
From: Radu Rendec <radu@rendec.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Boris Brezillon <bbrezillon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 27 Sep 2026 16:50:36 -0400
In-Reply-To: <20260926004124.88221-1-kmehltretter@gmail.com>
References: <20260926004124.88221-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-26 at 02:41 +0200, Karl Mehltretter wrote:
> irq_gc_shutdown() calls the irq_pm_shutdown() callbacks from
> syscore_shutdown() with interrupts enabled. aic_pm_shutdown() and
> aic5_pm_shutdown() take the generic chip lock with raw_spin_lock(), and
> irq_gc_eoi() takes the same lock from the interrupt handler. An
> interrupt from the chip while the lock is held spins in irq_gc_eoi()
> and hangs the reboot.
>=20
> Lockdep reports this on every reboot of a SAM9X75 Curiosity board:
>=20
> =C2=A0 WARNING: inconsistent lock state
> =C2=A0 inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> =C2=A0 busybox/101 [HC0[0]:SC0[0]:HE1:SE1] takes:
> =C2=A0 c1c2b434 (&gc->lock){?.-.}-{2:2}, at: aic5_pm_shutdown+0x34/0xd8
> =C2=A0 {IN-HARDIRQ-W} state was registered at:
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 irq_gc_eoi+0x28/0x60
> =C2=A0=C2=A0=C2=A0 handle_fasteoi_irq+0x120/0x214
> =C2=A0 ...
> =C2=A0=C2=A0 aic5_pm_shutdown from irq_gc_shutdown+0x4c/0x58
> =C2=A0=C2=A0 irq_gc_shutdown from syscore_shutdown+0x5c/0x9c
> =C2=A0=C2=A0 syscore_shutdown from kernel_restart+0x34/0x78
> =C2=A0=C2=A0 kernel_restart from sys_reboot+0x180/0x25c
>=20
> Use the irqsave guard, as
> commit 33517881ede7 ("irqchip/brcmstb-l2: Use _irqsave locking variants i=
n non-interrupt code")
> did for brcmstb-l2.
>=20
> Fixes: b1479ebb7720 ("irqchip: atmel-aic: Add atmel AIC/AIC5 drivers")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Tested on a SAM9X75 Curiosity with v7.2.8 plus this pa=
tch, PREEMPT_RT and
> =C2=A0=C2=A0=C2=A0 non-RT lockdep builds (clang 22, LLVM=3D1): the report=
 is gone. On SAM9X60
> =C2=A0=C2=A0=C2=A0 and SAM9X7, lockdep only gets this far once the PIT64B=
 timer report at
> =C2=A0=C2=A0=C2=A0 boot is fixed, which I am sending separately. The irq-=
atmel-aic.c change
> =C2=A0=C2=A0=C2=A0 is build-tested only.
>=20
> =C2=A0drivers/irqchip/irq-atmel-aic.c=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-atmel-aic5.c | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-=
aic.c
> index 1dcc52760eca..4a7935e75e4d 100644
> --- a/drivers/irqchip/irq-atmel-aic.c
> +++ b/drivers/irqchip/irq-atmel-aic.c
> @@ -123,7 +123,7 @@ static void aic_pm_shutdown(struct irq_data *d)
> =C2=A0{
> =C2=A0	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
> =C2=A0
> -	guard(raw_spinlock)(&gc->lock);
> +	guard(raw_spinlock_irqsave)(&gc->lock);
> =C2=A0	irq_reg_writel(gc, 0xffffffff, AT91_AIC_IDCR);
> =C2=A0	irq_reg_writel(gc, 0xffffffff, AT91_AIC_ICCR);
> =C2=A0}
> diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel=
-aic5.c
> index 1f14b401f71d..07a317ed06ef 100644
> --- a/drivers/irqchip/irq-atmel-aic5.c
> +++ b/drivers/irqchip/irq-atmel-aic5.c
> @@ -217,7 +217,7 @@ static void aic5_pm_shutdown(struct irq_data *d)
> =C2=A0	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
> =C2=A0	int i;
> =C2=A0
> -	guard(raw_spinlock)(&bgc->lock);
> +	guard(raw_spinlock_irqsave)(&bgc->lock);
> =C2=A0	for (i =3D 0; i < dgc->irqs_per_chip; i++) {
> =C2=A0		irq_reg_writel(bgc, i + gc->irq_base, AT91_AIC5_SSR);
> =C2=A0		irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);

Reviewed-by: Radu Rendec <radu@rendec.net>
