Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660058;
	b=U23Y6ZDBcSD6AQ2D8eQQOhsVZoOziOSIsUfE+7UMS4DSAXvERV38nEZpFYOVmDdP4ycP
	 3WWLwVzR/pFf7m7bsjC2svIhcQgEDRha+X2aWj1FWf7Hw+iRLKv4Ddok+h/JTxHKz0PC6
	 uECeuYBcfciccqeN3XpwzP9amKqD2l7AmxCQY38QYRNUQ25Zjryfqs5aUoGvJJx0YvA19
	 IFo5dOByaGbqVsVSQO0XskeQOb2vQCwZvP1PhGLm6r7FFEGCVGhC78b0VgYsb0bGVxLlO
	 Ph/OTd+qc3WZmoKSEqPsWkegxAaAVR3d1mCbw0RhI+92Cfi0skwdSFAqyewRmXLcEqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zp9ytGf5B5ph3sAKvmRW4+DQBU2b9qAKGb8/DFQoL5M=;
	b=RO2XrU7qDwtxOMqCYGg5F+ddWD8mJukEYOeFhWJvFw+h2/YtP3AAGcJ0twxpfMBoMmtr
	 y13uipuKAb+Zo3w5jeX8GmogiYraGl0z3o1bQxPL/z93nMllIDMD+fepJs/pRaFmm8y1o
	 PuahvOojlYGH75Xyr3Yht/h/ZlOUQrt63vNUZJgp50pMQVlTtTmDNQXDhPD3gRSiX8wfO
	 Ubgw2pmkivp5EGY8uWAxaFHQdmePEwThcYdAL73b3DqBqQxTsDyDTEtDwBFwvRL4hxlyk
	 RqkzjAI7PKAfm1v8yyZPywhzgbW3Lx8B7lVlmBs1vjeHlKFe0BLd2UZ4lMrvPGskj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSp93QDL;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8649606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8649606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSp93QDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793660057; x=1825196057;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zp9ytGf5B5ph3sAKvmRW4+DQBU2b9qAKGb8/DFQoL5M=;
  b=cSp93QDLCjajpR+t3AaPcBDWI8v/TwsyMxokBYRrG1WP6SROXhiZs0/s
   hD+T5KnwtQdWiFhPa+bgIVUfLdyOFVoCAmIljNFJt2tw8TYFOy/AucW5X
   xDb9r3U/yyszaiPyk2RbUsyHnNdlNJN++DLsDS6ddpurqCVIqTv2hAwuL
   nN7FIwNdo5telSHneJO6hdx7YoKrspDj4YDmcI4ru0Z6h2cMBPBRQGfPO
   zJBUskIqPd23fZaLcKrSx5u5a0T9lZR6hG3tPgX1au041LX2BVhB4fmKu
   ljoerzfqi5ASgK3XJuypoIQmxLSoj+kZRM+xglD8eaAPCV8ZKoNwDRdva
   w==;
X-CSE-ConnectionGUID: +P7BYnsBQ9mk94Q9VSDDQA==
X-CSE-MsgGUID: dA/dUdFYRUyn2UEjsVKcbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2249387"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2249387"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:54:16 -0800
X-CSE-ConnectionGUID: iO4xng/yQNeI/D3+qWYqEQ==
X-CSE-MsgGUID: NmCENnMnQoCI1HP0BBG47w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6090458"
Received: from jjgreens-desk24.amr.corp.intel.com (HELO [10.125.109.193]) ([10.125.109.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:54:16 -0800
Message-ID: <b004e572-8d52-447a-b5b2-10bed36896b2@intel.com>
Date: Mon, 2 Nov 2026 14:54:06 -0800
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
Subject: Re: [PATCH] x86/sev: Fix kmemleak false positive for the RMP segment
 descriptors
To: Breno Leitao <leitao@debian.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Nikunj A Dadhania
 <nikunj@amd.com>, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 kernel-team@meta.com
References: <20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org>
 <036145d8-46b2-4389-afd7-26c897d09ce7@intel.com> <aukO-_uELcL15JnH@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aukO-_uELcL15JnH@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 14:30, Breno Leitao wrote:
> On Mon, Nov 02, 2026 at 12:48:16PM -0800, Dave Hansen wrote:
>> On 11/2/26 08:49, Breno Leitao wrote:
>>> Register the table with kmemleak, so it is scanned like any other
>>> object.
>>>
>>> kmemleak_alloc() registers a block of memory with kmemleak, so kmemleak
>>> scans it and counts pointers into it, do it with rmp_segment_table.
>> Why don't we just kmalloc() the thing?
> That would do the work as well, if this is an option.

I don't see a reason it needs to be allocated directly by the page
allocator. My friendly LLM agrees with me. kmalloc(PAGE_SIZE) aligns to
page boundaries and has for years.

BTW, there's almost no reason to use the page allocator directly these days.
