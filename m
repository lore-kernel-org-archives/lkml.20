Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5472153BE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791164517; cv=none; b=R1FJHb5AzPx6KuMl84La48v7v5Q0aGCmju0UejPbmYcD1aoeIoV1sbFOvP9ksPtC4ZizpfiISnMCr3M5YbWMXZrEz7bNCe0LRAozLVXPRP32Q1DvMJa/rZ9gIa45/E2K4DDMMi/UMGDhD/KSgHaZ57Jh84FSKOFehxcRYzkGT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791164517; c=relaxed/simple;
	bh=cNr+ckNwnAYfF282vol3YtDHBMF7dofGBpYdXK+NZkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gT2WQvH6Njhyb+DlG3n8JW8fDk93FZYKHeEouf6ei11kS/BHhrDILwYckJ95tcfbM9+aR1BROD8WWeTqgDL6RkfdDjIyox8okkq1ABV3atZSZLAp9+RKptJnUx75IAGNkc2BKj+WZseSW25HE6QNlejzmAzPlVNmsMn942coDEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDVHcEng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDVHcEng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD56B1F000FF;
	Mon,  5 Oct 2026 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791164516;
	bh=YMRdMPBRQIrUX61rqc5mlDXTRBhO1/an+eTx2/A0kFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IDVHcEngx0Tjvw7z0pduHY8+I+Ev0IaX397LvhXDxAmF4HfroZIl3RbZ6k2LC/PJn
	 O8yt4kiShPFUmXnha4+IZDdmEG8sxUz8GV2AnI6Zo8OVrFybxPy5yrZ82ofe2hP/UX
	 xLo1IP7YNu2xFLTO+bqRKmdGkp/tMP8QTvfIQ+miXFC3h2QMUIiPscf3JFQc+k2o2x
	 5ULUmqCOLNZG9KfWvGAuQ9AyEdyUc1eSkcSg1CE9UBja0th+4/rgT6rQ3dro0fP6Jp
	 J4EOTbl5fMsKg5XDUUqSQCIfdqTk4zhB+92r17tELBDIB/vl2POaseI1dWmY5+WF2I
	 kp5/nP/1fYMHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] genirq/kexec: Do not take the bus lock of an
 interrupt chip on the crash path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Gleixner" <tglx@kernel.org>, "Igor Velkov" <iav@iav.lv>
Cc: "Will Deacon" <will@kernel.org>, "Marc Zyngier" <maz@kernel.org>, "Radu
 Rendec" <radu@rendec.net>, "Baoquan He" <baoquan.he@linux.dev>, "Heiko
 Stuebner" <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Eliav
 Farber" <farbere@amazon.com>, kexec@lists.infradead.org, "Catalin Marinas" <catalin.marinas@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>
In-Reply-To: <20261005-kexec-irq-bus-lock-v1-1-09f6b5323460@iav.lv>
References: <20261005-kexec-irq-bus-lock-v1-1-09f6b5323460@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 01:41:55 +0000
Message-Id: <20261005014155.BD56B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] irq/kexec: incomplete slow bus check allows hang via irq_bus_syn=
c_unlock
--

commit a12343156827b9035af6e3982ac65b3437921502
Author: Igor Velkov <iav@iav.lv>

genirq/kexec: Do not take the bus lock of an interrupt chip on the crash pa=
th

machine_kexec_mask_interrupts() calls irq_set_irqchip_state() for every
started interrupt. That function takes the bus lock of the interrupt
chip and syncs the chip when it drops the lock. On the crash path
interrupts are off and the other CPUs are stopped, so a chip that needs
its bus for the sync never returns.

> diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
> index 1a3deffe6b5b6..c6c745cc76a25 100644
> --- a/kernel/irq/kexec.c
> +++ b/kernel/irq/kexec.c
> @@ -20,7 +20,11 @@ void machine_kexec_mask_interrupts(void)
>  		if (!chip || !irqd_is_started(&desc->irq_data))
>  			continue;
> =20
> -		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD)) {
> +		/*
> +		 * irq_set_irqchip_state() takes the bus lock, and a chip that
> +		 * has one may sleep or talk to its bus when the lock is dropped.
> +		 */
> +		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD) && !chip->ir=
q_bus_lock) {

[Severity: Medium]
Does this check comprehensively protect against slow bus chips?

If an irqchip implements irq_bus_sync_unlock but omits irq_bus_lock, this
condition evaluates to true and irq_set_irqchip_state() is called.
Since irq_set_irqchip_state() ultimately unlocks the descriptor via
__irq_put_desc_unlock(), it unconditionally invokes the sync callback:

kernel/irq/irqdesc.c:__irq_put_desc_unlock() {
    ...
    if (bus)
        chip_bus_sync_unlock(desc);
    ...
}

Executing the sync callback on the crash path without interrupts could hang=
 the
system, defeating the purpose of this patch.

Other places in the subsystem check for both callbacks to identify slow bus
locking/syncing, for instance:

kernel/irq/manage.c:irq_supports_nmi() {
    ...
    if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
        return false;
    ...
}

Should this check also ensure !chip->irq_bus_sync_unlock?

>  			/*
>  			 * First try to remove the active state from an interrupt which is fo=
rwarded
>  			 * to a VM. If the interrupt is not forwarded, try to EOI the interru=
pt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-kexec-irq-=
bus-lock-v1-1-09f6b5323460@iav.lv?part=3D1
