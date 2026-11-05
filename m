Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872130;
	b=5el+ExmnDIVERs9nxogdVsfHw09vkcrWy6ko5+mUYnAq0/hAQ/WWXHGbs2pXeXpEaD2r
	 bdH7/bXGsYs8fXuWltyhdD/SM4nEHf4Unm7PuboCPQUS0Fq+uKuCdHLl/k7KMGrHp4uUo
	 Pa4jbuGBx71wghhkzmXfWpG1wdVyw+MN4+oFZX/n0Q0CUEjGw9f+3dB3/Y42SS38jN3y+
	 tW0AwTJHFGPk5TR/Au8XgKYI/TEwm5c1ZHwxUU/0GbxNcfU4Bk45DQAXDil9Ixy6y+trc
	 88CiI4Eq5+4RE4xQqx4HcLc9ZE1tSgD3pIDE5Al4GzVr4YevHPcVppXnSV0OKRa2tfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=aaiqo1FgmlnpqaHkZM8EZ00uKzuQ5yFTmLP85DmJftg=;
	b=xCuwn0M2L5sFxsbciI35HhCMh5r4tvuNfpRDwWCpYYwc/WO+xmjNynXxbnBO7c6Z7bZQ
	 ZlZyfMyFhaex+nJCLf92FUEpFUTIRtuhzXGKM7eYB+f1bitGwVJSvLdUuxYz0UQd4pvMM
	 1kifE5YqwNRUfa4uNmYUnZoy59+TwZzjNCsHmwQHbkugQGMYcGiOkl84MebHZPnM/Pe1t
	 jx7UVHMz+n8t1E654LuWHTQWJnDl/Llx9Aq09CCXPLJXo6s8WbfgP7lHjlhT8HJIP0R3R
	 U13cq1mU9i2tFWJ2OemgwKzQo1+2V9rFlsm6QTfzXST2OQyVL824UxZP63YE0Ir5ypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J3OqqC95;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E8606A31B;
	Thu,  5 Nov 2026 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J3OqqC95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793872130; x=1825408130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqvIovt+HVmdtThi+PrJUWBv6uxwBAn5/UU0lL2eiOI=;
  b=J3OqqC95yBrLFLJ2e2xnzRDNzCpwPhRkuRgeuJocBnmZkCk9iX/lb9G/
   uDeRfanQJaXW7P04+U0eTekaDt1CF4pA+kcQhgkFETUCYSEszLLhSoJUj
   InoWAg0lqZ4I0uEOdvu5ZaTgB1vmpE7LlbpExBwaWzT3bmfed8ZxaFXxg
   AWV7A0m8hQXRuipKNjVRiLDcHZoV+q0RDWt4dG2z50gSiHRt8++31zv2H
   gdbHlDNQdWj/AI4qmbZJ5C8jgkum6Iq2/WWXx7jHdSEatoT9/sRc7kyQE
   pMO5b35F7RPUc883uOk+T+x3c0ywnMytIvJztXb2jUmY6ZN+MUpgkWcyq
   A==;
X-CSE-ConnectionGUID: rnMogV5/TweJGeQFjuhr6g==
X-CSE-MsgGUID: AjJ21k63TNGhwMbBvRQAGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2551409"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551409"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:48:49 -0800
X-CSE-ConnectionGUID: 2lZit0EfTPWghbmjySRcEA==
X-CSE-MsgGUID: rH8B7TMjQsCCJH/PqDz67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7528273"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:48:47 -0800
Date: Thu, 5 Nov 2026 11:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxQ_ZYMHYJPStox@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
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
In-Reply-To: <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 10:27:17AM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 10:19, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
> >> Refactoring of driver subsystems or some core driver parts often come
> >> with change of the actual drivers.  If that happens within one patch,
> >> people giving "Reviewed-by" tag only to piece of the patch, like one
> >> driver, and ignoring the rest including the main concept of the patch,
> >> are not really reviewing "the patch".
> >>
> >> As explained in the Submitting Patches document, the "Reviewer's
> >> statement of oversight" is for patch as in "entire patch" meaning:
> >>
> >>   (a) I have carried out a technical review of this patch to
> >>       evaluate its appropriateness and readiness for inclusion into
> >>       the mainline kernel.
> >>
> >> The sentence is explicit and complete, meaning it does not allow
> >> implicit variations like: "this patch or part of this patch".
> >>
> >> Reviewing pieces of the patch while ignoring the main part of it, is
> >> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> >> not be applicable.
> > 
> > I strongly disagree. It's all explained in the plenty threads you have started
> > on the Subject.
> 
> Please provide arguments. You keep responding "No" or "Disagree", yet yo
> do not give any technical, discussible data.
> 
> You just wrote:
> https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/
> 
> "No, (partial) Rb != Ack."
> 
> to which I provided several quotes backing my point of view:
> https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/
> 
> > TL;DR: As a reviewer for the piece in question I have done my part fully. It's
> > not my issue that the piece is bundled into a single patch. We have options:

^^^ (1)

> > 1) ask to split (and review as standalone piece);
> > 2) add (partial) Rb with the pointers of what exactly has been reviewed;
> > 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
> > 4) ...something I forgot?..
> > 
> > (even partial) Rb != Ack.
> 
> oh, here you repeat.
> 
> There is no partial review tag. Please read arguments I already provided
> to you and either respond with counter arguments or just stop repeating
> empty statements.

I already provided you the argument, you seems missed it (see 1 ^^^).

-- 
With Best Regards,
Andy Shevchenko


