Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF63DAAA6;
	Fri, 28 Aug 2026 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916116; cv=none; b=Vvjks1ujp9ZVuVrqIkENUVi+9YzbhVIx1jYZ0Tg/FxRl1C54wa73fZiyJfKwwuPvrEwkQBpo0278ROHs2mlLqex27x65eSm50+ZRDBu48IJCv7lrzDGsmwGclUmsGAJ1+ohJtpC49/ULiR7mVccclWL/MDTH0wKpZoG8PHyEDp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916116; c=relaxed/simple;
	bh=ojxZ4JxzS+y/NAJgIpUsWhVQLMdvHkEhDdRP+wb47B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vApbJi1W+Bk0HDS/Qw+dEAZkkZ+HxukRtMhVwOkwxK5uAar2mE/zV+h/WQ1yoKxHCv+psZ2j+BYMnhfiEIzvTHo1IPbxjWKJp5DtQc7BgFxcPOB8WWi9wmfy3P0f3XcxU5hf9PrN2UfHIKZjEH6dWkzPNIa7mmIcdxF4Dgv6gjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDQ28f+A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDQ28f+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787916114; x=1819452114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ojxZ4JxzS+y/NAJgIpUsWhVQLMdvHkEhDdRP+wb47B0=;
  b=iDQ28f+ALbCY8sDsI8mYFK1ibwMPIE8rpvTw+1gyIK753FPPuwzp8ms2
   4dpesn4+eH45Hek0gHLitEs8TWVTi5larSBBwzdfYnkIxcKrpQvbFOpLu
   BZpXrYwfatleukPiNpMID3a3BxrJqterXlekw6qDAxfXbLCcCSNlW8YZl
   Rzk60q48i/K6poYVdFfUQxArojwkW3Foa+G1+kZanV8MT+jdl9Hr9Huen
   7Zrls0Wfi+TpwUjd/6SQ6xhQMHwv7/foAv3JQWzJqA/IHbEuJRP3/+czt
   k95D48elCSxU9vQlj3McR6TkccUEjeY7PTtiQKz/Jvdbhpk5h8dWmDvcJ
   g==;
X-CSE-ConnectionGUID: IpveE2l+T5ifHwhJMfqEQg==
X-CSE-MsgGUID: 94LHOBmPQ/+wlPFxuyyVtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90934179"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="90934179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:21:54 -0700
X-CSE-ConnectionGUID: 0VljlqAbQSO8+TOsIO7v9w==
X-CSE-MsgGUID: vmK+4ooZSGaVAUg8IghtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="292938580"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:21:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2370B11F817;
	Fri, 28 Aug 2026 14:21:46 +0300 (EEST)
Date: Fri, 28 Aug 2026 14:21:46 +0300
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
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
Message-ID: <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-6-mauriziocasciano7@gmail.com>

Hi Maurizio,

On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:
> Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
> sensor. Add an ACPI match table for that ID.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index b8c2f0d25505..b0ffc366a4e4 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/device-id/acpi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> @@ -2077,6 +2078,12 @@ static void ov8858_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(&client->dev);
>  }
>  
> +static const struct acpi_device_id ov8858_acpi_match[] = {
> +	{ .id = "INT3477" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
> +
>  static const struct of_device_id ov8858_of_match[] = {
>  	{ .compatible = "ovti,ov8858" },
>  	{ /* sentinel */ },
> @@ -2087,6 +2094,7 @@ static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
> +		.acpi_match_table = ov8858_acpi_match,

Please use ACPI_PTR() for this one. (Also see
<URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t>;
this won't produce a compiler warning then.)

>  		.of_match_table = ov8858_of_match,
>  	},
>  	.probe		= ov8858_probe,

-- 
Regards,

Sakari Ailus
