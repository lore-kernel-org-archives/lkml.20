Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A95175A9D;
	Fri,  4 Sep 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512542; cv=none; b=pji3vjobyrw5H6q4HLH0q7L42pSsVyXWG6SoIGNF3sycDvJt20gMd7pfHzkFZ2nuX2iRCeJWg0PT0cTNxGUgcILZvIqrjkaEJFVf9W+vDfimaBJY/ZQSsDmRdboNi890wodz22EG4ZE92ebEjuUlymHL1dRzsaM3HpciqIo4Mco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512542; c=relaxed/simple;
	bh=IV++6afvEO2LNcg8BLPPVEuNg2hZ7h7kcE9Cy1YGeLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJwMdUB/s3NhgHDnNCHrRJMwyLEofvaoNo9jXGSwpgLsfg2T3nNpDJcrQZSDqum9OJVOmKnCyxA6gdW95jG3koc3TLXhqGegY0+0lsR6OhODr/KF+8sAa0c0p5D5col2Tj3z8SE6ZRmKBLFFU47rsTKUlMQdBpNb8cKmB0MsqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWoekHaa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWoekHaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788512541; x=1820048541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IV++6afvEO2LNcg8BLPPVEuNg2hZ7h7kcE9Cy1YGeLM=;
  b=ZWoekHaaVfJFVFsoZbzkXDicH4qDArORhNKWwzEQDLRgxq47U5tH46jR
   pyw35BMq7OpvOAmbWXtpJFGaGqFTLyEzEuBY9A5pQ0M0aH5a4K76qz9uU
   6J+/ngFWMiCnSE1nL+69HJdGBMMfzZEm1NQAjkjsv8p5jcqernTG+1NvQ
   2o2P2YxvQoVU1qBP/9PtGkVb203KJZIUIcGr3veslFI1fi7AEqhVEhxye
   Q6N5cqscvXDP85EgOAaFFQDPgsrXO83UPFVzr5R2gXYqoRx+PWycsKWLM
   iRxCB8JjkNi77wZ0sIoqa53YJI1pmnfkuOJwya7MDIxnhdKqRJRePU53m
   Q==;
X-CSE-ConnectionGUID: Ccui8Sh9T3CvZK4Iysbosw==
X-CSE-MsgGUID: /5to5oLFSLSZPXpJiOU9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89044046"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89044046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:02:20 -0700
X-CSE-ConnectionGUID: bZ6lxZw/QlOCwZno2oBQJg==
X-CSE-MsgGUID: 0f3e+A5CR9iRUtzKeS8oYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="265646307"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:02:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8D49511F894;
	Fri, 04 Sep 2026 12:02:14 +0300 (EEST)
Date: Fri, 4 Sep 2026 12:02:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: mchehab@kernel.org, mripard@kernel.org, jai.luthra@linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	r-donadkar@ti.com, devarsht@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
Message-ID: <apqJFrQuFToH9B1k@kekkonen.localdomain>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
 <b8ec52eb-2bbd-4e8f-92c3-39625b6f4ee9@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8ec52eb-2bbd-4e8f-92c3-39625b6f4ee9@ti.com>

Hi Yemike,

On Thu, Sep 03, 2026 at 04:53:52PM +0530, Yemike Abhilash Chandra wrote:
> Hi Sakari,
> 
> On 25/06/26 20:47, Yemike Abhilash Chandra wrote:
> > Hi,
> > 
> > This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> > and cdns-csi2rx.
> > 
> > Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
> > Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
> > Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12
> > 
> > Jai Luthra (2):
> >    media: ti: j721e-csi2rx: Support RAW12 bayer formats
> >    media: cadence: csi2rx: Support RAW12 bayer formats
> > 
> 
> May I know if this series is in line to be picked up in this cycle?

Thanks for the ping. It's in my tree now and I'll merge it shortly.

-- 
Sakari Ailus
