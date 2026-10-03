Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3393A4F32
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063197; cv=pass; b=cv9uuVIPxxi3k99NQzyPE1DBnQVfagmAfwW4FFBqxBWzbVrucak6k16eAB9hk5M5gGzndAdLAy/BtJP4Pf1ypdpyh7Vha1X3kuAnS6MefJ9iI2gALAM+p6TGy3uuZbnp3E3EmErXaMjTW/oilJvrjRr7rQIEMUgn461zPdePY4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063197; c=relaxed/simple;
	bh=ZIBhrntP8+qxeEqIpQb91mOxIVspTOx+NPlmlo2K79c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcABouMJpWfJ1iDE5NCX0Qml/zM8OPQI3JfNjdKC3Gr5ONZGKQFzrFQy23U9tLXuVDziT5ObPyONxfmyec27JvnQwsApMXertvC294NvDTkpvMLhOv31EkyQFq6iN8CoLMM33IaysREb2emhsbLvtOUSOrHWOZorP/subW2m8M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=b9h1mQB3; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="b9h1mQB3"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so298581f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791063193; cv=none;
        d=google.com; s=arc-20260327;
        b=OrkHeJRLvD0xNGXqum4d4QyAug8pmoT+tv6LyUUF5cYeFQx8uLna+PlHNw2gSyiIon
         T0c9E9elbhlRYyk1ShVw8ZLBEeQRTiQSp1hgwsRA4pJdXq+WwQptxs/aDvSBZiDJ3fET
         bj/rcO4GnawqJJP1znL/E3c0uRS6Z/Wg5jk/2Bt9OlFhcATuIp/dQ4cNIQ7SkOnbGM4u
         7saULjt9qOQs5OlgzO1yZSNmTsVNFx7/tKvJsEShIlj8Q6bkksDbY26Q8WUGx+OccVvy
         FGvTvNv+fVufxWrIU5qy4rr0ZWxIArFGTJcgOVRRc7IrXARPFYT0kqjVuyL8VOnjQAiJ
         siLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        fh=FupKRILrPdewcn4cGUYOyqCUlpmaceq9J9E+GO0svPk=;
        b=IwM56BjNYn3nPk/Z7IoZXb2kOVW8dYW4kf9oJbXjz3lctNY6KyAJspki0yGwYl8+Yx
         Gq+731Ut4aBm6wm/vfOxmgkLkd/wkyRJMnrxkCx5/0OTr8gRwMKmxRsUlPs4SIH2rUud
         3k3ge4MIGKm1qa3aKM3jAahAr51yf2o0heVlYDAFzXVA77/NbYK2I8P4lKusWR1umYy/
         e+KgGDv61QvhVKgoZyALiTNtiNsQUdaexMTZL0mxgJWfXJVEil8Igjkf0b0kt75/4UxK
         +1Tz6GVRfk3e3ymewYNClE+7ViNI/LURyWkPx/sy013eV4qgl7D+TyPpm9URMj0+wdxD
         bbNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791063193; x=1791667993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=b9h1mQB33U3g6N/GXja/y9MG8VQxGFxSa2PhDrVi3pbIz4xsK2O+n9cewvNgKpUBa7
         DQd07QiPH6WUxIUnS+fin0JICEUlfthjSm1mmCjhmuVxePQZovQbEkUGxC5+F0ZaiCDB
         o50ML1y4TlaNXiTTjP1qijbKzhqvwpa2dxEfCmralxS7QiGBAdIxztRnef6yPuVfdqSk
         24ejB+8jCJpVOgNCJAgp2UJWCBXG2Y94cbzIQNmA7MhPlMhuc7vEnM1Gh8ZgFtAbgS7J
         kwOD9umHAhbKsL9+bTohv40oEl81Vsyi4q5b8WiJOAxS+VV+0d1OJ+ZF0DH4sk28ipUb
         vq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063193; x=1791667993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=0t3OfU12EfcVHAQJ3dc1zBwGtmD4B6MoaA42yNsa1+9povuVu1HctpDoxxRQ5moyp/
         kOKQJuq+2I/54Uw3x9ozbub5puzY25IFZTXv7XFEuOtmwxR7GMnaU1T8FX6JvgWEwXaB
         bgaodZ9PqcjqiewyZ91neDseWVhwuTmJ+tZKCIeFWevzxwSCRwv7+3PhyaBu15ndDskK
         h0tr51/MQWTLrbuF97RWYsnk1/XUFQyni7fUAqjC/ki3j80YH9heFQiiob72BrVq2Mxc
         tHcyGcK/JV/4iFnKmFJW8aCkhWVmInLuAo1QvHqIhgb4QM85RSQHRQBRIisP9z3t3Bq0
         KhNg==
X-Forwarded-Encrypted: i=1; AKwUvByLMsa8GwIJZ33phWhfoJQJ1FQXE0pN/g8IFYljfvBQkbf8tRVdVIiVOMaskr0CGH+9Ge4F+ICSj0HPu3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdtskQah5SKsrqAUFh+n5MmM5XplHUwxorRK6KTRt90W1qFDf0
	EpUH4Tipwe/Mp/ol06tUEsbBlL25/XPtO9o3y81z7IMGlRYpleIa3166kddF6GQdBdFdiFjRE+8
	QHXq31+AlgHp+wzdpHYo30lcHX8ZpCc3IJV3N88/v3Q==
X-Gm-Gg: AYBFou0SoIzGWEdFOclWN8gnRY70dzzjVAZLlBpXwZlKSSkIe2J2HSmbmd5ScoAR0b2
	+7ZdNtlRtINQH/zxH+tog8ZxJnWQpGl1ZATyQ2aV9TWVHN19ncCYi5n1zT2EF8Q3L801VkSAHgi
	PNWGbCYBp2hSJJ8rGiGUeBMrlSlIUqv+T49fRErS338deoAI/CG5xW8MK8bjPCWw4v7c8kYKOJB
	FiAtmhRjz5Lm3iZ1gsGhdwH9ntj7SN1PDBXwQJWOZKmtWA89mZcQXov0KIebV4m/Ja5JqqRJP8c
	xyKICk8R2D2xGudBDsUN1NR3a6RqW2MZ/I+5u4oISrX1wXDxGnUavvXQ47QJh1FXnx+K3+6Zp9U
	XG2Tly9EX1PQFYn5G6KlH8pAkNYYntAbVs6Dj/LqSs0/1EXIotm+XQyAUS2uBrbX/g8bE+P34zX
	NuKChnAeKR
X-Received: by 2002:a05:6000:2008:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48c557daf9fmr296756f8f.4.1791063192798; Sat, 03 Oct 2026
 14:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815102833.864330-1-jinyu.tang@linux.dev> <20260815103123.864738-1-jinyu.tang@linux.dev>
In-Reply-To: <20260815103123.864738-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Oct 2026 03:00:50 +0530
X-Gm-Features: AclHuK_HLZyYPpTxHZ72T9yKE8JtgWcR285DcDxiQ-zUi9vakSvTlMiSylojJss
Message-ID: <CAAhSdy01fWGXx37Nq1LsVWajoH8B_O=hvU0b4vw5AsnOQm054w@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND 1/5] KVM: riscv: Avoid overwriting G-stage
 tables with huge leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 4:01=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
>
> RISC-V KVM can overwrite an existing G-stage table entry when
> installing a huge leaf mapping. If the target huge range already has a
> lower-level page table, kvm_riscv_gstage_set_pte() can replace the
> non-leaf entry with a leaf PTE and disconnect the lower-level page
> table.
>
> Reject replacing a valid table entry with a leaf PTE. If huge-page
> installation hits such a conflict, fall back to a 4K mapping for the
> original faulting GPA in the MMU fault path, where the original GPA and
> HFN are still available.
>
> Suggested-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programmin=
g")
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>  arch/riscv/kvm/gstage.c |  6 ++++++
>  arch/riscv/kvm/mmu.c    | 24 +++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index e5002cb9cbef..54d45addf18f 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -174,6 +174,12 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gsta=
ge,
>
>         if (pte_val(*ptep) !=3D pte_val(map->pte)) {
>                 bool was_invalid =3D !pte_val(*ptep);
> +
> +               /* Avoid replacing an existing lower-level table with a l=
eaf mapping. */
> +               if (!gstage_pte_leaf(ptep) && !was_invalid &&
> +                   gstage_pte_leaf(&map->pte))
> +                       return -EEXIST;
> +
>                 set_pte(ptep, map->pte);
>                 if (gstage_pte_leaf(ptep) &&
>                     !(was_invalid && riscv_has_extension_unlikely(RISCV_I=
SA_EXT_SVVPTC)))
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 6035b5ec9503..bfd6168ebe30 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -625,10 +625,11 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct=
 kvm_memory_slot *memslot,
>                       struct kvm_gstage_mapping *out_map)
>  {
>         int ret;
> -       kvm_pfn_t hfn;
> +       kvm_pfn_t fault_hfn, hfn;
>         bool is_hugetlb;
>         bool writable;
>         unsigned int vma_pageshift;
> +       gpa_t fault_gpa =3D gpa;
>         gfn_t gfn =3D gpa >> PAGE_SHIFT;
>         struct vm_area_struct *vma;
>         struct kvm *kvm =3D vcpu->kvm;
> @@ -709,6 +710,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>         }
>         if (is_error_noslot_pfn(hfn))
>                 return -EFAULT;
> +       fault_hfn =3D hfn + ((fault_gpa >> PAGE_SHIFT) - gfn);
>
>         /*
>          * If logging is active then we allow writable pages only
> @@ -734,9 +736,29 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>                 mark_page_dirty_in_slot(kvm, memslot, gfn);
>                 ret =3D kvm_riscv_gstage_map_page(&gstage, pcache, gpa, h=
fn << PAGE_SHIFT,
>                                                 vma_pagesize, false, true=
, out_map);
> +               if (ret =3D=3D -EEXIST) {
> +                       /*
> +                        * Retry at 4K granularity for the original fault=
ing GPA
> +                        * when a huge leaf cannot replace an existing ta=
ble.
> +                        */
> +                       ret =3D kvm_riscv_gstage_map_page(&gstage, pcache=
, fault_gpa,
> +                                                       fault_hfn << PAGE=
_SHIFT,
> +                                                       PAGE_SIZE, false,=
 true,
> +                                                       out_map);
> +               }

If you were attempting to map 1G hugepage then you should first try
2M and not 4K. This patch needs more work.

>         } else {
>                 ret =3D kvm_riscv_gstage_map_page(&gstage, pcache, gpa, h=
fn << PAGE_SHIFT,
>                                                 vma_pagesize, true, true,=
 out_map);
> +               if (ret =3D=3D -EEXIST) {
> +                       /*
> +                        * Retry at 4K granularity for the original fault=
ing GPA
> +                        * when a huge leaf cannot replace an existing ta=
ble.
> +                        */
> +                       ret =3D kvm_riscv_gstage_map_page(&gstage, pcache=
, fault_gpa,
> +                                                       fault_hfn << PAGE=
_SHIFT,
> +                                                       PAGE_SIZE, true, =
true,
> +                                                       out_map);
> +               }
>         }
>
>         if (ret)
> --
> 2.43.0
>

Regards,
Anup
