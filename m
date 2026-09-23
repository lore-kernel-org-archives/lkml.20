Received: from mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCE049DB8B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161560; cv=none; b=nFe2grZ6WYXlks/q9EBDqnVT2jeRgLmeZumQjr9Ucx7hfLjdaDzj02Dn+QdzSMwQZonWYG4bqf6EyKhg9hO98J0LE0xrhSfdlyScsS2fAtcvoPGO2aczNlXn8gXgMy0N78S55d8rlvpAhRLo0ccpCz2j7f5jWluoA8eOtBdDr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161560; c=relaxed/simple;
	bh=kHep/UoJdFlSFtMOk5eTsBvsgTZFrj+duqNAdJba03Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEY/3bVD1HPYoKSplVB070HdeViM1aW4w0P8UkUAN7nQ+L/6XYd30nJjs7EfTxPelx4f6asHBpdW0qQTtvGKTKOs7st1Gke+k0TibqEAqnGdsIEtnFUIBF3l6Zuu3bUHVAVSmgUp6rO2hFCiv3Qf/qyrjqVQ9AZpMy7b7/eOybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MkqZVJCH; arc=none smtp.client-ip=91.218.175.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MkqZVJCH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kHep/UoJdFlSFtMOk5eTsBvsgTZFrj+duqNAdJba03Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790161551; v=1; x=1790766351;
 b=MkqZVJCHnoRDdwH7RFCfdDJBu9AfP9Frda3O+0ELIuouj9PyrRzvDoH+sm5cl+MgJfXh2EdY
 Bq0wellSkdE4QJHCGnnT4IwMEPeXeDaQgpivykwywUJfBKjxVI4Nr9TqvPcvSV1/X3SMlFi5Q+x
 pInY3vgXE69cRENGcRx4rP+g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccee37c1377e2234;
	Wed, 23 Sep 2026 11:05:41 +0000
X-Mizu-Trace-ID: ccee37c1377e2234
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso4518e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:05:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycORK3BxmFxfylFIKc5E1viVv3g0pB2QnacJhYZ3Ty8MoNhPMSOY6DYgab9Ukj5GzXCyNPqOtj03xEH0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nkb/P+PyL/K32JV5djJ+iRYYmZs4QjXmI6CJnWcZh93JSevIwH
	qZRHwQ/Kv7mvhvTTKtEigKXMdgoAwKiFe7tcNjPwbZsX5m97Ms93QWVLs3QeBnAacG4GYdGPFci
	f3y6K3xmXDDJsfemYjwhR5V2k7vMqXCIcMDsjK7jz
X-Received: by 2002:ac2:4c54:0:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5b8d915cbe7mr97644e87.5.1790161539952; Wed, 23 Sep 2026
 04:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-8-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-8-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:05:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwSRAGe4iP2E2V=b+baQ_GRYpYoNzJSft385m9E5RvEMg@mail.gmail.com>
X-Gm-Features: AcwNN1Xp8lA6R1poRNOfE-88mv5Px32o87Y3m3XsUHw9H9Pq7uMPdjPzqDpKw3o
Message-ID: <CA+EHjTwSRAGe4iP2E2V=b+baQ_GRYpYoNzJSft385m9E5RvEMg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] KVM: arm64: Propagate EHWPOISON in kvm_s2_fault_pin_pfn()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 15:19, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Currently kvm_s2_fault_pin_pfn() handles a poisoned page directly by
> sending a SIGBUS signal itself.
>
> This is an odd place to do it, the caller should decide what to do with
> errors, so move the handling to the sole caller, user_mem_abort().
>
> This lays the foundation for stage 2 pre-faulting which, arising from a
> synthetic fault, should not send a signal.
>
> In order to do so, check to see if user_mem_abort()'s caller has set result
> - i.e. whether it wants to be informed about the outcome of the fault
> handling.
>
> If it does, then it is implied that it should handle the -EHWPOISON error
> itself. This is the case for pre-faulting.
>
> Otherwise this is real hardware, so send the signal.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 221ea069f9bb..2576b967d20e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2016,10 +2016,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>                                       kvm_s2_fault_is_write(s2fd) ? FOLL_WRITE : 0,
>                                       &s2vi->map_writable, &s2vi->page);
>         if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
> -               if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
> -                       kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
> -                       return 0;
> -               }
> +               if (s2vi->pfn == KVM_PFN_ERR_HWPOISON)
> +                       return -EHWPOISON;
>                 return -EFAULT;
>         }
>
> @@ -2261,6 +2259,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
>          * get block mapping for device MMIO region.
>          */
>         ret = kvm_s2_fault_pin_pfn(s2fd, &s2vi);
> +       if (ret == -EHWPOISON) {
> +               /* If result is specified, let the caller handle this. */
> +               if (result)
> +                       return -EHWPOISON;
> +               kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi.vma_pagesize));
> +               return 0;
> +       }
>         if (ret != 1)
>                 return ret;
>
>
> --
> 2.55.0
>
