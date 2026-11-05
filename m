Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888073;
	b=caFLMejEWoZOglO3vgY6NH17jnzz4q6GyBcyXsV4QfPDi6ULL8MgWDVErjwJEjdyrGaH
	 x1iFR1AvkWu+CV6saLSPITsDxKWU4jr98iY25YBoqmkEC86WdxvST6Qr4UEM+Nc0/+Tg7
	 t13z2yFOmww8Bx+mcklh5N4uawQLzOBkm4xYGwTyad5uqRrAvVtK5rJcXkkGh+yiSuonq
	 F8RxYu6MdvI1vWtZ8D3rUow00JucusZqVjR7n057sY8oBeGBU0L+ya07QtLRAHibpSpI+
	 76L9kNKldHOcW9fhcssXk+mHpiuJc9064M1wFkJiWXOsJrjkNpEtC4cF6SfZUfqIddA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888073;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=NrFRwq0CcxdbdgKgvTTBn6du1gVkHGE/MJ3EZBpjAZc=;
	b=ltc9hhaRrwdZhcg3K5jCdSjY4YBhWDTWHK7IjT8thETA79HrDSyFJfXM3eaYEXNAA8nL
	 HIyGeIZNegaVUeP8n0PekTpYiXoViYRBVVaFCn3RCgOi2OH141UjdSj2m8SIm1Qpf2K9d
	 jOWrMfHNRBRCQv8eyuOcngqXmiOQXUp7sho67BK7oVgRnmguKoIK8RXCCcyx6EUSHVcbj
	 zi0p6otwFWBHBbx9VMNguWXgdd+fd2/QTLKYbk+wDUlW/p6vdFOuyMw7OK1LFlJiizq27
	 GdJ5kfWz+MZluJDRe81GlRxoDhf3uuSci9RZs4R7NlvY5PyGlOC7bfid01nf8ogGxYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcmvJHkI;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88203606A329;
	Thu,  5 Nov 2026 14:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88203606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcmvJHkI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793888073; x=1825424073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wuMSr3ixNkbUiLZAplXZVAvliRR66PGrzQRj2B29XFs=;
  b=IcmvJHkInrAoq5TSpWI9BSWttNPc4J5P/PwHk7SwOVWfhRp+iqkjQRJv
   M0TJlM2GrKCUUR5WAvbYfhphux4wx9ov5u5lxShU24+ewFC/oGv8IMNgq
   ozbEjml5ccRbbK/YsZf6u3z/0NcPaiO6d47WS4yXJqAhNOvqHQR8yVzGb
   czL1L53qz1L/nhwiwRd+IAE8Gmsw3qkXwrnYrRzb+sKu1rlTXt71GRZnQ
   qOfkS55oV8ZTpN/1HcK/rkCth8Z1V3S5WDQyzer6kbeDWzYnPM+4kRYUk
   3gWTP7lTB7Qvu1n9iByku2JAD3cGp5G1Cb4FTape5tfG5QPIui295sxdy
   A==;
X-CSE-ConnectionGUID: wiab3l4fRXKMfzqW/xDOVA==
X-CSE-MsgGUID: VbEnt+SfQVyMM3NNYL8DHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2578178"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2578178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:14:32 -0800
X-CSE-ConnectionGUID: WCCXVcs9QziuuFyum6vTYA==
X-CSE-MsgGUID: 4ksHh4vFTsWG/XCy8QsbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7029288"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:14:30 -0800
Date: Thu, 5 Nov 2026 16:14:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auyPQ_y10mSfkUNw@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
 <auxmMrANvWIJi94i@shikoro>
 <auxuPmopn43wisF9@ashevche-desk.local>
 <a0a17a91-02d1-4c54-8989-ff483a3300ab@oss.qualcomm.com>
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
In-Reply-To: <a0a17a91-02d1-4c54-8989-ff483a3300ab@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 01:56:10PM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 12:53, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 01:19:14PM +0200, Wolfram Sang wrote:
> >>
> >>>>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> >>>>> found acceptable according to the Reviewer's Statement:"
> >>>>
> >>>> So, for the SPI patch: if someone spent time and reviewed the complex
> >>>> core changes, but only 2 out of dozens of drivers, this would be an Ack
> >>>> according to you. I would, however, understand that this person doesn't
> >>>
> >>> No, and I explained this in this commit msg. That person reviewed the
> >>> MAIN concept of the patch.
> >>
> >> With that MAIN concept emphasized, I am okay with your reasoning and
> >> agree. Before (I cite, upmost paragraph) "*the patch*" could be
> >> interpreted as 100% of the patch (including dumb driver conversions).
> > 
> > ...which may lead to discouragement of reviewing such a patch.
> > At least that's how I read the point.
> 
> Why Ack instead of Review would discourage?

Because Ack doesn't imply *any* review.

> Are you saying people give Reviewed-by tags for incomplete reviews only because they want the credits?

No. We seem to discuss different issues. You are talking about the credits,
and I'm talking about the fact of the review versus acknowledgement.

-- 
With Best Regards,
Andy Shevchenko


