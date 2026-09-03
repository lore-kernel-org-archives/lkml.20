Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7086B3FDC06;
	Thu,  3 Sep 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418925; cv=none; b=jbapK7knPFqbHV3cafJZQoCXiXJ1rKU/r6QvtSYLC+Fn4Ww3WsDNN6q5ofMBsLNkE3cwtFCztC8KftNoRMrVmwjKgAsl5RyW3itnG3c2bcim4EbzJVsqJ8Qpip/cmPJhAYEWAUauUrILdYq8QFM3cX1V4S7MyKbVrERu37FM2tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418925; c=relaxed/simple;
	bh=p0DLqGocHqpfSAmGIsGAVaS8fpSkr8z/3oF4Pd1J1vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMBj1bLsU3aS9xzsABH/iQQSdZ0GPouOVXtJQT/zkxO3RInIlCmsSdDyVBLSVGRi2cl6PX1m0gjnwkPVlsLD/Un8mwfqZSPDrd8PyMORP9X5I9s7R6CHtfXTKXflhKmVZrwR76vyQVls8tQUOKRLkeqKTuQLEtYpYTvB7ps+jEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bam/6/l+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bam/6/l+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788418923; x=1819954923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p0DLqGocHqpfSAmGIsGAVaS8fpSkr8z/3oF4Pd1J1vQ=;
  b=Bam/6/l+CM1anbaDggDJh0nTT/Q+UZUFvLI4h4TECU5+IwU+OcGk2hwA
   mw+1oiPdyy22yjX61An3g/u/vvgApFFhexvnibtQS8AhM/REJ2d8fPpxm
   ZXHxdgR4R3w6NayeN99u4I/gKJkgjUf/iQyombVWLacxmd1wfPqnPus+H
   f0s0IqSJIZnOKgMO2ABALFpkCkyL9b0Nhs9ML1iTdkNp4+8QONwJzXFBR
   Y9ELTiseapF8Oc1CSqKwK8UhqcdlGjt18xRr0zGtSqxmagI1aXv6EdKig
   6Cs5UdoQyWVavaAnLG7JgBf8vnthwPlasnpYwB7PYXYtX+tA2eSDv0IFv
   Q==;
X-CSE-ConnectionGUID: NnRrvg7tRlyelgIpdY1blg==
X-CSE-MsgGUID: eyx9dF8cRUWbenPN+0jhGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106255529"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="106255529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:02:02 -0700
X-CSE-ConnectionGUID: QP6q0fThS3yy5lmNQ4V5BQ==
X-CSE-MsgGUID: dl65pcGOQhetlwaGG0rwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273130429"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:01:58 -0700
Date: Thu, 3 Sep 2026 10:01:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
Message-ID: <apkbZKMDcOceI11m@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:38PM +0200, Maurizio Casciano wrote:
> A bridge-specific firmware parser may have more accurate link-frequency
> information than the generic ACPI hardware-ID table. Let it store link
> frequencies in the per-sensor bridge data and prefer those values when
> constructing the endpoint software node.
> 
> Existing bridges continue to use the hardware-ID table when no
> sensor-specific frequencies are supplied.

My tag?

-- 
With Best Regards,
Andy Shevchenko


