Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873483;
	b=msSY6PhD3AFC2cIvMMMP2YsOKLux2JbyjuF10yrtB2muNg90qRpKoLIxwGkKtrS03xyR
	 g8iiQL6t68weQD16tLxBjHIEUWK+70diTPtPHtFvVHK+72ZgrKoGOEvbMTba5HST+C7j8
	 ZgZgTYrA7TIU11ZzO2mAcQZ6DT6WzaG/whjfZ3qBJwTcyjfzC51zBRr9WYsWgNDfksIc0
	 vlhLHS714NFo2QXSmJ73KlsYMmXQfp+FydTqEjzw68ZMja3vAmcJe+mpVU7qXLwb6y3EE
	 +Dm8bR3a1GybojqppKOuNDVTVJmbVMUZ5nbrBTmD5kXYOEKDW2FG0lZlabaNQeSsvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873483;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wsdgcA9vaCSEKoIEPaFm6fxJFmWhFKqHok8lRNdUQUA=;
	b=cyvkpEJMLo+6Di/bINV+Y+Ac9yfhV8HxJlUzPFtSlpfRdNMG9xUU86rDNAnjQIU0FciL
	 01abU0uQC7PfOERo1UVgoO/amucHt9MDVWc8THiWXpwoBqHf1E1xw750/Th23yUj84hJw
	 DxLaFvjfCnaaGeXxhCoy/4fRijzgX0QVOQZ3yjwcCu4SxTRygkF2l6ctKLehx+Mxb09L4
	 EtlQSMYq1AWtRCkQr4CZT9+k4YwRfoSnD4ACV5Gwt5c/sSH7nhwY1+reLaERXy1zFNXNd
	 eoYPygiU/pBQOhJE+ysb/ITqZ5sl0A7voBPWJIupc8DMUF/jW+9xeEC3ublsjDK46Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7XnIbvf;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF606AA67;
	Thu,  5 Nov 2026 10:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365DF606AA67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7XnIbvf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873483; x=1825409483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cweAt+G5hJEjWG5u8FMoAhY7j0vIg+95aauQT9On/go=;
  b=b7XnIbvfFrumMlxZVIQGa3cV2wlRuH2Ozed5ydAaS8e8ijBfNWseXQHJ
   G6wLViIBvuvvxOjFyb2DJnyx1c77L9iCzXx0aP6+/kK+aVMidtGls6Byd
   L1/oWrrI0QlDXUVrug7yXO8fjU4oQN8RNDgDPsOBl00NUa6mOFNLv5OZY
   xiFtccthzTCn6CQJPrxViKyj4Y4D4kjABmJ0rGGZjixGd0uSXw2/TwYqC
   JqPU5XOLAfAwgILqCaRt6fhpOP4e2OPfmDdNmcI7CpT6A2fDjtZI82uKJ
   1E+whCOVpe+JJGK4zKMgFD4NWfKpfbzc0LAFW6bWpSw9f2QkAggmEIrwI
   g==;
X-CSE-ConnectionGUID: 9OlYFWRnTly0KFOcCAlwSA==
X-CSE-MsgGUID: HoEMZxlkQwCh8sW3qXW/WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2673920"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2673920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:11:23 -0800
X-CSE-ConnectionGUID: +GylQFaiR6qSOiSg1gzRGg==
X-CSE-MsgGUID: c5UrPFLITOWTTwaBoDkmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7084246"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:11:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F18C5121B97;
	Thu, 05 Nov 2026 12:11:31 +0200 (EET)
Date: Thu, 5 Nov 2026 12:11:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry
 loop in buttress
Message-ID: <auxWU5QgfZ8hrSAH@kekkonen.localdomain>
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>
 <20261104222832.32471-1-laurian.iacob@yahoo.com>
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
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>

Hi Laurian,

On Thu, Nov 05, 2026 at 12:28:32AM +0200, Laurian Iacob wrote:
> Use scope-based guard(mutex) from linux/cleanup.h in
> ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
> error handling and remove redundant goto unlock paths.
> 
> Additionally, replace the backward goto retry label in
> ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
> control flow readability.
> 
> Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>

Thanks for the patch.

Unfortunately the ipu7 staging driver will be removed soon, therefore it's
a target of fixes only.

-- 
Kind regards,

Sakari Ailus
