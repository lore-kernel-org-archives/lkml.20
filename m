Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F2299920;
	Sat, 12 Sep 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208622; cv=none; b=Ag4HyeHq/B/3EK0lvfFHBNSaT5W196DpZ5Xr6zoaRYu8L/sTMbXb7xjASlF/aPNnzVhIlSu8bH0j7uV3A+fE0xe9/492dDiZvCmckPH6sQXC5vWoSZMTx31uXDw0fsdJqx5KzvHmQpkBPsFr/pctv6eJAMBNX8Yap/AdXKOtur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208622; c=relaxed/simple;
	bh=1MgsdZqFByEuKZbj3wzMFofTkdE4lSy2fbRuCMSFLrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWcLATBC6LIOJrJnnAeLV/IBidPFlrdFz+Dp2AiXvgKxMYBBZ3fX4As7Fc9VRKppIYZld8HmyDCARstczycRs6YSV9b/VSoOiGZr2t9udTMwsy57hKzOvlPVYbxRR+RAA4FhAsfIJsClQFGlrFLCjRb/TIUIZdq6anw04sMAWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1+nFDmS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1+nFDmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789208621; x=1820744621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1MgsdZqFByEuKZbj3wzMFofTkdE4lSy2fbRuCMSFLrs=;
  b=k1+nFDmSQc2bYGLMajvM4XRbdhMMrwGy3VxnUvf+HJnAMJGKSUoVa07p
   1gC3/lk+xeWh2PC2ZpgoL+x3H3YDrRP+gjBI4WYYgSDKs90XaYzge9e8N
   iMqsVnmEywW7T2XnDBjhj9yMoMIkt+zAQ8ly3Y57sKwkAw47bcgFbA3rW
   FWfLX8o7QmmcLRS9xklEHsI9bXK72yvFPOqIVWToFJ5alCaXumLpr9JU4
   5qeusqjo+gMEMXp08jiYDqeeomXqlLz+pu4Cm6WMmVXNFtwX7jmWH3ve3
   wGA+xCX/56/MYxhbc/JRiSXNhgEafinQLlbkX10i4KRgBizbftet/9zjy
   g==;
X-CSE-ConnectionGUID: 3jkKGLxHQ8yT5bsq8h29ng==
X-CSE-MsgGUID: St51xmwiQgKaEl5gG8wXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100314336"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100314336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 03:23:40 -0700
X-CSE-ConnectionGUID: gKzK93CnRVCtZfNWW1yRGQ==
X-CSE-MsgGUID: 4EEHJie0RKySbFwHZdR7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="272669528"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 03:23:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F36FB121BCE;
	Sat, 12 Sep 2026 13:23:42 +0300 (EEST)
Date: Sat, 12 Sep 2026 13:23:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
	antti.laakso@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a
 streaming sensor
Message-ID: <aqUoLr0JFGEBiJIf@kekkonen.localdomain>
References: <20260911194854.78894-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911194854.78894-1-nicfio@gmail.com>

Hi Nicola,

On Fri, Sep 11, 2026 at 09:48:51PM +0200, Nicola Fiorillo wrote:
> Unbinding a camera sensor while a capture is running is a scenario that
> nothing in the IPU6 path handles: the kernel oopses twice, corrupts memory
> once, and leaves the application blocked forever. None of this is caused by
> the sensor drivers themselves, and all four failures are present in
> mainline today.

Thanks for the patchset. These are known issues and unfortunately unbinding
drivers while streaming isn't supported on MC-enabled drivers currently.
This is a MC/V4L2 framework limitation and cannot be meaningfully worked
around in drivers.

-- 
Kind regards,

Sakari Ailus
