Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB773D45FE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793261; cv=none; b=gayIvrK8WdCOiegaM0hOuXGvpZ8NTW5WTTkzInpUMMxe7iTQ+hM2Vp3JDzwnKu9q30xh/im6ka73ylOBi6AYEGWwP8ZfgjmGelVzDDwF/knVLCL9vf7MlRdli7hjSsEsK+EzL+otq25e+kOjV9o8/6kqQziFQsQOF95EkOrdKPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793261; c=relaxed/simple;
	bh=QcowYgHg1stdCSQfW5uvl342qY1YTkTKVOYG3q+X/LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dh7tWBE1JiUKS9dB7CXSe5CRebHh0/79OcHwFIh73wA7nhu3Ibkn8xAkP8AwgNcT5LYIvNiGQINapIcKllzHQ8NZnnbrSTNAaZLF/m7/O2EzkuKNS0fc06zZaWirIDN7ymlUxYYZYZyQM6/E96ilDdJY20I9hpovEfxKxEW4As0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZgWzVboh; arc=none smtp.client-ip=95.215.58.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZgWzVboh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QcowYgHg1stdCSQfW5uvl342qY1YTkTKVOYG3q+X/LA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788793256; v=1; x=1789398056;
 b=ZgWzVbohDs+gxPU4K0CBmaQBL+GQFg8QD6K4c8pxGOiF6dXMucpVDi+KipqOaW8uzqpRLt3L
 7grIyrBKylHBeZ9a6h6F7dO61UUfMhhChdupccO5CwvCJ0HbKwUFy1ZA6uuh6CaEp2/ZjRw5Tjt
 JwfvA1ilnyEDTpSsdJU9/v/Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f496bc84f3e7b89;
	Mon, 07 Sep 2026 15:00:56 +0000
X-Mizu-Trace-ID: 8f496bc84f3e7b89
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so7237e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJzBaxZCKA0v3XRF7oBVAIfLPse4xmVq8eJ2mylEWrdY1Eo11NBPN6pA2cb0X2Fe5HvheBX5VtlbhOcqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l83pXObHEgbswmGF3wUbTzk8F25Ga64drnytdTeDXbkXOCXxkX
	0r805sC/0NCDO2vrHLNjFg3N+8/odrNczAi0zoFrVsUqpmCVUxVcHibDmZVjGFfioT1nKIXJlMf
	1XWsylb0LL6Uy/tCW16yiwvvVj3W9ZfNE/6Ds9HVg
X-Received: by 2002:a05:6512:404e:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5b74d165f8dmr137113e87.4.1788793254747; Mon, 07 Sep 2026
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903160819.831518-1-fuad.tabba@linux.dev> <dd850141-ea85-4d94-9793-393f24a2fdc2@arm.com>
 <CA+EHjTyuLKYE1UL4XYvq4rxW7fgFNafdTY8H0=Qt6Hnjz3wYvQ@mail.gmail.com>
In-Reply-To: <CA+EHjTyuLKYE1UL4XYvq4rxW7fgFNafdTY8H0=Qt6Hnjz3wYvQ@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 16:00:18 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzZovYDUeoEryhdmP1bvqJyEDmOoPtT7PEDvS2y5puXYA@mail.gmail.com>
X-Gm-Features: AcwNN1WaHeN-nK-ulxfreEuvGSet8O5t_UcGB-1xSv-8c4JTx1aZoVFo9X9tJwc
Message-ID: <CA+EHjTzZovYDUeoEryhdmP1bvqJyEDmOoPtT7PEDvS2y5puXYA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

I built the respin first, and it didn't hold up.

On Mon, 7 Sept 2026 at 11:28, Fuad Tabba <fuad.tabba@linux.dev> wrote:
...
> This patch misses that case. check_override reads the CPU's own ID
> registers, detect_ftr_has_mpam() the sanitised ones, so
> finalise_el2_state clears the traps and neither cap is set.
>
> Not advertising MPAM already happens, since a mismatch lowers the ID
> field to 0. The trap default is the missing half, and I agree it
> belongs in finalise_el2_state, which already computes whether
> MPAM2_EL2 can be touched. KVM then needs only system_supports_mpam(),
> and the cap goes.

finalise_el2_state can't set that default. Under nVHE and hVHE the
host is the trapped party, and cpufeature reads MPAMIDR_EL1 and
MPAM1_EL1 from EL1 before KVM exists, so the only way out is to stop
the host detecting MPAM.

> The one host left is a forced nVHE, where test_has_mpam()'s MPAM1_EL1
> read would trap before cpu_enable_mpam(). The respin makes the caps
> false when is_hyp_nvhe(), so MPAM is off there rather than the boot
> hanging [1].

is_hyp_nvhe() is true on an hVHE host too, since
is_kernel_in_hyp_mode() reads CurrentEL. So that turns MPAM off for
every pKVM host on VHE hardware, not for a forced-nVHE corner. On the
AEM FVP with MPAM, a host booted kvm-arm.mode=protected detects MPAM
without the change and not with it.

> I'll respin along those lines.

Not along those lines :) I think that v2 would be v1 with a clearer
commit message, keeping both predicates. Merging them would give
resctrl the wrong answer, since it needs firmware to have enabled MPAM
where KVM's trapping needs only that the registers are implemented.

The mismatched machine stays uncovered, with this patch at least.
Closing it means deciding per CPU at EL2 from the CPU's own registers
rather than from a system-wide cap.

Cheers,
/fuad

> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/apqrky27mJmUV9UA@willie-the-truck/
>
>
> >
> > Thanks,
> >
> > Ben
> >
> >
> > > +
> > >  static inline bool system_supports_pmuv3(void)
> > >  {
> > >       return cpus_have_final_cap(ARM64_HAS_PMUV3);
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index 17b83a2518a8f..36a27692e5cf7 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -2501,6 +2501,13 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
> > >       return (read_sysreg_s(SYS_MPAM1_EL1) & MPAM1_EL1_MPAMEN);
> > >  }
> > >
> > > +static bool
> > > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > > +{
> > > +     /* The registers exist whether or not firmware enabled MPAM. */
> > > +     return detect_ftr_has_mpam();
> > > +}
> > > +
> > >  static void
> > >  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
> > >  {
> > > @@ -3116,6 +3123,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> > >               .matches = test_has_mpam,
> > >               .cpu_enable = cpu_enable_mpam,
> > >       },
> > > +     {
> > > +             .desc = "Memory Partitioning And Monitoring system registers",
> > > +             .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > > +             .capability = ARM64_MPAM_SYSREGS,
> > > +             .matches = test_has_mpam_sysregs,
> > > +     },
> > >       {
> > >               .desc = "Memory Partitioning And Monitoring Virtualisation",
> > >               .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > index 1ce7130e25490..8941335724f6b 100644
> > > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > @@ -298,7 +298,7 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
> > >       u64 clr = MPAM2_EL2_EnMPAMSM;
> > >       u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
> > >
> > > -     if (!system_supports_mpam())
> > > +     if (!system_supports_mpam_sysregs())
> > >               return;
> > >
> > >       /* trap guest access to MPAMIDR_EL1 */
> > > @@ -317,7 +317,7 @@ static inline void __deactivate_traps_mpam(void)
> > >       u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
> > >       u64 set = MPAM2_EL2_EnMPAMSM;
> > >
> > > -     if (!system_supports_mpam())
> > > +     if (!system_supports_mpam_sysregs())
> > >               return;
> > >
> > >       sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
> > > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > > index 2775ba3359cfe..aa5be51385f68 100644
> > > --- a/arch/arm64/tools/cpucaps
> > > +++ b/arch/arm64/tools/cpucaps
> > > @@ -78,6 +78,7 @@ KVM_PROTECTED_MODE
> > >  MISMATCHED_CACHE_TYPE
> > >  MPAM
> > >  MPAM_HCR
> > > +MPAM_SYSREGS
> > >  MTE
> > >  MTE_ASYMM
> > >  MTE_FAR
> > >
> > > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> >
