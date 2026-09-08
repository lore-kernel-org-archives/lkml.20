Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E377274641
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854704; cv=none; b=PrMmh/T/DJZyPI6f654l1xQ7r79w9HFe9Jbjcy6VIhB8v2XfRuRJo4FNr/YSaC3zep10Rum6YkMMb1Ba100O2V0gJlH3uPTClRPlIrqeIYXxlz0Tyd4TsTgqkNC5un3q2JJI/G+cbrjulkvyKWLWMlNjULuZjuT9oM/Clb8BCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854704; c=relaxed/simple;
	bh=A2d081V5u9O9db2fGR1Uw/LCtJvvhhWQH/7b76K7e9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+dUoowqPwbjADVrk29qCHbHRA8G2nFVSFH5gJaCamoHr8NDGIGex1ZqHesE18La5+b81Fd5ZkOuyxUWYvndMSmeb+uNKBgOtUJ+cTgwqFRSPcdTnmz43UIfgwTgv6nljpILuat74yko0hXMx9GLlxejCqTffO7d2h71v4zXSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jxlqfy63; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jxlqfy63"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so190065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788854702; x=1789459502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N6N0od/sVrug4dpoGO2TXWMVX/OvNe36xacdNRKZ9rU=;
        b=jxlqfy63N07ZXZ7NwDPBgDQBFsv0CVcuv8bbJ0W6fPLuZWX9+/JZecT2VKUJ+anTtt
         fBOATkGI0QFshjy5i4aHcql27aCnZiR1W9Lx2rGE7ACsR6p091gChAYdFY5oyeI3QDNP
         898ERq+TH5LCr+EsZksk94SIATb/Iw+Kbv8W59x140ymnTGDrd3PZn2nnW0IpPnwdA5x
         jsvTvwDgmNKc8LBN3X/hRogAevsxoSBB1cpgDNvOGKWyM2mAEGYQNQJUfkHLYwZ66nec
         50Tk1jbh+XFZfFZa6XyJN993J8eYzaWQkyitAn1Mwgm90NYI7F1k4sYtoG1bEXINPczR
         KLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854702; x=1789459502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6N0od/sVrug4dpoGO2TXWMVX/OvNe36xacdNRKZ9rU=;
        b=epFMwwt/UpQ6B0uEbXAMrDDcI8nKkI2HuODh5Z2rvY4dN/Ox/MSLvZwh1QcyzjtuhK
         WkguJPrJErJGSSaW8+Tq3ni4GjOAlcQ8mJnTcKLqXKzF3kUbXahAqflSL5siVawOULTS
         xAbhhcZdpFQRnm4WCrc/gyM95G2u8WsRovrTfIvYlEkXeCx+Gr0B4RHVQMPp3ab9Uk9z
         ooquyc7syMbEcfR0KdrPm+hYw9Oq5yrteCyRaDW4Gro/Bvsxac5LbH0to80mz9Jsie4T
         P7Vt0HL8EhKOmWMzpltk4nh67iwN30I4Z650CsRrCdGovVA5nFHb3SKSJ03bNlxL4JZB
         TNGQ==
X-Forwarded-Encrypted: i=1; AKwUvBytdcV2HZgzqibfGpa7i/WLoeTGD6a3tqquHbWXfKGwhsx5L/97igX1haL7x102c3Qx5foaWIKhIUnkIyw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbQU8Ztf0999JB05AAFJkqZTPutPD5IvK394MyxGBn0qk+UeTg
	1YQOEsI35pi/jGjmjmzZKC8rGqa+LAOPS9Dua4WwfDWASZu14THUEW9iDcc0GB0qyA==
X-Gm-Gg: AYBFou3Gr2gRNI3BFB0Gecy2b8yf8lXMNMQl7wi16V31u5U8Y4Ak5WIqL27vBVBE/Fu
	DSOIONuXHHMLkXVEf3myeGxMFxHdfX3fqThvvKnJ3QjiS4WRPMwumEAqoKOCA+blyT/GgdGHwdg
	5Apr570Y+XhNF9Krn2D3htOtFo0epei2aIH8usJpmoWyAkBmZCT6XMyFrOJGXbWfdSdxvcgOEXn
	wM+xJd6LGyKrM/Ww6F4d08U3x2JkymBzTuAL15NmSJ//7C5/qv6liCcQiKANwGIW3D9+N6mjulL
	L5JHASiVUGF5UmOQg7O/D+/m2Mvd/yN2rTamy/z6JsRvuwqTQIb2P34qVVtBPl1zgI0Vpi0KFNH
	bfsuqwK557WbrNA6M2vFWIsmrKSlIr01q65mYYsroSkpf2xkNoJjKnuQNGEYH78+8CuwIf5gWqB
	2gD0sX7vspshgXR0h6AWgPMLcsfzDag6sBqdKlMJXnnJOk1AbbYWGugXuVT5U/11aT2YppTgWzi
	H4Vmcy1pngRb2s3Bpkn/A==
X-Received: by 2002:a17:903:1968:b0:2d5:db38:8013 with SMTP id d9443c01a7336-2db290965e6mr13546505ad.18.1788854701219;
        Tue, 08 Sep 2026 01:05:01 -0700 (PDT)
Received: from google.com (195.5.127.34.bc.googleusercontent.com. [34.127.5.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499d92dsm54262635ad.52.2026.09.08.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:04:56 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:04:53 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <ap_Bpe7dZm_eWsJ2@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-3-15ad654a50db@google.com>
 <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>

On Thu, Jul 23, 2026 at 04:44:08PM +0800, Xiaoyao Li wrote:
> > + */
> > +#define __tdx_vm_ioctl(vm, cmd, _flags, arg)				\
> 
> sev uses the name __vm_sev_ioctl, I think we need to keep them consistent.

While __vm_tdx_ioctl matches SEV, the TDX selftest follows a tdx_<scope>_*
naming convention (1. TDX prefix, 2. Scope: VM or vCPU). I named it
__tdx_vm_ioctl to keep the TDX codebase internally consistent.[1]

Do you think we should align with SEV's naming convention instead of
sticking with the internal TDX pattern?

[1]: https://lore.kernel.org/kvm/489f3c7b-db03-43dc-bb64-910a0fcba31e@intel.com/

> > +({									\
> > +	u64 r;								\
> > +									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),					\
> > +		.data = (u64)(arg),					\
> > +	} };								\
> > +									\
> > +	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +	r ?: tdx_cmd.c.hw_error;					\
> 
> I know it takes the same handling from __vm_sev_ioctl(). But I think the
> handling for hw_error is not correct, at least for TDX (I didn't check for
> SEV).
> 
> the hw_error is the additional info, to tell the SEAMCALL return code, when
> the IOCTL fails. KVM requires hw_error to be in the input, and KVM puts the
> SEAMCALL return code into hw_error when the IOCTL fails due to SEAMCALL
> failure. That means, when r == 0, the hw_error is always 0.
> 
> I think we need to provide hw_error along with r to the caller so that
> caller can print them together.

I think the value of r is not important, because the ioctl failure
is already captured in errno.

We only need to fix the return values for SEV and TDX and have
TEST_ASSERT_* print formatted error logs with errno and hw_error.

- r ?: {tdx, sev}_cmd.c.hw_error;
+ r ? {tdx, sev}_cmd.c.hw_error : 0;

> > +})
> > +
> > +#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
> > +({									\
> > +	u64 ret = __tdx_vm_ioctl(vm, cmd, flags, arg);			\
> > +									\
> > +	if (ret) {							\
> > +		TEST_ASSERT(!ret,					\
> > +			    "%s failed, rc: 0x%llx errno: %i (%s)",	\
> > +			    #cmd, (unsigned long long)ret,		\
> > +			    errno, strerror(errno));			\
> 
> The if() looks silly. Why add it? And why change it from
> __TEST_ASSERT_VM_VCPU_IOCTL() in the v13?
> 
> Considering the suggestion of hw_error above, I think we need to introduce
> the TEST_ASSERT_TDX_VM_VCPU_IOCTL() which accepts additional hw_error?

The reason we could not use __TEST_ASSERT_VM_VCPU_IOCTL() directly[2] is
because it formats ther return value as %i (32-bit), whereas
__tdx_vm_ioctl might return a u64 hardware error code.

I agree with your suggestion to introduce a new
TEST_ASSERT_TDX_VM_VCPU_IOCTL() macro to print out u64 hardware error
code properly.

[2]: https://lore.kernel.org/all/a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com/

> <snip>
> > diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> > new file mode 100644
> > index 000000000000..e1ffb67a106c
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include "processor.h"
> > +#include "tdx/tdx_util.h"
> > +
> > +static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> 
> make it const, is better.

Thanks, noted.

> > +	init_vm->attributes = attributes;
> 
> Besides CPUID, it only allows attributes to be configure but leave XFAM as
> 0. I think the changelog needs to explain why we need to configure
> attributes.

Thanks, noted.

> The rest of the patch looks good to me.
 
