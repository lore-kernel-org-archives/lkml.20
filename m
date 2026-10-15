Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A4C503BD8;
	Thu, 15 Oct 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057721; cv=none; b=O5yUWcjg8GHwv3eAQqLIMDqV3eZ/2cojoP/jmkSuyUnLlpy0TegT0RCZ6guRCgNffu6xqyWkvlUNTJXwRMA/SVL/s1UENFeyoK9LSpqg+82uaQ+yd6m8JdTA9p0O6FoTtQooXJPmfIzF8GsYYeiMhNXlOdDAmyWxw2qaxxo4Xsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057721; c=relaxed/simple;
	bh=ZAQ1Vuo0gNwW7Iwk6szOfRiY31ERMQsxQnhdPxlP9KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb9rjx1brjZhnohs8gY0QIjMoLgAs0fOVydljaVXP2p9VuZfi0c6I5r3H5k8UwXYG51/WjZeCwlpcoPR8eJkrWKPPRbO3HVzNiBqY/geh0Q8MMSDUpcgyCwSPPODD8qU+mHX09owJYA9pjXlrUHRBPf/wc1Y2Q4NLhhveFZ7wLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL2okNBI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL2okNBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792057720; x=1823593720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZAQ1Vuo0gNwW7Iwk6szOfRiY31ERMQsxQnhdPxlP9KI=;
  b=jL2okNBIIiYCX+7zSvUvEvQZOketLsGpufcw5YnbscTwOBUvgMkq3ixS
   DRckJfHMF0r8gLfyyq3svrX8dP44IXiMqLjspGlnzPdfUWxR79CBIWLaD
   xJToIIya+e4pOSw0WL0oXArQ2FZbhROqBG8YfhB9nYF+3BJd5KtuOT8DU
   ZXMyNPLTzAtplE7t8jRLYmFLatpmzPdObiIzZZx/CAYt0Sh+N42EiZVOB
   YIzrSuSCsiOKRzL7dYEijo4qrT9bXYbsYgc/Db//3QynX9lzIlJ3qCqaS
   gpCIEFSr7KolJE4Sspq3RKZZKp2drT7FVWhyc8SNX50coJonbVIt3flEy
   Q==;
X-CSE-ConnectionGUID: NWRquic+QdKDoUsO8+BMMw==
X-CSE-MsgGUID: tq/xT/i8SwWXizdISFHF8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="834252"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="834252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:48:39 -0700
X-CSE-ConnectionGUID: 8eGSku+jQeG/M8gPYJBjIQ==
X-CSE-MsgGUID: BqHZMhyOQ8a8CpgNm+33lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1748440"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:48:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 62002121BE6;
	Thu, 15 Oct 2026 12:48:40 +0300 (EEST)
Date: Thu, 15 Oct 2026 12:48:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce
 max_des_update_streams() stack usage
Message-ID: <atCheGSbenknaJdN@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
 <as9okp5GgBgc5Hlp@kekkonen.localdomain>
 <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>
 <atCfd-drVomrTS5X@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCfd-drVomrTS5X@kekkonen.localdomain>

On Thu, Oct 15, 2026 at 12:40:07PM +0300, Sakari Ailus wrote:
> Also cc Dumitru.

Dumitru: could you update MAINTAINERS? Cosmin's e-mail is bouncing with a
permanent error but his e-mail is still listed for M: field for the
maxim-serdes driver.

-- 
Sakari Ailus
