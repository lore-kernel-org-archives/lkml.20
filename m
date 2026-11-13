Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572207;
	b=MtuJbWKv/kHXjd5XihXv51OcJ5QtgXBuDCMihPQ8qBOe2GrK3kH+IyDhmsXKCwKvg6H2
	 BTWIxU/ClRnv8GIIjv2JUCdSoM0YLlV+HmMHDpkBvn+ooRgNhKRaLLhY6YHOSXHdcUn3n
	 JRSUzW1SGs0HnxJYU6N8gbwNtx3jWbGcrBxv0dSRxSxM+qWasjsxC5LVUeh21ZhmGU844
	 pG9HyUK0CZUnrHKK9YCC3Y5pbZylWustklZt1sfwrKvjz+TfEIvBq983asnWCO3+p/kOY
	 yCkml1S6Rw1D1C6SM+D47nXYbZq0TqfbgQMbvWvbl3Gn00OcEXj/gQhzwIZrmoRF6EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
	b=mNpZ76opSIW46L8l6DbSmJqplg+Ut6iDSHsNRbn6S5o9OfXnPExZ5DnRC9zssPbVW27C
	 fsEN1NtONDo72zERAvDDdCCEdRXOqqqJ4/3Xz8yNRhO9Zp0E1RuavsMeDoRLDpOq82RgI
	 p0IZu+U3aA2CnTclIJ/zZpIrYZ0icFrjRyocln+wcMRh62SxaoZESMuoC1+HCI80ymtJD
	 3GdoGDwUdLdf5DXyqeQ6GxnKKAMOVo67k5AnINTraRD4foXVIGv7ka1dhxn3dpjDRBSTQ
	 RXaX9mHRm6aR0dCwqhLkW/nDApj8M4ws77Vub6vAp82tP+ADnIxs08QrA9LMEtOl/Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="e/Zx56Yb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB0606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=e/Zx56Yb
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1825666a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572205; cv=none;
        d=google.com; s=arc-20260327;
        b=nv1JPtcPH0oZEp1fhLnN3PVXQ6GP+LGksjhOmS4EM/FYz2bFTAxAhr1NK4PAmAH2Dg
         wu8fMQS9j/DMzmWvgwBBHc+TQ1s2npsBhplwzVdmJZwzDZ/OOQOwpZXoBQONXIdE0ZtW
         wYIhXLKkQd4FTUiTbJIDdTY15wcBmWLGMaYc4iS6EmvxFI0bxp2VxpBrcEyCq81THu7o
         GKzpnT+/5dg++GkJUWqG4kATuUYO0E+SzHIjizKLUk9e9sQNHmi/nazZR0cOIF6tkSZu
         z/Exw62KYyWziHUyVtdCx+5N3MxcVabSJjnQsqbPJf4pS2lNEgjrdGYs8VV9/KZHrBbm
         o6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        fh=F/NiICs9vDEdJEXN2no6kZ7s4fMS3qNZlAH74keqQQ8=;
        b=O8Vtp9VpsSTihgsmD0Bqvlzs5HHVrbH2mzRbesWGf9e4BdSXCKps5NhXA15KdOykl9
         ts2JSjqAN1sMpT6fyGJvDK9UMeY7sKyBMjNUpuVffZQe0REYPYUaRa7B8vTqOnGz+cKu
         pI5x5O0UjXoWYszaqcNvZlPSjoFtT5+oWDCvCRZdm0iMBGrAyo3/ASa/ZuD8n2c8w8Cy
         PCqLB7htfhePkRaNtQMe/pAay30IqJRQ3vK9hPz0OQTQhstwabacXTas5fDP23+ZxMXh
         5e8hCbQ5ZYUXZW1mmUNKKmyTBrNMsNM82nAQUWaL0erWqg5poTWSMmVdQ+67Z+lHMZm4
         H9Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794572205; x=1795177005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        b=e/Zx56YbBCjgsMtG5kmlIHcHvE1J6P4joVmzF9dfp0gpew/WcvK+LQo86o3z5cIQyI
         yK/1GAJiVW9CEyH9ubTAy6Wzcuk5LfuDIOU4HSPzBZO5VsDaBgG2mvNLrS2jZjQJafOb
         5uoSaa7DjtWrkm4WowzVwxq7KrrQiGO5+QN2QGNBX+f9fsL/G6ONSjLQou0mIqQ6dBZe
         nNvWPGqi8QX9PFdJFbuKvu5RxG62KdLZmrUdVIhSKPNC/tw+lME1WznJ1/o993s+XHQ2
         37yB4jGRiscVgqNWd5/ZqJaK6+rBt172tp8VegOdRm6TG5pTfXaby5H26I5BjOqDhAui
         MNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572205; x=1795177005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        b=ifsMidZzby29AR2AOZrHw8/ggy6E/mUnkIzXrR97I3LMM7Rcp5MW6OAuby80azbkBg
         yen9y4t5COF3zXzg4QktXLaI1/NnkSFLp2utM+pS5urhHMWKwpp9Ax4nXvQnvSUFDq74
         OBJ7kf6JBpBAYRj1hlQKn/ZU3LpQNFAkRwAltIto7rHjJiAgAKxFt/4C05ANhgSby2RJ
         veXGCeYWgmnyseFOdI52OUjY3VGH6XHTiH/yMIYW9ON+L6k6+/ohy5Guem+YyW431KQu
         punXqeg2HErdl1wzKxJFs3HnuAFLHeRRG3/G7YtE3rjZPf/r4bbPykzO8Jv5RoNk1WBI
         tCUQ==
X-Forwarded-Encrypted: i=1; AL+hErFtnsmfgjv2kVb+CJXU6Nu+Y78TEn4gnHm2QE3n78hdFwUNuBge+aPMbk6g8/7WEm+c3pN/iZxGyfbwXuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z89G/tRneWaWRclRus+w9QJT+9vP0q9XghT3KeF0aWD2z60uicJ
	g4jl4XyRVIZu6u0oNTQQK7EDwTlzT/N1KLAsxKtuJXNU7nCbHoDBvpFLrKXjddvPiZj/Nc8tyGG
	+JR6Pp873rrYEPp6eaH50VEy/SQzZ0CWmu7icY/qOMA==
X-Gm-Gg: AYBFou3ESIeB7BpDwRRwsdUbYatyR9pKw2pxrjWl9XEK7NPlBJPMZTLIyNaYqOCiuQ0
	bPmvZlBRRWRKX2QH6h8WTjc9aYDidwAaXZTwGXd/U5XPGzQdcZf9RLWUHcS+S+Z3azbONof+EHT
	2o8avetHUcQxV/8J3iuzROjAD2Ygjm7ye4eHf5yDIME76GcsVJRqTja+rsaaLq7w/RE9kc9awsj
	3xEZc6UC5qVJn0AxZpOpEksdyRPjz95pcP15UKD3VRH3RANNWPj6XrYhVLtgcd6Nh10udDqgyx1
	Qnbcw27XLRSVr3Ch/qAF5FbtIvt7pXrC/oA/cKvU/gXumh/HqByJhuIG0/sppHhsdHmG4EVG6Ue
	T4O9vk+rvVbZ4G8muXrIUPbr3PAFxDtr8mhF4SnkoZlyYpxiP29QQZwDseOJ4RjHNZMCiYX7ft+
	GeXt64GsImC3rFPGoSGP7VH69nQss+BSbe1qxrPEgNfXUYLKHYm99yymsgplqO+mBBbsmgQebGh
	uRn
X-Received: by 2002:a05:6402:5177:b0:6b6:fddc:dbc1 with SMTP id
 4fb4d7f45d1cf-6b7c08b08admr1438436a12.6.1794572204712; Fri, 13 Nov 2026
 04:16:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
In-Reply-To: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:46:32 +0530
X-Gm-Features: AclHuK-Kyzf_3Aa78LNIir_Q7TGPINiFuQF__Q3gkCjYhZcKlm3MtE70aN1T8Lg
Message-ID: <CAAhSdy3K1AFB-DWKznNru+x2hNiP5_M+uTZEZBHWwdvLfJrNQA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix G-stage page table memory leak on VM destroy
To: Yangyu Chen <cyy@cyyself.name>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 12:28=E2=80=AFAM Yangyu Chen <cyy@cyyself.name> wro=
te:
>
> kvm_riscv_mmu_free_pgd() tears down the G-stage with
> kvm_riscv_gstage_unmap_range() over the whole guest physical address
> space. That function looks up each address with
> kvm_riscv_gstage_get_leaf(), which walks down to the leaf PTE, and then
> clears only that leaf. kvm_riscv_gstage_op_pte() frees a page table only
> when it is called on a non-leaf PTE, which never happens here, so every
> page table below the PGD is leaked when a VM is destroyed. With 4 KiB
> mappings this is one page per 2 MiB of guest memory that was ever
> mapped, plus the upper-level tables.
>
> The leaked pages are not slab, vmalloc or page cache, so they show up
> only as unaccounted used memory. On a SpacemiT K3 host, a workload that
> creates and destroys tens of thousands of small VMs leaked 0.5-1 MiB per
> VM and ran the host out of memory after about 20,000 VMs.
>
> Add kvm_riscv_gstage_unmap_all(), which calls kvm_riscv_gstage_op_pte()
> with GSTAGE_OP_CLEAR on every PGD entry. That recursively clears all
> leaf PTEs and frees each page table below the PGD. Use it in
> kvm_riscv_mmu_free_pgd().
>
> Tested with a reproducer script that builds a minimal KVM host kernel
> from a source tree and boots it under QEMU 11.0.2 (TCG, rv64 with H,
> Sv57x4 G-stage). Its init creates 10 VMs one after another. Each guest
> writes one word in every 2 MiB of an 8 GiB RAM region (anonymous memory
> with MADV_NOHUGEPAGE, so 4 KiB G-stage mappings) and then shuts down,
> so each VM needs 4096 last-level page tables (16 MiB). MemFree lost per
> VM, after one warm-up VM:
>
>   before:  16415 kB  (RESULT: LEAK)
>   after:    1636 kB  (RESULT: OK, noise)
>
> The bug was found while investigating the host OOM, and the fix and
> reproducer were written with the help of an AI coding assistant
> (Claude). The analysis, fix and test results above were reviewed by
> the submitter.
>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programmin=
g")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Good catch. Thanks for the fix.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as a fix for Linux-7.4-rcX

Thanks,
Anup

> ---
> How to reproduce:
>
> The reproducer script is at
> https://gist.github.com/cyyself/23abb87a8ad9ee8c64ce03cca78669fc
> and needs riscv64-linux-gnu-gcc, qemu-system-riscv64 and cpio. Run it
> from the top of a kernel source tree:
>
>         $ cd linux
>         $ /path/to/kvm-riscv-gstage-leak.sh
>
> It builds a minimal riscv64 KVM host kernel (allnoconfig + KVM) into
> .kvm-leak-build/ and boots it under QEMU (TCG, -cpu rv64,h=3Dtrue) with a
> static test program as /init. The test creates 10 VMs one after another.
> Each guest touches one page in every 2 MiB of 8 GiB of guest RAM, so it
> needs 16 MiB of last-level G-stage page tables. The test then prints how
> much MemFree each VM leaves behind. The first run takes about 1.5
> minutes, mostly kernel build; reruns take about 10 seconds.
>
> Without this patch:
>
>         10 VMs, each touching one 4 KiB page per 2 MiB of 8 GiB guest RAM
>         MemFree 2037664 -> 1873512 kB: 16415 kB lost per VM (a leaking ke=
rnel loses ~16384 kB)
>         RESULT: LEAK
>
> With this patch:
>
>         MemFree 2054080 -> 2037716 kB: 1636 kB lost per VM (a leaking ker=
nel loses ~16384 kB)
>         RESULT: OK
>
> The exit status is 0 for OK, 1 for LEAK and 2 if the test could not
> run. IMAGE=3D<path/to/Image> boots an existing kernel instead of building
> one. That kernel needs CONFIG_KVM=3Dy, CONFIG_BLK_DEV_INITRD=3Dy and
> CONFIG_DEVTMPFS=3Dy.
>
> I also tested VMs that select Sv39x4, Sv48x4 and Sv57x4 through
> KVM_CAP_VM_GPA_BITS, and four VMs with mixed modes alive at the same
> time, destroyed one by one while the remaining VMs kept running and
> were checked for correct guest memory contents. With this patch, no
> memory was lost in any mode and no guest data was corrupted. Without
> it, every mode leaked about 16 MiB per VM.
> ---
>  arch/riscv/include/asm/kvm_gstage.h |  2 ++
>  arch/riscv/kvm/gstage.c             | 22 ++++++++++++++++++++++
>  arch/riscv/kvm/mmu.c                |  3 +--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> index aaf080ba1b77..90ec9e0b34b1 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -80,6 +80,8 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage,=
 gpa_t addr,
>  bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
>                                   gpa_t start, gpa_t size, bool may_block=
);
>
> +bool kvm_riscv_gstage_unmap_all(struct kvm_gstage *gstage);
> +
>  bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, g=
pa_t end);
>
>  bool kvm_riscv_gstage_wp_pt_masked(struct kvm_gstage *gstage, gfn_t base=
_gfn,
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index e5002cb9cbef..c912cdc2021f 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -456,6 +456,28 @@ bool kvm_riscv_gstage_unmap_range(struct kvm_gstage =
*gstage,
>         return flush;
>  }
>
> +/*
> + * Clear every G-stage mapping and free all page tables below the PGD.
> + * kvm_riscv_gstage_unmap_range() only clears leaf PTEs and leaves the
> + * page tables in place, so it cannot be used to tear down a G-stage.
> + */
> +bool kvm_riscv_gstage_unmap_all(struct kvm_gstage *gstage)
> +{
> +       u32 level =3D gstage->pgd_levels - 1;
> +       pte_t *pgd =3D (pte_t *)gstage->pgd;
> +       unsigned long i, page_size;
> +       bool flush =3D false;
> +
> +       if (gstage_level_to_page_size(gstage, level, &page_size))
> +               return false;
> +
> +       for (i =3D 0; i < kvm_riscv_gstage_pgd_size / sizeof(pte_t); i++)
> +               flush |=3D kvm_riscv_gstage_op_pte(gstage, i * page_size,=
 &pgd[i],
> +                                                level, GSTAGE_OP_CLEAR);
> +
> +       return flush;
> +}
> +
>  bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, g=
pa_t end)
>  {
>         int ret;
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 371fccaf9df0..87838a0f6bb9 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -784,8 +784,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>         write_lock(&kvm->mmu_lock);
>         if (kvm->arch.pgd) {
>                 kvm_riscv_gstage_init(&gstage, kvm);
> -               flush =3D kvm_riscv_gstage_unmap_range(&gstage, 0UL,
> -                       kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), =
false);
> +               flush =3D kvm_riscv_gstage_unmap_all(&gstage);
>                 pgd =3D READ_ONCE(kvm->arch.pgd);
>                 kvm->arch.pgd =3D NULL;
>                 kvm->arch.pgd_phys =3D 0;
> --
> 2.53.0
>
