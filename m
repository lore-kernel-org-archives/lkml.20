Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870369;
	b=wTK9F9+gYtjfyqmdNkiGuhZROOo2ySWJAXIgzjm2LNHQ5E6P9STz4RctAU5r/1l5cZ+E
	 Ocg05ftPOEbeSSrqXkbpOmIp/NBkPxgVssEKVelxfPrZHzHMj60/mQxUiR2P0Pdch54II
	 zPB6sGAUa9xtz+ae+UojfgEAHcuiZK6Bus9halOom5BjTf7JeovhupWynKGidr7N5jDka
	 mDv2R+hZQ38zJQs/gxI5CQYZ7r11XvUEXOQ3v2HCoNtRgn8xC4lstBEPfXDeInPu+6NFd
	 LIK4VB6yHypHR4AFyNpv1sJ0tgpKGAniwCjKMkemZl3uBqZd0f/OMXFvb7GoIBdOVuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870369;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=e7t9Ja/m3Xomv7LRPc/jOWsPDjO2VSkVHVIRWTQPFSY=;
	b=EznU1GgO+vrS3bJ/Oe2NjMqe4YgH2cl+UNkBpudWBbO/1sbFLmK/E+S2fbAvFhcMCnf/
	 m88gzlVusiis5yg6POjYPBK4ih2BYjRdZ7XRZURqZ+Wt0xAHSIJ4x8AY/YiBv20yvsvfU
	 VI/OTQUZJEPoN5tuJ++/ipqC8fQjbtnIUbR2f9iKR6Kn0GDni5FjFNETx4ocnugrMRtOU
	 5hj/pULKTO+RGpmvBi5GgpJsXgvtAPiJh9yzmUUPMG8ZEVvYThIX8hbUWTbcbv8JXBiIm
	 0/GT+rmQNn5NbmSLzH6S415jTUjXCKW+n9b/+ZiOPiRFTctDK7SQzu/lUmQzwkmzUVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="N7/POdB6";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6E606A32D;
	Thu,  5 Nov 2026 09:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B6E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N7/POdB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793870369; x=1825406369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y8+I+4z8jbQR3nZMWHsKm6N0ABd2PGqK+wxexLCJAqU=;
  b=N7/POdB6WcjOtDvVk8er5BQgYwT9TQHdQhE3KtRCAFyYY4zZRbWbtO5E
   Z8l5wKsK7NWPhyjXaDOlleREsOxFk+NOOZDq0VKv8NA/Yi3TnJXmD+maY
   PZGUqisXPWD8wsRJJ0BQK2jW/Bnj6Zuhicgrodyx+q7o4amjH/rteA2vD
   LdqCm6xOyCG8nSP95rQrw5NErr5YNpV+Qh+FFQZ6CV5CSKzYCZArNsGxm
   b4D8jT0l4p0rFh3TZMjWDpjDGy6YTKliL8dcpZH1HfdTknmd9lG2JKu0f
   X3oo96sKWub1JfmsuNt5ZIoueYQ3XPxt1UZVvNInkJRUUqaihuQVdepPV
   Q==;
X-CSE-ConnectionGUID: ngGWKV7kQVOtkr2KA5ATGQ==
X-CSE-MsgGUID: niz4k6EeTIa1DhWcDRPOrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2743750"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2743750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:19:28 -0800
X-CSE-ConnectionGUID: ehcyxQarQrK4O0F1CID+Xw==
X-CSE-MsgGUID: V1Ko+jf0S9i8G7bZym5s3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6956807"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:19:26 -0800
Date: Thu, 5 Nov 2026 11:19:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxKHF7U1x_Ozwpm@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
> 
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
> 
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
> 
> The sentence is explicit and complete, meaning it does not allow
> implicit variations like: "this patch or part of this patch".
> 
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> not be applicable.

I strongly disagree. It's all explained in the plenty threads you have started
on the Subject.

TL;DR: As a reviewer for the piece in question I have done my part fully. It's
not my issue that the piece is bundled into a single patch. We have options:
1) ask to split (and review as standalone piece);
2) add (partial) Rb with the pointers of what exactly has been reviewed;
3) ignore (silent agreement with the respective subsystem maintainer's opinion);
4) ...something I forgot?..

(even partial) Rb != Ack.

-- 
With Best Regards,
Andy Shevchenko


