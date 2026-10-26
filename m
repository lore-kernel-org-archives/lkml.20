Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975923;
	b=kn25RigTnuVkdn0axV4JbwtMP2xz3Wx4UrqI6F9y6QEnLF6MjckcekUf0o7dS4s//6SD
	 JGZDaaSCSytnlxY7Zai7THQk4BPtsdmutrCQKnyaoq4qmw9eEOurDq8NbvS3mHJsK1qO8
	 XpTQiGHg9C96Uk14CWxlEmMDtpo/O6aVJKQxR1ToJkYKFx6jiHdhHwxoRkG4yzGyJMIVB
	 juo3ZNBTeXPnM+lbSOxLFDknKo+haiSq+4R7eLDq+QTQ1YaIPkkZQYyUHRulDohQlXqlL
	 ZbHIVMkCtzpWxbvGoTO4PhUsK8UWrLdhZPaHoWi/q5pLrlE86NgtSrHfzXz035OAegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975923;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b9fH36rPga1m/YKhPFxzMrQCe595oHYTRuGjJPzK7rE=;
	b=mLJzzcX2MfgrUdImPlh3Jwtz31HRY0OMkniyuRMO0lWLoii8cOzGJ2/xCsyyVXPfkweI
	 FM95anKPWgZNBclxGnhChCg3OQJAOEleG3uEI/TKEx+2Jmo1+BPajEUXB8JB0/tdIZLzK
	 WTzcjGaE7o16q5LaLVTcc96I9BZN0WMi0wnmcPa2aNFCBznn/UyH6kqxSPikTmh6O/oRF
	 xCEuLD33FRJdxVXuOPxt48j5KKAXMuVpUyrYftyVoNPmRNyU7bupx/IWj0R99hRcEV2ZK
	 dU+qcanv4255epqKe+6igt7L8132/jlwmzpWebLhgEdqDAqgouv9kOZpxRCcvBjfu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mA/oJVf8";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E79606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mA/oJVf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792975921; x=1824511921;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cAg/kfv8+ENBqgEJrRZIOg4+FnSqfG/3NeBnA2eO2GI=;
  b=mA/oJVf8Q7tJC6+9yF/EAu9Rj/dOHbxo+meiTy61BWO0or+Ff7NQ4cvc
   GqKPXX4RdJVsU4GRXWCC5/BSItuB6rShJn531yXfSCckFuNSj6bKgWvzh
   r4H3bqTfLef8RnTwb/COvAOGSuBirvCenTmYAwqksbaqQogMbxU656a89
   /GbFXysrL4M/sCGY/a831Hms15sjqpK1yFzSnXkrgvDHJDje7+arOoyUT
   F5bmEm2F/Swaym2JCOyzc4W2SxxZnqC18Gs2bwm1tU5K3+TZxMM0z/VLT
   DyjCPHxU+mxo1gbLPf6ZnnrBu5Cy086Qwhm4qcKMWADYVVjNanmeF7k5z
   Q==;
X-CSE-ConnectionGUID: KnK9WKJ6TzaS0zBm6DS6qw==
X-CSE-MsgGUID: gqi8FhDkSJSz0moaxtfeaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1645228"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1645228"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:52:00 -0700
X-CSE-ConnectionGUID: gGR7B+poQ+e5x2JnG+mAmg==
X-CSE-MsgGUID: 7+LH8CDkQK6yKT+MqR6S6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5995300"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:51:55 -0700
Message-ID: <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
Date: Mon, 26 Oct 2026 08:51:53 +0800
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
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-4-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Introduce wrapper tdx_mcall_tdi_read() to provide tdx-guest driver with a
> standard interface for querying specific metadata fields from a target
> Trust Device Interface Control Structure (TDI_CS).
> 
> Explicitly mapping architectural TDX error codes into Linux POSIX errno
> with two helpers, introducing tdx_mcall_to_errno() to handle general
> module calls, while introducing tdx_mcall_tdi_to_errno() specifically for
> TDI related module calls.

Set aside why mapping architectural TDX error codes into Linux POSIX errno is
needed and what it brings, I think the common enabling order is one prep patch
to introduce tdx_mcall_to_errno() and turn existing users to use it. Then this
patch introduces tdx_mcall_tdi_to_errno() to use it as well.

> Unlike TDG.VP.VMCALL based hypercalls which communicate with the host,
> TDG.TDI.RD is a module call (mcall) that communicates directly with the
> TDX module. This distinction is reflected in the tdx_mcall_ naming
> prefix, as opposed to tdx_hcall_ used for host-directed hypercalls.

I would say this paragraph is not needed. It's not the first patch to introduce
hcall and mcall.

> Note that while host-bound hypercalls (such as tdx_hcall_tdcm()) pass a
> platform-specific Device Identifier (devid), the func_id parameter used
> here is defined by the TDISP standard (refer to Section 11.2 "TDISP
> rules"). Although these values result in the same underlying bit format
> when the PCI segment is zero, they represent separate structural
> abstractions in their respective specifications.

This paragraph seems to provide help but it doesn't look to help (at least for
me). Because until now there are only the helper defined but no user, I still
don't know what specific values will be passed to them.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c           |  5 ----
>  arch/x86/coco/tdx/tdx_connect.c   | 41 +++++++++++++++++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  arch/x86/include/asm/tdx.h        | 20 +++++++++++++++
>  4 files changed, 62 insertions(+), 5 deletions(-)
> 

...

> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index f46a3171a512..665c12925ff6 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -20,6 +20,7 @@
>  #define TDG_MEM_PAGE_ACCEPT		6
>  #define TDG_VM_RD			7
>  #define TDG_VM_WR			8
> +#define TDG_TDI_READ			67

Please name it TDG_TDI_RD to keep it consistent with TDG_VM_RD

