Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70751A127;
	Tue, 13 Oct 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908500; cv=none; b=oxgfP5QJhww58otSviGPbuIFN7rHFyr0l0dtCAH6mkYNzZyNtUUt9aGZ3Ro60n2n58zzIEuZIHljHnh11UftMiFuzBHtUEuHpOSiO3C3N70zGV2hg5Y4LRP2yfz5EXv9canrt4kNHByvVkHl8dvk1cZDcN+Jpm8lmZB18EogGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908500; c=relaxed/simple;
	bh=2Fe1AEOYThce9q2HA6HMtcK+p+baE4P9xz4DhljZsbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyY/QABkDu2VuRSroAl28SSzCJ7cgLpHI86ljNyOWBD9Z6sd2WUH005gwhznhWxBykmGlyMoZ3rB1U4/i2ay7ZTfHu13003HxFN62uRrHhhwXCwltNtMTpdifCZST3tKW/0lUJvuuSn4jmAYsf+KfaOYxVwWzENMiue9Tn1+oa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4EcfbAJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4EcfbAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791908500; x=1823444500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2Fe1AEOYThce9q2HA6HMtcK+p+baE4P9xz4DhljZsbg=;
  b=i4EcfbAJ71aVv17VKfyDQLhgvXBIQthhSLHaNXW+Y1umKf/Aqnk5R04j
   zrsEmZmm32BHFgvEy4ZkmSVRHlq+r7I4ZU6o5Xn+jYJgg3B4/XEKRO5Fl
   L2BNgKhYaYBt6/Kg6sHFEA0VT+gvBvYOKcRNMRtsh2j5D0X1TUaogmRQm
   mZmhT4niL5zx8xpdOn1KbyW2wU6ZZdqnub9bCFbVQE/M/hQxHQ0SEVZJI
   8Pfd3thxXAmMJOv38Q5iBHgX40DWRoxWT9NEpY1DdTdpCxZq+ZkNKi4b2
   XCghpr1uCFx5thXA6Una7722SmeTOgA7K9ZneLW2za3Su5TtTSqhn68WU
   w==;
X-CSE-ConnectionGUID: QKtkm9YCTTqQIeCuP43K+A==
X-CSE-MsgGUID: UTqJHIB0SCGotdRrIGaXoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="671758"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="671758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:21:40 -0700
X-CSE-ConnectionGUID: tWpMIeioR06MVaRlpb3Shw==
X-CSE-MsgGUID: kPcbyPKgQxySHPVNXw1EGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1524496"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:21:37 -0700
Date: Tue, 13 Oct 2026 19:21:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: atomisp: remove unused circbuf library
Message-ID: <as5ajhgIu-Mkdns_@ashevche-desk.local>
References: <20261012230754.1914517-1-vladurares@gmail.com>
 <20261012230754.1914517-5-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012230754.1914517-5-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:07:53PM +0000, Rareș-Mihai Vladu wrote:
> After the previous changes nothing in the driver uses the custom
> circular buffer implementation in base/circbuf/ anymore. Remove it
> together with its Makefile entries.

The best patch of the series!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
(assuming it compiles and likely works)

-- 
With Best Regards,
Andy Shevchenko


