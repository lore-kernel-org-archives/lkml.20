Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF53D9667;
	Fri, 28 Aug 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917351; cv=none; b=EjWRE1Bc64MQYwipUoqXwcnok9VTlrg4BvLnVMUMJ6G3qw/ti5qtYFec9zAZd5rRBOwoFuF7ocDNlm0/w855DCxpTpCMlaXpZgNjV4iVqQ2Q1/6up6KkCUFv/YNuRSmybd1/z2++qXwDaykMvQqgY1gQTL5V5/pLsuygIEq9Qv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917351; c=relaxed/simple;
	bh=ja7O0mQwoEuHr768rF5TMiyVtEhMME8ChiVPzQjMnfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjoBtadV5cCAnH7D2S8eVxiR1Y1OuxfExMxqeMzw4jRXbLrD4nFpWdSvMgS0Agx5AYgrYc4LA1HYYcxLCfdEnC4nGK+D+F9UYi7Q4SGwWorPSS6WW8VHAm9bjqjf68kAuW8PbDhRGa3Cz2i0yUvdoEXBxHGyOL5lETnVPFw/UIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8adJoAw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8adJoAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787917334; x=1819453334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ja7O0mQwoEuHr768rF5TMiyVtEhMME8ChiVPzQjMnfo=;
  b=D8adJoAwN/LWjX81Wclt5xXVei+GLEGE4D1PVZEXvzQ7vhIaEhXv2uxn
   V7lBjNnzE0OyawgPy01Bbh7g/5Dr44UABGmTzeMO43jYPa0YovTTYZ8u9
   lAsCwkSuUfwUhQelS+T0SIolZUZQAWjE762k49QA5BUU2+Me+aXZUjbeX
   PD+vTb+kwe1OJGWljWFzkS52bQexCsue1bjPFNrz0Ad5BLpvyGtB+XOQB
   oytSkr8qMnq682o5rZVmtTskiapRbdNczcOMRlNHU9LfCI+0oPxMmKrfm
   asX7mIromGUcFwLKP0Ot0JIEoPlxsgF+KryB05xJkdjk/P5YXws1BdjzG
   g==;
X-CSE-ConnectionGUID: 63YKy5c5RAygJsngvHGg/Q==
X-CSE-MsgGUID: LGGo/XhiS4eIDXhMbQPq2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92290156"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="92290156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:42:09 -0700
X-CSE-ConnectionGUID: JiR8BiJvQNmRDgw+GodlEw==
X-CSE-MsgGUID: wGOg7rqjQcic5Xqth5uO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="306341783"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:42:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 159F311F817;
	Fri, 28 Aug 2026 14:42:01 +0300 (EEST)
Date: Fri, 28 Aug 2026 14:42:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] media: atomisp: support the Yoga Book OV2740
 link
Message-ID: <apF0Cds9fnqQ7XRg@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-9-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-9-mauriziocasciano7@gmail.com>

Hi Maurizio,

On Thu, Aug 27, 2026 at 08:17:53PM +0200, Maurizio Casciano wrote:
> @@ -77,6 +80,9 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
>  static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
>  	/* The vendor driver and sensor modes use two CSI data lanes. */
>  	{ "OVTI2740:00", "CsiLanes", "2" },
> +	/* Crop the vendor mode's 1932x1092 transport frame to 1920x1080. */
> +	{ "OVTI2740:00", "CsiPaddingWidth", "12" },
> +	{ "OVTI2740:00", "CsiPaddingHeight", "12" },

The cropping should be configured from the user space on the CSI-2 receiver
using VIDIOC_SUBDEV_S_SELECTION instead.

-- 
Regards,

Sakari Ailus
