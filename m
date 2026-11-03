Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722994;
	b=Z/XRuMkVwYvL4wN7oHF9ZNS5MtBeW+Sx3JDXgVtzj+xtmbRHDAOLxTjDmlDToHvmtS3h
	 CDsMGX9y8j4GP45qeXGKMzlBJpIx5CsAmrqcIP0ooIrJUGMT4KXu63z1GzABUSHHzDvgo
	 +1EH4eh6MxU7ivh6e8JZAzgvm3fgOcNJXpTk/oCvFK7rVB4ZUs0kBvntO5NLJpq0mdP8z
	 pX0+8Fbr9rdvR1CVmJOgQft0/nHsDi2OorC9YYqWk0GrbKrVNkYQTmg+8PRkUeFmHslc6
	 dQDbRSAfMWIeGE9cUm53QsF8TOQgNz7IvqMQD43id8BGnvKs6WrRcKZr2KFSjR/8Nng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722994;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BCIqCJTJI3CEPROs9512EusTir8+qkAL3Ppxq3Gysy4=;
	b=iztXrmRNoHNHfpzc/P3G/H47Hm2yqOnTwCpN+QxLQmAnonmj9Vy75rldefHw1qaHf7Ax
	 YzVVHqxWXYK/SCp4qGO0OMa/dzmZ8RSN4k3JK4u4mEepsvsDWKBzbv+I8Zaisnt3XwjfN
	 DFizGGBaNek6zBivKYxVOfJGkxUx5kppj9DdmFRz0UKs7mD0qPYdaXJ7r+9143R4JDycu
	 wNIdkyhdD7pdX0iaoowRWpK0HtQpdcH/EDARXc7jP5Ufpwbt2+gSn6PnItBPGxbt8Kwqt
	 ZguS41C7II2J+gtbF0WCy3aLK82Xk7rpIOC/I+xCPg11yEpmZAqzCpN198ZSgCgsMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pQcsOyzX;
	arc=none smtp.remote-ip=91.218.175.127
Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB0F606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB0F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pQcsOyzX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XEdFqC6h97QFZvtiPpW+UzaHuigGpaYAlhVfXdg2ZzM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722990; v=1; x=1794327790;
 b=pQcsOyzXANbTmHrLXuhGJsF8+TZ7urdjfG72aiS6JgCiSY4m456gk9FDnF2BW32l75+ezPXT
 iRO6NxiF3PYuK83aqSEr4SuUvVfZC0g4jnUe6/vmDLe35XXFRhFhvpLfDKKJnCDVP037dygi09u
 c2K/hrcUHeFVBsdau5X2GCt8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c39b9136ebc12c24;
	Tue, 03 Nov 2026 16:23:10 +0000
X-Mizu-Trace-ID: c39b9136ebc12c24
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8643e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:23:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByKF/4z9YykZvYMX3CUYXE95G8El2bsA4TksvE71MU4fAK2tauBxqV1d1pqgabFe2aXXSGcEyBRqtaiMug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XRhCtZ0mk5SI5qFWU4nMs8Ie6Sp6VKm1v0uDKRwbAANfnjsgH
	0KwWVFgU6fwnbY6sbDpFQhqKbLQd6uOnIgHRItHmPjFXe7IcFvWu5lozxPKdNz376PP6BD6sYGV
	7+6z/xm1k7UiOC5e4ZIaEgdq8YPbabPhQCZtAPUuL
X-Received: by 2002:a05:6512:12cf:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bff0544d8fmr146220e87.7.1793722985169; Tue, 03 Nov 2026
 08:23:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-4-fuad.tabba@linux.dev> <29e7d214-b7b0-403a-a40f-dbc5b6951e22@arm.com>
 <b191c40e-8e2b-4c1a-8604-d75cb47bd194@arm.com>
In-Reply-To: <b191c40e-8e2b-4c1a-8604-d75cb47bd194@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:22:28 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyFRxuvi+jRvSgNRaPNan2SO3nO3aDivCarvKDaUHRarg@mail.gmail.com>
X-Gm-Features: AclHuK-bljgFCCFARu7bxbrTGuz_ajmvxtmJjvK8SX6B4thjgg1guu6VgoopCi0
Message-ID: <CA+EHjTyFRxuvi+jRvSgNRaPNan2SO3nO3aDivCarvKDaUHRarg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Move stage-2 teardown into kvm_vm_s2_ops
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 03 Nov 2026 10:33:15 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > Someone beat you on this (well almost) ;-)

:D

> > https://lore.kernel.org/all/4304d0c7-2220-4add-9c71-e6dc6b4fbc11@arm.com

realm_stage2_destroy() in your sketch doesn't use the range it's
given, so it should fit this hook, which only takes the pgt.

[...]
> >> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> >> index 10b425a0141be..9df3c80a5acd1 100644
> >> --- a/arch/arm64/kvm/mmu.c
> >> +++ b/arch/arm64/kvm/mmu.c
> >> @@ -1029,17 +1029,16 @@ static void stage2_destroy_range(struct
> >> kvm_pgtable *pgt, phys_addr_t addr,
> >>       } while (addr = next, addr != end);
> >>   }
> >> -static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
> >> +static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
> >>   {
> >> -    unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> >> +    stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
>
> Also, now that stage2_destroy_range is only called for normal KVM,
> could we fold that in here ?

Ack.

[...]
> >> @@ -1126,7 +1125,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct
> >> kvm_s2_mmu *mmu, unsigned long t
> >>       return 0;
> >>   out_destroy_pgtable:
> >> -    kvm_stage2_destroy(pgt);
> >> +    kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
> >
> > minor nit: should we retain the kvm_stage2_destroy() to dispatch the
> > callback ?

I'll keep it in v2.

> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks!

Cheers,
/fuad
