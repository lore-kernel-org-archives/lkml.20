Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6239CD11
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385411; cv=pass; b=XRLL3QxYIAo/9QgI9UYDLxGCeh0V60O2zBlZa3QLUGK4DwFOLolXiI2jVm/IuuoO0k9hXZ7DmqMA8vfD6MZqwZs/h0yroCzJd4NMB8ntAZMjlXiL1xHJ189e4pJixWgXk1phiDWaf45LQAjz5JlqdGMzsPqM9dPMKl3LPsyXgqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385411; c=relaxed/simple;
	bh=iIJ9VRV62J828IXH+cZGzWJDkR65fWoXDHscgCTYQdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukX3exphsHBFJru2Abr8fTu/q3RzknjNoVHytSbn/h2got/rVCHiyzK/zf5gpb3aD1rJ1CN0vFcSw12YYnvM9+wY1nqrCWAGffjrPaCOtZ+gMdVB3JGAgGd/gyQawhpQcI2s/yp7QOJDwJ09dolx4gkToVfUKdWM0CfxndyH/n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZfR9y8o/; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZfR9y8o/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so63351366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788385385; cv=none;
        d=google.com; s=arc-20260327;
        b=a+0VyT8E38oXeHcCOhG7ACuytaTlbIMKaCKeyJfQeIArq/6yWxWfoNskYcSjeyZe6B
         AFMeR5n++A5gD61+QeOk21cXqBIE1mc0GHjjc5lSL5j3Txqta7p9H9iBCmh5Co7Nwhmc
         eFNH3Onm+kNtIpjvrC2a1dDMHnTszynPKfeSikpw4tuel5UaMahnWY+BJfCRXJjfJJb7
         PmzQxyObvfw1VBVLDUolbI9jngn/Vn2sWCNyHM1i9foli8gTTlnxOvgI5DGQMEFg7ufa
         b20ylY+XImI1aeLBIQnkViwyVzH2KsO6Gbg43X2n8XttyKJh9UeYI+G8jEnWyWMCd6wL
         poBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AVzqU+HWsj+X0U1337zklumQ6o5zEX9OVb8vnO7RrHs=;
        fh=oldwzqcK73LPjTC7RxZHw81+M5NPJgwsXU5rKdhiOM8=;
        b=XVcxakzoIrdx1g/DdiLvpEGR0zqmW2Z0doFHu2pHYHXZ0hTXkjE4jiaILx89vOv188
         iOqix3VRYMp5ylprcRuc4a+SVuclT/Z1Yva299OVqxur386MAWNdiFcv6ekp6fzlV1ix
         KYMdbrttcxc4L8X6qaSm+Zv4RFqTEwIf2TkH5SM/chCG2/8sOue+SLVy0aV8uJlsG+uj
         mWKd5b3aY3c/bUQG7pGGCS7bzlQjjuExI9iTs+fJBdG4Qaot4E8XZVo2rUL0dkEzGYHv
         69s7uvQUJDYj4RpeaSl0RHiJ0b9yDcjnSBJ1HQnc0ldWgelJItqSzXlePoRju4M6weUo
         V3fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788385385; x=1788990185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AVzqU+HWsj+X0U1337zklumQ6o5zEX9OVb8vnO7RrHs=;
        b=ZfR9y8o/I8pZRHU8EMHmG9tqe4vWbLuzIsSRcYoJ2/vx9dITSCMFQ/uLqej0h4+LNb
         8UBUe8hsHEmTD+EFrkNPXLc0FI1qbx0E4jZW1/Efp/1CiHT4ny6ld/y3vuHNHDbvexVx
         KUn7TvPUJWF0W5JTNlEAl64QGw+rHJQIlSyS/3IRaBljxMLNtuFnXI23yZT33VXGMq95
         SN0uxCAtdhRXhoEAK9fY22xhB6KvTHuHJ3VK0Ky6o854zqdyl9Us4ebjLia0bjN+pX09
         eoJOj7rgiLP7wLXTMVKfwwmWg+Kqs2bJNFdabVB9b6VI6f2IoAWqbVv3PMrDuDAQzOVA
         FWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385385; x=1788990185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVzqU+HWsj+X0U1337zklumQ6o5zEX9OVb8vnO7RrHs=;
        b=KILbL6b69yyNVSCAxticeHHtPToXUylz7P9xb9HPFsIrosygBETrTf2b8DbmS1gR7j
         nCYG50Y+qrmpjt/wak0bigyqyAVuxkVxZIurB/sIAI5o4YASSU1spLI3W6fsIIuChx/B
         erV3IWkH/B5yiT411LRNLr/PpQpfkX0ZkShgAGJMLr043AvKpjoxjFPGKXbtCUnDCUjd
         t60H+SjfQPyGiN+x9nZkmzyhhsQ4RZ8o0UDWUOyvG7tvf79gCzqs8bpOn8jUSte8mkXn
         GyInpYe4U24IS0zcmo4GCB81SMrK3qniwqhbO2/dTsotY1WEWRFrk/y/FEB/H0/B8kIq
         4ZVw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ4IA9sACajbinA/PgaSvBU6+KT7dP2Qat+4WyelnxbQx0UE0ds55WimY50juVuJ8BkBfHefitxlPzGiY=@vger.kernel.org
X-Gm-Message-State: AFuF++m38kPPeBNAsUhHGpFydumfomuv7+QCqzyfo2MI9uofIMF9zuEh
	05TiMgYGTgSrN7P8HnfkBi34uGoPBGV8S1rHlXeZ5pD2CyKoZ1nKR5++Myt5lUp442FYyPt+VKj
	3PojP/+3EqMsFkTe0vYdZVxxM5Okjyr7cyOm/VST9
X-Gm-Gg: AYBFou3tZhF4cmDi8MfnnWCCXPPZ//klTQ0bOLW22huq1xOBZ04gqAP6dJAd3U5MeAe
	6J2tObrdjI2laQoMVQD9IlNXJcrchCS9XUHULXnsLsNqtmORMSQS82vd3hGSxc3/h1WS49G3qPJ
	X8Uh6gTZJt96Ti13c6zntdsvoCjXkIDerrEexWoaNUxRfEQX2XfD/eV29ZaD9AU71Mg0drhBfR0
	xai6aygPrYKoLLmIF/tfbslT4/3jIrRSN3yCW79OaJMH6X7eU2uI3WmAkADEjXNL6/Kpqb+Cagz
	Gm0jr4WXZI9WU++IU/Mt4RT78t7MBDS2JD8UqMfi/RiOxmI59E/ezX6Ej8K5076tfOM37dJ5szU
	qNQy74R0Eb1BvCYhvY08Y+avneMlb+mGzgFt5N5z0vxxoBC9Q47RkymRHgaNGCtcI5UGYRLgTKA
	XRP7ddabCaJjsi
X-Received: by 2002:a17:907:6ea0:b0:c24:d6f0:aa0 with SMTP id
 a640c23a62f3a-c25f009ff4cmr130511666b.11.1788385384963; Wed, 02 Sep 2026
 14:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902211759.2700289-1-seanjc@google.com>
In-Reply-To: <20260902211759.2700289-1-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 2 Sep 2026 14:42:27 -0700
X-Gm-Features: AcwNN1VeO8TYciymngnBsSlPYiBdyLGjyWdU872Dzb37acgJe2Y965PvjiSGM8o
Message-ID: <CADrL8HULbB2HUSOJ0ivZnkz7V4Ok_jgDQk3hAc0tR6NKHp+6-g@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/mmu: Always guard rmaps with mmu_lock on
 PREEMPT_RT=y kernels
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:29=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> For all intents and purposes, revert KVM's ability to walk rmaps outside =
of
> mmu_lock when running on a realtime (PREEMPT_RT=3Dy) kernel.  I.e. don't =
use
> a non-sleepable bit-spinlock to protect rmap entries, as realtime kernels
> are highly unlikely to benefit from increased aging throughput and reduce=
d
> jitter for memory-overcommitted nested VMs, whereas using a non-sleepable
> lock is currently buggy and goes against the spirit of realtime kernels.
>
> Because KVM's rmap locks are hand-crafted bit-spinlocks, preemption must =
be
> disabled before acquiring the lock, otherwise a preempted lock holder wil=
l
> result in all other walkers of the locked rmap to spin and wait, with no
> tracked owner for PI to boost.  For non-RT kernels, acquiring mmu_lock
> suffices, as mmu_lock is a non-sleepable rwlock.  But on RT, where mmu_lo=
ck
> becomes sleepable, preemption is left enabled for rmap writers:
>
>   WARNING: arch/x86/kvm/mmu/mmu.c:920 at __kvm_rmap_lock+0x1a7/0x1e0 [kvm=
], CPU#16: vmx_apic_update/3708
>   CPU: 16 UID: 0 PID: 3708 Comm: vmx_apic_update Not tainted 7.2.0-rc7 #5=
2 PREEMPT_{RT,LAZY}
>   RIP: 0010:__kvm_rmap_lock+0x1a7/0x1e0 [kvm]
>   Call Trace:
>    pte_list_add+0x67/0x4d0 [kvm]
>    __link_shadow_page+0x249/0x480 [kvm]
>    ept_fetch+0x4d5/0x1220 [kvm]
>    ept_page_fault+0x60b/0x850 [kvm]
>    kvm_mmu_do_page_fault+0x252/0x690 [kvm]
>
> Alternatively, KVM could manually disable preemption when grabbing an rma=
p
> lock, but as above, that isn't what RT kernels generally want, and it's
> actually more complex to implement (cleanly).
>
> To not completely lose the scaling advantage of per-rmap locks, take
> mmu_lock for read in the aging path, i.e. allow multiple concurrent aging
> tasks, as the aging code needs to use atomic SPTE accesses no matter what=
,
> i.e. no extra code/work is required to guard against concurrent aging of
> SPTEs.
>
> Reported-by: David Woodhouse <dwmw2@infradead.org>
> Closes: https://lore.kernel.org/all/8d47b43e1829ac92703723e6a1a4afc7a2eaa=
cb5.camel@infradead.org
> Fixes: 4834eaded91e ("KVM: x86/mmu: Add infrastructure to allow walking r=
maps outside of mmu_lock")
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks, Sean. A small comment below. Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  arch/x86/kvm/mmu/mmu.c | 39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 064ecc33b926..5bf833550f84 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -895,6 +895,7 @@ static struct kvm_memory_slot *gfn_to_memslot_dirty_b=
itmap(struct kvm_vcpu *vcpu
>   */
>  #define KVM_RMAP_MANY  BIT(0)
>
> +#ifndef CONFIG_PREEMPT_RT
>  /*
>   * rmaps and PTE lists are mostly protected by mmu_lock (the shadow MMU =
always
>   * operates with mmu_lock held for write), but rmaps can be walked witho=
ut
> @@ -1008,7 +1009,8 @@ static unsigned long kvm_rmap_get(struct kvm_rmap_h=
ead *rmap_head)
>   * actual locking is the same, but the caller is disallowed from modifyi=
ng the
>   * rmap, and so the unlock flow is a nop if the rmap is/was empty.
>   */
> -static unsigned long kvm_rmap_lock_readonly(struct kvm_rmap_head *rmap_h=
ead)
> +static unsigned long kvm_rmap_lock_readonly(struct kvm *kvm,
> +                                           struct kvm_rmap_head *rmap_he=
ad)
>  {
>         unsigned long rmap_val;
>
> @@ -1032,6 +1034,35 @@ static void kvm_rmap_unlock_readonly(struct kvm_rm=
ap_head *rmap_head,
>         __kvm_rmap_unlock(rmap_head, old_val);
>         preempt_enable();
>  }
> +#else
> +static unsigned long kvm_rmap_get(struct kvm_rmap_head *rmap_head)
> +{
> +       return atomic_long_read(&rmap_head->val);
> +}
> +static unsigned long kvm_rmap_lock(struct kvm *kvm,
> +                                  struct kvm_rmap_head *rmap_head)
> +{
> +       lockdep_assert_held_write(&kvm->mmu_lock);
> +       return kvm_rmap_get(rmap_head);
> +}
> +
> +static void kvm_rmap_unlock(struct kvm *kvm,
> +                           struct kvm_rmap_head *rmap_head,
> +                           unsigned long new_val)
> +{
> +       atomic_long_set_release(&rmap_head->val, new_val);
> +}
> +
> +static unsigned long kvm_rmap_lock_readonly(struct kvm *kvm,
> +                                           struct kvm_rmap_head *rmap_he=
ad)
> +{
> +       lockdep_assert_held_read(&kvm->mmu_lock);
> +       return kvm_rmap_get(rmap_head);
> +}
> +
> +static void kvm_rmap_unlock_readonly(struct kvm_rmap_head *rmap_head,
> +                                    unsigned long old_val) { }
> +#endif
>
>  /*
>   * Returns the number of pointers in the rmap chain, not counting the ne=
w one.
> @@ -1745,11 +1776,15 @@ static bool kvm_rmap_age_gfn_range(struct kvm *kv=
m,
>         gfn_t gfn;
>         int level;
>
> +#ifdef CONFIG_PREEMPT_RT
> +       guard(read_lock)(&kvm->mmu_lock);
> +#endif

Future me would be happier if there were a comment here. :)

Also, how about BUILD_BUG_ON(!CONFIG_KVM_MMU_LOCKLESS_AGING)?

> +
>         for (level =3D PG_LEVEL_4K; level <=3D KVM_MAX_HUGEPAGE_LEVEL; le=
vel++) {
>                 for (gfn =3D range->start; gfn < range->end;
>                      gfn +=3D KVM_PAGES_PER_HPAGE(level)) {
>                         rmap_head =3D gfn_to_rmap(gfn, level, range->slot=
);
> -                       rmap_val =3D kvm_rmap_lock_readonly(rmap_head);
> +                       rmap_val =3D kvm_rmap_lock_readonly(kvm, rmap_hea=
d);
>
>                         for_each_rmap_spte_lockless(rmap_val, &iter, spte=
p, old_spte) {
>                                 if (!is_accessed_spte(old_spte))
>
> base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
> --
> 2.55.0.970.g62bdec98f9-goog
>
>
