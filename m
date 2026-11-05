Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879175;
	b=c1AtUMeU/+ynkmQHjXKjKMdJnBd0aEfmlqOKSUlqBpAJPzsDosJR0W+N5IefODyfwisd
	 N94wRLACxr0BMDgCchqx001//rtrHpgp3f4HDpcdATPknqHOFgw0tpZ6eG6oS6rE9onmJ
	 CwfhyuSHfwOxlWYG1doD0Dc1VhxwC26qMVbji9URNSdo8wHGZV7cTfQ2tTVSMv38YJ45k
	 EmDJkGPIHNyOgsKdaHy/b/AGtOnITlGBT7hTxlVhBTI+Dpca4ZwUtI1N3Po2wdTkIMdr0
	 YHU5njqfj1p6Yax07C7o7ZODuugSV9vkcGKZbTV3knzs4djVuvZAlF+MGgRmo2GIoMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879175;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=NSKZa4ye0LkUdsLkrm7Rm28ju04K47Dqy5NWckuPC+k=;
	b=R0yY+SVlwjdrCDEsst5tyGGxcK8n0tyifo0hPlKMsrW9sKam2+uNK7ypZoT1X6WYxQAF
	 0/YeYXDDQXXqJI9qsI+S324AN55LsIuhfcoVw0/DUcZ872KcqUuMQEVPFxRSoWdP/pWpP
	 bN/EdOx8W2mMZTiFkL8kzUlhEOVy4+tmHVZKffoQRYzhWYfM74i2pmQZL5LkK6NUBIkUS
	 VlGKRnZwc63FfDzAlZApSF7VO3+ntHTKJ+BFFldTuf7ULHEl/jWKD2qDuFNIyCEGe88YA
	 49rRnzIZXqHKcHkusKb3gkESlrqs/ian2s+jCmFMwbAtsq0dxY3CTy9TdshSIaYIRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sr4C7iZ9;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8524606A929;
	Thu,  5 Nov 2026 11:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8524606A929
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sr4C7iZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793879173; x=1825415173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCg2W30o8vQ8OO1s+xdsqkrOdBHhLk2OtMes1baq76c=;
  b=Sr4C7iZ9s0umWaZx9amVQ2t0Hc2an7JmRL1z8Optpa67ofauSGIpe3ij
   qkVWRnYSJRCPGXp/+XenM5QQ1M/XH0zWeEy2GPz7nCOjsP7POvqPBIYx2
   wZt6aoawM7ppPcsrMdchyCvF72M0fLIMsn4tvncGWIq9A3pq9PI4IU+AL
   HeNUTYbNmCg0q9RJ5HOKC5PYlhhKWqMhzwnhy1iWGavcLgHxW9z+k5aJo
   1qVIHAPO742jKJUsmjxV8iUQi1jjc8OZft383EO7Xs0blEVXN5+C3OUb3
   Ob6BJ12bZALuCQPxF4byOt8XOT6BNEkVmlQ3Df3PrDnpKzy3ik/rAt4Vk
   Q==;
X-CSE-ConnectionGUID: ikH6ayYAS56OD+IhwId09g==
X-CSE-MsgGUID: RodlU/yTR8aEHagp006/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2548016"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2548016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:46:12 -0800
X-CSE-ConnectionGUID: Vdd75W6xS4i/w10gfKSiGA==
X-CSE-MsgGUID: DBVu0q0gTD6lwwwebdsT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7113980"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:46:10 -0800
Date: Thu, 5 Nov 2026 13:46:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gobi Durairaj <gobidurairaj@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: fix block comment style in sh_css_sp.c
Message-ID: <auxsf6qUD4XeAV2D@ashevche-desk.local>
References: <20261105064312.360626-1-gobidurairaj@gmail.com>
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
In-Reply-To: <20261105064312.360626-1-gobidurairaj@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 12:13:12PM +0530, Gobi Durairaj wrote:
> Convert block comments to the preferred kernel style with a leading
> "*" on each line and the closing "*/" on its own line, as reported
> by checkpatch.

If Sakari wants to take it...
This type of changes to this driver are not appreciated at this moment, sorry.
I can point to the success story in case you want to continue with this driver

https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurares@gmail.com/

-- 
With Best Regards,
Andy Shevchenko


