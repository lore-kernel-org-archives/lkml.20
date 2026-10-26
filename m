Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974812;
	b=kmlyEBklo8b9lRKqp6iFFqvTYP7FSdu7mikNzCUly5wCNFmpjq0v9J4lUG7aPJ9k1yhs
	 0o+TjBrjUCXyb7chbPUr7xRe1XlkcnEtHF7Rcm7+iQiVDewm9dYLvmZagaDi64kiRQ2es
	 oEasEvEn2cRVtedgPPDbcy+P/lvQ8FDGeJv7sASLwjDtcBXxgbRYGvE2r/wTshTPpsEez
	 K4/T1+mbWlNl9h7D8HVHYzBGg5zajKCB2XnbV/IE1k78tFvglH7VXuVSl5DYZpbE+5S2a
	 Ik5ODqm9L7B3GHU7hwee/GlRVEwKTH9voG9Jr5/C+ON7CeY4HtNV5VL1f2kCU7IDxcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974812;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KGg0YaTfqauJu0vVxfgSJ3rCnmQ5A64hk6E/ER/6bh8=;
	b=rsP2HwPHNcGcs2gprs8vd3E4OaXXiyP/ABjgFu07V9Yv/zIm8Uf3ARua8/ycEzM7ngSS
	 oGw7DF2Y1EPoKFLH8FjC/cQkjVlbAkYgna6MT+6Xf6o0aKqYj086RO7RXMKfzHaAfIRiM
	 ZASar/AIjetW/ao1lgn3KADaTfzmt5rRt5+BIkhSpbYXb17tSyp4jSZlf/mJtOcJ/7KrE
	 tCg6ycH+G2M00mCdY1ac1gejdeGcmkmGTATDJlL3TT00LVYXDnyfFPT7XYERdvhjcfagf
	 ecoVg1KPwFpfnWWWdg2/pak5dxUpqDExplQa/ba364yQINkOKjQBKwDbVYnwTiurGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6Sjmp4h;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A73B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A73B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6Sjmp4h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792974811; x=1824510811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jDW3zNKTgRakGdHRX+x3xt4uVuBKJZYGYCw+1NVm+wQ=;
  b=K6Sjmp4h5Npj1noKxllwhNQ+hhqyBfPxuf5/nmO6QIxFXFsNaBLaEh77
   MD5FYUSiDyO27m4ifWcevxBkZSw3SQNx0MrciB4JIPNgL/m3056+wSmun
   b4eh3lz5Wd+/mt4K9uz4AxR0ZKDYET8J8Uz+UjbVpSW3M6/8HZE3bCFKM
   nm6cNqSEMQMO5/DabkwMj4kqQk11O2U8N8YU26pKS1meco/tNc8L05IUk
   sdvDLPB6Y0sYpfrlcz1yaECrV4k5J4uGZb96WVhblGw4tOk6X3UwBHHXv
   qQLtmnKtVBXDXa2CcAuH+WA5OliuvVqjELEOTrjpHkTa93ApXhyRqViHr
   g==;
X-CSE-ConnectionGUID: RYAPZchpRneYj49AaLL8Ow==
X-CSE-MsgGUID: qfuwC09TRGi8Cj3oZz1oVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1639359"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1639359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:33:30 -0700
X-CSE-ConnectionGUID: UX4LKqlHRv2LF5v2Lge95Q==
X-CSE-MsgGUID: EjUahS49R9W1XQmTwFuTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4080344"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:33:24 -0700
Message-ID: <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
Date: Mon, 26 Oct 2026 08:33:22 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-3-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> TDX Connect is a TDX feature that enables secure device assignment,
> allowing a TDX guest to directly interact with TEE-IO capable devices.
> 
> The TEE-IO Device Control and Management (TDCM) hypercall
> (TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
> primary interface through which a TDX guest issues device management
> commands to the host. The host processes these commands and returns
> responses via a shared memory buffer.

Could we add some clarification of why this guest-host hypercall is necessary?
i.e., explain that some device management operations can only be performed by
the host VMM.

> Abstract the underlying leaf call and pass the shared buffer physical
> address as a decrypted mapping. Add a runtime page alignment check
> for the buffer to enforce correct usage.

This doesn't match the implementation. The code only WARNs instead of enforcing
correct usage.

> Place the implementation in a separate tdx_connect.c file to keep TDX
> Connect specific code isolated from core tdx.c.
> 
> CONFIG_TDX_CONNECT_GUEST referenced in the header guard will be
> introduced in a later patch in this series.

I'm not sure why the CONFIG cannot be introduced in this patch...

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/Makefile        |  2 ++
>  arch/x86/coco/tdx/tdx_connect.c   | 32 +++++++++++++++++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  arch/x86/include/asm/tdx.h        |  4 ++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 arch/x86/coco/tdx/tdx_connect.c
> 
> diff --git a/arch/x86/coco/tdx/Makefile b/arch/x86/coco/tdx/Makefile
> index b3c47d3700e2..2ab2dbbdd3d2 100644
> --- a/arch/x86/coco/tdx/Makefile
> +++ b/arch/x86/coco/tdx/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-y += debug.o tdcall.o tdx.o tdx-shared.o
> +
> +obj-$(CONFIG_TDX_CONNECT_GUEST) += tdx_connect.o
> diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
> new file mode 100644
> index 000000000000..0c6ca650771a
> --- /dev/null
> +++ b/arch/x86/coco/tdx/tdx_connect.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2026 Intel Corporation */
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt)     "tdx_connect: " fmt

I think this is file is only intended to hold guest stuff. Thus maybe call out
"guest" as

  #define pr_fmt(fmt)     "tdx_connect guest: " fmt

though arch/x86/coco/tdx/tdx.c doesn't print "guest":

  #define pr_fmt(fmt)     "tdx: " fmt

So this is just my preference, feel free to ignore it.

> +
> +#include <linux/io.h>
> +#include <asm/tdx.h>
> +#include <linux/mm.h>
> +
> +/*
> + * tdx_hcall_tdcm - Send a TDCM command to the host via TDG.VP.VMCALL<TDCM>.
> + *
> + * @devid:  Device identifier of the target TEE-IO device.
> + * @buf:    Shared, directly mapped buffer containing the TDCM command on
> + *          input and the host response on output.
> + * @size:   Size of @buf in bytes.
> + * @vector: Event notification interrupt vector, or 0 for synchronous operation.
> + *

"0 for synchronous operation" isn't correct.

vector 0 means "no vector. TD polls the status for completion". If the command
doesn't finish when TDG.VP.VMCALL<TDCM> returns. It's not a synchronous operation.

> + * The buffer physical address is passed to the host with decrypted/shared
> + * mark.
> + *
> + * Returns 0 on success or a TDX VMCALL status code on failure. See
> + * TDG.VP.VMCALL<TDCM> in the TDX GHCI v2.0 specification for status codes.
> + */
> +u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector)
> +{
> +	WARN_ON_ONCE(!PAGE_ALIGNED(buf) || !PAGE_ALIGNED(size));
> +
> +	return _tdx_hypercall(TDVMCALL_TDCM, devid, cc_mkdec(virt_to_phys(buf)), size, vector);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_tdcm, "tdx-guest");
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index f20e91d7ac35..f46a3171a512 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -74,6 +74,7 @@
>  #define TDVMCALL_GET_QUOTE		0x10002
>  #define TDVMCALL_REPORT_FATAL_ERROR	0x10003
>  #define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT 0x10004ULL
> +#define TDVMCALL_TDCM			0x10007
>  
>  /*
>   * TDG.VP.VMCALL Status Codes (returned in R10)
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 884bb8067521..df4496ef8a6a 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -85,6 +85,10 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
>  
>  u64 tdx_hcall_get_quote(u8 *buf, size_t size);
>  
> +#ifdef CONFIG_TDX_CONNECT_GUEST
> +u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
> +#endif
> +
>  void __init tdx_dump_attributes(u64 td_attr);
>  void __init tdx_dump_td_ctls(u64 td_ctls);
>  

