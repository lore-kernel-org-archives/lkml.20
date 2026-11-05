Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879620;
	b=d0OBqsvmrb5jllhJSNAzV5wDyo9IccYcEG92YuHBdSMbbEf6SOlgi3LxQ4LL7Kq3mVA4
	 kJJ/nOVFqFEEZj8ENsSPXlor6BA5wdPsm7QJalpd1sPMpXU9m6RMtbWBELMrLlywfGhh3
	 Pbd5wxHFrnx7Tz/io50s+2sU+NcRAmZHwxUDwV7vS4++N0DjC/pP9gktB5gtU96Bz6pMv
	 Cska0jXZT+V0AIGRJbTDGDJKBxdEMRjtlFMGXpOnOp4doRl9FavGKJZTMYwj43K40kMSF
	 lteFug9XzGg3ft1gNUwtm5/skXYv7wqtUbfbxLohp5Jn5LW2Pyga1yxxEufzG7BvQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Pj9iaBPmqdv/BlcqSHugBwJUfcba4Pba+SAzc1+Jd7g=;
	b=AIpkJ/1eEbpgrJT+vPy6hBZdfkaCajMIxYxKHyq216OXReoxq5VUdfC8sM64uK/zStUv
	 gGfG8pzsn/MWsbx6Ek3v74HApNNuyPNFyrNTtJG89oxkENu3OOASRBagsPl5Xb5QLx5OU
	 GG1L4ixHHIlZQdgBRl9kMK6RmOGqMJixIyGymS/yfuGTB3ZGtYL8+f7r/cGZ8JX95cAIX
	 DvR2oPW+LtyGKXHBTvRsWgaYYW/oKpOaUjBqIiZ6R9Mav1Jh8NuHyKYzgER5nu7rVTTgQ
	 1OSu35N9pYzNPaZNmHn6nPVw739PVcI+2NGDKnNC/8LFNnuRvDf3tfc1sY1BuQTqp5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fkBLuL/I";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB2606A328;
	Thu,  5 Nov 2026 11:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAB2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fkBLuL/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793879620; x=1825415620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hk7iYDPvzCJ8cyId3xaaMshRR8SFZ2MT0MF74wQE6iM=;
  b=fkBLuL/IPJl/doXC9Cl3SEWxwI7YJMjbve+5gmD73HX7gjp83TtrB+Aa
   pXNT428BuQz4i/MbZw7g4BDH46t7firEm7qndfFgbWfq6XxUI/LFD7ox4
   e+XmdVuNMWaIO7dMSQ9YiL9Myyel2AudSMjJI1DhkPS3kmnoJqpGoLbX5
   af4BnFggHY0mr7iL+ab6WP6gzVFtI8e+e3fbJzZ5bzcNDo4A1YZoh57WT
   /WbqRC2kE2U52lnC317DLR1M3aO0rJVu3/m2IUgDjQJ0h3heTae6ubNVr
   OpSSvQXNltBXlGNUi95WIZeQ+/oHp4TEUgkP+RpRRRjjY/ynmfXX6jiFE
   Q==;
X-CSE-ConnectionGUID: ux5MDRDkTKimq4gdIemr0g==
X-CSE-MsgGUID: Yv7hYmEzTD2YK66WO6exrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2657972"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2657972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:53:39 -0800
X-CSE-ConnectionGUID: WdtljnQFQbyVVhuPzGLNFw==
X-CSE-MsgGUID: z06fTSAORbu2TUXlmWlOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7397635"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:53:37 -0800
Date: Thu, 5 Nov 2026 13:53:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxuPmopn43wisF9@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
 <auxmMrANvWIJi94i@shikoro>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auxmMrANvWIJi94i@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 01:19:14PM +0200, Wolfram Sang wrote:
> 
> > >> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> > >> found acceptable according to the Reviewer's Statement:"
> > > 
> > > So, for the SPI patch: if someone spent time and reviewed the complex
> > > core changes, but only 2 out of dozens of drivers, this would be an Ack
> > > according to you. I would, however, understand that this person doesn't
> > 
> > No, and I explained this in this commit msg. That person reviewed the
> > MAIN concept of the patch.
> 
> With that MAIN concept emphasized, I am okay with your reasoning and
> agree. Before (I cite, upmost paragraph) "*the patch*" could be
> interpreted as 100% of the patch (including dumb driver conversions).

...which may lead to discouragement of reviewing such a patch.
At least that's how I read the point.

> > "Reviewing pieces of the patch while ignoring the main part of it, is
> > much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> > not be applicable."
> 
> I agree. As stated before, I don't care so much. I am glad you do :)
> I'll happily take the "# subpart" potion of your patch here.
> 
> > Nowhere in my patch here I said you CANNOT review part of the patch or
> > cannot even leave Rb tag for such case, right? What are we discussing
> > now, exactly?
> 
> I hope the misunderstanding has been resolved in the first paragraph.
> 
> > Do you agree that if person skips the main point of the patch, the hard
> > part, and reviews only less important part, that looks more as an Ack,
> > than Rb, considering how "Reviewer's statement of oversight" is worded?
> 
> Sure. It is not so important to me, but yes, I agree.

-- 
With Best Regards,
Andy Shevchenko


