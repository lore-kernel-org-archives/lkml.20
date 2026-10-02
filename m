Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF0338E135;
	Fri,  2 Oct 2026 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968397; cv=none; b=YvFcbF834NYEwiQTbAmblJdu7fs5IjYwmkUy2sZdMu5lS0zJetQeYi76hW9zbMmNySEXgoUXiLNFVGLYAQnufBSqqc3t58QlwO7HpoFDB7seCYWqXmYNn4JtouPFMihLGNxWat0E8cHEbWTAPgRFbAQAhpXbORrH+K4fWvkL6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968397; c=relaxed/simple;
	bh=7AnLrCmmGzfchlsQUVsMdpXNPd+PRgZIb806oL1ig9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFOOFCbxi4EDElOo+0vtez3m8Jz+q40zyGbQDCQd/sNLYgp/XSYOiS8qj7b5F46eSF/EAQJKF04Ckj9x2C+MGIoE8Hv4vA1d/OP36Z6y0XNfuuJy7WyTAnIZtbOWFCt9p+OIxrcijuxGESt5JLaL61qQLmymniOymkNx/4ON5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=au1bSKUv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="au1bSKUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790968396; x=1822504396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AnLrCmmGzfchlsQUVsMdpXNPd+PRgZIb806oL1ig9g=;
  b=au1bSKUvQfBb5qiY7b06Xs9DBZtk+IHpgJHYc5cH9IAaB0ecGNrnk0vW
   6m5urAM5DG1hNjGyBu8FcJ0cBSpNIpmqLrIKVzcpE7GI28Kj+Kj0gBwn4
   HsfnMbuBkWJGqkvpjSq168atQSzO7qTXjCPgZbi/qXMDlsNuf0OP8BgUT
   haBLa1aroS1la/9wypE+6rdtXiE5kUVPRh0OXwZ55n/go6FqV/0/1oXzt
   wnMLs84FIoms1niERouS5UbLlfI1g8nJm9vecpFuUrGdSD+hkp5MJu+BO
   gJRRMBzhxUdaLELgFB3UVKTJZwl9SxB5tnOubSshVOBcyG1UEI62oI/ll
   A==;
X-CSE-ConnectionGUID: jsZShf0KQt28wLtOideGZw==
X-CSE-MsgGUID: p65NSM6oRnKIpOy0G3DoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90798371"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90798371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 12:13:15 -0700
X-CSE-ConnectionGUID: Pl1yrAxIR8anZl9RQR/gRA==
X-CSE-MsgGUID: 05IIsST2Sem5PW7hPGKocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284379841"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.45])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 12:13:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D8C07121BB9;
	Fri, 02 Oct 2026 22:13:09 +0300 (EEST)
Date: Fri, 2 Oct 2026 22:13:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <asACRblly0PJOiyF@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
 <ar674__4-cNOGMMy@kekkonen.localdomain>
 <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>

On Fri, Oct 02, 2026 at 10:14:29AM +0300, Andy Shevchenko wrote:
> > > +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> > > +#define OV8858_XVCLK_FREQ_24MHZ		24000000
> > > +#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
> > 
> > Why to use HZ_PER_MHZ for LINK_FREQ but not the rest?
> 
> Because we do not do floats in the kernel. And hence for the consistency's
> sake.

Floating point operations won't end up in generated code even if you have
floating point numbers here -- it's an integer constant.

-- 
Sakari Ailus
