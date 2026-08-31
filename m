Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A63DE448;
	Mon, 31 Aug 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169224; cv=none; b=bfBfRC1brYtWpWRXBVz5wO5W4dezsj6S/oQWvHGmhH3arSChlQ9XXUCaVPWinVULziFpQeoRrcRADSuIlSm15nqlvQ623MMLYqmPCyTEkm2SnFQieEAo3BCJkB8dT39gnGoFbhVmxSxyYaYwtlLa5ntiYRVW+fz7Bs1ymjXOvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169224; c=relaxed/simple;
	bh=VjLEjM6LkwV7lOQjptYA0xDcE7nm3b3xsOKZXYEGpGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUBbqW6NtQhD4q+ABgykHhOIMSyyjvJj7MxuV4pKP55RttAnoPrw9R4/nk42+IlYd2YJUhZaX0/9UwDidbO7pWM/uqbmKWR/29KbacdHy+HpnsmpiRf2GOlzNcw3mq3aWyFfc8qaybTHHTlU6PaZk9/OHvdTOwBsiQPpRM7fK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5CuliNC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5CuliNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169223; x=1819705223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjLEjM6LkwV7lOQjptYA0xDcE7nm3b3xsOKZXYEGpGM=;
  b=H5CuliNCd/TOwijduqvNaJBpAn2bRQ8gVSQ5Mck8cnTkmB9UIWlmHSl2
   5IyXbuyt1bgpDnSQZOr2BO9jsmSNFLVzVB/qjkYilmHuMSR7TUHt0vLn+
   /v3dV3A7KPsBW15lFo1XYXf7UUlDiEmmL34cPs0jmDZrb/8tHv1qJ61Np
   pEvPT2lL28mXxjktxy6anZAeO1s8/1bkoYcqFBGo+1glr5UNBAHXGZtkK
   neSDpalyqlDvqBBf7/wOozdf92W8AEwwtS3CCFu2udsSHKtNpLLNXjYYi
   sBp5pi+Q9uVYSxZAsJI/vTTFZ/S36EW0KKPOTfXoS0CNcl+HdfciwVmSC
   g==;
X-CSE-ConnectionGUID: tsfuRtJ6R6KirD99NtTgzA==
X-CSE-MsgGUID: A5SMg0XyQuOYuOPrX56o2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88777184"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88777184"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:40:22 -0700
X-CSE-ConnectionGUID: 4/Uu2UScSFe63kvjtNq1cg==
X-CSE-MsgGUID: /Jdz5sBLRhGfa4a5K3OO/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266947502"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:40:19 -0700
Date: Mon, 31 Aug 2026 12:40:16 +0300
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
Subject: Re: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
Message-ID: <apVMALyPsJSsB5BR@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:47PM +0200, Maurizio Casciano wrote:
> Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
> sensor. Add an ACPI match table for that ID.

No tag here from me because I strongly disagree on usage of ACPI_PTR().
But I'm not a media maintainer :-)

-- 
With Best Regards,
Andy Shevchenko


