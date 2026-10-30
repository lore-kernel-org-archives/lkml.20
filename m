Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374039;
	b=LTo8O4sXBGnNZtGa9Ma/xWWHdK/RuD74WO++UxI2AKR7XXiXyYtFQdF0/2AepObf9buo
	 AzModZrktV6RIlMvMBqFS1OsfTNo/j6DGRJ5YsScFNHuhsX2JUkXrF6kDr1PG6re0M6wI
	 zdiry94XUorj4/fdZqZ+bBNcoQNM+ggO6Y21L71O9MzcqCJrsomUhnB3UHqF9lxhH/fT/
	 ixMF/RuzOrzec/4I37EEYJYC0+bpo51s7JJRiWwBbUYozqeCYtDVwRON6C9AidtYv5GiV
	 qajbBdNmu40bgr94CWYSJ4dWYPa7GYXkVkigjfj8eE4PWOHQlsMc1l43nMu3Sw0LsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=e+m5QU2XeT3uQPTC6GC01opeM6s+W2OonF16GBipID8=;
	b=C1sedqdQZyV1+wDfKtO+lO07SQnPU0DskIR8mOA0mLOm9urV+NfFBtdoeSbb+orAKzOT
	 cU14Vfg2UyaXT3lufYctcTok8IWeEgfkQ3N564aoYR1GZjJK9z5kjHGbMlRHoRlSHmSWH
	 LOKyeW6YLCc7c9veRI1/9kWAM8Cjte4qtI6b8QdrGTppvrzDy/FAxGU5v6ys/vPiz6hsq
	 +yRPBqkSZG6p4rzWrusS8fAY8ktYLexNrL2GPhsiPrXUGGGhIG8qiZ4tuEz7ANSmNXdnH
	 kbwwXgV/Y+bLNjR/HEQSH966bS5uKbP7SYROm8twEXi+p0aerP9XKrUtJ8vuGBP5hyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFAVKHPu;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD833606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD833606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFAVKHPu
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so1375584c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374038; x=1793978838; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+m5QU2XeT3uQPTC6GC01opeM6s+W2OonF16GBipID8=;
        b=XFAVKHPulJdUfDeKa8svR9f5V73x+etFm4iL9VgAiu8m5lWA9EUvr1d93Ah/ZuLrVh
         Ulr3XfCeaRBNxhC+cJPnwBSRHWx1ie+YZmGO8L81/lEOglQw8Pt9yERS2XSzSR5v69O+
         pGP2U5hALlGXj/oK264mgyAz293TfKe7MaxMB7gTrv2kjEmXBJkurMOaG/vJn2TofYBl
         n8+01nrDE3nzZP7XYKhUKNNjL2/ic7mdsBQXhIfxwm0BVzBIyIJttzMqTSmG7RS8uSZW
         0o5sHXYDck3TLrbjYg1L0WR+y1mWykuG3/TxXHbmgmGaulL7NG1A6cQAFgY4WEXwxu4M
         SotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374038; x=1793978838;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+m5QU2XeT3uQPTC6GC01opeM6s+W2OonF16GBipID8=;
        b=OprGuOZQ6JkY8IosDbC9Sc3BKIrgFDyek/auuwqeqMOQpxYdGHXyobLbBqRADOH0Yb
         c4q/h4rMxUb6/7JWLB81jNfzfEkP+fZRUP5QvfSf/Cq39B6f0+5zC30PPUfK1c9v+Yy6
         5QOzOGcCcKCKJHMr0ctxjxbpVif8jo+pLPkANnPhrJX4tt10U5eC/JMLfFXGOqZM1TWH
         Nkz6B57v63jeq1njvaG8n/6MSIB81C9JVPPDX/Zb0k35WJG7bVgC48Fbr9L93n8JAna5
         uyt2HSxCyTf4l+wngJvH6dyirHAAjU5Obd+08O4LOCabs4pCVZfdSqpn8WUuzXPOkgRD
         vZRg==
X-Forwarded-Encrypted: i=1; AKwUvBxw7acLznU1OW7ZAG1hE2PRG4+oaZX5h7YG6ZxC5uoo8MIIOVRpYK/gpsmWPaz8cx7vXzRNTaOIW15oIkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdycfaQtr3+Yl7mrQBJxEXSnYPMAcBl41K5BZX/tVE3prOoqPH
	MRSZcLQqijkFdYWUP0Q4jNgElveTxnM2chj8MBqyNBZbuesvJYF7R8hb
X-Gm-Gg: AYBFou2Kt5SfxlaJzOAWSrjudISarrTMGdEaAtO0rcH4xiSN/nfjOfskl1MNX9X+Urg
	O7ZVCwChoY9Uo/Nr9PUjJVlkmOlEEMqN6r5+XG8lFF9veJYqY3iFp/VqXQisZo90B6iNv/rJLmz
	0uETZGyeGzaErnHve86aEKNlPykiHQMUr3m5yJVIuTnBXU36vobDe0d3eEV2oFM4Fy3f/G3qprB
	WdDyBreaeeJ3ZCzZaoS82qm5fGIybCbFXZgbeJU4yozEL5yCOIhx9alHlK3cwhz8fGqfVKPCtYF
	cOSlctMLy9BZlFeoPbn5ek31soZAx+4EM7a0ESJxuybMkKhIIPEbwGbSeb4Solyd+/jdnG5guzG
	IY5qS3/cPTUpYGzJL8O1bz3XkUtzOodIPQVqMIlh07J17me1shMjwkAJEEXHegLCayzFLlwQkL+
	vB/HRu6ukQFG3VC3HdhY2RMCqqPYbIxPXbZBYBThmce0nAQmLIfWlwUP4cqobH+Qf5hOYCwDpCp
	NPyvjmX3qUoQDoy06yZDRBtBAebpGx6+jhSlHep+PNJ/5c6t4uDv1uYJAPcP+mf6zMQmSx+lc8y
	IuTTgVZxnnLxJ6WJzg8ppAsdNw4=
X-Received: by 2002:a05:7022:7f0b:b0:13b:3132:6e99 with SMTP id a92af1059eb24-1ac5af2da84mr3344929c88.20.1793374036049;
        Fri, 30 Oct 2026 08:27:16 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm9261448eec.29.2026.10.30.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:27:15 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, nnmlinux@linux.ibm.com, amachhiw@linux.ibm.com, harshpb@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v4] KVM: PPC: Book3S HV: Avoid spurious interrupts caused by LPCR_MER bit
In-Reply-To: <20261005084534.1588611-1-gautam@linux.ibm.com>
Date: Fri, 30 Oct 2026 20:48:15 +0530
Message-ID: <4ie3w72g.ritesh.list@gmail.com>
References: <20261005084534.1588611-1-gautam@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> A huge number of spurious interrupts can be seen immediately after a KVM
> on PowerNV guest boots up in XIVE mode.
>
> $ cat /proc/interrupts  | grep SPU
> SPU:     223705     192439     273526     147623   Spurious interrupts
>
> This bug was introduced by commit ecd10702baae5 ("KVM: PPC: Book3S HV:
> Handle pending exceptions on guest entry with MSR_EE"). The root cause
> is that once LPCR_MER bit is set, it is supposed to be reset by
> software. But when a vCPU starts running with LPCR_MER set, the vCPU does
> not exit back to the host until the decrementer expires or there is an
> hcall, etc. This is because KVM on PowerNV guests have support for
> native XIVE, so they are not dependent on host for interrupt emulation.
> Due to this behaviour, a huge number of spurious interrupts are seen
> since LPCR_MER continues to be set and LPCR_MER cannot be reset until the
> vCPU exits to the host.
>
> Fix this behaviour by not using the LPCR_MER bit whenever native XIVE is
> available (currently in case of KVM on PowerNV only), as the XIVE hardware
> can present interrupts to the KVM guest vCPU directly. So the LPCR_MER
> functionality is not required. This reduces the number of spurious
> interrupts drastically.
>

Make sense. 

> Fixes: ecd10702baae5 ("KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with MSR_EE")
> Cc: stable@vger.kernel.org # 6.8+
> Reported-by: Timothy Pearson <tpearson@raptorengineering.com>
> Closes: https://lore.kernel.org/linuxppc-dev/582904882.11159.1786719390349.JavaMail.zimbra@raptorengineeringinc.com
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>


> ---
> v4:
> 1. If interrupt mode is changed to XICS during guest reboot, MER should
> be used. (Amit)
>
> v3:
> 1. Continue the use of LPCR_MER when kernel-irqchip=off (Sashiko)
>
> v2:
> 1. Handle the case where xive_interrupt_pending() is true and also the
> external exception bit is set. (Narayana)
>
>  arch/powerpc/include/asm/kvm_ppc.h | 7 +++++++
>  arch/powerpc/kvm/book3s_hv.c       | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 169ea6a7fbad..9178406dc365 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -747,6 +747,11 @@ static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  	return vcpu->arch.irq_type == KVMPPC_IRQ_XIVE;
>  }
>  
> +static inline bool kvmppc_xive_native_enabled(struct kvm_vcpu *vcpu)
> +{
> +	return kvmppc_xive_enabled(vcpu) && vcpu->kvm->arch.xive_devices.native;

I was checking the code and I am not sure whether we need to also check
for "vcpu->kvm->arch.xive_devices.native"?

Can you explain why do we need to check for xive_devices.native pointer
to be non-NULL? Because if we don't need this then it simplifies the
code as we can directly use kvmppc_xive_enabled(vcpu) helper.

-ritesh


> +}
> +
>  extern int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  					   struct kvm_vcpu *vcpu, u32 cpu);
>  extern void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu);
> @@ -782,6 +787,8 @@ static inline bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { return
>  
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  	{ return 0; }
> +static inline bool kvmppc_xive_native_enabled(struct kvm_vcpu *vcpu) { return false; }
> +
>  static inline int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  			  struct kvm_vcpu *vcpu, u32 cpu) { return -EBUSY; }
>  static inline void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu) { }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index dbac3573b2c8..dec89c014c52 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4980,7 +4980,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  			if (!kvmhv_on_pseries() && (__kvmppc_get_msr_hv(vcpu) & MSR_EE))
>  				kvmppc_inject_interrupt_hv(vcpu,
>  							   BOOK3S_INTERRUPT_EXTERNAL, 0);
> -			else
> +			else if (!kvmppc_xive_native_enabled(vcpu))
>  				lpcr |= LPCR_MER;
>  		} else {
>  			/*
> -- 
> 2.52.0
