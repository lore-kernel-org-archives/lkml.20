Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2593DDB1C;
	Mon, 31 Aug 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169162; cv=none; b=dpKiwmfpSZ1hdAoxTvaqktwaYE/Y1FQPAIRuC5pa/e22C3oaes3A5SohKy9wbjcFK7BYENBApPXtRQ59rDrH5tYhndmZudDJBij614VtW3BjMvy9XD92o80APQtpu/DDtV+NEceIurwqd9Q1sppJk4btbheg9gBHFJYFAbS/qEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169162; c=relaxed/simple;
	bh=YVMrzXsIcQC9sceVcl9Un//g4fBKPLsuMDMdJ3boRY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVvn3GRfaSnmTXqUv0miZ1SoCjFVPFuRjytuQlRho5QAnuJI2vBIQiGQKMkHZJfdqiCqqCdHWqlNmietLXEAExErhj+DYGuCEh2kR3NXzW4WZDfhcYw4AynvczuVfWaBUbeqTP3J89zjsFUbhu1deAsCJQIsLFmu1aujIvl0Z3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QduIDxtT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QduIDxtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169159; x=1819705159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YVMrzXsIcQC9sceVcl9Un//g4fBKPLsuMDMdJ3boRY0=;
  b=QduIDxtTjFIz2183tr1obTkWctzFkzHiwYGeBm7vxmkAQ8Pn6DMHNKlc
   l8fNvCoHs2xj+uvGYdpDo/P5jfugd7aNFajTaK1VZdWpgKR0fgZhebDgc
   kizMx9NWlimo3nLtTLCUsPauI/A7JAJHgQZMHue2qiq5djWQQwlcen2Jx
   V8P1FMPGOZjGL8oB3C+51q2NVceJWFT7o+ddWtWyxtQb2u/do+DZwX/yC
   aex8+iOpWeTLcOZ7BXfN8ZGHJPEtqZasQE7+teIzH5cA3ftFazYATVwLm
   v8JPZnaulic+vYVN7J6/pyjWL1R6QH/H02jBS2H/ZMyFm79y56kBV9UsH
   g==;
X-CSE-ConnectionGUID: aUwD7648SeKrKZ0rbmoHyw==
X-CSE-MsgGUID: vhKUiV+7QlKr9JonAgDxHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88333844"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88333844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:39:17 -0700
X-CSE-ConnectionGUID: XsV23mneSXWX+1ROF2DT8Q==
X-CSE-MsgGUID: MpwL1+WeR5uH8CBcm10XzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="274018769"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:39:13 -0700
Date: Mon, 31 Aug 2026 12:39:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/15] media: ov2740: Add OVTI2740 ACPI ID
Message-ID: <apVLv4E542FenS30@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <a04beb60575ccee57bf0a6079473df7bf735e145.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a04beb60575ccee57bf0a6079473df7bf735e145.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:46PM +0200, Maurizio Casciano wrote:
> Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
> Add it to the existing ACPI match table.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


