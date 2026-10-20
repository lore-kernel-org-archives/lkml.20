Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491703;
	b=a6NFMh2Nu1QV3li4RA9qSFUA9thvWsI4rKlIa7cLmFHUK0GsADqe6SDxs6vy8TOqr1xc
	 VMZ5JLwlLOnCx/8cQOj7zdGk6BxNrWBHabCuoPFaoIq7rZozp9w24piK+IgwT9lq7Ay9O
	 seLLrAjj8Vsqo2nmPG/vpef1/K1TLccyEVGfybI2Ugg8nfR+6p+gVx+LdbffwaM6yGn9G
	 +iyfj89TX+MHDaxbhMpZFe+lvaksgQcqJgDadD4gTRoZL+9Bwcp02s2+HlVtoxwdrFIjZ
	 FxXLUFY7Ev79uakpXlzCG1CP/cIkOHHM3A9hkvkSTFX8A2PNIaGx6wjt5UHiKoQckWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491703;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wd2QYoyrvJ9UHGbfYj4JQntUmH1M8tYDbhIqDlujXZ4=;
	b=lWFFmvQoj/sfYfA+O3IUoI13STvlodWbhQmlSIN6rBCG9wsoZkTizr2Xt897EdnGPuBg
	 arn5ooZGYz7Ixjq7l/dR5wudgoL11+mw+mHg7aZ2KisZHeLrJ/jslIpUBdKCUoBcSDVsF
	 08rcTdQ38fAKzPo/gMPA6FDqkTxbS4RbDsZsQ7hUnIrOBVkLOt4JqN2f5pz2RAGR6IdnX
	 rdmV7ymR+5LAvWSFvnmMqRGE46PzwaBi6RSSM9C3Ww3Z5H0Xq3tfU1Hm1MfHiJo5bxlVS
	 SWUYqz8N43Oizr+b9T8b+mYLr9DuxABCVRo6ly7yotPmMU2M7Uglvvu1WuuLAQU3vFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSSfOHad;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A21606A326;
	Tue, 20 Oct 2026 10:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSSfOHad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792491703; x=1824027703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAK9mKytLl9tLAO9OqIlQ0tXat8bQ+n2hA+yco/S9lY=;
  b=kSSfOHad0ghkWtyH7MVmkWKmdKnql+l0Q62M4C0lTGJqvoBK5NRYVmQb
   CfmNcytdWENLuA943RCUvaqwgUVxRp8UCAY4SxWtlY9+sDQ3jEXdMvm1v
   M0z3zk4mBa8dNb388BcjAWqbnycaAwH3PBZjdx0axn+qVqY4uFeRQJSQk
   S2d+poPMQgulLcI/Of17M6AIgErDx8LXsxqZ0nGdpeKiloZ8UFueDQ/eX
   c687dJmVLHllzDJkT+W5xt96Ghj9FyJ63nR1/rRgKp0WmEyDP6xC5MkQF
   VCUl51yf+FMo8E86/8pwDEK8PxZJ1dKOoq/j8azhtowIXmOz3Cb+D7jdK
   A==;
X-CSE-ConnectionGUID: T00nanJeTzqCeQfpl8n2FQ==
X-CSE-MsgGUID: j3FlQgMPTa6VdhYZpjgnRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1290454"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1290454"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:21:43 -0700
X-CSE-ConnectionGUID: +U/Dj2WZSRGArQuScAN/Uw==
X-CSE-MsgGUID: EW1sEq1eQNqK4yE4+kTsdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4567871"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:21:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D304C11F7E8;
	Tue, 20 Oct 2026 13:21:36 +0300 (EEST)
Date: Tue, 20 Oct 2026 13:21:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/16] Update imx678 to act as a common Sony Starvis 2
 driver.
Message-ID: <atdAsDGw_jvhaydM@kekkonen.localdomain>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>

Hi Dave,

On Mon, Oct 19, 2026 at 03:28:07PM +0100, Dave Stevenson wrote:
> On checking my box of sensors, I found I had an IMX675 (5MPix) as
> well, so that has been incorporated. Subsequently I was able to
> add IMX585 (8MPix) and IMX832 (1080p).

I missed this while reviewing but I guess the comments apply to this, too.

-- 
Regards,

Sakari Ailus
