Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901260;
	b=4LRG9VY1EDUyI7inb/UXCPusKHpgk6AcGgnqiKayYNvtqKM571TRS4/Pi4eBvurmWeqs
	 SLQhqe9DZI6Xcy4atw2icFAMjepX9qVR1us1y3eQJSKZJYcCSHFQS5fBbEpV2wf/FPMR7
	 JJsrvCqWfeIknmfTBScH7jkuD+4vX0i6Tzd+dKm5J+0aTLv9fRTHZ6zffcK0hkOmGrqm5
	 fxYhRQNKNKNFxq2/Ma/Y2rlOFl81MFZ9UaMHjFD3ebWYyopKyk8iZcVZ8zQzQd+hR1N6o
	 vamqvYdS4eNaUsvIS+tnyF3G7hiHhAwQ8u6hp2HvMIk4s7LTbgWMHnjVqmVZ4UV1ltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=IUS9uy1A757F7l9nAmXx+AvA2dFR9sGvwvphdz+BVvQ=;
	b=lzA5wNZW0B7ldKr9Wz62CFRbllS//w9Y+yTtuLj3ji2fy700xsHHLgtaqIcgFeVs4Zkk
	 GNmA/y/8Ot1tm64NMT+i+vB4H8xazBpyqFS/QuOU68HyNAbIc2xaLN7dxzL3PWy088aMJ
	 9H1zA/BxcOdIGIeDRc32Rm9y63XxcM2+GE3cYSc+j/Td8WkYpcVi3DHD+R+258OtXlD5V
	 EmkGPkrtLnmdHsL3EDr45Bqd7kieWQ2kvZO5UunHqyUwpqIThPGwj2sZiuOyGBfJg0oeP
	 2vs0I93fJz148QCYllGZetPcgvNy1wKQH1r2jQuqzBTnfMEmcVWvOj9evDZ3rNO+qzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqGflQhA;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D4606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88D4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqGflQhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901260; x=1825437260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WtBNB9JFBHsmj3js6YP38W4eYVV19WpWJBt1NYTfGIc=;
  b=EqGflQhAXlaN0kt/9A6Yc2ROo2EpFLfPEQd/3U3+uZXEKsuY/VqNTI9n
   4F6rhNk7gSVqqSkybPmls3ENjuSJ3WxZZYf9FnCvQeymo20jd9YFBLp1t
   t/nIy+1STFTNXlnfJHmrtvShlWjvBczIUQCGO0uMsxGenTomnZ2uIPXi2
   6gqHxs8IOvi14fpqteZdtr98jlVHNO0GJthZMqoBhzh3QbDyKaDdXq/bO
   y3jpd5auv9/XXPcly0Wd93yPwOhj/RH+rxGewProg5sSAvZMzbGPgZBmD
   Qo3PxoBZt0GlB9469ZWBXv2nuIikzP09HowsrDyMws0b2yKHFtFrjBjpr
   w==;
X-CSE-ConnectionGUID: RzX2JPyWRfagU6CklJJ8XA==
X-CSE-MsgGUID: eYgIIt9/RIOFJPw7aKvsRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2603775"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2603775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:54:20 -0800
X-CSE-ConnectionGUID: mnW3WlSUR0aEpQAfIuL3fg==
X-CSE-MsgGUID: ANMFLOeBTzeuxMI1sqsYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7404699"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:54:17 -0800
Date: Thu, 5 Nov 2026 19:54:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: broonie@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, rafael@kernel.org
Subject: Re: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Message-ID: <auzCxxkUB9p6WKNC@ashevche-desk.local>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
 <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
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
In-Reply-To: <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 09:39:45AM -0600, Victor Chernyakin wrote:
> > #define REG_FIELD_GENMASK(_reg_field)	GENMASK(_reg_field.msb, _reg_field.lsb)
> 
> Macro parameter should have parens around it:

In this case no, it shouldn't. It a shortcut which assumes that _reg_field is
not an expression.

> + #define REG_FIELD_GENMASK(_reg_field)	GENMASK((_reg_field).msb, (_reg_field).lsb)

This doesn't look good as it implies that _reg_field can be an expression that
will be evaluated twice.

> (In the patch you link to, I wrote it without parens at first too,
> then had to figure out why I was getting "too many arguments to macro"
> error messages)

This is strange.

I have compiled it with GCC-15 and clang-22 (in both cases sparse enabled),
no such a problem (It's also -Werror build). Can you elaborate?

> BTW, I've been thinking about making reg_field store the mask directly,
> by putting GENMASK(lsb, msb) in the REG_FIELD macro, but that's probably
> a more involved change.

But it's already there as you see in the regmap core. What you want is to make
it at the beginning. Not sure if it's feasible and needed change.

-- 
With Best Regards,
Andy Shevchenko


