Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF737C909;
	Thu,  3 Sep 2026 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413755; cv=none; b=IFyQ3xtt8ASRfkSomKrgGows64ibwe0tsbvc4ATkJIzwc1OlQ8LPAmvuQYQXKFdLyW7nc9xTx26n6ebi/2My5D9iWsZQwRBjuC6up/V0AtQUysUqqDbLoy87+yLXuZQq/KgArm6vHWeBYJ/sawYXlxTyseL4SCEtXfD6SogOMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413755; c=relaxed/simple;
	bh=WKQgxtdoETvEWEmpq183oxTHMXwRkXKjd6E+jWntN0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BK15wsxH0t3HWUuNpQ6sE5NdNK6YQ1SD9BDPb9KgbOWB1o+aJyqcRuzd7uqdAhQZBYs/wtvlk1aQVhRckKMIFrqVGFnKp/f2h7jKyQ7pwjn9m6yPR6N1MeO5C3bdyXPgiXlQsfP5I3nbhasw86uW20ZXYSuG7XQCJ7ZXu1rCJtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjZYwIv7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjZYwIv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788413754; x=1819949754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKQgxtdoETvEWEmpq183oxTHMXwRkXKjd6E+jWntN0A=;
  b=CjZYwIv7ASkFVHgVkdzMlH/0eawuH63cQtGv5ZNN1UfLINvnkadE10XW
   YgIX2uQTbWZznmXqVtUreOzZucBWZvyjZAtYpIOoICxyllQkJ3ED+a3co
   Wb0lSFck+cCoeKxhTxA9XhYxUBZI54ItL2PqmqU4My9EEfkylcekgUyuH
   7GCLtNzxhEnPpQVHnu/J6vwe6OxOp4WXBOzKFZNJkTAbSebtFzhKgx6fT
   3abLdMjasa9cWlm0fxYJI7gGmoNKlY0Ea2K4IcRuNkwOT5T4SJIognrIQ
   WLoe8Wh9DXnwDAbn92K2pLb5522n4liTUz9Q4Up6ItiIT4XjTjdTuEOcN
   Q==;
X-CSE-ConnectionGUID: SzM05MR3RgGHyW1E3TPqvA==
X-CSE-MsgGUID: r6OoE9znT7iRzKuuwo+SEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111656927"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111656927"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:35:54 -0700
X-CSE-ConnectionGUID: I6VyKbYSQwquQYCjIwTV/Q==
X-CSE-MsgGUID: ZAcfZf5JTECgk1dmqc3Ikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274906022"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:35:51 -0700
Date: Thu, 3 Sep 2026 08:35:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/16] media: ov2740: Add OVTI2740 ACPI ID
Message-ID: <apkHNBehp4Pxp_lq@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <38149ff00ebb24aca8089ca2e3aed3fb8bf8a06e.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38149ff00ebb24aca8089ca2e3aed3fb8bf8a06e.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:33PM +0200, Maurizio Casciano wrote:
> Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
> Add it to the existing ACPI match table.

My tag is missing here, isn't it?

-- 
With Best Regards,
Andy Shevchenko


