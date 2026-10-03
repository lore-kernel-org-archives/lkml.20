Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEF3FBB5E;
	Sat,  3 Oct 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041083; cv=none; b=HZ6Olx41Ntn/bi6H4EYZrAkfywLB0efuiSXHziGnQDuUC56bnU33QNLEv2qSwzPhxeSmTMv5By6+xiT+afizAbvTgyHwI+RFQTfbSwblnzrrXcw8VmMAZjsWsleWNGkO++WXvqN9HnZRRfx6O9mg+cwmG7OREWkfyENupAmCow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041083; c=relaxed/simple;
	bh=XL12iT3BbGxqZklS+zqkfyINVyUhD9hlO7xgKM4eW64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awECBNFVxTyrjgIAO5YtUB3eejxKClyandmissZ/bj9f5STTx7wsJ5M/n0S4JlZJaukWFg0bOZta51oSbtX8ittJq50l/JZpUcIgGrr0y+2eC9b6eWBB48qFpURS/iLKjDqmnpb7oYnQr5FaVRNvQtDQQvhaNmZqlryIx9p0BbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOMLIEFQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOMLIEFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791041082; x=1822577082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XL12iT3BbGxqZklS+zqkfyINVyUhD9hlO7xgKM4eW64=;
  b=lOMLIEFQ89l8QFvD+08FKDEacx8Xyq69b8UWnfLXD+hwHVvg/V0vlXNX
   +SmgA16CU1ur5Dq1G630Wti2ZyTM6wxpGspDua6yCyxff1Vq/l9wkyoby
   OE0qDTcUdSxzH9LGtJhFQ5VefN4+Fp0id2wGU1fQaR863KclT1hcK8OZT
   +YvRG6og6asx8EEpOY2hA5KdJoL9eH78+14I9TWdGYC79AkwwanNXFoay
   52yxYkg6BbUQVIcTYxlgpEx2bFqRmiz2/QWTdjQkhsK93Di5IhIAZmn8p
   aKTJXgBRopgaR3nZ/zb/56Hevr1xDnNUGTcvly+uCceW3tcl+/FoibRiH
   w==;
X-CSE-ConnectionGUID: e9c0YfvlQVW42XemUwS3cg==
X-CSE-MsgGUID: x8H7KT88QPOJw8CV15P+SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90635771"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90635771"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 08:24:42 -0700
X-CSE-ConnectionGUID: q06nRWtqQgSqFtjevDdxeQ==
X-CSE-MsgGUID: /LccEnsMQVeI99Jis/b+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="448478"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 08:24:38 -0700
Date: Sat, 3 Oct 2026 18:24:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <asEeNPNR30IVg31M@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
 <ar674__4-cNOGMMy@kekkonen.localdomain>
 <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
 <asACRblly0PJOiyF@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asACRblly0PJOiyF@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 10:13:09PM +0300, Sakari Ailus wrote:
> On Fri, Oct 02, 2026 at 10:14:29AM +0300, Andy Shevchenko wrote:

...

> > > > +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> > > > +#define OV8858_XVCLK_FREQ_24MHZ		24000000
> > > > +#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
> > > 
> > > Why to use HZ_PER_MHZ for LINK_FREQ but not the rest?
> > 
> > Because we do not do floats in the kernel. And hence for the consistency's
> > sake.
> 
> Floating point operations won't end up in generated code even if you have
> floating point numbers here -- it's an integer constant.

Theoretically there is a room of misinterpretation, not every float number can
be represented as finite binary sequence, meaning that it might be off-by-one
or higher magnitude of difference in the desired and compiled values.

So it is better to avoid floats even on compile-time.

-- 
With Best Regards,
Andy Shevchenko


