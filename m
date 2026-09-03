Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D330E85B;
	Thu,  3 Sep 2026 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410587; cv=none; b=Gul046IPxUQcJDlOBLKdQvIm/iACJibNamlWHwJYaWuFmjtvjxWFNE/Dhs8Q4B8i8wNrXcrzN4tCSV1PpCIN8ePFEBnQUm45zuJZqaNGtJRcMIjJqk4xLaBR7rac9KuBP+nejz9LDUIbyX8vnIfISTYorUaASZCzLVrSe3O6XZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410587; c=relaxed/simple;
	bh=z+jvyxJfLEK0ZMwqQL0JjD6zsFOFez1AwvfXz/lCzRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f904RtMjQNVLWr6kLmYavSWG5w512hhnfVOk9Vg7COeaKs1t6265YpJoXKNKhLfMGPAkNVCrcbLu33Q5TEpDkd0JPD0AhC89da9Aj7jkgPcAw8w447Y2CIgMYYTjSmloDlSerAc0cEuGmZEGe7PrFCT8hGJXdygyysZzMGbsug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjXQak5U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjXQak5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788410585; x=1819946585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+jvyxJfLEK0ZMwqQL0JjD6zsFOFez1AwvfXz/lCzRo=;
  b=HjXQak5UIB5qV9ipdrzNTl5koEJb0etnSf6DenHF3gYKqKgUHLs3FSLz
   zmWTISnEdRcuV+/1tH4he8SPyTqEcNDZEw+OI8hOVmqurtWejN7IxEYS1
   2Q9IowTFKBIwGKaG17lIiSNhcNPMpSOmoWw4jgOLEVFlTdxEKd9eoXs4o
   19nTyBoHG7xMmlnXRDgDHCNyabDLLTrZWZNktsLcUWMDDorlcce2X/6iR
   Lav6HffodI1kyuACSEbr4NhT1hoAyH3AiKu0Dgi/6kHYWQC4TdAhoFMY3
   wW79TxyWWpJ9KXQ+JAg+GupbJucC7mMp1ZQSlggNvehTHO+A9T3MJa4gw
   A==;
X-CSE-ConnectionGUID: 8rEHKE6HR+aR1vSoEG9VFw==
X-CSE-MsgGUID: 6Ne2DbKERquHlBf67M/jlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88726035"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88726035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:43:04 -0700
X-CSE-ConnectionGUID: U9BkV0KPR1KlXmUxQwj3MQ==
X-CSE-MsgGUID: oIQwbFFlTgSgNHZqs6JLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="307803268"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:43:01 -0700
Date: Thu, 3 Sep 2026 07:42:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apj60nTEM2Nc6n2c@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:31PM +0200, Maurizio Casciano wrote:
> The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
> the existing mode tables program the sensor PLL for 24 MHz. Reusing
> those settings produces incorrect internal and CSI-2 clocks.
> 
> Accept both input rates and use the actual rate for the reset delay.
> Move the 24 MHz PLL and global timing registers out of the common mode
> tables, provide revision- and lane-specific arrays, and select the
> matching clock programming explicitly when starting the stream.
> 
> Keep the existing long digital-gain control independent of the input
> clock. Expose the per-channel manual white-balance registers as separate
> red and blue balance controls, keep green at unity, and accumulate write
> errors while programming the three channels.
> 
> The manual white-balance register definitions and programming follow
> Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with three complete
> 10-bit raw Bayer frames, independent red, blue and digital gain updates
> during active streaming, and front and rear camera capture in Cheese.
> 
> Link: https://lore.kernel.org/linux-media/apf7cJOoXrl_wZfr@kekkonen.localdomain/

No such a link, I have told you already that. Slow down, please, read the
comments carefully and address them.

> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM [Codex] [Sparse]

No square brackets. In the documentation the examples are given. Also no need
to use exact name of the LLM.

-- 
With Best Regards,
Andy Shevchenko


