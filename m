Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794252991;
	b=V6A9dZdNj7R7HDNF8QbZdlLY1i/hxqct3/+ni3G1VQZ5dZjDuIA9HMDj0ktLacu442GG
	 gVy3KTPTmo4ObjYsAulsBAfP5Ci9LdigNZ4XT6rFbcSa9zxhOz4ld1hD5gV0Od2MxO59G
	 PonWKZbQlWEuKM4YrXpW3JzgeC7rn0LD/k9cZqPXorHKqFSn7i9zVnalFWYtYYb90olCi
	 J9auxgu0vI+hBz0HhsRN4QA+LmZStgG1DKqHWjaQ6oWVNCezyFrpDwbXtPBYl/At8z8qK
	 CJF5pcMLYIA+nIsmFKwzJRE4+nqc8difOoSraNKlmNPq8xPlDuzfof2NGE7I7yPYxjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
	b=ABlPc8PYS+hAcdTK9cLFKWmZ5b2+UDAm85WAH0uAo2ETi9KvNsye70kqZ0X1lW7L9ugD
	 RjnRSf3KWH8jlXj5OdRdL4nfTm5wW2XI0e/k9A8DO9Ec+xu/wMdm5Yh46KkYp9QM1jeF0
	 t2IrDUEB1bc9EqKyYC8fWeXMibc3Up8osFmdz2/yjFRdFQPtffrGjyuS1xV2Y8IZSS+B+
	 BWMWGKxU9kX8f6JYRwJchRip7hOaKCN1RESGDBijcobt2DuQyYQUCmUE+LuUDCSo7YFZz
	 zPhC9f3bpXMjysBtir5AG0CjagYlUH7xy4lkc7x8T95i4cIceNW1yvPtM5qOAioF/5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpKNcnVh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E7E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpKNcnVh
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91eb7d1478cso13136606d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794252989; cv=none;
        d=google.com; s=arc-20260327;
        b=gp7UJjWMy56ZJ8b1aODe/nD7nS02Mus8L3UPjSYsyCmUlU3nxbVRxJQ7yMMEwMEjme
         9H77msi9EY5qKVKKF8JY9PwOa4BsoBqThitZ0hwVEaB41lrXlUSjSeeRjkAJWBEfXyaD
         iB0F2ft81ToUyJBePfKVdhhyOLDz3zAMsW+c9JSoQoHnAjsC+kOAiSP/yL4iNMwHoHIc
         0okaI1X42AQXYIy4kvfPILMKKWD3HY3QeToR8Xz2An4ziU2U9xyxNtrPQ1aE/QW+TyH+
         0JbeJf8ZL9doGPSmzukDf9ER9Z6q0KmFWlIpAXFaHabmbtMo45VYuMnCQzgYdPL+ylZ2
         gU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        fh=ZeCRMBdvA2gVMxQy9yqmQrpO5ZVkG8JnB5uCcOy7/Ho=;
        b=bWylIhS1fcrxdNX2IHelBUNs5fhYb8DKtmCVpBlCpz1GHVKCc+XgrUU18PFA5W347c
         Fq8mViQ+zzA/YR5SF2LpPgEZJAgbShF+9OJFh1Kirc1j0vxnbQbdwZtuBOPdn/x5DTzA
         AZe9fdByukPeNKTo3n0jUXzkM0Y+JdMGjk+HZTf8fuCff0M8m8CrfbIjNeYZhqSOGwk9
         zouVcZYEEKYfa/UWNRWXrP7Zq6DibtS4NMkqXXkr3hluRNssIOm/Pn5rdwJS/3Vjan1t
         MWLC0CFH8Kvm3szIOSbwHe44IxV1aRtT3hu+UyKGXs10MuxWN4sgKM6lyhzPd5rxaAr/
         l1fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794252989; x=1794857789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        b=fpKNcnVh/2I+iG6wihxClu2CwKcNoccri64fWdEO0ipq/RVkJMjOD222Zw3hXtrNg5
         c5wuWhzONHfOhIG7rIUvYsVZh4882YDw9HhHd8OTJwi0exuJgK9afPsOmyj+srdxrI5Y
         uK9KswQYhNbGVtJNawsDvvEt3GuVRvT+641RMqV/1NiOPinEAnpglkliHfuxFm0fdfkR
         wrEtqzqstVjBlHG9WXc3TOLxGkrKyHhkporF9CHGN5y2CWWm3Eabzyyg499wD2x/rx93
         s2zQPpA4Mf+DVx+gAmYsp0uWJ8kDas5Z8z1wvd+LD/29yo2wNby4TVy3ftswRFw6ADyz
         y3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252989; x=1794857789;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNS0rvY8L2G1kXx/9AEiQVl5+WbZi21fC5nZTW3I69E=;
        b=niLhCBcWR3DH0MyIOlXQH5bMzNqemxmVsDEfwok1yzjeZnSIAu73ZfxLr425TcZcDV
         wMqDGZIXT3O+i8dHVuflyqoQf7eg7BX68Kfa6piIiSKd/4pfaLIIxzc9jsn+BXYNfd8B
         o/dgwP1msimNu3rFx1CV3FhFum3c+rRjOmpUjro0Mge1jTBN7LxE6UonTq6mzP6BLyTy
         uq7bQaJG+eIa7Haw57KzswgfR4ku3a+Kiib6qP+dxnbpATC9Z5+ytNISXY2nAk8bHUDr
         vmmdGIkOxxM85j6aNygfot5PTJ19DTEyJ/BNivmnFft1kNBJ3uzfmF5XZpvRX6NMbsea
         zsTA==
X-Forwarded-Encrypted: i=1; AL+hErHIgxLDx/1w4hrNJLf7q5wCzElss0xZFruH7L9E6p8VKvK8W2l8DohFE3EAlLC/zhCPA18K3jEzUGqVTEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ezi+sI3OtM0bR7RjBVWvwvZkBOoNwP/BplZLAr3evxN/v3yHo
	11mkMEk+2mBnLFMxMsXsHEPC92JIi7ZTd2fId3QBKYhK3YBsYqHC2B8QeYKMkVgYsQeju6Hu83I
	8EnJylwJsuksKAWbPLagoAjoyPKiAkB4ZdW9BUMtd
X-Gm-Gg: AYBFou2hG9AKpf2YI7nj8E9zR16Gk794/JQ8gRotPvzGxp6o3UT6OBFpZ+iNEsoSlR2
	ZyIVJsx7Y5KXXi5xmuP5eJ10oek7CLZTf8vz1OLbOoBp5OHbi1kWkUn3GNLrZ3SpoYyvc9LX5+Q
	xDo9zYh++i9tqGLaLIHarn8dYSg1aWxkHh4YCUXvvjkBgmqQlQBIVMtjVO9xYlw1ovx+U/PPjG1
	PpfxS/0HVA9kMHkN3nj4ebDutx2ecDlk6TnrBb3MK7ld9HSLySJks2+T/VIM1sVUw85LfNT3PJS
	hlkAU8A8Q+yUxIEADQQ3SXIBMyim1VwRVHrSXRc5W3+wxRfToKpZZeJu42VbHeBg32jSWFnA005
	SETKEq8jsgp6Rt6Q0oiTu0Gw8fxpbE1EmicwxFR4ZXVop/AQpBryHM9jjwP/4dHre5lrCjbKCoe
	YWBoC0W7TBankNMULTTFkC/Wg=
X-Received: by 2002:a05:6214:5bc5:b0:91e:8cb1:b84e with SMTP id
 6a1803df08f44-91eef92240emr10728756d6.24.1794252988739; Mon, 09 Nov 2026
 11:36:28 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:36:27 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:36:27 -0800
X-Gm-Features: AclHuK-BA2NXsbSfd5J99KlC06brlgAuU8dZlouTP4cLRD_A5AkBQuIm7WWoo_s
Message-ID: <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
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
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> new file mode 100644
> index 000000000000..564144c40f0a
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "processor.h"
> +#include "tdx/tdx_util.h"
> +
> +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> +{
> +	static struct kvm_tdx_capabilities *tdx_cap;
> +	int nr_cpuid_configs = 4;
> +	int rc = -1;
> +	int i;
> +
> +	if (tdx_cap)
> +		return tdx_cap;
> +
> +	do {
> +		nr_cpuid_configs *= 2;
> +
> +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
> +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));

Would be nice if struct_size() could be used here instead of manual
calculation of the size. Same below.

> +		TEST_ASSERT(tdx_cap,
> +			    "Could not allocate memory for tdx capability nr_cpuid_configs %d",
> +			    nr_cpuid_configs);
> +
> +		tdx_cap->cpuid.nent = nr_cpuid_configs;
> +		rc = __tdx_vm_ioctl(vm, KVM_TDX_CAPABILITIES, 0, tdx_cap, NULL);
> +	} while (rc < 0 && errno == E2BIG);
> +
> +	TEST_ASSERT(rc == 0, "KVM_TDX_CAPABILITIES failed: %d %d",
> +		    rc, errno);
> +
> +	pr_debug("tdx_cap: supported_attrs: 0x%016llx\n"
> +		 "tdx_cap: supported_xfam 0x%016llx\n",
> +		 tdx_cap->supported_attrs, tdx_cap->supported_xfam);
> +
> +	for (i = 0; i < tdx_cap->cpuid.nent; i++) {
> +		const struct kvm_cpuid_entry2 *config = &tdx_cap->cpuid.entries[i];
> +
> +		pr_debug("cpuid config[%d]: leaf 0x%x sub_leaf 0x%x eax 0x%08x ebx 0x%08x ecx 0x%08x edx 0x%08x\n",
> +			 i, config->function, config->index,
> +			 config->eax, config->ebx, config->ecx, config->edx);
> +	}
> +
> +	return tdx_cap;
> +}
> +
> +/*
> + * For each CPUID leaf in @cpuid_data, filter out unsupported bits based on the
> + * capabilities reported by KVM.
> + */
> +static void tdx_filter_cpuid(struct kvm_vm *vm,
> +			     struct kvm_cpuid2 *cpuid_data)
> +{
> +	const struct kvm_tdx_capabilities *tdx_cap;
> +	const struct kvm_cpuid_entry2 *config;
> +	struct kvm_cpuid_entry2 *e;
> +	int i;
> +
> +	tdx_cap = tdx_read_capabilities(vm);
> +
> +	i = 0;
> +	while (i < cpuid_data->nent) {
> +		e = cpuid_data->entries + i;
> +		config = __get_cpuid_entry(&tdx_cap->cpuid, e->function, e->index);
> +
> +		if (!config) {
> +			int left = cpuid_data->nent - i - 1;
> +
> +			if (left > 0)
> +				memmove(cpuid_data->entries + i,
> +					cpuid_data->entries + i + 1,
> +					sizeof(*cpuid_data->entries) * left);
> +			cpuid_data->nent--;
> +			continue;
> +		}
> +
> +		e->eax &= config->eax;
> +		e->ebx &= config->ebx;
> +		e->ecx &= config->ecx;
> +		e->edx &= config->edx;
> +
> +		i++;
> +	}
> +}
> +
> +void tdx_init_vm(struct kvm_vm *vm)
> +{
> +	struct kvm_tdx_init_vm *init_vm;
> +	const struct kvm_cpuid2 *tmp;
> +
> +	tmp = kvm_get_supported_cpuid();
> +
> +	init_vm = calloc(1, sizeof(*init_vm) +
> +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);

Would it be possible to use struct_size() here?
Or perhaps kvm_cpuid2_size(tmp->nent)?

> +	TEST_ASSERT(init_vm, "init_vm allocation failed");
> +
> +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
> +	init_vm->cpuid.padding = 0;
> +	tdx_filter_cpuid(vm, &init_vm->cpuid);

How about something like this?

1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
2. Allocate init_vm sized for at most N entries, since the filtered
   result can never exceed TDX's supported CPUID set.
3. Iterate over the TDX CPUID capabilities, look each one up in
   kvm_get_supported_cpuid(), and append matching, masked entries
   directly into init_vm->cpuid.entries.

This would avoid the memcpy and all the memmoves, though this works
as-is. Just an optimization/different perspective.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +
> +	/*
> +	 * Set attributes and xfam to 0 to use KVM's baseline config, as KVM
> +	 * automatically ORs in the mandatory fixed-1 bits during
> +	 * KVM_TDX_INIT_VM.  Note, TDX_TD_ATTR_SEPT_VE_DISABLE is not required
> +	 * because all initial private memory is pre-mapped before running the
> +	 * TD.
> +	 */
> +	init_vm->attributes = 0;
> +	init_vm->xfam = 0;
> +
> +	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
> +
> +	free(init_vm);
> +}
>
> --
> 2.56.0.455.g6c5a503b38-goog
