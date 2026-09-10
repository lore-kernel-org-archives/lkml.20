Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C3400DF9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034812; cv=none; b=aBOpTiYAtTDYlAe5LeYxiVRANb96mdSHzUpd9OqyJ47+xc1T2OGzmG2DwfNF6F3bguqGt4aXfXmIgo4XEXorZR2fP10TQMSKBxrBUv/OGWsvAabjRgyGqnCMpu1NfW6OEhQ4clBFiY9hwLx1811W/eO+Cf2kQ6tl2z2HdN+Hs+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034812; c=relaxed/simple;
	bh=hWyyIPpkRyZSi+QGoc95ooHUu2TShOPQbYuZu1dbcAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3ciTCtU57bGO6/Cz14YeQ0gxi/G/x16LVKnl36xTbEyI+EIcLW/jAXo38aDNHpBOVwQbK5JflOqfZpZU1ql0ExD8fGZwnNrpmaLeohBihyyr0XUo/NXtQNZADd2O0vB31jJym/C8vD+o8ozpMwWfLzykCTrbXkRgJz4De7cpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aI6a9yT/; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aI6a9yT/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hWyyIPpkRyZSi+QGoc95ooHUu2TShOPQbYuZu1dbcAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789034797; v=1; x=1789639597;
 b=aI6a9yT/mwM8pHxwhOg397vX0+7IokM9Q//veo1jcGh0dGKMV91H/xgCEPZ7b/AQgjQZBWwb
 vtJYhXOcvIsv9Fn8avnQRFaod9HiE0seyHLmtP5k/LD5cMPb3mX5JMpaqpMhf24FC6WHCZN2Yy3
 pnm2rEOi2otpDknSiYXjPTm8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 548940a8c44e91f6;
	Thu, 10 Sep 2026 10:06:37 +0000
X-Mizu-Trace-ID: 548940a8c44e91f6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so4637e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeJnOdANQw30nR66HqvFF3002IjApopo+wLOEuOTDfDSPT3GOOT5NRkt/L8Xb+r7ld9JoqaG0TNz2ta8A=@vger.kernel.org
X-Gm-Message-State: AFuF++lcNkTjvw1KAZ8raOw6FQoRli/EZ7VIzOUlSsxdTyMGEf37zZ1L
	GEuRr6+b0zwc3N9X9aKkLiwW6to8SLNN4lvG8pq3OmgazO5KOMB7vsEZ7m9i9Mz7Iy+SYcLzPVM
	k945xyCm5IAFJnqLIatLYBKRCyT5dN94I9T5HwTke
X-Received: by 2002:a05:6512:3b8a:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b89af4742bmr71415e87.11.1789034792251; Thu, 10 Sep 2026
 03:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-7-fuad.tabba@linux.dev> <aqFkFF1ebFSHZLEN@e143914.arm.com>
In-Reply-To: <aqFkFF1ebFSHZLEN@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 10 Sep 2026 11:05:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxm8BHL0gcERu7kKZo6CWgp0xrENUmvNCdX58dEMjTfoA@mail.gmail.com>
X-Gm-Features: AcwNN1WwBnHkFkL_PATYeQPzioeKMpAU6X46R6QBkykiNFCQ6kdeLHVErrpdvBM
Message-ID: <CA+EHjTxm8BHL0gcERu7kKZo6CWgp0xrENUmvNCdX58dEMjTfoA@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] KVM: arm64: Add system register reset framework
 for protected VMs
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joey,

On Wed, 9 Sept 2026 at 14:51, Joey Gouly <joey.gouly@arm.com> wrote:
>
> Hi Fuad,
>
> On Mon, Sep 07, 2026 at 07:59:51AM +0100, Fuad Tabba wrote:
> > Add kvm_reset_pvm_sys_regs() and the pvm_sys_reg_reset_vals[] table
> > that drives it, and call it from init_pkvm_hyp_vcpu() for protected
> > vCPUs. The table holds the registers sys_regs.c resets that
> > __sysreg_restore_state_nvhe() loads for a protected vCPU. The rest of
> > the context keeps the zero the donated hyp vCPU page is cleared to. A
>
> If the context is zero'd, why is there RESET_ZERO()? If it's just for
> 'completeness', worth noting here.

I'll answer your question with part of the updated commit message for V3:

    A register that resets to 0 still needs an entry: a later patch calls
    kvm_reset_pvm_sys_regs() again for PSCI CPU_ON at EL2, on a context
    that has run.

>
> > poison value stands in where sys_regs.c resets to UNKNOWN, and for
> > VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it uses. MPIDR_EL1 is
> > derived from vcpu_id, as for any KVM guest. AMAIR_EL1 resets to 0
> > where sys_regs.c reads the hardware: the host writes it freely before
> > the hypercall, and it's loaded on every guest entry.
>
> Also if you can just put a new line for each 'category' here would make
> it simpler to read.

Done for V3.

>
> >
> > Until the per-EC marshalling patch removes the host's full-context
> > copy from flush_hyp_vcpu(), that copy overwrites these values on every
> > entry, so this patch has no observable effect on its own.
>
> Thanks for adding this!

Thank you for your reviews. They've been very helpful!

Cheers,
/fuad

>
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 ++
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 73 ++++++++++++++++++++++++--
> >  3 files changed, 75 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index 49a0a992047ba..a04b7c04d5135 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -95,6 +95,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> > +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
> >  int kvm_check_pvm_sysreg_table(void);
> >
> >  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index e85f13233da08..af334318d0a03 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -551,6 +551,11 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >               goto done;
> >
> >       ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
> > +     if (ret)
> > +             goto done;
> > +
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> >  done:
> >       if (ret)
> >               unpin_host_vcpu(host_vcpu);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 8758c68017765..03d2c2447e0fd 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -525,6 +525,66 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
> >       /* Performance Monitoring Registers are restricted. */
> >  };
> >
> > +struct sys_reg_desc_reset {
> > +     int reg;
> > +     void (*reset)(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *rd);
> > +     u64 value;
> > +};
> > +
> > +static void reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, kvm_calculate_mpidr(vcpu));
> > +}
> > +
> > +static void reset_value(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, r->value);
> > +}
> > +
> > +#define RESET_VAL(REG, RESET_VAL) {  REG, reset_value, RESET_VAL }
> > +
> > +#define RESET_ZERO(REG) RESET_VAL(REG, 0)
> > +
> > +#define RESET_UNKNOWN(REG) RESET_VAL(REG, 0x1de7ec7edbadc0deULL)
> > +
> > +#define RESET_FUNC(REG, RESET_FUNC) {  REG, RESET_FUNC, 0 }
> > +
> > +/* Sorted ascending by reg; kvm_check_pvm_sysreg_table() enforces it. */
> > +static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
> > +     RESET_FUNC(MPIDR_EL1, reset_mpidr),
> > +     RESET_UNKNOWN(TPIDR_EL0),
> > +     RESET_UNKNOWN(TPIDRRO_EL0),
> > +     RESET_UNKNOWN(TPIDR_EL1),
> > +     RESET_ZERO(CNTKCTL_EL1),
> > +     RESET_UNKNOWN(PAR_EL1),
> > +     RESET_ZERO(DISR_EL1),
> > +     RESET_ZERO(CPACR_EL1),
> > +     RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
> > +     RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
> > +     RESET_ZERO(TCR_EL1),
> > +     RESET_UNKNOWN(AFSR0_EL1),
> > +     RESET_UNKNOWN(AFSR1_EL1),
> > +     RESET_UNKNOWN(ESR_EL1),
> > +     RESET_UNKNOWN(MAIR_EL1),
> > +     RESET_ZERO(AMAIR_EL1),
> > +     RESET_ZERO(MDSCR_EL1),
> > +     RESET_UNKNOWN(TTBR0_EL1),
> > +     RESET_UNKNOWN(TTBR1_EL1),
> > +     RESET_UNKNOWN(FAR_EL1),
> > +     RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
> > +};
> > +
> > +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
> > +{
> > +     unsigned long i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> > +             const struct sys_reg_desc_reset *r = &pvm_sys_reg_reset_vals[i];
> > +
> > +             r->reset(vcpu, r);
> > +     }
> > +}
> > +
> >  /*
> >   * Initializes feature registers for protected vms.
> >   */
> > @@ -550,16 +610,21 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
> >  }
> >
> >  /*
> > - * Checks that the sysreg table is unique and in-order.
> > - *
> > - * Returns 0 if the table is consistent, or 1 otherwise.
> > + * Both tables must be unique and sorted ascending. pvm_sys_reg_descs.reg is the
> > + * sys_reg() encoding, pvm_sys_reg_reset_vals.reg the vcpu_sysreg index, so they
> > + * compare differently. BUG_ON() at __pkvm_init: fatal at boot.
> >   */
> >  int kvm_check_pvm_sysreg_table(void)
> >  {
> >       unsigned int i;
> >
> >       for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_descs); i++) {
> > -             if (cmp_sys_reg(&pvm_sys_reg_descs[i-1], &pvm_sys_reg_descs[i]) >= 0)
> > +             if (cmp_sys_reg(&pvm_sys_reg_descs[i - 1], &pvm_sys_reg_descs[i]) >= 0)
> > +                     return 1;
> > +     }
> > +
> > +     for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> > +             if (pvm_sys_reg_reset_vals[i - 1].reg >= pvm_sys_reg_reset_vals[i].reg)
> >                       return 1;
> >       }
> >
>
> Some minor commit message nits, and I see you're going to remove this
> sorting check.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
>
> Thanks,
> Joey
