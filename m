Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007912;
	b=tyJya9GOBfuEbHvm4P21fMN/mY+jwdiNc5Xj4vQvBqzz9LOxW98NAL0nreOskwhG3rbP
	 7mFPtCvb3/kNr3VN+BaVA9guR9+MPaoZJDXn5gBoiZSaAeKPp1cLCrBs0PJm34SdKB0/X
	 niIW9OqTt+6O6rXXIOJ7h7o7XP9Dc0hpynOwvnQf3aSDIBG7d+u7FqRp3uFjYR0YpRAH9
	 jQrgnwS0KzXU+5Jgl9B1NCgA/4MmT0Cxj+zSVKIXXyalYajzZxqoChJr/2SInd4E8muZv
	 xZEAI0TcGOCK4hv/6b49/fcgV683TEKJ2F4L7UALBH4tlohCb51B74RxR7dxNNLQ8Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007912;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=t51/HXa7enyx+R4s/dp4s8wS5dK93m7xQGRvnHzm1/w=;
	b=LDzQSnqrJ/vHFJCI3owEYn5Z4dltY2QMHNWCkiNHIk4f8q52KMj/ANVfxTNhpmaZB3Di
	 wEN6vZ9h6V5J09yAd9kmOeuBnN1J3B10jnNItvyzC2x8vbdf7pHZpse85yVp0zTTQTXHs
	 OYcKoA3eNK8ukqIX2lo+FnCXIhP9S0UAYtdULzJlWbOemYNF0N7GDQgB+cUKxMAq8yhn5
	 dZa0Qo/z5TuZKKiK6MO9JoB8/rS4srm2cyOcG19pKkDFgZEPqpQ/634WfGwJCEP01Dg/L
	 5u8VZjLBzvMseHEZfRawIYc3ta/775t7D1sujZxa5onWsFQPlWMxBpgWekB9xC1EY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VKNPWBfC;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277E60A2602
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C277E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VKNPWBfC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793007911; x=1824543911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/f0+4nOYxvZpaTHbFavUn410tjTTYAcR/+FT2r+Fgdo=;
  b=VKNPWBfC+HihbGOtjoD0w0kudsCxm+7UcdUKxhRz/qrVgfTChIo06uwR
   ysQInudAn17VvTpPZury+y4sVAWcf+D3LRXolCiUBPrTdyA8uSxOvfvtH
   OGo6nmdfAOlKpgzrOZsQB4U4F6/ysPe3lGdF0nFkyYnZeqjz8ByA7ydtQ
   92RSUOos8GjCdjJ1BGvbt/KT0Wtk0Ax5+RSuou7UaqJIflCjFeHcntUHx
   murcdasWL/7MI2EHJCJme7jTZHvE/IA4w944kKniK/ranTImH9ohRwzN2
   38m+uvF+E6OvJOuMTW4KQ/yw6uK/DsKDm5UvyWbCIYyqxAX2zC1BWS+Zx
   Q==;
X-CSE-ConnectionGUID: lbCacD8EQ/2hbtvZa6fFmg==
X-CSE-MsgGUID: Zww/HvVMQIKsyfngcsEZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1695264"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1695264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:45:10 -0700
X-CSE-ConnectionGUID: nEDIturLSBij41GeBUyGnw==
X-CSE-MsgGUID: Z5FJSpDxRd6kKkkd0C/iQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4249816"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:45:09 -0700
Date: Mon, 26 Oct 2026 11:45:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
Message-ID: <at8hIi-JeUC_uQ4k@ashevche-desk.local>
References: <20261025193613.278610-1-navonjohnlukose@gmail.com>
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
In-Reply-To: <20261025193613.278610-1-navonjohnlukose@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 01:06:13AM +0530, Navon John Lukose wrote:
> Every runtime resume of an LPSS controller waits the default 10 ms
> d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
> misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
> 14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
> the i2c-hid interrupt handler for the first report afterwards takes
> 12.6-14.4 ms.
> 
> The PCI spec asks for those 10 ms, but Mika Westerberg pointed out that
> the LPSS controllers are not really PCI-connected devices, so the delay
> is likely not needed. intel-lpss-pci already clears d3cold_delay,
> quirk_remove_d3hot_delay() drops d3hot_delay on several older Intel
> chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
> 
> Set d3hot_delay to 0 as well. The handler above then takes 1.1-1.9 ms,
> with no I2C errors. Only Arrow Lake-H was tested.

Okay, we may go with this and I believe if any issue happens somewhere we
will know that sooner than later.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


