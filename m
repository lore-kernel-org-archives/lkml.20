Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2F3D669A;
	Fri, 28 Aug 2026 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902136; cv=none; b=K8CVGusi3QUhcdexZK+W1sbvemQ8T14Bl0LVFh+lPIlUqa4ndYZJM0rcHe2Is0ZzCSNt1OwPcxItOkfq+b3FR5PDcL7UbnzPtBjdQCmKLcHWM2ZP9LI/hrYtbeo0qofBSCxJOzB0JXkOAXerIc/joidYe2dxmH66FWpHCligQoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902136; c=relaxed/simple;
	bh=XwJl0gxDY7xCu0UxsNKq6Cviiw1BtSgyXNf8lyTcOeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROHtyf+0+vhBeKiy1XkM5lAIKM3pROLTLUoBrsTROHtYEYda7z3w+pFnme66RZ17pBMYv65YdLD2mw0dyAHiQV5/4ELkJkm19mfz075f4uwsHoTM3Yo5uZBTuhrlxww6SjNvY6XROW7mTclpGid7x//hBfGhScZPkSHSEP6CY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyqSqMnx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyqSqMnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787902134; x=1819438134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwJl0gxDY7xCu0UxsNKq6Cviiw1BtSgyXNf8lyTcOeE=;
  b=hyqSqMnx/+0NRj7eWk80WQpagS5Mn5fHpfhndV08VFMNIFi9gpjRpJT9
   2PpWH9+Ad6GokEIhL8XTMhTAFHz/kTftD4KsfIY3plzeOukTvuXuke2gq
   W3XflyspVHZ443EqNsdTjtv7SEXfz1BB6a+WCv/fEqjAdkNMqklY9KV0Z
   V4XB7tM8uxXpGjL6U7KDxX3489OjKirn369YVL0bWrFjSENppd3NNPoxc
   ys1iMaprs4C1V1FtuNCJuX7M43RcjQ9ZOq/NxJ/iE4O3g7cXGF6bGYXQH
   GxFbsQ44QmAUuOt3kAgw0R3J5rdniwsfTdGBkm+SdViMqLxNIlC9fKD4X
   Q==;
X-CSE-ConnectionGUID: 5uERxZbgRX2iamYxkRKmdg==
X-CSE-MsgGUID: qfk5HRmLRCaw6P9xPWOs3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88613151"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88613151"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:28:47 -0700
X-CSE-ConnectionGUID: /N1cfWzdTfO8oVIrhWMFNQ==
X-CSE-MsgGUID: QN9CT17nTh+TV6FRQP7uzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="263799695"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:28:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A5C86121505;
	Fri, 28 Aug 2026 10:28:39 +0300 (EEST)
Date: Fri, 28 Aug 2026 10:28:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
Message-ID: <apE4pzPqsjmQW-6J@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-3-mauriziocasciano7@gmail.com>
 <apCUKIgOZMoeSAP1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apCUKIgOZMoeSAP1@ashevche-desk.local>

Hi Andy, Maurizio,

On Thu, Aug 27, 2026 at 10:46:48PM +0300, Andy Shevchenko wrote:
> > +#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)

You can do:

#define OV8858_XVCLK_FREQ_19_2MHZ	(19.2 * HZ_PER_MHZ)

i.e. no need for a division, the compiler can handle it.

-- 
Regards,

Sakari Ailus
