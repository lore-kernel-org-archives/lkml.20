Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960234;
	b=q/UwYOAdqbjhJjLDEED5wQZQtLYhbezrf9kCVWoFRnU4phE9Dx3gGlM4q+1SpYfRt0Ne
	 wWeapdiPHO7Y2e/2s3eVOV36eJAl4V5tdCbK77yHttNK4zIxkL2J/Ry2i/ln3ZUvp3bvg
	 yQoGwhIkauzpt9KLlv4o8kZrCosfSPV3cBGuD52JR94TyhqD/UN8DHrpAd36tmlxg7qVP
	 N654ewcjrteGQEu9AFL3fyA6HcUvlOPK8cD/UIT8ZZhHRBcdm30vRPGQjk5Da/TVnNiyh
	 ZsBh2KX7XMUQPne0EIDf9Pr9j2T4DLLdlyYk/DJXQ2eCOgOaTv9bL+Cljpu5m8GP2ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
	b=jPjtfUciqLg+apPPqAOcTrUvfYKFJVUUEvZhERDs82WwaQWnNpt3PSQVrDGgq4L9tz+u
	 paPZnVeqkHCpfxN7cl+bbjPaBVk3lwuCseNP9EXdj4KvFfBwwU5+CteA6d7slW96ticQR
	 ybMFPqVGKVPq3jS5wL7+lxKmB5qGXFwsftzSsAqpJiflpSdZHwrjFUNRuut1tUDDkSRQ/
	 FAKAwVHC9S4gyhadA0YYN3ulW/f8VwBAxqgX6aN3OpAHj3tds6xFFQgX2aOwHSXEB7WNF
	 xjIhOB+UuakY16vnZABPO4WAq5O2Q4SLwRVULmXtn4wK4YLfdCNYF1CZhfTEdDmkaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hDS/99aC";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29FA606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hDS/99aC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so13349415e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960232; x=1793565032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=hDS/99aCeF7CJxsoTTpZ0+zronkwQywQHbjg0mGFpMqPy+P33plzbb03DSSh3yWcFE
         XdokAJchxaBwkz1TGf7v1Gs0AnodKhKfLIPwCMU/jCH/+DUiIpraVT7SZv3j1rnWdIZ+
         CWKSD7mo/0UxzGlOMn8LKZtslmb/kPKp1WGmrz8q2kjdCkJgANiCoAjh1iK5k9MJXUdB
         ReeG6l/aUIsPWkG4MRK1QRz2l4gspNxWA2cEf5A7Mn/2ViokXWssTASVkm6mYDVm4giP
         uVDtfai7MqPXeUsoS/ww2h35N8E8p/6jY49tQGi6mPliQE/8W1aCSdPnV4V29mt8S4pP
         IjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960232; x=1793565032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=o4PWV+hW9QiYPxUB7hCPOR+ZHFJYFO40fJBNNZXsxKnwCLBpG/Eu1LsgDqujsjjQvA
         kKNSB1G89stut1xV9W1yBZzcUdD2/zy3+hXLkTBfv7//7uzam3M49UsBAmw/FZSWHFR1
         sLuMExOzKFEiE5OuvbwpHwfS7c6ZvV+3SghWoho8JMgXt+J8rM89ZlDztAAfbRFT8HsC
         xfhg/voZF6Kie2Qr5NzopAq1Bu3n6CdiviJe5cEBj7IyJ7I5lknQwqpbaT80TV0gAU3b
         AKbkoVgkKuXRpvMwWg2GYZB2xpFiL7WL+vC8qlCusFLzy3XYmZlZIcWNw+Hb3zJbB9we
         I/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRSrAd867HwC0IkQttLmABUnoMjsbumbH1cswjpQeMNMcKw7EZ7PrhR77/p6bauPw83su5vOZ3oMQISgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHXtH2EWW7NRMsxw0hsat/B/Cm+TwkEQ3LIN4b5U/1n5AkrxQC
	oTKoV8orkbKhNzZXk6S3dhIbN6tv21TxvHsiH22gzI/ZUsdr5voUfSLp
X-Gm-Gg: AYBFou0WPC0oBR6HG7ya8xc59PEYusMmxAv+D1N4PKu7vqpFBAllh4xc8CvBB71GWeD
	eWuo6weNQ4HwWtywRhjN0O6AcaTYRp81+iUh/Fc3YriJTmxircq4EzsBtcWvE74fLPBVol1dCa0
	9QE3yKfbMtw5ImQGc7sHHgDtVqW4sZWUwGGbmu8GY1JqLKR8F8LrVwXNVOpU/ZX/mgKCn1+z+5H
	m5Ca9Jgpkl7rYyY1VCApsi0C/jAUl0KYgKtadtx43COsgPSxoZtb0vX5xYddT8KDXID3UxcmyGd
	zsOKkH3bXSnnjgPv0Y7jfZR6CrAkkxHUYmW9u1Kh2aX6lQac9d+YSEpRESOiyph8k4kvkAokTBZ
	INEdzKbSezxaEYGI9Vdza1pFdV444Mnqcxe1LJiH9xSoKZYiz3Vqm1Kc4PN72jZMkpr33L4HA+L
	DjTPVldNZMtAu2ZsSYksrJeCL4alK/HsfOQ045kkb5UT1pMsaYDccHcBbNXC01vKdvh/kYn0QPY
	JuCMTZKq0IVbDL5ieVAGlcFu0wCzhc9cYE37CW4WextqepcaGh68VoIaHfA8/3eH2V5514iNGV6
	hGRNVcPb9O3bIsamgy1GVhs3jFPCQdIQ0+eT9zsLA7OjDTeAPmm/9SboOvfxu3vCkyou4l0FbEb
	+OzhGqQQrrKnzTennTu4DoPglCqFXfA8OL+Vm6Nn+Z47NUwCpfACYnvKh4JUf1bx/cUBIeirABm
	u3
X-Received: by 2002:a05:600c:4583:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a35acc2773mr98426965e9.32.1792960232061;
        Sun, 25 Oct 2026 13:30:32 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a9cc-4401-09c3-9199-30c4-c6a3.310.pool.telefonica.de. [2a02:3100:a9cc:4401:9c3:9199:30c4:c6a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm12003158f8f.17.2026.10.25.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:30:31 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:30:29 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Message-ID: <at5k-_Ign30fPuHE@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
 <atxWfRsNNK8vdeSr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atxWfRsNNK8vdeSr@kernel.org>

On Fri, Oct 23, 2026 at 11:55:57PM +0100, Oliver Upton wrote:
> > The exact alternative is to stop and synchronize the target vCPU
> > before applying such a write, as the active-state accessors do. Is the
> > conservative replay acceptable here, or should ISPENDR pay that
> > synchronization cost?
> 
> Yes, just kick the target vCPU out and sync the LRs back into the VGIC
> state. That's consistent with the approach we're taking everywhere else
> where this sort of issue arises.
> 
> If we're lucky the vCPU is just poking at its own redistributor and the
> synchronization is free.

That makes sense. In my current v2, vgic_mmio_write_spending() uses
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock, and drops the extra struct vgic_irq flag.

> 
> > The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
> > Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
> > once before the fix and twice afterwards.
> 
> Have you configured these guests in such a way to reproduce the issue?
> What exactly are they doing that is susceptible to this issue?
> 

Yes, the runs used a small test harness in each guest. Each test
configures unused SPI 150 as level-sensitive, pends it from thread
context, and pends it once more from the ISR before deactivation:

- Zephyr (qemu_cortex_a53): k_irq_set_pending() -> GICD_ISPENDR.
- NuttX (qemu-armv8a): up_set_irq_type(IRQ_HIGH_LEVEL) and
  up_trigger_irq() -> GICD_ISPENDR.
- RT-Thread (qemu-virt64-aarch64, pic.gicv2_eoimode=1):
  rt_pic_irq_set_state_raw() -> GICD_ISPENDR.

A driver that hits the same pattern is RT-Thread's
components/drivers/mailbox/mailbox-pic.c, which amp.dtsi configures with
level-high SPIs and rings via GICD_ISPENDR. 

pic_mbox_isr() reads MAILBOX_ISTATE once at entry and clears only those
bits at exit.

Sending on another channel while pic_mbox_isr() is active sets the new
MAILBOX_ISTATE bit and writes GICD_ISPENDR. Without this RFC fix,
deactivation drops the second pending state on both GICv2 and GICv3 and
leaves the new channel bit stuck.

Thanks,
Karl
