Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792826141;
	b=Dzn2eY8QFQ6q587qjVhkNuzMuz/CVwoGWTyw5u35n7bFkIBqI9k7pOlx8x4KCYZVW0MG
	 rzhd3xUWp3fR4SNTZ9EIT0WTpdwNg2iXX+6NVXUdhKskQsF4+hKHFJ6pdrXoGRbHYwWhj
	 0gtR+hGdMZzTtyJ5DwSPL/mZnZqa6kK9QTlVY/IW8ipC9iqX6tCitltDcifXo1KWaCSRG
	 SF6AixoJaMJqFRmi7xqQaXT913ZTESU8YzTpdsEUmBchAyaBgE9jBmroMpabhteVYnDgB
	 lfwaaI23Z8r5sMPDbznE8f35nrQr/fs1xtsKFM83kr4n1XvSqhzr3YHJ9bkLgONWh1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792826141;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xgVmkxubDRg1cJuzFYDYMiEdO1rVdRyOgY/ruAhYY2s=;
	b=RQqH5fSabmHYjCKk8nWb7AThV4nQr/3e+eYlss2nhLK6mth/qsnGLXOTdP9zvybvBi5e
	 gVnsKnzTiNTNnV6bQ1wn1hxNSR8qo9eCjgaKg9ZMUEzBj/DBxwvJCJ3+4Ecxe9F1Ahx+H
	 aC3sw10hVI8sAPYwKkPKk7dGd/FlJlxhD/AO5TUlKE/3713FK6vEiUyyq32Bu14RTk5GR
	 FvqfnRGwUNZVomxpyJ+rrgax+BkgUF9q+LyxprM9ONYLtQLD0qhQrtT1hj2j0Vgg43Q+y
	 MEuZ/ZUfj1FxjamOXEjj7Bc66dEz5j342fa5+5IQOb3Hn0quJUd0alyLndukqFLcB0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SIDrDSuI;
	arc=none smtp.remote-ip=91.218.175.252
Received: from mta0.migadu.com (out-252.mta0.migadu.com [91.218.175.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF5F606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SIDrDSuI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fS8yvEoIwEhEI1jeJexTVj+BAmw6eQpccC70A0wbAfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792826137; v=1; x=1793430937;
 b=SIDrDSuIdqDjWjuWlD3GF6mv/NsjlAK9idm7EK3iB+9rr6Gl4sU9nvShUdjzlczoxS8zTTbM
 PE7Hg5IrUhbizXUv2CVuOK9i+r2DRAgSw9LU3eb9Hk0N1nSOAtvj/kBexg7+55vSLPrzwktaogY
 jaHGPzYNVT1t0VmzD/0oHrUI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 423ee3d297c991de;
	Sat, 24 Oct 2026 07:15:37 +0000
X-Mizu-Trace-ID: 423ee3d297c991de
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso2050e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKUMPWNhT0AT2mNwB+rqT+/XI7Arx2cj/XGmgmmpZT2v9KnDhLuaqt4+GSI9KzCMRoduo867dBggvFpAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbdwGML+IXqvoLuVUdEd++s9Y/06YndI9NYCUJCk0qZdzwxK9t
	02H9qRgyXHglgjifMYhiF/w2kDsL0c1Oo4gqMnEcXOLmGEIlWeAEcOlqihW09SoY6rSbhswj0lE
	G+AayONZiR5rvu10/y9ywtKfu9853s0kUO2Y/ZtTR
X-Received: by 2002:a05:6512:3e1a:b0:5bf:b27b:6371 with SMTP id
 2adb3069b0e04-5bfb79f9850mr46341e87.10.1792826135785; Sat, 24 Oct 2026
 00:15:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
In-Reply-To: <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 24 Oct 2026 08:14:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
X-Gm-Features: AclHuK9QvFT6f4TAsNTrh2PdecgAYJ19yM-sYm9uDvK9gvirJINXHV46-ipXL60
Message-ID: <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 23 Oct 2026 15:10:23 +0100, "Arnd Bergmann" <arnd@arndb.de> wrote:
[...]
> That sounds good. For reference, I have prototyped support for
> LS64_ACCDATA in Linux drivers based on the corresponding x86 code.
> The code is not yet tested on hardware, but it may help understand
> how this may be used in the future.

Thanks, that's useful to see.

[...]
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
[...]
> @@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
>          if (prev != next)
>                  __switch_mm(next);
>
> +        switch_iommu_mm(next, tsk); /* FIXME: is there a better place to do this? */

switch_mm() isn't enough when the same thread also runs a vCPU. In v2,
which I'll post soon, KVM will save and restore ACCDATA_EL1 only for
the guest, since nothing in the host uses it today. So after KVM_RUN
returns from a guest that has LS64_ACCDATA, the VMM thread's next
ST64BV0 would use the guest's value, unless KVM also saves and
restores the host's.

[...]
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
[...]
> +static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
[...]
> +        isar1 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
> +        if (!(isar1 & ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA))
> +                return false;

v2 will add an ARM64_HAS_LS64_ACCDATA cpucap, so this could test that
instead. As written it tests bits [1:0] of the register, not the LS64
field, since ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA is the unshifted field
value.

> +
> +        sysreg_clear_set(accdata_el1, ACCDATA_EL1_ACCDATA, pasid);
> +        sctlr = current->thread.sctlr_user;
> +        sctlr |= SCTLR_EL1_EnAS0;
> +        current->thread.sctlr_user = sctlr;
> +        update_sctlr_el1(sctlr);

On a host that runs at EL1 (nVHE or hVHE), this also requires
__init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
__init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
access traps to EL2 and the hypervisor panics, and so does ST64BV0
once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
once you're ready to post this.

Cheers,
/fuad
