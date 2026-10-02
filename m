Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35A4477F7;
	Fri,  2 Oct 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934859; cv=none; b=V9EeHAW8RqDoYfAR5HJdAOyHLk05Yc0T1EjZmXt9yGuT0azNw6MxqHAAUhJECljPNP2YL8AjgNuyyD0mSmuvW+MxihDCKgpIFDAdyxkOswcUxYUx9xQNkFD6zGxi9ehvXx/0oqWlXXJxsO1xOF4a7ofsPUmdc3/saSi7ICT/8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934859; c=relaxed/simple;
	bh=LIH3653wHUiG2rHQosnCSA/Td0xQNJwohQIQij+gCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXhlnQ+funHxHm6Rkifta1zOsjlmIHyljp0ZJaSdoIsEZbHlNb/nSiYEV38l280J96mIrPgjun4Jkdlb01WjYO2Q7xZJ66DRrZCMJsgWLLbEo8JF4mlTLhw2Iiq6JQ9SoQHgufNsfCfAiZS64ALYJaTWAOWJDh/ywSa9PefKgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5ugB2xL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5ugB2xL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790934857; x=1822470857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LIH3653wHUiG2rHQosnCSA/Td0xQNJwohQIQij+gCCg=;
  b=K5ugB2xLhwmyRXNkW9pNuRswHMC1JBp22WBnkAGREWjfrF/6glZYmni7
   ZDNkxiajXNckyUjE+EnZOSoCFGjP2jWbc+6MShxrUiZse7wal5ImU5eof
   Kq+QH80t6gpYWECuspnfS2MRP+FC6trRWv0xeg2mZIpgyBp++lEgGh7Vm
   sUfa/chdg+UikT1Hh+lDXcUbLWumsJCO8TuWL0gzdsW9F+JWzt8SGHWM4
   vAzeZEBivARoPHzRbt1snsIkYsF/XmRn7KN3akisLtWb4AKBl0Iw5h5wM
   aaSdSxNZ8BIPhn6nyNQqBL1TxL6EYCNdkSfiAWTsJiPC3xnFA5NihnFTr
   Q==;
X-CSE-ConnectionGUID: ZKLQIxlfRZOSd5fAAm7vzQ==
X-CSE-MsgGUID: 0Za/vpMiR+aMrUh+zZZUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94187986"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94187986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:54:16 -0700
X-CSE-ConnectionGUID: zMtaMrcZRZOXuJ7K+HUNXw==
X-CSE-MsgGUID: SdCxz/i2QT2BG41Id64Mmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275766882"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:54:13 -0700
Date: Fri, 2 Oct 2026 12:54:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mauriziocasciano7@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 01/15] media: ov8858: Extract digital gain programming
Message-ID: <ar9_Q1iBAfLVyvKL@ashevche-desk.local>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
 <20261002-submission-media-yogabook-v10-b4-final-v10-1-817ec765b257@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-1-817ec765b257@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 10:57:39AM +0200, Maurizio Casciano via B4 Relay wrote:

> Move the existing packed digital-gain register programming into a
> helper so clock-specific gain handling can be added separately.
> 
> This is a pure refactoring: preserve both the register packing and the
> explanatory comment without changing the bytes written to the sensor.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


