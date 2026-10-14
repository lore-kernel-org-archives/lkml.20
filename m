Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA440756E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002191; cv=pass; b=otm6GiYcOmtcvdHV9ALw/q9BZdMcJ5VDEWy+AAK/j1mOy4r0xR299FqWZl8XgLDgQp0cv0z08iuH7psxB0wnnYRAzMe3YfQSDeGlPfid7ZLuJ59ofW0dihjj3C2SL1n/pfEQgwo2mCT9hxyH1WfpGEwgbj+nwvuofGajfRhSdK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002191; c=relaxed/simple;
	bh=daC6Np6jItX8zMXhvHljrTUGGtEHMDpaRWwp+FcyC8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyftHye0uQ9x4Db2vvzgXG8FVpa8ckqFUyE+pskXfUn6dGtpo/a1OurfEVLHDUm3IupPNYE+KCTIkxb/vJyCgZoY/aKZhHTMZUT0a0YsvLLGHjEIi8Nw45st7qBC9hD+zj/0ow5ftzBqEM8vC5neyEXSUYcyHLyru7ni6NJJ8wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=incjS1a2; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="incjS1a2"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso44320a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792002188; cv=none;
        d=google.com; s=arc-20260327;
        b=ltOTZJ41+uAPKQB6jqr9f/kx4b64WrycpyUOEoWGacxqB0pXPog7rtezQ2yjhewRvg
         IDk+X62jrYamlUWfGvZncwg0VzBazIqljDc9ik/upWmmoY8ONmaXs+m1NAyTuLb7tX0m
         KABw4lpyPVcShq5QIpca6s1ocXRzlooVznrQcH0OPF2kL1rqnTMkDW+ZrHTzJy8BncoP
         TyHsOtbfmVyZr9CM0IRYjAJZ/aiPxEaEFb9qfdJZ9tjz1QtwIdvIrxSdNWL4IQ+keYPQ
         KYE+CDPNMaO0/ilfZaLIeLEsrHpZ2HFiTJ46qLc+62/sOXves6SSVXqGaoTIL3xIAGBB
         WckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3cIDC3M1HgJGR6Kt8HLb6Rz3q+5uL2WMcMIITpCwQMU=;
        fh=HkDMdxF6HIOAC6/440YREfEeFIPLLwgNB/UbCs4w2F0=;
        b=KuMbCQLVT5G4EnP6t8haVv3FPNPI6S0tWjbLl0ZsxIyb+fNhx/zo6qU4U16ul+xZn+
         bN+loR09QpMFCWhgs0fWelGRoqoGF/BFcbt6k/SRdKrYU/wj8AxhHZEjxiFBv5RSJuX+
         iqQyeYeqKpqRHjH3JIjrAgF/mPeaS799wNnyMvd60bD7/LQrqKEzxaA+9gd0Cmw2vtUc
         LE+AePZDNxAZP3VkzL1gCpMTW56/NKUczgbCdETFygdjk5s4i3IEaiGdTAaFJu8L/ohS
         QYoy+xj7LpckiW6RZtrNbn9J96cD752pZ7d7l6i+b0hhiMfQ3mfs8PHnrChpf7q18yH6
         /row==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792002188; x=1792606988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3cIDC3M1HgJGR6Kt8HLb6Rz3q+5uL2WMcMIITpCwQMU=;
        b=incjS1a267HQlQbT37P51deaIfHJf8JYZjPX5DsWTRbpLkJRfhonQH+pOBNNabTi3s
         Y7fuuJ4Ilp55+41tjMX+YxKpcY033qUaC1VyRL73dCTXGxxVHneuAIUWiEz4Hs8rdIPq
         o1u2oGGFOTbLhq1nFe52CerUNc6mC7WHNxMUelwgXb3Xan0xNMXu4EVbpn03qqAb+MfZ
         snIgE59LlWTUid/FhCpwQjtzEW8SGh5Y3tnPaweCEe0reTY1uqv46wG4/l3FLp+NGmwR
         2hQItU5V+R4baabQfEaFu/INpK/V9QDIju9yM/T6jKkCMMlg8TAQiAXnixNorgSfQohg
         TYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002188; x=1792606988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cIDC3M1HgJGR6Kt8HLb6Rz3q+5uL2WMcMIITpCwQMU=;
        b=Dus9azKCeFAwV88zMVP/p5FSDjN0NpnjAngVSTQ45dKb5UIqn+9P4+OQ88tRZ45MpO
         NjNWG7H31IqpjoUjHOUBQtapNeZo+1iFo39De9PsI8/wcCU7bKoU+l46v7kCMzWLGV/a
         r/xyM1ZPVoGO5Nbuhspc3pwlh76mNdDoLInNSL6gZonO05oau0qx668chKcy2IWa7l2c
         ql/9IHBfFbZ8nM8XWpm/k5kzaX21HijkCBYZIXRxTvBPagPJ+ubui0OW1UFU5q046fAI
         m8oizA74BlOOc3H+pUwB/KhpEmrlMhC9rj/gBULOo1EVPMup78EoEKBXX9Ibdwjh2Wla
         6BZw==
X-Forwarded-Encrypted: i=1; AKwUvByYRM19UHY83yAJdfyXlCO2YSnGnFRGpIJgHoNBhjlpbV8hiEkhlreBnj2otbMDDdaFmIdpudqXmxEobNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHqtluVhhSmsYUZ0gXuKJuevHPfik8nN2f09zO5Ji+D6uk53zh
	aA1KhAKY2OsOzkEa1inbSzoCXN7tKvohimzkWHW3nw3fDBUwembTvQofqfwzZgF0N/wr8ap7mKw
	81zd/uc8676llrqVofnuEyiBQEuOjgj25Zulenj2P
X-Gm-Gg: AYBFou1aMc3M1fl5foFTTzXMubkW/Lx1zwxHeFOXeblr/CJ8/Hq6AHaaeLa5nEXotHh
	vK9hPXH8Hy5rps26L6zKnZ/+C5HTuL4mtcLw1LrBNp14rdk0t6Ln/E6ogK6Gy/tD5jAEeDHLkwr
	1BhyOnmRDuTmkHwAs5ZnsJLfG/Z3VF67cF/V0fB+50lARi1zbAEbP7TbiJORwTecyRtR3wDe8Ue
	5CpCuZ7DxBQ7bS12UYU5Y465daMtrWEoWjA259lEDrfeBmZHJrbSmecVzAEzzAy2lwOm+TM6LOU
	fUG0RHv7y5XkDDO6XVyDhGgJ7cvdyFquFVOT8c7P0Ygh7UCW27osKlY=
X-Received: by 2002:a05:6402:3041:10b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6b2095cb26bmr60699a12.1.1792002187767; Wed, 14 Oct 2026
 11:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-4-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-4-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 11:22:53 -0700
X-Gm-Features: AclHuK_dYKWxgMdHL-LfYRKVT3UfIDrazaPSYDC3-1DeyQV983cJnvDOicujLDg
Message-ID: <CALMp9eT9xOFKSFnOg5OeXgmXV0pr-4-yJdBFFMORPx22BgHnHw@mail.gmail.com>
Subject: Re: [PATCH v3 03/27] KVM: VMX: Generalize VPID allocation to be vendor-neutral
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> In preparation for sharing with SVM, generalize the VMX VPID allocation
> code and move it to common code as a TLB tags allocator. Parameterize
> the TLB tags allocator by the number of tags, and allocate the bitmap
> dynamically. Opportunisitcally use guards to acquire the lock instead of

s/Opportunisitcally/Opportunistically/

> spin_{lock/unlock}().
>
> Keep the number of allowed tags capped at VMX's hardware cap, to avoid
> allocating a huge bitmap if L0 advertises a huge number of ASIDs to an
> L1 KVM. Realistically, the number of actual hardware ASIDs wouldn't be
> that large so there is no benefit.
>
> Initialize the TLB tags allocator during hardware setup/unsetup, and
> reserve tag=3D0 during initialziation, similar to how VPID=3D0 is current=
ly

s/initialziation/initialization/

> reserved in the VMX-specific bitmap during hardware setup.
>
> Allow nr=3D0 to allow allocating all ASIDs to SEV on AMD without failing
> hardware setup, if at all possible, in which case any tag allocation
> fails (SEV won't use the tag allocator).  The number of tags includes
> tag=3D0, which is not usable. The interface is a little confusing in that
> regard, but this will be changed soon when reserved tags are explicitly
> introduced.
>
> Keep allocate_vpid() and free_vpid() as wrapper that check enable_vpid
> to avoid checking at all callsites, and add init_vpids() and
> destroy_vpids() to wrap init/destroy calls as well.
>
> No functional change intended.

I don't think that's really true. If it is, then you failed. For
example, the new -ENOMEM when the bitmap can't be dynamically
allocated.

> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/mmu.h     |  8 +++++
>  arch/x86/kvm/mmu/mmu.c | 78 ++++++++++++++++++++++++++++++++++++++++++
>  arch/x86/kvm/vmx/vmx.c | 40 +++++-----------------
>  arch/x86/kvm/vmx/vmx.h | 28 ++++++++++++---
>  4 files changed, 119 insertions(+), 35 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> index 2ae7f9ed4cf86..de79e002edf8f 100644
> --- a/arch/x86/kvm/mmu.h
> +++ b/arch/x86/kvm/mmu.h
> @@ -410,4 +410,12 @@ static inline bool kvm_is_gfn_alias(struct kvm *kvm,=
 gfn_t gfn)
>  {
>         return gfn & kvm_gfn_direct_bits(kvm);
>  }
> +
> +typedef unsigned int kvm_tlb_tag_t;
> +
> +int kvm_init_tlb_tags(unsigned int nr);
> +void kvm_destroy_tlb_tags(void);
> +kvm_tlb_tag_t kvm_alloc_tlb_tag(void);
> +void kvm_free_tlb_tag(kvm_tlb_tag_t tag);
> +
>  #endif
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index aadd5bdc2c97a..97d49247d9d82 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -8178,6 +8178,84 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
>                 vhost_task_stop(kvm->arch.nx_huge_page_recovery_thread);
>  }
>
> +static struct {
> +       spinlock_t      lock;
> +       unsigned long   *bitmap;
> +       unsigned int    nr;
> +} tlb_tags;

Can we statically initialize this to avoid the call to spin_lock_init()?

... tlb_tags =3D {
        .lock =3D __SPIN_LOCK_UNLOCKED(tlb_tags.lock),
};

> +
> +int kvm_init_tlb_tags(unsigned int nr)
> +{
> +       /*
> +        * Limit the number of TLB tags to VMX's hardcoded maximum of 0x1=
0000
> +        * to avoid wasting memory for the bitmap in the unlikely scenari=
o the
> +        * CPU supports an inordinate number of ASIDs (on AMD).  If users=
pace
> +        * wants to concurrently run tens of thousands of vCPUs, they'll =
likely
> +        * need a solution that works for both Intel and AMD.
> +        */
> +       const unsigned int MAX_NR_TLB_TAGS =3D VMX_NR_VPIDS;
> +
> +       if (!nr)
> +               return 0;
> +
> +       if (nr > MAX_NR_TLB_TAGS) {
> +               pr_warn_once("Number of TLB tags capped (%u instead of %u=
)\n",
> +                            MAX_NR_TLB_TAGS, nr);
> +               nr =3D MAX_NR_TLB_TAGS;
> +       }
> +
> +       tlb_tags.bitmap =3D bitmap_zalloc(nr, GFP_KERNEL);
> +       if (!tlb_tags.bitmap)
> +               return -ENOMEM;
> +
> +       /*
> +        * 0 is the host's TLB tag for both VMX's VPID and SVM's ASID, an=
d is
> +        * returned on failed allocations (e.g. no more tags left).
> +        */
> +       __set_bit(0, tlb_tags.bitmap);
> +
> +       tlb_tags.nr =3D nr;
> +       spin_lock_init(&tlb_tags.lock);
> +       return 0;
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_init_tlb_tags);
> +
> +void kvm_destroy_tlb_tags(void)
> +{
> +       bitmap_free(tlb_tags.bitmap);
> +       tlb_tags.bitmap =3D NULL;

For consistency and future-proofing, it might be wise to clear tlb_tags.nr =
here.

> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_destroy_tlb_tags);
