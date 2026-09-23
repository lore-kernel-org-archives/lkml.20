Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2E53C3B9;
	Wed, 23 Sep 2026 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175218; cv=none; b=hHm50Ki3iWlHAj5i7GIDIQodRPw/484kqVaLj6KeWAVpFi4u3oCfrkOufyAEQBqOl0qOw8JoANg2lZvfgH26apWQj0RMrXof/lt/IDaxppX3Oczi2bFi8Fyt9xtMJUwafw1NwC/t3wvXBQGz6mut+6coww3vbFKO5F/3S34zXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175218; c=relaxed/simple;
	bh=rtgRXOJibX/Ng8wRfBILO1C3FM5qnu9zYTXLpzgUldw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/iJIolLJ+Uxfet93f1p6QqltZI/SbCgIEqOx76nqG4JKBDzzjGdS+Dv3Lrl8jzfIxOrnCTZX+Y+GmVHd5w19paEROg36q5/NjCj4cg+xsT0wNhahVEvmisqqgMOcJCpg+I6q45lvvlbLQkau2yjYoUKAEfUQc1CucumvhogAX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brgbl4OF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brgbl4OF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175217; x=1821711217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rtgRXOJibX/Ng8wRfBILO1C3FM5qnu9zYTXLpzgUldw=;
  b=brgbl4OFOitCQ/VGGww7u59VfBahH3vVT16+dXPN93JCLa70e+cUL843
   L4P4/c71mRuokFTEE53AwhNAjTcgU3AguPq3j3KOaPcSEf7QFOEMcQKEE
   D/ZO8YUYi//yTZXCQmA9/FMe7H9FhSTAxsu0m4nmLm1JCpDB3KTcNmEBB
   Tp9TAjQJ2gCfrLm1JRazFab+noFWDssTC9LDW22DgYQY+DexbYNRqH88U
   GM9VFN3/e71FncNY/euUwK/o264NGNc78haw9pcGaGJmFnVOPtRJ9mCHO
   vj4JD0oXmuegi8uHnyzOvhlRkLwWU1LKXTXsZ7hWdsusScUcY4VxPhdCH
   A==;
X-CSE-ConnectionGUID: JO+2eQj+QfqPb4HrUlJTfA==
X-CSE-MsgGUID: N/bZLWHuTBObYCsOfESbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101541362"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101541362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:53:36 -0700
X-CSE-ConnectionGUID: AICcPkvZQO+s+aSZ5YkSDw==
X-CSE-MsgGUID: Twm0/f/ERxSynu2tD3NGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272251112"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:53:33 -0700
Date: Wed, 23 Sep 2026 16:53:26 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the
 MIPI ID_CTRL1 register
Message-ID: <arPnvi6y5j-xPO_U@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:29:59PM +0200, Amin Gattout wrote:
> The contents of the MIPI ID_CTRL1 register differ between variants. The
> RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
> for the virtual channel and data type filter.
> 
> Let each variant provide a callback that builds the register value, in
> preparation for the RK3576 support. Variants that do not provide one
> keep writing the capture size, so their behavior is unchanged.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait
