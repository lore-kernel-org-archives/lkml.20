Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A84825BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050406; cv=none; b=cZ0m39e/3ACkAOkJCj/HoIeNAPtGbAs3EQlgaQdBgyv65dyPhQndUjlWEPFXImPgya9o2MYjykMXU5QsBJoYi71T1f5JTgabfQQbgHmJfEZzy1tAPaKCYnLl3nKp64U+BlO5++AK4DhivGS7YUEPV5q/QOVfevRnbTDzf8VLWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050406; c=relaxed/simple;
	bh=vo02vviHqOw8hAzQ2cOcJfgBOWMLopBDsr2aaLSvZbM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gGloaes2EZzE0YnRF9M7kjLILNMGBVyS4jXobFBjFP5eM1bV4kn4HpyVmddLZZ2FDkjVc4qJ1NiG+UVJwDnUu/wsFYEHG+nWh21GPDeAwhmHTbXhOmtpJCpzrJoOmBohRp/tZph7SBVPjD1zB8B2upuz9plH9UjnaSwfkf1HrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Igh2BNYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Igh2BNYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4251F000C4;
	Thu, 15 Oct 2026 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050402;
	bh=cUZThg+HVXlgUHBB9RuoLPOfEs+nTSITP52lqWy14gY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Igh2BNYd+PHupSVza0UYmMtLZ8gvj4hD26NOXgDGWtdAdh2219NOKg6gkhNCtWQr6
	 +PWUa97wq1lUl+RTWzpLrJmqvfKenGaUTo4zVfKCyrn3TjBvHAnKZh675Hnu0u0TKd
	 6Y8M8ONMQ/XfqtVn3fqYzYfb7ikQZLvyHNqmGVlPu4nE+l1/pzm2Sd133Z/V+IClR2
	 PME9/1OqpkbR8NADCwrzEZE0z8nV7amgyq9dsvw3bl8+88FYj/zmYd6hwgGoXFf+Hk
	 QC4C5it/Rnf/zH5sMLoGYlgcsNaO9XIIrBZjgLi1R4BapgvjKOjepNkRUVt1e+Nf2R
	 mFUMz1zqWILfw==
From: Thomas Gleixner <tglx@kernel.org>
To: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Eliav
 Farber <farbere@amazon.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Baoquan He <baoquan.he@linux.dev>, Heiko Stuebner <heiko@sntech.de>,
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Igor
 Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC] genirq/kexec: Do not take the bus lock of an
 interrupt chip on the crash path
In-Reply-To: <20261005-kexec-irq-bus-lock-v1-1-09f6b5323460@iav.lv>
References: <20261005-kexec-irq-bus-lock-v1-1-09f6b5323460@iav.lv>
Date: Thu, 15 Oct 2026 09:46:38 +0200
Message-ID: <87zewfe78h.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 05 2026 at 01:22, Igor Velkov via B4 Relay wrote:
> diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
> index 1a3deffe6b5b..c6c745cc76a2 100644
> --- a/kernel/irq/kexec.c
> +++ b/kernel/irq/kexec.c
> @@ -20,7 +20,11 @@ void machine_kexec_mask_interrupts(void)
>  		if (!chip || !irqd_is_started(&desc->irq_data))
>  			continue;
>  
> -		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD)) {
> +		/*
> +		 * irq_set_irqchip_state() takes the bus lock, and a chip that
> +		 * has one may sleep or talk to its bus when the lock is dropped.
> +		 */
> +		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD) && !chip->irq_bus_lock) {
>  			/*
>  			 * First try to remove the active state from an interrupt which is forwarded
>  			 * to a VM. If the interrupt is not forwarded, try to EOI the interrupt.

That's error prone in case that the outermost domain implements
irq_bus_lock() and the parent domain has a set_state() callback.

machine_kexec_mask_interrupts() does not take locks in general for the
obvious reasons, so instead of playing this conditional irq_bus_lock
game, this simply can avoid taking the lock. Something like the
uncompiled below.

Thanks,

        tglx
---
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646..bdb47837c66f 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2735,6 +2735,28 @@ int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool *
 }
 EXPORT_SYMBOL_GPL(irq_get_irqchip_state);
 
+int __irq_set_irqchip_state(struct irq_desc *desc, enum irqchip_irq_state which, bool val)
+{
+	struct irq_data *data = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip;
+
+	do {
+		chip = irq_data_get_irq_chip(data);
+
+		if (WARN_ON_ONCE(!chip))
+			return -ENODEV;
+
+		if (chip->irq_set_irqchip_state)
+			break;
+
+		data = irqd_get_parent_data(data);
+	} while (data);
+
+	if (data)
+		return chip->irq_set_irqchip_state(data, which, val);
+	return -EINVAL;
+}
+
 /**
  * irq_set_irqchip_state - set the state of a forwarded interrupt.
  * @irq:	Interrupt line that is forwarded to a VM
@@ -2749,25 +2771,8 @@ EXPORT_SYMBOL_GPL(irq_get_irqchip_state);
  */
 int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool val)
 {
-	scoped_irqdesc_get_and_buslock(irq, 0) {
-		struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
-		struct irq_chip *chip;
-
-		do {
-			chip = irq_data_get_irq_chip(data);
-
-			if (WARN_ON_ONCE(!chip))
-				return -ENODEV;
-
-			if (chip->irq_set_irqchip_state)
-				break;
-
-			data = irqd_get_parent_data(data);
-		} while (data);
-
-		if (data)
-			return chip->irq_set_irqchip_state(data, which, val);
-	}
+	scoped_irqdesc_get_and_buslock(irq, 0)
+		return __irq_set_irqchip_state(scoped_irqdesc, which, val);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
