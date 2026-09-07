Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780543C7B9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769448; cv=pass; b=f76cPVCUlCV87WfcN0KqI5iWRSJsYgi1LOtktP3XXRIFwmr/mugtTRZvIjn/Sp9vmDBDzZyxtXIaFy6nsOx/tl6LlWz8S31r29LvqA5H/cF1vZQ7SgZeE3LZOXaRA6HtBies+rYO6AHa5EqVUt0WxX8WkP7QJM0r1sIVMtnn/h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769448; c=relaxed/simple;
	bh=eW2heI0TSrLo005hXEi9RN2qzKnbcSMx1USmy+ENf4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2L/jH4FIXYKBPowKwz+ZkCl6qAFM4utyOj4zFMKltfWcXdbw+98PUQoSt+753mcAtWx4d42EAic+/E2bMe1i0NtM05plGJnCXtHB4ugzDG21asgi+e5LsunZ3rrNXS9PA0KFOFoaIBzFmoukM9guO8tzcnHiWTBN6Kk7T8wn84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=tnlVPgTS; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="tnlVPgTS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482f9309813so2865922f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769445; cv=none;
        d=google.com; s=arc-20260327;
        b=m/l7+BxC2XzSpKI5b4yCWVQyvJrbAI+27IOSYNEG53IdsbLGa2UBUZwsttM6/ltHr6
         PvDls8Hbvr6EbPQsEBK0etV2NQWfxCOU16soOX0r1YszQ311/YjHh6BdJvNkuluRpdVQ
         m/PLKk7MeJ62FNAxm0g3O8YfusSy+Eer3S+rQai86UtPsd+0zX9yjsAlMJD1vsU3d/t+
         kZ/8UW4rd1vmxe79DvLVNMLW9KkHSTOuadzoHKaVtMnGMmWRi6b/vZxDHfsOJGMjSqq+
         lFOfcDdFz0AETeH+k9QwpGiNmI3hyKzYvyGc3ISOUqnj4HioXOpHeNN2cBQ/5gkOrEv7
         Mkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        fh=xwiBxiNJR3MYs0Kk0S9PojdjjI5IRtrMKm1GU19oNZo=;
        b=PAqed5VZy3neYsBE11y2ayjVc9UaRKF1QhOy0iNlmmX7OOAALw+ZqAOesJyPlgXg9q
         7z6Ll3QYsM0FkZ4C/uNQowhQTZ1aPo7AkZ8eStxXhzj3OZdbz7D1IYFoTm3EWEjfWiDc
         U8zE5ZFhZTea9Z5alhLKtgis55Ot7aPrunMmQ2GcRTptatsG9ZlW7hF5Bra28R255w+Z
         6XPSvSDZSPstJYDDCZWbCmgfu32G+MTRjYsMQJX+4Jbeyy47b/s9zI4TodWZ8KKCTfXo
         TuF93UBVadTb/WBzJEVObIxsivM9l7CF6u9gEd4iEiJM/cXbrQu9xVi2KyBTLGLelGzN
         UmTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788769445; x=1789374245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=tnlVPgTSF8q/OgLN5frZT1u3+LYtgGYZyXDfZDcsLKYxbbF846W0zEJqK+9m8iI2vD
         VY+QxmuPaRNblSsA2BCDpPTGwUqqASFzFlyE3q2bCrhqv5uRN07GoZqvL2v7CzuKHKFw
         R8yWyVnp7Z4K3yvrD51gmwyb+VL8SOCeeWOFaTpuC854jUaqQ69F9032jsfIvKEty1ZX
         h+DZmScN650MD4UO28guWOldK3bf6Vg0y2Mo0XpjCmmv6wu1hAQAuhPj6DIgAHWSGVtJ
         LCHCqesXBXghjU0QVRuuko7s4IK6vlsOYkN+r5flmOIBFKCUzbsEuKkWtcLB3t0hki+7
         Ir6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769445; x=1789374245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=iymUSnUAGlLD9iAhVJcYWdeAawmU0R2nzXaH0I24V9f3FkSi2OoZ6PIhsXkQzdz34w
         5IJb5Crrb2aMKThTboUSZgcVmQl/mjqn1EIlO1C+GEbYbQRd8hgsNj0BHYVm22g+onZv
         seWBqj9vsgSaprE+ADMoXYZirF8KI0m6+NzAZt9p2E5LnTxh9ORfBJpw0z1rtURRwx/I
         7uYls77Ll1duxqSJpA9sucZjqyI27etnDJZqibk5K8yhUEq1kT5kO6t8x2bpTdIiagJD
         b8kEMf5o5Eeb4WJ47nMBnXZ7FG/zS++cCQ+rLedMHkK6/n3Y9FXKXAcs+tbI6iJ+4Kni
         ZnHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJgXInzb9MXLqVmrs3kstSidkQ81IvBDQzCumFczzn7kGprPRz8VsfMDoSGIFxKbmDyGXCke7XaKq+ZKw=@vger.kernel.org
X-Gm-Message-State: AFuF++knd5+mJ/HtgwMAIikcxoAH+glP3bYqcSj+m7isKcVmwk9WRGWS
	tHThPXiq3RM/6cwLhRRHV1/cRcbP6iX2Ln68m+RVBsU4ip4Zbcu5m+sibu0SO8oCzqccEdBLaiO
	xsK/x2j2FmcHWVJJ1Y/vyFl/OfidQm315J0736A193A==
X-Gm-Gg: AYBFou1N9TQ60L/9AwuNvoWIkHRtry31Dfon2eKWBG1BVttOHeNjnG8rRwkAcoN6ivf
	pYNNj2HH0VzCRm+JUSBMxoJbMWGA6+1LEP8fpECNayzoACnKrAgyi2FP6DmzPvi4+d7xE7rPt6u
	CGXTLjG7j6C8YfFEQzIeDZYzArT1/NKpgYXfoKzg5eMPqATDD9LS8D4RAfyVVWM1axX3SEQJUn1
	8w1uzhokns6KtHI2j9XyYXZChfkwcHAecIE6SS0jxACzWrGt0EmWfm+SGbYzb+SFGcO/+hFmcgO
	y7cV2z+2qs5svVccXGPvpkgyscBq7eFXv7OWgJyRXCYVsBGlW09+MLEHBehCtBtgqn6olDp+gMV
	t8xQ3JsFdlzz3Xc1NId+Atn717Yq8bvj3b/uGwTGFx+Cx7wNvyfjKqQvIhaedUuQ=
X-Received: by 2002:a05:6000:2f82:b0:485:8c16:5ef7 with SMTP id
 ffacd0b85a97d-4858c166148mr18091871f8f.49.1788769445126; Mon, 07 Sep 2026
 01:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Sep 2026 13:53:53 +0530
X-Gm-Features: AcwNN1UOItNX8Zqa8yZNak7eVCaaP3xVxuE0lRNcn1acCna6Fm_hGPjVZ5FCvUw
Message-ID: <CAAhSdy1zxu0cGnvpZEq_mPYRj07m7a+TA_8f0-sa=Mu7xtXvjA@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:11=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add vm_alloc_page_table_pages() and use it throughout arch code to replac=
e
> open coded equivalents.
>
> No functional change intended.
>
> Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM.

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
>  tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
>  4 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testi=
ng/selftests/kvm/include/kvm_util.h
> index d9d39a8894e2..c56f342b16fd 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_=
vm *vm, gpa_t min_gpa,
>         return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
>  }
>
> +static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t =
nr_pages)
> +{
> +       return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_=
PADDR,
> +                                 vm->memslots[MEM_REGION_PT]);
> +}
> +
>  static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
>  {
> -       return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                vm->memslots[MEM_REGION_PT]);
> +       return vm_alloc_page_table_pages(vm, 1);
>  }
>
>  /*
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/te=
sting/selftests/kvm/lib/arm64/processor.c
> index 01325bf4d36f..2dcaa2c4a038 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       vm->mmu.pgd =3D vm_phy_pages_alloc(vm, nr_pages,
> -                                        KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                        vm->memslots[MEM_REGION_PT]);
> +       vm->mmu.pgd =3D vm_alloc_page_table_pages(vm, nr_pages);
>         vm->mmu.pgd_created =3D true;
>  }
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..c175dcd14114 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       vm->mmu.pgd =3D vm_phy_pages_alloc(vm, nr_pages,
> -                                        KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                        vm->memslots[MEM_REGION_PT]);
> +       vm->mmu.pgd =3D vm_alloc_page_table_pages(vm, nr_pages);
>         vm->mmu.pgd_created =3D true;
>  }
>
> diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/tes=
ting/selftests/kvm/lib/s390/processor.c
> index fb9dab92d4d1..33f49d743b5f 100644
> --- a/tools/testing/selftests/kvm/lib/s390/processor.c
> +++ b/tools/testing/selftests/kvm/lib/s390/processor.c
> @@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       gpa =3D vm_phy_pages_alloc(vm, PAGES_PER_REGION,
> -                                  KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                  vm->memslots[MEM_REGION_PT]);
> +       gpa =3D vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
>         memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_s=
ize);
>
>         vm->mmu.pgd =3D gpa;
> @@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
>  {
>         u64 taddr;
>
> -       taddr =3D vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
> -                                  KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                  vm->memslots[MEM_REGION_PT]);
> +       taddr =3D vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION=
 : 1);
>         memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page=
_size);
>
>         return (taddr & REGION_ENTRY_ORIGIN)
> --
> 2.55.0.966.g6673acef38-goog
>
