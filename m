Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9A34A797
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454852; cv=none; b=eF8y5kQbuoULcCDYDwXaF3UOOcW3w05bCv4oKMYWjzlPnGL1I8/muIa7KfVJiQxfEYuYyrEegGYGB9ptsy8NrahANyFCm86BLu7ldNGH/buB5hmjSbh6vzCPn+VO9PWn/UMskdZeCZRBMufgl9ZBuEdIyRbE0opFjJD8acbqY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454852; c=relaxed/simple;
	bh=ao/1SP0limgLbSFXUesvmpCimW5D0rPtohPBkJ5qmhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2hUo/FFL9avVyd5hqnIIhDaPOmS1O3yFiph7NXTTpqTE3ziei5z78vxUubud7mNE9KeJ36ZxbwT2VVdeZnYQuPS4zJpdxlH37J3Gq1cstLLRRy+4niaSw2dkGVWSA9PCo/xF3NRdI2lb3oRQvQPPgP5KgVRlPFnG7UXH5NBkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKmsjiQp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKmsjiQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789454851; x=1820990851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ao/1SP0limgLbSFXUesvmpCimW5D0rPtohPBkJ5qmhE=;
  b=UKmsjiQpui2IQ4f4wLELXathgLaR3xP2cP+rW63vv9yTEcmolmdB2ukp
   15ApGuAMXK5NYjzP3L8egIXrRdojChhyfPZPgOg3vHB7E35oeAq/9JqC5
   oc1wJOxC/OGd+Wvhh3DUCzf2bqOMqMNNDjiDFrOt8HS+/87rjMd9fugEx
   HDy3VRhgSIGQgn344jNmvR+UTI8tSUzfVmh6TrJ+oL3ETAsfF7hiooEy8
   qMPAPM5djg6UpwVoezC+Qn0o+5oJv3DGHnMNQy645el69DroAC8N6/1D8
   UMSg2GyNqIwoGZQqfZUkVRgkqdYjsi0psWMsNki7eQGEx/yMTCQxIxQdT
   w==;
X-CSE-ConnectionGUID: ezsG2cmYRheslD1UxRfsrg==
X-CSE-MsgGUID: /LUbZoqyTXiOF88ZFt7zYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101159294"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101159294"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:47:30 -0700
X-CSE-ConnectionGUID: Lwqdy2QzSeWmmdAmXlHJLw==
X-CSE-MsgGUID: AN6mNyizSjSesEKkz2IQ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1069969"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:47:29 -0700
Date: Tue, 15 Sep 2026 09:47:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is
 not initialized
Message-ID: <aqjp_4t-IbmQ0y2U@ashevche-desk.local>
References: <CAPFe3MkfeFTBaDj+yu=C0h=g00mdcbAUYgtGNfMzcshHJygkJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPFe3MkfeFTBaDj+yu=C0h=g00mdcbAUYgtGNfMzcshHJygkJA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

This is out of email thread copy, I answered inside the whole thread.

On Mon, Sep 14, 2026 at 06:57:22PM +0500, Maria Lisina wrote:
> I'm sorry, I didn't notice the part about commit description.
> 
> Also I don't really get it how is this dmesg message mandatory when DebugFS
> is completely disabled. It makes no sense to me. If user needs these LTR
> values for debugging purposes they should know about DebugFS. In other
> cases when DebugFS is disabled these messages shouldn't even appear as
> these LTR values stored in DebugFS don't do anything, at least if I
> remember correctly they aren't used for any purpose other than debugging
> while being exposed in DebugFS.

-- 
With Best Regards,
Andy Shevchenko


