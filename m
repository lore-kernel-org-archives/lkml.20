Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267760;
	b=cjD0JaEGCD4i+KzhYxj4UCEPR2raF8qgNrBmEkaVYK0/903fLa6mHq+4m/fE2URJHbSl
	 k5JMANETsqOxLMN31tHoN7lZd6voVM2gnr7y3tHBjVZMRis5Z05h+Mazq0Yg0lmbe5aYU
	 FdZ5C2YrKZ115WvRhFfU2u8h7R7QF8qKg7Ud+oW9dL+q+mYVw31ccmZhLvqgHreCHYuo+
	 9dhZ218tetWxPpbDvF0/FDjxpjBT+hEG9s506y35lhhBl88IdcVEIA5jtaxbun6SRekzW
	 OUx1UmNafvj75L0Rhjk7pwFyh6572Pa+PxlFKloGpejgVejjSYTsQBwLh8EDRa/k5+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267760;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=lGdRARy2hTjXvm5N6x11M844O4AaHIePmhow78mjt8A=;
	b=G0XGH/NoWIs+5fqAPI6yUhPavoHC4GrfQIZf9vseIS4+jW/hRg1yj+2M94ryGlzBrQRq
	 NjnwSFcSXnvHY5M+SqBDhjOrJl+SOzsjtkZAjO3kA+1um3NikN25StMM7qzMiYzWLiwX+
	 GNXsoUlb75RgIkHPT2J8UrClhAf/1e2DoVU1nFlneXBBvStclPo2p5PSUokXAzguF/bWq
	 FqM9kd+CjceoIESj3kf6OjnIsdML7nBoEKZ5ZuQQ0s1eWVjCrbPsm+Hl2inDrLYk9VbSm
	 A9fmvIefIhO3IM1XbdNqOL2FKd9tiOzh8s82+1exurTHHh0gjn3ekoMDBf5TMMuxVqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8lcwGdR;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213A606A321;
	Mon,  9 Nov 2026 23:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F213A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8lcwGdR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794267751; x=1825803751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYFjYIn+CGbYoEZgZ+CNvjJy0omJ6x1vjgIkbUUXJ7k=;
  b=W8lcwGdR66STOzoYsvWPpKJr9kWjNON8GsATEMRTZWmJRR322I1QgcYn
   UrAxNM8B7VaBDMpDNf7FwV+V0psnlxc84Yuvl5aMB/irEidpTaF1gorys
   F2bjrttXjw6t5ven8AyrI4C6Lw0DgVseaQcnilJq/B/68j9qZfjOi+bTD
   xJoxMQJxPdV8dEBdc1+AvUnl1xlJo21G29xdAYYD6OeaYJgHzvxbqWvC6
   Zu7HlCBuyB7a3xJEl4Ed9I6rN56yJmhWWuSoJialRBwOmFvhAAe2Pppgb
   gZ7FAlhCmKaD8nc3jLv/L3IrW3biCmCfwsxfW9gxIyxXmnivJA4SXvP1c
   w==;
X-CSE-ConnectionGUID: Ka4IrxNiTAe55V7u+PoV3Q==
X-CSE-MsgGUID: HOOx3hMwRLqkEFCNJdZJxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2871270"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2871270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:42:23 -0800
X-CSE-ConnectionGUID: j4NviGBfRey5yKXVQ3TA/A==
X-CSE-MsgGUID: MEHDX/LSQAS3ljivDMcxng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7805222"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:42:21 -0800
Date: Tue, 10 Nov 2026 01:42:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <avJaVvGszUvANR-5@ashevche-desk.local>
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

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
And yes, I have read the whole email, including comments.

-- 
With Best Regards,
Andy Shevchenko


