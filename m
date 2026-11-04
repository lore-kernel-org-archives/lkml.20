Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822964;
	b=UMoHHU5/3fUC8zI9vgA8RcDJ0Ag42MH7dQquh+i8lf6i5YCcOmdGj0NiyO78v4jShVZB
	 b1ka0/wj6NF0O48fPeCJUvrG74/xg5mzQBdEtVQ8I+yxCQ/jyoQ0Oe4JaUL2ChbXLf9T4
	 Lw5f22vrPbct3QMd+upDCLcihmuFTIg9hpA27YbXJOYKkx1bzi+t3iw4D36c0Z20NmyhI
	 IDssZNf6oV1CMNLr0rbZhvmrLExj5NGyiQszBzvqk48W9hK1V7gRhysaEd8ZuXuyf5e0Q
	 R2AkKCBO1OMSx6IAQCvY6qreTMiLwpIFFR7ceVgYrRX3cOKf9wnS87ZAV7Ur7Y6B6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=E2TeHoCGLsdbVlnVR3R/1g272e9+f/e+PpD1xA79wRM=;
	b=VZDlL9cQ8fJ4yXPGlvATE43FujyWL17u5Ki/+tDIGp5mxFr/KIisM9B4iGmxu/8Jc9y4
	 a+3jv15Y0I+d9JqrlDfHE1gYgFLBqp8w9Iq/+IzXwm9ncxNsH7RjRxq6W+OILJpRSLR+z
	 kjrf3lrl2HCbyhW6rz5xkYZhIbvM6EY5MGd1bI80DEVAnH6UVlDMvGUDTCe73fpC3dq59
	 1ZCz/tBvS6Kq+xHHNnvIXWy2k/MZk70GkGj9qekqIwBrzqnxSTgk3xrPVjujgGO5+Bwo2
	 ZGAou92kmDTSTVMfus4VTJgJHrirHojJSJ9r1J4SMQsXUTqfmfm3+wd0sq+XT43zDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ks1+EsyG;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A6606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6A6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ks1+EsyG
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1370861a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793822963; x=1794427763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2TeHoCGLsdbVlnVR3R/1g272e9+f/e+PpD1xA79wRM=;
        b=ks1+EsyGcdNm3nnjwH3qu2mAPy2MGIX9c3zziwOLIuws/kki5T+SudrwpLhb0UI37l
         2H5mtgEjEwNq6j1zmSu0kn7ZlvA+B6xuh5Pswv+1gzfraDoDYbeuQHQpnj7HOY2XXyZJ
         5eCOnwU2ntQBsk/ZmmjQsSN/gMz1bjCN2Hp8EPQ7RiuICKxEGrUcUHYyE6bmOdQltuqx
         ZUVrTKtIHv663IOrifXhojZppskrdXyCax0TYR79e7ImzIdP9aNQQON9Zi2C5WwCiFUS
         H0MCrkKESU74fTGq9+YuM+il5Ez8qaxeo7MiMyFbHnQZ0q5uvjGt/XD1Qu3VJuPrq8qy
         jfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822963; x=1794427763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2TeHoCGLsdbVlnVR3R/1g272e9+f/e+PpD1xA79wRM=;
        b=XyczwLXABE7sm2m6AT3iT2wS2leE5HhcHJHq8QNl0JSxwTJY++3Qbc57s6KeMee88Y
         Mb9Z4IlmcYfyYLCe7jqR6ZeDGn/vX/Jmbr3qshhbsZfmvL6ewWvyVutlHM1Vo+6E1Ioe
         blufnnxpIrucxRfEVBHwLrRd7q191sBDbxXO7tgdl0gHXM8CCputbHKpY4/X/T0dW0Ew
         Xluucf5cp/UmRCljrsYsXIBOrBjtAnKCEI+a267lY79puDVQTBA/0vP4xsBiS+hrNHPY
         yXqdgQmEJO0dwkWFAKFbARDzNARS6TPFJHCKCpBPTcwEs3yAFkayq3A+OkkPjcepx7UB
         jNZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSaNEJJ2mJKChoo+4lYZkWnkMbwOTbzRFfmw/XUwhFoX1LRfx/rN7Ru1at+jHk68Tk/jLzX4jmxvCGmpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gGYFVRmDrsj2q04qEfGhlCU69m7/4+Fg4fUUqC3Xg0gcDobaw
	GWn8TVNIhCSy0TYKv+V8Zs/EIFn+b+Fn4AV4Z0RNNBGNDtGX4DNiw4mVR3cNkTVqUYfMW7gd2bw
	YQyfK0Q==
X-Received: from pjbgn10.prod.google.com ([2002:a17:90a:c78a:b0:3b0:b36b:66fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:584c:b0:3ac:9c37:9418
 with SMTP id 98e67ed59e1d1-3ae89724824mr14163241a91.19.1793822963093; Wed, 04
 Nov 2026 12:09:23 -0800 (PST)
Date: Wed, 4 Nov 2026 12:09:22 -0800
In-Reply-To: <20261008-lapic-extint-lvt0-unmask-fix-v1-1-db2bf68fba75@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261008-lapic-extint-lvt0-unmask-fix-v1-1-db2bf68fba75@collabora.com>
Message-ID: <auuQ8pE439EB63tm@google.com>
Subject: Re: [PATCH] KVM: x86: Reevaluate pending interrupts when enabling
 ExtINT through LVT0
From: Sean Christopherson <seanjc@google.com>
To: Matthew Leach <matthew.leach@collabora.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 08, 2026, Matthew Leach wrote:
> If the PIC output becomes asserted while LVT0 is masked, unmasking LVT0
> in ExtINT mode makes that interrupt injectable without setting
> KVM_REQ_EVENT. Without another event triggering reevaluation, the
> interrupt remains pending and a guest waiting for timer ticks can hang.
> 
> Fix by setting KVM_REQ_EVENT on an LVT0 write where pic interrupts
> become acceptable.

Why just for LVT0?  Isn't this a bug in general?  I.e. can't we simply do:

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index d6e5fbc3c58c..ffdc67ca8fa3 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2554,6 +2554,8 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 			val |= APIC_LVT_MASKED;
 		val &= apic_lvt_mask[index];
 		kvm_lapic_set_reg(apic, reg, val);
+		if (!(val & APIC_LVT_MASKED))
+			kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
 		break;
 	}
 
Ahh, but there's nowhere for edge-triggered events to be latched, so this only
affects level-triggered events.  Which means, this?

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index d6e5fbc3c58c..b72930a8516d 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2554,6 +2554,8 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 			val |= APIC_LVT_MASKED;
 		val &= apic_lvt_mask[index];
 		kvm_lapic_set_reg(apic, reg, val);
+		if (!(val & APIC_LVT_MASKED) && (val & APIC_LVT_LEVEL_TRIGGER))
+			kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
 		break;
 	}
 
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
> During calibrate_delay_converge() we spin waiting for jiffies to increment on a
> tick interrupt. However, if KVM fails to deliver the interrupt this causes the
> guest to hang, spinning on the while loop.
> 
> Reproduce with:
> 
> qemu-system-x86_64 \
>   -cpu host \
>   -accel kvm \
>   -smp 1 \
>   -machine pc,hpet=off \
>   -kernel <bzimage> \
>   -nographic \
>   -append "console=ttyS0,115200 noapic apic=debug no-kvmclock clearcpuid=tsc"
> 
> Resulting in a hang at:
> 
> printk: legacy console [ttyS0] enabled
> printk: legacy console [ttyS0] enabled
> printk: legacy bootconsole [uart8250] disabled
> printk: legacy bootconsole [uart8250] disabled
> ACPI: Core revision 20260408
> ACPI: setting ELCR to 0200 (from 0c00)
> APIC: Switch to symmetric I/O mode setup
> Not enabling interrupt remapping due to skipped IO-APIC setup
> Enabled ExtINT on CPU#0
> 
> Note that the bug manifests itself only if a PIC interrupt is asserting during
> the mask window, so it is timing based. Using nested virt helps, or apply the
> following patch to the guest to provide enough time for a tick after masking:
> 
> --8<---------------cut here---------------start------------->8---
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index aa1e19979aa8..ddee09360dd0 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -1509,7 +1509,7 @@ static void apic_clear_isr(void)
>  static void setup_local_APIC(void)
>  {
>  	int cpu = smp_processor_id();
> -	unsigned int value;
> +	unsigned int value, i;
>  
>  	if (apic_is_disabled) {
>  		disable_ioapic_support();
> @@ -1527,6 +1527,9 @@ static void setup_local_APIC(void)
>  	value &= ~APIC_SPIV_APIC_ENABLED;
>  	apic_write(APIC_SPIV, value);
>  
> +	for (i = 0; i < 10000000UL; i++)
> +		cpu_relax();
> +
>  #ifdef CONFIG_X86_32
>  	/* Pound the ESR really hard over the head with a big hammer - mbligh */
>  	if (lapic_is_integrated() && apic->disable_esr) {
> --8<---------------cut here---------------end--------------->8---
> ---
>  arch/x86/kvm/lapic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index e1f3cea14765..ce7fbd6c45c2 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -2520,6 +2520,14 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
>  			val |= APIC_LVT_MASKED;
>  		val &= apic_lvt_mask[index];
>  		kvm_lapic_set_reg(apic, reg, val);
> +
> +		/*
> +		 * Enabling ExtINT can make an already-asserted PIC interrupt
> +		 * deliverable without another transition on the PIC output.
> +		 */
> +		if (reg == APIC_LVT0 && kvm_apic_accept_pic_intr(apic->vcpu))
> +			kvm_make_request(KVM_REQ_EVENT, apic->vcpu);
> +
>  		break;
>  	}
>  
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261008-lapic-extint-lvt0-unmask-fix-52d2328af682
> 
> Best regards,
> --  
> Matt
> 
> 
