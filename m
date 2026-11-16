Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836441;
	b=bU15I4vJCh3wMZxZflnR/+sdZzmrfr2Qcrux/dAAs5ElbbnYrDZrWAurVBpiEUv4vyF7
	 ggSH0WzoMv02ULWrtUMGFKk8R+JQiCgiziS1BE2r1KmkT9MRkqgYhqJJEIoYALFtHD9CQ
	 MqWoN4VdYBQeUkAoS7FGygdQp4c2Hhv6PEw7eZbqZz20HTvk8JtwHfjWr9Kpoe5Md0ohD
	 IE2nYPRreSCSf9M8WFZtV+iS+i5eXCAkM8LHkhG5DfXy6qrYEY7csdcf5Q+Hzy0ASDwlS
	 coo1bQHu+Og2zINg58lNXx710Y/yt+TXU7p3qVFc3xqrRygriJ1OcUNgOKr1M6I2Bdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=;
	b=4tO2Dz0XlOB02wZgM/dBKrDFBUCf1eyS5Z++SQIWcjym0i123NVdhWhzzfIzRYjBgALh
	 obqlXlJQULgCp4lxvZOAV6LyrsKQF0bmOB/7mgyIIZmq6U9EUwQUOtFiYHr/jzM2rVAgM
	 fU7jULeJDn8lFcw3AMRCNhhwphb4j0CtM5jvWNejvxNBNz7VuxAiw8/L7lZ+ea4E5OBSQ
	 d7AIHzv5juejBmzhaVeXNtOLyj25vvCXOFFNjbkaZ3cqTdEqnA2q4RyHywI6rdrux32aa
	 D2XtTEM2XPAIRPSCzS8eh5NPSw1Zl0eu5n/9tfe9fDoSEcJ4V48XnoQkWd3FcrV9kiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="bhS+0H/y";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80576606A8B3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80576606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=bhS+0H/y
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c505186727fso93293566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794836439; x=1795441239; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=;
        b=bhS+0H/y2buVQdfOOhcjcWHZQCBDCiQCbEpaoaan7fCUgnsl+IwitbOfGxAWWMYEyD
         Wb3AOKZ0B25ND5F/L/gxIMF/ZcNPsoTprY6ghR0L+BHXFMml24JUGBini4o+iZHYeELE
         v+Lu0pBjaaFBVWIemyUWGpXuHFJRH5wDBx+EC6gmJVwZ3Vj7zxKHFgWgnuvfYrPzqgVy
         KOLqVGmYENW/8YW/+A0F2ZTnv8DVa6yWI016T7nbjGiiFPIpxVoFKYxF2Q0cmGHARm3A
         NLAJvNWEItLmqP9KhervxmTuXJ71xgNVu3LhV5JudJq9K4H1z3EnD9GVKmK19b8tV2Wi
         5/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836439; x=1795441239;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=;
        b=PS3yO/HqdaJwDijdLhBSnyfMXy/5GmCzXxqGcmwEhnc7Bdqvc+7P+j5rO9PMq/qMVS
         5Wcx5qgbnYQ3PRA3i8+91NZt45cnbfmIPZRS0+2szMDcAnf+stC1jRlPaNZLD8fJ+GKY
         dT1hsk/cHgRLG8b5Mx1qspZg7gDaoibXT4OfmM/XX5Nn2AmonaMo0/5sPj/78HP3I8l0
         LEUFGTPPcfq4ACDTE2lCgkNjEDiIgpqFZ9nDRZNM7HHcbeNl2Bgat1CYERr7eCk1xi3q
         XGbIJpagAlVyzq9SjixroJor5Qfath/e5wqFbU/aGYqUj+2s7MQZsLEgC0oGl6bQG3he
         5+ww==
X-Forwarded-Encrypted: i=1; AL+hErFIdZqt3c60sHcQH81aHkEEgraHqeXyHTVCNCBcaonaR9ZyV8qQRJdUz96glhijldpSVqwxCTYp4mtSIFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g0DlED2icOz+9vvFpeRUQjkEpHvfoFArARaAzpHoZgEcRYbey
	OdKYvEf/13uR122T1dql5+IH8ys1K7N8ip/XXyJf9RZAi3PkV4W/+eKNher+yTYMss4=
X-Gm-Gg: AYBFou0NiMBw0RAioEVV81hOUlyZCOzj1Zf8RIj74CSNZcfz/P5bF7eU3mk0EI6P9Y1
	+JtnxGkoQG6MtLv5SQ3DWwUyhXNrSbVnGyuTiOLHsiId55nZUCRmiF+Xl4Xe9iP8eaT4+jbaKLY
	CLniCanZjXDV7y5C7tMKKaf822jFF1Kjw5FzRiLdvAP3iTp0nwmxVDGBG5KH7ZYC+/gDrr1eqB4
	3ZN1WGjGe30QG+oxd2K8vH7R9Ve4ZtUOMg9t3vMVKMYGHbP8BIVNGMLmD4M5ZkI/AaaIFVi2Z5b
	ema4aCQUX+NzDwTRumflTk6/MxOV5flZupbzBm5FBig6ieqjbuMqbQzV0UfxShQuSxOQyhwW1mo
	Rtzfqt2DR9U3XV9vwNG2tHz5LkrADzf6m/gpqCzbbfR0U5FIf5yTmzGFIkeUUhJ87pgRmHMODYi
	iH77xtmtao5Kz8wuE6YsSOKJNyDSiNa5b9bZKdgJI2NV2vmjgwrn8HZLCje4qGo3BJPEHDPhVLJ
	2GTg0PWDetuWeXgK3WluAKwsNDyigBBe608hVDr0wMDMYXC3QC26UnH49VSXc88Nkn/DRgo0ckj
	Vy/qPwltwCP1O1O4w4A=
X-Received: by 2002:a17:907:9492:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c509636a2ffmr771296866b.22.1794836438561;
        Mon, 16 Nov 2026 05:40:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm426229866b.25.2026.11.16.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:40:37 -0800 (PST)
Date: Mon, 16 Nov 2026 16:40:34 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Fix NULL dereference in kvm_inject_nested()
Message-ID: <avsH0lxpLIF2Ug64@stanley.mountain>
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
X-Mailer: git-send-email haha only kidding

There is a NULL dereference of vcpu->arch.hw_mmu in kvm_inject_nested()

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000084
  kvm_vcpu_put_hw_mmu (arch/arm64/kvm/nested.c:1046) (P)
  vhe_vcpu_put (arch/arm64/kvm/arm.c:827)
  kvm_arch_vcpu_put (arch/arm64/kvm/arm.c:860)
  kvm_inject_nested (arch/arm64/kvm/emulate-nested.c:2903)
  kvm_inject_nested_serror (arch/arm64/kvm/emulate-nested.c:2976)
  kvm_inject_serror_esr (arch/arm64/kvm/inject_fault.c:365)
  __kvm_arm_vcpu_set_events (arch/arm64/kvm/guest.c:827)
  kvm_arch_vcpu_ioctl (arch/arm64/kvm/arm.c:2017 arch/arm64/kvm/arm.c:2157)
  kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4772)

KVM_SET_VCPU_EVENTS does not load the vcpu, but it injects a pending
SError or external abort straight away.  If the vcpu is in L2 context
and L1 has asked for the exception, kvm_inject_nested() puts and loads
a vcpu that is not loaded.  vcpu->arch.hw_mmu is NULL when the vcpu is
not loaded, so kvm_vcpu_put_hw_mmu() dereferences a NULL pointer.

To fix this bug, only put and load the vcpu when it is loaded, similar
to what kvm_reset_vcpu() does.  When the vcpu is not loaded there is
nothing to switch: the next kvm_arch_vcpu_load() loads L1's context.

Fixes: 9aba641b9ec2 ("KVM: arm64: nv: Respect exception routing rules for SEAs")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
This was found through Pereq's formal analysis but the stack trace
comes from real life testing.

x86 implements kvm_arch_vcpu_ioctl() differently and puts vcpu_load()
at the start of the ioctl.  But the way arm64 does it is deliberately
and just something that people working with the code need to be aware
of, I guess.

 arch/arm64/kvm/emulate-nested.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 2bec81668361..22ca735a34f6 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2862,7 +2862,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 			     enum exception_type type)
 {
 	u64 pstate, mode;
-	bool direct_inject;
+	bool direct_inject, loaded;
 
 	if (!vcpu_has_nv(vcpu)) {
 		kvm_err("Unexpected call to %s for the non-nesting configuration\n",
@@ -2891,6 +2891,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	}
 
 	preempt_disable();
+	loaded = (vcpu->cpu != -1);
 
 	vcpu_set_flag(vcpu, IN_NESTED_EXCEPTION);
 
@@ -2900,7 +2901,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_put(vcpu);
+	if (loaded)
+		kvm_arch_vcpu_put(vcpu);
 
 	kvm_inject_el2_exception(vcpu, esr_el2, type);
 
@@ -2915,7 +2917,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	if (loaded)
+		kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	vcpu_clear_flag(vcpu, IN_NESTED_EXCEPTION);
 
 	preempt_enable();
-- 
2.53.0

