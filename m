Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039A349CE2;
	Thu,  3 Sep 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419563; cv=none; b=EW34uHvh2yCQdOI5yLwWiGlFLnAYe4B8q4zZyDtLnxE91cGp5hhgG2VI3aTlsjI1OBz6rxg0mN9TioPjod2Q/xBd6ghL1zEDd9HIlXDNF+RnWuy86xieLMfCTXfTyG7NlgmC47txoLMqChgANe0Qwuhb6nRj4OiKKe8KtW1zp2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419563; c=relaxed/simple;
	bh=/pqAFh9onL1+A3JmPy88x4jSz/wzVpSBB7ZcHKNINDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnqgF5tGVjdnvSERkvle55fjrYe5QDyO8wb8MaDfM63few+axelJN9HtQpaHF3F8XkkjHZOv/PZsAPuQZ/x2fK/43vv+hjRGjCaJYlWq/PoTaPugvHs+HPCa4vGCD5OInarja+QjX53bEjR2vPOCG1K4QtZp5bc1pNJgYGUi5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us6/Hmrh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us6/Hmrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788419560; x=1819955560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pqAFh9onL1+A3JmPy88x4jSz/wzVpSBB7ZcHKNINDw=;
  b=Us6/Hmrhc671lpHDFQd1guVfjoWPBzA0EBTzevUWvR6Nyu4EuoRPso3S
   4ZOBcYWtd4G7NGzcpxTucLxFjIMekiSumEAYxf0QesTtZsO8ZTZexgCHI
   C9/r7SxxqRYubYYKh2Fusu6qoyLikjlPu2jaTGrx3I+5V4JQkCNvBRFJf
   Go62KSwR5v2bYb043cYgNMd+QLZBAizNDvfLqF03r9xW7Orv3DLtRt24g
   tMZUSJkemi/12bHeNxQtAOqsjT9mGZw50dCxEJZ9z/VuZIu/dvAu7eYWV
   v4+3npchUWzGFXqWYlQlGe5bte8UepOeqldN7OCUX98ihS9Vs592yd6VR
   w==;
X-CSE-ConnectionGUID: hi+EBgp1Q2Ogk2LcO7yjmw==
X-CSE-MsgGUID: dffGO5EtRCSYVxMR1vS6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88766819"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88766819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:12:38 -0700
X-CSE-ConnectionGUID: WalDt28NTyympGDs1lUgnQ==
X-CSE-MsgGUID: EELWTpHHTP6erMgdrSz0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268303949"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:12:34 -0700
Date: Thu, 3 Sep 2026 10:12:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 15/16] media: atomisp: allow raw Bayer capture
Message-ID: <apkd4NkKNXFX-aGy@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <5a163a69a3cb3b139f2c7ba5eee5b32bac575d27.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a163a69a3cb3b139f2c7ba5eee5b32bac575d27.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:44PM +0200, Maurizio Casciano wrote:
> AtomISP currently rejects all raw formats and silently substitutes
> YUV420. This prevents userspace camera processing stacks from obtaining
> unprocessed sensor frames.
> 
> Enumerate only the raw format matching the sensor media-bus code and
> reconcile raw requests with the code selected by the sensor. Userspace
> opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.
> 
> Raw formats expose the full sensor transport frame so ISP2401 can use
> its copy pipeline. Processed formats retain the existing global padding
> behavior; selecting a smaller receiver crop remains a userspace pipeline
> decision.

...

> +	const struct atomisp_format_bridge *format;
>  	struct v4l2_subdev_state *act_sd_state;

> +	struct v4l2_area padding = {
> +		.width = pad_w,
> +		.height = pad_h,
> +	};

Hmm... We use them only once. See below.

>  	int ret;

...

> +	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
> +		padding = (struct v4l2_area) { };

>  	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> -	fsize->discrete.width = fse.max_width - pad_w;
> -	fsize->discrete.height = fse.max_height - pad_h;
> +	fsize->discrete.width = fse.max_width - padding.width;
> +	fsize->discrete.height = fse.max_height - padding.height;

padding is not used as a stuct here, so instead you can simply convert the
above to if-else

	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
		fsize->discrete.width = fse.max_width;
		fsize->discrete.height = fse.max_height;
	} else {
		fsize->discrete.width = fse.max_width - pad_w;
		fsize->discrete.height = fse.max_height - pad_h;
	}

-- 
With Best Regards,
Andy Shevchenko


