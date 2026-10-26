Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012217;
	b=zpg1PhsrolYseCbkg2Inax7FSjOoWH7T2wkzUaqro4jDZmtiKwNUgOjIHnXOg71MVAsB
	 /f0Rs9kU8KUDUhKB/pX2XuzajbdRV3Cz/07cjhA3HqIsxOPumiYQhlpjooAZbQJ80qcVc
	 O6Jqtum2xhBM2+gCb167oeDyfI/EZZ9JYAM8CnTi3OOUqob25RMDLuWzSVa25AOAgshyy
	 t3nfH8nr2pCx2udqbeWm+sK194ZtpmaDCXLPzi3c/MRSrk3hkRCGNe7YpUXE1e1774FDd
	 zadf24X2RQzZXCRJgGUR0fJYCW4mjv3nXkWtffZ3VS9t7sWfhFrk426XmjF3S1kx2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012217;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iq8sjorBVmoOm9+iAUMWTgdciqg75VQcwz+D0w6sWBI=;
	b=G/XoLoyp8Fb8QOEKd6/VOwJ8SWCkm0Ejfh7VQqTS+ayoU99onu3nw2QulVErD0d3uFRI
	 uCCe4CmUGEJUTNJ/+xyBHXXqv0lHP33Y2WCNqiEEZtsVR2nwtkwwjksHwasE3F0/g9Xph
	 Q4IqFupRNRZv5KMpSb9lICf8eeVVo2GL1uNyTmrQL//QFwR5sVbwqbR5qeKYOAATl5TDP
	 L8qWFGSH1m/6OXbybP7DHb0qblDuKQMANLy4pBIM4k+kfr3XlG7vBebhToCgNLgTo0UDv
	 VQNXRXhtQ0f69Xokv+2o7QyxbzTlhczPYveEEF3mO+MNyWhpYF+o8//DXDmTintwODg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIa46o9o;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD20606A31A;
	Mon, 26 Oct 2026 10:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIa46o9o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793012217; x=1824548217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6R7AThspgB3hLMq7DFgErpgQRXWjFLugVNFYWPwm0pw=;
  b=eIa46o9omDrVWWr3blLKsllH+8VVLQNQ6D/7GKHLFHR+Qul8JkWsZyxW
   EGxnQOB55sLF3ffx8xRhxG9ZptQAf3bzEconOhcRLgvUbo3ehYU2yWpCn
   uE9NZO3Zl9XF/x8BTE/I7qwKHTC6AWuJ3cbVNFnlaGiXfPWYqEuHPvz+6
   /HUPOeXKmFriMQ7n+vVuMZ/8nP7MF5nppcrHvzMy1BYeNfzFb8UtxvCpR
   geCQm+IiHnfLVGnqrLb4T1GHkuNGQygLJEosj+RD4enUMQXavG5nV3ja+
   niw929JDeLjmJCLSsWV1a7gIQL4BvJoQaH40YmzHv/xNVtW+A1gGa2Fp8
   w==;
X-CSE-ConnectionGUID: JlLwdF+XRDm/vF3ReEurog==
X-CSE-MsgGUID: D9BryQeOT3+JI4MBzbtVBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1680375"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1680375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:56:56 -0700
X-CSE-ConnectionGUID: HXTIutyZQ6yqPPiOnID3Fg==
X-CSE-MsgGUID: vyJsS/a5S1uvsAk/B3wf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4114405"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:56:55 -0700
Date: Mon, 26 Oct 2026 12:56:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Olli Salonen <olli.salonen@iki.fi>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: tda18250: Don't use "proxy" headers
Message-ID: <at8x9Ho-wkMVDUcg@ashevche-desk.local>
References: <20260717175155.1784500-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20260717175155.1784500-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 07:25:53PM +0200, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.

Any comments on this one?

-- 
With Best Regards,
Andy Shevchenko


