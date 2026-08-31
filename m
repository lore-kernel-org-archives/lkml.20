Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687E2989B5;
	Mon, 31 Aug 2026 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182975; cv=none; b=KZofP+mX520LOocldtPVPyy8NFbUuu4dBRrKY6v35JJA4/0eFEa2tJn4Y+hyCyaDSqQsM5vxgowSIzn/7NQFKpwu3Gd/h+XHSsy/uoHFavxcQCLJ9grHM4bhb1J8BCSOAz9BEonhBiHqx7jllVy5tlGuxCa30H95Kyd0jYM2pIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182975; c=relaxed/simple;
	bh=RMY8kasRUAlCZRti/5kb5I+qo8xk+7XDnMoOMN97pKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F40fFu1KgeUu4vLYI5isAV8P5nGjjGD4lnvZgxQwyGYmUpKPZQGFtIi1REhBbeQnPjeGifyV3n/Th5vR6un80Mdj6s6ucVU8vZBuSW4LsA83XhAxqRMlOYNSMLxXXojfMvA7yCxuKKqO0icMmB5rhIn9byUcLt8y810lV0Rqlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6Rzu2vc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6Rzu2vc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182973; x=1819718973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMY8kasRUAlCZRti/5kb5I+qo8xk+7XDnMoOMN97pKA=;
  b=X6Rzu2vctpGLH5B8onBBduoKsMAX5MRedtayWMxRzIY35ddsg2YmXlio
   LMRiFx0KjCGyiuCZ8a3oJcTymiieD//wQIEYqeiK9/Q18vguQ4BQgvuwQ
   7kwRim+B9WYgiwCPwWD0aAcWaX2ua4Z3IsAyaWfq97GD+RbJwkaNu7juD
   lwdbncu1j4O7dCLU4z6xpuWtJ1HZzYbbUA3gi9W27Zr8WQ6Ljqy1quLH7
   W2jOjuUUYFYBED3tWowoF5EOnz6gK/lbudAcJx1Wn/r217NBFO6C8anxu
   KsTTTqY3Z7ZL/pu+qRj76HKf8R7K1C83raGX5JfBQ3klnSwoNO2k0A8Aq
   Q==;
X-CSE-ConnectionGUID: t4dE0wsgSJqvVtvSr9ivIQ==
X-CSE-MsgGUID: j/xSQZJZS3iOuHKG4lnEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88518026"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88518026"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:29:32 -0700
X-CSE-ConnectionGUID: uJ28TDVuRrmGJHeiuGNSsA==
X-CSE-MsgGUID: xzafnzCWShOI2cPn3TZdiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="266999069"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:29:29 -0700
Date: Mon, 31 Aug 2026 16:29:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mauriziocasciano7@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
Message-ID: <apWBt07FXlDhu5-g@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
 <apVMALyPsJSsB5BR@ashevche-desk.local>
 <CAO7O_xja+1XutiXhXUZ8k6+cF=P33htUVjxKZ1ELWR1brb4knQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO7O_xja+1XutiXhXUZ8k6+cF=P33htUVjxKZ1ELWR1brb4knQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 01:12:41PM +0000, mauriziocasciano7@gmail.com wrote:
> Hi Andy, Sakari,
> 
> Thank you. The use of ACPI_PTR() in v4 was intentional and followed
> Sakari's explicit request in the v2 review:
> 
>   "Please use ACPI_PTR() for this one."
> 
> That review also referred to:
> 
>   https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t
> 
> Andy subsequently noted that the last patch in that related series was
> controversial and had been NAKed. I should have called out this conflict
> explicitly when sending v4 instead of leaving the rationale undocumented.
> 
> For v5 I have retained ACPI_PTR() for now. Removing it unilaterally would
> discard an explicit media-maintainer request, while keeping it without
> clarification would ignore Andy's objection and would not earn his review
> tag.
> 
> Could you please confirm which form you want for v5 while the related
> ACPI_PTR() work is unresolved?
> 
>   .acpi_match_table = ACPI_PTR(ov8858_acpi_match),
> 
> or:
> 
>   .acpi_match_table = ov8858_acpi_match,
> 
> I will use the agreed form and will not send v5 until this point is
> settled.

Sakari is media maintainer, do how he says.

-- 
With Best Regards,
Andy Shevchenko


