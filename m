Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414378;
	b=XDa3NYYgYRqog32QZUUOYnN75MZjSLg+edn5XIE1zn/L1sF5O9+EcnyZDNlJQSYpKdKh
	 fxiH1SaR7jKrpfuT/p7rhVHzHyd92R+LYQSRYAo8YM6d7zO5Eu3f+n+jEX4JjArXOpJDA
	 cDWc0hbQtN08r9S+TP7I4R9mb6YU3SP+kuqiKEKXWw7lgVPpKBQWuXuifV+ekyrqjPJFb
	 H4Og9YFwZNgfYx/J+Bo+mWaWifHTPe+TaQecPW/2LCu08i1y+UcxqNpchKV09VUXggnCp
	 SojRyeuy2qHhdABkHUGbG5l44FJCJ8QdNB06Uv6HUtLXTHBLPJe10QGZ2cDdxpMhurA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414378;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T50Bq5dmL4W63Em4QuMG2+P0CvSUmasEiETjet2hpbI=;
	b=HhFlLLWZb/BsiFn1tQu7jBXZ/U2/qvniTQUTEVoREI1GTc0od9ZZpckioc+t/9m8wSUM
	 I8ATgcSdBbNrxqMjy4Q4m0Y2nKh/XR+xQPRgiRUyEAoKo8mSr/kl8cdgqKIFfBGKBPQr1
	 278H6RjWLWcvVMPz8XfbBt+np9CRiKaz+FKybsPprKx/nPTKZP672cRJFIs1YjiGIRhjw
	 IGRGsszqM6gUl46PUqZWPvf6b0vYeRkqbtqBX8Nrpw5leOMoG4ld+PmccD8psLLIIzsCj
	 fs6V0V4y/AwRqPkLSwwmOAdUgiUe5OYxKsv8PYBHyhwt637MvBUHXwncITdUsSjJ/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TnA355Fr;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE93B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TnA355Fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794414378; x=1825950378;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dmyHyp7LcCgMxb4hWXYar4WOS5/5LcbWXWkJsc6lqds=;
  b=TnA355FrMpI0bxZogO5av6+JLdmCtkn9lZ+lkYdUXz/xbfbAmUWZHp95
   KWBpPNYfBvkNTBIAFBlXMyFMvipOwkHDlXclu7wtbKS9RqXLM3xVgfwMH
   S3Pk0QUrjaVsZn3vSXyDIemrftsDIQXiqZRNIKE/M1FqS8csrMPfbTNQ5
   G9ORfhK/23VJxy/O3TrBjZGaqur1ndx2VwTqpOj0DPaY7hoj49OkSIYOC
   S391+5Dauxrim6MZM2NHihBy91dIi8AfIrWqSSa78/rRUTisr5D100I38
   3CH3VHM0E6bomo6P74QckCShNP7lntD30yj9j2KQCgkApLNuEuvqOUsTi
   A==;
X-CSE-ConnectionGUID: fhYzM7MMRueqVNs3aJRocA==
X-CSE-MsgGUID: Ja1bSfAZREqCJEwvWWsOOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3219502"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3219502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 08:26:17 -0800
X-CSE-ConnectionGUID: 5vmc/vw1QxeLSM12P5Jffw==
X-CSE-MsgGUID: qJViyWwsRNaLmrxlRX+jPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8625157"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.125]) ([10.125.111.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 08:26:15 -0800
Message-ID: <fbdd7a41-ba6f-4f75-b8b0-029325bf25c2@intel.com>
Date: Wed, 11 Nov 2026 08:26:12 -0800
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
Subject: Re: [PATCH 1/3] x86/mce: Add CPU_SUP_* dependencies for Intel/Zhaoxin
 MCE features
To: Vincent Mailhol <mailhol@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
 <20261031-processor_select_is_not_an_expert_feature-v1-1-6227bdbbe5a9@kernel.org>
 <a7555a3a-10f1-4066-93fc-a5c60f8deea8@intel.com>
 <d2ffcf73-d495-4e65-96a0-4af2eb77ff2a@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <d2ffcf73-d495-4e65-96a0-4af2eb77ff2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/26 08:16, Vincent Mailhol wrote:
> On 11/11/2026 à 16:46, Dave Hansen wrote:
>> On 10/31/26 00:51, Vincent Mailhol wrote:
>>>  config X86_MCE_INTEL
>>>  	def_bool y
>>>  	prompt "Intel MCE features"
>>> -	depends on X86_MCE && X86_LOCAL_APIC
>>> +	depends on X86_MCE && X86_LOCAL_APIC && (CPU_SUP_INTEL || CPU_SUP_ZHAOXIN)
>> Is this to help end users? If so, it seems like it might also be nice to
>> improve the only human-visible part of this: the prompt text.
> Ack, I will change the prompt text to "Intel and Zhaoxin MCE features".
> 
> By the way, would it also make sense to make the prompt conditional?
> 
> 	prompt "Intel and Zhaoxin MCE features" if PROCESSOR_SELECT

Why?

$ git grep PROCESSOR_SELECT
arch/x86/Kconfig.cpu:menuconfig PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Intel processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Cyrix processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support AMD processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Hygon processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Centaur processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Transmeta processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Zhaoxin processors" if PROCESSOR_SELECT
arch/x86/Kconfig.cpu:   bool "Support Vortex processors" if PROCESSOR_SELECT

PROCESSOR_SELECT doesn't apply to *any* individual features today.


