Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F29EECB;
	Tue,  1 Sep 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262171; cv=none; b=jS7chrSAUrvdDlxl82nixprd/KbGrcWKSVxjiPmNStAcDrRACiFdi078rKOSfwEYwrVVlFLLjTd+jVnfBw51Im+1kMH6z5hhuvse5BUH74z5q9hoVtmBfuuaOWLPcRJLErXBgkZVSUhluRGPjSBv01MN9fjqQNwoPMkRIOk4GQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262171; c=relaxed/simple;
	bh=M6LizgAc2dy0W49WcBIpxkeO2zddGYvyw1EHz8iJJjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDpsdwKR9wWQYzlMPj3a1e2lbECEvoOT/HJx1YfqbKOJnITd17bL/0B2/H+b2a72kK7aRKBLpWL37aDf6yIhsk9dzupyna7Xxqwafo49nIQ6uU9p8dDpasuU/pGoTCnNRSzR3rLQe3RDnwO1asPPF7GLGow/Wdsptgmf8k8Q6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYeMCNms; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYeMCNms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788262169; x=1819798169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M6LizgAc2dy0W49WcBIpxkeO2zddGYvyw1EHz8iJJjs=;
  b=kYeMCNms2mJbl2Dd1of1qf3iwC7G58jfs53ZBSrRgCoz8rtjECG/DvlR
   JCrEVZKZPHkecieA+kh7cvZj1m2UbB0AcVG5kS+OOXVJU4mVMDWpjSOQ6
   iCkj/ZGxxcsFQ8nU+5x7XZmS/XXQh1ojbvzvpJOnsX7+a7SSAr9wpaGuN
   Ggxl+jMtVtLK7mbWxyZFkniXHf+2ualULnC6JlVfQeqfxuOZvj7sPuxfX
   bcec7PUz5o+FF5tqmoBj18j8vaDjoVlZikrPYI1NJJWgta6TtO6vdIk8a
   MjffLDaX4ZayOvStkNf+hiybxITOAmJFWpW9OsgHJIFvB18BjXsMUhq03
   Q==;
X-CSE-ConnectionGUID: 3zZvWnifS+eC+wRyxCzPbw==
X-CSE-MsgGUID: GCQHZ8C/QtqB2PPmQpSdBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88894797"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88894797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:29:29 -0700
X-CSE-ConnectionGUID: 07s6QnySRLKDlUdqNN/9+A==
X-CSE-MsgGUID: DfNkzGuiS3SUtrxhtcGONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="298960059"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:29:25 -0700
Date: Tue, 1 Sep 2026 14:29:22 +0300
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
Subject: Re: [PATCH v5 01/16] media: ov8858: Extract digital gain programming
Message-ID: <apa3EgKdnBfKXV1m@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
 <20260831180101.3109854-2-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831180101.3109854-2-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 08:00:46PM +0200, Maurizio Casciano wrote:
> Move the existing packed digital-gain register programming into a
> helper so clock-specific gain handling can be added separately.
> 
> This is a pure refactoring: preserve both the register packing and the
> explanatory comment without changing the bytes written to the sensor.

Consider adding a change to fix the comment.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


