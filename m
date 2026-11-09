Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216239;
	b=h8msgaTRq1K0d8izeQPjoYNmvTANHvPCXo2bFx0QD2BTIDO0cN1Liiq9fL4UeAheBpx1
	 tqo45fqUqSf+tarwwhZhZSl92txxEVGizUO1jFaEUAiJNIhl1qaP5TWw3J6lXmkvxlhbS
	 vKAicBaysGAvUCfinxM3+IbBn7mAxdyga2Rd+6tATVgbwuDVR0HviBMpmwqhLDgoj12wm
	 g31qDWvGmmWZGUcJIvBeoqWtQv2Pu3/LvCiuVkO179qBE0fcdKIsRovPNmowYKMPWvXjM
	 fQNwG+5bUKfhJe0uv/HreolDbwCMgRoDs0JDl39e5KGg3jcftvMmLI1fF7sk+5oIJGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HDwAzR2IrjNAkk6aLI7CjbKBnmUzvZC8rlHJAyt8QD0=;
	b=hZttvPXtBEDmiYGScR84wcyGvVpgq6Rql/UHOi1HgxXhhUPXTsKQtLr9SRX+3zZehNTK
	 SP08oaS+yat+W29EH69MiTfMiHxukscokabBii70IwwLYBeJqMDSnq0EM4CRbcxRelOWj
	 lJvkJkOCrUw+0jdWSNRUUZy8+iRK3vWiwYbwzm4IeFLUoe+mfi9yVrJQ2+EXNCL3X+uEl
	 341H4rEvBxEHFAYyQwQnvdF8m6LND7/uDDMcW5f1zw0XHMKedRiQyMrn45r/3Tv4wh2GG
	 Rpyx4xmTO6gKkBIrWjzaQ974KWbyl5UBYIljSgRWAgoUMwiQ8vmE3msxrVpZOIvalTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfFYjeHw;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74127606A32A;
	Mon,  9 Nov 2026 09:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74127606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfFYjeHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794216239; x=1825752239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jl/wyNGwoFZHG71iF6sIRuGXlc8Flt2IukMC3n54hJ8=;
  b=lfFYjeHwhrDDlEcdtD68qcr3kIklNA+Mwrf9lm1ydsZzhPhPaXe30v5Q
   u1ar5JoQ8ZqbnPFezqpBJ+C+Of46K4ktS2B+XudiJon1L9jI6GzyKsAE8
   9k1tl0qTSYABDBwvi4Vkl8D0jU/BoQqFzyGlI6Bxg0qc3XLYzNOObVjh8
   tklPTOfgj3yE06bV26lsV9HpcfqUnEwxJvkzyqqNV2SEnKuakOtUzTEde
   VvWKZ2AWz8JiLzHDA0OpJHFP/q27I4dfWjF4O4CZo7dOsWFW3+aVPsJb5
   zfFvcjN6uHoXJvpRZUw6nxHfSZMUDSsQb2e7fN7UG3rKyaohtM4pe6+OC
   g==;
X-CSE-ConnectionGUID: rdp67H5LTo61xxFZTFGyuw==
X-CSE-MsgGUID: 3//OFI5MQm2yg/NGngZiNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2974277"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2974277"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:23:58 -0800
X-CSE-ConnectionGUID: 7zoMaFEDRKGaQeQRKa9+Sg==
X-CSE-MsgGUID: +t+NodOhTaaYH1IlNKIuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8004237"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:23:56 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 24E2C121B96;
	Mon, 09 Nov 2026 11:23:54 +0200 (EET)
Date: Mon, 9 Nov 2026 11:23:54 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: DelaySystem@tubot.lat
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH v2] media: ipu6: declare firmware files with
 MODULE_FIRMWARE
Message-ID: <avGRKmGuMCfR4WeI@kekkonen.localdomain>
References: <20261107-batch1-s1-ipu6-fw-v2-1-0e8567a1aefa@tubot.lat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-batch1-s1-ipu6-fw-v2-1-0e8567a1aefa@tubot.lat>

Hi,

On Sat, Nov 07, 2026 at 09:04:40PM -0800, DelaySystem via B4 Relay wrote:
> From: DelaySystem <DelaySystem@tubot.lat>
> 
> The driver requests one of eight firmware blobs at runtime depending on
> the detected SoC (IPU6, IPU6SE, IPU6EP, IPU6EPADLN, IPU6EPMTL, IPU7,
> IPU7P5 or IPU8), selected through isp->cpd_fw_name, but never declares
> them.  As a result modinfo shows no firmware: lines and initramfs
> generators cannot pick up the dependency automatically.
> 
> Add MODULE_FIRMWARE() for every blob the driver can request.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/all/apqB28RBDZV4BlDZ@kekkonen.localdomain/
> Signed-off-by: DelaySystem <DelaySystem@tubot.lat>

Could we have a real name here? Same for From:.

> ---
> Changes in v2:
> - Resend with corrected Cc list (v1 accidentally reached only Sakari and linux-kernel: repeated --cc flags do not accumulate in b4); no code change.
> - Adds linux-media@vger.kernel.org and Mauro Carvalho Chehab to Cc.
> - Link to v1: https://patch.msgid.link/20261107-batch1-s1-ipu6-fw-v1-1-1d5323aff7b2@tubot.lat
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index cdf812c02960..ec2a9c2bf587 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -1028,3 +1028,11 @@ MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
>  MODULE_AUTHOR("Hongju Wang");
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Intel IPU6 PCI driver");
> +MODULE_FIRMWARE(IPU6SE_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU6EP_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU6_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU6EPMTL_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU6EPADLN_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU7_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU7P5_FIRMWARE_NAME);
> +MODULE_FIRMWARE(IPU8_FIRMWARE_NAME);
> 

-- 
Regards,

Sakari Ailus
