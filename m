Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793457518;
	b=xQ+Bmf+69qKPEUsbriKDXrblsCfHpoT96h3s9wxvkMW9gVdTJI468oqhrSRvk8htSo6/
	 tyZrP0/NUZTYbIk8Cb98fkGCiItuZzZKGjAPmW32e6MTGOqP75/Ytjl4K8+/covXDPrJl
	 gaykuuNHA6q8PR6q+Q2FCMOr7ctrCcs3a8OqQ2w0qJO55QWUxYdIofhvBt2BK/NYgLajk
	 0fstwpY61ffA7T9K7quP7tQJMqDkh87nRScDkaeSgYHM80ruRT9xbxLyPXf5zK2hoydBb
	 WbM2jtmf+X6papVms++vgOlQW3QQlRU3F1Y31PvV07FzzU5ur26bswrLWrgDjPLmPZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457518;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=bnsrfRvGRM2qgoxDq8KtlUhs37rsslMeY4OUYqDf+Pc=;
	b=b+uDzkg4zofOXTLqyhIEEo1SMbqGVwgW0f9f3VcNh5Sq2sEUQSx5jLvLf+nhDDLpJ/Bp
	 ZP9AoBdDH1RGS1ojQYVTbFLLtvpOhQdUrCSPoKDzpQac1RGL8yKiiId1dQPR84nywhXZ/
	 yGhRqtaz3xbB69qARi66/DOHrwOfSw4TmzOsdnbIen7mSrzzTcEGR67gA4zUWIE9cEv7G
	 icame+7TedYAJUgsin9pMjF+P961hwiKndO8QCWaU76xuX73akTF7tJp1fLx29qVIuN/G
	 Fw4dm64qYDspRYPI27LJjb5HOLySghJQmD12dcB6lGNiL9wkqQRPe5LDaUEqyw0i7Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IXWrpn6W;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14207606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14207606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IXWrpn6W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793457516; x=1824993516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mOGtJbZAYHQiSqbGrp4D+HVhIDhcTQHgl9gip1W8AZU=;
  b=IXWrpn6W7vNkZUoDlbZc0O27qEc1ZdVgbafvBcP5vapVWbRy912/RwRZ
   i8omSBIIdiGs+Y38J6g2SvGSGqG6hqfbKfLA5QgWHbA66ihLzLlbQhqtO
   7tw4ciPhKbmqa8XAZmcNiHnxe28Lh3lXwMRqX8T5F+oTULYPHrFQEvFZB
   7ySr/wvGeBXb5+s/uuZ6iJ4UvviVmu/vvFeqaYKTZQ6Idb3LtrhY0Bhvm
   cbzTKqM07xgVXMLrbmoMJYj8UIy3G4frVws/pQbcC+X/uva8vruRzoub5
   zNtShOKHr3j1BTlDKPpDRuXii/B9pgRGnmWRyFhLGmGmAyQhNPQP7wOQb
   w==;
X-CSE-ConnectionGUID: 206mPwtoQWGUS01VtflenQ==
X-CSE-MsgGUID: ej12oNmiRkyQDGcAl62iKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2308898"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2308898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 07:38:35 -0700
X-CSE-ConnectionGUID: EO4jmSpvTPKIPl3mo+BHxw==
X-CSE-MsgGUID: VGkjYBofTQioetwaJ3ILPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5759414"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 07:38:30 -0700
Date: Sat, 31 Oct 2026 16:38:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Message-ID: <auX9Yz0txOxbFSSf@ashevche-desk.local>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 03:02:41PM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

...

>  drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>  drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---

> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -245,7 +245,7 @@ static const struct resource tmu_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(BXTWC_TMU_IRQ, "TMU"),
>  };
>  
> -static struct mfd_cell bxt_wc_dev[] = {
> +static const struct mfd_cell bxt_wc_dev[] = {
>  	{
>  		.name = "bxt_wcove_thermal",
>  		.num_resources = ARRAY_SIZE(thermal_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> index 6daf33e07ea0..8412a25d37ff 100644
> --- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> +++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> @@ -53,7 +53,7 @@ static const struct resource battery_resources[] = {
>  	DEFINE_RES_IRQ(CHTDC_TI_CCEOCAL),
>  };
>  
> -static struct mfd_cell chtdc_ti_dev[] = {
> +static const struct mfd_cell chtdc_ti_dev[] = {
>  	{
>  		.name = "chtdc_ti_pwrbtn",
>  		.num_resources = ARRAY_SIZE(power_button_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index aa71a7d83fcd..f27985a58c87 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -50,7 +50,7 @@ static const struct resource cht_wc_ext_charger_resources[] = {
>  	DEFINE_RES_IRQ(CHT_WC_EXT_CHGR_IRQ),
>  };
>  
> -static struct mfd_cell cht_wc_dev[] = {
> +static const struct mfd_cell cht_wc_dev[] = {
>  	{
>  		.name = "cht_wcove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(cht_wc_pwrsrc_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
> index 627a89334908..ce4c9ef59198 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -54,7 +54,7 @@ static const struct resource gpio_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(CRYSTAL_COVE_IRQ_GPIO, "GPIO"),
>  };
>  
> -static struct mfd_cell crystal_cove_byt_dev[] = {
> +static const struct mfd_cell crystal_cove_byt_dev[] = {
>  	{
>  		.name = "crystal_cove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(pwrsrc_resources),
> @@ -93,7 +93,7 @@ static struct mfd_cell crystal_cove_byt_dev[] = {
>  	},
>  };
>  
> -static struct mfd_cell crystal_cove_cht_dev[] = {
> +static const struct mfd_cell crystal_cove_cht_dev[] = {
>  	{
>  		.name = "crystal_cove_gpio",
>  		.num_resources = ARRAY_SIZE(gpio_resources),
> @@ -142,7 +142,7 @@ static struct pwm_lookup crc_pwm_lookup[] = {
>  
>  struct crystal_cove_config {
>  	unsigned long irq_flags;
> -	struct mfd_cell *cell_dev;
> +	const struct mfd_cell *cell_dev;
>  	int n_cell_devs;
>  	const struct regmap_config *regmap_config;
>  	const struct regmap_irq_chip *irq_chip;

I haven't compiled, but I checked the code in the actual drivers and my reading
confirms that these structures may need to be marked with const qualifier.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com> # Intel SoC PMIC drivers

-- 
With Best Regards,
Andy Shevchenko


