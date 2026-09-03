Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5B3FC5B5;
	Thu,  3 Sep 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419095; cv=none; b=hsV94LP6u/kW4jBoVqbEGYvIeQFFUX8CJ3bfVmKXMH8CpdT20FszYXLXbSgvDWnWpqJNOuvW9eyLJSHr2JW1jhnOfao0Q4qxqjRSOHi3A777fu0fmGovabUh3ZAoysvRnqd0Wnsxn4xl7MauQcQuEnc1rzdS4AI/tnWqdih1jqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419095; c=relaxed/simple;
	bh=dPGrX4qbef5oASHmR4dp8xgjWLHRidgZ/oEYyoh8mEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPk5oR1hb7beFbz4i5cuhgvxeqOpKwYoDohjPZ+YyN8w7B2vg44JVsRYWGmdijyuIym4Gm9qD/bomodUtLW0mlhemBCs8nK6EEnX9JaQsjjUkc9ohi6Luh97tyIUr3eatqECQ21229vhz8dew9B+umYTDB2Q+7CPwOMU3xctpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/1NU/Cz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/1NU/Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788419093; x=1819955093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dPGrX4qbef5oASHmR4dp8xgjWLHRidgZ/oEYyoh8mEQ=;
  b=L/1NU/CzBJkN9y27AZfIcx8KnT4UMi6X/eSDWkiqC48/Q3RQVRLUSgPz
   p7jsT/mHtZqrA+3zJLgf7GuVnVRw4kVZk7rJscmit1/ihAROH7NZkAlGg
   dG/7Yknr/KhqwL8yQhFu7Kj9sHrHfjCHgkYtnMxk0JgUYVFx6bk8Ya6IJ
   WBy1w7Tv56W3VbC16fqmJ+LO2SX4E+swpF1uccpl9fY1tUIdGyYcWEfca
   FqpHaqhQ7WtDwk5+f8w4/7GHwOzFE7cxsNeM5xIeXRcGX2KRedsdBziyE
   qKKyeG1M2JylSpVCDhKBXP/lBDu4TIyCDIJvdmhFQ9BeFBJ9JPdgg+/IU
   A==;
X-CSE-ConnectionGUID: 6ST6hooPSWydJ32yFpPICA==
X-CSE-MsgGUID: A3sHHNbmQcWMSD129SI/5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88766282"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88766282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:04:53 -0700
X-CSE-ConnectionGUID: LfHKUmutQQWj7jnqvwgt9A==
X-CSE-MsgGUID: JWdUSYbjQ5OvmyrQIBggXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273792931"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:04:50 -0700
Date: Thu, 3 Sep 2026 10:04:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/16] media: atomisp: Use struct v4l2_area for padding
Message-ID: <apkcDjdlpyVFxfnT@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <a27087cb5fcc03bff4b3aac2b8d271b98049ddb9.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a27087cb5fcc03bff4b3aac2b8d271b98049ddb9.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:43PM +0200, Maurizio Casciano wrote:
> The padding helper passes width and height as four separate scalar
> arguments even though they form two logical dimensions.
> 
> Pass the requested size and returned padding as struct v4l2_area values.
> This makes the dimensions explicit and simplifies all three callers.

See v6 review comments and add my tag.

...

> +static inline void

Since it's not in the header, we can drop 'inline', so it becomes

> +atomisp_get_pix_padding(struct atomisp_device *isp,
> +			struct v4l2_pix_format *f,
> +			struct v4l2_area *pad)

static void atomisp_get_pix_padding(struct atomisp_device *isp,
				    struct v4l2_pix_format *f,
				    struct v4l2_area *pad)

> +{
> +	struct v4l2_area size = { .width = f->width, .height = f->height };
> +
> +	atomisp_get_padding(isp, size, pad);
>  }

-- 
With Best Regards,
Andy Shevchenko


