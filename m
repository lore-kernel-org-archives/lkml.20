Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE0569F2F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963754; cv=none; b=M7Y4c9zq+bZa8/T/WoG/a+ctQ1812TH1V3uTD7rQhtfqRFC4Jk9bKwhf9A19cc/eKJQYBksDkLqPxW5tafflCeHsDzXEqhdOxv7Qt1FzhfGMQ0nYO0PEnifItFQZKIm8BbzKkCFfL3YwE3ZqL/oZw/fjAT1jB0eKlWK8PWzAZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963754; c=relaxed/simple;
	bh=rrytvz0Ah77csOOgAgEqEEk83da4iovwBVr4aLKJqSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxMu9kvOV2FeYfNVCWvjoDeSMvQJOPIpnSRkzf3JkQxoLDYB7hh2LYqQKuDqKpItPIFJG/ty2JRhTCg0AzB4wdxvJUZ2Jngn3NDXtA8YTB5e9bQXtDFz07qmtqZBqyXCziNU5KopCaJ2NM5D+XjWDDk3EWYSaZH15jK/CIgJb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4nB/d4i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4nB/d4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788963754; x=1820499754;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rrytvz0Ah77csOOgAgEqEEk83da4iovwBVr4aLKJqSE=;
  b=N4nB/d4iVNAuIy4MnoB2UpRh9tWFtnc5NNCgh38RK51Qc2gHwkRXkzZX
   zyyIja8kSwJ3TvsIRPU3QmK79L7NDa5vz9/nKn1ykDhxAEXwlpGOlU26g
   xaAds58xHrIRnKEFDU191I70VcwK1ZruZmGIif7EPfgH4FZZ/6Xd2gUdt
   SEJuiGYfi0BD+Y0YkXxJQx3s9asAUVUdBrzYM1LpRor2fGEPguM0lZDHQ
   2y4hKg53ibigrzlgAgIJmbnuabBrx0wKBpYw+WJKqkm/RjD9RVKk5mp8T
   vdtrez/ne6ykgPJ2ImpgpuxIpt5opw1KKGXkhkRCnUakU+OrT1rGGdNAX
   g==;
X-CSE-ConnectionGUID: P3jsfxwDSgWDBma1UcambA==
X-CSE-MsgGUID: C5LoDwiORCyHs+cA34WjZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93084534"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93084534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:22:34 -0700
X-CSE-ConnectionGUID: DiRzTdK1TqOnRZy2RhGbzw==
X-CSE-MsgGUID: IRGW0SC/TP2ZyqdmxVlGaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="274854263"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO [10.125.111.153]) ([10.125.111.153])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:22:33 -0700
Message-ID: <c364b3b6-f8c1-45a6-af3e-8685d9044b0c@intel.com>
Date: Wed, 9 Sep 2026 07:22:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm/pat: skip RWX verification until kernel text is
 set to read only
To: Mike Rapoport <rppt@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20260908092730.4002628-1-rppt@kernel.org>
 <522548e1-ebbf-4785-83d7-e2cc3aa83b62@intel.com>
 <aqEphDuTtIZDANnS@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aqEphDuTtIZDANnS@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 02:40, Mike Rapoport wrote:
> On Tue, Sep 08, 2026 at 05:15:46PM -0700, Dave Hansen wrote:
...
>> How about we add a kernel_strict_rwx() helper:
>>
>> bool strict_kernel_rwx(void)
>> {
>> 	return IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled;
>> }
>>
>> Have verify_rwx() check *that*.
> 
> Checking only that will bring the warning about ITS pages back :)
> 
> Both CONFIG_STRICT_KERNEL_RWX and rodata_enabled are set before the
> alternatives patching. 
> 
> And rodata_enabled is kinda arm64 specific thingy :)

I think I was confusing rodata_enabled and kernel_set_to_readonly as I
read through things.

But either way, I really don't like the idea of checking some random
state bit. It's generally fragile.

> The check for (!kernel_set_to_readonly) has to stay to actually rule
> out the silly checks at boot and it covers your strict_kernel_rwx() because
> kernel_set_to_readonly is only set when strict_kernel_rwx() will be true.

Could we do something slightly more generic?

mark_readonly() is awfully close to setting SYSTEM_RUNNING:

        mark_readonly();
        pti_finalize();
        system_state = SYSTEM_RUNNING;

What if we (eventually) did something like:

/*
 * Get the kernel page tables ready to run userspace.
 * There should be no page table manipulation between this and
 * settings SYSTEM_RUNNING.
 */
void boot_finalize_page_tables(void)
{
	WARN_ON(system_state >= SYSTEM_RUNNING);

	mark_readonly();

	/*
         * Kernel mappings are now finalized - update
	 * the userspace page-able to finalize PTI.
	 */
	pti_finalize();

	/* Ensure the final kernel mappings have no W+X issues: */
	debug_checkwx();
}

and then verify_rwx() can just check system_state?

>> Also, make the DEBUG_WX functionality mandatory for STRICT_KERNEL_RWX
>> (with appropriate renaming) so that it can be depended upon.  I assume
>> all the distros are turning DEBUG_WX on already (Ubuntu seems to).
> 
> Just checked my Debian config, it does.
>  
>> Maybe just do the strict_kernel_rwx() to start and then circle back
>> around to muck with making DEBUG_WX mandatory?
> 
> I though about making DEBUG_WX mandatory right away, but that's surely not a
> oneliner, so I kept it for later. Maybe should have mentioned in the
> changelog, though.

Yes, please. It would be nice to mention that the fix is a bit exposed
without DEBUG_WX. It could honestly even pr_info_once() about it to make
it less likely it somehow gets forgotten.
