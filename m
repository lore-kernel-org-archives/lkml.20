Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40443935B;
	Thu, 27 Aug 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824732; cv=none; b=pnIeKFBOxaFEoBWURr91WUJ4GOOCAL8SuqDUtpxNbgD9H2ku/mnQmPJjNqOGAUIh8MJMTySunon5w+R0pZlxhoVw1rcbn3ExlX/UMrzXhfiMBGGKKlxHARMpJS1Ras8Uqli68H8wq4RT0KPkOaJ4tZxfeL7JokGbz0wggytF8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824732; c=relaxed/simple;
	bh=UqoKhV7yztLaz/tXSq6KyFocjM8Bhj2wmABbotIXxrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXbgUeWGNNGJzOi/VcQhPx84prtKWv5Tnsxbi/9+9CiiJF7tBwd3BTypEpM+06hGvUGic9mjH6JJckJqkrVM2WvVgcBGXznbOl+84ivXZVswwlDb01wYuM/doF94WHi/vSIGEIQSaQFdoHSBwelet8Uyk3QViPVbw6r5OeIbJ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5eXv5hb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5eXv5hb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787824725; x=1819360725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UqoKhV7yztLaz/tXSq6KyFocjM8Bhj2wmABbotIXxrc=;
  b=K5eXv5hbqZJRr9MmnK02eyefO84NCQsrdSgoxrenbG5fT31A5yCH5ppQ
   nKx2FAvsfQ9lALK4wF6LMoca0mWAlqBp5f7osLHMa2rrhxFhK40vGqMHK
   /z1ivzh7IjNF2JI+z1omri7CZ1DzatpDGd798NXy6c5YEOaG488rjX200
   il8ANyP0ZRE+XHufczMOCBnlz/w5Ngrm23zP5+HWMw4Xsbh1DPq/f1gCc
   3/SUEs8G5cu6/8Mi47UQCSVBv4qfyQjI9kEw/3HYVSWeV6+P7ctzjRNrg
   Fz5QmCbFzIIgqkmGv9SOZnTd4TwBb6FFt2GpPPlc7y4I1mdsK1kmB8diy
   g==;
X-CSE-ConnectionGUID: oucW2d+XT6m9B6fcS8kmJA==
X-CSE-MsgGUID: prohowsmQL++e+nR+Uj/4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87264546"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="87264546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:58:37 -0700
X-CSE-ConnectionGUID: YFSEcZr5RbCCcgjuwk5yug==
X-CSE-MsgGUID: SD7WMwloS5CrOxfNzrbG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="261706616"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:58:33 -0700
Date: Thu, 27 Aug 2026 12:58:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Message-ID: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:50PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
> OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
> its sensor driver, so both I2C devices remain unbound.
> 
> Add the IDs to the corresponding ACPI match tables. Sensor
> configuration and CSI lane quirks are kept in later patches.

For the record can you provide an DSDT excerpt of this device object (no need
to put into commit message, just reply here)?

...

>  static const struct acpi_device_id ov2740_acpi_ids[] = {
>  	{"INT3474"},
> +	{"OVTI2740"},
>  	{}
>  };

Add a separate patch that converts these to use C99 initialisers and follows
the proper style of the formatting (added spaces, removed unneeded blank line).

static const struct acpi_device_id ov2740_acpi_ids[] = {
	{ .id = "INT3474" },
	{ }
};
MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);

...

> +#include <linux/acpi.h>

Why?! We only use a single data structure definition which is defined in a
separate header. If this is what Uwe's rework required, I'm pretty much against.
We should not include the all-in-one acpi.h for the cases when we only use
the ID data structure.

I expect to see here linux/device-id/acpi.h.

>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>

...

> +static const struct acpi_device_id ov8858_acpi_match[] = {
> +	{ "INT3477" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);

See above about the style. Also This patch should be split on per-driver basis.

...

>  static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
> +		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),

This is wrong to have here (it will induce compiler warning). And in general —
no ACPI_PTR() in a new code.

>  		.of_match_table = ov8858_of_match,
>  	},
>  	.probe		= ov8858_probe,

-- 
With Best Regards,
Andy Shevchenko


