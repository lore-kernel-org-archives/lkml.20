Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000161;
	b=oJr38EnR4ZXkhgLubkQOB/Oji9T6ViRpkwHI4uMfVnICdJpZqO3qnkY3FdhdYJ5WFG8E
	 PaNWBpsloc3OXXPGTeZcFz9TOE/83Fq8Ffc+YVp6wETc0nefay8mHuY0IYnhTWquSfxN8
	 r9ihbzUpeZBcuWIidW5s4PAEf7cfrhjmknW6gRbkgCahRXDricHSxRY5UVt6vM58WH89V
	 SrEUvGJqTKLPIutKBCrrRFqAFPFFWuwKfLlW8eJwhjRnYhvjqGezJhjwsS7po9hC51P9E
	 5SvCoD47z7l8ElVcc7KT3YM6SUJXhbEWPgcDmi0amYVU2UxlpiPGzD45PvNK/RAq53A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zs7HgxeycXvf74mTwMEQ+GYGSkd4DObHrwvm085tS4E=;
	b=FE7bxfPxpql/8VYWm1Jsg35yUEq9JUiQamG20ZXRyqpAEGOHEn0U/BiHiGs+CBpjUU3c
	 Fh737O8EBvgNH9AbGx+U1/i98EL16hCBPcg6izQF22MeMiGQroDIc2rPluEwCg3pPQtKA
	 upkXGWKjDkjB/rrjAczV0IbezBQXvigV+2OCB3DzZ+A2FiKfVqcJl6rp8204e90pSKLM6
	 zWtAQNT2x/8zEaUpKz3F6yN9Hl2nLCP3HKFq1YRKxZ/2ZqCnFL5B4q8HKRDp61PKU4YUY
	 tIrPEEPLgx8b+hMFk4qMBkxO+iUn/8Zr01OqAch0EzqqC1x1i3ogLAfCvtNmzU2RtFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGm2uYxW;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42244606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42244606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGm2uYxW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793000161; x=1824536161;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UYY0BSciSInHmtk2fjYSheogyiRV6ATL2WZHwt53viU=;
  b=KGm2uYxWp7ZSOT5usykZz+NEvzvXM3QxPLdcDhmK3FcSV2FN+0ntacS0
   EUyN/gy4OgoVkEn24lGcKb7f4H06GAADelOvrGUbURQj5kKrvKeQ4oovk
   NGy8QZijx0egFjoTbPEslybGJoBOxfHRCrPl6PpdaHiWMA2iYvJ6MRWHQ
   KtNFMJO4AEXNDKOaTjGbgaG9grzGGr02SN9iogpGm+6wAEn2w1rjEheGI
   vnGxAVNCADxGxj3BAyOZ7VRrlpK0IJCifdQGhGZI5LBUKuJGiZ6Yb0smD
   ou+gDT4ve0onEUglh6ycQPJCjyt+Gs4S+vTeVGDQz/QZITt2yOdgnopG/
   w==;
X-CSE-ConnectionGUID: 3yKAtCSYRJm07Em7oseChA==
X-CSE-MsgGUID: U/LXiDG5R8SAELaQ2CKlQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1688310"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1688310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:36:00 -0700
X-CSE-ConnectionGUID: GB1ORDnOQ1Whs2XDw78p3A==
X-CSE-MsgGUID: 0M+58ZcUTX2kvzaxwh30Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4577583"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:35:54 -0700
Message-ID: <dee26117-4255-4e64-b335-e73776df3e2d@intel.com>
Date: Mon, 26 Oct 2026 15:35:50 +0800
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
Subject: Re: [RFC PATCH 13/15] x86/tdx: Add __tdcall_saved() helper
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-14-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-14-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> The TDX Connect ABI defines TDCALL leaves that use registers up to r15
> in struct tdx_module_args as input, without returning output arguments.
> 
> Add __tdcall_saved() for these leaves.

It's used by TDG.DMAR.ACCEPT in the next patch. And we need it because
TDG.DMAR.ACCEPT explicitly states that R8-R15 is reserved and must be 0.

It seems the first one having such requirement. Is it really necessary to keep
R8-R15 to be 0 for TDG.DMAR.ACCEPT? Can we ask the internal arch to see if
possible to fix the doc?

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/tdcall.S        | 17 +++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdcall.S b/arch/x86/coco/tdx/tdcall.S
> index 52d9786da308..1dca01909dee 100644
> --- a/arch/x86/coco/tdx/tdcall.S
> +++ b/arch/x86/coco/tdx/tdcall.S
> @@ -44,6 +44,23 @@ SYM_FUNC_START(__tdcall_ret)
>  	TDX_MODULE_CALL host=0 ret=1
>  SYM_FUNC_END(__tdcall_ret)
>  
> +/*
> + * __tdcall_saved() - Used by TDX guests to request services from the TDX
> + * module (does not include VMM services) using TDCALL instruction.
> + *
> + * __tdcall_saved() function ABI:
> + *
> + * @fn   (RDI)	- TDCALL Leaf ID, moved to RAX
> + * @args (RSI)	- struct tdx_module_args for input
> + *
> + * All registers in @args are used as input registers.
> + *
> + * Return status of TDCALL via RAX.
> + */
> +SYM_FUNC_START(__tdcall_saved)
> +	TDX_MODULE_CALL host=0 saved=1
> +SYM_FUNC_END(__tdcall_saved)
> +
>  /*
>   * __tdcall_saved_ret() - Used by TDX guests to request services from the
>   * TDX module (including VMM services) using TDCALL instruction, with
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index 72520f09ef3f..90f2842f4253 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -153,6 +153,7 @@ struct tdx_module_args {
>  /* Used to communicate with the TDX module */
>  u64 __tdcall(u64 fn, struct tdx_module_args *args);
>  u64 __tdcall_ret(u64 fn, struct tdx_module_args *args);
> +u64 __tdcall_saved(u64 fn, struct tdx_module_args *args);
>  u64 __tdcall_saved_ret(u64 fn, struct tdx_module_args *args);
>  
>  /* Used to request services from the VMM */

