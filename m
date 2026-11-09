Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794254141;
	b=T5Ad8sm/fJFdC6uOuPzVivqRD+xJlgNKkaccTOa4fTgLVWwwjfg3UM+3d4NPgnVF6tQl
	 sYqNhXXiqGYSrUNfsBffF7g1f0nfN0i/KX5p7kyAqWzU6C+arkCrX+uWlvGg4VNrdxV6i
	 OYIjOx9a8Ous7dzVjJ27yc43IM7j9TqxDGW/TzhO8RtGvHhbIHogGlTw6DPGXGBohZCJO
	 hRIAaShCpbyKpaVLmIoAvhYOIbThc/trgrBrEBWzREXKhEheyoqXNLD+BJJF3oiZPobpN
	 0+3NnEOQ4T24SWT7PyWtWuNrGMXsJFUwUCnltbNDqSUOht5gHDDs8aJc153/8nfO6Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
	b=jpefuGN5YvEcdyY1gM+etmmOk5rxqWfew6wuWKRXzhBpe/OCL3HmgWywgKSWki+gElC1
	 aDZ2UIgfplJhx+waRcvUMxlR8H9RCVdEBZii3d9wZs9EfmsEp9d8X8GRPdAIo+KSBiOJY
	 hEYQlWUUHfVMPCk6O3T7cgkatjRJB1GVBbSrVPHQpaIbmV9hOCzBXNMloxjMaawi1h228
	 HNjCYbSATNjKCydUzz3wOdT+KorpFKQ50jh+YHaKd9sGtf1DeQp7h5VwQOKQnfAtbUOdp
	 w3kILpfisrBKwVvz7Nm5GEsVDael0iSrIJTCfOtJzTZS64AYDz4f4TVog7kvu302iZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nNuGxWm8;
	arc=fail smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D38606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D38606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nNuGxWm8
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f3c8958d5so139710885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254139; cv=none;
        d=google.com; s=arc-20260327;
        b=eT/L9Cg8IxQO+7KxbW0lXHjAsuG5UWkcTyjTwwfe/bTtt/6ty/IC6VKX1tkiju4z9y
         T9fxZlnKBpiii3Vbgbzhx0GB/kWEReU1BVTS7BOVKXncNo0ZO4BHVhhfMqSCQjbvqLDr
         NmWoyQB8C54/lcFKUz0PpRvUmovlZlbk9dmDRDYixiAdbk+0qs0kQNynWBMehKyxn3tr
         xbOLQLhx5JpvsCWEw6XeeELYVZtf8az082SpnxAnG2KhByfwocS3vxRoG88jK/jTFBQq
         DKrD2T2LLwQPwd+vnIGcK+S7EiGA3WkbDMKFCjdgwh1jAEth/EdL9645eb6Z1mEIYxCs
         vChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        fh=QJRahQoyNThESY4lXlYpXZAF2lYJ2xRMQTz0KOiBALI=;
        b=o3zJ+s9dxcikOP9rowwJvqKtoC51kgL00t4Q0iIBfABV11sXB06D0s58H3d3ImrjyF
         h1WWvv7goupDUfvmahq1DDBtPuIu8RxMaD6MqIFdleOcNG87rEhxtU29Pk56EGw2mnkQ
         ddiPEjWQHLmkdQ8slX6m4kfcry/fby4IYfJ7eUeg1VXrFquSJ4QKyGBhyt2hKJMZ6bws
         z8HCVyPZhB2q0kasBgaC5z51dYn4W+lRa+1Gj+5+VXmaL/PcP7IvJIhWjzgQGyWKfDQN
         e5vIHLI3mGpRTSBJ9p+jhm4DYTzscm4Srv9bjBul13LmCvbw6qpYNOJIayq1AGPK+/zy
         qePg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254139; x=1794858939; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=nNuGxWm8Llt4wMSkTawrXFCtJ01glbLkTUhNNxKxqyXsBD0dSWALjhimvqMhO2OxRn
         QVdVQipKx5PjIzJEQQr/sF8toDoGfl0PguXQ/4OZetVUxLVDejmRRFUvTHUI/MQDaUm6
         8xQcLCMRsZ/aD7IQSLJ8XJcnm66ipa+y/gsifit5VlukaYh7OimEPUbRz2bBDAJ2WA0s
         jsSVMH6GELppwjZ5ZNBP0ONytHjT/rt0/OInzCOvGgAOh7rMmMb0lM1H77QtAB/hxoyt
         ZF/DPHqsC6C3PkbWztg92OZJdOSd2fcopjzCFlKGZ6+neC1XBI7g0tv5xX/u8f5p6+/k
         UDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254139; x=1794858939;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=bLUYIMOWMdUaEOPufDoKMbLNvf5rGva/ZXRdTtnTlsACG6ZlS/nsxWEy7BlehAR4pH
         hNHpC60u+8M8oxnYsS9sFucXSwgx8HlP8JaRloU4sgyfvjEAOvjx0xm5q0j+8BMSeR0L
         DcRNkQZ60z6r0LmbtU7C9fRq4udbqT1JXMbioc9Ct2himfmGqQIK77YgiVuBeDG6YfrI
         ywHOBDf3yzMV6aIZxjd/NHI7UtzcK6U9Sij/GB6KXkpD6UAyP1K7i0v84XgdUaKOg2rX
         HpoP6JgFVacrHCXlHYr0BbxY1SMLh3sMg8j+dxHN1P7vy2IPrwJQD7jpVqtqOtCLSqLa
         BleA==
X-Forwarded-Encrypted: i=1; AL+hErEnrOCpsW7QWTdWOcEVe2a+mt+WqO1hEQxkhrDeUWJwu6JCI3q0XY52E2zhrVs6xypMil//4+SStgli1fA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjL0Yh+kCh0hLoU9mTENxl/SNlTclljPBOs1gIjus1SwmmkID
	XzDx8SzZDSyogzy63cQ+IpbDzik9mLR54PxYOU++cRsacHQqsT3x1IDjZdmUFc4r3cAQe41jYg4
	ElfQDQ2nNWi69EbKqtPiUyseE5Jw63OpS5wuP+Ret
X-Gm-Gg: AYBFou3TykXD6Brt5mouoUL0y7HHIjVztFzqmNqE0iFYztR8OtIRq+w38RN31dlR49Y
	ujfQk2i39f40ZZVFuwnYKdfXthLDZjr1LDxClfxoK8xqZBp/uetaVvlWKAM/+5PEnD0htEkEzM9
	RQzKsCzcCc1BA22jWr8i1eWMVH+YQQG5NrNCu+OjQRUUhO4vY+K6lfRPfn0LjiEcwERp7gKdH5p
	3lADXlCE7ezspWGMm8h3CU1SGxQ8sk3l19PtgpOUJTDF/rnyp3IJkWpykvzYFm4WhOqIxiRnsE7
	CwV1BqHXAqjuZD1KzznrmldXDEqih364ZNw+EapK0sU/+xuo8/4XP4ST1OP19VC21ulsUcortyR
	zT0dUPiKfuLj1B84RpxmyYv1BIVnFmNzm08KqahU9LjKKQEEu+GJKKdFXjGDsmRMBgk+PdBJKy0
	btFkmQqyS7qm2lQn/RRvFqxtE=
X-Received: by 2002:a05:620a:710b:b0:93e:49eb:a274 with SMTP id
 af79cd13be357-9479f2fa7d5mr94788085a.23.1794254138721; Mon, 09 Nov 2026
 11:55:38 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:55:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:55:37 -0800
X-Gm-Features: AclHuK-fw27NEX4WLMeH0MQEMu23wQjUHEw6LG3xIqCQa_4vVj4k3LjJhmBS0EU
Message-ID: <CAEvNRgFvkWCM_JDxiamzQW=stgOnY0Xum5aphVv-Zo941zx2sg@mail.gmail.com>
Subject: Re: [PATCH v16 09/20] KVM: selftests: Set up TDX boot code region
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
>  /* Leave marker so size of td_boot code can be computed. */
>  .globl td_boot_code_end
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> index 564144c40f0a..b4a7089b3636 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -1,8 +1,46 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
> +#include <linux/sizes.h>
> +
>  #include "processor.h"
> +#include "tdx/td_boot.h"
>  #include "tdx/tdx_util.h"
>
> +/* Arbitrarily selected to avoid overlaps with anything else */
> +#define TD_BOOT_CODE_SLOT	20
> +
> +#define X86_RESET_VECTOR	0xfffffff0ul
> +
> +void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
> +{
> +	const size_t total_size = TD_BOOT_CODE_SIZE;

This caught my attention because it wasn't quite reverse-fir-tree
ordering.

Naming is confusing here since there's both TD_BOOT_CODE_SIZE and
boot_code_size, so which is the boot code and what is the right size?

If the only use of TD_BOOT_CODE_SIZE is here then maybe we could just
directly memcpy (td_boot_code_end - td_boot) and not have the macro.

> +	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
> +	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
> +	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
> +	size_t nr_pages = (SZ_4G - alloc_gpa) / PAGE_SIZE;
> +	u64 gmem_flags = 0;
> +	gpa_t gpa;
> +	u8 *hva;
> +
> +	if (kvm_has_gmem_attributes)
> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
> +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
> +		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> +
> +	gpa = ____vm_phy_pages_alloc(vm, nr_pages, alloc_gpa,
> +				     TD_BOOT_CODE_SLOT, true, false);
> +	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc");
> +
> +	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
> +	hva = addr_gpa2hva(vm, boot_code_gpa);
> +	memcpy(hva, td_boot, total_size);
> +
> +	hva += boot_code_size;
> +	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
> +		    "Expected RESET vector at hva 0x%lx, got %lx",
> +		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);

TEST_ASSERT_EQ would work here, same for the == assertion above.

Not a huge issue,

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +}
> +
>  static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>  {
>  	static struct kvm_tdx_capabilities *tdx_cap;
>
> --
> 2.56.0.455.g6c5a503b38-goog
