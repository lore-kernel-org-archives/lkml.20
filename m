Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4664483A5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596092; cv=none; b=Y1lmjw7OXeQfLNza/ajq9cTGOGueEADBy/1hThuZbDu3rr4OzhBAcgJkO+iakv6fQnANg8gzgldCFwA44CfxBuxxR2mpT6XMBM9KhjN7ZmDLmGpGkNSaQ8foImtj4H5r1owj1/06ACdbqx2BkxrraD6Jg6BcbpVv7c591BOclQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596092; c=relaxed/simple;
	bh=GJB1iALFTju6ZzcVw9jL9MdJZx9E/1r7gPHYzDzsVrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSKf2R+HBSI3Atm3wDgpDQ2Tl2IiLkei2suCSiPqwcDZ6inYG0sdobS/vsnE99z8oiEDdYCRYtMcOTOIqcDiMrWx8WxYQkD/yGkfNrgnWWe4DN7+SYnsvhGNmkx6viA3YxPwAbjH9et1wNdZKl/cA9tQ9fmypInpg8/9UAzof/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8G5hgvZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8G5hgvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788596084; x=1820132084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJB1iALFTju6ZzcVw9jL9MdJZx9E/1r7gPHYzDzsVrA=;
  b=U8G5hgvZlY9PZcnu8GgdCti23/qH0guOVjZ9MINHlyb6TLM2eNn/KehA
   bHRxpjL7lfkAZw/Q7GMKwHF8IDGa+zJ0daB9jITpA3JEbP24zckAUirZi
   jMPJwO9jfoF7mBt6NzHxNfBOl+IiNIS1wXwEmbWeLndJNQeD5Q+i+M+st
   r5B/9oxNPAxWKJFzNO3hEglJsvxEyyhfacNpabNjlJauegVLDJLunlKV1
   Ra0bCgbjvHvT9jZYnW31aeXx5yxNm6Ce7CE/w5H1qy5mxa+AA6+LJSXvo
   FE3RM3e/ho9mPqYzUQ29rXk71elxNTcA3p7xEMXWa2S1nCxzuCZJevA4S
   A==;
X-CSE-ConnectionGUID: o6npwpeMSpWmXAjXwV2EBA==
X-CSE-MsgGUID: mXPcPIB5SJOhFJB+2mJ2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106455509"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="106455509"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:14:39 -0700
X-CSE-ConnectionGUID: thflpFa2TL+RcZqn0PveGA==
X-CSE-MsgGUID: 15nMZDf4RpqkvCAq1iWi4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268521592"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:14:37 -0700
Date: Sat, 5 Sep 2026 11:14:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/4] phy: core: Add common helper for get phy phandle
 by index
Message-ID: <apvPatGMg1NgSIAZ@ashevche-desk.local>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 04:37:06PM +0800, Inochi Amaoto wrote:
> Several phy helper use index to get phy phandle of a device node,

"Several" is used when you start with 3+. I see only a couple of.

> add a common function for the future reuse.

Code wise makes sense.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


