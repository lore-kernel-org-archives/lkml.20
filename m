Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C124A8401
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444324; cv=none; b=EbGRCEymxif882BQMIZZBHDoz+HnOdIJ2d/KN7d5jVLy5NMI7kjgaPM6TaF9imesxgg6DbRpuUy+nmxCS21XPqOFNKt6qp/fdRboaNXpcFRsVunXEoECQ08gZAk6FnjLyHQRm9x2Wnkko2h0P9T2HhHXx29Be6wqEX6f6B05/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444324; c=relaxed/simple;
	bh=gG9oJXVJ/LfMZhiUMymd6wSzeDDHFzlibDpqu8+acSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGxifOtEIxOp6LVRcD1brgQOUA2i3mX75awM8yBZonWApH95mrqspoD1vS/2ZtXwl7bi9Px8ChTH+fXEQaEdw7YrqdCoXdgsJAb2iApnyCWwl+1yf5XxrdXkaHg6gt3ZOX8XTxYMpEOC2T9bA7qI1l5U36jtFGxA4W42HJookl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLJaaRh3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLJaaRh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788444315; x=1819980315;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gG9oJXVJ/LfMZhiUMymd6wSzeDDHFzlibDpqu8+acSo=;
  b=fLJaaRh3GKxzWYg0p4tTnz1HU+ozk7p+TAsCokeUmKHt/2J7biDw2D0S
   GEBfZ/4JNhhf1INsGnOM+u8fnCWlEEoEN0G9W4tbWpZHG3hmstmiX8lmR
   yMgCr1Ojc7eLSSEZa26Ew6MgPIyvigSatoCxyGKsGNLf4jZMmUH/rEwzM
   2uhtP54JWA28hXfZrJXJ1IqZPyAlD5r0cR8RObhK7tOKRE9j4wxTWnEW0
   myyKHn0YhCPeV23e7mFWZrhOP8KaiPueQj8BL1605nlAVMFD2ryE+PP+U
   WwPsMi6gXnMuDRoqRS5h9Ge1qFUy9pb3dtL7GRKe+nlx5/NsQIO7rGK+K
   A==;
X-CSE-ConnectionGUID: XPRVCbydRT2eZwk6Y45dxQ==
X-CSE-MsgGUID: GaAHme9DQ1Cn80tSJBF83A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92795194"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92795194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 07:05:11 -0700
X-CSE-ConnectionGUID: LtsgoedpT8iKgt7aG0Bw5g==
X-CSE-MsgGUID: 0bFAMCG9QHS4W8XeYLv61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275010005"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO [10.125.110.172]) ([10.125.110.172])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 07:05:10 -0700
Message-ID: <98f78187-de25-48dd-a833-16e6a86feed0@intel.com>
Date: Thu, 3 Sep 2026 07:05:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Introduce helper for checking direct map 1G page
 support
To: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
 <ff13fe1e-59e3-42f4-a438-bbd3cfbd94c9@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <ff13fe1e-59e3-42f4-a438-bbd3cfbd94c9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 17:34, Sohil Mehta wrote:
> On 9/2/2026 12:47 PM, Dave Hansen wrote:
>>  extern int direct_gbpages;
>> +static inline bool direct_gbpages_enabled(void)
>> +{
>> +	/* Check the direct map config option: */
>> +	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
>> +		return false;
>> +
>> +	/* Check the CPU feature: */
>> +	if (!boot_cpu_has(X86_FEATURE_GBPAGES))
>> +		return false;
>> +
> 
> The first two comments don't add much beyond the code.
The "CPU feature" one is arguable. But even when writing this, I was
forgetful about what CONFIG_X86_DIRECT_GBPAGES actually did. I _think_
it was the fact that these:

	CONFIG_X86_DIRECT_GBPAGES
	X86_FEATURE_GBPAGES

kinda read similarly if you're reading fast. The config option also
doesn't have the most enlightening name.

The comments are more there to get the reader to slow down than anything
else.

> Would it be useful to say why boot_cpu_has() instead of
> static_cpu_has() over here (mainly to avoid accidental cleanup)?
It's a pretty minor thing. To me, it's changelog material, not comment
material.

>> +	/* Check the command-line and early setup variable: */
>> +	return direct_gbpages;
>> +}
>> +
>>  void init_mem_mapping(void);
>>  void early_alloc_pgt_buf(void);
>>  void __init poking_init(void);
>> diff -puN arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime arch/x86/kernel/machine_kexec_64.c
>> --- a/arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime	2026-09-02 10:09:00.004169798 -0700
>> +++ b/arch/x86/kernel/machine_kexec_64.c	2026-09-02 10:09:00.012170479 -0700
>> @@ -257,7 +257,7 @@ static int init_pgtable(struct kimage *i
>>  		info.kernpg_flag |= _PAGE_ENC;
>>  	}
>>  
>> -	if (direct_gbpages)
>> +	if (direct_gbpages_enabled())
>>  		info.direct_gbpages = true;
> 
> How about:
> 
> 	info.direct_gbpages = direct_gbpages_enabled()

First and foremost, in a refactoring patch, you must resist the urge to
do this. Refactoring patches' job is to show -- in the most plain way
possible -- that they are not hurting things. The easiest way to do that
is to make it as stupidly obvious as possible to the reader that nothing
is changing.

The moment you start making changes like the suggestion, you make
reviewers' lives harder.
