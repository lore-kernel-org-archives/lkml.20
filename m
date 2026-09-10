Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C92DB7B8;
	Thu, 10 Sep 2026 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028901; cv=none; b=YGqS/ycGvdPomNgEsH6t3gF9c9bof0KasKsIIZ6b5joWDyn+oCQaUwhestB4rABlaVSHdnsi/Q8GGkMnkS5a34+O6A/xCAM0iR2l/nTNJy51Xtnb55rUhoW5sriMnUaeqEbvJZWU/SiBwdK/lB/lBZp9xvcs8EPzz028trvlFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028901; c=relaxed/simple;
	bh=WDkz52FIAfyAlNvttdx5kkKNy25D8LaFsV4Ljf1NNCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqOix7/HDWo/gcitPk84JqEfTdBeVNh3LHKqfrte1v/R9JchNPEz8Kr489Hml0GN820ONRo0zADLlfKKGVXot4YOVB+gGiCDDYA07fG73i40cFNLFCXedUgbrGDBpe0Ritb5YUMB0qiez3XlRivTYDoEFJkExe+/fWRHnuXFXEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljj2NKjX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljj2NKjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789028899; x=1820564899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDkz52FIAfyAlNvttdx5kkKNy25D8LaFsV4Ljf1NNCE=;
  b=Ljj2NKjXbThsdm4nCgPO2KP35a6wXnMS8SBR0sJQFuli5ETab3Sy+l3p
   IsRyKIL/K5n8HUCp4kg+shirULXYFuH4Gwiiyd0qtTN0oNinAfYZ3ZOBE
   0l81rBh79oayblC9/ZT4cLAuwShykz1uTev6UI6YBZdudGAAvBEhsKcXs
   4POfUKcR04t6+FwgBO/Ztaq76zDBwDn0MfMqiYQl7XU4+AkS9VhhwaKSd
   VtVzBAo9lCDpGUVmn6KeqSZgHX8HAIw+2EKXDHEsYb/XahZ3g7krl223T
   vJ3rjC0uZDDH+5zSG4XkTxBzYxxZ4fOLTRfMRn8ZBML7z+VKfaIRQ95Up
   Q==;
X-CSE-ConnectionGUID: PH7tmxqPRJeK06nqoMYi3g==
X-CSE-MsgGUID: fc8LH/6HTfiqpg7h3kX0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100133446"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100133446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:28:18 -0700
X-CSE-ConnectionGUID: rlz8tED9TKGCoZrB/F3uXQ==
X-CSE-MsgGUID: wyy+7JkkTWSAdSNp2cFeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301465602"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:28:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1BB441216AE;
	Thu, 10 Sep 2026 11:28:19 +0300 (EEST)
Date: Thu, 10 Sep 2026 11:28:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Message-ID: <aqJqI4ojJblnQQ5m@kekkonen.localdomain>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-3-a05b2d04c892@oss.qualcomm.com>
 <ap_v94pUrTo1C1Go@kekkonen.localdomain>
 <20853e7e-0884-49ae-a6ce-48c0c826ea27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20853e7e-0884-49ae-a6ce-48c0c826ea27@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 04:14:49PM +0800, Wenmeng Liu wrote:
> > > +	u64 chip_id;
> > 
> > This one seems to be unused.
> > 
> 
> It is currently used by og0ve1b_identify_sensor().
> 
> The intention of moving chip_id into the sensor_data structure is to
> prepare for support of additional sensors sharing the common driver
> code. The next patch in the series adds OG0VA1B support, which uses a
> different chip ID. Keeping chip_id in the per-sensor data allows the
> common identification code to be reused unchanged.

Ok, sounds good.

-- 
Sakari Ailus
