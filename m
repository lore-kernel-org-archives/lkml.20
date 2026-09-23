Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D5953A885;
	Wed, 23 Sep 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175314; cv=none; b=Mvfct9xNJXZZNkZSpxIu5h2h9wfewujUsvevSsRdFs4l82tcXeSjejB5nUA0L8Sjp0pqxAuri0Hwq89Aac1py0eaDZLRgvdf7m7MMn+hz3OV80F5Bd/FwxpX1uG3J1bF0l0A9NaNB8JNjIWq/fKgJGWG7Ieh8FVFaB9vMQbnVac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175314; c=relaxed/simple;
	bh=+H8TWXnyw19DNw9IGGdQ+9X9HmNp+bY8Z2cPHva83uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAn9jLn9gxNJfoPsCZP6CygFu/mqjTdKqV2YNzyUQMde0rqUUkC0gRQdDRuIXChxtYI5UaCWk+w9V16TeRwgbnRIHAUUsNDUvYhQ9saUcBVHIBlvV74/HpDsCdh/WCGYxSwXu0gl3WfVc8dthWzexpX7L1/+e3cljzJcSn8NG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVnSisrl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVnSisrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175313; x=1821711313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+H8TWXnyw19DNw9IGGdQ+9X9HmNp+bY8Z2cPHva83uU=;
  b=TVnSisrlFNsBGBZSbbZxA0mT9sUaZamCZpOW0SzkGn+2jN0oOribKdgI
   7USwtrYK4nDosJ2N+rjwg2Xm3jYikssULq0ZIGjWAJsXUwfMIK5tUCbBp
   2NlU/hvZVAm1HoZWXctG+NU4A3SOKGW81ac1QeSc+KlX7tygBYAAuMGCZ
   nxA6QMnJyQvIGiCchP5LPkDGUn+rOUxUJrD/6d1DDqOXWyedeuBhu7TTa
   TjtQTwugP6cVdoSL2VI22Nr8/lMYXLWJ5ebfV/Ylnq8bWwczPwQKFfDWV
   9a8D4a1Jh+VhepSE8pa2MA8qJD5FyLSyKhyfCPhWRPSC+B5bWJJdLhkW1
   w==;
X-CSE-ConnectionGUID: ITwgkWuOQxmn5LMzKNEHxg==
X-CSE-MsgGUID: ST64uSM7SZWIQz0UY54OLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78431943"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78431943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:55:12 -0700
X-CSE-ConnectionGUID: FRJoq8B0SL6amop0jJwSpw==
X-CSE-MsgGUID: IQJs1V0bR2uGhl+4WxBPLw==
X-ExtLoop1: 1
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:55:10 -0700
Date: Wed, 23 Sep 2026 16:55:01 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: rockchip: rkcif: add support for rk3576
 vicap mipi capture
Message-ID: <arPoG_CUhiS5F7md@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:30:00PM +0200, Amin Gattout wrote:
> The RK3576 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
> variant, the MIPI register blocks are laid out differently (there is
> no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
> the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
> size, which the other variants configure in ID_CTRL1, lives in the
> ID_SET_SIZE register.
> 
> On the RK3576 the pixel clock of each MIPI port enters the VICAP
> through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
> so the variant claims these five clocks in addition to aclk, hclk
> and dclk.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait
