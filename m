Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42363D1716;
	Fri, 28 Aug 2026 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903326; cv=none; b=CjC/uLhlco7haujuvxAeXs6aAgZIH3lW30ENMBKV4ZzzNd3RgTGyPmveU5cT24gj4cN0hMWp8xBRi9jB3m8i+lyN4TkCceIPuNPJxgnq5mJT/Q3jFPsUsjfuzCZYuoxyFJgYgPyrf1MNymH+9H25OCmwgF0hcCAP1kL6UIS7gJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903326; c=relaxed/simple;
	bh=0fLlgjvAfU0Fr/nyEsISrJYNBRB/GNjWdODVOEBs8/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laQqncUCdytCa+B4UufPBFzHQPBXHFWhhAMMB9aKLWBmjUwGtMUd5rui9ZW8OWYTc6uqCVqFVRKS7G1wzp0stb69ovpmrNmrt2C+35gFHDOS6xoRHiLLg1TcePP5SSc0vs2o0qbg8izukjeUlcK+NKZrul+Y6BeHalOak0I5O1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4ueB+w3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4ueB+w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787903325; x=1819439325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fLlgjvAfU0Fr/nyEsISrJYNBRB/GNjWdODVOEBs8/c=;
  b=X4ueB+w3Xv87tSbGIGm12OXnl4umrR28wBUIPDZ41mdmssJ/t7JNs3zV
   9CC9unI8jQJ61deqM9gJigs3cm2NDFcjOVKp64o8aAJrKncMH4z+6IGP7
   i7EjNjAHKc2LAnV4NsuAykWgbKVRnGMg2YTG4xV0rSmNYdYjquskRJ43d
   AAujhw4EuTVXNqrfZv2ZBaMcPIN2fqdwY6OcWfnUN7TsECIwRvkyvt0C8
   jnIQoMP140Gqn2Al9jgVLTO4WgEdEHs9ZpyqE4ad7dVZWbulLe1zbHt83
   lkVgJgxIDBfkrqgb87KdXc98lenPYZK2TnODD+UIIP69k1Zp9eY9jsl3Q
   w==;
X-CSE-ConnectionGUID: d+cKr396R7KP2BuLznxhoQ==
X-CSE-MsgGUID: HYhd3gqtQ6KMemLeXGkWVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88174101"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88174101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:48:45 -0700
X-CSE-ConnectionGUID: B4ptl+ICSQOdGxKd48lREg==
X-CSE-MsgGUID: oHXseKQySJ2sQPOZBpOwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="297981591"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:48:41 -0700
Date: Fri, 28 Aug 2026 10:48:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apE9VnQoWHk0PIXo@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-3-mauriziocasciano7@gmail.com>
 <apCUKIgOZMoeSAP1@ashevche-desk.local>
 <apE4pzPqsjmQW-6J@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apE4pzPqsjmQW-6J@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 10:28:39AM +0300, Sakari Ailus wrote:

> On Thu, Aug 27, 2026 at 10:46:48PM +0300, Andy Shevchenko wrote:

...

> > > +#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)
> 
> You can do:
> 
> #define OV8858_XVCLK_FREQ_19_2MHZ	(19.2 * HZ_PER_MHZ)
> 
> i.e. no need for a division, the compiler can handle it.

Yes, but that feels not right (converting float to integer at compile-time).
As I said, I think my suggestion _in this case_ was wrong, let leave them
as they are now defined.

-- 
With Best Regards,
Andy Shevchenko


