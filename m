Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703560;
	b=RM169elGcawRoDJDwluLm2C8OvnXcWWlNqg/5OIMxc2McI74VMRpyHESwDHOa8kwSwMq
	 lcCy7VwsShWOgF7fGHXryIl+uVArfDuzROVuxKYw4+LBrO94gZJp7vCp8YjPtviLgyaCc
	 tq1veY2BVJl3/zt2dvPkrRqdkED14RDKbGy03KdJQHHU6S82nBoHplz6GI4Bk/SLpV5g9
	 DC+GcEhYTZ0bqlXbnCusq151KSOWIGUMHiwck62W/5LkvXtGUAzrV1O9urUx8pecQERUs
	 SlyAX/24mLD7Oe5Vr0e/4ptFBlYvhqPyrrLN1YZ84+f65EebkZaCi0UquaboL9gb2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=a+tEIyoGMg5X/kIk5RYaTo3wb9FBGOUfJOQ54VEe2jA=;
	b=NlDrzcQdx4GM9R+f6pqIXyQ/yXOJmDHDDeIkzw8k4hdLDVLij79ZvC8ZM7aFtVe90sDt
	 /zTtMfr7NrAEbZo+rcJai1VxAIdN9wVtg3ImHXHDycyxJtsw5aWXPJRewVZbvyJJvN7SB
	 5vbV/j4qpfUa0YAnirr1U76sEzXUUvx000MUZ6qbbxareSdSiQl9DwbcasjY8AZFnf69/
	 C9TsVCX6Bx2lB2RfyvYCzymxvxSPExYwoOYMnpCzX6W/GvA3+ugcECRTU1KOq53w/OwVU
	 1v+QbZRgMynE4SqXMKyx0CuDvga0Y2F8I3PruDuo6Sm1IsD1sW9cPcFYJzgbN+WdF4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YsUN+C0C;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF9606B13D;
	Tue,  3 Nov 2026 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAF9606B13D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YsUN+C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703560; x=1825239560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHgNKws9vXz9ZhAyp4mI9ElEf3AipzUq1kc3YQztZ3Q=;
  b=YsUN+C0CKQ+8H3s1/sP+4ZT5cNqINqy9nwVAJABDLo4DEzD8ZpgJUyOc
   eAsRD1W/c8qLCp8TlnMsF4+JCFC2qgoDVNjyzXeOpkf7feJjxOk9hkFu8
   i24LPRJ4rlDm3QhKfM9Oti1k2FkRmxdDUKL743nkmKMMiGRpgdWAEyL7/
   iGNFgbqqD30/2m/IpiGt0vY3q16g6BbpnXw6VJg+KDWl+3JawauzXXUBF
   z0oI9mfDCUvKOIHpEDCfchS1WnufA5VOaAtKFEVjpghYDRJ2Vau2R2z0K
   ALf2t4AeUWGdgfW0WFAxP3psbqas+FFChcA+/5LtDxdKn7uLsM4F5h1NO
   Q==;
X-CSE-ConnectionGUID: hkZjZciQTEKnUdYD/vMvsA==
X-CSE-MsgGUID: phsGCk/+SMO0+84EOy+RpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2438855"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2438855"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:59:20 -0800
X-CSE-ConnectionGUID: 4Fa9DxYETqeqkhNR63VMDA==
X-CSE-MsgGUID: WbvKq0PSQWe7YaZjAHLcLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6408986"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:59:17 -0800
Date: Tue, 3 Nov 2026 11:59:09 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
Message-ID: <aum-QHNr9hKEt60H@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
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
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>

Hello Quentin,

Thank you for the patch!

On Mon, Nov 02, 2026 at 09:22:42PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Add Y10 format to the v4l2_format_info table.
> 
> Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
