Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFB54EEDE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894198; cv=pass; b=SRvMzm/x03z0gAoJoZvi/lXTZxLhsTJdgC6uAwsmGqKuWSzeuZR3CeNEzutxHkropfKkQj7CZ0RKiz6UhpBNei/kDmEyphkGtEjx8K1FbooAJ2WJhlVk7QMtbm/tLLVF2Ct3xwDpBsj92fy/m6cLdAZU/QlJTVc2XJp01Wz/qh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894198; c=relaxed/simple;
	bh=SirRPd8MEjuE0M+o4ZIQ6nFLVuzs+EvDMR2q6/kdoLg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7CDayzEOtLRpfbQvQGrqgrIBECMik+5FDb7lNdw/gRPahVn7gvpesTB2oEiFbnE8xe3O5s0+ArCgGJHzcS16tl6L5NwCKxZRwqCmAU4xn7OK+1FI7LStfAHZkPAzYwzfYcibprPJp37jVUaxLRYmEttR4N2xGUvVxTB9TSBrkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e1EVrW76; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e1EVrW76"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cbff85fa9so57383356d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894196; cv=none;
        d=google.com; s=arc-20260327;
        b=rDS4K+QAQZuW49g8ZxDWOkrwE9Np2uJe/9NJQFfEos+y3dDZxPTHQj+3IFWFsSJv6s
         XItsUnQX5zDByRKNlvQ1flfBRhzw9KdBTUfZbjewihp+y/Cj28k+bq2OEaaJhnfQ5Qfu
         +sa1P6G7SU+kwY70D2cDQoNODqrFJPKqfZ2DlieTZBj77Y9Nga8pbQDXls0fGyTD24vh
         gk8WHHIHSOSvTe8iYsM8i335l5i6YOavKl0TwEXnUtdaWtOkZSuzReE/7dXsM/nFQtlk
         JfqgPGXVLl7G+MlAsG7Fbf9Onixb3wPmjKCFXLIjfcjAnkXcCJwIzn8IAm65psDN2qKT
         RAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        fh=kJUsnPKBxlwvq4rSpNfObEcfoS4y6HWJ9BSDkfpLGhQ=;
        b=SrH7ccZ0GXtHM8oVldT0kr0pQY4PIEKxdbV0DNNMGjaWu0rVaSyF4mihR8WPr1JxRi
         NVcr5vjvlBkbQdoisxaM7oUoHXqtipnNWFHo1FXyQm0nKcsvtdJodMTBKRXrWkim2jgW
         pSqzCdpFrVa9rDX7wHsj1xu3ODe6yaIJS/w+RhVV6xpTcHi1hWWuVACazWvrTiuUeaev
         DJnpNA1n8IcBSNi0WlSymcA5uTFIZ3na5TwOk+qhCdzKEhyWTvfpAT49gEC1gKYgBMQL
         8TM2uBHLljjLqJnr44noTbIVib0VtAulYuLPn0Vpax1HF58PAKFOON3XV0sEoZkZpGOA
         M5xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894196; x=1789498996; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=e1EVrW76BBG0E675zCehzGN7IUQkDqEufHhCByC9gs4Glw0nOevcXnWk0IthW+lgCx
         bqjLlSH9EwviWwblAUtvARIlJfu3bw8JKXcSJBAzIzamPeDKZJUU9REJvsFREI/xobdZ
         8zDF70q5rB8r4uic97Oq7aLs5Swnn7Jib6OAuMI8GbGHcMZE/5UemQ6MjA7tM8Ueeb35
         4XhFD3VL6yLFf0MVsxT2T9oR90YjbASqtaUD+FZortO5kLTCFg80mk7unrFuc0h/rNnm
         zuCDe/17AbUo0xGdlMxEfhfb7ZYzj7kOJF+/Lsw+3NkZj/31V+AztKvfrMoVaBvLeXQv
         m7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894196; x=1789498996;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=jDchPIALQpjhxF3sbrW22qYn5fUdBw3IlbyKeyqry/dIuZ9U3Lzr06Ptm1rKn2Eyt9
         e/UM19fPwF4E3D4eBL/BmuciR6HpMW28GvK+UchB0ehXbA5mBz3GoOKU9HM7BSVyWfDH
         V2AbKWPfIrfR2ikWvbsj5lmkMeeCB45QKiX6S25kzNjy2HilI3o/1RZeO1vcVXZTcquu
         zv3PP28hsh3l+5i0vNaF7+pDj3HyjmoiCueD8b40VwXkDDju1uUNj22ZKFbTr3eBNpt7
         +xcXErL3J6NgfTKS2N4uPn0zkWW57rYZ5oc5wmuXWZxaef0XKFRF2ms+gvbn+x/VAy5k
         Udtg==
X-Forwarded-Encrypted: i=1; AKwUvByy144Qf1m3BJ5qqDG755Hr1YGdCwAfm5mepkdB4ZxEXUs4n4yxBfoj9xAUO+nPFXfnSnS+kPxEQ5yNIfc=@vger.kernel.org
X-Gm-Message-State: AFuF++ktr0oPOICAshSP1llS1+EPgJ2UbIfr4K7GSLSKMnf+Rs1mmvtg
	j0NFyAYB+VtXQN1yD3RnMNC7D69fQRYDmwpZC3kjowReh00WZPOtQXKro1kRJv6y+fWumsXWloW
	iU3YG0phTCexrTMcevZEP9Ovurtjs8aIRXU36OBHm
X-Gm-Gg: AYBFou1XD2Q7grLdUhqFlbjlOaR1N0I7Kr68qE/ZUNa1tCLRhXfXspdU3kkfWnWCYDH
	KaBTv+Puw0YxvTNJq4NFUTk1vozt3KMcnvH5TbPxWN9gIv47L9HTF/mV+6XBlGsxeiAKKLCfCpG
	Vr7YSgeH91cW0aoczKgQ6muT6NYXva2sMU7YwVIhzrn4soigT/x6u8izKnngJaE7EbJt6e54beN
	1aoRFg5RbaoBTROrvOzJuICK1oOuYEyq/KdoKe4NGAPmNBnc/th+4XIrVr9RBE8dPwXQb8xafzV
	dcOR/OE7KRqhy42+aWHBwuBXZ5+3y0UaX/TIOHvARAyVS8tf9TTzVmUMpuosMXgKASRrLKni26G
	A0DJfEbdOnKD9ipk1vqKJ/Mg8q14qrkE=
X-Received: by 2002:a05:6214:4287:b0:90e:7bee:9a6c with SMTP id
 6a1803df08f44-9103ef88de7mr407562466d6.19.1788894194840; Tue, 08 Sep 2026
 12:03:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:03:13 -0700
X-Gm-Features: AcwNN1V9Kl5cU_xU1Qz969rvQ0JujFNCbBSW6jqcW2Xx-zikXZHSBnXLwAN1H4g
Message-ID: <CAEvNRgFiMWb_n4nL8E2HBfkQ247GEhGQ3us_cfoQG4-JBiD2aA@mail.gmail.com>
Subject: Re: [PATCH v14 05/22] KVM: selftests: Expose segment definitions to
 assembly files
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
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

> From: Sagi Shahar <sagis@google.com>
>
> Move kernel segment definitions to a separate file which can be included
> from assembly files.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
>  tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> new file mode 100644
> index 000000000000..713b6bc0aeb7
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Used for storing defines used by both c and assembly code.
> + */
> +#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
> +#define SELFTEST_KVM_PROCESSOR_ASM_H
> +
> +#define KERNEL_CS	0x8
> +#define KERNEL_DS	0x10
> +#define KERNEL_TSS	0x18
> +
> +#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 7d23344854cc..97acc5aaf7b7 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -8,6 +8,7 @@
>  #include "kvm_util.h"
>  #include "pmu.h"
>  #include "processor.h"
> +#include "processor_asm.h"
>  #include "smm.h"
>  #include "svm_util.h"
>  #include "sev.h"
> @@ -18,10 +19,6 @@
>  #define NUM_INTERRUPTS 256
>  #endif
>
> -#define KERNEL_CS	0x8
> -#define KERNEL_DS	0x10
> -#define KERNEL_TSS	0x18
> -
>  gva_t exception_handlers;
>  bool host_cpu_is_amd;
>  bool host_cpu_is_intel;
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
