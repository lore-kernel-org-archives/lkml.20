Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213A39CD18;
	Mon, 31 Aug 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173063; cv=none; b=AW+w1U/WfYRkZw08rDPsdY8hPlKvXIRrv68dKLtJz2ow16bMmHziV9EzMcblPYAAHE9gKKEWHvb1VSlWn2yIw25s+rzfCFXp8PApeuvMPZrFFj84KpdoTMlpCvQfaZo7bdspVax3IN3xICaoVvw4wgSjhY1d5Dfg25s9wHXKMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173063; c=relaxed/simple;
	bh=Y1F5dbjdfte0Q9rjiepAAJ9fRyvAt+kZxrnQn9fZtL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFw+4UEN/zorexJu4lba67PdvcIhIffZfr2jHarPyi50+InxOc7YOSlvxEWi0vYtpVoCj2vTolBpl8anHN9Bnw0OEuRPXXvGaVaPpRimAllVbdzGIjEoGZ1tFgWnXQ6BsyuNBMzPgQY4JnCWkMBPqVzU9UVhNVUijzV2AZvhJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG3GtoQX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG3GtoQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788173062; x=1819709062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Y1F5dbjdfte0Q9rjiepAAJ9fRyvAt+kZxrnQn9fZtL0=;
  b=nG3GtoQXKud0VSHBwGTWGGh+e81dzpxNVdr4FS5IS8YhMohjiJ8REoys
   0Q82PNfu9QAw26LL/evl/skyu6b6F5pgSNpV8MJ0N6gvGMSfXrMKVRKrL
   JHTLpJ1X2idclsoi7IptqOmDpTf9SYd6A5zv1RJKcb513rWo6Ss2JJvm+
   MFPtfq6V1bbdM2hcwkdf8c5PpFwcbX50caXsuwX+LTGAs/Nh0fON0Yuio
   2mrsPe4DQWTG34MeC56TMg+O56qm3XIr2WE7McnG+eJ+xSofxUR4jiGGk
   Kdf6VPii+kQzwGv+ngfcdWA1ayfngQ8E/Frn8CrCFqhOdTm0Jlmo/oORa
   w==;
X-CSE-ConnectionGUID: GCZ+6accR7SV+WHZSLTeDg==
X-CSE-MsgGUID: EbFbse/tQ/yEtTvC4ckQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87712588"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="87712588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:44:21 -0700
X-CSE-ConnectionGUID: oCgYAhwUTpSosmKo/3Q6UA==
X-CSE-MsgGUID: 4K0S2USlTOeDM89t6S2euw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="298679250"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2026 03:44:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F29A699; Mon, 31 Aug 2026 12:44:16 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:44:16 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amber.kao@ite.com.tw
Cc: jeson.yang@ite.com.tw, Yaode.Fang@ite.com.tw,
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bling.Chiang@ite.com.tw, Eric.Su@ite.com.tw, doreen.lin@ite.com.tw
Subject: Re: [PATCH v7 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Message-ID: <apVbAAlKuUBwWd8K@black.igk.intel.com>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
 <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>
 <anw73Ps2KgcwP4iZ@black.igk.intel.com>
 <cfa598562b904c0e84f8527e481c5579@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfa598562b904c0e84f8527e481c5579@ite.com.tw>

Hi Amber,

On Thu, Aug 27, 2026 at 08:52:12AM +0000, amber.kao@ite.com.tw wrote:
> Hi Heikki,
> 
> Thank you for the review! Also, noted on your comment regarding the changelog
> in the cover letter—I will make sure to reply to questions in the original
> threads for future submissions.
> 
> I have a quick question about my next steps. I am planning to add a new
> feature that builds on top of this current series. Since I really don't want
> to delay or affect the progress of merging this v7 patch, would you recommend
> that I wait until this series is fully merged into the tree before submitting
> the new feature, or is it okay to send it out now as a separate series?

No top-posting on the ml.

It should be okay to make a note about the dependency on previously sent patches
that the maintainer has not yet picked in the cover-letter.

Thanks,

> Thanks,
> Amber

-- 
heikki
