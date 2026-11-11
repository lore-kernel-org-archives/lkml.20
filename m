Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391726;
	b=uwePMBeSd7yLN8PWoX4qtdlXQhWvYwvfsCv/Rv+msX5Sd2rEEki+sjT7WAE+PKKmEsub
	 dTzvuDtj0tvHm20O3srBn07l0vIwhJUwixHmbUht2L8/pofDutF5Hw6ysWyNVHo3k8tpS
	 uPVNKB1hlKMRAlyICQFnLIHoLFAecYl4HJzqAyhDhDHSyTOucpFHTrcKeJAonj0Rzvi1g
	 KvPsVuMJ/9o8iMGhn9Or3kSR6AgwswpRn3DcBzuKQf5WCYXf1IXfCo6Ds0I1hfrT8gJL+
	 BVnI9pdmYbRFiCJCPu8JekMyNHYvz/T/7y3GZYrmLHv9xv1fIHcxDR2Ac7phYrSbwbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391726;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=FhBibYlotlIoriDD1qZMd/y5gNpVeKGTwgYsEGhsCmk=;
	b=t1Hg2StYA4h/BDh1N2fEiMNHBtnXE8rtaZsLD2pM+tXV+bgP3ebC2GZ1+yE78Gjaiz4D
	 LnDYvLKZcCS8ixYq8fAY6OqEf0Ts9/6omogXvgY7qfbbqb1Bh9FGnYu6HvZbtP6z7gjLc
	 mkK///mswyxRNG7GpyTMGwF729cJlEaSYR1gtJDn7p+0QhwsGfXLv2WFDhaofz79agXud
	 rUx/ByP1+gQ3oLOfM3Tx1HdVU5iPsx/aBPClKfOvEMU8ae50Oi6ifO5A4imZVpOgoJ0S8
	 zXMqnf5alDxKJZvadEuFbKP6JllPMr4W7bGG1Fv24BNuAldd/9e5BYg/ykebIbu05zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMBw5aEW;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753E606A321;
	Wed, 11 Nov 2026 10:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C753E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMBw5aEW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794391725; x=1825927725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IVhhbKFchMhBrB8bslTPRbh+ZFM/fCOPyUOsFOiln2E=;
  b=UMBw5aEW9rKqG7y1cUqfLrVfSY3wr8eKOhajStvNV2RvNs9GbmxoYoUF
   /GSs/yw00uvQ6Wd30WQl4ifk4CDfZwmslLOV57wSpJBUdEwwbCkvOggZG
   w9gMlalJGFRaKYoIB52BZ3jiW4oq9PioVDO7OuKYZCtMPzUmeF2ZjAAha
   CAswvpQAJewGweXgs3lRXvqwsOk2Xrp0osg8+6UHywmkm8Wj/b1eLok+2
   /C30pKrbOVv/TQO+w1FaoTiCDldS1ZaZQhJZH9LGxvgJrbjEo3Hb9TaRZ
   6gfByet1DeUltPh6A3J8LMwJx0InQRracTB7IcJVPN5/0JBwBRTKOE2pX
   g==;
X-CSE-ConnectionGUID: FjoPB2UwTN2oKlHGbivkTg==
X-CSE-MsgGUID: wJbQ9TttR4mfxr2hET/EeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3061356"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3061356"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:08:45 -0800
X-CSE-ConnectionGUID: 8UP6BIxpQnCYIyMsm7H+tw==
X-CSE-MsgGUID: 1Ovx2FjoR5iUqstVISgPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8456495"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.142])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:08:43 -0800
Date: Wed, 11 Nov 2026 12:08:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <avQ-pxuGfWjcaDGt@ashevche-desk.local>
References: <avO8Wax_1SEQ3Yy5@sirena.org.uk>
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
In-Reply-To: <avO8Wax_1SEQ3Yy5@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 11, 2026 at 12:52:41AM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: drivers/platform/x86/hp/hp-bioscfg/hp-bioscfg.ko: symbol 'strnchrnul' undefined!
> 
> Caused by commit
> 
>    e7cf4282a8694 (platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input())
> 
> I have used the tree from next-20261109 instead.

The fix patch is available.
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=4815f2e9494dc258c0d3a35e384ce41b92b690ea
Today's PDx86 snapshot should be good AFAICS.

-- 
With Best Regards,
Andy Shevchenko


